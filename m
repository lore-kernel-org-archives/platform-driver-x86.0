Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312A23392D
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348330; cv=none; b=hZKTp4kUoRQmwQhU0Tet2EBm4XY3whdEL7KFaoqLHfHBrHZzQJd3ua77EkPoCBRk3FrPSORAyiDOti4g868OtLJdCHSLFJ7PsL/gt9xKxktJZBCjzXx9ZJCdKqu+MjVgRBRgIdbCME7dUWjQhV/7ambv9kBaYoKMUCHtLcCa69U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348330; c=relaxed/simple;
	bh=IzeBZIAu8Iu7JhViYfM89nSb6AUEWlm6PRdWck0SNqw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RFNuJhb4SjInDOBQixAr8qbhElJ4cz4xSxiEDhNWqz0OTiVzmM/cRV0opLVF4jpgoVv/n51kHkxQD19XPX0osHLLZVc6pk/5RwUsXzov/GFJU7lcZs03W6g7bHVnY9rTBDUs0wrulkxv+Ztl9lMkJsgl1vt3CScY/7LGM1WAgoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqRBhwmn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqRBhwmn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2647266a91.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 18:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789348328; x=1789953128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y9tXIbPlNP6ameAMEEM4+Ga7euehLrZ9+6Dgw663taw=;
        b=fqRBhwmn9Kk9ScC2kQRgmlXsk7CMJ7zhvC1x8+uUvTp0Nz4QUQ/HdoNEMlh93b4k4C
         qIyzUXMxOFNueLsTu+h6cVfA8GJghFkvQiW1SFFgJO0q1Da1T4bsR4CPbYqOsfrzRdfj
         dDM1EzZx7mPsBWxyZ499+9uxjdZyr9T4Iu+E9YSNz+8iqJD1K2pwHtpc1xO4DV9mw9ui
         wyp2xPezk4PuZb/MU7YxSidvOoshA0UZOpuEIQXrvmY2ovYdeFYqjVc+a4IKSQZR14Xt
         y514vI9uplXYCdmeNHmnKXMZyPKpokgcfHDSdwUM4gUts/jhgb7oViWEijiFTSd81fXa
         a40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348328; x=1789953128;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9tXIbPlNP6ameAMEEM4+Ga7euehLrZ9+6Dgw663taw=;
        b=HFpa4296133YyBAp9aqUi0i6A0r5xN6igz6PUZlTK7eYrIkvpRtuBYL6wHeynDF4+a
         D5u+IAi48bdiR4kLNHoPVpSaH2YOtbPpdHu7bdy7n3prJSJOm00GWOPhkTongL8fsJlM
         LfKnCrK1zYNBPcJjs+cGZBUEd7KzfcI86DpM7/qyQJjjGndO1h9xTZsW7ith7bBFw7gB
         KWbIsaDHUEpG/Umwu9ILC2rtRsvCuPPE60UXAMRrs6MTCJzOspUHyiow89s3ljoLJ6sH
         aB5j6Bqu6xZZcYt5aWWHftbIlqOghi3MVEqOolO2KOVpLVaizHcrKXntlY+s7iicG382
         h2eg==
X-Forwarded-Encrypted: i=1; AKwUvBymLdb5+IxicX3/9EVA2K2izklUA6tGrM4VQoiA0UO28OBm7qBJ9i8YCsXq60oaQGz3FQDFb9gOba8LDSykYVvcQRQX@vger.kernel.org
X-Gm-Message-State: AFuF++mfkvuWxOP0jv4UfXVQ90nmvCrx/I+1LyGqZzeA39DUd8gkDjgV
	s3w/Z2SjGbaJ+T+V7jOW1TWnopVuv4ERdRu1DUPXJCHiRubRbDxTDJz2
