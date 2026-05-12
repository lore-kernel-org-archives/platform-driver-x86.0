Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0E5386554
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622020; cv=none; b=uYC2kmohpXyIv5icK+OifrO1RI3ljfycVX5hZJ8bg7rzaRoW5762lKbZvX7ka/1ldWKYbgtlkpYIaF00irER6r4C8CzLMl/K8n6Kgx2YH0tmhYN1d5qVF/2yXW5KmJxNU0/LEK0FvOEp62cV88EXeTbGSBPqrzbpaYQ+pgcLNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622020; c=relaxed/simple;
	bh=y4zaeJBC4Z8+bDjRf/EGEQwfTUadO4FlefsmZv/agIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzMV13Ueoj9A+i/nYVqy8uwGBKyDkVBo8ohnRUY2XhiAFBQbwKIzKdqLnHR+f0DKGgiiUTZDWsE+mYyrN6FyfW/01GPJDZBVNlAfuhw5AmtVSzKeA82orWjk7ZHXM/rEIVYKPu/nSLJe5Iq6BoL3xdn0+0WGELZDFjF8NqLA0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AhpvMwaJ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AhpvMwaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778622002; x=1779226802; i=w_armin@gmx.de;
	bh=HmnAVRFvW05ioPWaIesLxLQHua0TwSJe7Hz6jLlocaE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AhpvMwaJoG+kEyJHqy+qNhuyQadWfZn4gn2HMlB0mlTbHlLkqb88uPfDJBDO1bcc
	 KZ1l08H65jjlhkZBrXjPMrqk9JdJvJSlIDKIpMISE/i7M4K/Y4ZwamWRpunDqOfsf
	 L+lFdWwLBRjhDgq9exEMNGUqNCi9+6LOwcQBwyzRb76S8HWHzlxhXf7Ai/62zlpwt
	 8R30NrRBK0NmIsGZFJgFNJhA8Mbpkk2JbzdYF9ZnzSessKce8s8WO+IlFYBhqwyH5
	 Aq8PafBy/wd4rpolDRDlQDwOy8Ne5knPZRrZGPphsOrJ9otL+nDRUlBrMczosTq/R
	 SjnqQS59kdP8AMbKXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNNy-1wrFPU0jys-00LAab; Tue, 12
 May 2026 23:40:02 +0200
Message-ID: <5c015684-c5b0-4fa3-bcac-324e5076ec6b@gmx.de>
Date: Tue, 12 May 2026 23:40:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: tuxedo-laptop: Add MECHREVO WUJIE Series
 keyboard backlight
To: Donjuanplatinum <donplat@barrensea.org>,
 platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
References: <20260512010500.10093-1-donplat@barrensea.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260512010500.10093-1-donplat@barrensea.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Lh6zrbYVhin/U8rL2WsmRt+u5k2lpARelBe0W089ZU05XyOYszM
 xxYHWR0Ty5hNO/cqNT/87aCGTHvi+5gq/NQXWEa3GGkKZbd5QSR1xTxdv+73cicCLrqIQnv
 XjHwRxjsEts1Vri18fV0QtFkFYc33ajtcEFdj3egZm6kHMODly3++uQdOx8hwm1KialoRQl
 YWo3EfZoUJmSB5mTn2lYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bmXHrqEkyFM=;NCprH5sjCuUDGZx+1AgOhWj2uqF
 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

Am 12.05.26 um 03:05 schrieb Donjuanplatinum:

> Add support for the RGB keyboard backlight found on the MECHREVO WUJIE
> Series laptop (WUJIE Series-X5SP4NAG), which uses the same
> Clevo/Tongfang EC platform as supported TUXEDO devices.
>
> The keyboard backlight is controlled from three EC registers for the RGB
> color channels (EC_ADDR_RGB_{RED,GREEN,BLUE}) and EC_ADDR_KBD_STATUS
> for the global brightness level. The EC firmware encodes the brightness
> in KBD_BRIGHTNESS (bits [7:5] of EC_ADDR_KBD_STATUS) as a 3-bit field,
> but only responds correctly to levels 0-4; writing values 5-7 causes the
> EC to immediately reset the backlight to level 0. This behaviour was
> identified by observing that the Windows driver (MECHREVO Center2)
> stores only values in the range [0, 4] for both AC and DC brightness, an=
d
> confirmed on hardware by testing that brightness recovers after the writ=
e
> sequence is corrected. KBD_MAX_BRIGHTNESS_LEVEL enforces this limit and
> documents the reason, so future contributors do not reintroduce the bug.
>
> The backlight is exposed as a multicolor LED class device with the
> "kbd_backlight" function. Feature detection is performed at probe time
> by reading the RGB_KEYBOARD capability bit from EC_ADDR_SUPPORT_2, so
> the keyboard LED is only registered when the EC reports it as present.

