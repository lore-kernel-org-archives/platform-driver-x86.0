Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7AD19F137;
	Sat, 22 Aug 2026 00:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358628; cv=none; b=mTnI2Q1VpQh3x7l/17XBEWPeH5qIhBB1tWMWtFssRmgj7FPgJTLAcmIUMpDPP3woG5pL7iaFrjl9rjrnqwSh3hdWfNABfUcyK2i1/YImKsK4/OFaqRzv5/dv3Fkuw/Ta/Zdz1FwpSVraAyp6rlxCbKhsq6jQoA1CQAkO0EewWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358628; c=relaxed/simple;
	bh=Gi0/gGdEaRmiHFQWZSMqoO179cQKvf1hnzY4Om8wpVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAHeBq7y1fPsqBnXbBcQc0+HzOznPWDQeFNdTQe8+FAtZLbgp0vw6tfoIhAkGL3RQTFC/Fbu0uJfzWQ3TiO0+4uv9BQpD2k6pHq/sJZENIXIcY2ihiuaQvAmfhVigBb7dP6Eaa0353bTi3SLVGB5gnlfKNrUZamb+twIcvMw7Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Yv+ukF7n; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Yv+ukF7n"
Received: from wsembach-tuxedo.fritz.box (unknown [87.122.213.250])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 6EE192FC0061;
	Sat, 22 Aug 2026 02:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787358619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjyZOSxFc8BtHcrKFHquCqkFFWM4c5JlIsP554XTGKc=;
	b=Yv+ukF7ndGKVvo6uUXEqLDpQ/ImeVFPxYeagc6dh14AEpMXq3duy+K0CcEKsFDcF9T4FuS
	Zg/lR7uA9R78ZjYndv3bMreixBaJ8v98SioHxGzXKX104XeS8GBRFafTevz6WINo7jDGFm
	UzWLOa/jruV61gUUd73P+5GGqjppmvo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] platform/x86: uniwill-laptop: Enable kb backlight and lightbar for TUXEDO
Date: Sat, 22 Aug 2026 02:28:40 +0200
Message-ID: <20260822003012.851574-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822003012.851574-1-wse@tuxedocomputers.com>
References: <20260822003012.851574-1-wse@tuxedocomputers.com>
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
V2->V3: No change

 drivers/platform/x86/uniwill/uniwill-acpi.c | 309 +++++++++++++++-----
 1 file changed, 233 insertions(+), 76 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 5df3611919ce3..9bdca1da77983 100644
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
@@ -2738,35 +2740,47 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
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
@@ -2775,10 +2789,109 @@ static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __ini
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
@@ -2789,7 +2902,7 @@ static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 };
 
-static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata = {
+static struct uniwill_device_descriptor gxxhrxx_gxxmrxx_xxxx4nxx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
@@ -2797,10 +2910,29 @@ static struct uniwill_device_descriptor tux_featureset_4_descriptor __initdata =
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
@@ -2813,7 +2945,7 @@ static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_USB_POWERSHARE,
 };
 
-static int phxtxx1_probe(struct uniwill_data *data)
+static int phxtuxx_phxtrxx_probe(struct uniwill_data *data)
 {
 	unsigned int value;
 	int ret;
@@ -2828,17 +2960,20 @@ static int phxtxx1_probe(struct uniwill_data *data)
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
@@ -2854,22 +2989,28 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
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
@@ -2964,7 +3105,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
 		},
-		.driver_data = &phxtxx1_descriptor,
+		.driver_data = &phxtuxx_phxtrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
@@ -2972,7 +3113,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -2980,7 +3121,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
 		},
-		.driver_data = &phxarx1_phxaqf1_descriptor,
+		.driver_data = &phxarxx_phxaqxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
@@ -2988,7 +3129,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -2996,7 +3137,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -3004,7 +3145,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -3012,7 +3153,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -3020,7 +3161,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
@@ -3028,7 +3169,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -3036,7 +3177,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -3044,7 +3185,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
@@ -3052,7 +3193,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
 		},
-		.driver_data = &tux_featureset_4_descriptor,
+		.driver_data = &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
@@ -3060,7 +3201,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -3068,7 +3209,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -3076,7 +3217,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
@@ -3084,7 +3225,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
@@ -3092,7 +3233,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -3100,7 +3241,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -3108,7 +3249,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -3116,7 +3257,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -3124,7 +3265,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -3132,7 +3273,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -3140,7 +3281,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -3148,7 +3289,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -3156,7 +3297,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 15 Intel Gen1",
@@ -3164,7 +3305,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gmxmpxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 17 Intel Gen1",
@@ -3172,7 +3313,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
 		},
-		.driver_data = &tux_featureset_1_nvidia_descriptor,
+		.driver_data = &gmxmpxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
@@ -3180,7 +3321,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -3188,23 +3329,39 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
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
@@ -3212,7 +3369,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxrgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -3220,7 +3377,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxagxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -3228,7 +3385,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
-		.driver_data = &tux_featureset_2_nvidia_descriptor,
+		.driver_data = &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -3236,7 +3393,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -3244,7 +3401,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &gmxxgxx_gmxpxxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -3252,7 +3409,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxhgxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -3260,7 +3417,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -3268,7 +3425,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -3276,7 +3433,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -3284,7 +3441,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -3292,7 +3449,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -3300,7 +3457,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -3308,7 +3465,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &tux_featureset_4_nvidia_descriptor,
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Book BA15 Gen10 AMD",
@@ -3316,7 +3473,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
 		},
-		.driver_data = &pf5pu1g_descriptor,
+		.driver_data = &pfxpuxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
@@ -3324,7 +3481,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen1 AMD",
@@ -3332,7 +3489,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen2 AMD",
@@ -3340,7 +3497,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
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

