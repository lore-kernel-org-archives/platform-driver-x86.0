Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070331;
	b=bRs7t6hilk7aK2VKvOCkSeLdr8WKEVHHf+PSyrWwRv0oEUow59E5YYhmYyPth8QUyIS2
	 +gy3utJ3wqyFV10PpmuG4eG/i3pnrVhrDJv8RG1G7KmN1BCkwUergXkupjdctLesASPFW
	 jZxsK1Sla8hZWGqm3dTDwak1r4DbNKZuqmJv9hCLYXutB3QUcwiQehT8eLt+Z1904hrql
	 MeKx2RQiscG5+TF/LCcX4dgPXtU04E1r8KYmRXvEnQfYD2Og/Y7QePYNhoq4a8Qw9o5T6
	 Z4tLVbOtt5/mmxWXaMbMK62FKp1evjVXjNFyQuIAfn0FmwwN4yG7qLjW4hJ9jk6P/BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition;
	bh=vD9TOX4/UFR32mwTthewHixdmLJqklst5atsKHubbWk=;
	b=xnqd9plYmFRDtV9ys5wpeTfg9KfffcRvk+By0Jnwi/z2DxAmTmiMb6FHw69KmT7yBauN
	 hPNcRRcKBZH/+dd4A+70qi9vtS9Qaih55EUZAfpuYwfwOqfXyILLx4mDU0tfcBrsezHTa
	 yRMreg17+Br9/Obmann2IOz/cOzqy6gnMv7CGhOfqW8pD/YKJu+zy7e+xVDF1cZKnJ4wX
	 eu12x/Qr3urUBSPFDxKkmlWpbxdbO8p9ITQ4Ywew1iFLJawSJG2Cy6ch9SrKZt6Rn3HkP
	 Ni5tEnJD/VoGG68X3QTY/jkjpg5CgZzBbyJfQe62uj1GqxkfXtNygvzuwDKdsCQWI9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K8j0beFH;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 714F2606A31F
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 03:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714F2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K8j0beFH
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3140376c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793070330; x=1793675130; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vD9TOX4/UFR32mwTthewHixdmLJqklst5atsKHubbWk=;
        b=K8j0beFHPko+WlK3f8fqWMEZCWhU/+99OsQNj6Xfybat5jGgExzmJ8Hf1kegTHZjda
         cBhXVgskHTcpWNtf2+qSvd+QPCQ05/Oxq0PoAECYCIHWAhylq6VV35HV0xqKpXMH88+N
         8fBLJo5+imylKrMgS0TZHTGnYmJfJjEH8x1YUQ5aClR96Q+rWUdP4HEe57ax9dI1kqqr
         osohgyxml8Nh12f6M3cDNTSx79DsfiZmItpM/lVIBDOnouOB3cSME77p1DVpZcrcxM0t
         YxlMBKtKa0VZnaooYhy4E98LQJMZpf8YuzWPQ0yjKuaas2Y0XoijwWt04h7EzE8UmF4B
         RTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793070330; x=1793675130;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD9TOX4/UFR32mwTthewHixdmLJqklst5atsKHubbWk=;
        b=gLHJBgFOt7VD1Ta2SOEMfYnbhPT8Z1cpBkqF9rzUGv97q0gLGGAT63rfTsvYVwZRnU
         i3x/sLICNDchMne320ah7uFF3UJEM7Lk6Lq2KQVhW7Nyqnl92RzRywMTGrv0JSAlRAnV
         +J+njFXB2M7knvUpKggX6PY95fC/hAJFhRmd5UIcQLBRUMRvkUupJz3N7p79bBgJsXol
         xmu7nJ2BMwpcpWsjKYPDIR6mcoWjSjDaE+2y0PZW8qpSV38xw3vfQh8glk+IAPsRnqo1
         OGhFJKbm8xhydbgHcUMF+Y+B8/gUbos5Q0ElXa5a3D16LwihiXt8ZjDBALOLbK9Uw2QM
         6LwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDPxafJJeKwvHYEUFnwYs0Qre3In08oMir7TNBkHW6zL0mWnNvtcFywPtRwOhRMUdk2X3QqNjT4PQCc+J0dyClJvXB@vger.kernel.org
