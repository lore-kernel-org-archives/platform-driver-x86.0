Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C33EDADB;
	Thu, 28 May 2026 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971384; cv=none; b=QcniALnsWIY13/C9V6vLJIE9obFaDXqPHQy7HsMv1HCWCDa9VaYO45gNvH10k8RlIqoQyab4559z8fhf4T9WcLyZ3IWSzwAm1IBtb8ZJE0gXy8v/tS2L8nIkPf9eEQvNXXQLfh+81hpuQCHms/xnn+tYSCf3ZlqykbP5N+Q/X/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971384; c=relaxed/simple;
	bh=fxf2cgq2PsGocI/zR49LK5z6PKUKrsIsb/kTGVXoiqs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZzFY81tGMmg+Rp5qkPfRfGnzbVaVXKu2ok2TxrAYBFC86HMsLqNXJN4ECFNfRfuz+TIFEU2HT3D3FOqph7phKZSipJUIDBpFuiQ+jcjPAV6utQtLWdS3vEUQQ3HgeYTVefXxh9sEWyDm/BLFvoE9jvKzes993iH8mr1+Ip+ZNDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqttBmwV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqttBmwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779971381; x=1811507381;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fxf2cgq2PsGocI/zR49LK5z6PKUKrsIsb/kTGVXoiqs=;
  b=NqttBmwVwiyHRKz1O775Ku10p4uvoVVgS3QlI1TwF0QCYhUl0xIZYRoG
   GPmdum970nWcCixttwaPcv0HbTinQzp2iUAH6ZTmPXjCBEZpnWrRaKq7E
   /5uWge5bs6vwlPFFYa39EJneGuw3lUvZ9Sd5BFE9oQhzsPAslgONcCzWM
   MJgUi5dbjQarXuxSKJ50S4/g4mlThv1ysRZQ0a/nwzcfwR04JFK7TQS/D
   8cuWxNNZdI4CxbFZRD2wcGzpMOjjxRmGf7aPJlZLR1MZbGNSd2U8UpxMQ
   E9weginlNM1wshbE6PXjerDruDLkvdYWI/0hv/bSXr5B/8wLWEI5aoJF8
   A==;
X-CSE-ConnectionGUID: D4MsKresS2OUxaNXhapNSQ==
X-CSE-MsgGUID: zaVeusFaSxiUj8AJg98DQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84700423"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84700423"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:29:40 -0700
X-CSE-ConnectionGUID: tV2h0scuRFCP1C8NLX7KAw==
X-CSE-MsgGUID: NzmW9OKMTTaROCfYZyg0xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239526271"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:29:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 15:29:33 +0300 (EEST)
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "Mario Limonciello (AMD)" <superm1@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v5] platform/x86/amd: Introduce Halo Box RGB LED driver
In-Reply-To: <20260523-halo-leds-v2-plus-v5-1-497dc9719a18@amd.com>
Message-ID: <a1ed18f9-a658-4cc6-6c4c-46eb16d1c5ad@linux.intel.com>
References: <20260523-halo-leds-v2-plus-v5-1-497dc9719a18@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 23 May 2026, Yo-Jung Leo Lin (AMD) wrote:

> The Halo Box features an RGB LED light bar that can be controlled
> through WMI methods to display any color combination.
> 
> The driver exposes the LED through the LED multicolor subsystem,
> allowing userspace to control RGB values via sysfs:
>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity
>   /sys/class/leds/amd_halo:multicolor:status/brightness
> 
> Hardware interface:
> - Three separate RGB channels (Red, Green, Blue)
> - All 3 channels are configured at once with a single WMI method call
> - Value range: 0-100 (matching hardware range directly)
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

This seems mostly okay, there are a few minor things still to address 
marked below.

