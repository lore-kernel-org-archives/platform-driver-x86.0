Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBA31F99C;
	Mon, 11 May 2026 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508866; cv=none; b=lj5ExHS7nh7jxgcvmzmihUYsI3H9k5EYjWTMs7cFUz0GFHKfZHaps++tsnjFUKagxwTWFX0X4rN9vtFsRol35gBM+EgDFXBTnrlRrupCsqtkkMebhLm1xKsIppp+zPlsER08KPSHqVz/ZCyRib+wTGYdqVtBxhvVkAQQmmhNcyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508866; c=relaxed/simple;
	bh=BQalTODFlyAs/jcinxqap9g9Erit5O6lxZn9/XTjaFk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eVUxisVHnMzXjWDidqL9vaMVq5i2u6BH/WrvsNaftv4+jrRYBgwVyaRVHyMpXxhL+cOEWvSEcDDtiGFE5rQUttSM1kjmt9YOTze2l5X/lHNoAuGmJ22KXMzGCHXk2AqmdAMGYRt+HoDDBuNdJSdM54FY4uV1j+u7a04eZbGIKV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFOZ6VBY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFOZ6VBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778508865; x=1810044865;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BQalTODFlyAs/jcinxqap9g9Erit5O6lxZn9/XTjaFk=;
  b=TFOZ6VBYkwfya88OmcjM8FOn9D7ApSfm5bUKA6cP399il5UEjLrI/ZhR
   VytiGYX7PS2sAazPDs79cYW2HDwGdohuQlCOq6/GJHAxuxbFhKrjwadv3
   FHy8GlZf2Bbr1djQT37jeDzjxzehRMb9FXq37V7YQxTTNzAFh+HvL0NqE
   LYBWKtqTkMEJta/xHiHC2bf4saqr7pU0coPLiYc6nTWvoo+dZKIgcUOyG
   mdLjhs0C0Z0fk5+4lpZBA11cvz/iXuAFJOJmTjmUXUbn+1jkOuMOdbaR3
   mdqw0BfUsKX/tc6TMnJuYDDhDgga3VYt0olZWxEJBNlBcvCvhIM4fi/dK
   A==;
X-CSE-ConnectionGUID: q5HqFuKMRJeS98m8RSieWQ==
X-CSE-MsgGUID: VTl5yAmUSoqUd/J3NuBkcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79256476"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79256476"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:14:24 -0700
X-CSE-ConnectionGUID: YBSXxnzmQzOw3GAhcaxZGg==
X-CSE-MsgGUID: BZgcGZNcRgmzhZT50hN1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="261203111"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:14:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 17:14:18 +0300 (EEST)
To: "Yo-Jung Leo Lin (AMD)" <leo.lin@amd.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "Mario Limonciello (AMD)" <superm1@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86/amd: Introduce Halo Box RGB LED driver
In-Reply-To: <20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com>
Message-ID: <4c416cce-dd01-9aa9-093a-8ec6bfe1b7b8@linux.intel.com>
References: <20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 May 2026, Yo-Jung Leo Lin (AMD) wrote:

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
> - Each channel controlled via individual WMI method calls
> - Value range: 0-100 (matching hardware range directly)
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
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
>  drivers/platform/x86/amd/amd_halo_led.c | 312 ++++++++++++++++++++++++++++++++
>  4 files changed, 331 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c871acf2179c..464bd4d16461 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1124,6 +1124,13 @@ F:	drivers/char/hw_random/geode-rng.c
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
> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +enum {
> +	AMD_HALO_WMI_GET_LIGHTBAR = 0x01,
> +	AMD_HALO_WMI_SET_LIGHTBAR,
> +	AMD_HALO_WMI_TURN_ON,
> +	AMD_HALO_WMI_TURN_OFF
> +};
> +
> +/* Channel selectors for Arg0 */
> +enum {
> +	AMD_HALO_CHANNEL_RED = 0x01,
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

Fits to less lines.

> +{
> +	struct amd_halo_wmi_args args = {
> +		.arg0 = arg0,
> +		.arg1 = arg1,
> +	};
> +	struct wmi_buffer input = {
> +		.length = sizeof(args),
> +		.data = &args,
> +	};
> +	struct wmi_buffer output = { 0 };

= {} is enough to initialize to default values.

> +	u16 result_status;
> +	int ret;
> +
> +	ret = wmidev_invoke_method(wdev, 0, method_id,
> +				   &input, &output, sizeof(result_status));
> +	if (ret)
> +		return ret;
> +
> +	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
> +	result_status = le16_to_cpu(*(__le16 *)output.data);

Add include for le16_to_cpu()

> +	ret = wmi_status_to_err(result_status);
> +
> +	kfree(output.data);

Add include for kfree()

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
> + * @channel: Channel selector (1=Red, 2=Green, 3=Blue)
> + * @brightness: brightness to set (0-100)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_set_channel(struct wmi_device *wdev, u32 channel,
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
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct amd_halo_led_data *data = container_of(mc_cdev,
> +						       struct amd_halo_led_data,
> +						       led_mc);

Alignment off by 1.

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
> +	ret = amd_halo_wmi_turn_on(data->wdev);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_RED,
> +				       red_hw);

I suggest putting all these 3 to one line (instead of 2 lines each).

> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
> +				       green_hw);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
> +				       blue_hw);
> +	if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	/*
> +	 * Consider the light bar non-functional if TURN_ON or SET_LIGHTBAR failed.
> +	 * Attempt to turn the LED off completely as clean-up.
> +	 */
> +	if (amd_halo_wmi_turn_off(data->wdev))
> +		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
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
> +		.devname_mandatory = true

Add the trailing comma to any non-terminating entry.

-- 
 i.

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
> +	data->led_mc.subled_info = data->subled_info;
> +
> +	ret = amd_halo_wmi_turn_on(wdev);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_RED,
> +				       AMD_HALO_DEFAULT_RED);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_GREEN,
> +				       AMD_HALO_DEFAULT_GREEN);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_BLUE,
> +				       AMD_HALO_DEFAULT_BLUE);
> +	if (ret)
> +		goto out;
> +
> +	ret = devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->led_mc,
> +							&led_init_data);
> +	if (ret)
> +		return dev_err_probe(&wdev->dev, ret,
> +				     "Failed to register multicolor LED\n");
> +	return 0;
> +
> +out:
> +	/*
> +	 * Attempt to turn LED off as a cleanup if either TURN_ON or SET_LIGHTBAR
> +	 * fails. For probe failure due to non-WMI errors, keep the LED in the
> +	 * default color.
> +	 */
> +	dev_warn(&data->wdev->dev, "Light bar non-functional, turning it off\n");
> +
> +	if (amd_halo_wmi_turn_off(data->wdev))
> +		dev_warn(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
> +
> +	return dev_err_probe(&wdev->dev, ret, "WMI call failed during probe!\n");
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
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260429-halo-leds-v2-plus-722c8083afe8
> 
> Best regards,
> 
