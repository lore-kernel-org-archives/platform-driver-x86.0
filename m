Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794325728;
	b=KBr9OmPzxXa5/nGrngwO9hkFzCmMMT/72orK+5wC1mJ1Gr18AO8gOA5H3I/L5ydTj+/c
	 XG06iG9qPm+SIb0hLGN1LyND92hfba5NqS9nTK9IXoWmU3I5bOR2gv61oTVwFQprAyzmX
	 FJVwE1aq+atRdt0EtFkaGrbrucJDTTDe5HfYYfQbJsJ237U+lbDgFrWcFxQrwN/LDWXrQ
	 hc4gpjMorgSNRZY9L/sr0fUMNcSfoIFIQRkudIhtfV4SuyI6QH7vSX/OqwOKJw9xjtgIp
	 Jd+tMUSihgCOmYFisddk/uev8xfhy+v7xLcHbredxjzwP8vq1gPrDWUPcYavXKlkwYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325728;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=U9ZS1ax52WcjHgHo49B1ykoSBL0KOr0M99wW7oIC4rw=;
	b=izI202a2m/t2OWXZTXzV18AeMYLDvMLnnDUncLPeHV34PX4sjp/Wl9AJzP3fqQ6ca0km
	 +QXa8OO5SDxsJ4NLdgvcDl2LUsvKfKMLu2o/s3vB7ojQn1XwLVRU+kz/45G4k48Vsi+qK
	 dKweYb8aZHg0zJwxUxoIH6UESc6g/ieZoqlxNm5eHgBHwYpMLyzFNHvj8rrSlSTwQAle+
	 Lye8kuPbfr/Q0TVa7xmQRe2kwLYJ7yn+R23uANMSoVrAulPyjqeG8s3Ds8JK+i9wRtzjp
	 CQ4jRLRv1K9VbN1rv8C5cCOW5eOiTeB4BqDdPUEZP7d1WW2b39JVm3430y39TFyI9RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=E+hs1KEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C580606A33B;
	Tue, 10 Nov 2026 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C580606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=E+hs1KEw
ARC-Seal: i=1; a=rsa-sha256; t=1794325677; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j9eJADoOcKt2lRXnFQgOkM/Ej7recIoo/kpve8sU263Y+sPwDgo1l41WmnVQSRzhBvbIMGV3qP3Q2Z+JTIx0nnMC5mEdPiuAVoB9cNqDvWM/aSkO3wgn5nnVIzXiEOO5np3AI5+O7o3DDFxifai7LQlGEuPr/SSmbDNX5fwL+AI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794325677; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U9ZS1ax52WcjHgHo49B1ykoSBL0KOr0M99wW7oIC4rw=; 
	b=T88qrOmQdb5+piNgY6VyLtxr383f4x7HTldfztBLTVcGBBOxsxS1B69u7sQweBlRwQLP/+IripDrqPKJwKkHNL206Ls0HRimjQrTtIfy1wigxKiD6HO4Lb19iSKxNF/OjkNb96rBYQFx+BPawf0wjoNFNENal9+6N5ud08QElho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=E+hs1KEw1jjPaz6UAONYwAYbJV0zFzo/vRQ4BTxGVAwTvmrTzo8cvzXuRDK9leBzuQxcT3s5AknGMtG8565An8h095wYs6mlReBdtj6Okflv3GePLR1l51+lQ1B0z7zeMT7Rl9q5GL1N2qf1Gf0vHcKcicScfOV/T+z6FgED65qmT3n/B9upV2LcBn2zor+DaYx/2R0Bzl4E3CFmXtjUi9lDYOp0TEQG+37Sj4FyNmWc07w6xBEgi7gbnzES9Dbnzv44JAO9D7D1yi6Zyw7p0qQynuHrkq0B4/wKZuMCrUThsds17tQhOSc0Lehqw6gPwa5O9f2UQvy8Y9ntVssxcw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=U9ZS1ax52WcjHgHo49B1ykoSBL0KOr0M99wW7oIC4rw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794325675532157.8358997426924;
	Tue, 10 Nov 2026 07:47:55 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Tue, 10 Nov 2026 23:47:03 +0800
Subject: [PATCH v8 2/3] platform/x86: ideapad-laptop: Decouple hardware &
 classdev brightness for keyboard backlight
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
Message-Id: <20261110-leds-trigger-hw-changed-v8-2-2717115d612c@rong.moe>
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

