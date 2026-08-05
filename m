Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F1383C80
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910909; cv=none; b=XCd9ZL+dcmE2k07p+TXh81qgZqXjlwQdl1JjjdnUkdAQCmKOViviT01lxNUceB9NONc0COqoL8C2qh4TPrwY/gCrPAbIEYIMy7Ydy/RZAmUJMpPi2XXMFefbGAdK4YV62Yh7sNpvd+jyZ+1FYQ3e/rQN2gJjogjoRLa3IbGNItw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910909; c=relaxed/simple;
	bh=xwx0hlvA4XtlHXd2QMfEVUuNPTakafBXWOYOx7VFyQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mI7bL7zzXVaYolABLYzraB5440ZpsPGkuPfnMW8MdFGJbRqrFN2c1XAbNOjBY2OAyIbd2hGh820+Mxzv9ZCDEhU8/QNltDRMNpZQfKJzCMu6ZQVwXrbv2cmeBGfbKIpyGvSzaO8tE8oQ2o+UKyTRMVPWKVtGg8kvOB+rMV9NLM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ2pha08; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ2pha08"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d01663d816so5778885ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 23:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785910907; x=1786515707; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMe2rbC9KP2Ux8ko/bzjXSZLLnHlvsk1NNgPaqq2vZ8=;
        b=HJ2pha08NEDGflaWEKkSO5QoIkgUPCYYsRZhk0mByUgOxhresuXGyj6X/wFCwDxYNZ
         v+RG8ExCkTqCP9uVVO4zEGfy35HHdr3rjn6jEcAP3S/fO6YO+DMa8sRhk/doVDlXDI7B
         Sshfo6yrRrT0SqsC/HPb9iuibnEcs42blcuqRejgcdOvgb7u1e1f7NXuljr8GEgs43lM
         hTdUfU5XtZvpW4zBECXVweHfkzAgG6mlNwymkYk/PrgPvKalhy2WyHUMme+9NY/0geOu
         LEKUgZaOUzlz4oaqrfcaQ7OGDUYdV14PgMcgCSE+3IVZbEKzUUDHt8z/TjTdGUgRj2Z/
         I9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910907; x=1786515707;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMe2rbC9KP2Ux8ko/bzjXSZLLnHlvsk1NNgPaqq2vZ8=;
        b=iMKWBlSmm+zKuQcab6gPsWKTuwWFO9E1ZMVrVtVzLB3xKptcZQcfCB9omzA1W1Ulge
         cFRwEYYpg1xqnSDTe4nNueQ7FyVQH9o6ev2TnLHyus7bf71UunbtCxr6iBof+T3BTndg
         MdFeq3KoxuIXT1YprmyOPoF1FCooKPZZlUlKj2J9X/jKNY+uRTVcgM0b5SU7XW8FLUIg
         t+6DIetMQ000HsCYC8PIOa7VMBJcSkFqhQD7GKFvtsFZycIu9+dNOHPC1VcnEbZ89hax
         fWqvrqk0whmW05xYj/kBNCPtCcTZnPYpGGCNncTkvGVLEgwD2FeacngOCURC3saJ9lC8
         zrzA==
X-Forwarded-Encrypted: i=1; AHgh+RoRuf1xtFB3KHEZhnYsx4CVa2PT4br5G3KOCe2faVSLg5fArVEHIh+C/VUvReXPZg2Ajb/vErU8NzpPmW0Eo/D418eD@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQnGfhZO+X7br10M1xUQOc6CmlzYqgyfdfS7RyG5QePDSaac6
	3uPuIwWR0RHZw7VbbShDMLXtgxTe2xcazT15118mCH1qvFxjXSib2M4v
