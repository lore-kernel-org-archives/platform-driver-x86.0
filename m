From: Andy Ross <andy.ross@windriver.com>
Subject: [PATCH 1/4] asus-laptop: Platform detection for Pegatron Lucid
Date: Thu, 24 Mar 2011 15:02:07 -0700
Message-ID: <1301004130-3294-2-git-send-email-andy.ross@windriver.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from li44-10.members.linode.com ([72.14.181.10]:44865 "EHLO
	plausible.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757014Ab1CXWIj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 18:08:39 -0400
In-Reply-To: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Recognize the Pegatron Lucid tablets by their method signatures.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 drivers/platform/x86/Kconfig       |   13 ++++++++-----
 drivers/platform/x86/asus-laptop.c |   23 ++++++++++++++++++++---
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index faec777..b6f983e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -62,12 +62,15 @@ config ASUS_LAPTOP
 	depends on INPUT
 	depends on RFKILL || RFKILL = n
 	select INPUT_SPARSEKMAP
+	select INPUT_POLLDEV
 	---help---
-	  This is the new Linux driver for Asus laptops. It may also support some
-	  MEDION, JVC or VICTOR laptops. It makes all the extra buttons generate
-	  standard ACPI events and input events. It also adds
-	  support for video output switching, LCD backlight control, Bluetooth and
-	  Wlan control, and most importantly, allows you to blink those fancy LEDs.
+	  This is a driver for Asus laptops and the Pegatron Lucid
+	  tablet. It may also support some MEDION, JVC or VICTOR
+	  laptops. It makes all the extra buttons generate standard
+	  ACPI events and input events. It also adds support for video
+	  output switching, LCD backlight control, Bluetooth and Wlan
+	  control, and most importantly, allows you to blink those
+	  fancy LEDs.
 
 	  For more information and a userspace daemon for handling the extra
 	  buttons see <http://acpi4asus.sf.net>.
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index d235f44..ec46d71 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -4,6 +4,7 @@
  *
  *  Copyright (C) 2002-2005 Julien Lerouge, 2003-2006 Karol Kozimor
  *  Copyright (C) 2006-2007 Corentin Chary
+ *  Copyright (C) 2011 Wind River Systems
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -48,6 +49,7 @@
 #include <linux/uaccess.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/input-polldev.h>
 #include <linux/rfkill.h>
 #include <linux/slab.h>
 #include <acpi/acpi_drivers.h>
@@ -210,6 +212,12 @@ static char *display_get_paths[] = {
 #define METHOD_KBD_LIGHT_SET	"SLKB"
 #define METHOD_KBD_LIGHT_GET	"GLKB"
 
+/* For Pegatron Lucid tablet */
+#define DEVICE_NAME_PEGA	"Lucid"
+#define METHOD_PEGA_ENABLE	"ENPR"
+#define METHOD_PEGA_DISABLE	"DAPR"
+#define METHOD_PEGA_READ	"RDLN"
+
 /*
  * Define a specific led structure to keep the main structure clean
  */
@@ -246,6 +254,7 @@ struct asus_laptop {
 
 	int wireless_status;
 	bool have_rsts;
+	bool have_pega_lucid;
 	int lcd_state;
 
 	struct rfkill *gps_rfkill;
@@ -361,6 +370,14 @@ static int acpi_check_handle(acpi_handle handle, const char *method,
 	return 0;
 }
 
+static bool asus_check_pega_lucid(struct asus_laptop *asus)
+{
+	return !strcmp(asus->name, DEVICE_NAME_PEGA) &&
+	   !acpi_check_handle(asus->handle, METHOD_PEGA_ENABLE, NULL) &&
+	   !acpi_check_handle(asus->handle, METHOD_PEGA_DISABLE, NULL) &&
+	   !acpi_check_handle(asus->handle, METHOD_PEGA_READ, NULL);
+}
+
 /* Generic LED function */
 static int asus_led_set(struct asus_laptop *asus, const char *method,
 			 int value)
@@ -1334,7 +1351,6 @@ static mode_t asus_sysfs_is_visible(struct kobject *kobj,
 		   attr == &dev_attr_ls_level.attr) {
 		supported = !acpi_check_handle(handle, METHOD_ALS_CONTROL, NULL) &&
 			    !acpi_check_handle(handle, METHOD_ALS_LEVEL, NULL);
-
 	} else if (attr == &dev_attr_gps.attr) {
 		supported = !acpi_check_handle(handle, METHOD_GPS_ON, NULL) &&
 			    !acpi_check_handle(handle, METHOD_GPS_OFF, NULL) &&
@@ -1579,9 +1595,10 @@ static int __devinit asus_acpi_add(struct acpi_device *device)
 		goto fail_platform;
 
 	/*
-	 * Register the platform device first.  It is used as a parent for the
-	 * sub-devices below.
+	 * Need platform type detection first, then the platform
+	 * device.  It is used as a parent for the sub-devices below.
 	 */
+	asus->have_pega_lucid = asus_check_pega_lucid(asus);
 	result = asus_platform_init(asus);
 	if (result)
 		goto fail_platform;
-- 
1.7.1
