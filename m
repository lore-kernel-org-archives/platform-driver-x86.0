Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727316;
	b=rvJxdoqd639hPAJRzTfywwf2v8o7Hw01FWriilUsg2BS5YFDqsRzHVTP2kD+qT7TJtGI
	 ghHy8nmjOTb5QIJoi+ZaCdkf/L9xdtY6apc7OpS1gsTfisacOHdYm3s70BtBgUHT2pgvH
	 Egexmxv/rmEG0NgyhfZ6sWDKOxYFhbQRQgu+AsC2hJIH6KAN61bWG/n3uN80oPzGYM/LT
	 HmHMbQS2z33/G/quyun0+2bA1QsIAzSyah4JzUG/4613wrK7/Njwhx/OCVv1asaoZwi0N
	 brcqLjgzYQDj9F/8zNNuLsR7wxuglL3Y4KypOnMjUVO5L4MVQuFPqIaAyW8SVkQKp4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727316;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:Date:Message-Id:
	 Mime-Version:References:In-Reply-To:From:Subject:Received:
	 Content-Transfer-Encoding:To:X-Mailer:Cc:X-Original-From:
	 Content-Type;
	bh=TxyWkPyZq8MfK7gSskp+NiDOaTgp+e4VE+CN5eiLy2k=;
	b=WPNBz/wZEaJn0ZYtdHGKpmftHiNAxnpstTUg8ooB/yhxmYzlWDVOSRfNBD3WWiAS+/2f
	 /sjFlFzvGIO52dFiVdW6MzR0O2+mVBUOhv3Kfj5ZBcFOo6HObRryN3XjVpzKly9whWb19
	 w57gZru+nJgTNt+deuCSDEXtKl2DXs42GkUrBN9YqF4KK4/zBUi9nceA3KMBQA1U4XnJV
	 wJ93j0OuKv14m+L6Uw0W7J5ALbZopZ2Epjn6cHOdaKLmNU6NKOFHppoU/AqhFliNRUboh
	 YZYYzIEpopfR04bHFptpYe9kx74sslBBXKmEAwNIOzrrS4mKd75ep+yNKDSK03q1izA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qb.edu.kg;
	spf=pass smtp.mailfrom=qb.edu.kg;
	dkim=pass header.d=qb-edu-kg.20200927.dkim.feishu.cn header.i=@qb-edu-kg.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=mAvUdg1i;
	arc=none smtp.remote-ip=71.18.227.2
