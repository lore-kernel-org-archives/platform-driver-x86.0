Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00725C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 11:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbiD0LxV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 07:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbiD0LxT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 07:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DFA81BCE64
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651060206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=RTkyx1+3CeSm4s21T8qDoGN9PAkWBdYY93kLbnSJRzs=;
        b=M78aYDJzAzFdRVw5kPpwvRb05jOb4BMlE7ktkKz7Ez3DLII74yVQBUb9Bjb3+8MIwWni5b
        LZOH8zz3SB+TWb6vjCXPZUcQjQcDLptbX8CvGwVFC9y7OeHSpYAw1JCwtxU4yrZ7I6s00f
        B1UQLodjVYog98/FtpE6hlecq42rP78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-TY0vbL98PaS_Bfezua_NpA-1; Wed, 27 Apr 2022 07:50:03 -0400
X-MC-Unique: TY0vbL98PaS_Bfezua_NpA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAB7E185A7B2;
        Wed, 27 Apr 2022 11:50:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B067D41617D;
        Wed, 27 Apr 2022 11:50:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH] platform/x86: asus-wmi: Fix driver not binding when fan curve control probe fails
Date:   Wed, 27 Apr 2022 13:49:56 +0200
Message-Id: <20220427114956.332919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Before this commit fan_curve_check_present() was trying to not cause
the probe to fail on devices without fan curve control by testing for
known error codes returned by asus_wmi_evaluate_method_buf().

Checking for ENODATA or ENODEV, with the latter being returned by this
function when an ACPI integer with a value of ASUS_WMI_UNSUPPORTED_METHOD
is returned. But for other ACPI integer returns this function just returns
them as is, including the ASUS_WMI_DSTS_UNKNOWN_BIT value of 2.

On the Asus U36SD ASUS_WMI_DSTS_UNKNOWN_BIT gets returned, leading to:

  asus-nb-wmi: probe of asus-nb-wmi failed with error 2

Instead of playing whack a mole with error codes here, simply treat all
errors as there not being any fan curves, fixing the driver no longer
loading on the Asus U36SD laptop.

Fixes: e3d13da7f77d ("platform/x86: asus-wmi: Fix regression when probing for fan curve control")
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2079125
Cc: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2104a2621e50..20efcf82ce8d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2223,9 +2223,10 @@ static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
 
 	err = fan_curve_get_factory_default(asus, fan_dev);
 	if (err) {
-		if (err == -ENODEV || err == -ENODATA)
-			return 0;
-		return err;
+		pr_debug("fan_curve_get_factory_default(0x%08x) failed: %d\n",
+			 fan_dev, err);
+		/* Don't cause probe to fail on devices without fan-curves */
+		return 0;
 	}
 
 	*available = true;
-- 
2.36.0