Some recent models come with an ambient light sensor (ALS). On these
models, their EC will automatically set the keyboard backlight to an
appropriate brightness when the effective "hardware brightness" is 3.
"Hardware brightness" can't be perfectly mapped to an LED classdev
brightness, but the EC does use this predefined brightness value to
represent auto mode.

Currently, the code processing keyboard backlight is coupled with LED
classdev, making it hard to expose the auto brightness (ALS) mode to the
userspace.

As the first step toward the goal, decouple hardware brightness from LED
classdev brightness, and update comments about corresponding backlight
modes.

To minimalize the diff set in upcoming changes, a trivial refactor
also converts the initialization path into another equivalent form.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v8:
- Replace unreachable() with an explicit return to work around
  miscompilation under certain combination of toolchains (found by
  kernel test robot, off-list, thanks Ilpo Järvinen)

Changes in v7:
- Address a concern from Sashiko
  - Fix printf format string
  - https://sashiko.dev/#/patchset/20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe?part=11

Changes in v6:
- No longer convert last_hw_brightness into atomic_t as it's not
  required now

Changes in v4:
- Add missing #include (Thanks Ilpo Järvinen)
- Address concerns from Sashiko
  - Reject insane hardware brightness
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe?part=9
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 150 +++++++++++++++++++--------
 1 file changed, 106 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 04343e9a2d47..a9291d2d5c59 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -14,9 +14,11 @@
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
+#include <linux/compiler.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/dmi.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
@@ -135,10 +137,31 @@ enum {
 };
 
 /*
- * These correspond to the number of supported states - 1
- * Future keyboard types may need a new system, if there's a collision
- * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
- * so it effectively has 3 states, but needs to handle 4
+ * The enumeration has two purposes:
+ *   - as an internal identifier for all known types of keyboard backlight
+ *   - as a mandatory parameter of the KBLC command
+ *
+ * For each type, the hardware brightness values are defined as follows:
+ * +--------------------------+----------+-----+------+------+
+ * |      Hardware brightness |        0 |   1 |    2 |    3 |
+ * | Type                     |          |     |      |      |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_STANDARD          |      off |  on |  N/A |  N/A |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_TRISTATE          |      off | low | high |  N/A |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_TRISTATE_AUTO     |      off | low | high | auto |
+ * +--------------------------+----------+-----+------+------+
+ *
+ * We map LED classdev brightness for KBD_BL_TRISTATE_AUTO as follows:
+ * +--------------------------+----------+-----+------+
+ * |  LED classdev brightness |        0 |   1 |    2 |
+ * | Operation                |          |     |      |
+ * +--------------------------+----------+-----+------+
+ * | Read                     | off/auto | low | high |
+ * +--------------------------+----------+-----+------+
+ * | Write                    |      off | low | high |
+ * +--------------------------+----------+-----+------+
  */
 enum {
 	KBD_BL_STANDARD      = 1,
@@ -146,6 +169,8 @@ enum {
 	KBD_BL_TRISTATE_AUTO = 3,
 };
 
+#define KBD_BL_AUTO_MODE_HW_BRIGHTNESS	3
+
 #define KBD_BL_QUERY_TYPE		0x1
 #define KBD_BL_TRISTATE_TYPE		0x5
 #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
@@ -204,7 +229,7 @@ struct ideapad_private {
 		bool initialized;
 		int type;
 		struct led_classdev led;
-		unsigned int last_brightness;
+		unsigned int last_hw_brightness;
 		struct mutex mutex; /* protects brightness tracking */
 	} kbd_bl;
 	struct {
@@ -1614,7 +1639,24 @@ static int ideapad_kbd_bl_check_tristate(int type)
 	return (type == KBD_BL_TRISTATE) || (type == KBD_BL_TRISTATE_AUTO);
 }
 
-static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
+static int ideapad_kbd_bl_brightness_parse(struct ideapad_private *priv, unsigned int hw_brightness)
+{
+	/* Off, low or high */
+	if (hw_brightness <= priv->kbd_bl.led.max_brightness)
+		return hw_brightness;
+
+	/* Auto (controlled by EC according to ALS), report as off */
+	if (priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO &&
+	    hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+		return 0;
+
+	/* Unknown value */
+	dev_warn(&priv->platform_device->dev,
+		 "Unknown keyboard backlight value: %u", hw_brightness);
+	return -EINVAL;
+}
+
+static int ideapad_kbd_bl_hw_brightness_get(struct ideapad_private *priv)
 {
 	unsigned long value;
 	int err;
@@ -1628,21 +1670,7 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
 		if (err)
 			return err;
 
-		/* Convert returned value to brightness level */
-		value = FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
-
-		/* Off, low or high */
-		if (value <= priv->kbd_bl.led.max_brightness)
-			return value;
-
-		/* Auto, report as off */
-		if (value == priv->kbd_bl.led.max_brightness + 1)
-			return 0;
-
-		/* Unknown value */
-		dev_warn(&priv->platform_device->dev,
-			 "Unknown keyboard backlight value: %lu", value);
-		return -EINVAL;
+		return FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
 	}
 
 	err = eval_hals(priv->adev->handle, &value);
@@ -1652,6 +1680,16 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
 	return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
 }
 
+static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
+{
+	int hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+
+	if (hw_brightness < 0)
+		return hw_brightness;
+
+	return ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+}
+
 static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
@@ -1659,34 +1697,40 @@ static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_cla
 	return ideapad_kbd_bl_brightness_get(priv);
 }
 
