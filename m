From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH v2] thinkpad_acpi: revert unintentional device attribute renaming
Date: Tue, 19 May 2015 19:45:03 +0200
Message-ID: <1432057503-18089-1-git-send-email-bjorn@mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:55537 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755915AbbESRp4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 May 2015 13:45:56 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>, Bastien Nocera <hadess@hadess.net>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

The conversion to DEVICE_ATTR_* macros failed to fixup a few cases wher=
e
the old attribute names didn't match the show/store function names.
Instead of renaming the functions, the attributes were renamed. This
caused an unintentional API change.  The hwmon required 'name' attribut=
e
were among the renamed attribute, causing libsensors to fail to detect
the hwmon device at all.

=46ix by using the DEVICE_ATTR macro for these attributes, allowing the
show/store functions to keep their system specific prefixes.

=46ixes: b4dd04ac6ef8 ("thinkpad_acpi: use DEVICE_ATTR_* macros")
Cc: Bastien Nocera <hadess@hadess.net>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
---
v2: kept the original function names, using the DEVICE_ATTR instead

 drivers/platform/x86/thinkpad_acpi.c | 37 ++++++++++++++++++----------=
--------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
index 9bb9ad6d4a1b..28f328136f0d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2897,7 +2897,7 @@ static ssize_t hotkey_wakeup_reason_show(struct d=
evice *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", hotkey_wakeup_reason);
 }
