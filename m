Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E49FC7EE2C
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Aug 2023 12:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243183AbjHYMfM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Aug 2023 08:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244884AbjHYMer (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Aug 2023 08:34:47 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA9926BF
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Aug 2023 05:34:17 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso12636601fa.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Aug 2023 05:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692966855; x=1693571655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K4mW9Ss/nPchRrFMHnYDBv3ck6MH8K2K8Av43tEXWz8=;
        b=JXU7SC/KWKvfB1YGjibezAdaajYK8wRNyJumJKBrIap/Sx5rcXzOmIGfAjMfbbUSxu
         XfKzeQRyuo2kRyHabkCLeXrvTA5C2kQdXcugdXVpdlnxZFwX/YWXllyzFVQuLrjfyKSQ
         Fu4sBzQmVGjNKdug9lnaOdSEgev4agYqIiuDBHrxwsAjnZSwlPIXcaWK6UQR0FAJnPS7
         G8/c39bjQu12oMJ+u5xMy/PbbhID2EB+DMZ75bmaLpy6Sj5K1SBUAznPluxiyuQiQ7Q/
         /P3hxEJfTO+95F2U5RN5NP5lCPr18hkXnd3VJ4eKKMFAOhmy/ViSyMgneKT2fgToGQUl
         j9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966855; x=1693571655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4mW9Ss/nPchRrFMHnYDBv3ck6MH8K2K8Av43tEXWz8=;
        b=C+mBAR/W7pXI24lW3ex9mRNjagApGU03U4j1XrclbqSjZ26EbPlsuSiguPp3+tQ0dt
         wU2HL5GVvSeySJSlFlLdrlbPn8ygXMAOhvJOPNMGg5AeyfSbp+RWdi4K4Xh9QII0J4Da
         DtRsZsZvGeN420qsHSWtwy1zuJaMIOjpCxQd/9LFJstsoaXbAjeIHggWscIQp5V/LADb
         773qlNnnkpcK/OB5NePJtbBreG6ej0HDaGX6ruXwFivKHB0xixtgXP2m84cRC0PUkwX6
         QejZR6iUbkhk7bwH2+Kzm1s61WJKfW6S3JQNKETavBZR/3/0GZmTDXiNesorCuX/D8+X
         hmDw==
X-Gm-Message-State: AOJu0YyqB7+DjrLEqMYvZVJeZzmK88TweBT3zzGReQ5ftH1WUJ4Asgx4
        qB3gYZSu4q3jX5e0WShwFZQ=
X-Google-Smtp-Source: AGHT+IGY66BRRYyridu2tkAhuNvLlRFEuu5GOewKicR4i856i3PCA2qgiw+g784cBAzt+5GgyKW28g==
X-Received: by 2002:a2e:851a:0:b0:2bc:d4ab:489e with SMTP id j26-20020a2e851a000000b002bcd4ab489emr8038489lji.11.1692966854416;
        Fri, 25 Aug 2023 05:34:14 -0700 (PDT)
Received: from localhost.localdomain (cpc157791-rdng31-2-0-cust585.15-3.cable.virginm.net. [86.24.214.74])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c379500b003ff3b964a9asm5301249wmr.39.2023.08.25.05.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 05:34:14 -0700 (PDT)
From:   Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Cc:     Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 1/1] platform/x86: ideapad-laptop: Add support for keyboard backlights using KBLC ACPI symbol
Date:   Fri, 25 Aug 2023 13:29:26 +0100
Message-ID: <20230825122925.7941-1-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Newer Lenovo laptops seem to use the KBLC symbol to control the backlight
Add support for handling the keyboard backlight on these devices

Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---

This has been tested on both new types of keyboard backlight being supported.
KBD_BL_TRISTATE_AUTO is used for keyboards that support automatic brightness.
AUTO is reported as '0' with this patch, as it doesn't fit numerically, I'm not sure how else to
report AUTO, hopefully someone has some insight :)

---
 drivers/platform/x86/ideapad-laptop.c | 107 ++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d2fee9a3e239..0e4cdd471a4a 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -85,6 +85,21 @@ enum {
 	SALS_FNLOCK_OFF       = 0xf,
 };
 
+/*
+ * These correspond to the number of supported states - 1
+ * Future keyboard types may need a new system, if there's a collision
+ * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
+ * so it effectively has 3 states, but needs to handle 4
+ */
+enum {
+	KBD_BL_STANDARD      = 1,
+	KBD_BL_TRISTATE      = 2,
+	KBD_BL_TRISTATE_AUTO = 3,
+};
+
+#define KBD_BL_COMMAND_GET 0x2
+#define KBD_BL_COMMAND_SET 0x3
+
 struct ideapad_dytc_priv {
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
@@ -122,6 +137,7 @@ struct ideapad_private {
 	} features;
 	struct {
 		bool initialized;
+		int type;
 		struct led_classdev led;
 		unsigned int last_brightness;
 	} kbd_bl;
@@ -242,6 +258,16 @@ static int exec_sals(acpi_handle handle, unsigned long arg)
 	return exec_simple_method(handle, "SALS", arg);
 }
 
