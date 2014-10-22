From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/2] samsung-laptop: Add broken-acpi-video quirk for NC210/NC110
Date: Wed, 22 Oct 2014 16:06:37 +0200
Message-ID: <1413986798-27689-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:65414 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751461AbaJVOHK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Oct 2014 10:07:10 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <darren@dvhart.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Lee Chun-Yi <jlee@suse.com>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org

The acpi-video backlight interface on the NC210 does not work, blacklist it
and use the samsung-laptop interface instead.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=861573
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>

--
Changes in v2: Improve commit message
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
