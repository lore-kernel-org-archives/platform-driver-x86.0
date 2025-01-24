Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF3D21ADB2;
	Fri, 24 Jan 2025 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737722331; cv=none; b=H2ruf7yKsB/+X+xB5V7q2hur9aZB6KOZlVkbpw7y8sbBWP0ho5FrrvjBj30ZN6H5X355xbvnfSr3vdBiKD3QSIdQUtKK0HruPgpvhei3lRaufgOeiDS5DPsJ0RsIw5bFHtPfXuB0GFFy4q54k0zjtApYAJY11lo5TRErUY0hpdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737722331; c=relaxed/simple;
	bh=eWGhlac/Ml9/goziT/9o6WfTdZsPGrtFWlzniw8PuMI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mbE6Nhnp6wTP+muA7b94zIFXB9db6/anGaarH750j2KuGxY4SV/qPo1obQ1oBKccC9nJrxVEAyytmnfQVvq4xBFdbBDjnkCSGHtHW2/L1/KABKC9SEEaLa2EOOMhx0EnwjYWdRt4IlJi6kcHB6/taVSSYWJTXVe8pTeXw/oS2iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzwpsCNe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzwpsCNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737722330; x=1769258330;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eWGhlac/Ml9/goziT/9o6WfTdZsPGrtFWlzniw8PuMI=;
  b=KzwpsCNevv7Z0qS0H6bujpkRG27gVQqlxS7Ub5FsTbL/xyjfgxaQ47Lo
   DGt6DLFNPfFvyfVDIjtui7QTa9e8c6JMy9yo5waIK9Qpaz01V37DSCJwA
   jPzvHpiPzjU4CW0GveCE4jBsCtdIaeAD6xITu9oYVd/BG3cfKODkVNMXc
   Nsg9CPqKG6VU9grun0PdDEg2QZoEgwtwbbnhaRIZY4BZrUiyveY1no95g
   12H5QXNX+e69Ld5E1BT2KIEVME4AG07H9bks1CPZykXij0y6B0VppUssb
   1IUyVviEbEbHpwNjMdHqXn3jfsiCBf3r2114ffIvi8RYa0VvJQvroU07s
   Q==;
X-CSE-ConnectionGUID: Oti7b5VmQ5qnp/U/Ybl0KQ==
X-CSE-MsgGUID: Qkp35iYCSJSJbIvAuE801g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="49241604"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="49241604"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:38:49 -0800
X-CSE-ConnectionGUID: uNaSu7waRrG+l3JauUkfdA==
X-CSE-MsgGUID: 6M3GKwCfTgSW/924oLCVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="107558903"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:38:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jan 2025 14:38:43 +0200 (EET)
To: Jackie Dong <xy-jackie@139.com>
cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, dongeg1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] platform/x86: lenovo-super-hotkey-wmi.c: Support for
 mic and audio mute LEDs
In-Reply-To: <20250122090942.6431-1-xy-jackie@139.com>
Message-ID: <703eb837-bd28-ffb2-f86b-ee8434e73277@linux.intel.com>
References: <20250122090942.6431-1-xy-jackie@139.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jan 2025, Jackie Dong wrote:

> Implement Lenovo utility data WMI calls needed to make LEDs
> work on Ideapads that support this GUID.
> This enables the mic and audio LEDs to be updated correctly.
> 
> Tested on below samples.
> ThinkBook 13X Gen4 IMH
> ThinkBook 14 G6 ABP
> ThinkBook 16p Gen4-21J8
> ThinkBook 16p Gen8-IRL
> ThinkBook 16p G7+ ASP
> 
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v2:
>  - Update code layout and formatting as recommended in review
>  - Improved error handling in ideapad_wmi_led_init
>  - Separated a WMI driver named lenovo-super-hotkey-wmi.c from
>    ideapad-lap.c, it's only for Lenovo Super Hotkey WMI devices. 
> 
>  drivers/platform/x86/Kconfig                  |   7 +
>  drivers/platform/x86/Makefile                 |   1 +
>  .../platform/x86/lenovo-super-hotkey-wmi.c    | 236 ++++++++++++++++++
>  3 files changed, 244 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-super-hotkey-wmi.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..bd85ed58104b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -475,6 +475,15 @@ config IDEAPAD_LAPTOP
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
>  
> +config LENOVO_HOTKEY_WMI
> +	tristate "Lenovo Super Hotkey Utility WMI extras driver"
> +	depends on ACPI_WMI
> +	depends on IDEAPAD_LAPTOP

