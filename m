Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80933485CD6;
	Tue, 15 Sep 2026 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470108; cv=none; b=uBCgG2tscUYX2hsxvTYA5QY5Q8J9AYWngzK0JP0uB6e0z3EP9X0G0gygQdhHuBfQqKDNQuGTA+C2gdRDdzJ7V3x7AdDZlPcjc1PUsB5daOC6WyKjjzBz84t018bPcxqTOCh4eeNrephIHN6rV56z7nMBBBtMXyCkCrMSX01GgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470108; c=relaxed/simple;
	bh=XzvmEV9QUHX5ZzwBMxzUsq4GOtsA+8Z1WyeTp/RLrC4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DXuu33NtC24fDZ8zVecAuouU8MYHqAzNk3QER3HMAnvzTaW/c6fhY501wSJdZ/rg9G0rQ4s60qgkRIiXYE5S3v3gNmKYhH0VFS11GTqi7q/v+n8wunYzKpMlcnopS3ZF19WZUz963O9sLreAfgsCH93xoHKqaLj2E65/zzh0IcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAlGAfl3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAlGAfl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789470105; x=1821006105;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XzvmEV9QUHX5ZzwBMxzUsq4GOtsA+8Z1WyeTp/RLrC4=;
  b=HAlGAfl3es1KmSQY6N9pHbVdRSFryD3A2S7xmUd6nXWHNGhrZ2Zj1Uhu
   5wwiscnLCwGsroqKhwvYPl2ER+R0NpnX9x+VSxTD/vySct5OxT24rxRU4
   NphmrKIcyJMM6lHhWsTo8AontxXty4R66ZHiszGoS4CBTeAJUsdhV8NR+
   69i4XrxAiS/7rCxFimImL3QnVLI1qW4qjgJ6vOjNOKja4AlbULiGKfW0s
   2Zi6b1ta7HZemGme+/RM2vKy/QRfa7L4AXT8xyIsT+5oLwv2f0CEZzfni
   oI9YIlP2PO4m1HMfu9m/OtPwwA+S9S7GCGmnVmtQDH9ICd7v5BiEFa9/N
   Q==;
X-CSE-ConnectionGUID: Q6CVx5pMQm6ywWSvu855LA==
X-CSE-MsgGUID: OtIhBjsbRgajiWwngcOcyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89962083"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89962083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:01:44 -0700
X-CSE-ConnectionGUID: n3HWjPJXRYW6gbUbWoO6xg==
X-CSE-MsgGUID: DsrcBnnWSgSGPtbkodF9KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="274913908"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:01:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 14:01:30 +0300 (EEST)
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Maxim Mikityanskiy <maxtram95@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: do not poke keyboard
 controller
In-Reply-To: <anLVzJy8IY9QSNgs@google.com>
Message-ID: <68dc7f72-1272-f6b3-c588-7c2aad2dadd2@linux.intel.com>
References: <anLVzJy8IY9QSNgs@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Aug 2026, Dmitry Torokhov wrote:

