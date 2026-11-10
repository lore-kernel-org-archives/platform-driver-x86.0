Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794325750;
	b=1JVkMN7Sjw3TFzLNDykDC0Zh3D1Q0eQnACHsjT6BqkePpOV/yKJ/8ojp+3WAylv9ATmk
	 Xq9lqBnzzoF6fcsPfa1XcLtM0fWAAvtWrcOxRWAzvJtJwNZCJdIfXxn6ifNWbFOENmtSK
	 nL3qPSU+rtKLcn13KsLPN2dRLCbXwEEp9zrs54hRFNTpMnPu93ZXzYioFD5k45o9KHExD
	 dU5ltVubNDrfoMcPMt30Y/j87DGw2fFINQIo63hUHmclkWaIVYZht0LPvtxEcaHqf1gKd
	 aa3Uk/LJGcM6d/1DtfLj0Z7Mvco4Kw4hTeKnDUlCe5vEXS1Eazcvf2amc+xvc2Fk9zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325750;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=O0eC4rWkwQyxRpvZ+gxpKM65EEQ6WNp12A82hhKA6Xk=;
	b=pwrniP9YWX/wADDOnYi0oTe0amSbs7oYgMr9yIs5Q7WwcbB1bVYylb61WOuyzBtcE/F1
	 RxLlJqUMX7eEtjQzr1ozli2xXJql512S0BqKvn1O+mh8V583qbPpT7Lsm1DCbQ+R9O5Aa
	 +3kvpreegdaT/FMFeQQHKjcbk5Y+a06hlZOlzgR/aOjBpKcCuO2/wyYZ4cimdsIB3Nv1J
	 0F+cKtVJQxzp13GeiuewW4b844iEpLdYGflZ3iXe7AbxyX5gVJldLotCM3WtvCExsWGSB
	 +oPSmy54f2PRvDY9zLeM1dPAwFXMRiGetmBAH5JtDebS6M1GSEjttDHWgW5AJbISjXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bjKubzqy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCE606A320;
	Tue, 10 Nov 2026 15:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CCE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bjKubzqy
ARC-Seal: i=1; a=rsa-sha256; t=1794325679; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LH1rqygKcrxGg+M/8tMK0NyAaNTW0NZ1unHWjugfitaSWOU2r9U9OijhU0MfKDKdcZlqi5kv5WqXFYavInULWnuHfuFlhNJvRPz1eV46/OuIq7bvbFdagBxz5wuRk7kPryywmra0HhoZ1khXBhzxJ6V3NG0XDZrTOpKwmHICAWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794325679; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O0eC4rWkwQyxRpvZ+gxpKM65EEQ6WNp12A82hhKA6Xk=; 
	b=mavXhHUWX0heo2CTZTLWHxk5hMGz0Em8KDMUviFI6h+cw7dx93e0qbCbZcV2P3x3dTdmRzMngTKxgor03lb0U0jur7z7iEd2D6gmsYG3EPfFnkA6if8BNz4foczHVl8SZOMw2Xqw0i86Uch760X1eu65fkIP2On5MnN+cKBUlaw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=bjKubzqyIb5Jkczly5S4G5+GcyTij7JkLQTqwzk38MMAA9SG+P0WyTe4FTp+S+MambpbKaonTvqz1p4qjLax5HxGlTEDcHNhm6sb0DIqPsq0J3ncboGXy4XFK2hsk/UdsK6auzT0kTP/5oYZHxn0SOuUTaaUZFyZ7Jfo1J1ckkAayNAHJ1jGvLhN9R735dEF5EzjpFJ96pcM8JqUyPSQ6LoAJnScKi5fz9V4r393GrvqUTwfOdE1ML9Y9iTNFftZieqHLIGFOinrYI4vzGmHRrNL7JTZDp26PxtpXZmA+7mVbJZVc4BFYEcUa1iEKBiYhdemLXBmH0CHJFx4FzLOuw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=O0eC4rWkwQyxRpvZ+gxpKM65EEQ6WNp12A82hhKA6Xk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794325678924481.15764810058;
	Tue, 10 Nov 2026 07:47:58 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Tue, 10 Nov 2026 23:47:04 +0800
