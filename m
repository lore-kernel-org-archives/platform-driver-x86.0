Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644660;
	b=ZvaEjE6DwLjrrljPr60674Q/Mt3m2I/C+yRk6LKfO7sssSESnXeeRc9XP0B2rOGTtSSy
	 G6OaNSEq2FfUz31WlhFHA8sOG5PsxFRAl8IzdgTRFtPdMjNOlOKZmINBVY5ThVV3gZLLu
	 /P9Hnv9qIBgtC81aruk0cJjm3QgkJtuxzI8cUgrSzatMRMj+broq4VNv/48jfSzVY6DYF
	 8WfaMlvtaV/TARQTl1khiR7dIkAWzQ8khgcc73Nxv8czUYm6Ii4OGYPRhdh41O4QPkIKN
	 eIAOBEkOFKAFFU/w5sp1uY2zztbUny7PRj1KNGOzmOoVlvl6ux88FnZmjTn6pPfx8Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=vOO2/UqSFvP0eLpj9/3uPUE4+nv1U6cbi6EZXtRMkW8=;
	b=zoOhZsX1Momco81IOfxnVUvOdLGXUgEwVlrhmf5xCrpDrsMn8Ml7ibeJTfUxkHvGRiM9
	 4y7/sOjxTFaqslPRsw5WYFNADqeEt3UttvzkmAyT5DCgy40ngqocMnP/8mw4nVDTtlGT6
	 Dadq5P6jBAvyqtCHii5yeS8YJvD4qlUBB7oHS4DqeKzcFP46EtLQMY4oLJMpPrHQYeH7W
	 bdhW8mdEWuLbgkViIC9POxNNL0aq7U9LoXhHYllJlB+psxeuvMgEPioMAVJs/dqJJG70O
	 XOwD+1oYzMTfMcCbFz2JxcEcRrRX2DNu5MXZnMJmMhtiHPp/ysiwcquBKYm4xrDNlNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f0lYSkuO;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8B063606A321
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 04:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B063606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f0lYSkuO
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-16079d54c17so2700854c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792644659; x=1793249459; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOO2/UqSFvP0eLpj9/3uPUE4+nv1U6cbi6EZXtRMkW8=;
        b=f0lYSkuOnh4B/HImkJPwznbL7jCvRNq9v/HNp92nPLW3P0fXdn5F4xBPSZqPJKMa07
         9qMBTZxsG6fqFT8kgwEuyylCQXtBVmLF1iFn7gcFMhF2h0FiWH5udIHSR65c97GAvpJ3
         X8dDx8fQXTZsH4P3R1MsTVX98i5kz8OT9lkHAKjqNqtFZ/mH//FO9Nbbugp9/uycQErF
         SM4Ti1duMW6dRhtcfMtAGDzflNGv0ySItD4RhpRpiKAk4LpAUNZIsVm5AUG4PUv5uaHq
         fQw6Y/PQiTddv7UsslX2Gzc4PO3rEIej4U9YTQeIfhS99/w5uiFohPmRNJIzm/KnGF5K
         30iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792644659; x=1793249459;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOO2/UqSFvP0eLpj9/3uPUE4+nv1U6cbi6EZXtRMkW8=;
        b=fSGI8oHh2kmPQMh106MRsk/RTv3ydo6NDZTahNaFkNqjkJDaeI8PSxSK8Rwt5m+5ka
         hc7bipAozReEmRB9fWPwmOvxXQi1D9KhrJv+BL4gJAUmSfKf9bdPQ4el1xwhg7ODhkAr
         WEIjdCASO2UOqifFOhqzl1nEZV+wsfEObmhtDB1hTzd7Zd2D89E6UGxGlkynqad5Go4A
         gl2ji3xDElgq53u4nthqkIzRECT3G6pJNJB+uTgchWWU+W4dGO8OXQhe/KaQbkSEqjAn
         g1WhLqmBYnfCRLqhoqH/j2RaPwHEKVdfskKdDLCW5xIrsVpCESouLnB+mlj5r27rXh5g
         yslA==