-static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
+static int ideapad_kbd_bl_hw_brightness_set(struct ideapad_private *priv,
+					    unsigned int hw_brightness)
 {
-	int err;
 	unsigned long value;
 	int type = priv->kbd_bl.type;
+	int err;
 
 	guard(mutex)(&priv->kbd_bl.mutex);
 
 	if (ideapad_kbd_bl_check_tristate(type)) {
-		if (brightness > priv->kbd_bl.led.max_brightness)
-			return -EINVAL;
-
-		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, brightness) |
+		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, hw_brightness) |
 			FIELD_PREP(KBD_BL_COMMAND_TYPE, type) |
 			KBD_BL_COMMAND_SET;
 		err = exec_kblc(priv->adev->handle, value);
 	} else {
-		err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
+		value = hw_brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF;
+		err = exec_sals(priv->adev->handle, value);
 	}
-
 	if (err)
 		return err;
 
-	priv->kbd_bl.last_brightness = brightness;
+	priv->kbd_bl.last_hw_brightness = hw_brightness;
 
 	return 0;
 }
 
+static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
+{
+	if (brightness > priv->kbd_bl.led.max_brightness)
+		return -EINVAL;
+
+	return ideapad_kbd_bl_hw_brightness_set(priv, brightness);
+}
+
 static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 						  enum led_brightness brightness)
 {
@@ -1697,28 +1741,32 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
-	int brightness;
+	int hw_brightness, brightness;
 
 	if (!priv->kbd_bl.initialized)
 		return;
 
 	guard(mutex)(&priv->kbd_bl.mutex);
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
-	if (brightness < 0)
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
 		return;
 
-	if (brightness == priv->kbd_bl.last_brightness)
+	brightness = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+	if (brightness < 0)
+		return; /* Reject insane values early. */
+
+	if (priv->kbd_bl.last_hw_brightness == hw_brightness)
 		return;
 
-	priv->kbd_bl.last_brightness = brightness;
+	priv->kbd_bl.last_hw_brightness = hw_brightness;
 
 	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
 }
 
 static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 {
-	int brightness, err;
+	int hw_brightness, err;
 
 	if (!priv->features.kbd_bl)
 		return -ENODEV;
@@ -1730,21 +1778,35 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (err)
 		return err;
 
-	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
-		priv->kbd_bl.led.max_brightness = 2;
-	else
-		priv->kbd_bl.led.max_brightness = 1;
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
+		return hw_brightness;
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
-	if (brightness < 0)
-		return brightness;
+	priv->kbd_bl.last_hw_brightness = hw_brightness;
 
-	priv->kbd_bl.last_brightness = brightness;
 	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
 	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
 	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
 	priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
 
+	switch (priv->kbd_bl.type) {
+	case KBD_BL_TRISTATE_AUTO:
+	case KBD_BL_TRISTATE:
+		priv->kbd_bl.led.max_brightness = 2;
+		break;
+	case KBD_BL_STANDARD:
+		priv->kbd_bl.led.max_brightness = 1;
+		break;
+	default:
+		/* This has already been validated by ideapad_check_features(). */
+		return -EINVAL;
+	}
+
+	/* Reject insane values. */
+	err = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+	if (err < 0)
+		return err;
+
 	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
 	if (err)
 		return err;

-- 
2.55.0

