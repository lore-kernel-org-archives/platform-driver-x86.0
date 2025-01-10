Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B479120DD47;
	Fri, 10 Jan 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512052; cv=none; b=Sh0IlACHJe9kCwPD+mhFN7A10nKTSArb9ZU020dFR28DH83acJdX2Q3dzdVZsP1AHRYgCu8Tf7Xl9xI7AdEQoT9TdGzfTmypolbmvbdxVmhuaGXuIxxZekxFLYK294iYTzIzjkqsqHlWWsq2798Q7R0UyiNLPwEDgZLyzL+fdFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512052; c=relaxed/simple;
	bh=f9FylgJj59fAmz/fHDmaPBuiqg9UIdFPtPa5lA00AmA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UvSALte6ANjWKBbu8FjCVoD4ah5s8WMzD4ORwXGUF8gg9q7pbPn04khaKtIWZolyMvPU5GnSCLl66UIEgLNnxdG+qj9DqxoF0bYVtCsBfwSJkkUQbvczEFcXMsY0M6iax9e9woT5dWRLsNPdwpUx2gjwum6rCM6xKPC0dZjYxdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VR6tAlXQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VR6tAlXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736512051; x=1768048051;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f9FylgJj59fAmz/fHDmaPBuiqg9UIdFPtPa5lA00AmA=;
  b=VR6tAlXQyQPoq5MaqNnzsZ2vgW3SLKUt7Yl4i4UUcEeLMSoD7zbyroou
   gAZ5TD3nNwtq07Tv37qOqIT8JjdqUhmg3NFMVSWU4oZCyTjLTgDPdZFZ5
   ebCGvWVLAmc9LkDxaRqGKyzkekDZOI4fJqNfBNTZ478Pc7xqUOCpLraBI
   Ks+WOQtBjWoZbiCdW29mvfo8q0tHzqpqXwZDzKbn5mHshr2PjbYDSIc82
   1jJ2pYcGW4Dds8Cy5zFaWdgq25zbh5q1wNi4OX1gQVOvxpgFD9P33bgDR
   GYiTJV25OQSUliMRwBp17Ka/o5vWV2nD32MnVgmQbc+7VAozJnxOwpzE1
   w==;
X-CSE-ConnectionGUID: AL26z5RzS4GgX4VKc3HGHA==
X-CSE-MsgGUID: ucz+KPsrToC4VO1Ar3/USA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54220775"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="54220775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:27:31 -0800
X-CSE-ConnectionGUID: 11edMklMTCej+KmzBfSlJQ==
X-CSE-MsgGUID: kRkC6YAOSJuMe6unfrnf5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107764867"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO localhost) ([10.245.244.158])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:27:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jan 2025 14:27:21 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
    Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
    Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, 
    Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
In-Reply-To: <20250102004854.14874-3-derekjohn.clark@gmail.com>
Message-ID: <487ff49a-b521-600d-16bf-db3122295812@linux.intel.com>
References: <20250102004854.14874-1-derekjohn.clark@gmail.com> <20250102004854.14874-3-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Jan 2025, Derek J. Clark wrote:

