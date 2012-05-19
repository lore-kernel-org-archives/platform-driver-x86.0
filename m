From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 11/19] sony-laptop: support automatic resume on lid open
Date: Sat, 19 May 2012 22:35:54 +0900
Message-ID: <1337434562-12283-12-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47650 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757562Ab2ESNpO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:14 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

A few models offer the chance to set whether to resume from S3 and/or S4
when opening the lid.

[malattia@linux.it: create three sysfs files for S3/4/5 rather than
using a single one accepting a bitmask. Support S5 since the DSDT
exports it. Use a struct to hold all the related values, caching of the
current status value rather than re-reading all the time in the sysfs
show function.]

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  141 ++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 99ce7b6..4a4ecfa 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -152,6 +152,9 @@ static int sony_nc_thermal_setup(struct platform_device *pd);
 static void sony_nc_thermal_cleanup(struct platform_device *pd);
 static void sony_nc_thermal_resume(void);
 
+static int sony_nc_lid_resume_setup(struct platform_device *pd);
+static void sony_nc_lid_resume_cleanup(struct platform_device *pd);
+
 struct gsensor_control {
 	int handle;
 	unsigned int attrs_num;
@@ -1303,6 +1306,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up battery care function (%d)\n",
 						result);
 			break;
+		case 0x0119:
+			result = sony_nc_lid_resume_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up lid resume function (%d)\n",
+						result);
+			break;
 		case 0x0122:
 			result = sony_nc_thermal_setup(pf_device);
 			if (result)
@@ -1357,6 +1366,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x013f:
 			sony_nc_battery_care_cleanup(pd);
 			break;
+		case 0x0119:
+			sony_nc_lid_resume_cleanup(pd);
+			break;
 		case 0x0122:
 			sony_nc_thermal_cleanup(pd);
 			break;
@@ -2482,6 +2494,135 @@ static void sony_nc_gsensor_cleanup(struct platform_device *pd)
 	}
 }
 
+/* resume on LID open */
+struct snc_lid_resume_control {
+	struct device_attribute attrs[3];
+	unsigned int status;
+};
+static struct snc_lid_resume_control *lid_ctl;
+
+static ssize_t sony_nc_lid_resume_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result, pos;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+
+	if (kstrtoul(buffer, 10, &value) || value > 1)
+		return -EINVAL;
+
+	/* the value we have to write to SNC is a bitmask:
+	 * +--------------+
+	 * | S3 | S4 | S5 |
+	 * +--------------+
+	 *   2    1    0
+	 */
+	if (strcmp(attr->attr.name, "lid_resume_S3") == 0)
+		pos = 2;
+	else if (strcmp(attr->attr.name, "lid_resume_S4") == 0)
+		pos = 1;
+	else if (strcmp(attr->attr.name, "lid_resume_S5") == 0)
+		pos = 0;
+	else
+		return -EINVAL;
+
+	if (value)
+		value = lid_ctl->status | (1 << pos);
+	else
+		value = lid_ctl->status & ~(1 << pos);
+
+	if (sony_call_snc_handle(0x0119, value << 0x10 | 0x0100, &result))
+		return -EIO;
+
+	lid_ctl->status = value;
+
+	return count;
+}
+
+static ssize_t sony_nc_lid_resume_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int pos;
+
+	if (strcmp(attr->attr.name, "lid_resume_S3") == 0)
+		pos = 2;
+	else if (strcmp(attr->attr.name, "lid_resume_S4") == 0)
+		pos = 1;
+	else if (strcmp(attr->attr.name, "lid_resume_S5") == 0)
+		pos = 0;
+	else
+		return -EINVAL;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n",
+			(lid_ctl->status >> pos) & 0x01);
+}
+
+static int sony_nc_lid_resume_setup(struct platform_device *pd)
+{
+	unsigned int result;
+	int i;
+
+	if (sony_call_snc_handle(0x0119, 0x0000, &result))
+		return -EIO;
+
+	lid_ctl = kzalloc(sizeof(struct snc_lid_resume_control), GFP_KERNEL);
+	if (!lid_ctl)
+		return -ENOMEM;
+
+	lid_ctl->status = result & 0x7;
+
+	sysfs_attr_init(&lid_ctl->attrs[0].attr);
+	lid_ctl->attrs[0].attr.name = "lid_resume_S3";
+	lid_ctl->attrs[0].attr.mode = S_IRUGO | S_IWUSR;
+	lid_ctl->attrs[0].show = sony_nc_lid_resume_show;
+	lid_ctl->attrs[0].store = sony_nc_lid_resume_store;
+
+	sysfs_attr_init(&lid_ctl->attrs[1].attr);
+	lid_ctl->attrs[1].attr.name = "lid_resume_S4";
+	lid_ctl->attrs[1].attr.mode = S_IRUGO | S_IWUSR;
+	lid_ctl->attrs[1].show = sony_nc_lid_resume_show;
+	lid_ctl->attrs[1].store = sony_nc_lid_resume_store;
+
+	sysfs_attr_init(&lid_ctl->attrs[2].attr);
+	lid_ctl->attrs[2].attr.name = "lid_resume_S5";
+	lid_ctl->attrs[2].attr.mode = S_IRUGO | S_IWUSR;
+	lid_ctl->attrs[2].show = sony_nc_lid_resume_show;
+	lid_ctl->attrs[2].store = sony_nc_lid_resume_store;
+
+	for (i = 0; i < 3; i++) {
+		result = device_create_file(&pd->dev, &lid_ctl->attrs[i]);
+		if (result)
+			goto liderror;
+	}
+
+	return 0;
+
+liderror:
+	for (; i > 0; i--)
+		device_remove_file(&pd->dev, &lid_ctl->attrs[i]);
+
+	kfree(lid_ctl);
+	lid_ctl = NULL;
+
+	return result;
+}
+
+static void sony_nc_lid_resume_cleanup(struct platform_device *pd)
+{
+	int i;
+
+	if (lid_ctl) {
+		for (i = 0; i < 3; i++)
+			device_remove_file(&pd->dev, &lid_ctl->attrs[i]);
+
+		kfree(lid_ctl);
+		lid_ctl = NULL;
+	}
+}
+
 static void sony_nc_backlight_ng_read_limits(int handle,
 		struct sony_backlight_props *props)
 {
-- 
1.7.10
