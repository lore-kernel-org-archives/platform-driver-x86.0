From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH] thinkpad_acpi: revert unintentional device attribute renaming
Date: Tue, 19 May 2015 16:13:41 +0200
Message-ID: <1432044821-16340-1-git-send-email-bjorn@mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:42086 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932986AbbESOOi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 May 2015 10:14:38 -0400
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

=46ixes: b4dd04ac6ef8 ("thinkpad_acpi: use DEVICE_ATTR_* macros")
Cc: Bastien Nocera <hadess@hadess.net>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
---
 drivers/platform/x86/thinkpad_acpi.c | 84 ++++++++++++++++++----------=
--------
 1 file changed, 41 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
index 9bb9ad6d4a1b..6db64531d8b4 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2890,14 +2890,14 @@ static void hotkey_tablet_mode_notify_change(vo=
id)
 }
=20
 /* sysfs wakeup reason (pollable) ------------------------------------=
-- */
-static ssize_t hotkey_wakeup_reason_show(struct device *dev,
+static ssize_t wakeup_reason_show(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", hotkey_wakeup_reason);
 }
=20
-static DEVICE_ATTR_RO(hotkey_wakeup_reason);
+static DEVICE_ATTR_RO(wakeup_reason);
=20
 static void hotkey_wakeup_reason_notify_change(void)
 {
@@ -2906,14 +2906,14 @@ static void hotkey_wakeup_reason_notify_change(=
void)
 }
=20
 /* sysfs wakeup hotunplug_complete (pollable) ------------------------=
-- */
-static ssize_t hotkey_wakeup_hotunplug_complete_show(struct device *de=
v,
+static ssize_t wakeup_hotunplug_complete_show(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", hotkey_autosleep_ack);
 }
=20
-static DEVICE_ATTR_RO(hotkey_wakeup_hotunplug_complete);
+static DEVICE_ATTR_RO(wakeup_hotunplug_complete);
=20
 static void hotkey_wakeup_hotunplug_complete_notify_change(void)
 {
@@ -2978,8 +2978,8 @@ static struct attribute *hotkey_attributes[] __in=
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
@@ -4377,7 +4377,7 @@ static int wan_set_status(enum tpacpi_rfkill_stat=
e state)
 }
=20
 /* sysfs wan enable --------------------------------------------------=
-- */
-static ssize_t wan_enable_show(struct device *dev,
+static ssize_t wwan_enable_show(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
 {
@@ -4385,7 +4385,7 @@ static ssize_t wan_enable_show(struct device *dev=
,
 			attr, buf);
 }
=20
-static ssize_t wan_enable_store(struct device *dev,
+static ssize_t wwan_enable_store(struct device *dev,
 			    struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
@@ -4393,12 +4393,12 @@ static ssize_t wan_enable_store(struct device *=
dev,
 			attr, buf, count);
 }
=20
-static DEVICE_ATTR_RW(wan_enable);
+static DEVICE_ATTR_RW(wwan_enable);
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
@@ -8076,9 +8076,9 @@ static void fan_watchdog_fire(struct work_struct =
*ignored)
  */
=20
 /* sysfs fan pwm1_enable ---------------------------------------------=
-- */
-static ssize_t fan_pwm1_enable_show(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static ssize_t pwm1_enable_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
 {
 	int res, mode;
 	u8 status;
@@ -8097,9 +8097,9 @@ static ssize_t fan_pwm1_enable_show(struct device=
 *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", mode);
 }
=20
-static ssize_t fan_pwm1_enable_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	unsigned long t;
 	int res, level;
@@ -8138,12 +8138,12 @@ static ssize_t fan_pwm1_enable_store(struct dev=
ice *dev,
 	return count;
 }
=20
-static DEVICE_ATTR_RW(fan_pwm1_enable);
+static DEVICE_ATTR_RW(pwm1_enable);
=20
 /* sysfs fan pwm1 ----------------------------------------------------=
-- */
-static ssize_t fan_pwm1_show(struct device *dev,
-			     struct device_attribute *attr,
-			     char *buf)
+static ssize_t pwm1_show(struct device *dev,
+			 struct device_attribute *attr,
+			 char *buf)
 {
 	int res;
 	u8 status;
@@ -8162,9 +8162,9 @@ static ssize_t fan_pwm1_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", (status * 255) / 7);
 }
=20
-static ssize_t fan_pwm1_store(struct device *dev,
-			      struct device_attribute *attr,
-			      const char *buf, size_t count)
+static ssize_t pwm1_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	unsigned long s;
 	int rc;
@@ -8198,12 +8198,12 @@ static ssize_t fan_pwm1_store(struct device *de=
v,
 	return (rc) ? rc : count;
 }
=20
-static DEVICE_ATTR_RW(fan_pwm1);
+static DEVICE_ATTR_RW(pwm1);
=20
 /* sysfs fan fan1_input ----------------------------------------------=
-- */
-static ssize_t fan_fan1_input_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buf)
+static ssize_t fan1_input_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
 {
 	int res;
 	unsigned int speed;
@@ -8215,12 +8215,12 @@ static ssize_t fan_fan1_input_show(struct devic=
e *dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", speed);
 }
=20
-static DEVICE_ATTR_RO(fan_fan1_input);
+static DEVICE_ATTR_RO(fan1_input);
=20
 /* sysfs fan fan2_input ----------------------------------------------=
-- */
-static ssize_t fan_fan2_input_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buf)
+static ssize_t fan2_input_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
 {
 	int res;
 	unsigned int speed;
@@ -8232,7 +8232,7 @@ static ssize_t fan_fan2_input_show(struct device =
*dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", speed);
 }
=20
-static DEVICE_ATTR_RO(fan_fan2_input);
+static DEVICE_ATTR_RO(fan2_input);
=20
 /* sysfs fan fan_watchdog (hwmon driver) -----------------------------=
-- */
 static ssize_t fan_fan_watchdog_show(struct device_driver *drv,
@@ -8265,8 +8265,8 @@ static DRIVER_ATTR(fan_watchdog, S_IWUSR | S_IRUG=
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
@@ -8400,7 +8400,7 @@ static int __init fan_init(struct ibm_init_struct=
 *iibm)
 		if (tp_features.second_fan) {
 			/* attach second fan tachometer */
 			fan_attributes[ARRAY_SIZE(fan_attributes)-2] =3D
-					&dev_attr_fan_fan2_input.attr;
+					&dev_attr_fan2_input.attr;
 		}
 		rc =3D sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
 					 &fan_attr_group);
@@ -8841,14 +8841,14 @@ static void hotkey_driver_event(const unsigned =
int scancode)
 }
=20
 /* sysfs name --------------------------------------------------------=
-- */
-static ssize_t thinkpad_acpi_pdev_name_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buf)
+static ssize_t name_show(struct device *dev,
+			 struct device_attribute *attr,
+			 char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%s\n", TPACPI_NAME);
 }
=20
-static DEVICE_ATTR_RO(thinkpad_acpi_pdev_name);
+static DEVICE_ATTR_RO(name);
=20
 /* -------------------------------------------------------------------=
-- */
=20
@@ -9390,8 +9390,7 @@ static void thinkpad_acpi_module_exit(void)
 		hwmon_device_unregister(tpacpi_hwmon);
=20
 	if (tp_features.sensors_pdev_attrs_registered)
-		device_remove_file(&tpacpi_sensors_pdev->dev,
-				   &dev_attr_thinkpad_acpi_pdev_name);
+		device_remove_file(&tpacpi_sensors_pdev->dev, &dev_attr_name);
 	if (tpacpi_sensors_pdev)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	if (tpacpi_pdev)
@@ -9512,8 +9511,7 @@ static int __init thinkpad_acpi_module_init(void)
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
