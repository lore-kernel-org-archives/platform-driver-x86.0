From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 4/7] sony-laptop: add lid backlight support for handle 0x143
Date: Sat,  9 Jun 2012 13:18:11 +0900
Message-ID: <1339215494-4020-5-git-send-email-malattia@linux.it>
References: <20120531220257.GA3986@kamineko.org>
 <1339215494-4020-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:33916 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734Ab2FIESg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jun 2012 00:18:36 -0400
In-Reply-To: <1339215494-4020-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 5d8f3fa..ec7f4e0 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1010,6 +1010,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 struct sony_backlight_props {
 	struct backlight_device *dev;
 	int			handle;
+	int			cmd_base;
 	u8			offset;
 	u8			maxlvl;
 };
@@ -1037,7 +1038,7 @@ static int sony_nc_get_brightness_ng(struct backlight_device *bd)
 	struct sony_backlight_props *sdev =
 		(struct sony_backlight_props *)bl_get_data(bd);
 
-	sony_call_snc_handle(sdev->handle, 0x0200, &result);
+	sony_call_snc_handle(sdev->handle, sdev->cmd_base + 0x100, &result);
 
 	return (result & 0xff) - sdev->offset;
 }
@@ -1049,7 +1050,8 @@ static int sony_nc_update_status_ng(struct backlight_device *bd)
 		(struct sony_backlight_props *)bl_get_data(bd);
 
 	value = bd->props.brightness + sdev->offset;
-	if (sony_call_snc_handle(sdev->handle, 0x0100 | (value << 16), &result))
+	if (sony_call_snc_handle(sdev->handle, sdev->cmd_base | (value << 0x10),
+				&result))
 		return -EIO;
 
 	return value;
@@ -2496,6 +2498,7 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 {
 	u64 offset;
 	int i;
+	int lvl_table_len = 0;
 	u8 min = 0xff, max = 0x00;
 	unsigned char buffer[32] = { 0 };
 
@@ -2515,11 +2518,21 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 	if (i < 0)
 		return;
 
+	switch (handle) {
+	case 0x012f:
+	case 0x0137:
+		lvl_table_len = 9;
+		break;
+	case 0x143:
+		lvl_table_len = 16;
+		break;
+	}
+
 	/* the buffer lists brightness levels available, brightness levels are
 	 * from position 0 to 8 in the array, other values are used by ALS
 	 * control.
 	 */
-	for (i = 0; i < 9 && i < ARRAY_SIZE(buffer); i++) {
+	for (i = 0; i < lvl_table_len && i < ARRAY_SIZE(buffer); i++) {
 
 		dprintk("Brightness level: %d\n", buffer[i]);
 
@@ -2546,14 +2559,22 @@ static void sony_nc_backlight_setup(void)
 
 	if (sony_find_snc_handle(0x12f) != -1) {
 		ops = &sony_backlight_ng_ops;
+		sony_bl_props.cmd_base = 0x0100;
 		sony_nc_backlight_ng_read_limits(0x12f, &sony_bl_props);
 		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
 
 	} else if (sony_find_snc_handle(0x137) != -1) {
 		ops = &sony_backlight_ng_ops;
+		sony_bl_props.cmd_base = 0x0100;
 		sony_nc_backlight_ng_read_limits(0x137, &sony_bl_props);
 		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
 
+	} else if (sony_find_snc_handle(0x143) != -1) {
+		ops = &sony_backlight_ng_ops;
+		sony_bl_props.cmd_base = 0x3000;
+		sony_nc_backlight_ng_read_limits(0x143, &sony_bl_props);
+		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
+
 	} else if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "GBRT",
 						&unused))) {
 		ops = &sony_backlight_ops;
-- 
1.7.10
