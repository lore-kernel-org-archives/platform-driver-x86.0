From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] samsung-laptop: Add broken-acpi-video quirk for NC210/NC110
Date: Thu, 16 Oct 2014 14:36:30 +0200
Message-ID: <1413462991-1463-1-git-send-email-hdegoede@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, Lee Chun-Yi <jlee@suse.com>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Reported (and tested) here:
https://bugzilla.redhat.com/show_bug.cgi?id=861573

Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/samsung-laptop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 5a59665..ff765d8 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1561,6 +1561,16 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
 	},
 	{
 	 .callback = samsung_dmi_matched,
+	 .ident = "NC210",
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "NC210/NC110"),
+		DMI_MATCH(DMI_BOARD_NAME, "NC210/NC110"),
+		},
+	 .driver_data = &samsung_broken_acpi_video,
+	},
+	{
+	 .callback = samsung_dmi_matched,
 	 .ident = "730U3E/740U3E",
 	 .matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-- 
2.1.0
