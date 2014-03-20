From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 02/11] sony-laptop: Add support for lid resume settings on Vaio Pro
Date: Fri, 21 Mar 2014 08:01:13 +0900
Message-ID: <1395356482-7446-3-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42149 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759695AbaCTXJN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:13 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

Vaio Pro uses a different handle and doesn't support all the options as
other models (only S5 setting v/s S3/4/5).

Minor code rework to generalize functions by Mattia Dongili.

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 110 +++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 48 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index fe5424c..de17390 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -152,7 +152,8 @@ static void sony_nc_battery_care_cleanup(struct platform_device *pd);
 static int sony_nc_thermal_setup(struct platform_device *pd);
 static void sony_nc_thermal_cleanup(struct platform_device *pd);
 
-static int sony_nc_lid_resume_setup(struct platform_device *pd);
+static int sony_nc_lid_resume_setup(struct platform_device *pd,
+				    unsigned int handle);
 static void sony_nc_lid_resume_cleanup(struct platform_device *pd);
 
 static int sony_nc_gfx_switch_setup(struct platform_device *pd,
@@ -1341,7 +1342,8 @@ static void sony_nc_function_setup(struct acpi_device *device,
 						result);
 			break;
 		case 0x0119:
-			result = sony_nc_lid_resume_setup(pf_device);
+		case 0x015D:
+			result = sony_nc_lid_resume_setup(pf_device, handle);
 			if (result)
 				pr_err("couldn't set up lid resume function (%d)\n",
 						result);
@@ -1422,6 +1424,7 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 			sony_nc_battery_care_cleanup(pd);
 			break;
 		case 0x0119:
+		case 0x015D:
 			sony_nc_lid_resume_cleanup(pd);
 			break;
 		case 0x0122:
@@ -2223,9 +2226,14 @@ static void sony_nc_thermal_resume(void)
 #endif
 
 /* resume on LID open */
+#define LID_RESUME_S5	0
+#define LID_RESUME_S4	1
+#define LID_RESUME_S3	2
+#define LID_RESUME_MAX	3
 struct snc_lid_resume_control {
-	struct device_attribute attrs[3];
+	struct device_attribute attrs[LID_RESUME_MAX];
 	unsigned int status;
+	int handle;
 };
 static struct snc_lid_resume_control *lid_ctl;
 
@@ -2233,8 +2241,9 @@ static ssize_t sony_nc_lid_resume_store(struct device *dev,
 					struct device_attribute *attr,
 					const char *buffer, size_t count)
 {
-	unsigned int result, pos;
+	unsigned int result;
 	unsigned long value;
+	unsigned int pos = LID_RESUME_S5;
 	if (count > 31)
 		return -EINVAL;
 
@@ -2247,21 +2256,21 @@ static ssize_t sony_nc_lid_resume_store(struct device *dev,
 	 * +--------------+
 	 *   2    1    0
 	 */
-	if (strcmp(attr->attr.name, "lid_resume_S3") == 0)
-		pos = 2;
-	else if (strcmp(attr->attr.name, "lid_resume_S4") == 0)
-		pos = 1;
-	else if (strcmp(attr->attr.name, "lid_resume_S5") == 0)
-		pos = 0;
-	else
-               return -EINVAL;
+	while (pos < LID_RESUME_MAX) {
+		if (&lid_ctl->attrs[pos].attr == &attr->attr)
+			break;
+		pos++;
+	}
+	if (pos == LID_RESUME_MAX)
+		return -EINVAL;
 
 	if (value)
 		value = lid_ctl->status | (1 << pos);
 	else
 		value = lid_ctl->status & ~(1 << pos);
 
-	if (sony_call_snc_handle(0x0119, value << 0x10 | 0x0100, &result))
+	if (sony_call_snc_handle(lid_ctl->handle, value << 0x10 | 0x0100,
+				&result))
 		return -EIO;
 
 	lid_ctl->status = value;
@@ -2270,29 +2279,27 @@ static ssize_t sony_nc_lid_resume_store(struct device *dev,
 }
 
 static ssize_t sony_nc_lid_resume_show(struct device *dev,
-				       struct device_attribute *attr, char *buffer)
+					struct device_attribute *attr,
+					char *buffer)
 {
-	unsigned int pos;
-
-	if (strcmp(attr->attr.name, "lid_resume_S3") == 0)
-		pos = 2;
-	else if (strcmp(attr->attr.name, "lid_resume_S4") == 0)
-		pos = 1;
-	else if (strcmp(attr->attr.name, "lid_resume_S5") == 0)
-		pos = 0;
-	else
-		return -EINVAL;
-	       
-	return snprintf(buffer, PAGE_SIZE, "%d\n",
-			(lid_ctl->status >> pos) & 0x01);
+	unsigned int pos = LID_RESUME_S5;
+
+	while (pos < LID_RESUME_MAX) {
+		if (&lid_ctl->attrs[pos].attr == &attr->attr)
+			return snprintf(buffer, PAGE_SIZE, "%d\n",
+					(lid_ctl->status >> pos) & 0x01);
+		pos++;
+	}
+	return -EINVAL;
 }
 
-static int sony_nc_lid_resume_setup(struct platform_device *pd)
+static int sony_nc_lid_resume_setup(struct platform_device *pd,
+					unsigned int handle)
 {
 	unsigned int result;
 	int i;
 
-	if (sony_call_snc_handle(0x0119, 0x0000, &result))
+	if (sony_call_snc_handle(handle, 0x0000, &result))
 		return -EIO;
 
 	lid_ctl = kzalloc(sizeof(struct snc_lid_resume_control), GFP_KERNEL);
@@ -2300,26 +2307,29 @@ static int sony_nc_lid_resume_setup(struct platform_device *pd)
 		return -ENOMEM;
 
 	lid_ctl->status = result & 0x7;
+	lid_ctl->handle = handle;
 
 	sysfs_attr_init(&lid_ctl->attrs[0].attr);
-	lid_ctl->attrs[0].attr.name = "lid_resume_S3";
-	lid_ctl->attrs[0].attr.mode = S_IRUGO | S_IWUSR;
-	lid_ctl->attrs[0].show = sony_nc_lid_resume_show;
-	lid_ctl->attrs[0].store = sony_nc_lid_resume_store;
-
-	sysfs_attr_init(&lid_ctl->attrs[1].attr);
-	lid_ctl->attrs[1].attr.name = "lid_resume_S4";
-	lid_ctl->attrs[1].attr.mode = S_IRUGO | S_IWUSR;
-	lid_ctl->attrs[1].show = sony_nc_lid_resume_show;
-	lid_ctl->attrs[1].store = sony_nc_lid_resume_store;
-
-	sysfs_attr_init(&lid_ctl->attrs[2].attr);
-	lid_ctl->attrs[2].attr.name = "lid_resume_S5";
-	lid_ctl->attrs[2].attr.mode = S_IRUGO | S_IWUSR;
-	lid_ctl->attrs[2].show = sony_nc_lid_resume_show;
-	lid_ctl->attrs[2].store = sony_nc_lid_resume_store;
-
-	for (i = 0; i < 3; i++) {
+	lid_ctl->attrs[LID_RESUME_S5].attr.name = "lid_resume_S5";
+	lid_ctl->attrs[LID_RESUME_S5].attr.mode = S_IRUGO | S_IWUSR;
+	lid_ctl->attrs[LID_RESUME_S5].show = sony_nc_lid_resume_show;
+	lid_ctl->attrs[LID_RESUME_S5].store = sony_nc_lid_resume_store;
+
+	if (handle == 0x0119) {
+		sysfs_attr_init(&lid_ctl->attrs[1].attr);
+		lid_ctl->attrs[LID_RESUME_S4].attr.name = "lid_resume_S4";
+		lid_ctl->attrs[LID_RESUME_S4].attr.mode = S_IRUGO | S_IWUSR;
+		lid_ctl->attrs[LID_RESUME_S4].show = sony_nc_lid_resume_show;
+		lid_ctl->attrs[LID_RESUME_S4].store = sony_nc_lid_resume_store;
+
+		sysfs_attr_init(&lid_ctl->attrs[2].attr);
+		lid_ctl->attrs[LID_RESUME_S3].attr.name = "lid_resume_S3";
+		lid_ctl->attrs[LID_RESUME_S3].attr.mode = S_IRUGO | S_IWUSR;
+		lid_ctl->attrs[LID_RESUME_S3].show = sony_nc_lid_resume_show;
+		lid_ctl->attrs[LID_RESUME_S3].store = sony_nc_lid_resume_store;
+	}
+	for (i = 0; i < LID_RESUME_MAX &&
+			lid_ctl->attrs[LID_RESUME_S3].attr.name; i++) {
 		result = device_create_file(&pd->dev, &lid_ctl->attrs[i]);
 		if (result)
 			goto liderror;
@@ -2342,8 +2352,12 @@ static void sony_nc_lid_resume_cleanup(struct platform_device *pd)
 	int i;
 
 	if (lid_ctl) {
-		for (i = 0; i < 3; i++)
+		for (i = 0; i < LID_RESUME_MAX; i++) {
+			if (!lid_ctl->attrs[i].attr.name)
+				break;
+
 			device_remove_file(&pd->dev, &lid_ctl->attrs[i]);
+		}
 
 		kfree(lid_ctl);
 		lid_ctl = NULL;
-- 
1.9.0