X-Gm-Gg: AR+sD13U0+SAquKNX2r5EoBZ4zyCkdRP1GnNBQm8nrsjsiasKjZdqlkl1Oy7AKFfLGI
	Q1w9TL8U6Kny2AUERRAFuDratjFuzZt3bDHVA7W5Y1t6l0J5AWo/5Ilvfqvfqew9O+qJczU3qlU
	Wel4DVjDxCzEgOBHM9/PBX1laP/5lD6Tt5E2HkkdvTGRiXtPtdTxiV7SZpouidgPipzOlEG2U8A
	IpVbP9uC2irWOo42lMzfxfGe/opsR9lc0v0RBFI14KUBYHrDlN4XCSLUd21M8fci1PmI2ZGGKbP
	XP+3NMdpr8OzOh36ps1w7C8pi7iXVWA+D1zlkxeCRr/Pm5vsHc7G5xIaYJs1c6MzgKtb4Hax8OD
	hSP2Huo15S7xpIC+14ibn6R9zD8tJlCtGdtnyLXIPbJVU5+gSvjV8qn9DQ+MIaHPz59ESfejpve
	l8+h6FliR+DonKY0B45hd/NipBZ0UQvOvMSTqmrAJDH1CBZxK+vOeaTTC2qVHU0CFkuyaoOqbRF
	0KL3Qr2RQCm0zbtnnXkotZFpju04g==
X-Received: by 2002:a17:90b:2d50:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-3903c5ca8c2mr4602520a91.15.1785910907345;
        Tue, 04 Aug 2026 23:21:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf3a:ac93:79c4:84fd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8e969esm9705613c88.10.2026.08.04.23.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:21:46 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:21:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: ideapad-laptop: do not poke keyboard
 controller
Message-ID: <anLVzJy8IY9QSNgs@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Ideapad Z570 the driver tries to disable and re-enable data coming
from the touchpad by poking directly into 8042 keyboard controller.
This may coincide with the controller resuming and leads to spews in
dmesg and potentially other instabilities.

Instead of using i8042_command() to control the touchpad state create
an input handler that serves as a filter and drop events coming from
the touchpad when it is supposed to be off.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2:
- fix inverted condition in ideapad_tpswitch_filter()
- mark the handler as passive_observer so that touchpad is not activated
  until there are real users
- use READ_ONCE()/WRITE_ONCE() to access shared state flag
- drop stray semicolon in to_tpswitch_handle()
- update comments

 drivers/platform/x86/lenovo/ideapad-laptop.c | 184 ++++++++++++++++++-
 1 file changed, 175 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 4fbc904f1fc3..8b4c41073b82 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -18,7 +18,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
-#include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -210,6 +209,13 @@ struct ideapad_private {
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
@@ -234,7 +240,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
 static bool ctrl_ps2_aux_port;
 module_param(ctrl_ps2_aux_port, bool, 0444);
 MODULE_PARM_DESC(ctrl_ps2_aux_port,
-		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable driver based suppression of touchpad events on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 static bool touchpad_ctrl_via_ec;
 module_param(touchpad_ctrl_via_ec, bool, 0444);
@@ -1462,6 +1468,160 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
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
+
+}
+
+static const struct input_device_id ideapad_tpswitch_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
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
@@ -1799,7 +1959,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
 static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
 {
 	unsigned long value;
-	unsigned char param;
 	int ret;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
@@ -1810,12 +1969,11 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 
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
@@ -2018,8 +2176,8 @@ static const struct dmi_system_id hw_rfkill_list[] = {
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
@@ -2402,6 +2560,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (err)
 		goto input_failed;
 
+	err = ideapad_tpswitch_init(priv);
+	if (err)
+		goto tpswitch_failed;
+
 	err = ideapad_kbd_bl_init(priv);
 	if (err) {
 		if (err != -ENODEV)
@@ -2478,6 +2640,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
+
+tpswitch_failed:
 	ideapad_input_exit(priv);
 
 input_failed:
@@ -2507,6 +2672,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
 	ideapad_input_exit(priv);
 	ideapad_debugfs_exit(priv);
 }
-- 
2.55.0.571.g244d577d93-goog


-- 
Dmitry