X-Gm-Message-State: AFq9FYLBjtyYh2Mjol4HS4uOFmnu/vAKisz+SixGKFoN8AiGjWVHEWoV
	mpeT8bp2OA0yggBHjU2KUKYrjpnyV5Iwu2QTsFZ8as7QuYCsQhSz5hEK
X-Gm-Gg: AYBFou2DyrAJzERqeACSm29X8TwF0hKU78WjNXXs1q1oCr2dDEnsy34gUN9nTraUWPN
	J17/TGRmrXsvojEsqJf2SZzFPujzfWyVuAhr+u+dc6f4EXKiLvPUqHbNcRmPUX/VqN4EAoDkFtr
	sqL+6pm0WuFwMSjfnn4d7BuDGLnznY5bY568S0GguZAAtd97AT+2kBOraRJjhQHZ4f74TyFZvn4
	BaNAy+Xg6DB1lc1D1HH/f5e9lLu+Q/u/lPPBN2c0jj6N0FOIx4UqjiSRkLML18Raf2xu2zdmFuj
	iVmQzEs9qQRz2bwWNrZoOTx+BfjUzdZL7eW4m4TGPPn5thkKdsh5LkKYJirphOLuEyY4pjs3cAP
	1bz0aH9npVQwTRt/keCVI/XH17Mu9WRyftpww/2ajlHREB0DZamT9Y+L639LbVMI4/27XzvH7iI
	pPpMmUat43tOgSnZxsWVD9vSRVSSwjiy1efAbeVaEdNbDrxAlAst6SgevvHAmG3KX1fd+2I5UI0
	ETtKJGHIx8Q6hVhStj1T1zu43N91jqSqILQroTgw3A3o46PUvvftmFIoEX2RLAxWbM/by37Hg1o
	MNDepFYLxeG5J18vzhlp
X-Received: by 2002:a05:7022:7e89:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-190a599a074mr6125893c88.21.1792644658431;
        Wed, 21 Oct 2026 21:50:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm16855697c88.12.2026.10.21.21.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:50:57 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:50:56 -0700
Message-ID: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Ideapad Z570 the driver tries to disable and re-enable data coming
from the touchpad by poking directly into 8042 keyboard controller.
This may coincide with the controller resuming and leads to spews in
dmesg and potentially other instabilities.

Instead of using i8042_command() to control the touchpad state create
an input handler that serves as a filter and drop events coming from
the touchpad when it is supposed to be off.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

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

 drivers/platform/x86/lenovo/ideapad-laptop.c | 189 ++++++++++++++++++-
 1 file changed, 180 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524504ee..be890e82b9ef 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -14,23 +14,28 @@
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
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -210,6 +215,13 @@ struct ideapad_private {
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
@@ -234,7 +246,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
 static bool ctrl_ps2_aux_port;
 module_param(ctrl_ps2_aux_port, bool, 0444);
 MODULE_PARM_DESC(ctrl_ps2_aux_port,
-		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable driver based suppression of touchpad events on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 static bool touchpad_ctrl_via_ec;
 module_param(touchpad_ctrl_via_ec, bool, 0444);
@@ -1462,6 +1474,159 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
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
@@ -1799,7 +1964,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
 static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
 {
 	unsigned long value;
-	unsigned char param;
 	int ret;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
@@ -1810,12 +1974,11 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 
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
@@ -2018,8 +2181,8 @@ static const struct dmi_system_id hw_rfkill_list[] = {
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
@@ -2402,6 +2565,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (err)
 		goto input_failed;
 
+	err = ideapad_tpswitch_init(priv);
+	if (err)
+		goto tpswitch_failed;
+
 	err = ideapad_kbd_bl_init(priv);
 	if (err) {
 		if (err != -ENODEV)
@@ -2478,6 +2645,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
+
+tpswitch_failed:
 	ideapad_input_exit(priv);
 
 input_failed:
@@ -2507,6 +2677,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
 	ideapad_input_exit(priv);
 	ideapad_debugfs_exit(priv);
 }

-- 
Dmitry
