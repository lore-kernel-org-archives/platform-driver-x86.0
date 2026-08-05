Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DF41B8D9;
	Wed,  5 Aug 2026 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944662; cv=none; b=bRqaXOanWsoR/WLI7h59C+t7CbMRbpQ8dVweaL0xyaH3OdUjxtyhySvfT1M9IPbDsgBJ/T1rnY34Sgf4eo6jUqEN1yeJGEnoHarA/ni8bGx2NxGXk8bM43wkUutHqJEQGi+eDJyzH7QypHozMxV/SoGk4SRwdETfZ0xSUuSUM8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944662; c=relaxed/simple;
	bh=sVoW/ZRVRqjJqvqavphaFV4WV5QPJEv3B3eqjsWNGEk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V1FjfE3jQL8wCsuTMhdAhBajSNd9TL8hdE/Sm4OhXpoJdCCtPTxLHL1fSBFb7ZqXAbJGysQVv5SLXlDQ4H5NOgFrhPQMbRY1v1gA5BhJuddXc8UciplKmvXstyHY7qDiWrnn/YUXJQPPo5YpygEE+10eikOzht6ZDoePx+dRwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=DB/Y0YKB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C/7NZj8u; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="DB/Y0YKB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C/7NZj8u"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id B6D3BEC0299;
	Wed,  5 Aug 2026 11:44:18 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 11:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785944658;
	 x=1786031058; bh=Wf45szdJaK+GAMh8AEeq94XIdsGm1SsvlJxmrSUMxHw=; b=
	DB/Y0YKBc56RVp8Goo2OlYEQTneci5kXQ0clncw8edohOP2qOx513sl5KcLFjGIr
	5VFl6drwVGiE/LsSlE/xwVmJ95dcgdnUHM4paAJjCXGQ8fqFA3csKOAYNadjvxyM
	NOh1aWuTUWQC/M+L/o/BqcUWTqd1NmW8wBIIdzfmwAhgmeN9GMo1WTt80osVzW54
	/1HDcY4fjzBz1owdYxspH3RQVB2kSKgAY4/IjbmPePm647ppLSd3yK8vwCDMeQP6
	7BynKrWz+ar63v/fhQPZhgDXWVEpJghrNgakqNBez2X/RRobF25bwuX+ljcqKD1d
	jaQ/AxQ9CIGkuipNruwOYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785944658; x=
	1786031058; bh=Wf45szdJaK+GAMh8AEeq94XIdsGm1SsvlJxmrSUMxHw=; b=C
	/7NZj8uNJ2S5CO4EX5RjCeU/iWRciYy3bVLtPxQg7qXiD8HdP6MiVUSJUKOxe703
	uEkSwNxtGdSDWn1l1WH5ylZ7PVL5VixC+JSWHYKH4lbwWKVojIdzoxlwvffabd3m
	rMcmYY0jU35gb1XHF3pF1cgPr/RlEOizBvG6rns5/bK6rSYnpsEIGeu7HczeH/FY
	BTXqcPfPPEOEPksBCdlPgUBK9hPYNaWsAq9+d1Jz7+ZYzew2RbPy0E8yUzqzaCyV
	rnoflZz8CkeaIPwuj4wvqtM7YV6bnTBD4MG1b/F6PapJqz/h/YA3NaAcFl8R6znl
	POYgtkMT7FIWuuCrMZGEA==
X-ME-Sender: <xms:Ulpzal3ndPDE957k7OAl1mceL0PBqmsxwC-Me66qoyB3-z1zczRNag>
    <xme:Ulpzam7k7jRAGmWqTrkE5APrYK7xih1wB7bLnmt3oaPVWXHCNx-RsfKR42P0mYHvo
    -p9BrZEapdDyfuM0bvcyhY5eGaPt18yUSNhYqh4QkiMawYTNDSAQKxi>