Received: from sg-2-2.ptr.blmpb.com (sg-2-2.ptr.blmpb.com [71.18.227.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A1606A31F
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 03:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51A1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=qb.edu.kg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qb.edu.kg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qb-edu-kg.20200927.dkim.feishu.cn header.i=@qb-edu-kg.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=mAvUdg1i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=qb-edu-kg.20200927.dkim.feishu.cn; t=1792727309;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=TxyWkPyZq8MfK7gSskp+NiDOaTgp+e4VE+CN5eiLy2k=;
 b=mAvUdg1isurN8am+J3ZXKghUGOo5DFm6x+6qTM0VV2iUc+MMwVrCoYWvL8f/fPI1GHL12L
 uy2CdQ7kz5LXpONMHS67ZAy5WWbV8jdiS699PVKIGcjaK070IAU6Ds9tp6Ep1PIKvvmmJs
 l/9h4KggjNv0HCRV6nOGXZwq8LOtA7b7bTP8aiY9h6ezn4dMCZoW3FEHjPvHlIdhxsMlOK
 H53rWPAkggQKNVkCTXD0ieobv1ET5u7C2qd838t5kQZYGMDtQ+dO0YjtxTM06FRnuKiZw6
 0wrYU35DcNu0PH5UzdLPwtlBC/YpjCn9blZvY/pPGHSy+w2gkdDWA9EkgdAB8Q==
X-Lms-Return-Path: <lba+26adad90b+7987e0+vger.kernel.org+admin@qb.edu.kg>
Date: Fri, 23 Oct 2026 11:48:22 +0800
Message-Id: <20261023034822.141263-2-admin@qb.edu.kg>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023034822.141263-1-admin@qb.edu.kg>
In-Reply-To: <20261023034822.141263-1-admin@qb.edu.kg>
From: "dydydd" <admin@qb.edu.kg>
Subject: [PATCH 2/2] platform/x86: uniwill: Add platform profile support
Received: from archlinux.localdomain ([223.104.85.253]) by smtp.feishu.cn with ESMTPS; Fri, 23 Oct 2026 11:48:26 +0800
Content-Transfer-Encoding: 7bit
To: "Armin Wolf" <W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
Cc: "Hans de Goede" <hansg@kernel.org>, 
	"Ilpo Jarvinen" <ilpo.jarvinen@linux.intel.com>, 
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Original-From: dydydd <admin@qb.edu.kg>
Content-Type: text/plain; charset=UTF-8

The EC exposes PL1/PL2/PL4 registers, but the driver did not provide any
way to change them, so the admin guide stated that platform profile
support was not implemented.

Add a standard platform_profile device that writes the three power limit
registers. The values are per-machine, so they are stored in the device
descriptor instead of being hardcoded in the profile code, and machines
without known values do not register the interface at all.

The EC only latches writes to these registers while manual control (bit 0
of EC_ADDR_AP_OEM) is asserted; uniwill_ec_init() already sets that bit
for the lifetime of the driver, so the profile code re-asserts it before
writing to stay correct if the EC drops it.

After a cold boot the registers read back as 0, meaning "no limit set".
Derive the reported profile from PL1 and apply the default profile in that
case, so the sysfs value never disagrees with the hardware.

Tested on: MECHREVO Jiaolong16K Series GM6BG0Q, BIOS N.1.19MRO15,
           EC 1.24.

Signed-off-by: dydydd <admin@qb.edu.kg>
---
 .../admin-guide/laptops/uniwill-laptop.rst    |  10 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 169 +++++++++++++++++-
 2 files changed, 177 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
index be50b45b..9442ae71 100644
--- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -38,7 +38,15 @@ two fans. Userspace applications can access sensor readings over the hwmon sysfs
 Platform profile
 ----------------
 
-Support for changing the platform performance mode is currently not implemented.
+On devices that implement the EC power limit registers, the ``uniwill-laptop`` driver
+registers a standard platform profile device. It is available at
+``/sys/firmware/acpi/platform_profile`` and accepts ``low-power``, ``balanced`` and
+``performance``.
+
+Each profile maps to a set of PL1/PL2/PL4 values taken from the OEM control center
+configuration for that machine. Writing a profile updates the EC power limits, which
+the firmware keeps until the next reboot. Machines without known profile values do not
+expose the interface.
 
 Battery Charging Control
 ------------------------
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 94ed83ed..6d91b8f8 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -39,6 +39,7 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
+#include <linux/platform_profile.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/regmap.h>
@@ -369,6 +370,18 @@
 #define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
 #define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
 #define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
+#define UNIWILL_FEATURE_PLATFORM_PROFILE	BIT(15)
+
+/*
+ * Power limits used by one platform profile. The EC keeps these in single
+ * byte registers, so the values are plain watts.
+ */
+struct uniwill_performance_profile {
+	enum platform_profile_option profile;
+	u8 pl1;
+	u8 pl2;
+	u8 pl4;
+};
 
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING = 0,
@@ -418,6 +431,10 @@ struct uniwill_data {
 	struct notifier_block nb;
 	struct mutex usb_c_power_priority_lock; /* Protects dependent bit write and state safe */
 	enum usb_c_power_priority_options last_usb_c_power_priority_option;
+	struct mutex profile_lock;	/* Protects profile writes */
+	enum platform_profile_option current_profile;
+	const struct uniwill_performance_profile *profiles;
+	unsigned int num_profiles;
 };
 
 struct uniwill_battery_entry {
@@ -430,6 +447,9 @@ struct uniwill_device_descriptor {
 	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
 	u8 lightbar_max_brightness;
+	/* Only used when UNIWILL_FEATURE_PLATFORM_PROFILE is set. */
+	const struct uniwill_performance_profile *profiles;
+	unsigned int num_profiles;
 	/* Executed during driver probing */
 	int (*probe)(struct uniwill_data *data);
 };
@@ -619,6 +639,9 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_CTGP_DB_TPP_OFFSET:
 	case EC_ADDR_CTGP_DB_DB_OFFSET:
 	case EC_ADDR_USB_C_POWER_PRIORITY:
+	case EC_ADDR_PL1_SETTING:
+	case EC_ADDR_PL2_SETTING:
+	case EC_ADDR_PL4_SETTING:
 		return true;
 	default:
 		return false;
@@ -665,6 +688,9 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_CTGP_DB_TPP_OFFSET:
 	case EC_ADDR_CTGP_DB_DB_OFFSET:
 	case EC_ADDR_USB_C_POWER_PRIORITY:
+	case EC_ADDR_PL1_SETTING:
+	case EC_ADDR_PL2_SETTING:
+	case EC_ADDR_PL4_SETTING:
 		return true;
 	default:
 		return false;
@@ -691,6 +717,9 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_OEM_4:
 	case EC_ADDR_CHARGE_CTRL:
 	case EC_ADDR_USB_C_POWER_PRIORITY:
+	case EC_ADDR_PL1_SETTING:
+	case EC_ADDR_PL2_SETTING:
+	case EC_ADDR_PL4_SETTING:
 		return true;
 	default:
 		return false;
@@ -1048,6 +1077,121 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
 	return 0;
 }
 
+/*
+ * Platform profile support.
+ *
+ * The EC latches PL1/PL2/PL4 only while manual control (bit 0 of
+ * EC_ADDR_AP_OEM) is asserted, otherwise it overwrites them with its own
+ * values within a few seconds. uniwill_ec_init() already sets that bit for
+ * the lifetime of the driver, so the profiles can simply write the registers.
+ */
+static const struct uniwill_performance_profile *
+uniwill_lookup_profile(struct uniwill_data *data, enum platform_profile_option profile)
+{
+	for (int i = 0; i < data->num_profiles; i++) {
+		if (data->profiles[i].profile == profile)
+			return &data->profiles[i];
+	}
+
+	return NULL;
+}
+
+static int uniwill_profile_get(struct device *dev, enum platform_profile_option *profile)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+
+	*profile = data->current_profile;
+
+	return 0;
+}
+
+static int uniwill_profile_set(struct device *dev, enum platform_profile_option profile)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	const struct uniwill_performance_profile *limits;
+	int ret;
+
+	limits = uniwill_lookup_profile(data, profile);
+	if (!limits)
+		return -EOPNOTSUPP;
+
+	guard(mutex)(&data->profile_lock);
+
+	ret = regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, EC_ADDR_PL1_SETTING, limits->pl1);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, EC_ADDR_PL2_SETTING, limits->pl2);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, EC_ADDR_PL4_SETTING, limits->pl4);
+	if (ret < 0)
+		return ret;
+
+	data->current_profile = profile;
+
+	return 0;
+}
+
+static int uniwill_profile_probe(void *drvdata, unsigned long *choices)
+{
+	struct uniwill_data *data = drvdata;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_PLATFORM_PROFILE))
+		return -ENODEV;
+
+	for (int i = 0; i < data->num_profiles; i++)
+		set_bit(data->profiles[i].profile, choices);
+
+	return 0;
+}
+
+static const struct platform_profile_ops uniwill_profile_ops = {
+	.probe = uniwill_profile_probe,
+	.profile_get = uniwill_profile_get,
+	.profile_set = uniwill_profile_set,
+};
+
+static int uniwill_profile_init(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_PLATFORM_PROFILE))
+		return 0;
+
+	/*
+	 * The EC reports 0 after a cold boot, which means "no limit set". Derive
+	 * the initial profile from PL1 so the sysfs value always matches what the
+	 * firmware is actually doing.
+	 */
+	ret = regmap_read(data->regmap, EC_ADDR_PL1_SETTING, &value);
+	if (ret < 0)
+		return ret;
+
+	data->current_profile = PLATFORM_PROFILE_BALANCED;
+	for (int i = 0; i < data->num_profiles; i++) {
+		if (data->profiles[i].pl1 == value) {
+			data->current_profile = data->profiles[i].profile;
+			break;
+		}
+	}
+
+	if (!value) {
+		ret = uniwill_profile_set(data->dev, data->current_profile);
+		if (ret < 0)
+			dev_warn(data->dev, "Failed to apply default profile: %d\n", ret);
+	}
+
+	return PTR_ERR_OR_ZERO(devm_platform_profile_register(data->dev, DRIVER_NAME, data,
+							      &uniwill_profile_ops));
+}
+
 static const char * const usb_c_power_priority_text[] = {
 	[USB_C_POWER_PRIORITY_CHARGING]		= "charging",
 	[USB_C_POWER_PRIORITY_PERFORMANCE]	= "performance",
@@ -2331,6 +2475,10 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = devm_mutex_init(&pdev->dev, &data->profile_lock);
+	if (ret < 0)
+		return ret;
+
 	ret = uniwill_ec_init(data);
 	if (ret < 0)
 		return ret;
@@ -2339,6 +2487,8 @@ static int uniwill_probe(struct platform_device *pdev)
 	data->kbd_led_single_color = device_descriptor.kbd_led_single_color;
 	data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
 	data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
+	data->profiles = device_descriptor.profiles;
+	data->num_profiles = device_descriptor.num_profiles;
 
 	/*
 	 * Some devices might need to perform some device-specific initialization steps
@@ -2371,6 +2521,10 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = uniwill_profile_init(data);
+	if (ret < 0)
+		return ret;
+
 	ret = usb_c_power_priority_init(data);
 	if (ret < 0)
 		return ret;
@@ -2677,6 +2831,12 @@ static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
 	.kbd_led_max_brightness = 4,
 };
 
+static const struct uniwill_performance_profile mechrevo_gm6bg0q_profiles[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,	35, 35, 100 },
+	{ PLATFORM_PROFILE_BALANCED,	65, 65, 100 },
+	{ PLATFORM_PROFILE_PERFORMANCE,	80, 80, 100 },
+};
+
 static struct uniwill_device_descriptor mechrevo_gm6bg0q_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -2690,7 +2850,14 @@ static struct uniwill_device_descriptor mechrevo_gm6bg0q_descriptor __initdata =
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
-		    UNIWILL_FEATURE_USB_POWERSHARE,
+		    UNIWILL_FEATURE_USB_POWERSHARE |
+		    UNIWILL_FEATURE_PLATFORM_PROFILE,
+	/*
+	 * Taken from the OEM control center profiles (Mode1/2/3_Profile1.json).
+	 * Low power and balanced are the "office" and "gaming" profiles.
+	 */
+	.profiles = mechrevo_gm6bg0q_profiles,
+	.num_profiles = ARRAY_SIZE(mechrevo_gm6bg0q_profiles),
 	.kbd_led_single_color = false,
 	.kbd_led_max_brightness = 4,
 };
-- 
2.56.0