X-Gm-Message-State: AFq9FYJIH4nhZU+YTRkdFU5VHLcq06/OMe3F03p/BOc2NlA0ZdF2GO4L
	mQjBot6j2F9MRuQQGNTsB92I6QMRw2TWvem3F4CVg03cWQ5FviMDkPb5
X-Gm-Gg: AYBFou3oVxdhFPNrcI2zXYRH5idksPIrbLDGKRDBn9jnyo0iiitlqzD6Xr0h75/k/8N
	QX2lUv2I0/pzmaMLgSuio6k7h1OFs77lKtf9soTHQheVJWiO8qAzg9CUKnIX4DSO/Xd0CFoAeIx
	GQFN5WYRWEVa826gTVO4/31NzSN0uePScTgq2LTXjwa5S3ADjb3AEe5UmyOKNVkKPwZ7YLgA4eV
	/LgjXwUCV4H21MAs57NcoGm8s/uAzkoID+d68qS+5XD59cPGc9ZP21lI+2lUL/Hs2obOwCEdZou
	s8mMkOwUsK0Hovudwa9Xey36I1ScaN0uBFzRPmmVKOcTO9LdScqeE1f0VkvGWeF29HRfD4/a5X6
	sLfLervq3MpD6rF2f8KPVrcdYSRoQQdXSXP+T7LzZeLLdjNn/gqR34E8u9yc7RboIps+/1qqBlm
	pFpjoqouH8T7WSfnRs0IiQ2l3bsccUIv5dOo5zoZPzZkQjgR4aLLEgrD4w5zmOc/RUqtgWmre8V
	yfQ6XY1IXvg5RKH1GnvQzis6PjzSwFX8fSl/Qef2zVppDFM5bENNLSPlKFB2fdY4MaIVYauJO8H
	708aYfOOCpE0oi2URIBq
X-Received: by 2002:a05:7022:ea8e:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1993f3ed553mr12485976c88.47.1793070330267;
        Mon, 26 Oct 2026 20:05:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm39393870c88.4.2026.10.26.20.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:05:29 -0700 (PDT)
Date: Mon, 26 Oct 2026 20:05:28 -0700
Message-ID: <712eb8172d4f38654a08eb88147e6109@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, Alice Mikityanska <alice.kernel@fastmail.im>, Rong Zhang <i@rong.moe>, "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] platform/x86: ideapad-laptop: do not poke keyboard controller
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Ideapad Z570 the driver tries to disable and re-enable data coming
from the touchpad by poking directly into 8042 keyboard controller.
This may coincide with the controller resuming and leads to spews in
dmesg and potentially other instabilities.

Instead of using i8042_command() to control the touchpad state create
an input handler that serves as a filter and drop events coming from
the touchpad when it is supposed to be off.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Alice Mikityanska <alice.kernel@fastmail.im>
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe> # not matching other touchpads
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v4:
- drop <linux/mod_devicetable.h> include (Uwe Kleine-König)
- add missing INPUT_DEVICE_ID_MATCH_BUS and INPUT_DEVICE_ID_MATCH_VENDOR
  flags to ideapad_tpswitch_ids (Rong Zhang)
- collect Reviewed-by and Tested-by tags

v3:
- add missing header includes (compiler.h, container_of.h, errno.h,
  mod_devicetable.h, slab.h, spinlock.h)
- drop stray blank line in ideapad_tpswitch_filter()
- collect Reviewed-by from Mark Pearson

v2:
- fix inverted condition in ideapad_tpswitch_filter()
- mark the handler as passive_observer so that touchpad is not activated
  until there are real users
