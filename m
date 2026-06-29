Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A41EB5C2
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782611824; cv=none; b=q3sXCxod332v3EY7DEn8ZPW0ykAyfxdTbNKeN2408deVK58dIb30Xc0Rg5Moz71eJhNzKXsY+AJSMkWtxvY+oe+3w2/rWGMArHjcjTJqq6WB9noubK9jRlvooYb1FC9pBhJsVyMx6gjICYXx46IUtLd28NF+HFoTdN/f87fltYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782611824; c=relaxed/simple;
	bh=EYpoByBZ2MwnfXcUh6prferEuCti7ZpOpo/yD0HAFbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUrP0bbrzDyeCOPdb38NwEAHb+oz4vpqqi3gYaag99qj5kmvsX1pVlAgfGDrQqvu9QGYmdLVOa+TFWgxbbQid1+IKGfQOl/bGOqpuadvX61Z9cwdf3iGSBhueL+RNxJjK+QhRLOVhS+5adhR2WTtAWpjdkW8rC+dO069AvNzDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c975WeT3; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c975WeT3"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c99ccb1afso2137239eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 18:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782611822; x=1783216622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHbAq7e0BaONJADB8qFo/3rJ1uHyU1lRNyKX/5az0Cg=;
        b=c975WeT3C8jwDq815yJOvSFesiJpPP14purV5tUGIy9fgSRsv3xBeONqI1Bwm//O8A
         gas/2nNMLg5ZIqa/QY/SwIjSMIUA9dWpYmZp3zVZsHgSzxSjMURF1NAHvXOCIUxXxsaR
         0GIRWZ6sQMq3zKP6BEtK9k1BkmFCPWd6svgFop0yrWCEH54QykXQXUFFzxiWoDy7SjLR
         +YNyU8GxkV8I19f8Nr83GTH5FHZHRTSLLh7RhX7dqaqcpoNS7KDjmUZzLGAVwTuvrzYG
         6ACt2tfxnvdQUYEfOtDS2XkbmqX5J9pPn7/E5JcdBl75RYQOOX3CUILqWubBQyx+Pv+8
         dLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782611822; x=1783216622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHbAq7e0BaONJADB8qFo/3rJ1uHyU1lRNyKX/5az0Cg=;
        b=rUDPJT6IO4R0F2+GcKJ8/cMIVxMBcXD2CmJpC7mfrzqm+OTmyzL5KYPjmyJCe3xkXz
         z4hB4+qrEnqBkY3nyqLvytrj6kOggEciMztpuF9Kc5L1+FW9d79yPxwfEnKdSiG9GhCX
         GNIGhtgmUXz01KDd82zkP5Nv2CCha6st8FpPjw9Uq9YgZQPbLonLkq1UOpt1pL5waFYu
         txdk96tU2+jCmQEGAP149qWiIpe5GExrPgodsYL9+33lsvNRPNfSkW9EUyyGda+HZ3aS
         uqxbHaMt3SwhGnLpCzbCb/sIo/pDdWnlWa6K4yNTLso9C9G7VeeQMQ7aNLhN4Z+iBkAu
         IkRw==
X-Forwarded-Encrypted: i=1; AHgh+Rpe01rrKeLEuyscyXEh/Mj0Wx0lYHdBwiPOlTjAZgA5A1HNkGlbfe2QGVd9t+H82rluN1Y+heKIVL2UyipbhMo+sogj@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEHoGpZulnoE7Dp9kDHEIzn7WQvp96PcExoKt693q6jBFdv0S
	Z16PSu8HG7VFQGpEGUAQct9oSXcZSvrXuNWXBYY7sHn2puVubF/iAXMS
X-Gm-Gg: AfdE7ckWZUwjFQC2uzPqrtc0MkQLLgSgrPExUVN/acrD7BvPUJ3Xd5MgHsG3gU0vLUP
	dSvOkU8xJlLLDi9qpFDL24Cd4a0wqEAWOIybIseogCOeRt8tARPmjWepLHwowNjdSYcLedfcFui
	ZLjeeM0/HrdvAq2Ef1e1yWLqbG8JwZrZO8dLYLmv+brQ0oYjyr3+xfsz2DkId0DRKIwlIX/3JsY
	5xbxzGCMC+o9hgKoduhl38WpWwKZjq+TT8LG/ZmgLzWhCt2eERCoI8DQJFx9OoqX9HvdtjOU/dt
	fAFI93O03eWPJH+Xj+z1uYRsaVBy80E/AoXCeCZfZxeN8yVo3U/MhVz8ZG/lmjerep3FO9fLiJV
	w6me4g3DwCkl4SEIu+hFctVekn3ltomX1ssMVkvpFhR2cW6EHWUgX2LW7Dd8RvqEW42hKdpw1uq
	JLd74w