Hi,

thank your for this patch, i already have a very similar one in my waiting=
 queue:

https://github.com/Wer-Wolf/uniwill-laptop/tree/infinitybook_gen10

I am currently waiting for the LED subsystem to pick up a patch necessary =
for proper
RGB backlight support, so it might still take some time. You can test if t=
he patch inside
the waiting queue also works on your device. If yes then i can whitelist y=
our machine.

Thanks,
Armin Wolf

> Signed-off-by: Donjuanplatinum <donplat@barrensea.org>
> ---
> Changes in v2:
> - Fix double spacing in commit message
> - Add #include <linux/math.h> for DIV_ROUND_CLOSEST()
>
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 154 ++++++++++++++++++++
>   1 file changed, 154 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 945df5092..d0074aa22 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -34,6 +34,7 @@
>   #include <linux/led-class-multicolor.h>
>   #include <linux/limits.h>
>   #include <linux/list.h>
> +#include <linux/math.h>
>   #include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> @@ -230,6 +231,17 @@
>   #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
>   #define KBD_APPLY			BIT(4)
>   #define KBD_BRIGHTNESS			GENMASK(7, 5)
> +/*
> + * The EC brightness field (KBD_BRIGHTNESS, bits [7:5] of EC_ADDR_KBD_S=
TATUS)
> + * is a 3-bit value but the EC firmware only responds correctly to leve=
ls 0-4.
> + * Writing values 5-7 causes the EC to reset the backlight to level 0.
> + *
> + * This limit has only been verified on the MECHREVO WUJIE Series. If o=
ther
> + * devices with RGB keyboard support (UNIWILL_FEATURE_KBD_BACKLIGHT) ar=
e added
> + * in the future and have a different valid range, this constant should=
 be moved
> + * into struct uniwill_device_descriptor as a per-device field.
> + */
> +#define KBD_MAX_BRIGHTNESS_LEVEL	4
>  =20
>   #define EC_ADDR_FAN_CTRL		0x078E
>   #define FAN3P5				BIT(1)
> @@ -327,6 +339,7 @@
>   #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
>   #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
> +#define UNIWILL_FEATURE_KBD_BACKLIGHT		BIT(11)
>  =20
>   enum usb_c_power_priority_options {
>   	USB_C_POWER_PRIORITY_CHARGING =3D 0,
> @@ -348,6 +361,9 @@ struct uniwill_data {
>   	struct mutex led_lock;		/* Protects writes to the lightbar registers =
*/
>   	struct led_classdev_mc led_mc_cdev;
>   	struct mc_subled led_mc_subled_info[LED_CHANNELS];
> +	struct mutex kbd_led_lock;	/* Protects writes to keyboard LED register=
s */
> +	struct led_classdev_mc kbd_led_mc_cdev;
> +	struct mc_subled kbd_led_mc_subled_info[LED_CHANNELS];
>   	struct mutex input_lock;	/* Protects input sequence during notify */
>   	struct input_dev *input_device;
>   	struct notifier_block nb;
> @@ -538,6 +554,10 @@ static bool uniwill_writeable_reg(struct device *de=
v, unsigned int reg)
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   	case EC_ADDR_USB_C_POWER_PRIORITY:
> +	case EC_ADDR_RGB_RED:
> +	case EC_ADDR_RGB_GREEN:
> +	case EC_ADDR_RGB_BLUE:
> +	case EC_ADDR_KBD_STATUS:
>   		return true;
>   	default:
>   		return false;
> @@ -577,6 +597,11 @@ static bool uniwill_readable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   	case EC_ADDR_USB_C_POWER_PRIORITY:
> +	case EC_ADDR_SUPPORT_2:
> +	case EC_ADDR_RGB_RED:
> +	case EC_ADDR_RGB_GREEN:
> +	case EC_ADDR_RGB_BLUE:
> +	case EC_ADDR_KBD_STATUS:
>   		return true;
>   	default:
>   		return false;
> @@ -1223,6 +1248,119 @@ static int uniwill_hwmon_init(struct uniwill_dat=
a *data)
>   	return PTR_ERR_OR_ZERO(hdev);
>   }
>  =20
> +static const unsigned int uniwill_kbd_led_channel_to_reg[LED_CHANNELS] =
=3D {
> +	EC_ADDR_RGB_RED,
> +	EC_ADDR_RGB_GREEN,
> +	EC_ADDR_RGB_BLUE,
> +};
> +
> +static int uniwill_kbd_led_brightness_set(struct led_classdev *led_cdev=
,
> +					 enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
> +	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwill=
_data, kbd_led_mc_cdev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&data->kbd_led_lock);
> +
> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
> +		value =3D min(LED_MAX_BRIGHTNESS, data->kbd_led_mc_subled_info[i].bri=
ghtness);
> +		ret =3D regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i],=
 value);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	value =3D FIELD_PREP(KBD_BRIGHTNESS,
> +			   DIV_ROUND_CLOSEST(brightness * KBD_MAX_BRIGHTNESS_LEVEL,
> +					     LED_MAX_BRIGHTNESS)) | KBD_APPLY;
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_KBD_STATUS,
> +				 KBD_BRIGHTNESS | KBD_APPLY, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLO=
R, RGB_APPLY_COLOR);
> +}
> +
> +static int uniwill_kbd_led_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!(value & RGB_KEYBOARD))
> +		return 0;
> +
> +	data->features |=3D UNIWILL_FEATURE_KBD_BACKLIGHT;
> +
> +	return 0;
> +}
> +
> +static int uniwill_kbd_led_init(struct uniwill_data *data)
> +{
> +	struct led_init_data init_data =3D {
> +		.devicename =3D DRIVER_NAME,
> +		.default_label =3D "multicolor:" LED_FUNCTION_KBD_BACKLIGHT,
> +		.devname_mandatory =3D true,
> +	};
> +	const unsigned int color_indices[3] =3D {
> +		LED_COLOR_ID_RED,
> +		LED_COLOR_ID_GREEN,
> +		LED_COLOR_ID_BLUE,
> +	};
> +	unsigned int value;
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KBD_BACKLIGHT))
> +		return 0;
> +
> +	ret =3D devm_mutex_init(data->dev, &data->kbd_led_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->kbd_led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
> +	data->kbd_led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
> +	data->kbd_led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
> +	data->kbd_led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_kbd=
_led_brightness_set;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->kbd_led_mc_cdev.led_cdev.brightness =3D
> +		DIV_ROUND_CLOSEST(FIELD_GET(KBD_BRIGHTNESS, value) * LED_MAX_BRIGHTNE=
SS,
> +				  KBD_MAX_BRIGHTNESS_LEVEL);
> +
> +	for (int i =3D 0; i < LED_CHANNELS; i++) {
> +		data->kbd_led_mc_subled_info[i].color_index =3D color_indices[i];
> +
> +		ret =3D regmap_read(data->regmap, uniwill_kbd_led_channel_to_reg[i], =
&value);
> +		if (ret < 0)
> +			return ret;
> +
> +		value =3D min(LED_MAX_BRIGHTNESS, value);
> +		ret =3D regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i],=
 value);
