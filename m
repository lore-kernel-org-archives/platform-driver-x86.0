Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2025A359;
	Fri, 22 May 2026 21:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486170; cv=none; b=XhZs13eAPLmbArn0Axn9IpNfFfVJKM8XZdZIoSfJWiWCLemi9VTiT6hF7WmjjtqVnZ+vIy2A0HyG+bjUyXNs1cnW5O7GSeTl85MR5xghwZmhnfgezDueRNhxN/6Y2Y6DklyYqTnIDIaHMqEPn8qYph4vq13xAL9cOllMN7oAwDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486170; c=relaxed/simple;
	bh=qpglt7L4zyC89SxHILNsZ/oq+OlDmmN6olnhUlG2C1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8cYW0SG2HH52JaZMTVH2dsDSpkG66RP6ZaKb9BqzgUGCHV9tXIGTjna4ijmArueqKL5N9Iavbaym3ckJ/SoVGeJP3+1BxAN4G+b5ClmqTuTBF5ZOWRNarrSTpL1ruZsLBmkaonm3s2U9DzyLCCiTLecTKWYKF/lfR+6ri5UVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TKJygOwo; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TKJygOwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779486161; x=1780090961; i=w_armin@gmx.de;
	bh=hYHBRQ39mK4LPJ3utccWFeKkDCVMvjjSNKZf/c7tB90=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TKJygOwoynIUJXEHZ1zqdsmBS9urNZtY4qBdTwLkBXbr7cMTHZWDLJnhFHdQZnn3
	 L9prVig+9VbeNpOEsZDj9q+xXCOJKrFb4MuU/ga0MaRDzehzWlYyBMOJTevRAHCFq
	 hDCEY927MYawzIXtfUn/RRjjXZ6yYOzfLgewj186P6SSbOlsr+xYlM+qeL497woO6
	 0mTI3wO+hP233VRipGdgXyBwXNI3DUP+W7OEAkPH/xU8uBahIeikqa9pTLQ9S4CSJ
	 FmCJkYlBQN+8ROn1/vD7P8LY2TxVXlJQcUXi+QKYetgf2htHGXt5mCpaqyGZ7VOyr
	 RKt3kSv0wMHppe0UXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1wtvGk2pB5-00VWr4; Fri, 22
 May 2026 23:42:41 +0200
Message-ID: <6f29aa5b-a1b0-41d7-aee7-ac13b2fe23d4@gmx.de>
Date: Fri, 22 May 2026 23:42:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86/amd: Introduce Halo Box RGB LED driver
To: "Yo-Jung Leo Lin (AMD)" <leo.lin@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260521-halo-leds-v2-plus-v4-1-b498bbab36a2@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260521-halo-leds-v2-plus-v4-1-b498bbab36a2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UebGZsPSe+jd+4+P8NQ91e2FpJOO7Vd7dgTDp/LEA56xer61p+6
 LFnept0TQ3CldwD0uDE/uC788ISt0Si587VcRYqvVZmnR7xNdUvd7hsrI2RZVbkBMUcl2pC
 mAkBGfN7pZQ3+RKYIgPU97HazaIenBRwgXuNG8Chu9Hjl+hcxAVwqUdGClQniIBLmIRKFhr
 bn5uIxptPSKPbISpGy38g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8GuLCspVQ3U=;FUv9alMya6Y/K2r1OkRvKaZZU0K
 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
 5kS4n4HyLy4+eNmBUY=

Am 21.05.26 um 11:45 schrieb Yo-Jung Leo Lin (AMD):

> The Halo Box features an RGB LED light bar that can be controlled
> through WMI methods to display any color combination.
>
> The driver exposes the LED through the LED multicolor subsystem,
> allowing userspace to control RGB values via sysfs:
>    /sys/class/leds/amd_halo:multicolor:status/multi_intensity
>    /sys/class/leds/amd_halo:multicolor:status/brightness
>
> Hardware interface:
> - Three separate RGB channels (Red, Green, Blue)
> - All 3 channels are configured at once with a single WMI method call
> - Value range: 0-100 (matching hardware range directly)
>
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

Hi,

something is wrong with this email, did you meant to write leo.lin@amd.com=
?

