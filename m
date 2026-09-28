Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F536F8E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578182; cv=none; b=ETH+bniUc1ZWS1TskzUvetUui3KVks7euChDRoxvTeNoUonmhGDx46hGtU8/qVUsGyMtomUQr+Gvzm62eR6xu1IKR4fssAcUdF51O571SVizBsR4GnzhIN9QCL3onIUiWQT1QaZUi1rBa2kRoQbkH4tONv6hfDrG8tiMBHf8r6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578182; c=relaxed/simple;
	bh=QyPkaLVei5yR2Z/4twuIycirH7HuAo+N4abNDpttkfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ps8QVmHXAMIqn8OxQta0aqNWXo90p8IwnOMSvhNQqdpxYy9WmTb9UStHPvVZSCOl7lbuFHsP1Xs8iFqOSiMed8sdL7Gd6+4HJgX56aolPUGQNBPTLt1ndXnxbD937Faq6b8Nyrqw3NkOiFVfXHPX4H5UPuTAy4yDAMy2s1sgWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7aAMb0c; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7aAMb0c"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so1680217241.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578180; x=1791182980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jlXzJVUfhTz5P1BiBtR2RSw8kerRuIevFT30L5kQNGw=;
        b=j7aAMb0cmD+kpk9e2P4j7rge/xVcgtzv5ssVTciGpntQXgBcXSLg1ednHm21RG45BA
         3uzdjOCZsWRnHNHIxJM0yV2MXYx1bF9YWlipzXrZNHUPiszorGP2xsvkpkY7XuZ5ZxDS
         679wr/nxKitttfhsgu2B3vdtuTX0HHEKQWb4bu0VfA3Tu6z84D3XdoYBM23W8FWxyoMp
         2j+hqNiOxd/qoxIh9nby4rosPklmZMzhonEpuz5B9ZbDXOAKIP1E5GsTH906QrOJlcHi
         k4EVdl1fbNuAwrSjgEsr0NsC+V3iDTck3rhmSyhWgDANHOsW/gKbTxBuoNHWHgHlCQxx
         TdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578180; x=1791182980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlXzJVUfhTz5P1BiBtR2RSw8kerRuIevFT30L5kQNGw=;
        b=AvmmbAfB/B4e054c3BmSgM3Ev99tfu/6Tjj1tRtqLpvEbAnxh5oQfK3tfUnBHrRW4l
         MHkUZ7+9z2psJWOzbQJ6boNBRxZRxf7A0Ro2XKqiCpAT4ljUXE2jl9k4h9CG3X0O/B91
         kQ5jna3s8lKa1wlwWmsyMgpXhdLRvJKy+7Ck+xP28N0bVAucmk5xmo50b/ODYqDdHUWB
         Nh3wd55vu9k1OAsZ3oWEBj4s/DpRsxrBXuE7uqKcjI6KLGVJToWpeD+UOyYXuG3nexUH
         +AZsk4Hk/RJiwzB2jlC17avqYbvsUzILNAzFiIU12CDEsUcWEX/2pX74dtFYHpjdAu2c
         jdiw==
X-Forwarded-Encrypted: i=1; AKwUvBz7jTYdGkiFQtNbkEICDWjtuN/Mp/Aa/B+sesSDZAyJGbeuvkBKyxm2st2ksfu8r3Q4MGWcyQKQfD+U9vA7EcMk3O2d@vger.kernel.org
X-Gm-Message-State: AFuF++nRB9xrthCaomp3k7iMQjRTxqoyl1G/OXSOna+V5JH5ws1mA0JF
	+LMl/4DlL/MKKL/IbYZmuFojhj7NVcm9Gu90zJm+/XzcMD1gc+qZ9F92
X-Gm-Gg: AYBFou0ZYzRNYGEspvdj/zTFZxqUEf6hnJDWPIwg8OrN9Zm5dZzhkKL14+R2QQPsbl0
	YEVGMsGWH/xcaCjXoXlEcHLCVyeImm+ElSZflaxwk1Og7yk3rMh5GxtW20hQdQx3rCoBN3BgSWV
	Ks/o4ptrTanN6MXcocjJ4krqdM5OCzs4eBvOBS4S/DwC28lth34Rw6SMbUiHWihUOD8Z61Co6ab
	n9ckD+rKEfzU/HLKZDFHD7Z2Cb8PNAQEOoLExdGd3U9oxK/9AIVTmhx9X7ja8nNTZEVePJllHbH
	x3W2PFBYO47UUa5K3Yb0VEdm2pJTzkckwavM109Oi9LoKUDsdJCP/88bK1MAyBQQJoSss4u7c5m
	Su2VgAu+RAy7Qy5MoaGSKps5vBYWdwzuj8udwJw460WGgUMFUR7Bvfj17ihPuuKCToQPqC7KTx/
	XYZaT15aw/3htxW3UMksGa9zScX0FQkTfVpw/iBlHmRz0TZ+KV4BodtfsFHPJUnnN9FNIql2ThS
	YGKAhK5C1sTFr4Bv2MMnV5hY6i59hAdNJteWg==
