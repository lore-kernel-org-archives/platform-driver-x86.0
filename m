Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792895197;
	b=3uDhA3I8C3+v/cmdhNdV9BIkVUog81gdlmBXXTzt1zDDlVJABayDsKYBVj2/Z3nCKqtF
	 aoeAyJest8YCabKCZ0CPfBdKBgOeaRQAZx0mYP5ZdWtfBUXMQBhu3LR8Z/r+c/7VZD3i7
	 +hEG66UMg/VcwC+AKXSl7XprdVquzAkJVxcRlpZ35kLS8M/MCLT38wEqzJ/v09FXgp7mu
	 1SQgDwModQBc7HyBfcM77cd3R1RGdrOGELZB9JWpGm/YziIfTgtF7Ko3vAPlVa/rEwwk2
	 55IM8g6jnywFwj6yPfiSjMjdGXSzaZL/QiwwdjVjou+u20447GUz+PRurzGaCfcHivg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895197;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=dmDUcpV3KGViTETJyk4/CAumitkymDkf6pHFGv/1rAs=;
	b=O32GCYrtcRysLxcuW8V7P8CC51Z9Gf2ZZZ+HesUDwrXiBeb+lZ2rCGEY1sihrOG8JT6C
	 kDyPGRVcmMoqK5NljkbOCIgXVj35JzBjkZhKY6aG9knq8FKlOkQo+TvkWk79hiNW1uvM0
	 1P40GpyjNSNLupNWKkmie8hPSDNILadxi52F9OCwO4loZ8DCjXHqzhrbJIT+0irEQ/HUS
	 TnSAkPTifYXEOTJhxLkvnG1JgdcTmxYnxOa7RE0Jkkr1rrESr3Rd6zr0YxZogx7Lw69Us
	 upLzKn1NGZXVpRKaS5rx04NB9mJyk8zNiJ+MEJ4EKwCgqAWFfZk0csB2bSSh/W2Dj6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=SQiWVCma;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E72606A31A;
	Sun, 25 Oct 2026 02:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E72606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=SQiWVCma
ARC-Seal: i=1; a=rsa-sha256; t=1792895187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YAJk7MVRofM1VaecQNtCkY7I6/nbiJ45VQVw83UE9GEZgfgH8ZZmCk7Ovv8mRDZai0HjDvfQb3VhRBNv453nJEmXm/AOu9WscEvHkLDa66y3fEfcnQhTDmg6cM8c1/IAi6RW4/bIMXXM1VJWkjH9c0VVMpGCWVqyONhe6Ql6eLY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792895187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dmDUcpV3KGViTETJyk4/CAumitkymDkf6pHFGv/1rAs=; 
	b=Rl/x/jijQmeBoZahyqiOMvcfyGWrBiQiG+nplB3HX25IRRfJKUuq7YHGJRW2vBm/i10XVrOyTV7Lr+D/elUWh/9eovTsLhgQ4JYM0N1lfoRPQXki+Q0FLDnb4veTW2uTv3eqpG9zRPnjR0+ToQW5oEaDtCcrNp29YwtqKJGhrYY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792895187;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=dmDUcpV3KGViTETJyk4/CAumitkymDkf6pHFGv/1rAs=;
	b=SQiWVCmaBQgviLvb+pDS/8Q9Lz7rU7gbb/ZOBCoh4szgjT3IxJUNdVU+MNFwdK5U
	oOf5cAbiDs0iQGOnQisLVUc4FyoR2hHon6mgWYcSs9kP8w4Wlj8VHcrlJ8lQKYe01yl
	oDJq3inzn/3MYpeLIUFCXsx8Y5va1/mSSaaH/4Hk2c+J2Ol5iisBATV5u84drahffse
	4QY0+X/q/ShNcBEyMFuxTejSaY4Xd3mU9pCM2HcrmXhJwEmEnDhySGtC3Bhfu7P5pBY
	pO4St99j6QNpror+biZbOqxQsdrxKADTvmmNvhoYNHgbpdIFubNWd1u/2Aff0zW8f7q
	c7JUFIBgFw==
Received: by smtp.zohomail.com with SMTPS id 17928951840521012.1232151148499;
	Sat, 24 Oct 2026 19:26:24 -0700 (PDT)
Message-ID: <35aef2ab2b6607a46eaa0105e8b13c7ba60e5509.camel@rong.moe>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
From: Rong Zhang <i@rong.moe>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Maxim
 Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 10:25:46 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Dmitry,

