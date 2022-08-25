Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251E6C64990
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 14:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbiHYOOm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 10:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242057AbiHYOO1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 10:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEA4B6D54
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661436853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jjCw53578ZQbfvMbrpeA/25Za2+9ilXFFaivNzbyPcE=;
        b=YG4HsBHpxhLe62WF32lhip1XJzMLCt7fxhdfCNY4phXYfPc3WYp9+CiLB9/akM2LPQt7Ka
        +eHYY6nq5gvPohOVzOupbj2s5qmSP2bA9zumHMRuN5UX4cR4ub/SPSvM1TwkerF8jF36Kr
        Thb1vCc3bQpr34Yk7nt9RmIyBBeqEqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-ZvtCPZCkMCK8qihdK7FK4w-1; Thu, 25 Aug 2022 10:14:09 -0400
X-MC-Unique: ZvtCPZCkMCK8qihdK7FK4w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09A331C0566A;
        Thu, 25 Aug 2022 14:13:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A35B2492C3B;
        Thu, 25 Aug 2022 14:13:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: msi-laptop: Fix old-ec check for backlight registering
Date:   Thu, 25 Aug 2022 16:13:34 +0200
Message-Id: <20220825141336.208597-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit 2cc6c717799f ("msi-laptop: Port to new backlight interface
selection API") replaced this check:

	if (!quirks->old_ec_model || acpi_video_backlight_support())
		pr_info("Brightness ignored, ...");
	else
		do_register();

With:

	if (quirks->old_ec_model ||
	    acpi_video_get_backlight_type() == acpi_backlight_vendor)
		do_register();

But since the do_register() part was part of the else branch, the entire
condition should be inverted.  So not only the 2 statements on either
side of the || should be inverted, but the || itself should be replaced
with a &&.

In practice this has likely not been an issue because the new-ec models
(old_ec_model==false) likely all support ACPI video backlight control,
making acpi_video_get_backlight_type() return acpi_backlight_video
turning the second part of the || also false when old_ec_model == false.

Fixes: 2cc6c717799f ("msi-laptop: Port to new backlight interface selection API")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 93ef8851b93e..54170172a666 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -1047,8 +1047,7 @@ static int __init msi_init(void)
 		return -EINVAL;
 
 	/* Register backlight stuff */
-
-	if (quirks->old_ec_model ||
+	if (quirks->old_ec_model &&
 	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
-- 
2.37.2

