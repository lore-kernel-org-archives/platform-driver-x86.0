Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25BAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Sep 2021 23:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 933CD610A6
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Sep 2021 23:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhIRXRj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Sep 2021 19:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhIRXRi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Sep 2021 19:17:38 -0400
X-Greylist: delayed 965 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 18 Sep 2021 16:16:14 PDT
Received: from xilka.com (bbb.xilka.com [IPv6:2001:470:1f11:5a5:16da:e9ff:fe11:e54b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D98C061574;
        Sat, 18 Sep 2021 16:16:14 -0700 (PDT)
Received: from comer.internal ([IPv6:2001:470:1f11:5a5:2b1b:9a83:6c1c:2916])
        (authenticated bits=0)
        by xilka.com (8.16.1/8.16.1) with ESMTPSA id 18IMxvbo091468
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 18 Sep 2021 16:59:58 -0600
From:   Kelly Anderson <kelly@xilka.com>
To:     ike.pan@canonical.com, hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kelly@xilka.com
Subject: [PATCH] add platform support for Ideapad 5 Pro 16ACH6-82L5
Date:   Sat, 18 Sep 2021 16:59:51 -0600
Message-ID: <5753131.lOV4Wx5bFT@comer.internal>
Organization: Xilka
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Adding support specifically for Ideapad 5 Pro 16ACH6-82L5 by adding a
whitelist function that can validate notebooks for which dytc_version
is less than 5, and seem to work fine at dytc_version 4. This code has
been tested to work properly on the specified system.

Signed-off-by: Kelly Anderson <kelly@xilka.com>

 drivers/platform/x86/ideapad-laptop.c | 37 ++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index e7a1299e3776..92b8f7dc79f5 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -868,7 +868,28 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
 	}
 }
 
-static int ideapad_dytc_profile_init(struct ideapad_private *priv)
+static int ideapad_dytc_v4_whitelist(struct platform_device *pdev)
+{
+	const char *vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	const char *product = dmi_get_system_info(DMI_PRODUCT_NAME);
+
+	if ( product ) {
+		if ( vendor ) {
+			dev_info(&pdev->dev, "DYTC Vendor: %s\n", vendor);
+		}
+
+		dev_info(&pdev->dev, "DYTC Product: %s\n", product);
+
+		if ( ! strncmp(product, "82L5", 4) ) /* IdeaPad 5 Pro 16ACH6 */ {
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static int ideapad_dytc_profile_init(struct platform_device *pdev,
+				struct ideapad_private *priv)
 {
 	int err, dytc_version;
 	unsigned long output;
@@ -883,11 +904,21 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 
 	/* Check DYTC is enabled and supports mode setting */
 	if (!test_bit(DYTC_QUERY_ENABLE_BIT, &output))
+	{
+		dev_info(&pdev->dev, "DYTC_QUERY_ENABLE_BIT returned false\n");
 		return -ENODEV;
+	}
 
 	dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
+
 	if (dytc_version < 5)
-		return -ENODEV;
+	{
+		if ( dytc_version < 4 || ! ideapad_dytc_v4_whitelist(pdev) )
+		{
+			dev_info(&pdev->dev, "DYTC_VERSION is less than 4 or is not whitelisted: %d\n", dytc_version);
+			return -ENODEV;
+		}
+	}
 
 	priv->dytc = kzalloc(sizeof(*priv->dytc), GFP_KERNEL);
 	if (!priv->dytc)
@@ -1595,7 +1626,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	ideapad_sync_rfk_state(priv);
 	ideapad_sync_touchpad_state(priv);
 
-	err = ideapad_dytc_profile_init(priv);
+	err = ideapad_dytc_profile_init(pdev, priv);
 	if (err) {
 		if (err != -ENODEV)
 			dev_warn(&pdev->dev, "Could not set up DYTC interface: %d\n", err);
-- 
2.33.0