On Wed, 2026-10-21 at 21:50 -0700, Dmitry Torokhov wrote:
> On Ideapad Z570 the driver tries to disable and re-enable data coming
> from the touchpad by poking directly into 8042 keyboard controller.
> This may coincide with the controller resuming and leads to spews in
> dmesg and potentially other instabilities.
>=20
> Instead of using i8042_command() to control the touchpad state create
> an input handler that serves as a filter and drop events coming from
> the touchpad when it is supposed to be off.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> v3:
> - add missing header includes (compiler.h, container_of.h, errno.h,
>   mod_devicetable.h, slab.h, spinlock.h)
> - drop stray blank line in ideapad_tpswitch_filter()
> - collect Reviewed-by from Mark Pearson
>=20
> v2:
> - fix inverted condition in ideapad_tpswitch_filter()
> - mark the handler as passive_observer so that touchpad is not activated
>   until there are real users
> - use READ_ONCE()/WRITE_ONCE() to access shared state flag
> - drop stray semicolon in to_tpswitch_handle()
> - update comments
>=20
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 189 ++++++++++++++++++-
>  1 file changed, 180 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 8213524504ee..be890e82b9ef 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -14,23 +14,28 @@
>  #include <linux/bitops.h>
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
> +#include <linux/compiler.h>
> +#include <linux/container_of.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
> -#include <linux/i8042.h>
> +#include <linux/errno.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
>  #include <linux/power_supply.h>
>  #include <linux/rfkill.h>
>  #include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> @@ -210,6 +215,13 @@ struct ideapad_private {
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
> =20
>  static bool no_bt_rfkill;
> @@ -234,7 +246,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
>  static bool ctrl_ps2_aux_port;
>  module_param(ctrl_ps2_aux_port, bool, 0444);
>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off =
toggle. If you need this please report this to: platform-driver-x86@vger.ke=
rnel.org");
> +		 "Enable driver based suppression of touchpad events on touchpad on/of=
f toggle. If you need this please report this to: platform-driver-x86@vger.=
kernel.org");
> =20
>  static bool touchpad_ctrl_via_ec;
>  module_param(touchpad_ctrl_via_ec, bool, 0444);
> @@ -1462,6 +1474,159 @@ static void ideapad_check_special_buttons(struct =
ideapad_private *priv)
>  	}
>  }
> =20
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
> +	struct ideapad_private *priv =3D
> +		container_of(handler, struct ideapad_private, tp_switch.handler);
> +	struct ideapad_tpswitch_handle *h;
> +	int error;
> +
> +	h =3D kzalloc_obj(*h);
> +	if (!h)
> +		return -ENOMEM;
> +
> +	h->priv =3D priv;
> +	h->handle.dev =3D dev;
> +	h->handle.handler =3D handler;
> +	h->handle.name =3D "ideapad-tpswitch";
> +
> +	error =3D input_register_handle(&h->handle);
> +	if (error)
> +		goto err_free_handle;
> +
> +	/*
> +	 * We need to open the input handle so the input core invokes our
> +	 * filter, but since we mark our handler as passive observer, this
> +	 * will not cause the underlying touchpad hardware to be started
> +	 * if there are no other users.
> +	 */
> +	error =3D input_open_device(&h->handle);
> +	if (error)
> +		goto err_unregister_handle;
> +
> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> +		priv->tp_switch.tp_dev =3D dev;
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
> +	struct ideapad_tpswitch_handle *h =3D to_tpswitch_handle(handle);
> +	struct ideapad_private *priv =3D h->priv;
> +
> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> +		priv->tp_switch.tp_dev =3D NULL;
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
> +	struct ideapad_tpswitch_handle *h =3D to_tpswitch_handle(handle);
> +	struct ideapad_private *priv =3D h->priv;
> +
> +	if (READ_ONCE(priv->tp_switch.active))
> +		return false;
> +
> +	/* Allow passing button release events, drop everything else */
> +	return !(type =3D=3D EV_KEY && value =3D=3D 0) &&
> +	       !(type =3D=3D EV_SYN && code =3D=3D SYN_REPORT);
> +}
> +
> +static const struct input_device_id ideapad_tpswitch_ids[] =3D {
> +	{
> +		.flags =3D INPUT_DEVICE_ID_MATCH_EVBIT |
> +				INPUT_DEVICE_ID_MATCH_KEYBIT |
> +				INPUT_DEVICE_ID_MATCH_ABSBIT,
> +		.bustype =3D BUS_I8042,
> +		.vendor =3D 0x0002,

Missing INPUT_DEVICE_ID_MATCH_BUS and INPUT_DEVICE_ID_MATCH_VENDOR?

Other than that and the module parameter's name, the patch looks good to
me. With them fixed:

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe> # not matching other touchpads

Thanks,
Rong

> +		.evbit =3D { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
> +		.keybit =3D { [BIT_WORD(BTN_TOOL_FINGER)] =3D
> +				BIT_MASK(BTN_TOOL_FINGER) },
> +		.absbit =3D { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
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
> +	priv->tp_switch.handler.name =3D "ideapad-tpswitch";
> +	priv->tp_switch.handler.id_table =3D ideapad_tpswitch_ids;
> +	priv->tp_switch.handler.filter =3D ideapad_tpswitch_filter;
> +	priv->tp_switch.handler.connect =3D ideapad_tpswitch_connect;
> +	priv->tp_switch.handler.disconnect =3D ideapad_tpswitch_disconnect;
> +	priv->tp_switch.handler.passive_observer =3D true;
> +
> +	error =3D input_register_handler(&priv->tp_switch.handler);
> +	if (error) {
> +		dev_err(&priv->platform_device->dev,
> +			"failed to register touchpad switch handler: %d",
> +			error);
> +		return error;
> +	}
> +
> +	priv->tp_switch.initialized =3D true;
> +	return 0;
> +}
> +
> +static void ideapad_tpswitch_exit(struct ideapad_private *priv)
> +{
> +	if (priv->tp_switch.initialized) {
> +		input_unregister_handler(&priv->tp_switch.handler);
> +		priv->tp_switch.initialized =3D false;
> +	}
> +}
> +
> +static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool o=
n)
> +{
> +	guard(spinlock_irq)(&priv->tp_switch.lock);
> +
> +	WRITE_ONCE(priv->tp_switch.active, on);
> +	if (!on) {
> +		struct input_dev *tp_dev =3D priv->tp_switch.tp_dev;
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
> @@ -1799,7 +1964,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad=
_private *priv)
>  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bo=
ol send_events)
>  {
>  	unsigned long value;
> -	unsigned char param;
>  	int ret;
> =20
>  	/* Without reading from EC touchpad LED doesn't switch state */
> @@ -1810,12 +1974,11 @@ static void ideapad_sync_touchpad_state(struct id=
eapad_private *priv, bool send_
> =20
>  	/*
>  	 * Some IdeaPads don't really turn off touchpad - they only
> -	 * switch the LED state. We (de)activate KBC AUX port to turn
> -	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> -	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> +	 * switch the LED state. On such devices we use an input filter to
> +	 * suppress events from the touchpad.
>  	 */
>  	if (priv->features.ctrl_ps2_aux_port)
> -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DIS=
ABLE);
> +		ideapad_tpswitch_toggle(priv, value);
> =20
>  	/*
>  	 * On older models the EC controls the touchpad and toggles it on/off
> @@ -2018,8 +2181,8 @@ static const struct dmi_system_id hw_rfkill_list[] =
=3D {
>  /*
>   * On some models the EC toggles the touchpad muted LED on touchpad togg=
le
>   * hotkey presses, but the EC does not actually disable the touchpad its=
elf.
> - * On these models the driver needs to explicitly enable/disable the i80=
42
> - * (PS/2) aux port.
> + * On these models the driver needs to explicitly suppress data coming f=
rom
> + * the touchpad.
>   */
>  static const struct dmi_system_id ctrl_ps2_aux_port_list[] =3D {
>  	{
> @@ -2402,6 +2565,10 @@ static int ideapad_acpi_add(struct platform_device=
 *pdev)
>  	if (err)
>  		goto input_failed;
> =20
> +	err =3D ideapad_tpswitch_init(priv);
> +	if (err)
> +		goto tpswitch_failed;
> +
>  	err =3D ideapad_kbd_bl_init(priv);
>  	if (err) {
>  		if (err !=3D -ENODEV)
> @@ -2478,6 +2645,9 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
> =20
>  	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
> +	ideapad_tpswitch_exit(priv);
> +
> +tpswitch_failed:
>  	ideapad_input_exit(priv);
> =20
>  input_failed:
> @@ -2507,6 +2677,7 @@ static void ideapad_acpi_remove(struct platform_dev=
ice *pdev)
> =20
>  	ideapad_fn_lock_led_exit(priv);
>  	ideapad_kbd_bl_exit(priv);
> +	ideapad_tpswitch_exit(priv);
>  	ideapad_input_exit(priv);
>  	ideapad_debugfs_exit(priv);
>  }
