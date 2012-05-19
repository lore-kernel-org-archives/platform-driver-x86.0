From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 08/19] sony-laptop: add thermal profiles support
Date: Sat, 19 May 2012 22:35:51 +0900
Message-ID: <1337434562-12283-9-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47644 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756416Ab2ESNpM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:12 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

[malattia@linux.it: support string based profiles names]

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  183 ++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 0ac186e9..c3f54ad 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -148,6 +148,10 @@ static int sony_nc_battery_care_setup(struct platform_device *pd,
 		unsigned int handle);
 static void sony_nc_battery_care_cleanup(struct platform_device *pd);
 
+static int sony_nc_thermal_setup(struct platform_device *pd);
+static void sony_nc_thermal_cleanup(struct platform_device *pd);
+static void sony_nc_thermal_resume(void);
+
 enum sony_nc_rfkill {
 	SONY_WIFI,
 	SONY_BLUETOOTH,
@@ -1282,6 +1286,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up battery care function (%d)\n",
 						result);
 			break;
+		case 0x0122:
+			result = sony_nc_thermal_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up thermal profile function (%d)\n",
+						result);
+			break;
 		case 0x0124:
 		case 0x0135:
 			sony_nc_rfkill_setup(device);
@@ -1323,6 +1333,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x013f:
 			sony_nc_battery_care_cleanup(pd);
 			break;
+		case 0x0122:
+			sony_nc_thermal_cleanup(pd);
+			break;
 		case 0x0124:
 		case 0x0135:
 			sony_nc_rfkill_cleanup();
@@ -1362,6 +1375,9 @@ static void sony_nc_function_resume(void)
 			/* re-enable hotkeys */
 			sony_call_snc_handle(handle, 0x100, &result);
 			break;
+		case 0x0122:
+			sony_nc_thermal_resume();
+			break;
 		case 0x0124:
 		case 0x0135:
 			sony_nc_rfkill_update();
@@ -1923,6 +1939,173 @@ static void sony_nc_battery_care_cleanup(struct platform_device *pd)
 	}
 }
 
+struct snc_thermal_ctrl {
+	unsigned int mode;
+	unsigned int profiles;
+	struct device_attribute mode_attr;
+	struct device_attribute profiles_attr;
+};
+static struct snc_thermal_ctrl *th_handle;
+
+#define THM_PROFILE_MAX 3
+static const char * const snc_thermal_profiles[] = {
+	"balanced",
+	"silent",
+	"performance"
+};
+
+static int sony_nc_thermal_mode_set(unsigned short mode)
+{
+	unsigned int result;
+
+	/* the thermal profile seems to be a two bit bitmask:
+	 * lsb -> silent
+	 * msb -> performance
+	 * no bit set is the normal operation and is always valid
+	 * Some vaio models only have "balanced" and "performance"
+	 */
+	if ((mode && !(th_handle->profiles & mode)) || mode >= THM_PROFILE_MAX)
+		return -EINVAL;
+
+	if (sony_call_snc_handle(0x0122, mode << 0x10 | 0x0200, &result))
+		return -EIO;
+
+	th_handle->mode = mode;
+
+	return 0;
+}
+
+static int sony_nc_thermal_mode_get(void)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0122, 0x0100, &result))
+		return -EIO;
+
+	return result & 0xff;
+}
+
+static ssize_t sony_nc_thermal_profiles_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	short cnt;
+	size_t idx = 0;
+
+	for (cnt = 0; cnt < THM_PROFILE_MAX; cnt++) {
+		if (!cnt || (th_handle->profiles & cnt))
+			idx += snprintf(buffer + idx, PAGE_SIZE - idx, "%s ",
+					snc_thermal_profiles[cnt]);
+	}
+	idx += snprintf(buffer + idx, PAGE_SIZE - idx, "\n");
+
+	return idx;
+}
+
+static ssize_t sony_nc_thermal_mode_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned short cmd;
+	size_t len = count;
+
+	if (count == 0)
+		return -EINVAL;
+
+	/* skip the newline if present */
+	if (buffer[len - 1] == '\n')
+		len--;
+
+	for (cmd = 0; cmd < THM_PROFILE_MAX; cmd++)
+		if (strncmp(buffer, snc_thermal_profiles[cmd], len) == 0)
+			break;
+
+	if (sony_nc_thermal_mode_set(cmd))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_thermal_mode_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int mode = sony_nc_thermal_mode_get();
+
+	if (mode < 0)
+		return mode;
+
+	count = snprintf(buffer, PAGE_SIZE, "%s\n", snc_thermal_profiles[mode]);
+
+	return count;
+}
+
+static int sony_nc_thermal_setup(struct platform_device *pd)
+{
+	int ret = 0;
+	th_handle = kzalloc(sizeof(struct snc_thermal_ctrl), GFP_KERNEL);
+	if (!th_handle)
+		return -ENOMEM;
+
+	ret = sony_call_snc_handle(0x0122, 0x0000, &th_handle->profiles);
+	if (ret) {
+		pr_warn("couldn't to read the thermal profiles\n");
+		goto outkzalloc;
+	}
+
+	ret = sony_nc_thermal_mode_get();
+	if (ret < 0) {
+		pr_warn("couldn't to read the current thermal profile");
+		goto outkzalloc;
+	}
+	th_handle->mode = ret;
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
+	ret = device_create_file(&pd->dev, &th_handle->profiles_attr);
+	if (ret)
+		goto outkzalloc;
+
+	ret = device_create_file(&pd->dev, &th_handle->mode_attr);
+	if (ret)
+		goto outprofiles;
+
+	return 0;
+
+outprofiles:
+	device_remove_file(&pd->dev, &th_handle->profiles_attr);
+outkzalloc:
+	kfree(th_handle);
+	th_handle = NULL;
+	return ret;
+}
+
+static void sony_nc_thermal_cleanup(struct platform_device *pd)
+{
+	if (th_handle) {
+		device_remove_file(&pd->dev, &th_handle->profiles_attr);
+		device_remove_file(&pd->dev, &th_handle->mode_attr);
+		kfree(th_handle);
+		th_handle = NULL;
+	}
+}
+
+static void sony_nc_thermal_resume(void)
+{
+	unsigned int status = sony_nc_thermal_mode_get();
+
+	if (status != th_handle->mode)
+		sony_nc_thermal_mode_set(th_handle->mode);
+}
+
 static void sony_nc_backlight_ng_read_limits(int handle,
 		struct sony_backlight_props *props)
 {
-- 
1.7.10
