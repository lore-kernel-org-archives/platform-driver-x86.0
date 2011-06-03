From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 15/25] sony-laptop: add thermal control feature
Date: Fri, 03 Jun 2011 19:33:29 +0200
Message-ID: <4DE91AE9.9050500@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:34483 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853Ab1FCRde (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 13:33:34 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This feature is present on many Vaio notebooks and allows to choose 
between different thermal profiles (performance, silent, balanced) 
depending on the notebook capability.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1748,6 +1748,166 @@ static int sony_nc_battery_care_cleanup(
  	return 0;
  }

+struct thermal_ctrl {
+	unsigned int mode;
+	unsigned int profiles;
+	struct device_attribute mode_attr;
+	struct device_attribute profiles_attr;
+};
+static struct thermal_ctrl *th_handle;
+
+static int sony_nc_thermal_mode_set(unsigned int profile)
+{
+	unsigned int cmd, result;
+
+	/* to avoid the 1 value hole when only 2 profiles are available */
+	switch (profile) {
+	case 1: /* performance */
+		cmd = 2;
+		break;
+	case 2: /* silent */
+		cmd = 1;
+		break;
+	default: /* balanced */
+		cmd = 0;
+		break;
+	}
+
+	if (sony_call_snc_handle(0x0122, cmd << 0x10 | 0x0200, &result))
+		return -EIO;
+
+	th_handle->mode = profile;
+
+	return 0;
+}
+
+static int sony_nc_thermal_mode_get(unsigned int *profile)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0122, 0x0100, &result))
+		return -EIO;
+
+	/* to avoid the 1 value hole when only 2 profiles are available */
+	switch (result & 0xff) {
+	case 2: /* performance */
+		*profile = 1;
+		break;
+	case 1: /* silent */
+		*profile = 2;
+		break;
+	default: /* balanced */
+		*profile = 0;
+		break;
+	}
+
+	return 0;
+}
+
+static ssize_t sony_nc_thermal_profiles_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	return snprintf(buffer, PAGE_SIZE, "%u\n", th_handle->profiles);
+}
+
+static ssize_t sony_nc_thermal_mode_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+	if (strict_strtoul(buffer, 10, &value) ||
+		value > (th_handle->profiles - 1))
+		return -EINVAL;
+
+	if (sony_nc_thermal_mode_set(value))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_thermal_mode_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int profile;
+
+	if (sony_nc_thermal_mode_get(&profile))
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", profile);
+
+	return count;
+}
+
+static int sony_nc_thermal_setup(struct platform_device *pd)
+{
+	th_handle = kzalloc(sizeof(struct thermal_ctrl), GFP_KERNEL);
+	if (!th_handle)
+		return -ENOMEM;
+
+	if (sony_call_snc_handle(0x0122, 0x0000, &th_handle->profiles)) {
+		pr_warn("unable to retrieve the available profiles\n");
+		goto outkzalloc;
+	}
+
+	if (sony_nc_thermal_mode_get(&th_handle->mode)) {
+		pr_warn("unable to retrieve the current profile");
+		goto outkzalloc;
+	}
+
+	sysfs_attr_init(&th_handle->profiles_attr.attr);
+	th_handle->profiles_attr.attr.name = "thermal_profiles";
+	th_handle->profiles_attr.attr.mode = S_IRUGO;
+	th_handle->profiles_attr.show = sony_nc_thermal_profiles_show;
+
+	sysfs_attr_init(&th_handle->mode_attr.attr);
+	th_handle->mode_attr.attr.name = "thermal_control";
+	th_handle->mode_attr.attr.mode = S_IRUGO | S_IWUSR;
+	th_handle->mode_attr.show = sony_nc_thermal_mode_show;
+	th_handle->mode_attr.store = sony_nc_thermal_mode_store;
+
+	if (device_create_file(&pd->dev, &th_handle->profiles_attr))
+		goto outkzalloc;
+
+	if (device_create_file(&pd->dev, &th_handle->mode_attr))
+		goto outprofiles;
+
+	return 0;
+
+outprofiles:
+	device_remove_file(&pd->dev, &th_handle->profiles_attr);
+outkzalloc:
+	kfree(th_handle);
+	th_handle = NULL;
+	return -1;
+}
+
+static int sony_nc_thermal_cleanup(struct platform_device *pd)
+{
+	if (th_handle) {
+		device_remove_file(&pd->dev, &th_handle->profiles_attr);
+		device_remove_file(&pd->dev, &th_handle->mode_attr);
+		kfree(th_handle);
+		th_handle = NULL;
+	}
+
+	return 0;
+}
+
+static void sony_nc_thermal_resume(void)
+{
+	unsigned int status;
+
+	sony_nc_thermal_mode_get(&status);
+
+	if (status != th_handle->mode)
+		sony_nc_thermal_mode_set(th_handle->mode);
+}
+
+
  static void sony_nc_backlight_ng_read_limits(int handle,
  		struct sony_backlight_props *props)
  {
@@ -1889,6 +2049,9 @@ static void sony_nc_snc_setup_handles(st
  			sony_bc_handle = handle;
  			ret = sony_nc_battery_care_setup(pd);
  			break;
+		case 0x0122:
+			ret = sony_nc_thermal_setup(pd);
+			break;
  		case 0x0137:
  		case 0x0143:
  			sony_kbd_handle = handle;
@@ -1931,6 +2094,9 @@ static void sony_nc_snc_cleanup_handles(
  		case 0x013f:
  			sony_nc_battery_care_cleanup(pd);
  			break;
+		case 0x0122:
+			sony_nc_thermal_cleanup(pd);
+			break;
  		case 0x0137:
  		case 0x0143:
  			sony_nc_kbd_backlight_cleanup(pd);
@@ -2031,6 +2197,9 @@ static int sony_nc_snc_resume(void)
  		case 0x0102:
  			sony_nc_function_setup(handle);
  			break;
+		case 0x0122:
+			sony_nc_thermal_resume();
+			break;
  		case 0x0124:
  		case 0x0135:
  			/* re-read rfkill state */
