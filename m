Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B84657C6;
	Wed,  5 Aug 2026 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971149; cv=none; b=HWeZi+hz2Jr+fy7o1cqPcaU0hBE5Qi8bLhsq4D3UCl0wIF+8paLD4pQaMZhsbI4EVIq2m8SpTaBbKLkiAvveDNQGTPXxMfh8uaIkpA594+vPp8aPbESsFd6Cma8dIf0N6+qMOJsc7oGQ7vMR3nH+1AkSzjy6NUMXXufvTtoZmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971149; c=relaxed/simple;
	bh=hz1QsX/6moKyxPFyy/zqLCCt0YRwqDYcPrONwvZP504=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STRUUME7MBL9yGtNOx/Z9gYOqK23VWF0Wg/zYgOa0UsvyBkVNsVH3X1K608ShBJZ8qcgxikKeSRL8SMc9vyAdrSRzY1uIXQ5PGZzyEjXIK0q0Tzd0Vl+1mkg5VyYPJ3K/02+DEjDpQgAKb3vgg5vfA7GZ5vmIvwEeRjNA9gYnew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Ohd+YvHu; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Ohd+YvHu"
Received: from wsembach-tuxedo.fritz.box (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 0BA3D2FC0077;
	Thu,  6 Aug 2026 01:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785971143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okFPJIDG2Qyz2ZWDWPACG4A52uTrEfnFz4boAwvWJVs=;
	b=Ohd+YvHu+cdq1WmkoVeG87VlsYXRS5g9RV0EqSFAPYADWP2pgLuFsUAs/fsH2bT9aLvqhl
	Lp2tbSXRQuNc5ar8U0a2BtVS4XeJZYnlvbMuGDQNVIJvIkJB1t+WaQ/6fL01t36E7jZDqX
	U81ua62IfmmEeYrauvkjSlSlbVPfdKg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: uniwill-laptop: Enable kb backlight and lightbar for TUXEDO
Date: Thu,  6 Aug 2026 01:04:52 +0200
Message-ID: <20260805230538.464753-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805230538.464753-1-wse@tuxedocomputers.com>
References: <20260805230538.464753-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable EC controlled keyboard backlight across the board for TUXEDO
devices.

This has split up the device descriptors even more, so the "featureset"
naming scheme was dropped in favor of a "generalized board_name" naming
scheme.

Also Stellaris and Polaris Gen3 are now identified by product_sku to split
them up.

Also some TUXEDO devices with lightbar still had the support missing. This
patch completes the list in this point.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
V1->V2: No change

 drivers/platform/x86/uniwill/uniwill-acpi.c | 309 +++++++++++++++-----
 1 file changed, 233 insertions(+), 76 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 5c5bb6d104494..58cd4312c869d 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -645,6 +645,7 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_BIOS_OEM:
 	case EC_ADDR_PWM_1:
 	case EC_ADDR_PWM_2:
+	case EC_ADDR_SUPPORT_1:
 	case EC_ADDR_SUPPORT_2:
 	case EC_ADDR_TRIGGER:
 	case EC_ADDR_SWITCH_STATUS:
@@ -684,6 +685,7 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_BIOS_OEM:
 	case EC_ADDR_PWM_1:
 	case EC_ADDR_PWM_2:
+	case EC_ADDR_SUPPORT_1:
 	case EC_ADDR_SUPPORT_2:
 	case EC_ADDR_TRIGGER:
 	case EC_ADDR_SWITCH_STATUS:
@@ -2724,35 +2726,47 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 	.lightbar_max_brightness = 200,
 };
 
-/*
- * The featuresets below reflect somewhat chronological changes:
- * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
- * 2 -> 3: UNIWILL_FEATURE_USB_C_POWER_PRIORITY is removed from the EC firmware.
- * Some devices might divert from this timeline.
- */
+static struct uniwill_device_descriptor pfxnuxx_pfxluxx_phxprxx_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = true,
+	.kbd_led_max_brightness = 2,
+};
 
-static struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
+static struct uniwill_device_descriptor gkxmrxx_gkxnpxx_gkxnrxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
-		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = false,
+	.kbd_led_max_brightness = 4,
 };
 
-static struct uniwill_device_descriptor tux_featureset_1_nvidia_descriptor __initdata = {
+static struct uniwill_device_descriptor gmxmpxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_LIGHTBAR |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+	.lightbar_max_brightness = 36,
 };
 
-static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __initdata = {
+static struct uniwill_device_descriptor phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
@@ -2761,10 +2775,109 @@ static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = true,
+	.kbd_led_max_brightness = 2,
+};
+
+static struct uniwill_device_descriptor gmxmgxx_gmxngxx_gmxxgxx_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = false,
+	.kbd_led_max_brightness = 4,
+};
+
+static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_pol_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = false,
+	.kbd_led_max_brightness = 4,
+};
+
+static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_ste_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_LIGHTBAR |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+	.lightbar_max_brightness = 36,
 };
 
-static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __initdata = {
+static int gmxrgxx_probe(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_1, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value & LIGHTBAR) {
+		data->features |= UNIWILL_FEATURE_LIGHTBAR;
+		data->lightbar_max_brightness = 36;
+	}
+
+	ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value & RGB_KEYBOARD) {
+		data->features |= UNIWILL_FEATURE_KEYBOARD_BACKLIGHT;
+		data->kbd_led_single_color = false;
+		data->kbd_led_max_brightness = 4;
+	}
+
+	return 0;
+};
+
+static struct uniwill_device_descriptor gmxrgxx_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+	.probe = gmxrgxx_probe,
+};
+
+static struct uniwill_device_descriptor gmxagxx_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_LIGHTBAR |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+	.lightbar_max_brightness = 36,
+};
+
+static struct uniwill_device_descriptor gmxxgxx_gmxpxxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
@@ -2775,7 +2888,7 @@ static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 };
 
