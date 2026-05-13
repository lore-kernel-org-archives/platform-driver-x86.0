Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA337D136;
	Wed, 13 May 2026 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663783; cv=none; b=g5HjFuequZ9x4+Euk3loY6x0bZIysiek2TYb6e9+xyG+4bKQAo+SfTKCkRVLFdOJWodYdaZwyHM885EWFPoEQIq+5b7yUxyonRTjltpXx0S80JSE49AM67Ss6xBebycpGJYTFwwSiQDc2w0OSpXLVGSXWwi2rpTM2UJiYJfTWko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663783; c=relaxed/simple;
	bh=cNFafccPgAKx+07KvgiLuGMTA32ctU1l5exEJA5weAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoYc04z4nW3jB3tA7YWJ4/+10wReYson9ChcGgj7ZLt/qKmUK1ZQXvVWjqRXG9WUbO4HAE2ldAyVfXfciVNHaJOR1skjBqJO686E95KwUZXG0oXaJvb4qVWxQd3/3uilwOrbbcxsBYT5KjyaBqQQOvfmufflp42gcINRPsZIH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lUBlBWhK; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lUBlBWhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778663771; x=1779268571; i=w_armin@gmx.de;
	bh=Ar01bkHbHiswo9d8o75LQFjvvzCIyVl1eKB+s8NJ078=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lUBlBWhKq5DtS2sFay/0/kxTEMpoEZK8RN83HpOCLEbzeGlmtNEM0qsORP/CrgJV
	 DQvJUM13Dca2M+ZRgtWckTjlS/NIEXEbg3yVhn4xBsODCSg0f+HqPGwfNqj32WmRo
	 2fBCIA4F99wThEMa02ip1nV4UQ638MJisjdtp6xTWbBt0PmpmcOIZIVy6b7c5Lfj8
	 EeX/fI1MgmsUPZCwORFW+JN8fljGXX0YfORsm8TQOn7uMUskkO1TzG/1UUZS6MpJT
	 tbBd6GO6iE7uumCt32SF21etIdWACoa1tu8vVNuudqKA1b/HjmwaFaSYxsLIXyOJv
	 Gq02SXpWYv5Ppkf1gQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72sP-1wTRkS2bZX-0037pI; Wed, 13
 May 2026 11:16:11 +0200
Message-ID: <59c00319-cff0-4559-8cdc-3ab6ad1d208a@gmx.de>
Date: Wed, 13 May 2026 11:16:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd: Introduce Halo Box RGB LED driver
To: "Yo-Jung Leo Lin (AMD)" <leo.lin@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/eb4+o/pZ4J8E8C/RLeADZa1Jn+qXSwhepF8lPc6U88lIrm8B3R
 ZWHs4mXqCSJvTJlZqqttvfQSYSaR8iFBP6cRm6Lazsh1R7npED0c4/WlK0jd4qMKvr7r7ly
 LyovzafBuQj2qGu/ZtnEYQphcVvhOkI7Rrre0i4GWXDLZyqWuZWaTHkuk7rtfD1+Jtw8ljM
 S3SRjV4F8cFNTm8ljQxww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o2EmFM07Vxg=;BsYWYSefMtrxLnWGbDoSkV8cLwM
 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