> ---
> v4 -> v5
> No code chang. Only email etiquette fixes
> - Fix the "From: " in the mail from leo.lin@amd.com to Leo.Lin@amd.com,
>   so that it matches s-o-b
> - Pull the Reviewed-by trailer from previous threads.
> - Link to v4: https://lore.kernel.org/r/20260521-halo-leds-v2-plus-v4-1-b498bbab36a2@amd.com
> 
> v3 -> v4
> There's a new WMI method we introduced in BIOS for color setting, to
> replace the original ones, so in this version:
> - Introduce a new "AMD_HALO_WMI_RGB" method ID. This WMI method takes 1
>   command argument (GET/SET) and 3 RGB values. This method is capable of
>   turning on and setting all RGB channels at once in a single call, reducing
>   some undesirable visual effects when setting them separately.
> - Replace color setting code with this new "AMD_HALO_WMI_RGB" method.
> - Remove implementations of unused WMI methods.
> 
> This version also fixes things pointed out in the previous version:
> - Explicltly specify the endianess of WMI arguments as __le32, and use
>   endian-conversion helpers accordingly.
> - Use scope-based cleanup helper for WMI buffer.
> - Remove cleanup for channel setting WMI in probe.
> - Explicitly include headers for kfree and le16_to_cpu
> - Fix white spaces
> - Fix designated initializor style
> - Link to v3: https://lore.kernel.org/r/20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com
> 
> (Didn't pull Shyam's Reviewed-by because this is a relatively bigger change.)
> 
> v2 -> v3:
> - Re-introduce OF/OFF method: implement them with wmidev_invoke_method
> - Explicitly call the ON method on brightness_set callback for
>   brightness != 0; call the OFF method when brightness == 0
> - Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally
> - Replace get_unaligned_le64 with casting and le16_to_cpu()
> - Add an inline function (wmi_status_to_err) to convert WMI return
>   values to errno
> - Use amd_halo_wmi_set_channel in probe to set default color
> - Use devm_mutex_init() instead
> - Remove unused includes
> - Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com
> 
> v1 -> v2:
> - Fix Kconfig dependencies
> - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=0 with the
>   same logic where brightness != 0
> - Remove the brightness_get callback, because currently there isn't a
>   well-defined global bightness in hardware. Note that the sysfs brightness
>   stil works. It just caches the value last set.
> - Convert to wmidev_invoke_method()
> - Convert to ARRAY_SIZE()
> - Convert some macros to enum
> - Convert to devm_led_classdev_multicolor_register_ext()
> - Rename sysfs path to amd_halo:multicolor:status
> - Fold default LED colors setting in probe, before registration
> - Add no_singleton option
> - Make default RGB values into macros and adjust their values
> ---
>  MAINTAINERS                             |   7 +
>  drivers/platform/x86/amd/Kconfig        |  11 ++
>  drivers/platform/x86/amd/Makefile       |   1 +
>  drivers/platform/x86/amd/amd_halo_led.c | 267 ++++++++++++++++++++++++++++++++
>  4 files changed, 286 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8063cb56feef..cde3865addb4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1138,6 +1138,13 @@ F:	drivers/char/hw_random/geode-rng.c
>  F:	drivers/crypto/geode*
>  F:	drivers/video/fbdev/geode/
>  
> +AMD HALO BOX RGB LED DRIVER
> +M:	Mario Limonciello (AMD) <superm1@kernel.org>
> +R:	Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/amd/amd_halo_led.c
> +
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>  R:	Carlos Bilbao <carlos.bilbao@kernel.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index b813f9265368..a1a74ef6c859 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -34,6 +34,17 @@ config AMD_WBRF
>  	  This mechanism will only be activated on platforms that advertise a
>  	  need for it.
>  
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
>  config AMD_ISP_PLATFORM
>  	tristate "AMD ISP4 platform driver"
>  	depends on I2C && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index f6ff0c837f34..2f467dbbfc8a 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
>  obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>  obj-$(CONFIG_AMD_PMF)		+= pmf/
>  obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> +obj-$(CONFIG_AMD_HALO_LED)	+= amd_halo_led.o
>  obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
>  obj-$(CONFIG_AMD_HFI)		+= hfi/
> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/x86/amd/amd_halo_led.c
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
> + * This driver provides RGB LED control for AMD Halo Box devices through
> + * the LED multicolor subsystem. The Halo Box light bar can be controlled
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

