Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53421D3E8
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 03:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785902028; cv=none; b=n2XYgfP1uJhzkAGWw8jOhg34R2KM86Y+f2TWp9MCxzYvTevs4oeej/1tvc040XD4UT8e21HpkruY49GkmuJ38t26rxvC4IPrujepBAUCy7+M1ut2T3Y9wzEmyis3lfSeJhEdoMQXUzuv45tI+idMq8s041DCGIM7P1oUCH/jswM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785902028; c=relaxed/simple;
	bh=6czYU5Oa9WZyV8JW9BgZnqi7ZB9hIUW/2qAmkCw0qBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFAdrpMrRlt3g8hL5xGYhpwkt/5Vl7SiKDN1n4eiBjexyzHN6drZWGEgckUfbDhABtE10ZmmEXPv5GXYLTwBaoo07xlgTxU323i+MCyOW/9nRHeSTP12cfOXyx3Hqyezsqhn2RfaHL5ooYbZYets5SRXdxWscVZa+AVLCUfz5mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlTKOC/Y; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlTKOC/Y"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf50c6f235so6884785ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 20:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785902026; x=1786506826; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aArZVDET4swnltVql8eMgSIS5WdHN1v7z0Y93I05HeA=;
        b=QlTKOC/Y8usVZOm0+t7+JyFh9/S/Krh/MRuNFwgRhWdJmSONrWYqPJ3MWBPGaDrxP1
         SOUnYzRiMCqwVhkrAcC7ojP7YjUAa3Yybk7ZXwbi5mN9p8G950lX3C9JAH32htDgFQFN
         zeBA68+2TQWtY58UBlPh5KwyQkNd9JmGoffGnImJSifP+IxyvIOOJUVOF7fDljFPrTwI
         J4xyF8l7CM6f95JoAuCKVV3hAyC82AJx3oufi0R3FEbwmyAIo2FTQHLoC0pTmyIbxTOb
         xIL65RVDvr3bOv4bN8IYbqyLk2ttX4M9GHjAZI19rN7IfOAG3JuPFuVqgVpyLji5pa1e
         bv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785902026; x=1786506826;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aArZVDET4swnltVql8eMgSIS5WdHN1v7z0Y93I05HeA=;
        b=c+RewIQGlgcz5olevITvUEVP8IjoB5ndbVVXNCX653snBweaCt5X+vBgXAeSe3miTE
         Tj+Xw+MQGFrgfbJ8CxpLQEwp3HrZ7wHnFOlkssRqbL7LFyCcXVDxDwGWtPyay096QU1k
         xyUvSOGrwkuv7egGhc8z09IA/Jt8vNsVOw2hWZl+DB7XAwezeH/SeESFs1SZNMB3b9GV
         h9BvZ99JgOtNPu+AwIaPDT0jv+hPMVLjjmaMA2uwoVm5TgBvEClXNP0d0X15jloUQ+hU
         HbZq5x9wiC1T7RB5V7cnqfKjOEXENQCCwQobo6QIWV3vCZlXOjWzSNNjChRvgj8De6Cb
         gZzA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3WW2Deumn+rdju13W7oczV4i8vRZ5WMsGNdzoaPKE+MU9YLxpw485ZgDnVycbTSv82MIQvcqgyv8FQBFQoabpeH1J@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVv2WcXKmiVZRZ4Afy5kWqzdayD+WDESOfoKy8aZOizWQdzVa
	LeUkgofKvNjW5juSn1UwlTUTxhCd81SKU4NTque671jHCiqhs7KxRtQA
X-Gm-Gg: AR+sD12H4LO8hlkJ1mo4XilWMrrKzLKhSq66I7IHFOLIkT1Z5F6L+59LyrZ52nHAczp
	nml4mcrFGQ+7EWk1L1XioAcFHWFmB2LS7S3zVl2BQXl2bVEvZkdvmZ/RLg1xL39Fisvzsb+QwYi
	OS4zFcH+3NbkZEC4t+87A8XuLtsFtxxPptP5twG7CBczK7w3fj7Z4CLFi8DIscGgtr2S+GJHuwR
	b5dVQXC00VXrUOOfHjeuiglG5yfndHmV2a/D+RUK4HowBi/Loxwj8cJ3yWdtLHti4iVI97Ljzqg
	dj2+u++0ODg+w9/DJxBqLxXM7XnGSInUp9uRPUqef3cLTSfCGFfwjpvzCmE4vOFvZPJMTxkxaOE
	FUWtFx6Dt39lOSm/wQUrK07jqzQ8sPXjc8XyYkfjlr6ksojZnh7x4m7foMfGO+3IRzXUZ4UUkk8
	T/SAB6g68gkAWLaW52FW5CKzEQpSzfiV2MTPparb+eYlwV5qGGt02PwvWlfH/zJtk5f5kTalCNw
	o0gtrebXVOJvPi/oHfOv04CoJVpnQ==
X-Received: by 2002:a17:902:da87:b0:2cf:4c0f:5129 with SMTP id d9443c01a7336-2d0caa03fcfmr34619265ad.17.1785902025892;
        Tue, 04 Aug 2026 20:53:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf3a:ac93:79c4:84fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b76cfsm10030054eec.4.2026.08.04.20.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:53:45 -0700 (PDT)
Date: Tue, 4 Aug 2026 20:53:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: do not poke keyboard controller
Message-ID: <anKyOZVc_NnCgJgk@google.com>
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

Spring^WFall patch queue cleaning. The concept of this patch was
discussed in August 2024 but I neglected to send the final version
of the patch:

https://lore.kernel.org/r/20240805141608.170844-1-hdegoede@redhat.com/

 drivers/platform/x86/lenovo/ideapad-laptop.c | 171 ++++++++++++++++++-
 1 file changed, 168 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 4fbc904f1fc3..384faa511120 100644
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
+		bool active;
+		struct input_handler handler;
+		struct input_dev *tp_dev;
+		spinlock_t lock;
+	} tp_switch;
 };
 
 static bool no_bt_rfkill;
@@ -1462,6 +1468,158 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
 	}
 }
 
+struct ideapad_tpswitch_handle {
+	struct input_handle handle;
+	struct ideapad_private *priv;
+};
+
+#define to_tpswitch_handle(h) \
+	container_of(h, struct ideapad_tpswitch_handle, handle);
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
+	 * FIXME: ideally we do not want to open the input device here
+	 * if there are no other users. We need a notion of "observer"
+	 * handlers in the input core.
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
+	if (!priv->tp_switch.active)
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
+	priv->tp_switch.active = on;
+	if (on) {
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
@@ -1799,7 +1957,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
 static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
 {
 	unsigned long value;
-	unsigned char param;
 	int ret;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
@@ -1815,7 +1972,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
 	 */
 	if (priv->features.ctrl_ps2_aux_port)
-		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
+		ideapad_tpswitch_toggle(priv, value);
 
 	/*
 	 * On older models the EC controls the touchpad and toggles it on/off
@@ -2402,6 +2559,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (err)
 		goto input_failed;
 
+	err = ideapad_tpswitch_init(priv);
+	if (err)
+		goto tpswitch_failed;
+
 	err = ideapad_kbd_bl_init(priv);
 	if (err) {
 		if (err != -ENODEV)
@@ -2478,6 +2639,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 
 	ideapad_fn_lock_led_exit(priv);
 	ideapad_kbd_bl_exit(priv);
+	ideapad_tpswitch_exit(priv);
+
+tpswitch_failed:
 	ideapad_input_exit(priv);
 
 input_failed:
@@ -2507,6 +2671,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 
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
