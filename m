From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] samsung-laptop: Add quirk for broken acpi_video backlight on N250P
Date: Wed,  5 Dec 2012 16:08:33 -0600
Message-ID: <1354745313-22247-1-git-send-email-seth.forshee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:35124 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752446Ab2LEWIh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Dec 2012 17:08:37 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

BugLink: http://bugs.launchpad.net/bugs/1086921
Cc: stable@vger.kernel.org # v3.4+
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/samsung-laptop.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index dd90d15..71623a2 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1523,6 +1523,16 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
 		},
 	 .driver_data = &samsung_broken_acpi_video,
 	},
+	{
+	 .callback = samsung_dmi_matched,
+	 .ident = "N250P",
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "N250P"),
+		DMI_MATCH(DMI_BOARD_NAME, "N250P"),
+		},
+	 .driver_data = &samsung_broken_acpi_video,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
-- 
1.7.9.5
