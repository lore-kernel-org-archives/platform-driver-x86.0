From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 17/19] sony-laptop: add touchpad enable/disable function
Date: Sat, 19 May 2012 22:36:00 +0900
Message-ID: <1337434562-12283-18-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47643 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756353Ab2ESNpM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:12 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

This setting is stored in the EC and available across reboots.

[malattia@linux.it: group function specific variables in a struct, use
kstrtoul]

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   91 ++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 2614262..3a95855 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -159,6 +159,10 @@ static void sony_nc_lid_resume_cleanup(struct platform_device *pd);
 static int sony_nc_highspeed_charging_setup(struct platform_device *pd);
 static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd);
 
+static int sony_nc_touchpad_setup(struct platform_device *pd,
+		unsigned int handle);
+static void sony_nc_touchpad_cleanup(struct platform_device *pd);
+
 struct gsensor_control {
 	int handle;
 	unsigned int attrs_num;
@@ -1368,6 +1372,14 @@ static void sony_nc_function_setup(struct acpi_device *device,
 			/* setup hotkeys */
 			sony_call_snc_handle(handle, 0x100, &result);
 			break;
+		case 0x0105:
+		case 0x0148:
+			/* touchpad enable/disable */
+			result = sony_nc_touchpad_setup(pf_device, handle);
+			if (result)
+				pr_err("couldn't set up touchpad control function (%d)\n",
+						result);
+			break;
 		case 0x0115:
 		case 0x0136:
 		case 0x013f:
@@ -1452,6 +1464,10 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 			continue;
 
 		switch (handle) {
+		case 0x0105:
+		case 0x0148:
+			sony_nc_touchpad_cleanup(pd);
+			break;
 		case 0x0115:
 		case 0x0136:
 		case 0x013f:
@@ -3675,6 +3691,81 @@ static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd)
 	}
 }
 
+/* Touchpad enable/disable */
+struct touchpad_control {
+	struct device_attribute attr;
+	int handle;
+};
+static struct touchpad_control *tp_ctl;
+
+static ssize_t sony_nc_touchpad_store(struct device *dev,
+		struct device_attribute *attr, const char *buffer, size_t count)
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
+	/* sysfs: 0 disabled, 1 enabled
+	 * EC: 0 enabled, 1 disabled
+	 */
+	if (sony_call_snc_handle(tp_ctl->handle,
+				(!value << 0x10) | 0x100, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_touchpad_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(tp_ctl->handle, 0x000, &result))
+		return -EINVAL;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", !(result & 0x01));
+}
+
+static int sony_nc_touchpad_setup(struct platform_device *pd,
+		unsigned int handle)
+{
+	int ret = 0;
+
+	tp_ctl = kzalloc(sizeof(struct touchpad_control), GFP_KERNEL);
+	if (!tp_ctl)
+		return -ENOMEM;
+
+	tp_ctl->handle = handle;
+
+	sysfs_attr_init(&tp_ctl->attr.attr);
+	tp_ctl->attr.attr.name = "touchpad";
+	tp_ctl->attr.attr.mode = S_IRUGO | S_IWUSR;
+	tp_ctl->attr.show = sony_nc_touchpad_show;
+	tp_ctl->attr.store = sony_nc_touchpad_store;
+
+	ret = device_create_file(&pd->dev, &tp_ctl->attr);
+	if (ret) {
+		kfree(tp_ctl);
+		tp_ctl = NULL;
+	}
+
+	return ret;
+}
+
+static void sony_nc_touchpad_cleanup(struct platform_device *pd)
+{
+	if (tp_ctl) {
+		device_remove_file(&pd->dev, &tp_ctl->attr);
+		kfree(tp_ctl);
+		tp_ctl = NULL;
+	}
+}
+
 static void sony_nc_backlight_ng_read_limits(int handle,
 		struct sony_backlight_props *props)
 {
-- 
1.7.10
