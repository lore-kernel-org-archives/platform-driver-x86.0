Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net [46.105.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424917A2E8
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170526; cv=none; b=K3OsU84EMr1+D+ZvFA67MlW6a39cPXYoib9wo3WrcEG1G4rhoNsp9XlLYxv/c++N7cyAUqwXFBJASW2NnWdTRMHzGf1pYJFDp+8hbwne8plX6ZZxgNLAKB8qVxYT3TRJyGji2q6z0wTP0otpcDpv7Hn6BXmZCuEOz8knVGbKS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170526; c=relaxed/simple;
	bh=6WNBYpioIX45O8cijG6qLbcm/eeZtfte6/dHFaUIAn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=noUVq/FnZNY9W+ZNrYuGRPjexMmSvjJFN8CrKH0zka9Ggnb2Ehspaiuht30V+HkmAtfoCh5c6xo9jBXd79vySjbhtl5CCLTpJ7Ae3yzo7Bc1lqOI3LsJJ5KRKNyOawAqHKimdpWdvUCz9NU/xTvFQiWCucUkVGz0mfd+cMUVDDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=l4ZMzegf; arc=none smtp.client-ip=46.105.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="l4ZMzegf"
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.140.100])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZPMds598Sz1fXY
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 14:01:53 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-dt6n8 (unknown [10.111.182.240])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 075641FEC5;
	Fri, 28 Mar 2025 14:01:52 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-dt6n8 with ESMTPSA
	id qSp9L8+r5mfPyQAA/S+2gA:T2
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 28 Mar 2025 14:01:52 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S00165206509-d666-46bb-9539-03d3b7491b77,
                    A89BE30734CE273C0743E56753A14E38265E1AE9) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com