+static int exec_kblc(acpi_handle handle, unsigned long arg)
+{
+	return exec_simple_method(handle, "KBLC", arg);
+}
+
+static int eval_kblc(acpi_handle handle, unsigned long cmd, unsigned long *res)
+{
+	return eval_int_with_arg(handle, "KBLC", cmd, res);
+}
+
 static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long *res)
 {
 	return eval_int_with_arg(handle, "DYTC", cmd, res);
@@ -1272,14 +1298,42 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
  */
 static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
 {
-	unsigned long hals;
+	unsigned long value;
 	int err;
 
-	err = eval_hals(priv->adev->handle, &hals);
+	if (priv->kbd_bl.type == KBD_BL_TRISTATE ||
+	    priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO) {
+		err = eval_kblc(priv->adev->handle,
+				(priv->kbd_bl.type << 4) | KBD_BL_COMMAND_GET,
+				&value);
+
+		if (err)
+			return err;
+
+		/* Convert returned value to brightness level */
+		value = (value & 0xFFFF) >> 1;
+
+		if (value >= 0 && value <= 2) {
+			/* Off, low or high */
+			return value;
+		} else if (value == 3) {
+			/* Auto, report as off */
+			return 0;
+		} else {
+			/* Unknown value */
+			dev_warn(&priv->platform_device->dev,
+				 "Unknown keyboard backlight value: %i",
+				 value);
+			return -EINVAL;
+		}
+	}
+
+
+	err = eval_hals(priv->adev->handle, &value);
 	if (err)
 		return err;
 
-	return !!test_bit(HALS_KBD_BL_STATE_BIT, &hals);
+	return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
 }
 
 static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
@@ -1291,13 +1345,27 @@ static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_cla
 
 static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
 {
-	int err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
+	int err;
+	unsigned long value;
+	int type = priv->kbd_bl.type;
+
+	if (type == KBD_BL_TRISTATE ||
+	    type == KBD_BL_TRISTATE_AUTO) {
+		if (brightness >= 0 && brightness <= 2) {
+			value = (brightness << 16) | (type << 4) | KBD_BL_COMMAND_SET;
+		} else {
+			return -EINVAL;
+		}
+
+		err = exec_kblc(priv->adev->handle, value);
+	} else {
+		err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
+	}
 
 	if (err)
 		return err;
 
 	priv->kbd_bl.last_brightness = brightness;
-
 	return 0;
 }
 
@@ -1344,8 +1412,14 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 
 	priv->kbd_bl.last_brightness = brightness;
 
+	if (priv->kbd_bl.type == KBD_BL_TRISTATE ||
+	    priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO) {
+		priv->kbd_bl.led.max_brightness = 2;
+	} else {
+		priv->kbd_bl.led.max_brightness = 1;
+	}
+
 	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
-	priv->kbd_bl.led.max_brightness          = 1;
 	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
 	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
 	priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED;
@@ -1456,6 +1530,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 		case 2:
 			ideapad_backlight_notify_power(priv);
 			break;
+		case 12:
 		case 1:
 			/*
 			 * Some IdeaPads report event 1 every ~20
@@ -1557,13 +1632,31 @@ static void ideapad_check_features(struct ideapad_private *priv)
 			if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
 				priv->features.fn_lock = true;
 
-			if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
+			if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val)) {
 				priv->features.kbd_bl = true;
+				priv->kbd_bl.type = KBD_BL_STANDARD;
+			}
 
 			if (test_bit(HALS_USB_CHARGING_SUPPORT_BIT, &val))
 				priv->features.usb_charging = true;
 		}
 	}
+
+	if (acpi_has_method(handle, "KBLC")) {
+		if (!eval_kblc(priv->adev->handle, 0x1, &val)) {
+			if (val == 0x5) {
+				priv->features.kbd_bl = true;
+				priv->kbd_bl.type = KBD_BL_TRISTATE;
+			} else if (val == 0x7) {
+				priv->features.kbd_bl = true;
+				priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
+			} else {
+				dev_warn(&priv->platform_device->dev,
+					 "Unknown keyboard type: %i",
+					 val);
+			}
+		}
+	}
 }
 
 #if IS_ENABLED(CONFIG_ACPI_WMI)
-- 
2.40.1.521.gf1e218fcd8