-static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata = {
+static struct uniwill_device_descriptor gxxhrxx_gxxmrxx_xxxx4nxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
@@ -2783,10 +2896,29 @@ static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata =
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
-		    UNIWILL_FEATURE_USB_POWERSHARE,
+		    UNIWILL_FEATURE_USB_POWERSHARE |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = true,
+	.kbd_led_max_brightness = 4,
 };
 
-static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __initdata = {
+static struct uniwill_device_descriptor gmxhgxx_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = false,
+	.kbd_led_max_brightness = 4,
+};
+
+static struct uniwill_device_descriptor gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
@@ -2799,7 +2931,7 @@ static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_USB_POWERSHARE,
 };
 
-static int phxtxx1_probe(struct uniwill_data *data)
+static int phxtuxx_phxtrxx_probe(struct uniwill_data *data)
 {
 	unsigned int value;
 	int ret;
@@ -2814,17 +2946,20 @@ static int phxtxx1_probe(struct uniwill_data *data)
 	return 0;
 };
 
-static struct uniwill_device_descriptor phxtxx1_descriptor __initdata = {
+static struct uniwill_device_descriptor phxtuxx_phxtrxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
-		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
-	.probe = phxtxx1_probe,
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = true,
+	.kbd_led_max_brightness = 2,
+	.probe = phxtuxx_phxtrxx_probe,
 };
 
-static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
+static int phxarxx_phxaqxx_probe(struct uniwill_data *data)
 {
 	unsigned int value;
 	int ret;
@@ -2840,22 +2975,28 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
 	return 0;
 };
 
-static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata = {
+static struct uniwill_device_descriptor phxarxx_phxaqxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
-		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
-	.probe = phxarx1_phxaqf1_probe,
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = true,
+	.kbd_led_max_brightness = 2,
+	.probe = phxarxx_phxaqxx_probe,
 };
 
-static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata = {
+static struct uniwill_device_descriptor pfxpuxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_CPU_TEMP |
-		    UNIWILL_FEATURE_PRIMARY_FAN,
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
+	.kbd_led_single_color = true,
+	.kbd_led_max_brightness = 2,
 };
 
 static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata = {
@@ -2950,7 +3091,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
 		},
-		.driver_data = &phxtxx1_descriptor,
+		.driver_data = &phxtuxx_phxtrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
@@ -2958,7 +3099,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -2966,7 +3107,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
 		},
-		.driver_data = &phxarx1_phxaqf1_descriptor,
+		.driver_data = &phxarxx_phxaqxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
@@ -2974,7 +3115,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -2982,7 +3123,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -2990,7 +3131,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -2998,7 +3139,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -3006,7 +3147,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
@@ -3014,7 +3155,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -3022,7 +3163,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -3030,7 +3171,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
@@ -3038,7 +3179,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
@@ -3046,7 +3187,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -3054,7 +3195,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -3062,7 +3203,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
@@ -3070,7 +3211,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
@@ -3078,7 +3219,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -3086,7 +3227,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -3094,7 +3235,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -3102,7 +3243,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -3110,7 +3251,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -3118,7 +3259,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -3126,7 +3267,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -3134,7 +3275,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -3142,7 +3283,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 15 Intel Gen1",
@@ -3150,7 +3291,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gmxmpxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 17 Intel Gen1",
@@ -3158,7 +3299,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gmxmpxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
@@ -3166,7 +3307,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -3174,23 +3315,39 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
+	},
+	{
+		.ident = "TUXEDO Polaris 15/17 Gen3 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "POLARIS1XA03"),
+		},
+		.driver_data = &gmxzgxx_gmxtgxx_pol_descriptor,
+	},
+	{
+		.ident = "TUXEDO Polaris 15/17 Gen3 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "POLARIS1XI03"),
+		},
+		.driver_data = &gmxzgxx_gmxtgxx_pol_descriptor,
 	},
 	{
-		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
+		.ident = "TUXEDO Stellaris 15/17 Gen3 AMD",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "STELLARIS1XA03"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxzgxx_gmxtgxx_ste_descriptor,
 	},
 	{
-		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
+		.ident = "TUXEDO Stellaris 15/17 Gen3 Intel",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
-			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "STELLARIS1XI03"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxzgxx_gmxtgxx_ste_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
@@ -3198,7 +3355,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxrgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -3206,7 +3363,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxagxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -3214,7 +3371,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -3222,7 +3379,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -3230,7 +3387,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -3238,7 +3395,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxhgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -3246,7 +3403,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -3254,7 +3411,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -3262,7 +3419,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -3270,7 +3427,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -3278,7 +3435,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -3286,7 +3443,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -3294,7 +3451,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Book BA15 Gen10 AMD",
@@ -3302,7 +3459,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
 		},
-		.driver_data = &pf5pu1g_descriptor,
+		.driver_data = &pfxpuxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
@@ -3310,7 +3467,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen1 AMD",
@@ -3318,7 +3475,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen2 AMD",
@@ -3326,7 +3483,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{ }
 };
-- 
2.43.0