X-Received: by 2002:a05:6102:534a:b0:7b4:7095:fe15 with SMTP id ada2fe7eead31-7b470960932mr1035043137.24.1790578179972;
        Sun, 27 Sep 2026 23:49:39 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b398ee8b75sm8404923137.2.2026.09.27.23.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:49:38 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
Date: Mon, 28 Sep 2026 03:49:18 -0300
Message-ID: <20260928064918.80526-1-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the TIMI Redmi Book Pro 14 2022 (TM2107), the MIFS WMI response uses
a different layout from the one currently assumed by the driver.
This causes profile reads to fail or report an incorrect profile.

The response contains a 30-byte OutData field followed by a 16-bit
Reserved field. On this model, the profile value is returned in
OutData[2], while the return code is stored in the trailing 16-bit
field.

Selecting the modes in GCommandCenter and reading the WMI response
on this machine yielded the following values:

0: performance
1: balanced
2: quiet

Handle this model through DMI-specific driver_data, normalize its
response layout, and map its profile values correctly. Expose only
the three supported profiles.

Require external power for performance mode, including the original
USB-C charger, matching the behavior observed in GCommandCenter.
Skip the adapter-type query on this model.

Build-tested against pdx86/for-next with W=1. Built and tested on
Linux 7.2.7-zen1-1-zen on a Redmi Book Pro 14 2022 (TM2107).
Verified profile switching, performance selection with the USB-C
charger connected, and rejection while running on battery.

Link: https://lkml.iu.edu/2608.2/00163.html
Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Assisted-by: LLM
Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
---
Changes since v1:
- Rebased on pdx86/for-next.
- Use a generic DMI table with per-model driver_data.
- Add the DMI dependency.
- Normalize the response layout before validating the return code
  and function ID.
- Correct the profile mapping using observations from GCommandCenter.
- Expose only the three supported profiles.

The previous version was mistakenly based on the commit used by my
local Linux distribution instead of pdx86/for-next. Sorry for the
confusion.

I also collected WMI response data on Windows while switching profiles
in GCommandCenter. I can share those results if useful.

v1: https://lore.kernel.org/20260925032001.111062-1-matias.civadda2342001@gmail.com/

 drivers/platform/x86/Kconfig            |   1 +
 drivers/platform/x86/bitland-mifs-wmi.c | 135 +++++++++++++++++-------
 2 files changed, 97 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 45f15f93afa7..e3351ee1dd43 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -116,6 +116,7 @@ config GIGABYTE_WMI
 config BITLAND_MIFS_WMI
 	tristate "Bitland MIFS (MiInterface) WMI driver"
 	depends on ACPI_WMI
+	depends on DMI
 	depends on HWMON
 	depends on INPUT
 	depends on LEDS_CLASS
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index dd1648b7de77..29e365b54c84 100644
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
@@ -131,6 +132,58 @@ struct bitland_mifs_output {
 	u8 data[28];
 } __packed;
 