Subject: [PATCH v8 3/3] platform/x86: ideapad-laptop: Fully support auto
 keyboard backlight
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-leds-trigger-hw-changed-v8-3-2717115d612c@rong.moe>
References: <20261110-leds-trigger-hw-changed-v8-0-2717115d612c@rong.moe>
In-Reply-To: <20261110-leds-trigger-hw-changed-v8-0-2717115d612c@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ike Panhc <ikepanhc@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Currently, the auto brightness mode of keyboard backlight maps to
brightness=0 in LED classdev. The only method to switch to such a mode
is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
is a multiplexed brightness value; writing 0 simply results in the
backlight being turned off.

With brightness processing code decoupled from LED classdev, we can now
fully support the auto brightness mode. In this mode, the keyboard
backlight is controlled by the EC according to the ambient light sensor
(ALS).

To utilize this, a private hardware control trigger "ideapad-auto" is
added, with the event handling procedure calling the
led_trigger_notify_hw_control_changed() interface to activate/deactivate
the private trigger according to the current LED trigger state. To align
with LEDS_BRIGHTNESS_HW_CHANGED, the driver neither depends on
LEDS_TRIGGERS_HW_CHANGED nor selects it.

Meanwhile, block brightness changes on exit to prevent the side effect
of LED device unregistration when the private trigger is active from
resetting the brightness to zero, so that the state of auto mode can
retain among boots.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Rename the offloaded() callback to hw_offloaded() (thanks Lee Jones)

