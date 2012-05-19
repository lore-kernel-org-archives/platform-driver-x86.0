From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 12/19] sony-laptop: add high speed battery charging function
Date: Sat, 19 May 2012 22:35:55 +0900
Message-ID: <1337434562-12283-13-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47649 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758777Ab2ESNpQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:16 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 4a4ecfa..f4dfdb0 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -155,6 +155,9 @@ static void sony_nc_thermal_resume(void);
 static int sony_nc_lid_resume_setup(struct platform_device *pd);
 static void sony_nc_lid_resume_cleanup(struct platform_device *pd);
 
+static int sony_nc_highspeed_charging_setup(struct platform_device *pd);
+static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd);
+
 struct gsensor_control {
 	int handle;
 	unsigned int attrs_num;
@@ -1318,6 +1321,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up thermal profile function (%d)\n",
 						result);
 			break;
+		case 0x0131:
+			result = sony_nc_highspeed_charging_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up high speed charging function (%d)\n",
+						result);
+			break;
 		case 0x0134:
 		case 0x0147:
 			result = sony_nc_gsensor_setup(pf_device, handle);
@@ -1372,6 +1381,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0122:
 			sony_nc_thermal_cleanup(pd);
 			break;
+		case 0x0131:
+			sony_nc_highspeed_charging_cleanup(pd);
+			break;
 		case 0x0134:
 		case 0x0147:
 			sony_nc_gsensor_cleanup(pd);
@@ -2623,6 +2635,80 @@ static void sony_nc_lid_resume_cleanup(struct platform_device *pd)
 	}
 }
 
+/* High speed charging function */
+static struct device_attribute *hsc_handle;
+
+static ssize_t sony_nc_highspeed_charging_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+
+	if (kstrtoul(buffer, 10, &value) || value > 1)
+		return -EINVAL;
+
+	if (sony_call_snc_handle(0x0131, value << 0x10 | 0x0200, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_highspeed_charging_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0131, 0x0100, &result))
+		return -EIO;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", result & 0x01);
+}
+
+static int sony_nc_highspeed_charging_setup(struct platform_device *pd)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0131, 0x0000, &result) || !(result & 0x01)) {
+		/* some models advertise the handle but have no implementation
+		 * for it
+		 */
+		pr_info("No High Speed Charging capability found\n");
+		return 0;
+	}
+
+	hsc_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!hsc_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&hsc_handle->attr);
+	hsc_handle->attr.name = "battery_highspeed_charging";
+	hsc_handle->attr.mode = S_IRUGO | S_IWUSR;
+	hsc_handle->show = sony_nc_highspeed_charging_show;
+	hsc_handle->store = sony_nc_highspeed_charging_store;
+
+	result = device_create_file(&pd->dev, hsc_handle);
+	if (result) {
+		kfree(hsc_handle);
+		hsc_handle = NULL;
+		return result;
+	}
+
+	return 0;
+}
+
+static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd)
+{
+	if (hsc_handle) {
+		device_remove_file(&pd->dev, hsc_handle);
+		kfree(hsc_handle);
+		hsc_handle = NULL;
+	}
+}
+
 static void sony_nc_backlight_ng_read_limits(int handle,
 		struct sony_backlight_props *props)
 {
-- 
1.7.10
