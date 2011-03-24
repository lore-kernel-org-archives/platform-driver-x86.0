From: Andy Ross <andy.ross@windriver.com>
Subject: [PATCH 2/4] asus-laptop: Pegatron Lucid ALS sensor
Date: Thu, 24 Mar 2011 15:02:08 -0700
Message-ID: <1301004130-3294-3-git-send-email-andy.ross@windriver.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from li44-10.members.linode.com ([72.14.181.10]:44869 "EHLO
	plausible.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757300Ab1CXWIj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 18:08:39 -0400
In-Reply-To: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Ambient light sensor for Pegatron Lucid.  Supports pre-existing
ls_switch sysfs interface to en/disable automatic control, and exports
the brightness from the device as "ls_value".

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 drivers/platform/x86/asus-laptop.c |   70 +++++++++++++++++++++++++++++++++---
 1 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index ec46d71..6651d8c 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -214,9 +214,15 @@ static char *display_get_paths[] = {
 
 /* For Pegatron Lucid tablet */
 #define DEVICE_NAME_PEGA	"Lucid"
+
 #define METHOD_PEGA_ENABLE	"ENPR"
 #define METHOD_PEGA_DISABLE	"DAPR"
+#define PEGA_ALS	0x04
+#define PEGA_ALS_POWER	0x05
+
 #define METHOD_PEGA_READ	"RDLN"
+#define PEGA_READ_ALS_H	0x02
+#define PEGA_READ_ALS_L	0x03
 
 /*
  * Define a specific led structure to keep the main structure clean
@@ -378,6 +384,12 @@ static bool asus_check_pega_lucid(struct asus_laptop *asus)
 	   !acpi_check_handle(asus->handle, METHOD_PEGA_READ, NULL);
 }
 
+static int asus_pega_lucid_set(struct asus_laptop *asus, int unit, bool enable)
+{
+	char *method = enable ? METHOD_PEGA_ENABLE : METHOD_PEGA_DISABLE;
+	return write_acpi_int(asus->handle, method, unit);
+}
+
 /* Generic LED function */
 static int asus_led_set(struct asus_laptop *asus, const char *method,
 			 int value)
@@ -1046,7 +1058,15 @@ static ssize_t store_disp(struct device *dev, struct device_attribute *attr,
  */
 static void asus_als_switch(struct asus_laptop *asus, int value)
 {
-	if (write_acpi_int(asus->handle, METHOD_ALS_CONTROL, value))
+	int ret;
+	if (asus->have_pega_lucid) {
+		ret = asus_pega_lucid_set(asus, PEGA_ALS, value);
+		if (!ret)
+			ret = asus_pega_lucid_set(asus, PEGA_ALS_POWER, value);
+	} else {
+		ret = write_acpi_int(asus->handle, METHOD_ALS_CONTROL, value);
+	}
+	if (ret)
 		pr_warning("Error setting light sensor switch\n");
 	asus->light_switch = value;
 }
@@ -1103,6 +1123,35 @@ static ssize_t store_lslvl(struct device *dev, struct device_attribute *attr,
 	return rv;
 }
 
+static int pega_int_read(struct asus_laptop *asus, int arg, int *result)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	int err = write_acpi_int_ret(asus->handle, METHOD_PEGA_READ, arg,
+				     &buffer);
+	if (!err) {
+		union acpi_object *obj = buffer.pointer;
+		if (obj && obj->type == ACPI_TYPE_INTEGER)
+			*result = obj->integer.value;
+		else
+			err = -EIO;
+	}
+	return err;
+}
+
+static ssize_t show_lsvalue(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct asus_laptop *asus = dev_get_drvdata(dev);
+	int err, hi, lo;
+
+	err = pega_int_read(asus, PEGA_READ_ALS_H, &hi);
+	if (!err)
+		err = pega_int_read(asus, PEGA_READ_ALS_L, &lo);
+	if (!err)
+		return sprintf(buf, "%d\n", 10 * hi + lo);
+	return err;
+}
+
 /*
  * GPS
  */
@@ -1300,6 +1349,7 @@ static DEVICE_ATTR(wimax, S_IRUGO | S_IWUSR, show_wimax, store_wimax);
 static DEVICE_ATTR(wwan, S_IRUGO | S_IWUSR, show_wwan, store_wwan);
 static DEVICE_ATTR(display, S_IRUGO | S_IWUSR, show_disp, store_disp);
 static DEVICE_ATTR(ledd, S_IRUGO | S_IWUSR, show_ledd, store_ledd);
+static DEVICE_ATTR(ls_value, S_IRUGO, show_lsvalue, NULL);
 static DEVICE_ATTR(ls_level, S_IRUGO | S_IWUSR, show_lslvl, store_lslvl);
 static DEVICE_ATTR(ls_switch, S_IRUGO | S_IWUSR, show_lssw, store_lssw);
 static DEVICE_ATTR(gps, S_IRUGO | S_IWUSR, show_gps, store_gps);
@@ -1312,6 +1362,7 @@ static struct attribute *asus_attributes[] = {
 	&dev_attr_wwan.attr,
 	&dev_attr_display.attr,
 	&dev_attr_ledd.attr,
+	&dev_attr_ls_value.attr,
 	&dev_attr_ls_level.attr,
 	&dev_attr_ls_switch.attr,
 	&dev_attr_gps.attr,
@@ -1349,8 +1400,15 @@ static mode_t asus_sysfs_is_visible(struct kobject *kobj,
 
 	} else if (attr == &dev_attr_ls_switch.attr ||
 		   attr == &dev_attr_ls_level.attr) {
-		supported = !acpi_check_handle(handle, METHOD_ALS_CONTROL, NULL) &&
-			    !acpi_check_handle(handle, METHOD_ALS_LEVEL, NULL);
+		if (asus->have_pega_lucid) {
+			/* no ls_level interface on the Lucid */
+			supported = attr == &dev_attr_ls_switch.attr;
+		} else {
+			supported = !acpi_check_handle(handle, METHOD_ALS_CONTROL, NULL) &&
+				    !acpi_check_handle(handle, METHOD_ALS_LEVEL, NULL);
+		}
+	} else if (attr == &dev_attr_ls_value.attr) {
+		supported = asus->have_pega_lucid;
 	} else if (attr == &dev_attr_gps.attr) {
 		supported = !acpi_check_handle(handle, METHOD_GPS_ON, NULL) &&
 			    !acpi_check_handle(handle, METHOD_GPS_OFF, NULL) &&
@@ -1562,8 +1620,10 @@ static int __devinit asus_acpi_init(struct asus_laptop *asus)
 	asus->light_switch = 0;	/* Default to light sensor disabled */
 	asus->light_level = 5;	/* level 5 for sensor sensitivity */
 
-	if (!acpi_check_handle(asus->handle, METHOD_ALS_CONTROL, NULL) &&
-	    !acpi_check_handle(asus->handle, METHOD_ALS_LEVEL, NULL)) {
+	if (asus->have_pega_lucid) {
+		asus_als_switch(asus, asus->light_switch);
+	} else if (!acpi_check_handle(asus->handle, METHOD_ALS_CONTROL, NULL) &&
+		   !acpi_check_handle(asus->handle, METHOD_ALS_LEVEL, NULL)) {
 		asus_als_switch(asus, asus->light_switch);
 		asus_als_level(asus, asus->light_level);
 	}
-- 
1.7.1
