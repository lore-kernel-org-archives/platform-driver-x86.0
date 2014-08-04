From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/2] toshiba_acpi: Add Qosmio X75-A to the alt keymap dmi list
Date: Mon,  4 Aug 2014 09:21:02 -0600
Message-ID: <1407165662-1971-3-git-send-email-coproscefalo@gmail.com>
References: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:54232 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbaHDPVf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Aug 2014 11:21:35 -0400
In-Reply-To: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

The Toshiba Qosmio X75-A series models also come with
the new keymap layout.

This patch adds this model to the alt_keymap_dmi list,
along with an extra key found on these models.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 1ed2ffc..34b7303 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -222,6 +222,12 @@ static const struct dmi_system_id toshiba_alt_keymap_dmi[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Satellite M840"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Qosmio X75-A"),
+		},
+	},
 	{}
 };
 
@@ -229,6 +235,7 @@ static const struct key_entry toshiba_acpi_alt_keymap[] = {
 	{ KE_KEY, 0x157, { KEY_MUTE } },
 	{ KE_KEY, 0x102, { KEY_ZOOMOUT } },
 	{ KE_KEY, 0x103, { KEY_ZOOMIN } },
+	{ KE_KEY, 0x12c, { KEY_KBDILLUMTOGGLE } },
 	{ KE_KEY, 0x139, { KEY_ZOOMRESET } },
 	{ KE_KEY, 0x13e, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0x13c, { KEY_BRIGHTNESSDOWN } },
-- 
2.0.0
