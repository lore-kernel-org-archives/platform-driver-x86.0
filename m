Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913D314D15
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Jan 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769258682; cv=none; b=UcRSCY3fq7itus1AfcMYH8Q99mj7ey6lXMyP9oFYqAS804iz9eZBcCbq5scYdY1Xr6q9goFTy7shvZj720qbw8ogcenKxjWDu+ody29fWhlokGwmBwpjirFs4t15P9LhDNearEhl5Nu5IAOD13El99+zg4437rwoGqz/yuEbXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769258682; c=relaxed/simple;
	bh=WgRHURJogev5ucEvv/X37UukWGJbTqdUewJX4X9RodE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CwTsqtO1RITH33zHj6m7o6OSWp8WZzeT7w2k7DJMJ8mnquC/x4ne0rTZMXvdNugSHh2Rc+mT50IjzRrv48LMxrc5lbsEQXhC8XZtYOMe75FcY4jNa9keqgARSnIc3FPaYyreIdc7Mm/fBY5yH+bbBgeot4/xEAaElTeWl3yWCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZGLWwCY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZGLWwCY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f2676bb21so32755325ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Jan 2026 04:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769258680; x=1769863480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwnU3fj1/wxgu+yMrNlzvejmUp395YnpzJm4usMPFUo=;
        b=jZGLWwCYgexs5dTFOocMf/aqTkjAu1FMcIGYM4R8FZZDDZG643bqYlG0z0LZ9xzCCE
         Cs9qotDCU3BNbWhEERRthLEY8ObcxA34hvt9uxYTmwI9edZNZTB7tGddbQSCFRmwTwoV
         GCSNf5GMsS2GK2ojG8Mk7DkDT6mRbM1guOeafa62ODXVzuZHURjbHhM5vK43MLB+NPVD
         6kQUQbuy4yOvw1m/NSyvCJJ6NkuByfd/kggkKtwe30Xkdg1uEgcwhg2noSkNljlWiDUS
         jwvlGm37uuB89Ntvkikmi7jNp5jRqnCYbs4noAh+Qol7X3euQiimcTn7H3GkOZqF4fEI
         +W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769258680; x=1769863480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwnU3fj1/wxgu+yMrNlzvejmUp395YnpzJm4usMPFUo=;
        b=e6GbyqwOBwAqwEGfaf6KkysTu1UMIKNgtPh87OWnFzUVs0cD9bztjneqsCRu3Ryf5I
         byBF5u5zvYwvzwf1MXWVFcf3eQhSNOpDexMgpBk3wjMbnIo5CtLyn1K63DFy+yCK3vA3
         WbPMSVauyngpuGREtru8CjtOWHMQgs56yIk167VEf0A8mj7tUKwAkJjCH2tQy7Pd57lf
         R4Jtnj2PSkP5rta2B2De2toR/zIJP7QpM6T5BskXFQ60+rDkmsCoXG05ckIyatQ3POaX
         4DCO+9+lVuqEFJxx0IN7APFO8cec3juXLu0BaquDRT989v9dJVNu9sc+gGRdzK12c/UH
         kHKw==
X-Gm-Message-State: AOJu0YyCB38J5O1qVhMFli1C9PZe/ILiCn238H0IfG+cKUlknELVVxtV
	yJaluxhq+kwirZdDQPhoe0+DerGeV9CX9XUfpI1D8DN117RUjGrfId6W
X-Gm-Gg: AZuq6aIYuZ75RBhgt1poshk3FA0uaRrdi/C/htLrmbIHc5EfjbjB514b8YirsogO0Ny
	31YNFMjz/9AjubuoQRPnYajNuncDywkWm5GPpHzZ8Vnqs08t/WLkCFaAnurJQOGN0jmLD2/lo8m
	zmjDOIOpXvCPswCX5go+hn7iT7esj9JTJzpyDzeGa5isVZ2LbaxyBaD/gU0DIPLVr1hFofLYYtb
	pcDq1VjGgvly8X+K+qN9JqH+JIv4OWpyOs9qODenKQybMT1gsMSsO6dXr9IL+rWQVz6Te5Ca3X6
	GNO8PZ9c8iA6hESJXvZ5XiQt1g+cmVXw6R/PqaVB5NuH6qd2j+2wQuzRsGBddrYpGPM2xCfRDjP
	vwA3hVjzBtxMMDlondyidQ+zhu0nNqFUkKGEpMjkEuczOPAfJ8uFg66QCFB+lyRhW1pCZuald
