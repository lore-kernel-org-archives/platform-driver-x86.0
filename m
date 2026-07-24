Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684C25B30D;
	Fri, 24 Jul 2026 23:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934073; cv=none; b=NpEbt+1L5xCz0ryP1liPoN/sezKTeY3OoKIySfWvy0IysU9K5qQTJMOpii+BXs+A3I1izHOp2MMq1wxO+25MtvASEIAs3s4sB+n29J98Zr9OHV9ARNU9wuRB2rHzO29/jVddjqugg4R0iV2SZiRbiditKHCu1KI2Tk/yVWrzK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934073; c=relaxed/simple;
	bh=9nvnpyS7XIduq5hirowJSEnngT/28VhLknc383RtkQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUlaiX9dNkOiGE5KKVT+LAE5aPiyrtOohb94MC4ilZApu6gqKPf/vR6v1IJ5V+bzPwyGKJZrgP/55yswcoCVoMBCi/YnNWwUs53nOR8bWOranKs97tfeA8Q/Ph3pWV8qJewqk+yZs7mBLhS4ml+W0kQt6HqWMBlBUajOTgkqzwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Cq9q+G0X; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Cq9q+G0X"
Received: from wsembach-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 90FE12FC0061;
	Sat, 25 Jul 2026 01:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784934064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oQacqb7l0u6YfOw2EtdJY0ik64MIM7Vkl1lmdqFxWtc=;
	b=Cq9q+G0X3fO7T4zpI0a82VaMPS56dK9WTeE75sLV8rp1yGN9R1sjTuYJGpIyffYzEnA6vL
	Ld3IoZihRNg5X1kkNW9/0mkdf6u6z9HhEBUu0gfpRuf2OmzFWqJ7G3bK9yH56qmazlMrSJ
	OSBI8/Uu/4WEZJaodhpKws506dN35bo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: uniwill-laptop: Enable kb backlight and lightbar for TUXEDO
Date: Sat, 25 Jul 2026 01:00:23 +0200
Message-ID: <20260724230056.708736-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724230056.708736-1-wse@tuxedocomputers.com>
References: <20260724230056.708736-1-wse@tuxedocomputers.com>
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
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 309 +++++++++++++++-----
 1 file changed, 233 insertions(+), 76 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index d9a33be4f4a37..e81ccfa39039e 100644
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
@@ -2696,35 +2698,47 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
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
@@ -2733,10 +2747,109 @@ static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __ini
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
@@ -2747,7 +2860,7 @@ static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 };
 
-static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata = {
+static struct uniwill_device_descriptor gxxhrxx_gxxmrxx_xxxx4nxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
@@ -2755,10 +2868,29 @@ static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata =
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
@@ -2771,7 +2903,7 @@ static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_USB_POWERSHARE,
 };
 
-static int phxtxx1_probe(struct uniwill_data *data)
+static int phxtuxx_phxtrxx_probe(struct uniwill_data *data)
 {
 	unsigned int value;
 	int ret;
@@ -2786,17 +2918,20 @@ static int phxtxx1_probe(struct uniwill_data *data)
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
@@ -2812,22 +2947,28 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
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
@@ -2922,7 +3063,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
 		},
-		.driver_data = &phxtxx1_descriptor,
+		.driver_data = &phxtuxx_phxtrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
@@ -2930,7 +3071,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -2938,7 +3079,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
 		},
-		.driver_data = &phxarx1_phxaqf1_descriptor,
+		.driver_data = &phxarxx_phxaqxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
@@ -2946,7 +3087,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -2954,7 +3095,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -2962,7 +3103,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -2970,7 +3111,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -2978,7 +3119,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
@@ -2986,7 +3127,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -2994,7 +3135,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -3002,7 +3143,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
@@ -3010,7 +3151,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
@@ -3018,7 +3159,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -3026,7 +3167,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -3034,7 +3175,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
@@ -3042,7 +3183,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
@@ -3050,7 +3191,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -3058,7 +3199,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -3066,7 +3207,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -3074,7 +3215,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -3082,7 +3223,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -3090,7 +3231,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -3098,7 +3239,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -3106,7 +3247,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -3114,7 +3255,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 15 Intel Gen1",
@@ -3122,7 +3263,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gmxmpxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 17 Intel Gen1",
@@ -3130,7 +3271,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gmxmpxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
@@ -3138,7 +3279,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -3146,23 +3287,39 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
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
@@ -3170,7 +3327,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxrgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -3178,7 +3335,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxagxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -3186,7 +3343,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -3194,7 +3351,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -3202,7 +3359,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -3210,7 +3367,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxhgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -3218,7 +3375,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -3226,7 +3383,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -3234,7 +3391,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -3242,7 +3399,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -3250,7 +3407,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -3258,7 +3415,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -3266,7 +3423,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Book BA15 Gen10 AMD",
@@ -3274,7 +3431,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
 		},
-		.driver_data = &pf5pu1g_descriptor,
+		.driver_data = &pfxpuxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
@@ -3282,7 +3439,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen1 AMD",
@@ -3290,7 +3447,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen2 AMD",
@@ -3298,7 +3455,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
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