X-Gm-Gg: AYBFou097Cm3XZudDti+rYBfzXaYMsRo2Ul0xwQ+Az5tXSGcQMLwWtZVE034qRmpAxl
	DFTYzygT9lm9InoyjO2ZML24izq6hnLt9O/gscCsrFMsVYhxAgO2059AMegL7pMZKgxDTdXpW7y
	pHyZuyBtrr5UtuYT8Ec3WMZ88AoSfoiFmPOxVGB9TfCPKTC4RJEvq2NqE/Eve2kDsi40x/3pb2B
	DewMCbEPvGT3t6Icq0gk+AmFCA10gnT3QHlNL77LhzPN7aCm8saaq2Mh2f+YPE7V/UbQps5dLYo
	X5lLL641BpiUZQamv25StQFgtf2DGeHkaUw9X2aKH20AiH6JZT58RriFsSopnmxvrUQsV5JoCNa
	wJjcenI807cnzIJ5dOhImurSvcrbTBpAXDpvz/Vs9ANRZglNi5IYVRGK9b6a7ScasXPaodRNt8O
	7EFKBsWB+Ad+3OHAp6d7X8VFODit1oTlppCU9jXrFrjCKYHwLo8GRiBQTfXzFV8IQl4+2240WRU
	rlvwb0jD+ebCZ5qCb2lQaJOtCEQs/ftaimKjcq3OflBvgY4eS7T87c=
X-Received: by 2002:a17:90b:1805:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39dec143751mr909263a91.22.1789348328321;
        Sun, 13 Sep 2026 18:12:08 -0700 (PDT)
Received: from ?IPV6:2607:f598:b3da:2e70:5551:6aaf:8be2:608? ([2607:f598:b3da:2e70:5551:6aaf:8be2:608])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm22260828eec.14.2026.09.13.18.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 18:12:07 -0700 (PDT)
Message-ID: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
Date: Sun, 13 Sep 2026 18:12:08 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bozhen Peng <bozhenpeng93@gmail.com>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO HPT
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>,
 Mingyou Chen <qby140326@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I found that my WUJIE15 PRO with the HPT board uses three profiles:
performance (0), balanced (1), and quiet (2). The driver's default
mapping gets these wrong and exposes a fourth mode that the firmware
does not implement. My laptop only has USB-C power input, so the
circular-hole adapter requirement also rules out its supported external-
power configuration.

I added a check matching the vendor, product and board names to select
the correct profiles and power check. During testing, I saw
power_supply_is_system_supplied() return true even after I unplugged the
charger during sleep. I switched the check to the ACPI adapter's _PSR,
which reads the current power-present bit on this machine. I also made
resume select balanced if power was removed, rather than restore the
saved performance profile. If the power query fails, I return the error
instead of assuming the charger is connected.

I checked the firmware methods and found only two fan readings, in F2/F1
order, and no MIFS CPU temperature reading. Some unimplemented GET
commands return success with zero data, so I could not use a successful
query to establish sensor support. I register the two fans and leave out
the temperature input. I also hide the unsupported GPU, RGB mode and fan
boost controls, and check firmware replies to the remaining SET
commands. I left normal keyboard backlight control unchanged.

I found that the event GUID also matches redmi-wmi, so I made that
driver decline this machine and leave its notifications to bitland-mifs-
wmi. I kept the existing behavior for other machines and documented the
HPT differences.

Signed-off-by: Bozhen Peng <bozhenpeng93@gmail.com>
---
I tested this on my MECHREVO WUJIE15 PRO (WUJIE15 Series-HPT), comparing
the firmware methods and profile values with the Windows OEM controls.

I ran the hardware tests on Ubuntu 26.04.1, kernel 7.0.0-30-generic. I
used a small adaptation for that kernel's older WMI API in the test
modules. I have left that adaptation and the extra diagnostic logging
out of this patch.

I ran 22 automated profile, backlight, binding and sensor checks, all of
which passed, and tested the actual hotkeys. I recorded about 2280 and
2850-2970 RPM from the two fans while running, and zero when stopped. I
did not independently calibrate the RPM readings.

