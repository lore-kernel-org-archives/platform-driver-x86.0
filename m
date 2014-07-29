From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] asus-nb-wmi: Add wapf4 quirk for the U32U
Date: Tue, 29 Jul 2014 11:59:57 +0200
Message-ID: <1406627997-20311-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:18937 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752171AbaG2KAS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Jul 2014 06:00:18 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, Hans de Goede <hdegoede@redhat.com>

As reported here: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1173681
the U32U needs wapf=4 too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 7196cd0..7a2c4cc 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -83,6 +83,20 @@ static int dmi_matched(const struct dmi_system_id *dmi)
 static struct dmi_system_id asus_quirks[] = {
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. U32U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "U32U"),
+		},
+		/*
+		 * Note this machine has a Brazos APU, and most Brazos Asus
+		 * machines need quirk_asus_x55u / wmi_backlight_power but
+		 * here acpi-video seems to work fine for backlight control.
+		 */
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X401U",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.0.1
