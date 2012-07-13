From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: Add 6 machines to touchpad led quirk
Date: Fri, 13 Jul 2012 16:39:57 +0800
Message-ID: <1342168797-26080-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57398 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756231Ab2GMIkC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 13 Jul 2012 04:40:02 -0400
Received: by pbbrp8 with SMTP id rp8so5149903pbb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jul 2012 01:40:01 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

Add the following machines into quirk,
Isnpiron 5420, Isnpiron 5520, Isnpiron 5720,
Isnpiron 7420, Isnpiron 7520, Isnpiron 7720

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |   54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 5f78aac..4e96e8c 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -206,6 +206,60 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 5420",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5420"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 5520",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5520"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 5720",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5720"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 7420",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7420"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 7520",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7520"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 7720",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7720"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
 	{ }
 };
 
-- 
1.7.9.5