Something leds related is missing from here.

> +	help
> +	  This driver provides WMI support for Lenovo customized hotkeys function
> +	  of Lenovo NoteBooks which are for Consumer and SMB customers, such as
> +	  Ideapad/YOGA/XiaoXin/Gaming/ThinkBook and so on.
> +
>  config LENOVO_YMC
>  	tristate "Lenovo Yoga Tablet Mode Control"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b142947067..2d172128a6e4 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>  # IBM Thinkpad and Lenovo
>  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>  obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_HOTKEY_WMI)	+= lenovo-super-hotkey-wmi.o
>  obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
>  obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
> diff --git a/drivers/platform/x86/lenovo-super-hotkey-wmi.c b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> new file mode 100644
> index 000000000000..d1611f935e30
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> + *
> + *  Copyright (C) 2025	Lenovo
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/wmi.h>
> +#include "ideapad-laptop.h"
> +
> +/* Lenovo Super Hotkey WMI GUIDs */
> +#define LUD_WMI_METHOD_GUID	"CE6C0974-0407-4F50-88BA-4FC3B6559AD8"
> +#define LUPKE_WMI_EVENT_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
> +
> +/* Lenovo Utility Data WMI method_id */
> +#define WMI_LUD_GET_SUPPORT 1
> +#define WMI_LUD_SET_FEATURE 2
> +
> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
> +
> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
> +
> +/* Input parameters to mute/unmute audio LED and Mic LED */
> +struct wmi_led_args {
> +	u8 id;
> +	u8 subid;
> +	u16 value;
> +};
> +
> +/* Values of input parameters to SetFeature of audio LED and Mic LED */
> +enum hotkey_set_feature {
> +	MIC_MUTE_LED_ON = 1,
> +	MIC_MUTE_LED_OFF,
> +	AUDIO_MUTE_LED_ON = 4,
> +	AUDIO_MUTE_LED_OFF,
> +};
> +
> +#define IDEAPAD_ACPI_LED_MAX 2

This seems strongly related to mute_led_type. I'd consider making it the 
last member in the enum. I'm not sure if "max" is good in the name as the 
max index is 1.

> +
> +enum ideapad_wmi_event_type {
> +	IDEAPAD_WMI_EVENT_FN_KEYS = 1,
> +	IDEAPAD_WMI_EVENT_LUD_KEYS,
> +};
> +
> +struct ideapad_wmi_private {
> +	enum ideapad_wmi_event_type event;
> +	struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
> +};
> +
> +static struct wmi_device *led_wdev;
> +
> +enum mute_led_type {
> +	MIC_MUTE,
> +	AUDIO_MUTE,
> +};
> +
> +static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, struct led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +
> +{
> +	struct wmi_led_args led_arg = {0, 0, 0};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		led_arg.id = brightness == LED_ON ? MIC_MUTE_LED_ON : MIC_MUTE_LED_OFF;
> +		break;
> +	case AUDIO_MUTE:
> +		led_arg.id = brightness == LED_ON ? AUDIO_MUTE_LED_ON : AUDIO_MUTE_LED_OFF;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	input.length = sizeof(struct wmi_led_args);
> +	input.pointer = &led_arg;
> +	status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE, &input, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int ideapad_wmi_audiomute_led_set(struct led_classdev *led_cdev,
> +					 enum led_brightness brightness)
> +
> +{
> +	return ideapad_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
> +}
> +
> +static int ideapad_wmi_micmute_led_set(struct led_classdev *led_cdev,
> +				       enum led_brightness brightness)
> +{
> +	return ideapad_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
> +}
> +
> +static int ideapad_wmi_led_init(enum mute_led_type led_type, struct device *dev)
> +{
> +	struct ideapad_wmi_private *wpriv = dev_get_drvdata(dev);
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	int led_version, err = 0;
> +	unsigned int wmiarg;
> +	acpi_status status;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
> +		break;
> +	case AUDIO_MUTE:
> +		wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	input.length = sizeof(wmiarg);
> +	input.pointer = &wmiarg;
> +	status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_GET_SUPPORT, &input, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	led_version = obj->integer.value;
> +
> +	wpriv->cdev[led_type].max_brightness = LED_ON;
> +	wpriv->cdev[led_type].dev = dev;
> +	wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> +			err = -EIO;
> +			goto led_error;
> +		}
> +		wpriv->cdev[led_type].name = "platform::micmute";
> +		wpriv->cdev[led_type].brightness_set_blocking = &ideapad_wmi_micmute_led_set;
> +		wpriv->cdev[led_type].default_trigger = "audio-micmute";
> +
> +		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;
> +
> +		break;
> +	case AUDIO_MUTE:
> +		if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> +			err = -EIO;
> +			goto led_error;
> +		}
> +		wpriv->cdev[led_type].name = "platform::mute";
> +		wpriv->cdev[led_type].brightness_set_blocking = &ideapad_wmi_audiomute_led_set;
> +		wpriv->cdev[led_type].default_trigger = "audio-mute";
> +
> +		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;
> +
> +		break;
> +	default:
> +		err = -EINVAL;
> +		dev_err(dev, "Unknown LED type %d\n", led_type);

