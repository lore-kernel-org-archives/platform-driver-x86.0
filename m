From: Stanislav Fomichev <kernel@fomichev.me>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Fix warning about deprecated hwmon_device_register
Date: Tue, 20 Jun 2017 20:45:13 -0700
Message-ID: <20170621034513.4023-1-kernel@fomichev.me>
References: <20170620051633.GB15974@khazad-dum.debian.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35886 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752588AbdFUDqC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2017 23:46:02 -0400
Received: by mail-pg0-f67.google.com with SMTP id e187so16403536pgc.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jun 2017 20:46:02 -0700 (PDT)
In-Reply-To: <20170620051633.GB15974@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: hmh@hmh.eng.br
Cc: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Stanislav Fomichev <sdf@google.com>

From: Stanislav Fomichev <sdf@google.com>

Use hwmon_device_register_with_groups instead of deprecated
hwmon_device_register and fix a dmesg warning.

This patch however changes the userspace API.
hwmon_device_register_with_groups takes `hwmon' name as an argument and creates
a name file in the `hwmon' device, not in the `platform_device'. This
allows us to remove custom `name' device attribute, but in order to make
lm-sensors happy we also have to move fans and thermal attributes to the
`hwmon' device.

Even though this patch changes userspace API, it's still compatible with
the lm-sensors. Starting with lm-sensors 3.0 (circa 2007), it looks at both
hwmon and the backing device for the name and other attributes.

before:
$ cat /sys/devices/platform/thinkpad_hwmon/{name,fan1_input}
thinkpad
2007
$ cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/{name,fan1_input}
cat: /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/name: No such file or directory
cat: /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/fan1_input: No such file or directory
$ cat /sys/class/hwmon/hwmon1/{name,fan1_input}
cat: /sys/class/hwmon/hwmon1/name: No such file or directory
cat: /sys/class/hwmon/hwmon1/fan1_input: No such file or directory
$ sensors
thinkpad-isa-0000
Adapter: ISA adapter
fan1:        3533 RPM

after:
$ cat /sys/devices/platform/thinkpad_hwmon/{name,fan1_input}
cat: /sys/devices/platform/thinkpad_hwmon/name: No such file or directory
cat: /sys/devices/platform/thinkpad_hwmon/fan1_input: No such file or directory
$ cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/{name,fan1_input}
thinkpad
3478
$ cat /sys/class/hwmon/hwmon1/{name,fan1_input}
thinkpad
3478
$ sensors
thinkpad-isa-0000
Adapter: ISA adapter
fan1:        3489 RPM

$ sensors -v
sensors version 3.4.0 with libsensors version 3.4.0

Changes since v1:
* Bumped TPACPI_SYSFS_VERSION
* Updated documentation

Signed-off-by: Stanislav Fomichev <kernel@fomichev.me>
---
 Documentation/laptops/thinkpad-acpi.txt |  9 ++++++--
 drivers/platform/x86/thinkpad_acpi.c    | 38 ++++++++++-----------------------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index ba2e7d254842..1dbef8b8c7b1 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -121,8 +121,9 @@ space, for 2.6.23+ this is /sys/devices/platform/thinkpad_acpi/.
 Sysfs device attributes for the sensors and fan are on the
 thinkpad_hwmon device's sysfs attribute space, but you should locate it
 looking for a hwmon device with the name attribute of "thinkpad", or
-better yet, through libsensors.
-
+better yet, through libsensors. For 4.13+ sysfs attributes were moved to the
+hwmon device (/sys/bus/platform/devices/thinkpad_hwmon/hwmon/hwmon? or
+/sys/class/hwmon/hwmon?).
 
 Driver version
 --------------
@@ -1478,3 +1479,7 @@ not, please contact ibm-acpi-devel@lists.sourceforge.net with a report.
 0x020700:	Support for mute-only mixers.
 		Volume control in read-only mode by default.
 		Marker for ALSA mixer support.
