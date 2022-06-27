Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB1EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 13:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbiF0NLK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 09:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbiF0NKu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 09:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A5E6F5AA
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 06:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656335334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LeCOaCANZcQr0T4HYgPIPdTWgInKgqsg3lq7mpfSPUM=;
        b=S2SsDhkUCt74Mg8iMSQyRfxsWZzvrrQj9MfZBnCpwJ309Ml5whoB2o35cir8wKDK2Kl/+6
        IR+aGrBgF53ntEhWMcvJXTArJhfgaqbRzdaO2RgdVit17weTvtCdxt8KrfM/p5xx0MAWBx
        DA1ABkFG6N09Gea9filO8kLLFtVbsrA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483--Z8Cq6lwNhGtw9YeY6GzAA-1; Mon, 27 Jun 2022 09:08:53 -0400
X-MC-Unique: -Z8Cq6lwNhGtw9YeY6GzAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9844E3C0D85A;
        Mon, 27 Jun 2022 13:08:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 82002C15D42;
        Mon, 27 Jun 2022 13:08:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform: x86: ideapad-laptop: Add Ideapad 5 15ITL05 to ideapad_dytc_v4_allow_table[]
Date:   Mon, 27 Jun 2022 15:08:50 +0200
Message-Id: <20220627130850.313537-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Ideapad 5 15ITL05 uses DYTC version 4 for platform-profile
control. This has been tested successfully with the ideapad-laptop
DYTC version 5 code; Add the Ideapad 5 15ITL05 to the
ideapad_dytc_v4_allow_table[].

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 3ccb7b71dfb1..6b472fd431d0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -871,12 +871,18 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
 static const struct dmi_system_id ideapad_dytc_v4_allow_table[] = {
 	{
 		/* Ideapad 5 Pro 16ACH6 */
-		.ident = "LENOVO 82L5",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82L5")
 		}
 	},
+	{
+		/* Ideapad 5 15ITL05 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad 5 15ITL05")
+		}
+	},
 	{}
 };
 
-- 
2.36.1