X-Received: by 2002:a05:693c:88c4:20b0:30c:9ca4:5cb6 with SMTP id 5a478bee46e88-30c9ca45e51mr4798450eec.23.1782611821596;
        Sat, 27 Jun 2026 18:57:01 -0700 (PDT)
Received: from [192.168.0.77] ([2804:14c:ca27:80b5::13c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cab28fasm35230883eec.30.2026.06.27.18.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 18:57:01 -0700 (PDT)
From: Rodnei Cilto <rodnei.cilto@gmail.com>
Date: Sun, 28 Jun 2026 22:57:04 -0300
Subject: [PATCH 2/2] platform/x86: ideapad-laptop: add CapsLock/NumLock LED
 via EC
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-ideapad-kbd-leds-v1-2-50b421d94927@gmail.com>
References: <20260628-ideapad-kbd-leds-v1-0-50b421d94927@gmail.com>
In-Reply-To: <20260628-ideapad-kbd-leds-v1-0-50b421d94927@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Rodnei Cilto <rodnei.cilto@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7695;
 i=rodnei.cilto@gmail.com; h=from:subject:message-id;
 bh=EYpoByBZ2MwnfXcUh6prferEuCti7ZpOpo/yD0HAFbg=;
 b=owEBbQKS/ZANAwAKAXzcyu9sg3HEAcsmYgBqQdD/tcObMY7cSxpdYYgyqjc+z8POXKRLQRGpC
 dZvcNZIc5KJAjMEAAEKAB0WIQR5JbhU2RB8Rp1i2ol83MrvbINxxAUCakHQ/wAKCRB83MrvbINx
 xN7AD/0Z0Fb8NYLmy1lVGz17lcsjgRAdCSpr5eKKjhgso2Sp2lB+zocoNlfpg9P/R5tuKkvcdZk
 ycOX9FFGKpdy5R4LibmIMn4S/NcFrRtvKtCJMp08ZP0HH9YDNfJjbiLHU/IKeuLJsffKa855TnJ
 +Yg14x/VB4w8jw1AuS1pGNTyJ2xepeXE9KHsnrsJ4Hu4cIYfXWcyfDF/xOc/CiVnX9Ocvq7tYWY
 3Hf3JM7moR90G3PlYApLeiPazlq9fRv+o2MWDs8cknYE9vpTv1X2n3SZdacf/UxrwwVnvbYheCR
 LKZrG+yTVZfCSmQQQBG3d/gBemSVor8fZrkyICSd8scb81n1WfRTvPIi9ftvHMtbKQ+aP+5V2Jr
 /jR/QquqZ9TYIaDGoqF1l+eUpUxxDS42nzQV3t2bRTpeoAFw+IRV94vDSIRoGSkd2qd7r5b5QiL
 q7w19o0UpDK72YGBui8WAfy514eMNXezzzawd+5oC5n0A68UXdj++CVE1bwddRJAzeGmyam9bFv
 LVYLRgH6ps6JLZUEyC5N54qLTN3EAzjwtrQvOXkD0omGT2UH6Gx5m7HXss2j4wSbfoDkWUJ3GH2
 6m4ngdP0z9cvIN2PrihQEQjfko+HAeKrPLrMgV+fPAP6sXCO+RZlFhnw7whd4nWhHd7gCQsd2s9
 IoznGcYrfwbTj+w==
X-Developer-Key: i=rodnei.cilto@gmail.com; a=openpgp;
 fpr=7925B854D9107C469D62DA897CDCCAEF6C8371C4

Some Lenovo IdeaPad laptops (e.g. 83RR/83SR, Wildcat Lake) have
physical CapsLock and NumLock LEDs controlled via the EC.

The EC exposes CAPL (bit 5) and NUML (bit 4) at offset 0xA1.
Writing these bits via ec_write() and evaluating _QDF via
acpi_evaluate_object() causes the firmware to sync EC state to the
GPIO lines that drive the physical LEDs.

Discovery via DSDT analysis on Lenovo IdeaPad 83RR (Wildcat Lake):
  - CAPL/NUML at EC offset 0xA1 (bits 5 and 4)
  - _QDF (_SB.PC00.LPCB.EC0._QDF) reads CAPL/NUML -> SGOV()
  - GPIO 0x001A1087 -> CapsLock LED physical pin
  - GPIO 0x001A0485 -> NumLock LED physical pin
  - ec_read/ec_write exported via EXPORT_SYMBOL in drivers/acpi/ec.c
    and declared in <linux/acpi.h>

Add two led_classdev entries (input::capslock, input::numlock)
guarded by DMI match (features.kbd_leds) for 83RR and its Brazil
regional variant 83SR.

Signed-off-by: Rodnei Cilto <rodnei.cilto@gmail.com>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 143 +++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 4fbc904f1fc3..03e3f234067c 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -42,6 +42,17 @@
 
 #include <dt-bindings/leds/common.h>
 
+/* EC keyboard LED control (IdeaPad EC PS/2 emulation).
+ * Validated on Lenovo IdeaPad 83RR (Wildcat Lake):
+ *   EC offset 0xA1 bit4=NUML, bit5=CAPL
+ *   _QDF syncs EC state to GPIO -> physical LED
+ * ec_read/ec_write declared in <linux/acpi.h>
+ */
+#define IDEAPAD_EC_KBD_LED_OFFSET	0xA1
+#define IDEAPAD_EC_KBD_LED_NUML_BIT	BIT(4)
+#define IDEAPAD_EC_KBD_LED_CAPL_BIT	BIT(5)
+#define IDEAPAD_ACPI_EC0_QDF_PATH	"\\_SB.PC00.LPCB.EC0._QDF"
+
 #define IDEAPAD_RFKILL_DEV_NUM	3
 
 enum {
@@ -198,6 +209,7 @@ struct ideapad_private {
 		bool ctrl_ps2_aux_port    : 1;
 		bool usb_charging         : 1;
 		bool ymc_ec_trigger       : 1;
+		bool kbd_leds             : 1;
 	} features;
 	struct {
 		bool initialized;
@@ -210,6 +222,11 @@ struct ideapad_private {
 		struct led_classdev led;
 		unsigned int last_brightness;
 	} fn_lock;
+	struct {
+		bool initialized;
+		struct led_classdev capslock;
+		struct led_classdev numlock;
+	} kbd_leds;
 };
 
 static bool no_bt_rfkill;
@@ -1587,6 +1604,99 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
 /*
  * keyboard backlight
  */
+static int ideapad_kbd_led_ec_set(u8 bit, bool on)
+{
+	u8 val;
+	int err;
+
+	err = ec_read(IDEAPAD_EC_KBD_LED_OFFSET, &val);
+	if (err)
+		return err;
+	if (on)
+		val |= bit;
+	else
+		val &= ~bit;
+	err = ec_write(IDEAPAD_EC_KBD_LED_OFFSET, val);
+	if (err)
+		return err;
+	acpi_evaluate_object(NULL, IDEAPAD_ACPI_EC0_QDF_PATH, NULL, NULL);
+	return 0;
+}
+
+static void ideapad_capslock_led_set(struct led_classdev *led_cdev,
+				     enum led_brightness brightness)
+{
+	ideapad_kbd_led_ec_set(IDEAPAD_EC_KBD_LED_CAPL_BIT, brightness != LED_OFF);
+}
+
+static enum led_brightness ideapad_capslock_led_get(struct led_classdev *led_cdev)
+{
+	u8 val;
+
+	if (ec_read(IDEAPAD_EC_KBD_LED_OFFSET, &val))
+		return LED_OFF;
+	return (val & IDEAPAD_EC_KBD_LED_CAPL_BIT) ? LED_ON : LED_OFF;
+}
+
+static void ideapad_numlock_led_set(struct led_classdev *led_cdev,
+				    enum led_brightness brightness)
+{
+	ideapad_kbd_led_ec_set(IDEAPAD_EC_KBD_LED_NUML_BIT, brightness != LED_OFF);
+}
+
+static enum led_brightness ideapad_numlock_led_get(struct led_classdev *led_cdev)
+{
+	u8 val;
+
+	if (ec_read(IDEAPAD_EC_KBD_LED_OFFSET, &val))
+		return LED_OFF;
+	return (val & IDEAPAD_EC_KBD_LED_NUML_BIT) ? LED_ON : LED_OFF;
+}
+
+static int ideapad_kbd_leds_init(struct ideapad_private *priv)
+{
+	int err;
+
+	if (WARN_ON(priv->kbd_leds.initialized))
+		return -EEXIST;
+
+	priv->kbd_leds.capslock.name           = "input::capslock";
+	priv->kbd_leds.capslock.max_brightness = 1;
+	priv->kbd_leds.capslock.brightness_set = ideapad_capslock_led_set;
+	priv->kbd_leds.capslock.brightness_get = ideapad_capslock_led_get;
+	priv->kbd_leds.capslock.flags          = LED_RETAIN_AT_SHUTDOWN;
+
+	err = led_classdev_register(&priv->platform_device->dev,
+				    &priv->kbd_leds.capslock);
+	if (err)
+		return err;
+
+	priv->kbd_leds.numlock.name            = "input::numlock";
+	priv->kbd_leds.numlock.max_brightness  = 1;
+	priv->kbd_leds.numlock.brightness_set  = ideapad_numlock_led_set;
+	priv->kbd_leds.numlock.brightness_get  = ideapad_numlock_led_get;
+	priv->kbd_leds.numlock.flags           = LED_RETAIN_AT_SHUTDOWN;
+
+	err = led_classdev_register(&priv->platform_device->dev,
+				    &priv->kbd_leds.numlock);
+	if (err) {
+		led_classdev_unregister(&priv->kbd_leds.capslock);
+		return err;
+	}
+
+	priv->kbd_leds.initialized = true;
+	return 0;
+}
+
+static void ideapad_kbd_leds_exit(struct ideapad_private *priv)
+{
+	if (!priv->kbd_leds.initialized)
+		return;
+	priv->kbd_leds.initialized = false;
+	led_classdev_unregister(&priv->kbd_leds.numlock);
+	led_classdev_unregister(&priv->kbd_leds.capslock);
+}
+
 static int ideapad_kbd_bl_check_tristate(int type)
 {
 	return (type == KBD_BL_TRISTATE) || (type == KBD_BL_TRISTATE_AUTO);
@@ -1832,6 +1942,29 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	priv->r_touchpad_val = value;
 }
 
+static const struct dmi_system_id ideapad_kbd_leds_dmi_table[] = {
+	{
+		/*
+		 * Lenovo IdeaPad 83RR (Wildcat Lake) - EC PS/2 emulation
+		 * controls CapsLock/NumLock LEDs via EC offset 0xA1 + _QDF.
+		 * CAPL=bit5 (0x20), NUML=bit4 (0x10).
+		 * _QDF drives GPIO via SGOV() to physical LED pins.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83RR"),
+		},
+	},
+	{
+		/* Lenovo IdeaPad 83SR (83RR Brazil regional variant) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83SR"),
+		},
+	},
+	{ }
+};
+
 static const struct dmi_system_id ymc_ec_trigger_quirk_dmi_table[] = {
 	{
 		/* Lenovo Yoga 7 14ARB7 */
@@ -2178,6 +2311,8 @@ static int ideapad_check_features(struct ideapad_private *priv)
 	priv->features.touchpad_ctrl_via_ec = touchpad_ctrl_via_ec;
 	priv->features.ymc_ec_trigger =
 		ymc_ec_trigger || dmi_check_system(ymc_ec_trigger_quirk_dmi_table);
+	priv->features.kbd_leds =
+		dmi_check_system(ideapad_kbd_leds_dmi_table);
 
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode = true;
@@ -2418,6 +2553,12 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 			dev_info(&pdev->dev, "FnLock control not available\n");
 	}
 
+	if (priv->features.kbd_leds) {
+		err = ideapad_kbd_leds_init(priv);
+		if (err)
+			dev_warn(&pdev->dev, "Could not set up kbd LEDs: %d\n", err);
+	}
+
 	/*
 	 * On some models without a hw-switch (the yoga 2 13 at least)
 	 * VPCCMD_W_RF must be explicitly set to 1 for the wifi to work.
@@ -2477,6 +2618,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 		ideapad_unregister_rfkill(priv, i);
 
 	ideapad_fn_lock_led_exit(priv);
+	ideapad_kbd_leds_exit(priv);
 	ideapad_kbd_bl_exit(priv);
 	ideapad_input_exit(priv);
 
@@ -2506,6 +2648,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 		ideapad_unregister_rfkill(priv, i);
 
 	ideapad_fn_lock_led_exit(priv);
+	ideapad_kbd_leds_exit(priv);
 	ideapad_kbd_bl_exit(priv);
 	ideapad_input_exit(priv);
 	ideapad_debugfs_exit(priv);

-- 
2.51.0

