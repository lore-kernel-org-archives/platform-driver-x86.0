From: timg@tpi.com (Tim Gardner)
Subject: Sony laptop: Some Sony Vaio laptops do not enable wwan power by default
Date: Tue,  4 May 2010 10:58:18 -0600 (MDT)
Message-ID: <20100504165818.1B206F899A@sepang.rtg.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.tpi.com ([70.99.223.143]:4029 "EHLO mail.tpi.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755463Ab0EDRXm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 May 2010 13:23:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: malattia@linux.it
Cc: platform-driver-x86@vger.kernel.org

From ed5c70a6ad8fbc9834d76818e5f47bfec17a0026 Mon Sep 17 00:00:00 2001
From: Tim Gardner <tim.gardner@canonical.com>
Date: Tue, 21 Apr 2009 11:09:10 -0600
Subject: [PATCH] Sony laptop: Some Sony Vaio laptops do not enable wwan power by default.

BugLink: http://bugs.launchpad.net/bugs/364678

Added quirk to enable wwan power based on DMI information already present in the module.
It appears that Vaio's do not enable power to wwan from a cold boot.

Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/platform/x86/sony-laptop.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 1387c5f..fcef9c7 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1447,6 +1447,10 @@ struct sonypi_eventtypes {
 	struct sonypi_event	*events;
 };
 
+struct sony_pic_quirk_entry {
+	u8				set_wwan_power;
+};
+
 struct sony_pic_dev {
 	struct acpi_device		*acpi_dev;
 	struct sony_pic_irq		*cur_irq;
@@ -1457,6 +1461,7 @@ struct sony_pic_dev {
 	struct sonypi_eventtypes	*event_types;
 	int                             (*handle_irq)(const u8, const u8);
 	int				model;
+	struct sony_pic_quirk_entry	*quirks;
 	u16				evport_offset;
 	u8				camera_power;
 	u8				bluetooth_power;
@@ -2887,6 +2892,12 @@ static int sony_pic_add(struct acpi_device *device)
 	if (result)
 		goto err_remove_pf;
 
+	if (spic_dev.quirks && spic_dev.quirks->set_wwan_power) {
+		/*
+		 * Power isn't enabled by default.
+		 */
+		__sony_pic_set_wwanpower(1);
+	}
 	return 0;
 
 err_remove_pf:
@@ -2957,6 +2968,16 @@ static struct acpi_driver sony_pic_driver = {
 		},
 };
 
+static struct sony_pic_quirk_entry sony_pic_vaio_vgn = {
+	.set_wwan_power = 1,
+};
+
+static int dmi_matched(const struct dmi_system_id *dmi)
+{
+	spic_dev.quirks = dmi->driver_data;
+	return 0;
+}
+
 static struct dmi_system_id __initdata sonypi_dmi_table[] = {
 	{
 		.ident = "Sony Vaio",
@@ -2971,6 +2992,8 @@ static struct dmi_system_id __initdata sonypi_dmi_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-"),
 		},
+		.callback = dmi_matched,
+		.driver_data = &sony_pic_vaio_vgn,
 	},
 	{ }
 };
-- 
1.7.0.4