> ---
> v3 -> v4
> There's a new WMI method we introduced in BIOS for color setting, to
> replace the original ones, so in this version:
> - Introduce a new "AMD_HALO_WMI_RGB" method ID. This WMI method takes 1
>    command argument (GET/SET) and 3 RGB values. This method is capable o=
f
>    turning on and setting all RGB channels at once in a single call, red=
ucing
>    some undesirable visual effects when setting them separately.
> - Replace color setting code with this new "AMD_HALO_WMI_RGB" method.
> - Remove implementations of unused WMI methods.
>
> This version also fixes things pointed out in the previous version:
> - Explicltly specify the endianess of WMI arguments as __le32, and use
>    endian-conversion helpers accordingly.
> - Use scope-based cleanup helper for WMI buffer.
> - Remove cleanup for channel setting WMI in probe.
> - Explicitly include headers for kfree and le16_to_cpu
> - Fix white spaces
> - Fix designated initializor style
> - Link to v3: https://lore.kernel.org/r/20260508-halo-leds-v2-plus-v3-1-=
91df458966ea@amd.com
>
> (Didn't pull Shyam's Reviewed-by because this is a relatively bigger cha=
nge.)
>
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
>
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
>   drivers/platform/x86/amd/amd_halo_led.c | 267 ++++++++++++++++++++++++=
++++++++
>   4 files changed, 286 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8063cb56feef..cde3865addb4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1138,6 +1138,13 @@ F:	drivers/char/hw_random/geode-rng.c
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
> index 000000000000..f9ee6368f8ea
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_halo_led.c
> @@ -0,0 +1,267 @@
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
> +#include <linux/byteorder/generic.h>
> +#include <linux/slab.h>
> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +enum {
> +	AMD_HALO_WMI_TURN_OFF =3D 0x04,
> +	AMD_HALO_WMI_RGB =3D 0x07
> +};
> +
> +/* Arg0 of the AMD_HALO_WMI_RGB Method */
> +enum {
> +	AMD_HALO_RGB_CMD_GET,
> +	AMD_HALO_RGB_CMD_SET
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
> +	__le32 arg0;
> +	__le32 arg1;
> +};
> +
> +struct amd_halo_wmi_args_rgb {
> +	__le32 cmd;
> +	__le32 red;
> +	__le32 green;
> +	__le32 blue;
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
> +			       u32 method_id, void *data, size_t length)
> +{
> +	struct wmi_buffer input =3D {
> +		.length =3D length,
> +		.data =3D data,
> +	};
> +	__le16 *result_status __free(kfree) =3D NULL;
> +	struct wmi_buffer output =3D {};
> +	int ret;
> +
> +	ret =3D wmidev_invoke_method(wdev, 0, method_id,
> +				   &input, &output, sizeof(*result_status));
> +	if (ret)
> +		return ret;
> +
> +	/* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) */
> +	result_status =3D output.data;
> +	ret =3D wmi_status_to_err(le16_to_cpu(*result_status));
> +
> +	return ret;
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
> +	struct amd_halo_wmi_args args =3D { };
> +
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, sizeof(=
args));
> +}
> +
> +/**
> + * amd_halo_wmi_set_rgb - Set all RGB channels atomically
> + * @wdev: WMI device pointer
> + * @r: brightness for red channel (0 - 100)
> + * @g: brightness for green channel (0 - 100)
> + * @b: brightness for blue channel (0 - 100)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, =
u32 b)
> +{
> +	if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +	    g > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +	    b > AMD_HALO_MAX_HW_BRIGHTNESS) {
> +		return -EINVAL;
> +	}
> +
> +	struct amd_halo_wmi_args_rgb args =3D {
> +		.cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_SET),
> +		.red =3D cpu_to_le32(r),
> +		.green =3D cpu_to_le32(g),
> +		.blue =3D cpu_to_le32(b)
> +	};
> +
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(args)=
);
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
> +						      struct amd_halo_led_data,
> +						      led_mc);
> +	u32 red_hw, green_hw, blue_hw;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	if (brightness =3D=3D 0)
> +		return amd_halo_wmi_turn_off(data->wdev);
> +
> +	red_hw =3D mc_cdev->subled_info[0].brightness;
> +	green_hw =3D mc_cdev->subled_info[1].brightness;
> +	blue_hw =3D mc_cdev->subled_info[2].brightness;
> +
> +	ret =3D amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_hw);
> +	if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	/*
> +	 * Consider the light bar non-functional if AMD_HALO_WMI_RGB failed.
> +	 * Attempt to turn the LED off completely as clean-up.
> +	 */
> +	if (amd_halo_wmi_turn_off(data->wdev))
> +		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cle=
anup\n");

With the new WMI method the fallback is IMHO not necessary anymore, but i =
leave this up
to you.

Other than that:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
> +		.devname_mandatory =3D true,
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
> +	ret =3D amd_halo_wmi_set_rgb(wdev, AMD_HALO_DEFAULT_RED, AMD_HALO_DEFA=
ULT_GREEN,
> +				   AMD_HALO_DEFAULT_BLUE);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->l=
ed_mc,
> +							&led_init_data);
> +	if (ret)
> +		return dev_err_probe(&wdev->dev, ret,
> +				     "Failed to register multicolor LED\n");
> +	return 0;
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
>
> ---
> base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
> change-id: 20260429-halo-leds-v2-plus-722c8083afe8
>
> Best regards,