X-Received: by 2002:a17:903:2286:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-2a7fe735629mr63920015ad.46.1769258680195;
        Sat, 24 Jan 2026 04:44:40 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fd929asm45898425ad.90.2026.01.24.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 04:44:39 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cryolitia.pukngae@linux.dev,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH] platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS WMI driver
Date: Sat, 24 Jan 2026 20:44:13 +0800
Message-ID: <20260124124413.46017-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS WMI driver

Add a WMI-based driver for Tongfang laptops that use the MIFS
(MiInterface) ACPI WMI interface. These laptops are commonly sold under
brands like Mechrevo, Schenker, XMG, and Eluktronics.

The driver implements the following features:
- Platform Profile support: Allows switching between Low Power,
Balanced,
  and Performance modes.
- Hwmon support: Provides monitoring for CPU temperature and fan speeds
  (CPU, GPU, and System fans).
- LED support: Standard LED class interface for controlling keyboard
  backlight brightness.
- Sysfs interface:
    - GPU mode switching (Hybrid, Discrete, UMA).
    - Keyboard RGB mode and color control.
    - Fan boost (Max fan speed) toggle.

The driver communicates with the BIOS via WMI GUID
"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B" using method IDs 250 (GET)
and 251 (SET).

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/Kconfig             |  11 +
 drivers/platform/x86/Makefile            |   1 +
 drivers/platform/x86/tongfang-mifs-wmi.c | 491 +++++++++++++++++++++++
 3 files changed, 503 insertions(+)
 create mode 100644 drivers/platform/x86/tongfang-mifs-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4cb7d97a9fcc..ff12631561e0 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -113,6 +113,17 @@ config GIGABYTE_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called gigabyte-wmi.
 
+config TONGFANG_MIFS_WMI
+	tristate "Tongfang MIFS WMI temperature, fan and GPU controller driver"
+	depends on ACPI_WMI
+	depends on HWMON
+	depends on ACPI_PLATFORM_PROFILE
+	help
+	  The driver for Tongfang laptops
+
+	  Say Y here if you want to support WMI-based features on Tongfang
+	  laptops, such as performance mode switching.
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI_EC && THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index d25762f7114f..1160c726bda6 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
 obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
