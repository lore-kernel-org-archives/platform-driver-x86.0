Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE43BE64C;
	Sun, 16 Aug 2026 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786918132; cv=none; b=VO8ocQuXrJYqDd3MfbmOResnWy7ubQOPYQ5IhnP0xW+rwdKRpl9Jj85AvHZN/ahhKvb+Zi9Nx1+f3S5NGbmH9H/W5qdeCZxZjOyyg8+R/t4C7ZcEpp/x4GmwxKtI+sjVDaVFOqVtrNgyfXF/p6Fzt+lH4a+T9mw5MJmTnK9+wWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786918132; c=relaxed/simple;
	bh=SWYR7T+h1gjyDYMKMOR/HHQzL/z4FzH2aC43sv4popY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gXzR80NDO7St0mdwlU/IHW5E1+EVHr6eJmmqUtmbDfVN+163b2wuqqNsmWJHKLQxMa5+Vlr012v9TuREXKMLvL3lHbZx9j5sR8wYiY0+FZ2n6cXeIVwn9M7RtwKzXAU57YDAnFd4BSr7XFHPlVBgWJxQFM+l25Hsv9Q7HwkjkFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=wPczZ6iC; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="wPczZ6iC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2BFB20B4C;
	Mon, 17 Aug 2026 00:58:42 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1786917526; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2hFH5S1fM6UVEdkA6k1Ce/EfNSsgGL3+zLTrdVYxOxk=;
	b=wPczZ6iCg1e/+pGMGgh1GONAM4eLOsm185LQ+pvDhhBJJX7GDjuU5xx/YIOWuPCrOHdOu7
	WsPi6JLOgaV6vLBZeHUN2tTwYKQdtIqjNdYjd+kQF8cEo61o9LXhK1Sg48MlvHZSPhto3v
	AbepnmyQIx+TLxzwi7feJ94PGXwJ+55DlQeJfP1gDG9miX9Tg7jWiDjKL0gvIx+O7Iwmt4
	f/peCS910tUyRM2NXKd31sGyXkCr1/C6kkdaBaOOPNLplKa9jfrLQgGr6QPcr9QenPshLg
	29EgZDjx1etLJHt5HD78A3GtTD2+8kqI9Em1TLeb1Z96C4VLjQMPZ4VyQoKVdQ==
From: kento@kekto.ru
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	qby140326@gmail.com,
	foxido@foxido.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	KentoNion <mrKentoNion@gmail.com>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424 thin-ultrabook perf-mode quirk
Date: Mon, 17 Aug 2026 00:58:25 +0300
Message-ID: <20260816215825.289356-1-kento@kekto.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: KentoNion <mrKentoNion@gmail.com>

The in-tree mapping of platform_profile to sequential cmd 0x08 values
0..3 matches Tongfang/Redmi G gaming firmware. Xiaomi Book Pro 14 (DMI
board_name TM2424) uses a different encoding:

  Quiet=0x02, Turbo=0x03, Full-speed=0x04, Auto=0x09, Eco=0x0A

On this SKU the DC-barrel-jack gate also wrongly blocks Performance:
the machine only charges over USB-C. Full-speed is still rejected by
firmware on battery (status byte != 0x80), so honour that status and
fall back to Turbo.

hwmon, keyboard LED and gpu_mode/kb_mode/fan_boost are unimplemented
on this firmware (0xE0); skip registering them.

Tested on Xiaomi Book Pro 14 2026 (TM2424-77080): performance on AC
holds ~50W package power.

Signed-off-by: KentoNion <mrKentoNion@gmail.com>
---
 .../wmi/devices/bitland-mifs-wmi.rst          |  22 +-
 drivers/platform/x86/bitland-mifs-wmi.c       | 190 +++++++++++++++++-
 2 files changed, 196 insertions(+), 16 deletions(-)

diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
index 9e86ecc2993c..99799fd1b09c 100644
--- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
+++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
@@ -93,8 +93,11 @@ The following Command IDs are used in the third byte of the buffer:
 +----------+-----------------------+------------------------------------------+
 | ID       | Name                  | Values / Description                     |
 +==========+=======================+==========================================+
