From: Tim Gardner <tim.gardner@canonical.com>
Subject: [PATCH] Sony laptop: Some Sony Vaia laptops do not enable wwan power
 by default.
Date: Tue, 12 Jul 2011 09:55:38 -0600
Message-ID: <4E1C6E7A.3030705@canonical.com>
Reply-To: tim.gardner@canonical.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000000080202010000040609"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.tpi.com ([70.99.223.143]:4600 "EHLO mail.tpi.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753855Ab1GLP4E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jul 2011 11:56:04 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------000000080202010000040609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ubuntu has been carrying this patch for a couple of years because I keep 
forgetting to upstream it. Does anyone think it still makes sense, or 
should setting WWAN power be done in user space ?

rtg
-- 
Tim Gardner tim.gardner@canonical.com

--------------000000080202010000040609
Content-Type: text/x-patch;
 name="0001-UBUNTU-Sony-laptop-Some-Sony-Vaia-laptops-do-not-ena.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-UBUNTU-Sony-laptop-Some-Sony-Vaia-laptops-do-not-ena.pa";
 filename*1="tch"

From 87db59448467783076b7468a8f8ae3650d08d3a0 Mon Sep 17 00:00:00 2001
From: Tim Gardner <tim.gardner@canonical.com>
Date: Tue, 21 Apr 2009 11:09:10 -0600
Subject: [PATCH] Sony laptop: Some Sony Vaia laptops do not enable wwan power by default.

Bug: https://bugs.launchpad.net/bugs/364678

Added quirk to enable wwan power based on DMI information already present in the module.
It appears that Vaio's do not enable power to wwan from a cold boot.

Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/platform/x86/sony-laptop.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index bbd182e..02265fd 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1879,6 +1879,10 @@ struct sonypi_eventtypes {
 	struct sonypi_event	*events;
 };
 
+struct sony_pic_quirk_entry {
+	u8				set_wwan_power;
+};
+
 struct sony_pic_dev {
 	struct acpi_device		*acpi_dev;
 	struct sony_pic_irq		*cur_irq;
@@ -1889,6 +1893,7 @@ struct sony_pic_dev {
 	struct sonypi_eventtypes	*event_types;
 	int                             (*handle_irq)(const u8, const u8);
 	int				model;
+	struct sony_pic_quirk_entry	*quirks;
 	u16				evport_offset;
 	u8				camera_power;
 	u8				bluetooth_power;
@@ -3315,6 +3320,12 @@ static int sony_pic_add(struct acpi_device *device)
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
@@ -3385,6 +3396,16 @@ static struct acpi_driver sony_pic_driver = {
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
@@ -3399,6 +3420,8 @@ static struct dmi_system_id __initdata sonypi_dmi_table[] = {
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


--------------000000080202010000040609--