+obj-$(CONFIG_TONGFANG_MIFS_WMI)		+= tongfang-mifs-wmi.o
 
 # Acer
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
diff --git a/drivers/platform/x86/tongfang-mifs-wmi.c b/drivers/platform/x86/tongfang-mifs-wmi.c
new file mode 100644
index 000000000000..b8ac421be80c
--- /dev/null
+++ b/drivers/platform/x86/tongfang-mifs-wmi.c
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_profile.h>
+#include <linux/sysfs.h>
+#include <linux/wmi.h>
+
+#define DRV_NAME "tongfang-mifs-wmi"
+#define TONGFANG_MIFS_GUID "B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
+#define WMI_BUFFER_SIZE 32
+
+enum wmi_method_type {
+	WMI_METHOD_GET = 250,
+	WMI_METHOD_SET = 251,
+};
+
+enum wmi_method_name {
+	WMI_FN_SYSTEM_PER_MODE = 8,
+	WMI_FN_GPU_MODE = 9,
+	WMI_FN_KBD_TYPE = 10,
+	WMI_FN_FN_LOCK = 11,
+	WMI_FN_TP_LOCK = 12,
+	WMI_FN_FAN_SPEEDS = 13,
+	WMI_FN_RGB_KB_MODE = 16,
+	WMI_FN_RGB_KB_COLOR = 17,
+	WMI_FN_RGB_KB_BRIGHTNESS = 18,
+	WMI_FN_SYSTEM_AC_TYPE = 19,
+	WMI_FN_MAX_FAN_SWITCH = 20,
+	WMI_FN_MAX_FAN_SPEED = 21,
+	WMI_FN_CPU_THERMOMETER = 22,
+	WMI_FN_CPU_POWER = 23,
+};
+
+struct tongfang_mifs_wmi_data {
+	struct wmi_device *wdev;
+	struct mutex lock;
+	struct led_classdev kbd_led;
+	struct device *hwmon_dev;
+};
+
+static int tongfang_mifs_wmi_call(struct tongfang_mifs_wmi_data *data, u8 type,
+				  u8 method, u8 *payload, size_t payload_len,
+				  u8 *out_data)
+{
+	struct acpi_buffer input = { 0, NULL };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	u8 *buffer;
+	acpi_status status;
+	int ret = 0;
+
+	if (!data)
+		return -EINVAL;
+
+	buffer = kzalloc(WMI_BUFFER_SIZE, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	buffer[1] = type;
+	buffer[3] = method;
+
+	if (payload && payload_len > 0) {
+		size_t copy_len =
+			min_t(size_t, payload_len, WMI_BUFFER_SIZE - 4);
+		memcpy(&buffer[4], payload, copy_len);
+	}
+
+	input.length = WMI_BUFFER_SIZE;
+	input.pointer = buffer;
+
+	status = wmi_evaluate_method(TONGFANG_MIFS_GUID, 0, 1, &input, &output);
+	if (ACPI_FAILURE(status)) {
+		ret = -EIO;
+		goto out_free_in;
+	}
+
+	obj = output.pointer;
+	if (!obj) {
+		ret = -ENODATA;
+		goto out_free_in;
+	}
+
+	if (obj->type == ACPI_TYPE_BUFFER &&
+	    obj->buffer.length >= WMI_BUFFER_SIZE) {
+		if (out_data)
+			memcpy(out_data, obj->buffer.pointer, WMI_BUFFER_SIZE);
+	} else {
+		ret = -EINVAL;
+	}
+
+	kfree(output.pointer);
+out_free_in:
+	kfree(buffer);
+	return ret;
+}
+
+static int laptop_profile_get(struct device *dev,
+			      enum platform_profile_option *profile)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 result[WMI_BUFFER_SIZE];
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_GET,
+				     WMI_FN_SYSTEM_PER_MODE, NULL, 0, result);
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		return ret;
+
+	switch (result[4]) {
+	case 0:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case 1:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case 2:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	case 3:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break; /* Fullspeed */
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int laptop_profile_set(struct device *dev,
+			      enum platform_profile_option profile)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 val;
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_LOW_POWER:
+		val = 2;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		val = 0;
+		break;
+	case PLATFORM_PROFILE_PERFORMANCE:
+		val = 1;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_SET,
+				     WMI_FN_SYSTEM_PER_MODE, &val, 1, NULL);
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int platform_profile_probe(void *drvdata, unsigned long *choices)
+{
+	__set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
+	__set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	return 0;
+}
+
+static struct platform_profile_ops laptop_profile_ops = {
+	.probe = platform_profile_probe,
+	.profile_get = laptop_profile_get,
+	.profile_set = laptop_profile_set,
+};
+
+static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long *val)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 res[WMI_BUFFER_SIZE];
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	if (type == hwmon_temp) {
+		ret = tongfang_mifs_wmi_call(data, WMI_METHOD_GET,
+					     WMI_FN_CPU_THERMOMETER, NULL, 0,
+					     res);
+		if (!ret)
+			*val = res[4] * 1000;
+	} else if (type == hwmon_fan) {
+		ret = tongfang_mifs_wmi_call(data, WMI_METHOD_GET,
+					     WMI_FN_FAN_SPEEDS, NULL, 0, res);
+		if (!ret) {
+			if (channel == 0) /* CPU */
+				*val = (res[5] << 8) | res[4];
+			else if (channel == 1) /* GPU */
+				*val = (res[7] << 8) | res[6];
+			else if (channel == 2) /* SYS */
+				*val = (res[11] << 8) | res[10];
+			else
+				ret = -EINVAL;
+		}
+	} else {
+		ret = -EINVAL;
+	}
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static umode_t laptop_hwmon_is_visible(const void *drvdata,
+				       enum hwmon_sensor_types type, u32 attr,
+				       int channel)
+{
+	if (type == hwmon_temp && attr == hwmon_temp_input && channel == 0)
+		return 0444;
+	if (type == hwmon_fan && attr == hwmon_fan_input && channel < 3)
+		return 0444;
+	return 0;
+}
+
+static const struct hwmon_channel_info *laptop_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops laptop_hwmon_ops = {
+	.is_visible = laptop_hwmon_is_visible,
+	.read = laptop_hwmon_read,
+};
+
+static const struct hwmon_chip_info laptop_chip_info = {
+	.ops = &laptop_hwmon_ops,
+	.info = laptop_hwmon_info,
+};
+
+static int laptop_kbd_led_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct tongfang_mifs_wmi_data *data =
+		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
+	u8 val = (u8)value;
+	int ret;
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_SET,
+				     WMI_FN_RGB_KB_BRIGHTNESS, &val, 1, NULL);
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+/* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
+static ssize_t gpu_mode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 result[WMI_BUFFER_SIZE];
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_GET, WMI_FN_GPU_MODE,
+				     NULL, 0, result);
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		return ret;
+	return sysfs_emit(buf, "%d\n", result[4]);
+}
+
+static ssize_t gpu_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 val;
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	if (kstrtou8(buf, 10, &val) || val > 2)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_GPU_MODE,
+				     &val, 1, NULL);
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* RGB Mode: 0:OFF, 1:Cyclic, 2:Fixed, 3:Custom */
+static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 result[WMI_BUFFER_SIZE];
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_GET, WMI_FN_RGB_KB_MODE,
+				     NULL, 0, result);
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		return ret;
+	return sysfs_emit(buf, "%d\n", result[4]);
+}
+
+static ssize_t kb_mode_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 val;
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	if (kstrtou8(buf, 10, &val) || val > 3)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_RGB_KB_MODE,
+				     &val, 1, NULL);
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* RGB Color: R G B */
+static ssize_t kb_color_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	unsigned int r, g, b;
+	u8 color_buf[3];
+	u8 fixed_mode = 2;
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	if (sscanf(buf, "%u %u %u", &r, &g, &b) != 3)
+		return -EINVAL;
+	if (r > 255 || g > 255 || b > 255)
+		return -EINVAL;
+
+	color_buf[0] = (u8)r;
+	color_buf[1] = (u8)g;
+	color_buf[2] = (u8)b;
+
+	mutex_lock(&data->lock);
+
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_RGB_KB_MODE,
+				     &fixed_mode, 1, NULL);
+	if (ret)
+		goto unlock;
+
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_RGB_KB_COLOR,
+				     color_buf, 3, NULL);
+
+unlock:
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* Fan Boost: 0:Normal, 1:Max Speed */
+static ssize_t fan_boost_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 val, payload[2];
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	if (kstrtou8(buf, 10, &val) || val > 1)
+		return -EINVAL;
+
+	payload[0] = 0; /* CPU/GPU Fan */
+	payload[1] = val;
+
+	mutex_lock(&data->lock);
+	ret = tongfang_mifs_wmi_call(data, WMI_METHOD_SET,
+				     WMI_FN_MAX_FAN_SWITCH, payload, 2, NULL);
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(gpu_mode);
+static DEVICE_ATTR_RW(kb_mode);
+static DEVICE_ATTR_WO(kb_color);
+static DEVICE_ATTR_WO(fan_boost);
+
+static struct attribute *laptop_attrs[] = { &dev_attr_gpu_mode.attr,
+					    &dev_attr_kb_mode.attr,
+					    &dev_attr_kb_color.attr,
+					    &dev_attr_fan_boost.attr, NULL };
+ATTRIBUTE_GROUPS(laptop);
+
+static int tongfang_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct tongfang_mifs_wmi_data *drv_data;
+	struct device *pp_dev;
+	int ret;
+
+	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
+		return -ENOMEM;
+
+	drv_data->wdev = wdev;
+	mutex_init(&drv_data->lock);
+	dev_set_drvdata(&wdev->dev, drv_data);
+
+	/* Register platform profile */
+	pp_dev = devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_data,
+						&laptop_profile_ops);
+	if (IS_ERR(pp_dev))
+		dev_err(&wdev->dev, "Failed to register platform profile\n");
+
+	/* Register hwmon */
+	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(
+		&wdev->dev, "tongfang_mifs", drv_data, &laptop_chip_info, NULL);
+	if (IS_ERR(drv_data->hwmon_dev))
+		dev_err(&wdev->dev, "Failed to register hwmon\n");
+
+	/* Register keyboard LED */
+	drv_data->kbd_led.name = "laptop::kbd_backlight";
+	drv_data->kbd_led.max_brightness = 3;
+	drv_data->kbd_led.brightness_set_blocking = laptop_kbd_led_set;
+	ret = devm_led_classdev_register(&wdev->dev, &drv_data->kbd_led);
+	if (ret)
+		dev_err(&wdev->dev, "Failed to register keyboard LED\n");
+
+	return 0;
+}
+
+static const struct wmi_device_id tongfang_mifs_wmi_id_table[] = {
+	{ TONGFANG_MIFS_GUID, NULL },
+	{}
+};
+MODULE_DEVICE_TABLE(wmi, tongfang_mifs_wmi_id_table);
+
+static struct wmi_driver tongfang_mifs_wmi_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.dev_groups = laptop_groups,
+	},
+	.id_table = tongfang_mifs_wmi_id_table,
+	.probe = tongfang_mifs_wmi_probe,
+};
+
+module_wmi_driver(tongfang_mifs_wmi_driver);
+
+MODULE_AUTHOR("Mingyou Chen <qby104326@gmail.com>");
+MODULE_DESCRIPTION("Tongfang MIFS (MiInterface) WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