- use READ_ONCE()/WRITE_ONCE() to access shared state flag
- drop stray semicolon in to_tpswitch_handle()
- update comments

 drivers/platform/x86/lenovo/ideapad-laptop.c | 190 ++++++++++++++++++-
 1 file changed, 181 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524504ee..44b0048c76f4 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -14,11 +14,13 @@
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
+#include <linux/compiler.h>
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
-#include <linux/i8042.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -31,6 +33,8 @@
 #include <linux/power_supply.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -210,6 +214,13 @@ struct ideapad_private {
 		struct led_classdev led;
 		unsigned int last_brightness;
 	} fn_lock;
+	struct {
+		bool initialized;
+		bool active; /* true means touchpad is enabled */
+		struct input_handler handler;
+		struct input_dev *tp_dev;
+		spinlock_t lock;
+	} tp_switch;
 };
 
 static bool no_bt_rfkill;
@@ -234,7 +245,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
 static bool ctrl_ps2_aux_port;
 module_param(ctrl_ps2_aux_port, bool, 0444);
 MODULE_PARM_DESC(ctrl_ps2_aux_port,
-		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable driver based suppression of touchpad events on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 static bool touchpad_ctrl_via_ec;
 module_param(touchpad_ctrl_via_ec, bool, 0444);
@@ -1462,6 +1473,161 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
 	}
 }
 
+struct ideapad_tpswitch_handle {
+	struct input_handle handle;
+	struct ideapad_private *priv;
+};
+
+#define to_tpswitch_handle(h) \
+	container_of(h, struct ideapad_tpswitch_handle, handle)
+
+static int ideapad_tpswitch_connect(struct input_handler *handler,
+				    struct input_dev *dev,
+				    const struct input_device_id *id)
+{
+	struct ideapad_private *priv =
+		container_of(handler, struct ideapad_private, tp_switch.handler);
+	struct ideapad_tpswitch_handle *h;
+	int error;
+
+	h = kzalloc_obj(*h);
+	if (!h)
+		return -ENOMEM;
+
+	h->priv = priv;
+	h->handle.dev = dev;
+	h->handle.handler = handler;
+	h->handle.name = "ideapad-tpswitch";
+
+	error = input_register_handle(&h->handle);
+	if (error)
+		goto err_free_handle;
+
+	/*
+	 * We need to open the input handle so the input core invokes our
+	 * filter, but since we mark our handler as passive observer, this
+	 * will not cause the underlying touchpad hardware to be started
+	 * if there are no other users.
+	 */
+	error = input_open_device(&h->handle);
+	if (error)
+		goto err_unregister_handle;
+
+	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
+		priv->tp_switch.tp_dev = dev;
+
+	return 0;
+
+err_unregister_handle:
+	input_unregister_handle(&h->handle);
+err_free_handle:
+	kfree(h);
+	return error;
+}
+
+static void ideapad_tpswitch_disconnect(struct input_handle *handle)
+{
+	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
+	struct ideapad_private *priv = h->priv;
+
+	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
+		priv->tp_switch.tp_dev = NULL;
+
+	input_close_device(handle);
+	input_unregister_handle(handle);
+	kfree(h);
+}
+
+static bool ideapad_tpswitch_filter(struct input_handle *handle,
+				    unsigned int type, unsigned int code,
+				    int value)
+{
+	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
+	struct ideapad_private *priv = h->priv;
+
+	if (READ_ONCE(priv->tp_switch.active))
+		return false;
+
+	/* Allow passing button release events, drop everything else */
+	return !(type == EV_KEY && value == 0) &&
+	       !(type == EV_SYN && code == SYN_REPORT);
+}
+
+static const struct input_device_id ideapad_tpswitch_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_BUS |
+				INPUT_DEVICE_ID_MATCH_VENDOR |
+				INPUT_DEVICE_ID_MATCH_EVBIT |
+				INPUT_DEVICE_ID_MATCH_KEYBIT |
+				INPUT_DEVICE_ID_MATCH_ABSBIT,
+		.bustype = BUS_I8042,
+		.vendor = 0x0002,
+		.evbit = { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
+		.keybit = { [BIT_WORD(BTN_TOOL_FINGER)] =
+				BIT_MASK(BTN_TOOL_FINGER) },
+		.absbit = { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
+				BIT_MASK(ABS_PRESSURE) |
+				BIT_MASK(ABS_TOOL_WIDTH) },
+	},
+	{ }
+};
+
+static int ideapad_tpswitch_init(struct ideapad_private *priv)
+{
+	int error;
+
+	if (!priv->features.ctrl_ps2_aux_port)
+		return 0;
+
+	spin_lock_init(&priv->tp_switch.lock);
+
+	priv->tp_switch.handler.name = "ideapad-tpswitch";
+	priv->tp_switch.handler.id_table = ideapad_tpswitch_ids;
+	priv->tp_switch.handler.filter = ideapad_tpswitch_filter;
+	priv->tp_switch.handler.connect = ideapad_tpswitch_connect;
+	priv->tp_switch.handler.disconnect = ideapad_tpswitch_disconnect;
+	priv->tp_switch.handler.passive_observer = true;
+
+	error = input_register_handler(&priv->tp_switch.handler);
+	if (error) {
+		dev_err(&priv->platform_device->dev,
+			"failed to register touchpad switch handler: %d",
+			error);
+		return error;
+	}
+
+	priv->tp_switch.initialized = true;
+	return 0;
+}
+
+static void ideapad_tpswitch_exit(struct ideapad_private *priv)
+{
+	if (priv->tp_switch.initialized) {
+		input_unregister_handler(&priv->tp_switch.handler);
+		priv->tp_switch.initialized = false;
+	}
+}
+
+static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool on)
+{
+	guard(spinlock_irq)(&priv->tp_switch.lock);
+
+	WRITE_ONCE(priv->tp_switch.active, on);
+	if (!on) {
+		struct input_dev *tp_dev = priv->tp_switch.tp_dev;
+		if (tp_dev) {
+			input_report_key(tp_dev, BTN_TOUCH, 0);
+			input_report_key(tp_dev, BTN_TOOL_FINGER, 0);
+			input_report_key(tp_dev, BTN_TOOL_DOUBLETAP, 0);
+			input_report_key(tp_dev, BTN_TOOL_TRIPLETAP, 0);
+			input_report_key(tp_dev, BTN_LEFT, 0);
+			input_report_key(tp_dev, BTN_RIGHT, 0);
+			input_report_key(tp_dev, BTN_MIDDLE, 0);
+			input_sync(tp_dev);
+		}
+	}
+}
+
 /*
  * backlight
  */