+/* TM2107 places the return code after the function ID and payload. */
+struct bitland_mifs_output_tm2107 {
+	__le16 function;
+	u8 data[28];
+	__le16 return_code;
+} __packed;
+
+struct bitland_mifs_quirks {
+	const enum platform_profile_option *profiles;
+	size_t num_profiles;
+	bool return_code_at_end;
+	bool skip_ac_type_check;
+};
+
+static const enum platform_profile_option bitland_profiles[] = {
+	[WMI_PP_BALANCED] = PLATFORM_PROFILE_BALANCED,
+	[WMI_PP_PERFORMANCE] = PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+	[WMI_PP_QUIET] = PLATFORM_PROFILE_LOW_POWER,
+	[WMI_PP_FULL_SPEED] = PLATFORM_PROFILE_PERFORMANCE,
+};
+
+/* Values observed after selecting each mode in GCommandCenter. */
+static const enum platform_profile_option tm2107_profiles[] = {
+	[0] = PLATFORM_PROFILE_PERFORMANCE,
+	[1] = PLATFORM_PROFILE_BALANCED,
+	[2] = PLATFORM_PROFILE_LOW_POWER,
+};
+
+static const struct bitland_mifs_quirks bitland_default_quirks = {
+	.profiles = bitland_profiles,
+	.num_profiles = ARRAY_SIZE(bitland_profiles),
+};
+
+static const struct bitland_mifs_quirks bitland_tm2107_quirks = {
+	.profiles = tm2107_profiles,
+	.num_profiles = ARRAY_SIZE(tm2107_profiles),
+	.return_code_at_end = true,
+	.skip_ac_type_check = true,
+};
+
+static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
+		},
+		.driver_data = (void *)&bitland_tm2107_quirks,
+	},
+	{}
+};
+
 struct bitland_mifs_event {
 	u8 event_type;
 	u8 event_id;
@@ -154,6 +207,7 @@ struct bitland_fan_notify_data {
 
 struct bitland_mifs_wmi_data {
 	struct wmi_device *wdev;
+	const struct bitland_mifs_quirks *quirks;
 	struct mutex lock;		/* Protects WMI calls */
 	struct led_classdev kbd_led;
 	struct notifier_block notifier;
@@ -180,6 +234,17 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 
 	struct bitland_mifs_output *result __free(kfree) = out_buf.data;
 
+	if (data->quirks->return_code_at_end) {
+		const struct bitland_mifs_output_tm2107 *raw = out_buf.data;
+		struct bitland_mifs_output normalized = {
+			.return_code = raw->return_code,
+			.function = raw->function,
+		};
+
+		memcpy(normalized.data, raw->data, sizeof(normalized.data));
+		*result = normalized;
+	}
+
 	switch (le16_to_cpu(result->return_code)) {
 	case WMI_RETURN_CODE_SUCCESS:
 		break;
@@ -202,6 +267,7 @@ static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
@@ -213,22 +279,10 @@ static int laptop_profile_get(struct device *dev,
 	if (ret)
 		return ret;
 
-	switch (result.data[0]) {
-	case WMI_PP_BALANCED:
-		*profile = PLATFORM_PROFILE_BALANCED;
-		break;
-	case WMI_PP_PERFORMANCE:
-		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
-		break;
-	case WMI_PP_QUIET:
-		*profile = PLATFORM_PROFILE_LOW_POWER;
-		break;
-	case WMI_PP_FULL_SPEED:
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		break;
-	default:
+	if (result.data[0] >= quirks->num_profiles)
 		return -EINVAL;
-	}
+
+	*profile = quirks->profiles[result.data[0]];
 	return 0;
 }
 
@@ -241,6 +295,10 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
 	struct bitland_mifs_output output;
 	int ret;
 
+	/* TM2107 accepts its USB-C charger, without an AC type query. */
+	if (data->quirks->skip_ac_type_check)
+		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
+
 	/* Full-speed/performance mode requires DC power (not USB-C) */
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
@@ -263,47 +321,40 @@ static int laptop_profile_set(struct device *dev,
 			      enum platform_profile_option profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_SET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
+	size_t i;
 	int ret;
-	u8 val;
 
-	switch (profile) {
-	case PLATFORM_PROFILE_LOW_POWER:
-		val = WMI_PP_QUIET;
-		break;
-	case PLATFORM_PROFILE_BALANCED:
-		val = WMI_PP_BALANCED;
-		break;
-	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
-		if (ret)
-			return ret;
-		val = WMI_PP_PERFORMANCE;
-		break;
-	case PLATFORM_PROFILE_PERFORMANCE:
+	for (i = 0; i < quirks->num_profiles; i++) {
+		if (profile == quirks->profiles[i])
+			break;
+	}
+	if (i == quirks->num_profiles)
+		return -EOPNOTSUPP;
+
+	if (profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE ||
+	    profile == PLATFORM_PROFILE_PERFORMANCE) {
 		ret = bitland_check_performance_capability(data);
 		if (ret)
 			return ret;
-		val = WMI_PP_FULL_SPEED;
-		break;
-	default:
-		return -EOPNOTSUPP;
 	}
 
-	input.payload[0] = val;
+	input.payload[0] = i;
 
 	return bitland_mifs_wmi_call(data, &input, NULL);
 }
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
 {
-	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
-	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	struct bitland_mifs_wmi_data *data = drvdata;
+	size_t i;
+
+	for (i = 0; i < data->quirks->num_profiles; i++)
+		set_bit(data->quirks->profiles[i], choices);
 
 	return 0;
 }
@@ -659,6 +710,7 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct bitland_mifs_wmi_data *drv_data;
+	const struct dmi_system_id *dmi_id;
 	enum bitland_wmi_device_type dev_type =
 		(enum bitland_wmi_device_type)(unsigned long)context;
 	struct led_init_data init_data = {
@@ -674,6 +726,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	drv_data->wdev = wdev;
 
+	drv_data->quirks = &bitland_default_quirks;
+	dmi_id = dmi_first_match(bitland_mifs_dmi_table);
+	if (dmi_id)
+		drv_data->quirks = dmi_id->driver_data;
+
 	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
 	if (ret)
 		return ret;

base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