=20
-static DEVICE_ATTR_RO(hotkey_wakeup_reason);
+static DEVICE_ATTR(wakeup_reason, S_IRUGO, hotkey_wakeup_reason_show, =
NULL);
=20
 static void hotkey_wakeup_reason_notify_change(void)
 {
@@ -2913,7 +2913,8 @@ static ssize_t hotkey_wakeup_hotunplug_complete_s=
how(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", hotkey_autosleep_ack);
 }
=20
-static DEVICE_ATTR_RO(hotkey_wakeup_hotunplug_complete);
+static DEVICE_ATTR(wakeup_hotunplug_complete, S_IRUGO,
+		   hotkey_wakeup_hotunplug_complete_show, NULL);
=20
 static void hotkey_wakeup_hotunplug_complete_notify_change(void)
 {
@@ -2978,8 +2979,8 @@ static struct attribute *hotkey_attributes[] __in=
itdata =3D {
 	&dev_attr_hotkey_enable.attr,
 	&dev_attr_hotkey_bios_enabled.attr,
 	&dev_attr_hotkey_bios_mask.attr,
-	&dev_attr_hotkey_wakeup_reason.attr,
-	&dev_attr_hotkey_wakeup_hotunplug_complete.attr,
+	&dev_attr_wakeup_reason.attr,
+	&dev_attr_wakeup_hotunplug_complete.attr,
 	&dev_attr_hotkey_mask.attr,
 	&dev_attr_hotkey_all_mask.attr,
 	&dev_attr_hotkey_recommended_mask.attr,
@@ -4393,12 +4394,13 @@ static ssize_t wan_enable_store(struct device *=
dev,
 			attr, buf, count);
 }
=20
-static DEVICE_ATTR_RW(wan_enable);
+static DEVICE_ATTR(wwan_enable, S_IWUSR | S_IRUGO,
+		   wan_enable_show, wan_enable_store);
=20
 /* -------------------------------------------------------------------=
-- */
=20
 static struct attribute *wan_attributes[] =3D {
-	&dev_attr_wan_enable.attr,
+	&dev_attr_wwan_enable.attr,
 	NULL
 };
=20
@@ -8138,7 +8140,8 @@ static ssize_t fan_pwm1_enable_store(struct devic=
e *dev,
 	return count;
 }
=20
-static DEVICE_ATTR_RW(fan_pwm1_enable);
+static DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
+		   fan_pwm1_enable_show, fan_pwm1_enable_store);
=20
 /* sysfs fan pwm1 ----------------------------------------------------=
-- */
 static ssize_t fan_pwm1_show(struct device *dev,
@@ -8198,7 +8201,7 @@ static ssize_t fan_pwm1_store(struct device *dev,
 	return (rc) ? rc : count;
 }
=20
-static DEVICE_ATTR_RW(fan_pwm1);
+static DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, fan_pwm1_show, fan_pwm1_st=
ore);
=20
 /* sysfs fan fan1_input ----------------------------------------------=
-- */
 static ssize_t fan_fan1_input_show(struct device *dev,
@@ -8215,7 +8218,7 @@ static ssize_t fan_fan1_input_show(struct device =
*dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", speed);
 }
=20
-static DEVICE_ATTR_RO(fan_fan1_input);
+static DEVICE_ATTR(fan1_input, S_IRUGO, fan_fan1_input_show, NULL);
=20
 /* sysfs fan fan2_input ----------------------------------------------=
-- */
 static ssize_t fan_fan2_input_show(struct device *dev,
@@ -8232,7 +8235,7 @@ static ssize_t fan_fan2_input_show(struct device =
*dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", speed);
 }
=20
-static DEVICE_ATTR_RO(fan_fan2_input);
+static DEVICE_ATTR(fan2_input, S_IRUGO, fan_fan2_input_show, NULL);
=20
 /* sysfs fan fan_watchdog (hwmon driver) -----------------------------=
-- */
 static ssize_t fan_fan_watchdog_show(struct device_driver *drv,
@@ -8265,8 +8268,8 @@ static DRIVER_ATTR(fan_watchdog, S_IWUSR | S_IRUG=
O,
=20
 /* -------------------------------------------------------------------=
-- */
 static struct attribute *fan_attributes[] =3D {
-	&dev_attr_fan_pwm1_enable.attr, &dev_attr_fan_pwm1.attr,
-	&dev_attr_fan_fan1_input.attr,
+	&dev_attr_pwm1_enable.attr, &dev_attr_pwm1.attr,
+	&dev_attr_fan1_input.attr,
 	NULL, /* for fan2_input */
 	NULL
 };
@@ -8400,7 +8403,7 @@ static int __init fan_init(struct ibm_init_struct=
 *iibm)
 		if (tp_features.second_fan) {
 			/* attach second fan tachometer */
 			fan_attributes[ARRAY_SIZE(fan_attributes)-2] =3D
-					&dev_attr_fan_fan2_input.attr;
+					&dev_attr_fan2_input.attr;
 		}
 		rc =3D sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
 					 &fan_attr_group);
@@ -8848,7 +8851,7 @@ static ssize_t thinkpad_acpi_pdev_name_show(struc=
t device *dev,
 	return snprintf(buf, PAGE_SIZE, "%s\n", TPACPI_NAME);
 }
=20
-static DEVICE_ATTR_RO(thinkpad_acpi_pdev_name);
+static DEVICE_ATTR(name, S_IRUGO, thinkpad_acpi_pdev_name_show, NULL);
=20
 /* -------------------------------------------------------------------=
-- */
=20
@@ -9390,8 +9393,7 @@ static void thinkpad_acpi_module_exit(void)
 		hwmon_device_unregister(tpacpi_hwmon);
=20
 	if (tp_features.sensors_pdev_attrs_registered)
-		device_remove_file(&tpacpi_sensors_pdev->dev,
-				   &dev_attr_thinkpad_acpi_pdev_name);
+		device_remove_file(&tpacpi_sensors_pdev->dev, &dev_attr_name);
 	if (tpacpi_sensors_pdev)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	if (tpacpi_pdev)
@@ -9512,8 +9514,7 @@ static int __init thinkpad_acpi_module_init(void)
 		thinkpad_acpi_module_exit();
 		return ret;
 	}
-	ret =3D device_create_file(&tpacpi_sensors_pdev->dev,
-				 &dev_attr_thinkpad_acpi_pdev_name);
+	ret =3D device_create_file(&tpacpi_sensors_pdev->dev, &dev_attr_name)=
;
 	if (ret) {
 		pr_err("unable to create sysfs hwmon device attributes\n");
 		thinkpad_acpi_module_exit();
--=20
2.1.4