Am 08.05.26 um 10:42 schrieb Yo-Jung Leo Lin (AMD):
> The Halo Box features an RGB LED light bar that can be controlled
> through WMI methods to display any color combination.
>=20
> The driver exposes the LED through the LED multicolor subsystem,
> allowing userspace to control RGB values via sysfs:
>    /sys/class/leds/amd_halo:multicolor:status/multi_intensity
>    /sys/class/leds/amd_halo:multicolor:status/brightness
>=20
> Hardware interface:
> - Three separate RGB channels (Red, Green, Blue)
> - Each channel controlled via individual WMI method calls
> - Value range: 0-100 (matching hardware range directly)
>=20
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
> v2 -> v3:
> - Re-introduce OF/OFF method: implement them with wmidev_invoke_method
> - Explicitly call the ON method on brightness_set callback for
>    brightness !=3D 0; call the OFF method when brightness =3D=3D 0
> - Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally
> - Replace get_unaligned_le64 with casting and le16_to_cpu()
> - Add an inline function (wmi_status_to_err) to convert WMI return
>    values to errno
> - Use amd_halo_wmi_set_channel in probe to set default color
> - Use devm_mutex_init() instead
> - Remove unused includes
> - Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-=
af027727605b@amd.com
>=20
> v1 -> v2:
> - Fix Kconfig dependencies
> - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=3D0 w=
ith the
>    same logic where brightness !=3D 0
> - Remove the brightness_get callback, because currently there isn't a
>    well-defined global bightness in hardware. Note that the sysfs bright=
ness
>    stil works. It just caches the value last set.
> - Convert to wmidev_invoke_method()
> - Convert to ARRAY_SIZE()
> - Convert some macros to enum
> - Convert to devm_led_classdev_multicolor_register_ext()
> - Rename sysfs path to amd_halo:multicolor:status
> - Fold default LED colors setting in probe, before registration
> - Add no_singleton option
> - Make default RGB values into macros and adjust their values
> ---
>   MAINTAINERS                             |   7 +
>   drivers/platform/x86/amd/Kconfig        |  11 ++
>   drivers/platform/x86/amd/Makefile       |   1 +
>   drivers/platform/x86/amd/amd_halo_led.c | 312 ++++++++++++++++++++++++=
++++++++
>   4 files changed, 331 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c871acf2179c..464bd4d16461 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1124,6 +1124,13 @@ F:	drivers/char/hw_random/geode-rng.c
>   F:	drivers/crypto/geode*
>   F:	drivers/video/fbdev/geode/
>  =20
> +AMD HALO BOX RGB LED DRIVER
> +M:	Mario Limonciello (AMD) <superm1@kernel.org>
> +R:	Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/amd/amd_halo_led.c
> +
>   AMD HSMP DRIVER
>   M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>   R:	Carlos Bilbao <carlos.bilbao@kernel.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig
> index b813f9265368..a1a74ef6c859 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -34,6 +34,17 @@ config AMD_WBRF
>   	  This mechanism will only be activated on platforms that advertise a
>   	  need for it.
>  =20
> +config AMD_HALO_LED
> +	tristate "AMD Halo Box RGB LED Driver"
> +	depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
> +	help
> +	  This driver provides RGB LED control for AMD Halo Box devices
> +	  through the LED multicolor subsystem. The Halo Box light bar can
> +	  be controlled via sysfs to display any RGB color combination.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called amd_halo_led.
> +
>   config AMD_ISP_PLATFORM
>   	tristate "AMD ISP4 platform driver"
>   	depends on I2C && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile
> index f6ff0c837f34..2f467dbbfc8a 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)		+=3D pmc/
>   obj-$(CONFIG_AMD_HSMP)		+=3D hsmp/
>   obj-$(CONFIG_AMD_PMF)		+=3D pmf/
>   obj-$(CONFIG_AMD_WBRF)		+=3D wbrf.o
> +obj-$(CONFIG_AMD_HALO_LED)	+=3D amd_halo_led.o
>   obj-$(CONFIG_AMD_ISP_PLATFORM)	+=3D amd_isp4.o
>   obj-$(CONFIG_AMD_HFI)		+=3D hfi/
> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/=
x86/amd/amd_halo_led.c
> new file mode 100644
> index 000000000000..632ccdf07ffe
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_halo_led.c
> @@ -0,0 +1,312 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Halo Box RGB LED Driver
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + * This driver provides RGB LED control for AMD Halo Box devices throug=
h
> + * the LED multicolor subsystem. The Halo Box light bar can be controll=
ed
> + * via sysfs to display any RGB color combination.
> + */
> +
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/wmi.h>
> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +enum {
> +	AMD_HALO_WMI_GET_LIGHTBAR =3D 0x01,
> +	AMD_HALO_WMI_SET_LIGHTBAR,
> +	AMD_HALO_WMI_TURN_ON,
> +	AMD_HALO_WMI_TURN_OFF
> +};
> +
> +/* Channel selectors for Arg0 */
> +enum {
> +	AMD_HALO_CHANNEL_RED =3D 0x01,
> +	AMD_HALO_CHANNEL_GREEN,
> +	AMD_HALO_CHANNEL_BLUE
> +};
> +
> +/* Status codes from spec */
> +#define AMD_HALO_STATUS_SUCCESS		0x0000
> +#define AMD_HALO_STATUS_INVALID_PARAM	0xFFFD
> +
> +/* Brightness uses 0-100 range */
> +#define AMD_HALO_MAX_HW_BRIGHTNESS	100
> +
> +/* Default RGB brightness */
> +#define AMD_HALO_DEFAULT_RED		50
> +#define AMD_HALO_DEFAULT_GREEN		30
> +#define AMD_HALO_DEFAULT_BLUE		30
> +
> +/**
> + * struct amd_halo_led_data - Driver private data
> + * @wdev: WMI device pointer
> + * @led_mc: LED multicolor class device
> + * @subled_info: RGB channel information
> + * @lock: Mutex to protect WMI calls
> + */
> +struct amd_halo_led_data {
> +	struct wmi_device *wdev;
> +	struct led_classdev_mc led_mc;
> +	struct mc_subled subled_info[3];
> +	struct mutex lock;	/* Protects WMI method calls */
> +};
> +
> +struct amd_halo_wmi_args {
> +	u32 arg0;
> +	u32 arg1;

Hi,

those two arguments are little-endian integers, so please use
__le32 instead of u32. This will also require you to use le32_to_cpu()
and cpu_to_le32() when populating and accesssing this struct.

> +};
> +
> +static inline int wmi_status_to_err(u16 status)
> +{
> +	switch (status) {
> +	case AMD_HALO_STATUS_SUCCESS:
> +		return 0;
> +	case AMD_HALO_STATUS_INVALID_PARAM:
> +		return -EINVAL;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static int __amd_halo_wmi_call(struct wmi_device *wdev,
> +			       u32 method_id,
> +			       u32 arg0,
> +			       u32 arg1)
> +{
> +	struct amd_halo_wmi_args args =3D {
> +		.arg0 =3D arg0,
> +		.arg1 =3D arg1,
> +	};

Use cpu_to_le32() to ensure that the firmware receives little-endian=20
integers.

> +	struct wmi_buffer input =3D {
> +		.length =3D sizeof(args),
> +		.data =3D &args,
> +	};
> +	struct wmi_buffer output =3D { 0 };
> +	u16 result_status;
> +	int ret;
> +
> +	ret =3D wmidev_invoke_method(wdev, 0, method_id,
> +				   &input, &output, sizeof(result_status));
> +	if (ret)
> +		return ret;
> +
> +	/* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) */
> +	result_status =3D le16_to_cpu(*(__le16 *)output.data);
> +	ret =3D wmi_status_to_err(result_status);
> +
> +	kfree(output.data);

You could use "__le16 *result_status __free(kfree) =3D output.data" here=
=20
to avoid having to call kfree() manually. You can also move this=20
declaration to the top for the sizeof() expression, as long as you=20
initialize it with NULL.

> +	return ret;
> +}
> +
> +/**
> + * amd_halo_wmi_turn_on - Turn on all LED channels
> + * @wdev: WMI device pointer
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_turn_on(struct wmi_device *wdev)
> +{
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_ON, 0, 0);
> +}
> +
> +/**
> + * amd_halo_wmi_turn_off - Turn off all LED channels
> + * @wdev: WMI device pointer
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
> +{
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, 0, 0);
> +}
> +
> +/**
> + * amd_halo_wmi_set_channel - Set a single RGB channel value
> + * @wdev: WMI device pointer
> + * @channel: Channel selector (1=3DRed, 2=3DGreen, 3=3DBlue)
> + * @brightness: brightness to set (0-100)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_set_channel(struct wmi_device *wdev, u32 channe=
l,
> +				    u32 brightness)
> +{
> +	if (channel < AMD_HALO_CHANNEL_RED ||
> +	    channel > AMD_HALO_CHANNEL_BLUE ||
> +	    brightness > AMD_HALO_MAX_HW_BRIGHTNESS)
> +		return -EINVAL;
> +
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_SET_LIGHTBAR,
> +				   channel, brightness);
> +}
> +
> +/**
> + * amd_halo_brightness_set - Set LED brightness and color
> + * @cdev: LED class device
> + * @brightness: Brightness value
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_brightness_set(struct led_classdev *cdev,
> +				   enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +	struct amd_halo_led_data *data =3D container_of(mc_cdev,
> +						       struct amd_halo_led_data,
> +						       led_mc);
> +	u32 red_hw, green_hw, blue_hw;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	if (brightness =3D=3D 0)
> +		return amd_halo_wmi_turn_off(data->wdev);

When turning on this LED after turning it off, the RGB color might be=20
wrong for a short amount of time. I suggest that you still update the=20
RGB color even when the brightness is 0.

> +
> +	red_hw =3D mc_cdev->subled_info[0].brightness;
> +	green_hw =3D mc_cdev->subled_info[1].brightness;
> +	blue_hw =3D mc_cdev->subled_info[2].brightness;
> +
> +	ret =3D amd_halo_wmi_turn_on(data->wdev);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_RED,
> +				       red_hw);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
> +				       green_hw);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
> +				       blue_hw);
> +	if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	/*
> +	 * Consider the light bar non-functional if TURN_ON or SET_LIGHTBAR fa=
iled.
> +	 * Attempt to turn the LED off completely as clean-up.
> +	 */
> +	if (amd_halo_wmi_turn_off(data->wdev))
> +		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cle=
anup\n");
> +
> +	return ret;
> +}
> +
> +/**
> + * amd_halo_probe - Driver probe function
> + * @wdev: WMI device
> + * @context: Context data (unused)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct led_init_data led_init_data =3D {
> +		.devicename =3D "amd_halo",
> +		.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
> +		.devname_mandatory =3D true
> +	};
> +	struct amd_halo_led_data *data;
> +	int ret;
> +
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret =3D devm_mutex_init(&wdev->dev, &data->lock);
> +	if (ret)
> +		return ret;
> +
> +	data->wdev =3D wdev;
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	data->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> +	data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> +	data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> +	data->subled_info[0].intensity =3D AMD_HALO_DEFAULT_RED;
> +	data->subled_info[1].intensity =3D AMD_HALO_DEFAULT_GREEN;
> +	data->subled_info[2].intensity =3D AMD_HALO_DEFAULT_BLUE;
> +
> +	data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.max_brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.brightness_set_blocking =3D amd_halo_brightness_=
set;
> +	data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_AT=
_SHUTDOWN;
> +	data->led_mc.num_colors =3D ARRAY_SIZE(data->subled_info);
> +	data->led_mc.subled_info =3D data->subled_info;
> +
> +	ret =3D amd_halo_wmi_turn_on(wdev);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_RED,
> +				       AMD_HALO_DEFAULT_RED);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_GREEN,
> +				       AMD_HALO_DEFAULT_GREEN);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_BLUE,
> +				       AMD_HALO_DEFAULT_BLUE);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->l=
ed_mc,
> +							&led_init_data);
> +	if (ret)
> +		return dev_err_probe(&wdev->dev, ret,
> +				     "Failed to register multicolor LED\n");
> +	return 0;
> +
> +out:
> +	/*
> +	 * Attempt to turn LED off as a cleanup if either TURN_ON or SET_LIGHT=
BAR
> +	 * fails. For probe failure due to non-WMI errors, keep the LED in the
> +	 * default color.
> +	 */
> +	dev_warn(&data->wdev->dev, "Light bar non-functional, turning it off\n=
");
> +
> +	if (amd_halo_wmi_turn_off(data->wdev))
> +		dev_warn(&data->wdev->dev, "Failed to turn LED off on cleanup\n");

I do not think that this cleanup is necessary during probe, please=20
remove it and just return an error instead.

Otherwise the driver seems good to me.

Thanks,
Armin Wolf

> +
> +	return dev_err_probe(&wdev->dev, ret, "WMI call failed during probe!\n=
");
> +}
> +
> +static const struct wmi_device_id amd_halo_id_table[] =3D {
> +	{ .guid_string =3D AMD_HALO_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
> +
> +static struct wmi_driver amd_halo_driver =3D {
> +	.driver =3D {
> +		.name =3D "amd_halo_led",
> +	},
> +	.id_table =3D amd_halo_id_table,
> +	.probe =3D amd_halo_probe,
> +	.no_singleton =3D true,
> +};
> +
> +module_wmi_driver(amd_halo_driver);
> +
> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
> +MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");
> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
> +MODULE_LICENSE("GPL");
>=20
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260429-halo-leds-v2-plus-722c8083afe8
>=20
> Best regards,