> On Ideapad Z570 the driver tries to disable and re-enable data coming
> from the touchpad by poking directly into 8042 keyboard controller.
> This may coincide with the controller resuming and leads to spews in
> dmesg and potentially other instabilities.
> 
> Instead of using i8042_command() to control the touchpad state create
> an input handler that serves as a filter and drop events coming from
> the touchpad when it is supposed to be off.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v2:
> - fix inverted condition in ideapad_tpswitch_filter()
> - mark the handler as passive_observer so that touchpad is not activated
>   until there are real users
> - use READ_ONCE()/WRITE_ONCE() to access shared state flag
> - drop stray semicolon in to_tpswitch_handle()
> - update comments
> 
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 184 ++++++++++++++++++-
>  1 file changed, 175 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 4fbc904f1fc3..8b4c41073b82 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -18,7 +18,6 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
> -#include <linux/i8042.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> @@ -210,6 +209,13 @@ struct ideapad_private {
>  		struct led_classdev led;
>  		unsigned int last_brightness;
>  	} fn_lock;
> +	struct {
> +		bool initialized;
> +		bool active; /* true means touchpad is enabled */
> +		struct input_handler handler;
> +		struct input_dev *tp_dev;
> +		spinlock_t lock;

Please go through this patch and add includes for what is now used. At 
least spinlock related stuff, container_of(), and READ/WRITE_ONCE() lack 
direct includes (please check the other stuff you're adding).

-- 
 i.

> +	} tp_switch;
>  };
>  
>  static bool no_bt_rfkill;
> @@ -234,7 +240,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
>  static bool ctrl_ps2_aux_port;
>  module_param(ctrl_ps2_aux_port, bool, 0444);
>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
> +		 "Enable driver based suppression of touchpad events on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
>  
>  static bool touchpad_ctrl_via_ec;
>  module_param(touchpad_ctrl_via_ec, bool, 0444);
> @@ -1462,6 +1468,160 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
>  	}
>  }
>  
> +struct ideapad_tpswitch_handle {
> +	struct input_handle handle;
> +	struct ideapad_private *priv;
> +};
> +
> +#define to_tpswitch_handle(h) \
> +	container_of(h, struct ideapad_tpswitch_handle, handle)
> +
> +static int ideapad_tpswitch_connect(struct input_handler *handler,
> +				    struct input_dev *dev,
> +				    const struct input_device_id *id)
> +{
> +	struct ideapad_private *priv =
> +		container_of(handler, struct ideapad_private, tp_switch.handler);
> +	struct ideapad_tpswitch_handle *h;
> +	int error;
> +
> +	h = kzalloc_obj(*h);
> +	if (!h)
> +		return -ENOMEM;
> +
> +	h->priv = priv;
> +	h->handle.dev = dev;
> +	h->handle.handler = handler;
> +	h->handle.name = "ideapad-tpswitch";
> +
> +	error = input_register_handle(&h->handle);
> +	if (error)
> +		goto err_free_handle;
> +
> +	/*
> +	 * We need to open the input handle so the input core invokes our
> +	 * filter, but since we mark our handler as passive observer, this
> +	 * will not cause the underlying touchpad hardware to be started
> +	 * if there are no other users.
> +	 */
> +	error = input_open_device(&h->handle);
> +	if (error)
> +		goto err_unregister_handle;
> +
> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> +		priv->tp_switch.tp_dev = dev;
> +
> +	return 0;
> +
> +err_unregister_handle:
> +	input_unregister_handle(&h->handle);
> +err_free_handle:
> +	kfree(h);
> +	return error;
> +}
> +
> +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
> +{
> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> +	struct ideapad_private *priv = h->priv;
> +
> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> +		priv->tp_switch.tp_dev = NULL;
> +
> +	input_close_device(handle);
> +	input_unregister_handle(handle);
> +	kfree(h);
> +}
> +
> +static bool ideapad_tpswitch_filter(struct input_handle *handle,
> +				    unsigned int type, unsigned int code,
> +				    int value)
> +{
> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> +	struct ideapad_private *priv = h->priv;
> +
> +	if (READ_ONCE(priv->tp_switch.active))
> +		return false;
> +
> +	/* Allow passing button release events, drop everything else */
> +	return !(type == EV_KEY && value == 0) &&
> +	       !(type == EV_SYN && code == SYN_REPORT);
> +
> +}
> +
> +static const struct input_device_id ideapad_tpswitch_ids[] = {
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> +				INPUT_DEVICE_ID_MATCH_KEYBIT |
> +				INPUT_DEVICE_ID_MATCH_ABSBIT,
> +		.bustype = BUS_I8042,
> +		.vendor = 0x0002,
> +		.evbit = { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
> +		.keybit = { [BIT_WORD(BTN_TOOL_FINGER)] =
> +				BIT_MASK(BTN_TOOL_FINGER) },
> +		.absbit = { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
> +				BIT_MASK(ABS_PRESSURE) |
> +				BIT_MASK(ABS_TOOL_WIDTH) },
> +	},
> +	{ }
> +};
> +
> +static int ideapad_tpswitch_init(struct ideapad_private *priv)
> +{
> +	int error;
> +
> +	if (!priv->features.ctrl_ps2_aux_port)
> +		return 0;
> +
> +	spin_lock_init(&priv->tp_switch.lock);
> +
> +	priv->tp_switch.handler.name = "ideapad-tpswitch";
> +	priv->tp_switch.handler.id_table = ideapad_tpswitch_ids;
> +	priv->tp_switch.handler.filter = ideapad_tpswitch_filter;
> +	priv->tp_switch.handler.connect = ideapad_tpswitch_connect;
> +	priv->tp_switch.handler.disconnect = ideapad_tpswitch_disconnect;
> +	priv->tp_switch.handler.passive_observer = true;
> +
> +	error = input_register_handler(&priv->tp_switch.handler);
> +	if (error) {
> +		dev_err(&priv->platform_device->dev,
> +			"failed to register touchpad switch handler: %d",
> +			error);
> +		return error;
> +	}
> +
> +	priv->tp_switch.initialized = true;
> +	return 0;
> +}
> +
> +static void ideapad_tpswitch_exit(struct ideapad_private *priv)
> +{
> +	if (priv->tp_switch.initialized) {
> +		input_unregister_handler(&priv->tp_switch.handler);
> +		priv->tp_switch.initialized = false;
> +	}
> +}
> +
> +static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool on)
> +{
> +	guard(spinlock_irq)(&priv->tp_switch.lock);
> +
> +	WRITE_ONCE(priv->tp_switch.active, on);
> +	if (!on) {
> +		struct input_dev *tp_dev = priv->tp_switch.tp_dev;
> +		if (tp_dev) {
> +			input_report_key(tp_dev, BTN_TOUCH, 0);
> +			input_report_key(tp_dev, BTN_TOOL_FINGER, 0);
> +			input_report_key(tp_dev, BTN_TOOL_DOUBLETAP, 0);
> +			input_report_key(tp_dev, BTN_TOOL_TRIPLETAP, 0);
> +			input_report_key(tp_dev, BTN_LEFT, 0);
> +			input_report_key(tp_dev, BTN_RIGHT, 0);
> +			input_report_key(tp_dev, BTN_MIDDLE, 0);
> +			input_sync(tp_dev);
> +		}
> +	}
> +}
> +
>  /*
>   * backlight
>   */
> @@ -1799,7 +1959,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
>  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
>  {
>  	unsigned long value;
> -	unsigned char param;
>  	int ret;
>  
>  	/* Without reading from EC touchpad LED doesn't switch state */
> @@ -1810,12 +1969,11 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>  
>  	/*
>  	 * Some IdeaPads don't really turn off touchpad - they only
> -	 * switch the LED state. We (de)activate KBC AUX port to turn
> -	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> -	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> +	 * switch the LED state. On such devices we use an input filter to
> +	 * suppress events from the touchpad.
>  	 */
>  	if (priv->features.ctrl_ps2_aux_port)
> -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> +		ideapad_tpswitch_toggle(priv, value);
>  
>  	/*
>  	 * On older models the EC controls the touchpad and toggles it on/off
> @@ -2018,8 +2176,8 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>  /*
>   * On some models the EC toggles the touchpad muted LED on touchpad toggle
>   * hotkey presses, but the EC does not actually disable the touchpad itself.
> - * On these models the driver needs to explicitly enable/disable the i8042
> - * (PS/2) aux port.
> + * On these models the driver needs to explicitly suppress data coming from
> + * the touchpad.
>   */
>  static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
>  	{
> @@ -2402,6 +2560,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	if (err)
>  		goto input_failed;
>  
> +	err = ideapad_tpswitch_init(priv);
> +	if (err)
> +		goto tpswitch_failed;
> +
>  	err = ideapad_kbd_bl_init(priv);
>  	if (err) {
>  		if (err != -ENODEV)
> @@ -2478,6 +2640,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  
>  	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
> +	ideapad_tpswitch_exit(priv);
> +
> +tpswitch_failed:
>  	ideapad_input_exit(priv);
>  
>  input_failed:
> @@ -2507,6 +2672,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
>  
>  	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
> +	ideapad_tpswitch_exit(priv);
>  	ideapad_input_exit(priv);
>  	ideapad_debugfs_exit(priv);
>  }
> 
