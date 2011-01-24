From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH] asus-laptop: let WLED alone on L1400B
Date: Mon, 24 Jan 2011 10:21:59 +0100
Message-ID: <1295860919-9248-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb1.tech.numericable.fr ([82.216.111.51]:41085 "EHLO
	fb1.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351Ab1AXJbf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 24 Jan 2011 04:31:35 -0500
Received: from smtp2.tech.numericable.fr (smtp2.nc.sdv.fr [10.0.0.36])
	by fb1.tech.numericable.fr (Postfix) with ESMTP id 5B822ADEDA
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jan 2011 10:23:11 +0100 (CET)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, Corentin Chary <corentincj@iksaif.net>, stable@kernel.org

Asus took the DSDT from another model (L84F), made some change
to make it work, but forgot to remove WLED method (the laptop
doesn't have a wireless card). They even didn't change the model
name.

Reference: https://bugzilla.kernel.org/show_bug.cgi?id=25712
Signed-off-by: Corentin Chary <corentincj@iksaif.net>
Cc: stable@kernel.org
---
 drivers/platform/x86/asus-laptop.c |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index d235f44..1909685 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -50,6 +50,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/rfkill.h>
 #include <linux/slab.h>
+#include <linux/dmi.h>
 #include <acpi/acpi_drivers.h>
 #include <acpi/acpi_bus.h>
 
@@ -1556,6 +1557,20 @@ static int __devinit asus_acpi_init(struct asus_laptop *asus)
 	return result;
 }
 
+static void __devinit asus_dmi_check(void)
+{
+	const char *model;
+
+	model = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (!model)
+		return;
+
+	/* On L1400B WLED control the sound card, don't mess with it ... */
+	if (strncmp(model, "L1400B", 6) == 0) {
+		wlan_status = -1;
+	}
+}
+
 static bool asus_device_present;
 
 static int __devinit asus_acpi_add(struct acpi_device *device)
@@ -1574,6 +1589,8 @@ static int __devinit asus_acpi_add(struct acpi_device *device)
 	device->driver_data = asus;
 	asus->device = device;
 
+	asus_dmi_check();
+
 	result = asus_acpi_init(asus);
 	if (result)
 		goto fail_platform;
-- 
1.7.3.4