For the final _PSR change, I ran two s2idle tests. With the charger
connected, the driver read supplied=1 and restored performance; it
stayed in performance afterwards. With the charger unplugged during
sleep, it read supplied=0 and restored balanced; it stayed balanced
afterwards. Requesting performance on battery then returned EOPNOTSUPP.
The logs include the resume decision and firmware readbacks.

I also built a full x86_64 kernel and both modules against the for-next
base below, without the WMI API adaptation. I used x86_64_defconfig with
BITLAND_MIFS_WMI and REDMI_WMI enabled, GCC 15.2.0 and W=1. I saw no
compiler warnings from either changed driver.

 .../wmi/devices/bitland-mifs-wmi.rst          |  31 ++++
 drivers/platform/x86/bitland-mifs-wmi.c       | 170 +++++++++++++++++-
 drivers/platform/x86/redmi-wmi.c              |   7 +
 3 files changed, 201 insertions(+), 7 deletions(-)

diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
index 9e86ecc29..fd966cf18 100644
--- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
+++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
@@ -7,6 +7,37 @@ Bitland MIFS driver (bitland-mifs-wmi)
 Introduction
 ============
 
+MECHREVO WUJIE15 PRO (HPT) firmware variant
+-----------------------------------------
+
+The MECHREVO WUJIE15 PRO with board WUJIE15 Series-HPT uses a reduced
+interface. The driver selects this variant using exact system vendor,
+product name and board name matches.
+
+The supported platform profiles are low-power (raw value 2), balanced
+(1), and performance (0). There is no separate full-speed mode.
+USB-C is the only external power input on this model. Performance is
+available on external power, but not on battery. The driver queries the
+ACPI adapter's _PSR for current power presence because USB-C connector
+ONLINE state may still be stale during resume. A failed query is not
+treated as external power being present.
+On resume, a saved performance profile becomes balanced if external
+power was removed, matching the firmware's AC-loss transition.
+
+Command 0x0d returns two little-endian tachometers, EC Fan 2 followed by
+Fan 1. No third fan or CPU-temperature input is provided. GPU switching,
+RGB modes and fan boost are not exposed. Keyboard backlight brightness
+uses the normal 0 through 3 values.
+
+Unsupported GET commands can return success (0x8000) with an empty
+payload. Successful queries alone therefore do not establish the
+presence of a sensor or control; the driver uses the known capabilities.
+Supported profile and backlight SET calls are also checked for a
+firmware acknowledgment.
+
+The event GUID is shared with redmi-wmi. On this exact DMI combination,
+redmi-wmi declines binding so bitland-mifs-wmi handles the notifications.
+
 
 EC WMI interface description
 ============================
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3a3731845..3193ae4bd 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -14,6 +14,7 @@
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
@@ -159,6 +160,19 @@ struct bitland_mifs_wmi_data {
 	struct device *hwmon_dev;
 	struct device *pp_dev;
 	enum platform_profile_option saved_profile;
+	bool is_wujie15_hpt;
+};
+
+/* Profile mapping and capabilities for the WUJIE15 PRO HPT board. */
+static const struct dmi_system_id bitland_wujie15_hpt[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "WUJIE15 PRO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE15 Series-HPT"),
+		},
+	},
+	{ }
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -167,12 +181,15 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 {
 	struct wmi_buffer in_buf = { .length = sizeof(*input), .data = (void *)input };
 	struct wmi_buffer out_buf = { 0 };
+	struct bitland_mifs_output reply;
 	int ret;
 
 	guard(mutex)(&data->lock);
 
-	if (!output)
+	if (!output && !data->is_wujie15_hpt)
 		return wmidev_invoke_procedure(data->wdev, 0, 1, &in_buf);
+	if (!output)
+		output = &reply;
 
 	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf, sizeof(*output));
 	if (ret)
@@ -181,6 +198,20 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	memcpy(output, out_buf.data, sizeof(*output));
 	kfree(out_buf.data);
 
