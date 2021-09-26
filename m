Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA88C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Sep 2021 04:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18D076112E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Sep 2021 04:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhIZElE convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Sep 2021 00:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbhIZElD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Sep 2021 00:41:03 -0400
Received: from xilka.com (bbb.xilka.com [IPv6:2001:470:1f11:5a5:16da:e9ff:fe11:e54b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CD6C061570;
        Sat, 25 Sep 2021 21:39:27 -0700 (PDT)
Received: from comer.internal ([IPv6:2001:470:1f11:5a5:9a1c:501a:37c:97b7])
        (authenticated bits=0)
        by xilka.com (8.16.1/8.16.1) with ESMTPSA id 18Q4d6lf1125606
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 25 Sep 2021 22:39:06 -0600
From:   Kelly Anderson <kelly@xilka.com>
To:     ike.pan@canonical.com, hdegoede@redhat.com, pobrn@protonmail.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        markpearson@lenovo.com, kelly@xilka.com
Subject: [PATCH v2] add platform support for Ideapad 5 Pro 16ACH6-82L5
Date:   Sat, 25 Sep 2021 22:39:00 -0600
Message-ID: <11840239.O9o76ZdvQC@comer.internal>
Organization: Xilka
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

V2 - Addressed issues brought up by Barnabás Pőcze.

Adding support specifically for Ideapad 5 Pro 16ACH6-82L5 by adding a
whitelist function that can validate notebooks for which dytc_version
is less than 5, and seem to work fine at dytc_version 4. This code has
been tested to work properly on the specified system.

Signed-off-by: Kelly Anderson <kelly@xilka.com>

 drivers/platform/x86/ideapad-laptop.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index e7a1299e3776..fc54f6ab614f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -868,6 +868,18 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
 	}
 }
 
+static const struct dmi_system_id ideapad_dytc_v4_whitelist_table[] = {
+	{
+		/* Ideapad 5 Pro 16ACH6 */
+		.ident = "LENOVO 82L5",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82L5")
+		}
+	},
+	{}
+};
+
 static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 {
 	int err, dytc_version;
@@ -882,12 +894,20 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 		return err;
 
 	/* Check DYTC is enabled and supports mode setting */
-	if (!test_bit(DYTC_QUERY_ENABLE_BIT, &output))
+	if (!test_bit(DYTC_QUERY_ENABLE_BIT, &output)) {
+		dev_info(&priv->platform_device->dev, "DYTC_QUERY_ENABLE_BIT returned false\n");
 		return -ENODEV;
+	}
 
 	dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
-	if (dytc_version < 5)
-		return -ENODEV;
+
+	if (dytc_version < 5) {
+		if ( dytc_version < 4 || ! dmi_check_system(ideapad_dytc_v4_whitelist_table) ) {
+			dev_info(&priv->platform_device->dev,
+				"DYTC_VERSION is less than 4 or is not whitelisted: %d\n", dytc_version);
+			return -ENODEV;
+		}
+	}
 
 	priv->dytc = kzalloc(sizeof(*priv->dytc), GFP_KERNEL);
 	if (!priv->dytc)
-- 
2.33.0