These must be in alphabetical order.

Put the byteorder one into a separate group separated with a blank line.

> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +enum {
> +	AMD_HALO_WMI_TURN_OFF = 0x04,
> +	AMD_HALO_WMI_RGB = 0x07
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

Please add types.h

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
> +	struct wmi_buffer input = {
> +		.length = length,
> +		.data = data,
> +	};
> +	__le16 *result_status __free(kfree) = NULL;
> +	struct wmi_buffer output = {};
> +	int ret;
> +
> +	ret = wmidev_invoke_method(wdev, 0, method_id,
> +				   &input, &output, sizeof(*result_status));
> +	if (ret)
> +		return ret;
> +
> +	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
> +	result_status = output.data;

Please move the variable declaration here (mid-function) as explained in 
the long comment in cleanup.h.

> +	ret = wmi_status_to_err(le16_to_cpu(*result_status));
> +
> +	return ret;

	return wmi_status_to_err(...);

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
> +	struct amd_halo_wmi_args args = { };
> +
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, sizeof(args));
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
> +static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, u32 b)
> +{
> +	if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +	    g > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +	    b > AMD_HALO_MAX_HW_BRIGHTNESS) {
> +		return -EINVAL;
> +	}
> +
> +	struct amd_halo_wmi_args_rgb args = {
> +		.cmd = cpu_to_le32(AMD_HALO_RGB_CMD_SET),
> +		.red = cpu_to_le32(r),
> +		.green = cpu_to_le32(g),
> +		.blue = cpu_to_le32(b)

Add the trailing comma.

> +	};
> +
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(args));
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
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct amd_halo_led_data *data = container_of(mc_cdev,

Add container_of.h

> +						      struct amd_halo_led_data,
> +						      led_mc);
> +	u32 red_hw, green_hw, blue_hw;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	if (brightness == 0)
> +		return amd_halo_wmi_turn_off(data->wdev);
> +
> +	red_hw = mc_cdev->subled_info[0].brightness;
> +	green_hw = mc_cdev->subled_info[1].brightness;
> +	blue_hw = mc_cdev->subled_info[2].brightness;
> +
> +	ret = amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_hw);
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
> +		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cleanup\n");

Please add include for this.

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
> +	struct led_init_data led_init_data = {
> +		.devicename = "amd_halo",
> +		.default_label = "multicolor:" LED_FUNCTION_STATUS,
> +		.devname_mandatory = true,
> +	};
> +	struct amd_halo_led_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&wdev->dev, &data->lock);
> +	if (ret)
> +		return ret;
> +
> +	data->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	data->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	data->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	data->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +	data->subled_info[0].intensity = AMD_HALO_DEFAULT_RED;
> +	data->subled_info[1].intensity = AMD_HALO_DEFAULT_GREEN;
> +	data->subled_info[2].intensity = AMD_HALO_DEFAULT_BLUE;
> +
> +	data->led_mc.led_cdev.brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.max_brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.brightness_set_blocking = amd_halo_brightness_set;
> +	data->led_mc.led_cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
> +	data->led_mc.num_colors = ARRAY_SIZE(data->subled_info);

Add include.

> +	data->led_mc.subled_info = data->subled_info;
> +
> +	ret = amd_halo_wmi_set_rgb(wdev, AMD_HALO_DEFAULT_RED, AMD_HALO_DEFAULT_GREEN,
> +				   AMD_HALO_DEFAULT_BLUE);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->led_mc,
> +							&led_init_data);
> +	if (ret)
> +		return dev_err_probe(&wdev->dev, ret,
> +				     "Failed to register multicolor LED\n");
> +	return 0;
> +}
> +
> +static const struct wmi_device_id amd_halo_id_table[] = {
> +	{ .guid_string = AMD_HALO_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
> +
> +static struct wmi_driver amd_halo_driver = {
> +	.driver = {
> +		.name = "amd_halo_led",
> +	},
> +	.id_table = amd_halo_id_table,
> +	.probe = amd_halo_probe,
> +	.no_singleton = true,
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
> 

-- 
 i.