X-ME-Proxy-Cause: dmFkZTGja0aJe/8tCx03g80QNFGn5Qbujhx+ByiXJj0A6FXHsyIijv7NqoPDDn4u06/FaP
    BaVzvhKszVQuFEI4vA2dAtjcs6AZ80B/RoMYjjpo/VDDKqM6rwjsD27PdaZvMLCbzci6s1
    VnLdch3gBKnATRAMr80FmzWKRJOOP11/VYZ+4r8iM5qtlMl/KA/E2pwCRLQxTnPYraJQVM
    q5RDDstM6Rs7pO4X+d9FCAxQl2j1TAsHpSi4DWwmatzfnJG0osN0XQ0cONRUSieVhZVFYL
    kM0l7Wzzhb8+j+mXmMAxqaShhU83Px8Cr3Z5EzmPfbSeCA7ufAYXr6cAhALgnOwtUMapf4
    mN+wKc7LivMIpjqjivjZ3RZfiVMNuyzUME9uIYdd2QC5SjQOOUM3BAY8Gv5EPyg0LjIcs5
    mXWbzHkDzU7ESnt9SD8sLTegsBsrVXhP6mPt4JdJ6WQmVXAeaETIYIGmhZigfgrAOfpcQQ
    9QOR8ExgHvnYyHw5ftAb+z20vGHu9Da9FWFsYrq4ybOsaz/UpzdGhZcKk/LJHNmtw1BX1m
    2F/zLo2TkSghZSXSXXUHvidtAE1RPsvgRAH+47+i7Wx87BBGMuqli/Y1bwa+mPXoEQlxDX
    IewlpxeKHQmCBOUDRcgyN01R7PBp6JRjWRRwjkEnREXqaE8ft2VaYSfOWcfw
X-ME-Proxy: <xmx:UlpzammK-LRT5IYFLpLcRiKbcOYJ53VftXhbIx7V1beTgS1O4hujHg>
    <xmx:UlpzagYlrTP6DiIJP5uQPZcyh2EvpuRTtdzQN8o91H8TcOpe17OT-w>
    <xmx:UlpzaoT8oWw9j4JmkQnUEKyk3V8qwn8S_2IbE5BEjJ6XrnMGF_WGQg>
    <xmx:UlpzaqvRExnpY5K8h4OTMD-D5Pp7oXRbzIsmJhw4G8elq3rIerB6AQ>
    <xmx:Ulpzav6YNxM78lbbV4lF3M6GKNYDSln6p9ccrwk45QzA0ksMSQk8KwRz>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 46EA72CE03C2; Wed,  5 Aug 2026 11:44:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ApxqJso191Qc
Date: Wed, 05 Aug 2026 11:43:57 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Ike Panhc" <ikepanhc@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Maxim Mikityanskiy" <maxtram95@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <9dd29a4b-fe15-4ff3-847e-509c4ad5cb0b@app.fastmail.com>
In-Reply-To: <anLVzJy8IY9QSNgs@google.com>
References: <anLVzJy8IY9QSNgs@google.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: do not poke keyboard controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 5, 2026, at 2:21 AM, Dmitry Torokhov wrote:
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
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> b/drivers/platform/x86/lenovo/ideapad-laptop.c
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
> +	} tp_switch;
>  };
> 
>  static bool no_bt_rfkill;
> @@ -234,7 +240,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
>  static bool ctrl_ps2_aux_port;
>  module_param(ctrl_ps2_aux_port, bool, 0444);
>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad 
> on/off toggle. If you need this please report this to: 
> platform-driver-x86@vger.kernel.org");
> +		 "Enable driver based suppression of touchpad events on touchpad 
> on/off toggle. If you need this please report this to: 
> platform-driver-x86@vger.kernel.org");
> 
>  static bool touchpad_ctrl_via_ec;
>  module_param(touchpad_ctrl_via_ec, bool, 0444);
> @@ -1462,6 +1468,160 @@ static void 
> ideapad_check_special_buttons(struct ideapad_private *priv)
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

Nit - extra empty line

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
> +static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool 
> on)
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
> @@ -1799,7 +1959,6 @@ static void ideapad_fn_lock_led_exit(struct 
> ideapad_private *priv)
>  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, 
> bool send_events)
>  {
>  	unsigned long value;
> -	unsigned char param;
>  	int ret;
> 
>  	/* Without reading from EC touchpad LED doesn't switch state */
> @@ -1810,12 +1969,11 @@ static void ideapad_sync_touchpad_state(struct 
> ideapad_private *priv, bool send_
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
> @@ -2507,6 +2672,7 @@ static void ideapad_acpi_remove(struct 
> platform_device *pdev)
> 
>  	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
> +	ideapad_tpswitch_exit(priv);
>  	ideapad_input_exit(priv);
>  	ideapad_debugfs_exit(priv);
>  }
> -- 

Looks good to me. Cool folk are using a 14 year old Ideapad (tends to be more common on the Thinkpads). Go Linux!

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