> +		if (ret < 0)
> +			return ret;
> +
> +		data->kbd_led_mc_subled_info[i].intensity =3D value;
> +		data->kbd_led_mc_subled_info[i].channel =3D i;
> +	}
> +
> +	data->kbd_led_mc_cdev.subled_info =3D data->kbd_led_mc_subled_info;
> +	data->kbd_led_mc_cdev.num_colors =3D LED_CHANNELS;
> +
> +	return devm_led_classdev_multicolor_register_ext(data->dev, &data->kbd=
_led_mc_cdev,
> +							 &init_data);
> +}
> +
>   static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS]=
 =3D {
>   	EC_ADDR_LIGHTBAR_BAT_RED,
>   	EC_ADDR_LIGHTBAR_BAT_GREEN,
> @@ -1654,6 +1792,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   			return ret;
>   	}
>  =20
> +	ret =3D uniwill_kbd_led_probe(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret =3D uniwill_battery_init(data);
>   	if (ret < 0)
>   		return ret;
> @@ -1662,6 +1804,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D uniwill_kbd_led_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret =3D uniwill_hwmon_init(data);
>   	if (ret < 0)
>   		return ret;
> @@ -2193,6 +2339,14 @@ static const struct dmi_system_id uniwill_dmi_tab=
le[] __initconst =3D {
>   		},
>   		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
> +	{
> +		.ident =3D "MECHREVO WUJIE Series",
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
> +		},
> +		.driver_data =3D &tux_featureset_3_descriptor,
> +	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
>   		.matches =3D {
