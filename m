Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F0EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Jun 2022 12:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbiFWMAt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiFWMAh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jun 2022 08:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD93F4ECEC
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655985559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zpSbw8USYTD2/vSbBa+jRtXWvNM8lf4r151ZBD9rtTQ=;
        b=UX15hFORgiLyejLDDuUMGnaLhsf5wCRDTcj6mO2xYM6p5FB7Vq9+2mRlxa92mXOSCyQqG5
        GoXTUNPhtIFQcam5LudmjxP8WbdzAya/QIWBEk7KcfOwWeBqPoxhrm12PmXOgpRXAJgqh8
        y4lei3pfoaUEvNBmyuUIUqQeeMbUzX4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-77ijmxqPPWmORozP3APTBA-1; Thu, 23 Jun 2022 07:59:16 -0400
X-MC-Unique: 77ijmxqPPWmORozP3APTBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3784F294EDD5;
        Thu, 23 Jun 2022 11:59:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.109])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4B7F4C2810D;
        Thu, 23 Jun 2022 11:59:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform: x86: ideapad-laptop: Add allow_v4_dytc module parameter
Date:   Thu, 23 Jun 2022 13:59:14 +0200
Message-Id: <20220623115914.103001-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add an allow_v4_dytc module parameter to allow users to easily test if
DYTC version 4 platform-profiles work on their laptop.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=213297
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 3ccb7b71dfb1..71f4b59eed4b 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -152,6 +152,10 @@ static bool no_bt_rfkill;
 module_param(no_bt_rfkill, bool, 0444);
 MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
 
+static bool allow_v4_dytc;
+module_param(allow_v4_dytc, bool, 0444);
+MODULE_PARM_DESC(allow_v4_dytc, "Enable DYTC version 4 platform-profile support.");
+
 /*
  * ACPI Helpers
  */
@@ -901,13 +905,16 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 
 	dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
 
-	if (dytc_version < 5) {
-		if (dytc_version < 4 || !dmi_check_system(ideapad_dytc_v4_allow_table)) {
-			dev_info(&priv->platform_device->dev,
-				 "DYTC_VERSION is less than 4 or is not allowed: %d\n",
-				 dytc_version);
-			return -ENODEV;
-		}
+	if (dytc_version < 4) {
+		dev_info(&priv->platform_device->dev, "DYTC_VERSION < 4 is not supported\n");
+		return -ENODEV;
+	}
+
+	if (dytc_version < 5 &&
+	    !(allow_v4_dytc || dmi_check_system(ideapad_dytc_v4_allow_table))) {
+		dev_info(&priv->platform_device->dev,
+			 "DYTC_VERSION 4 support may not work. Pass ideapad_laptop.allow_v4_dytc=Y on the kernel commandline to enable\n");
+		return -ENODEV;
 	}
 
 	priv->dytc = kzalloc(sizeof(*priv->dytc), GFP_KERNEL);
-- 
2.36.0

