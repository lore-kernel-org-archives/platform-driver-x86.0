From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 20/25] sony-laptop: add fan related controls
Date: Fri, 03 Jun 2011 20:28:33 +0200
Message-ID: <4DE927D1.6000007@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:40900 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751409Ab1FCS2g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 14:28:36 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This patch exposes fan speed reading and speed selection when possible: 
a list of fan speeds is provided by the DSDT and exposed, a particular 
speed can be selected using its sequence number, while 0 corresponds to 
auto fan control.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2484,6 +2484,149 @@ static int sony_nc_touchpad_cleanup(stru
  	return 0;
  }

+#define SONY_FAN_HANDLE 0x0149
+#define FAN_SPEEDS_NUM	4	/* leave some more room */
+#define FAN_ATTRS_NUM	3
+
+struct fan_control {
+	unsigned int speeds_num;
+	unsigned int speeds[4];
+	struct device_attribute	attrs[3];
+};
+static struct fan_control *fan_handle;
+
+static ssize_t sony_nc_fan_control_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+	if (strict_strtoul(buffer, 10, &value)
+		|| value > fan_handle->speeds_num)
+		return -EINVAL;
+
+	if (sony_call_snc_handle(SONY_FAN_HANDLE,
+				(value << 0x10) | 0x0200, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_fan_control_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(SONY_FAN_HANDLE, 0x0100, &result))
+		return -EINVAL;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", result & 0xff);
+	return count;
+}
+
+static ssize_t sony_nc_fan_profiles_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < fan_handle->speeds_num; i++)
+		count += snprintf(buffer + count, PAGE_SIZE - count,
+				"%.4u ", fan_handle->speeds[i] * 100);
+
+	count += snprintf(buffer + count, PAGE_SIZE - count, "\n");
+
+	return count;
+}
+
+static ssize_t sony_nc_fan_speed_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(SONY_FAN_HANDLE, 0x0300, &result))
+		return -EINVAL;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n",
+				(result & 0xff) * 100);
+	return count;
+}
+
+static int sony_nc_fan_setup(struct platform_device *pd)
+{
+	int ret;
+	unsigned int i, found;
+	u8 list[FAN_SPEEDS_NUM * 2] = { 0 };
+
+	fan_handle = kzalloc(sizeof(struct fan_control), GFP_KERNEL);
+	if (!fan_handle)
+		return -ENOMEM;
+
+	ret = sony_call_snc_handle_buffer(SONY_FAN_HANDLE, 0x0000,
+					list, FAN_SPEEDS_NUM * 2);
+	if (ret < 0)
+		pr_info("unable to retrieve fan profiles table\n");
+
+	for (i = 0, found = 0;
+		list[i] != 0 && found < FAN_SPEEDS_NUM; i += 2, found++) {
+
+		fan_handle->speeds[found] = list[i+1];
+	}
+	fan_handle->speeds_num = found;
+
+	sysfs_attr_init(&fan_handle->attrs[0].attr);
+	fan_handle->attrs[0].attr.name = "fan_speed";
+	fan_handle->attrs[0].attr.mode = S_IRUGO;
+	fan_handle->attrs[0].show = sony_nc_fan_speed_show;
+
+	sysfs_attr_init(&fan_handle->attrs[1].attr);
+	fan_handle->attrs[1].attr.name = "fan_profiles";
+	fan_handle->attrs[1].attr.mode = S_IRUGO;
+	fan_handle->attrs[1].show = sony_nc_fan_profiles_show;
+
+	sysfs_attr_init(&fan_handle->attrs[2].attr);
+	fan_handle->attrs[2].attr.name = "fan_control";
+	fan_handle->attrs[2].attr.mode = S_IRUGO | S_IWUSR;
+	fan_handle->attrs[2].show = sony_nc_fan_control_show;
+	fan_handle->attrs[2].store = sony_nc_fan_control_store;
+
+	for (i = 0; i < FAN_ATTRS_NUM; i++) {
+		if (device_create_file(&pd->dev, &fan_handle->attrs[i]))
+			goto attrserror;
+	}
+
+	return 0;
+
+attrserror:
+	for (; i > 0; i--)
+		device_remove_file(&pd->dev, &fan_handle->attrs[i]);
+
+	kfree(fan_handle);
+	fan_handle = NULL;
+
+	return -1;
+}
+
+static int sony_nc_fan_cleanup(struct platform_device *pd)
+{
+	if (fan_handle) {
+		int i;
+
+		for (i = 0; i < FAN_ATTRS_NUM; i++)
+			device_remove_file(&pd->dev, &fan_handle->attrs[i]);
+
+		kfree(fan_handle);
+		fan_handle = NULL;
+	}
+
+	return 0;
+}
+

  static void sony_nc_backlight_ng_read_limits(int handle,
  		struct sony_backlight_props *props)
@@ -2650,6 +2793,9 @@ static void sony_nc_snc_setup_handles(st
  			sony_gs_handle = handle;
  			ret = sony_nc_gsensor_setup(pd);
  			break;
+		case 0x0149:
+			ret = sony_nc_fan_setup(pd);
+			break;
  		case 0x0124:
  		case 0x0135:
  			sony_rfkill_handle = handle;
@@ -2708,6 +2854,9 @@ static void sony_nc_snc_cleanup_handles(
  		case 0x0147:
  			sony_nc_gsensor_cleanup(pd);
  			break;
+		case 0x0149:
+			sony_nc_fan_cleanup(pd);
+			break;
  		case 0x0124:
  		case 0x0135:
  			sony_nc_rfkill_cleanup();