+	/* HPT's supported profile/backlight calls acknowledge with 0x8000. */
+	if (data->is_wujie15_hpt) {
+		u16 status = get_unaligned_le16(output);
+
+		if (status == 0xe000)
+			return -EOPNOTSUPP;
+		if (status != 0x8000)
+			return -EIO;
+		dev_dbg(&data->wdev->dev,
+			"HPT op=%#x fn=%#x arg=%u value=%u status=%#x\n",
+			input->operation, input->function, input->payload[0],
+			output->data[0], status);
+	}
+
 	return 0;
 }
 
@@ -201,6 +232,22 @@ static int laptop_profile_get(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (data->is_wujie15_hpt) {
+		switch (result.data[0]) {
+		case 0:
+			*profile = PLATFORM_PROFILE_PERFORMANCE;
+			return 0;
+		case 1:
+			*profile = PLATFORM_PROFILE_BALANCED;
+			return 0;
+		case 2:
+			*profile = PLATFORM_PROFILE_LOW_POWER;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
 	switch (result.data[0]) {
 	case WMI_PP_BALANCED:
 		*profile = PLATFORM_PROFILE_BALANCED;
@@ -220,6 +267,26 @@ static int laptop_profile_get(struct device *dev,
 	return 0;
 }
 
+static int bitland_wujie15_is_supplied(void)
+{
+	struct acpi_device *adapter;
+	unsigned long long online;
+	acpi_status status;
+
+	/* USB-C ONLINE can still contain the pre-suspend connector state. */
+	adapter = acpi_dev_get_first_match_dev("ACPI0003", NULL, -1);
+	if (!adapter)
+		return -ENODEV;
+
+	/* This machine's adapter _PSR reads the current EC power-present bit. */
+	status = acpi_evaluate_integer(adapter->handle, "_PSR", NULL, &online);
+	acpi_dev_put(adapter);
+	if (ACPI_FAILURE(status) || online > 1)
+		return -EIO;
+
+	return online;
+}
+
 static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
 {
 	struct bitland_mifs_input input = {
@@ -229,7 +296,15 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
 	struct bitland_mifs_output output;
 	int ret;
 
-	/* Full-speed/performance mode requires DC power (not USB-C) */
+	/* WUJIE15 PRO is powered through USB-C only. */
+	if (data->is_wujie15_hpt) {
+		ret = bitland_wujie15_is_supplied();
+		if (ret < 0)
+			return ret;
+		return ret ? 0 : -EOPNOTSUPP;
+	}
+
+	/* Other models require the firmware's circular-hole adapter type. */
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
 
@@ -256,6 +331,27 @@ static int laptop_profile_set(struct device *dev,
 	int ret;
 	u8 val;
 
+	if (data->is_wujie15_hpt) {
+		switch (profile) {
+		case PLATFORM_PROFILE_LOW_POWER:
+			val = 2;
+			break;
+		case PLATFORM_PROFILE_BALANCED:
+			val = 1;
+			break;
+		case PLATFORM_PROFILE_PERFORMANCE:
+			ret = bitland_check_performance_capability(data);
+			if (ret)
+				return ret;
+			val = 0;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		input.payload[0] = val;
+		return bitland_mifs_wmi_call(data, &input, NULL);
+	}
+
 	switch (profile) {
 	case PLATFORM_PROFILE_LOW_POWER:
 		val = WMI_PP_QUIET;
@@ -286,9 +382,12 @@ static int laptop_profile_set(struct device *dev,
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
 {
+	struct bitland_mifs_wmi_data *data = drvdata;
+
 	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+	if (!data->is_wujie15_hpt)
+		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
 	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
 	return 0;
@@ -314,13 +413,25 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	enum platform_profile_option profile = data->saved_profile;
+	int supplied;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
-	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	/* Match the firmware's performance-to-balanced transition on AC loss. */
+	if (data->is_wujie15_hpt &&
+	    profile == PLATFORM_PROFILE_PERFORMANCE) {
+		supplied = bitland_wujie15_is_supplied();
+		if (supplied < 0)
+			return supplied;
+		if (!supplied)
+			profile = PLATFORM_PROFILE_BALANCED;
+	}
+
+	dev_dbg(dev, "Resuming, restoring profile %d\n", profile);
+	return laptop_profile_set(dev, profile);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
@@ -386,7 +497,16 @@ static int laptop_hwmon_read_string(struct device *dev,
 				    enum hwmon_sensor_types type, u32 attr,
 				    int channel, const char **str)
 {
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	static const char *const hpt_fan_labels[] = { "Fan 2", "Fan 1" };
+
 	if (type == hwmon_fan && attr == hwmon_fan_label) {
+		if (data->is_wujie15_hpt) {
+			if (channel < 0 || channel >= ARRAY_SIZE(hpt_fan_labels))
+				return -EINVAL;
+			*str = hpt_fan_labels[channel];
+			return 0;
+		}
 		if (channel >= 0 && channel < ARRAY_SIZE(fan_labels)) {
 			*str = fan_labels[channel];
 			return 0;
@@ -414,6 +534,18 @@ static const struct hwmon_chip_info laptop_chip_info = {
 	.info = laptop_hwmon_info,
 };
 
+/* HPT fills only the F2/F1 tachometers; the temperature GET is a no-op. */
+static const struct hwmon_channel_info *hpt_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info hpt_chip_info = {
+	.ops = &laptop_hwmon_ops,
+	.info = hpt_hwmon_info,
+};
+
 static int laptop_kbd_led_set(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
@@ -606,7 +738,28 @@ static const struct attribute *const laptop_attrs[] = {
 	&dev_attr_fan_boost.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(laptop);
+
+static umode_t laptop_attr_is_visible(struct kobject *kobj,
+				      const struct attribute *attr, int index)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(kobj_to_dev(kobj));
+
+	/* All three custom attributes require methods absent on HPT. */
+	if (data && data->is_wujie15_hpt)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group laptop_group = {
+	.attrs_const = laptop_attrs,
+	.is_visible_const = laptop_attr_is_visible,
+};
+
+static const struct attribute_group *laptop_groups[] = {
+	&laptop_group,
+	NULL
+};
 
 static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
@@ -661,6 +814,7 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct bitland_mifs_wmi_data *drv_data;
+	const struct hwmon_chip_info *chip_info;
 	enum bitland_wmi_device_type dev_type =
 		(enum bitland_wmi_device_type)(unsigned long)context;
 	struct led_init_data init_data = {
@@ -675,6 +829,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return -ENOMEM;
 
 	drv_data->wdev = wdev;
+	drv_data->is_wujie15_hpt = dmi_check_system(bitland_wujie15_hpt);
 
 	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
 	if (ret)
@@ -708,10 +863,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return PTR_ERR(drv_data->pp_dev);
 
 	/* Register hwmon */
+	chip_info = drv_data->is_wujie15_hpt ? &hpt_chip_info : &laptop_chip_info;
 	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
 								   "bitland_mifs",
 								   drv_data,
-								   &laptop_chip_info,
+								   chip_info,
 								   NULL);
 	if (IS_ERR(drv_data->hwmon_dev))
 		return PTR_ERR(drv_data->hwmon_dev);
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
index cc82ef502..de41642b7 100644
--- a/drivers/platform/x86/redmi-wmi.c
+++ b/drivers/platform/x86/redmi-wmi.c
@@ -4,6 +4,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/module.h>
@@ -69,6 +70,12 @@ static int redmi_wmi_probe(struct wmi_device *wdev, const void *context)
 	struct redmi_wmi *data;
 	int err;
 
+	/* This shared GUID belongs to bitland-mifs-wmi on the WUJIE15 PRO HPT. */
+	if (dmi_match(DMI_SYS_VENDOR, "MECHREVO") &&
+	    dmi_match(DMI_PRODUCT_NAME, "WUJIE15 PRO") &&
+	    dmi_match(DMI_BOARD_NAME, "WUJIE15 Series-HPT"))
+		return -ENODEV;
+
 	/* Init dev */
 	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
