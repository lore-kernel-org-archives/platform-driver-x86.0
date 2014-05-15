From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] eeepc-wmi: Add no backlight quirk for Asus H87I-PLUS Motherboard
Date: Thu, 15 May 2014 11:39:39 +0200
Message-ID: <1400146779-5607-2-git-send-email-hdegoede@redhat.com>
References: <1400146779-5607-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:64557 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752823AbaEOJjz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 May 2014 05:39:55 -0400
In-Reply-To: <1400146779-5607-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: karlitos <karel.macha@karlitos.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

https://bugzilla.redhat.com/show_bug.cgi?id=1097436

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/eeepc-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 6112933..a7286bb 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -114,6 +114,10 @@ static struct quirk_entry quirk_asus_x101ch = {
 	.wmi_backlight_power = true,
 };
 
+static struct quirk_entry quirk_asus_no_backlight = {
+	.no_backlight = true,
+};
+
 static struct quirk_entry *quirks;
 
 static void et2012_quirks(void)
@@ -182,6 +186,15 @@ static struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_x101ch,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK Computer INC. H87I-PLUS",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "H87I-PLUS"),
+		},
+		.driver_data = &quirk_asus_no_backlight,
+	},
 	{},
 };
 
-- 
1.9.0