-| 8        | SystemPerMode         | 0: Balance, 1: Performance, 2: Quiet,    |
-|          |                       | 3: Full-speed                            |
+| 8        | SystemPerMode         | Gaming line: 0 Balance, 1 Performance,   |
+|          |                       | 2 Quiet, 3 Full-speed.                   |
+|          |                       | Thin-ultrabook (TM2424): 0x02 Quiet,     |
+|          |                       | 0x03 Turbo, 0x04 Full-speed, 0x09 Auto,  |
+|          |                       | 0x0A Eco.                                |
 +----------+-----------------------+------------------------------------------+
 | 9        | GPUMode               | 0: Hybrid, 1: Discrete, 2: UMA           |
 +----------+-----------------------+------------------------------------------+
@@ -188,11 +191,18 @@ Performance Modes
 -----------------
 Changing the performance mode via Command ID 0x08 (SystemPerMode) affects the
 power limits (PL1/PL2) and fan curves managed by the Embedded Controller (EC).
-Note that the "Full-speed" and "Performance" mode (1, 3) is typically only
-available when the system is connected to a DC power source (not USB-C/PD).
 
-In the driver implementation, switch to performance/full-speed mode without
-DC power connected will throw the EOPNOTSUPP error.
+Two firmware encodings exist:
+
+* Gaming line (Tongfang/Redmi G): sequential values 0..3. Full-speed and
+  Performance typically require a DC barrel jack; the driver returns
+  ``-EOPNOTSUPP`` otherwise.
+* Thin-ultrabook line (Xiaomi Book Pro 14, DMI ``board_name=TM2424``):
+  Quiet=0x02, Turbo=0x03, Full-speed=0x04, Auto=0x09, Eco=0x0A. These
+  machines charge over USB-C only. Full-speed is still rejected by firmware
+  on battery (status byte != 0x80); the driver then falls back to Turbo.
+
+The firmware status byte is ``OutData[1]`` (0x80 accepted / supported).
 
 Graphics Switching
 ------------------
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index b0d06a80e89e..e255fd3b30fb 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -2,7 +2,11 @@
 /*
  * Linux driver for Bitland notebooks.
  *
- * Copyright (C) 2026 2 Mingyou Chen <qby140326@gmail.com>
+ * Copyright (C) 2026 Mingyou Chen <qby140326@gmail.com>
+ *
+ * Thin-ultrabook firmware (Xiaomi Book Pro 14 / TM2424) uses a different
+ * cmd 0x08 encoding than the gaming line. Detected via DMI; other Bitland
+ * hardware keeps the original 0..3 mapping.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -14,6 +18,7 @@
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
@@ -38,6 +43,9 @@
 #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
 #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
 
+/* Firmware status in output.operation (wire OUT[1]): request accepted. */
+#define MIFS_STATUS_OK		0x80
+
 enum bitland_mifs_operation {
 	WMI_METHOD_GET	= 250,
 	WMI_METHOD_SET	= 251,
@@ -73,6 +81,15 @@ enum bitland_mifs_power_profile {
 	WMI_PP_FULL_SPEED	= 3,
 };
 
+/* cmd 0x08 values on the thin-ultrabook firmware line (TM2424). */
+enum bitland_mifs_thin_perf_mode {
+	WMI_THIN_QUIET		= 0x02,
+	WMI_THIN_TURBO		= 0x03,
+	WMI_THIN_FULL_SPEED	= 0x04,
+	WMI_THIN_AUTO		= 0x09,
+	WMI_THIN_ECO		= 0x0A,
+};
+
 enum bitland_mifs_event_id {
 	WMI_EVENT_RESERVED_1		= 1,
 	WMI_EVENT_RESERVED_2		= 2,
@@ -123,7 +140,7 @@ struct bitland_mifs_input {
 
 struct bitland_mifs_output {
 	u8 reserved1;
-	u8 operation;
+	u8 operation;	/* firmware status on replies: MIFS_STATUS_OK = accepted/supported */
 	u8 reserved2;
 	u8 function;
 	u8 data[28];
@@ -159,6 +176,18 @@ struct bitland_mifs_wmi_data {
 	struct device *hwmon_dev;
 	struct device *pp_dev;
 	enum platform_profile_option saved_profile;
+	bool thin_ultrabook;		/* DMI quirk: TM2424 thin-ultrabook firmware */
+};
+
+static const struct dmi_system_id bitland_mifs_thin_ultrabook_table[] = {
+	{
+		.ident = "Xiaomi Book Pro 14 (TM2424)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_MATCH(DMI_BOARD_NAME, "TM2424"),
+		},
+	},
+	{ }
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -167,23 +196,118 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 {
 	struct wmi_buffer in_buf = { .length = sizeof(*input), .data = (void *)input };
 	struct wmi_buffer out_buf = { 0 };
+	struct bitland_mifs_output local_output;
+	struct bitland_mifs_output *dest = output ? output : &local_output;
 	int ret;
 
 	guard(mutex)(&data->lock);
 
-	if (!output)
-		return wmidev_invoke_procedure(data->wdev, 0, 1, &in_buf);
-
-	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf, sizeof(*output));
+	/*
+	 * Always parse the reply so SET can check output.operation
+	 * (firmware status) instead of fire-and-forget.
+	 */
+	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf, sizeof(*dest));
 	if (ret)
 		return ret;
 
-	memcpy(output, out_buf.data, sizeof(*output));
+	memcpy(dest, out_buf.data, sizeof(*dest));
 	kfree(out_buf.data);
 
 	return 0;
 }
 
+/* --- Thin-ultrabook (TM2424) perf mode --- */
+
+static int bitland_thin_wmi_perf_set(struct bitland_mifs_wmi_data *data, u8 val)
+{
+	struct bitland_mifs_input input = {
+		.operation = WMI_METHOD_SET,
+		.function = WMI_FN_SYSTEM_PER_MODE,
+	};
+	struct bitland_mifs_output output;
+	int ret;
+
+	input.payload[0] = val;
+
+	ret = bitland_mifs_wmi_call(data, &input, &output);
+	if (ret)
+		return ret;
+
+	if (output.operation != MIFS_STATUS_OK) {
+		dev_dbg(&data->wdev->dev,
+			"perf mode %#x rejected by firmware (status=%#x)\n",
+			val, output.operation);
+		return -EREMOTEIO;
+	}
+
+	return 0;
+}
+
+static int bitland_thin_profile_get(struct bitland_mifs_wmi_data *data,
+				    enum platform_profile_option *profile)
+{
+	struct bitland_mifs_input input = {
+		.operation = WMI_METHOD_GET,
+		.function = WMI_FN_SYSTEM_PER_MODE,
+	};
+	struct bitland_mifs_output output;
+	int ret;
+
+	ret = bitland_mifs_wmi_call(data, &input, &output);
+	if (ret)
+		return ret;
+
+	switch (output.data[0]) {
+	case WMI_THIN_ECO:
+	case WMI_THIN_QUIET:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	case WMI_THIN_AUTO:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case WMI_THIN_FULL_SPEED:
+	case WMI_THIN_TURBO:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	default:
+		/*
+		 * Unknown readback (e.g. Balance 0x01, not offered on
+		 * TM24*): degrade to balanced rather than failing sysfs.
+		 */
+		dev_dbg(&data->wdev->dev,
+			"unrecognized thin perf mode readback: %#x\n",
+			output.data[0]);
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	}
+
+	return 0;
+}
+
+static int bitland_thin_profile_set(struct bitland_mifs_wmi_data *data,
+				    enum platform_profile_option profile)
+{
+	switch (profile) {
+	case PLATFORM_PROFILE_LOW_POWER:
+		return bitland_thin_wmi_perf_set(data, WMI_THIN_ECO);
+	case PLATFORM_PROFILE_BALANCED:
+		return bitland_thin_wmi_perf_set(data, WMI_THIN_AUTO);
+	case PLATFORM_PROFILE_PERFORMANCE:
+		/*
+		 * Full-speed is rejected by firmware on battery. There
+		 * is no DC-jack on this model; honour the status byte
+		 * and fall back to Turbo.
+		 */
+		if (bitland_thin_wmi_perf_set(data, WMI_THIN_FULL_SPEED) == 0)
+			return 0;
+		return bitland_thin_wmi_perf_set(data, WMI_THIN_TURBO);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* --- Gaming-line (Tongfang/Redmi G) perf mode - unchanged behavior --- */
+
 static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
@@ -197,6 +321,9 @@ static int laptop_profile_get(struct device *dev,
 	struct bitland_mifs_output result;
 	int ret;
 
+	if (data->thin_ultrabook)
+		return bitland_thin_profile_get(data, profile);
+
 	ret = bitland_mifs_wmi_call(data, &input, &result);
 	if (ret)
 		return ret;
@@ -256,6 +383,9 @@ static int laptop_profile_set(struct device *dev,
 	int ret;
 	u8 val;
 
+	if (data->thin_ultrabook)
+		return bitland_thin_profile_set(data, profile);
+
 	switch (profile) {
 	case PLATFORM_PROFILE_LOW_POWER:
 		val = WMI_PP_QUIET;
@@ -286,11 +416,20 @@ static int laptop_profile_set(struct device *dev,
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
 {
+	struct bitland_mifs_wmi_data *data = drvdata;
+
 	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
 	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
+	/*
+	 * Thin-ultrabook line exposes exactly 3 firmware-backed levels
+	 * (Eco/Auto/Full-speed-or-Turbo) - no separate
+	 * balanced-performance step, unlike the gaming line's 4 modes.
+	 */
+	if (!data->thin_ultrabook)
+		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+
 	return 0;
 }
 
@@ -592,13 +731,35 @@ static const DEVICE_ATTR_RW(gpu_mode);
 static const DEVICE_ATTR_RW(kb_mode);
 static const DEVICE_ATTR_WO(fan_boost);
 
-static const struct attribute *const laptop_attrs[] = {
+static struct attribute *laptop_attrs[] = {
 	&dev_attr_gpu_mode.attr,
 	&dev_attr_kb_mode.attr,
 	&dev_attr_fan_boost.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(laptop);
+
+/* gpu_mode/kb_mode/fan_boost are unsupported on thin-ultrabook firmware. */
+static umode_t laptop_attrs_is_visible(struct kobject *kobj,
+				       struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+
+	if (data->thin_ultrabook)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group laptop_group = {
+	.attrs = laptop_attrs,
+	.is_visible = laptop_attrs_is_visible,
+};
+
+static const struct attribute_group *laptop_groups[] = {
+	&laptop_group,
+	NULL,
+};
 
 static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
@@ -667,6 +828,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return -ENOMEM;
 
 	drv_data->wdev = wdev;
+	drv_data->thin_ultrabook = dmi_check_system(bitland_mifs_thin_ultrabook_table) > 0;
 
 	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
 	if (ret)
@@ -693,12 +855,20 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return input_register_device(drv_data->input_dev);
 	}
 
+	if (drv_data->thin_ultrabook)
+		dev_info(&wdev->dev, "using thin-ultrabook perf-mode values\n");
+
 	/* Register platform profile */
 	drv_data->pp_dev = devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_data,
 							  &laptop_profile_ops);
 	if (IS_ERR(drv_data->pp_dev))
 		return PTR_ERR(drv_data->pp_dev);
 
+	if (drv_data->thin_ultrabook) {
+		/* hwmon and keyboard LED WMI functions return 0xE0 here. */
+		return 0;
+	}
+
 	/* Register hwmon */
 	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
 								   "bitland_mifs",
-- 
2.55.0

