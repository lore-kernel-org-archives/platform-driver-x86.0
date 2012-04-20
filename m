From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: add 3 quirks for supporting touchpad LED
Date: Fri, 20 Apr 2012 11:47:26 +0800
Message-ID: <1334893646-8904-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37910 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932268Ab2DTDrc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 Apr 2012 23:47:32 -0400
Received: by iagz16 with SMTP id z16so12811719iag.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Apr 2012 20:47:31 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

Add "Vostro 3360", "Vostro 3460", and "Vostro 3560" into quirks,
so that they could have touchpad LED function work.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index e6c08ee..a45775f 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -212,6 +212,33 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Vostro 3360",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3360"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Vostro 3460",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3460"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Vostro 3560",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3560"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
 	{ }
 };
 
-- 
1.7.9.5