> Adds lenovo-wmi-gamezone.c which provides a driver for the Lenovo
> GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
> Provides ACPI platform profiles over WMI.
> 
> v2:
> - Use devm_kzalloc to ensure driver can be instanced, remove global
>   reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> - Remove GZ_WMI symbol exporting.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  MAINTAINERS                                |   7 +
>  drivers/platform/x86/Kconfig               |  11 ++
>  drivers/platform/x86/Makefile              |   1 +
>  drivers/platform/x86/lenovo-wmi-gamezone.c | 203 +++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi.h          | 105 +++++++++++
>  5 files changed, 327 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index baf0eeb9a355..8f8a6aec6b92 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13034,6 +13034,13 @@ S:	Maintained
>  W:	http://legousb.sourceforge.net/
>  F:	drivers/usb/misc/legousbtower.c
>  
> +LENOVO WMI drivers
> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.c
> +F:	drivers/platform/x86/lenovo-wmi.h
> +
>  LETSKETCH HID TABLET DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..9a6ac7fdec9f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,17 @@ config IBM_RTL
>  	 state = 0 (BIOS SMIs on)
>  	 state = 1 (BIOS SMIs off)
>  
> +config LENOVO_WMI_GAMEZONE
> +	tristate "Lenovo GameZone WMI Driver"
> +	depends on ACPI_WMI
> +	select ACPI_PLATFORM_PROFILE
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
> +	  platform-profile firmware interface.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo_wmi_gamezone.
> +
>  config IDEAPAD_LAPTOP
>  	tristate "Lenovo IdeaPad Laptop Extras"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b142947067..7cb29a480ed2 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>  obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>  obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
>  
>  # Intel
>  obj-y				+= intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platform/x86/lenovo-wmi-gamezone.c
> new file mode 100644
> index 000000000000..da5e2bc41f39
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface provides
> + * platform profile and fan curve settings for devices that fall under the
> + * "Gaming Series" of Lenovo Legion devices.
> + *
> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/platform_profile.h>
> +#include "lenovo-wmi.h"
> +
> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> +
> +/* Method IDs */
> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
> +
> +static DEFINE_MUTEX(call_mutex);
> +
> +static const struct wmi_device_id lenovo_wmi_gamezone_id_table[] = {
> +	{ LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
> +	{}
> +};
> +
> +struct lenovo_wmi_gz_priv {
> +	struct wmi_device *wdev;
> +	enum platform_profile_option current_profile;
> +	struct platform_profile_handler pprof;
> +	bool platform_profile_support;
> +};
> +
> +/* Platform Profile Methods */
> +static int lenovo_wmi_gamezone_platform_profile_supported(
> +	struct platform_profile_handler *pprof, int *supported)
> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +
> +	priv = container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
> +
> +	guard(mutex)(&call_mutex);
> +	return lenovo_wmidev_evaluate_method_1(
> +		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SUPP, 0, supported);
> +}
> +
> +static int
> +lenovo_wmi_gamezone_profile_get(struct platform_profile_handler *pprof,
> +				enum platform_profile_option *profile)
> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +	int sel_prof;
> +	int err;
> +
> +	priv = container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
> +
> +	guard(mutex)(&call_mutex);
> +	err = lenovo_wmidev_evaluate_method_1(
> +		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_GET, 0, &sel_prof);
> +	if (err) {
> +		pr_err("Error getting fan profile from WMI interface: %d\n",
> +		       err);
> +		return err;
> +	}
> +
> +	switch (sel_prof) {
> +	case SMARTFAN_MODE_QUIET:
> +		*profile = PLATFORM_PROFILE_QUIET;
> +		break;
> +	case SMARTFAN_MODE_BALANCED:
> +		*profile = PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case SMARTFAN_MODE_PERFORMANCE:
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case SMARTFAN_MODE_CUSTOM:
> +		*profile = PLATFORM_PROFILE_CUSTOM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	priv->current_profile = *profile;
> +
> +	return 0;
> +}
> +
> +static int
> +lenovo_wmi_gamezone_profile_set(struct platform_profile_handler *pprof,
> +				enum platform_profile_option profile)
> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +	int sel_prof;
> +	int err;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_QUIET:
> +		sel_prof = SMARTFAN_MODE_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		sel_prof = SMARTFAN_MODE_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		sel_prof = SMARTFAN_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		sel_prof = SMARTFAN_MODE_CUSTOM;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	priv = container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
> +
> +	guard(mutex)(&call_mutex);
> +	err = lenovo_wmidev_evaluate_method_1(
> +		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SET, sel_prof, NULL);
> +	if (err) {
> +		pr_err("Error setting fan profile on WMI interface: %u\n", err);
> +		return err;
> +	}
> +
> +	priv->current_profile = profile;
> +	return 0;
> +}
> +
> +/* Driver Setup */
> +static int platform_profile_setup(struct lenovo_wmi_gz_priv *priv)
> +{
> +	int supported;
> +	int err;
> +
> +	err = lenovo_wmi_gamezone_platform_profile_supported(&priv->pprof,
> +							     &supported);
> +	if (err) {
> +		pr_err("Error checking platform profile support: %d\n", err);
> +		return err;
> +	}
> +
> +	priv->platform_profile_support = supported;
> +
> +	if (!supported)
> +		return -EOPNOTSUPP;
> +
> +	priv->pprof.name = "lenovo-wmi-gamezone";
> +	priv->pprof.profile_get = lenovo_wmi_gamezone_profile_get;
> +	priv->pprof.profile_set = lenovo_wmi_gamezone_profile_set;
> +
> +	set_bit(PLATFORM_PROFILE_QUIET, priv->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, priv->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_CUSTOM, priv->pprof.choices);
> +
> +	err = lenovo_wmi_gamezone_profile_get(&priv->pprof,
> +					      &priv->current_profile);
> +	if (err) {
> +		pr_err("Error getting current platform profile: %d\n", err);
> +		return err;
> +	}
> +
> +	guard(mutex)(&call_mutex);
> +	err = platform_profile_register(&priv->pprof);
> +	if (err) {
> +		pr_err("Error registering platform profile: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lenovo_wmi_gamezone_probe(struct wmi_device *wdev,
> +				     const void *context)
> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev = wdev;
> +	return platform_profile_setup(priv);
> +}
> +
> +static void lenovo_wmi_gamezone_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_wmi_gz_priv *priv = dev_get_drvdata(&wdev->dev);
> +
> +	guard(mutex)(&call_mutex);
> +	platform_profile_remove(&priv->pprof);
> +}
> +
> +static struct wmi_driver lenovo_wmi_gamezone_driver = {
> +	.driver = { .name = "lenovo_wmi_gamezone" },
> +	.id_table = lenovo_wmi_gamezone_id_table,
> +	.probe = lenovo_wmi_gamezone_probe,
> +	.remove = lenovo_wmi_gamezone_remove,
> +};
> +
> +module_wmi_driver(lenovo_wmi_gamezone_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_gamezone_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/lenovo-wmi.h
> new file mode 100644
> index 000000000000..8a302c6c47cb
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interface is
> + * broken up into multiple GUID interfaces that require cross-references
> + * between GUID's for some functionality. The "Custom Mode" interface is a
> + * legacy interface for managing and displaying CPU & GPU power and hwmon
> + * settings and readings. The "Other Mode" interface is a modern interface
> + * that replaces or extends the "Custom Mode" interface methods. The
> + * "GameZone" interface adds advanced features such as fan profiles and
> + * overclocking. The "Lighting" interface adds control of various status
> + * lights related to different hardware components. "Other Method" uses
> + * the data structs LENOVO_CAPABILITY_DATA_00, LENOVO_CAPABILITY_DATA_01
> + * and LENOVO_CAPABILITY_DATA_02 structs for capability information.
> + *
> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +
> +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__

Don't include __func__ into pr_fmt(). Including __func__ into any >dbg 
level message is not helpful to user, the error/warning/info should be 
written in plain English, not in terms of code/function names.

The usual pr_fmt() boilerplate is this:

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

-- 
 i.

> +
> +#ifndef _LENOVO_WMI_H_
> +#define _LENOVO_WMI_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +/* Platform Profile Modes */
> +#define SMARTFAN_MODE_QUIET 0x01
> +#define SMARTFAN_MODE_BALANCED 0x02
> +#define SMARTFAN_MODE_PERFORMANCE 0x03
> +#define SMARTFAN_MODE_CUSTOM 0xFF
> +
> +struct wmi_method_args {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +/* General Use functions */
> +static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
> +					 u32 method_id, struct acpi_buffer *in,
> +					 struct acpi_buffer *out)
> +{
> +	acpi_status status;
> +
> +	status = wmidev_evaluate_method(wdev, instance, method_id, in, out);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +};
> +
> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instance,
> +				    u32 method_id, u32 arg0, u32 arg1,
> +				    u32 *retval);
> +
> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instance,
> +				    u32 method_id, u32 arg0, u32 arg1,
> +				    u32 *retval)
> +{
> +	struct wmi_method_args args = { arg0, arg1 };
> +	struct acpi_buffer input = { (acpi_size)sizeof(args), &args };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj = NULL;
> +	int err;
> +
> +	err = lenovo_wmidev_evaluate_method(wdev, instance, method_id, &input,
> +					    &output);
> +
> +	if (err) {
> +		pr_err("Attempt to get method value failed.\n");
> +		return err;
> +	}
> +
> +	if (retval) {
> +		ret_obj = (union acpi_object *)output.pointer;
> +		if (!ret_obj) {
> +			pr_err("Failed to get valid ACPI object from WMI interface\n");
> +			return -EIO;
> +		}
> +		if (ret_obj->type != ACPI_TYPE_INTEGER) {
> +			pr_err("WMI query returnd ACPI object with wrong type.\n");
> +			kfree(ret_obj);
> +			return -EIO;
> +		}
> +		*retval = (u32)ret_obj->integer.value;
> +	}
> +
> +	kfree(ret_obj);
> +
> +	return 0;
> +}
> +
> +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
> +				    u32 method_id, u32 arg0, u32 *retval);
> +
> +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
> +				    u32 method_id, u32 arg0, u32 *retval)
> +{
> +	return lenovo_wmidev_evaluate_method_2(wdev, instance, method_id, arg0,
> +					       0, retval);
> +}
> +
> +#endif /* !_LENOVO_WMI_H_ */
> 