+
+0x030000:	Thermal and fan sysfs attributes were moved to the hwmon
+		device instead of being attached to the backing platform
+		device.
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7b6cb0c69b02..4470f59ce874 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -24,7 +24,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #define TPACPI_VERSION "0.25"
-#define TPACPI_SYSFS_VERSION 0x020700
+#define TPACPI_SYSFS_VERSION 0x030000
 
 /*
  *  Changelog:
@@ -6401,7 +6401,7 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 
 	switch (thermal_read_mode) {
 	case TPACPI_THERMAL_TPEC_16:
-		res = sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
+		res = sysfs_create_group(&tpacpi_hwmon->kobj,
 				&thermal_temp_input16_group);
 		if (res)
 			return res;
@@ -6409,7 +6409,7 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 	case TPACPI_THERMAL_TPEC_8:
 	case TPACPI_THERMAL_ACPI_TMP07:
 	case TPACPI_THERMAL_ACPI_UPDT:
-		res = sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
+		res = sysfs_create_group(&tpacpi_hwmon->kobj,
 				&thermal_temp_input8_group);
 		if (res)
 			return res;
@@ -6426,13 +6426,13 @@ static void thermal_exit(void)
 {
 	switch (thermal_read_mode) {
 	case TPACPI_THERMAL_TPEC_16:
-		sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj,
+		sysfs_remove_group(&tpacpi_hwmon->kobj,
 				   &thermal_temp_input16_group);
 		break;
 	case TPACPI_THERMAL_TPEC_8:
 	case TPACPI_THERMAL_ACPI_TMP07:
 	case TPACPI_THERMAL_ACPI_UPDT:
-		sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj,
+		sysfs_remove_group(&tpacpi_hwmon->kobj,
 				   &thermal_temp_input8_group);
 		break;
 	case TPACPI_THERMAL_NONE:
@@ -8773,7 +8773,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 			fan_attributes[ARRAY_SIZE(fan_attributes)-2] =
 					&dev_attr_fan2_input.attr;
 		}
-		rc = sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
+		rc = sysfs_create_group(&tpacpi_hwmon->kobj,
 					 &fan_attr_group);
 		if (rc < 0)
 			return rc;
@@ -8781,7 +8781,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 		rc = driver_create_file(&tpacpi_hwmon_pdriver.driver,
 					&driver_attr_fan_watchdog);
 		if (rc < 0) {
-			sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj,
+			sysfs_remove_group(&tpacpi_hwmon->kobj,
 					&fan_attr_group);
 			return rc;
 		}
@@ -8796,7 +8796,7 @@ static void fan_exit(void)
 		    "cancelling any pending fan watchdog tasks\n");
 
 	/* FIXME: can we really do this unconditionally? */
-	sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj, &fan_attr_group);
+	sysfs_remove_group(&tpacpi_hwmon->kobj, &fan_attr_group);
 	driver_remove_file(&tpacpi_hwmon_pdriver.driver,
 			   &driver_attr_fan_watchdog);
 
@@ -9229,16 +9229,6 @@ static void hotkey_driver_event(const unsigned int scancode)
 	tpacpi_driver_event(TP_HKEY_EV_HOTKEY_BASE + scancode);
 }
 
-/* sysfs name ---------------------------------------------------------- */
-static ssize_t thinkpad_acpi_pdev_name_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buf)
-{
-	return snprintf(buf, PAGE_SIZE, "%s\n", TPACPI_NAME);
-}
-
-static DEVICE_ATTR(name, S_IRUGO, thinkpad_acpi_pdev_name_show, NULL);
-
 /* --------------------------------------------------------------------- */
 
 /* /proc support */
@@ -9782,8 +9772,6 @@ static void thinkpad_acpi_module_exit(void)
 	if (tpacpi_hwmon)
 		hwmon_device_unregister(tpacpi_hwmon);
 
-	if (tp_features.sensors_pdev_attrs_registered)
-		device_remove_file(&tpacpi_sensors_pdev->dev, &dev_attr_name);
 	if (tpacpi_sensors_pdev)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	if (tpacpi_pdev)
@@ -9904,14 +9892,10 @@ static int __init thinkpad_acpi_module_init(void)
 		thinkpad_acpi_module_exit();
 		return ret;
 	}
-	ret = device_create_file(&tpacpi_sensors_pdev->dev, &dev_attr_name);
-	if (ret) {
-		pr_err("unable to create sysfs hwmon device attributes\n");
-		thinkpad_acpi_module_exit();
-		return ret;
-	}
 	tp_features.sensors_pdev_attrs_registered = 1;
-	tpacpi_hwmon = hwmon_device_register(&tpacpi_sensors_pdev->dev);
+	tpacpi_hwmon = hwmon_device_register_with_groups(
+		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, NULL);
+
 	if (IS_ERR(tpacpi_hwmon)) {
 		ret = PTR_ERR(tpacpi_hwmon);
 		tpacpi_hwmon = NULL;
-- 
2.13.1