Add #include for dev_err().

> +		goto led_error;
> +	}
> +
> +	kfree(obj);
> +	return 0;
> +
> +led_reg_failed:
> +	dev_err(dev, "Could not register mute LED %d : %d\n", led_type, err);
> +	led_classdev_unregister(&wpriv->cdev[led_type]);
> +led_error:
> +	kfree(obj);
> +	return err;
> +}
> +
> +static void ideapad_wmi_leds_setup(struct device *dev)
> +{
> +	ideapad_wmi_led_init(MIC_MUTE, dev);
> +	ideapad_wmi_led_init(AUDIO_MUTE, dev);
> +}
> +
> +static int lenovo_super_hotkey_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct ideapad_wmi_private *wpriv;
> +
> +	wpriv = devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);

Add include for devm_kzalloc().

> +	if (!wpriv)
> +		return -ENOMEM;
> +
> +	*wpriv = *(const struct ideapad_wmi_private *)context;
> +
> +	dev_set_drvdata(&wdev->dev, wpriv);
> +
> +	if (wpriv->event == IDEAPAD_WMI_EVENT_LUD_KEYS) {
> +		led_wdev = wdev;
> +		ideapad_wmi_leds_setup(&wdev->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct ideapad_wmi_private lsk_wmi_context_fn_keys = {
> +	.event = IDEAPAD_WMI_EVENT_FN_KEYS
> +};
> +
> +static const struct ideapad_wmi_private lsk_wmi_context_lud_keys = {
> +	.event = IDEAPAD_WMI_EVENT_LUD_KEYS
> +};
> +
> +static const struct wmi_device_id lenovo_super_hotkey_wmi_id_table[] = {
> +	{ LUPKE_WMI_EVENT_GUID, &lsk_wmi_context_fn_keys }, /* FN keys */
> +	{ LUD_WMI_METHOD_GUID, &lsk_wmi_context_lud_keys }, /* Utility data */
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_super_hotkey_wmi_id_table);
> +
> +static struct wmi_driver lenovo_super_hotkey_wmi_driver = {
> +	 .driver = {
> +		 .name = "lenovo_super_hotkey_wmi",
> +	 },
> +	 .id_table = lenovo_super_hotkey_wmi_id_table,
> +	 .probe = lenovo_super_hotkey_wmi_probe,
> +};
> +
> +module_wmi_driver(lenovo_super_hotkey_wmi_driver);
> +
> +MODULE_INFO(depends, "wmi,ideapad-laptop");
> +MODULE_AUTHOR("Jackie Dong <dongeg1@lenovo.com>");
> +MODULE_DESCRIPTION("Lenovo Super Hotkey Utility WMI extras driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