@@ -1799,7 +1965,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
 static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
 {
 	unsigned long value;
-	unsigned char param;
 	int ret;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
@@ -1810,12 +1975,11 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 
 	/*
 	 * Some IdeaPads don't really turn off touchpad - they only
-	 * switch the LED state. We (de)activate KBC AUX port to turn
-	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
-	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
+	 * switch the LED state. On such devices we use an input filter to
+	 * suppress events from the touchpad.
 	 */
 	if (priv->features.ctrl_ps2_aux_port)
-		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
+		ideapad_tpswitch_toggle(priv, value);
 
 	/*
 	 * On older models the EC controls the touchpad and toggles it on/off
@@ -2018,8 +2182,8 @@ static const struct dmi_system_id hw_rfkill_list[] = {
 /*
  * On some models the EC toggles the touchpad muted LED on touchpad toggle
  * hotkey presses, but the EC does not actually disable the touchpad itself.
- * On these models the driver needs to explicitly enable/disable the i8042
- * (PS/2) aux port.
+ * On these models the driver needs to explicitly suppress data coming from
+ * the touchpad.
  */
 static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
 	{
@@ -2402,6 +2566,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (err)
 		goto input_failed;
 
+	err = ideapad_tpswitch_init(priv);
+	if (err)
+		goto tpswitch_failed;
+
 	err = ideapad_kbd_bl_init(priv);
 	if (err) {
 		if (err != -ENODEV)
@@ -2478,6 +2646,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
+
+tpswitch_failed:
 	ideapad_input_exit(priv);
 
 input_failed:
@@ -2507,6 +2678,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
 	ideapad_input_exit(priv);
 	ideapad_debugfs_exit(priv);
 }

-- 
Dmitry