Subject: [PATCH 1/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri, 28 Mar 2025 15:01:32 +0100
Message-ID: <20250328140132.1303512-2-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328140132.1303512-1-michal.kopec@3mdeb.com>
References: <20250328140132.1303512-1-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12380676853044284685
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedugeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgeehveejkeevkeetheeuveeiuedvieekgffgheelfefhkeduheeiudekhfefhfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=v0IW836w176WEC4ppK/OELufSXYnD3wvSwWhL7oHcXs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743170513; v=1;
 b=l4ZMzegfZYKHf/85z3Jj8GWYGAPocAlE0TTV2F6YO+UBEZuxtYALkbPHWL9oj71j85Y/T5vv
 J4xlrB3wPVzkvBUwNrtIElneFkU0Ccp4XYTieeyrOrtobMNQ4J1ozDwarcJevyGAktNA1eiX2qh
 oZhjFk/54ULIiBUUEjOFvhctiLMGkLTFWWDMPY25PstiguChjMnjQSqKpsxH9k6XzFuKnF/OlEs
 Si6YisClTjhdbbktkmwi8DqRQeUlKjIIjGtz0s6ZPlvkjlhOqP3+MtylNKto2avxqrNUooBIjFO
 82J8hwNP5rgKxcPRmDt/Fd80A9FLfOcZFPlNo7eCLWXBw==

Introduce a driver for devices running Dasharo firmware. The driver
supports thermal monitoring using a new ACPI interface in Dasharo. The
initial version supports monitoring fan speeds, fan PWM duty cycles and
system temperatures as well as determining which specific interfaces are
implemented by firmware.

It has been tested on a NovaCustom laptop running pre-release Dasharo
firmware, which implements fan and thermal monitoring for the CPU and
the discrete GPU, if present.

Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
---
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 375 ++++++++++++++++++++++++++++
 3 files changed, 388 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..8168c5274a08 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1060,6 +1060,16 @@ config LENOVO_WMI_CAMERA
 	  To compile this driver as a module, choose M here: the module
 	  will be called lenovo-wmi-camera.
 
+config DASHARO_ACPI
+	tristate "Dasharo ACPI Platform Driver"
+	depends on ACPI
+	depends on HWMON
+	help
+	  This driver provides HWMON support for devices running Dasharo
+	  firmware.
+
+	  If you have a device with Dasharo firmware, choose Y or M here.
+
 source "drivers/platform/x86/x86-android-tablets/Kconfig"
 
 config FW_ATTR_CLASS
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..3ca53ae01d93 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -110,6 +110,9 @@ obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 # Inspur
 obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+= inspur_platform_profile.o
 
+# Dasharo
+obj-$(CONFIG_DASHARO_ACPI)	+= dasharo-acpi.o
+
 # Laptop drivers
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
new file mode 100644
index 000000000000..a18e2ea52117
--- /dev/null
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Dasharo ACPI Driver
+ */
+
+#include <linux/acpi.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+enum dasharo_feature {
+	DASHARO_FEATURE_TEMPERATURE = 0,
+	DASHARO_FEATURE_FAN_PWM,
+	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_MAX,
+};
+
+enum dasharo_temperature {
+	DASHARO_TEMPERATURE_CPU_PACKAGE = 0,
+	DASHARO_TEMPERATURE_CPU_CORE,
+	DASHARO_TEMPERATURE_GPU,
+	DASHARO_TEMPERATURE_BOARD,
+	DASHARO_TEMPERATURE_CHASSIS,
+	DASHARO_TEMPERATURE_MAX,
+};
+
+enum dasharo_fan {
+	DASHARO_FAN_CPU = 0,
+	DASHARO_FAN_GPU,
+	DASHARO_FAN_CHASSIS,
+	DASHARO_FAN_MAX,
+};
+
+#define MAX_GROUPS_PER_FEAT 8
+
+static char *dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PER_FEAT] = {
+	[DASHARO_FEATURE_TEMPERATURE] = {
+		[DASHARO_TEMPERATURE_CPU_PACKAGE] = "CPU Package",
+		[DASHARO_TEMPERATURE_CPU_CORE] = "CPU Core",
+		[DASHARO_TEMPERATURE_GPU] = "GPU",
+		[DASHARO_TEMPERATURE_BOARD] = "Board",
+		[DASHARO_TEMPERATURE_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_PWM] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_TACH] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+};
+
+#define MAX_CAP_NAME_LEN 16
+
+struct dasharo_capability {
+	int cap;
+	int index;
+	char name[MAX_CAP_NAME_LEN];
+};
+
+#define MAX_CAPS_PER_FEAT 24
+
+struct dasharo_data {
+	struct acpi_device *acpi_dev;
+	int cap_counts[DASHARO_FEATURE_MAX];
+	struct dasharo_capability capabilities[DASHARO_FEATURE_MAX][MAX_CAPS_PER_FEAT];
+	struct device *hwmon;
+};
+
+static int dasharo_get_feature_cap_count(struct dasharo_data *data, int feat, int cap)
+{
+	struct acpi_object_list obj_list;
+	unsigned long long count = 0;
+	union acpi_object obj[2];
+	acpi_handle handle;
+	acpi_status status;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = feat;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = cap;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_integer(handle, "GFCP", &obj_list, &count);
+	if (!ACPI_SUCCESS(status))
+		return -ENODEV;
+
+	return count;
+}
+
+static int dasharo_read_channel(struct dasharo_data *data, char *method, int feat, int channel, long *value)
+{
+	struct acpi_object_list obj_list;
+	unsigned long long val = 0;
+	union acpi_object obj[2];
+	acpi_handle handle;
+	acpi_status status;
+
+	obj[0].type = ACPI_TYPE_INTEGER;
+	obj[0].integer.value = data->capabilities[feat][channel].cap;
+	obj[1].type = ACPI_TYPE_INTEGER;
+	obj[1].integer.value = data->capabilities[feat][channel].index;
+	obj_list.count = 2;
+	obj_list.pointer = &obj[0];
+
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_integer(handle, method, &obj_list, &val);
+	if (!ACPI_SUCCESS(status))
+		return -ENODEV;
+
+	*value = val;
+	return val;
+}
+
+static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+	long value;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			ret = dasharo_read_channel(data,
+				"GTMP",
+				DASHARO_FEATURE_TEMPERATURE,
+				channel,
+				&value);
+
+			if (ret > 0)
+				*val = value * 1000;
+		}
+		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_input) {
+			ret = dasharo_read_channel(data,
+				"GFTH",
+				DASHARO_FEATURE_FAN_TACH,
+				channel,
+				&value);
+
+			if (ret > 0)
+				*val = value;
+		}
+		break;
+	case hwmon_pwm:
+		if (attr == hwmon_pwm_input) {
+			ret = dasharo_read_channel(data,
+				"GFDC",
+				DASHARO_FEATURE_FAN_PWM,
+				channel,
+				&value);
+
+			if (ret > 0)
+				*val = value;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label && channel < data->cap_counts[DASHARO_FEATURE_TEMPERATURE])
+		*str = data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].name;
+		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_label && channel < data->cap_counts[DASHARO_FEATURE_FAN_TACH])
+		*str = data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].name;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	const struct dasharo_data *data = drvdata;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->cap_counts[DASHARO_FEATURE_TEMPERATURE])
+			return 0444;
+		break;
+	case hwmon_pwm:
+		if (channel < data->cap_counts[DASHARO_FEATURE_FAN_PWM])
+			return 0444;
+		break;
+	case hwmon_fan:
+		if (channel < data->cap_counts[DASHARO_FEATURE_FAN_TACH])
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+static const struct hwmon_ops dasharo_hwmon_ops = {
+	.is_visible = dasharo_hwmon_is_visible,
+	.read_string = dasharo_hwmon_read_string,
+	.read = dasharo_hwmon_read,
+};
+
+// Max 24 capabilities per feature
+static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
+	.ops = &dasharo_hwmon_ops,
+	.info = dasharo_hwmon_info,
+};
+
+static void dasharo_fill_feature_caps(struct dasharo_data *data, int feat)
+{
+	int cap_count = 0;
+	int count = 0;
+
+	for (int group = 0; group < MAX_GROUPS_PER_FEAT; ++group) {
+		count = dasharo_get_feature_cap_count(data, feat, group);
+
+		for (unsigned int i = 0; i < count && cap_count < MAX_CAPS_PER_FEAT; ++i) {
+			data->capabilities[feat][cap_count].cap = group;
+			data->capabilities[feat][cap_count].index = i;
+			scnprintf(data->capabilities[feat][cap_count].name, MAX_CAP_NAME_LEN, "%s %d", dasharo_group_names[feat][group], i);
+			cap_count++;
+		}
+	}
+	data->cap_counts[feat] = cap_count;
+}
+
+static int dasharo_add(struct acpi_device *acpi_dev)
+{
+	struct dasharo_data *data;
+
+	data = devm_kzalloc(&acpi_dev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	acpi_dev->driver_data = data;
+	data->acpi_dev = acpi_dev;
+
+	for (unsigned int i = 0; i < DASHARO_FEATURE_MAX; ++i) {
+		dasharo_fill_feature_caps(data, i);
+	}
+
+	data->hwmon = devm_hwmon_device_register_with_info(&acpi_dev->dev,
+		"dasharo_acpi", data, &dasharo_hwmon_chip_info, NULL);
+
+	return 0;
+}
+
+static void dasharo_remove(struct acpi_device *acpi_dev)
+{
+	struct dasharo_data *data = acpi_driver_data(acpi_dev);
+
+	hwmon_device_unregister(data->hwmon);
+}
+
+static const struct acpi_device_id device_ids[] = {
+	{"DSHR0001", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, device_ids);
+
+static struct acpi_driver dasharo_driver = {
+	.name = "Dasharo ACPI Driver",
+	.class = "Dasharo",
+	.ids = device_ids,
+	.ops = {
+		.add = dasharo_add,
+		.remove = dasharo_remove,
+	},
+};
+module_acpi_driver(dasharo_driver);
+
+MODULE_DESCRIPTION("Dasharo ACPI Driver");
+MODULE_AUTHOR("Michał Kopeć <michal.kopec@3mdeb.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0