Changes in v6:
- Simplify the auto mode state preservation logic by converting
  `priv->kbd_bl.initialized' into a tristate integer

Changes in v4:
- Add missing #include (Thanks Ilpo Järvinen)
- Remove needless code alignment (ditto)
- Address concerns from Sashiko
  - Do not notify the LED trigger core when the registration of the
    private trigger has failed
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe?part=11

Changes in v3:
- Address concerns from Sashiko
  - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
  - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
  - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3%40rong.moe
- Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
---
 drivers/platform/x86/lenovo/Kconfig          |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c | 119 ++++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993073..a97852b0b228 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -16,6 +16,7 @@ config IDEAPAD_LAPTOP
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
 	select LEDS_CLASS
+	select LEDS_TRIGGERS
 	help
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index a9291d2d5c59..36b4a56a8495 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -15,6 +15,7 @@
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/compiler.h>
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -32,6 +33,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
+#include <linux/printk.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
 #include <linux/string_choices.h>
@@ -226,7 +228,10 @@ struct ideapad_private {
 		bool ymc_ec_trigger       : 1;
 	} features;
 	struct {
-		bool initialized;
+		int initialized; /*  0: initializion pending/ongoing/failed
+				  * >0: initializion finished
+				  * <0: unregisteration ongoing/finished
+				  */
 		int type;
 		struct led_classdev led;
 		unsigned int last_hw_brightness;
@@ -1736,14 +1741,68 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
 
+	/*
+	 * When unregistering: It must be the side effect of LED unregistration
+	 * when our private trigger is active. We've set LED_RETAIN_AT_SHUTDOWN
+	 * to retain led_cdev brightness level. To do the same for auto mode,
+	 * gate changes and return early.
+	 *
+	 * It's needless to gate changes when initializing, as there may be a
+	 * time margin between sysfs attribute creation and state change.
+	 */
+	if (unlikely(priv->kbd_bl.initialized < 0))
+		return 0;
+
 	return ideapad_kbd_bl_brightness_set(priv, brightness);
 }
 
+static int ideapad_kbd_bl_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	return ideapad_kbd_bl_hw_brightness_set(priv, KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
+}
+
+static bool ideapad_kbd_bl_auto_trigger_hw_offloaded(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	guard(mutex)(&priv->kbd_bl.mutex);
+
+	return priv->kbd_bl.last_hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+}
+
+static struct led_hw_trigger_type ideapad_kbd_bl_auto_trigger_type;
+
+static struct led_trigger ideapad_kbd_bl_auto_trigger = {
+	.name = "ideapad-auto",
+	.trigger_type = &ideapad_kbd_bl_auto_trigger_type,
+	.activate = ideapad_kbd_bl_auto_trigger_activate,
+	.hw_offloaded = ideapad_kbd_bl_auto_trigger_hw_offloaded,
+};
+
+static bool ideapad_kbd_bl_auto_trigger_registered;
+
+static void ideapad_kbd_bl_notify_hw_control(struct ideapad_private *priv,
+					     unsigned int hw_brightness)
+{
+	bool hw_control, last_hw_control;
+
+	if (!ideapad_kbd_bl_auto_trigger_registered || priv->kbd_bl.type != KBD_BL_TRISTATE_AUTO)
+		return;
+
+	hw_control = hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+	last_hw_control = priv->kbd_bl.last_hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+
+	if (hw_control != last_hw_control)
+		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_control);
+}
+
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
 	int hw_brightness, brightness;
 
-	if (!priv->kbd_bl.initialized)
+	if (unlikely(priv->kbd_bl.initialized <= 0))
 		return;
 
 	guard(mutex)(&priv->kbd_bl.mutex);
@@ -1759,6 +1818,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (priv->kbd_bl.last_hw_brightness == hw_brightness)
 		return;
 
+	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness);
+
 	priv->kbd_bl.last_hw_brightness = hw_brightness;
 
 	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
@@ -1771,9 +1832,11 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (!priv->features.kbd_bl)
 		return -ENODEV;
 
-	if (WARN_ON(priv->kbd_bl.initialized))
+	if (WARN_ON(priv->kbd_bl.initialized > 0))
 		return -EEXIST;
 
+	priv->kbd_bl.initialized = 0;
+
 	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.mutex);
 	if (err)
 		return err;
@@ -1791,6 +1854,24 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 
 	switch (priv->kbd_bl.type) {
 	case KBD_BL_TRISTATE_AUTO:
+		priv->kbd_bl.led.max_brightness = 2;
+
+		if (!ideapad_kbd_bl_auto_trigger_registered) {
+			dev_warn(&priv->platform_device->dev,
+				 "Cannot provide LED trigger %s for keyboard backlight\n",
+				 ideapad_kbd_bl_auto_trigger.name);
+			break;
+		}
+
+		priv->kbd_bl.led.flags |= LED_TRIG_HW_CHANGED;
+		priv->kbd_bl.led.trigger_type = &ideapad_kbd_bl_auto_trigger_type;
+		priv->kbd_bl.led.hw_control_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		/* Hardware remembers the last brightness level, including auto mode. */
+		if (hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+			priv->kbd_bl.led.default_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		break;
 	case KBD_BL_TRISTATE:
 		priv->kbd_bl.led.max_brightness = 2;
 		break;
@@ -1811,17 +1892,17 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (err)
 		return err;
 
-	priv->kbd_bl.initialized = true;
+	priv->kbd_bl.initialized = 1;
 
 	return 0;
 }
 
 static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
 {
-	if (!priv->kbd_bl.initialized)
+	if (priv->kbd_bl.initialized <= 0)
 		return;
 
-	priv->kbd_bl.initialized = false;
+	priv->kbd_bl.initialized = -1;
 
 	led_classdev_unregister(&priv->kbd_bl.led);
 }
@@ -2640,17 +2721,30 @@ static int __init ideapad_laptop_init(void)
 {
 	int err;
 
+	err = led_trigger_register(&ideapad_kbd_bl_auto_trigger);
+	if (err) {
+		pr_warn("Failed to register LED trigger %s: %d\n",
+			ideapad_kbd_bl_auto_trigger.name, err);
+	} else {
+		ideapad_kbd_bl_auto_trigger_registered = true;
+	}
+
 	err = ideapad_wmi_driver_register();
 	if (err)
-		return err;
+		goto err_ledtrig;
 
 	err = platform_driver_register(&ideapad_acpi_driver);
-	if (err) {
-		ideapad_wmi_driver_unregister();
-		return err;
-	}
+	if (err)
+		goto err_wmi;
 
 	return 0;
+
+err_wmi:
+	ideapad_wmi_driver_unregister();
+err_ledtrig:
+	if (ideapad_kbd_bl_auto_trigger_registered)
+		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
+	return err;
 }
 module_init(ideapad_laptop_init)
 
@@ -2658,6 +2752,9 @@ static void __exit ideapad_laptop_exit(void)
 {
 	platform_driver_unregister(&ideapad_acpi_driver);
 	ideapad_wmi_driver_unregister();
+
+	if (ideapad_kbd_bl_auto_trigger_registered)
+		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
 }
 module_exit(ideapad_laptop_exit)
 

-- 
2.55.0

