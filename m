Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2E72941C;
	Thu,  2 Jan 2025 04:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735790969; cv=none; b=jSIt+cmsD49264Zfne00DjORSxAPZxvO+Fi63+2Ku9O/7DuCU8o0AaiUUhoPDlPzwm8LbAx7XZE93F+J3SzlpWhhKRpTY8Yvb/7Yw/PBvjPiT9NrVf4j6gXqepEwt4eLW2C/2jJ5v3k3Y3fG//xMXrEb4daAuUU4pYK/7pSDiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735790969; c=relaxed/simple;
	bh=G9QFl/pFmNLPS0fizfS8Nin9oHc8qUe19fa8yfE1/3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6wltxtDszwfHyjn5xfQf5ErPcEo8NfNRh71EjrUtsz0qco8gd8Tx6dFo9xEantOfC9xjYySGpI5xsEQEYgfuluJsbcFfbTTuOmPqqBALl1oFxUZfx+MQ30vlD9xOwPh0G8L3S/nV/VGDtBZcQjBRot3Kz0OVYPSuxSc5NBRYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=si+IL2F3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="si+IL2F3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55540C4CED0;
	Thu,  2 Jan 2025 04:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735790967;
	bh=G9QFl/pFmNLPS0fizfS8Nin9oHc8qUe19fa8yfE1/3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=si+IL2F30brzgkjorPhw5wFDQEDP/JvFDZ3ZQM8DFC/g75klrMVODVTvv7hMz/MCT
	 8W2820coProtCTuwmJwiPy+ba/ZO1iFZhYFmI0IeWDhA82dgIIBltTF9YwFQRxuI5K
	 CqIvEsysLPfUTfmAMeh9hmGS3f7ZCRcKNFTdeEzgc1jNkh3+4p1oczGZW2b7hxWvz3
	 IXp8GqKbbqOrBwWkmb9kne776xHazck7yMzoB49rd+enELUdXlVOYrsPBqjP1nd6FI
	 7dOHBGX0I6QbRdLD+rn36c9AD7anII3RpDqzTtdFAXTQ5WYu2NB6NGLyE4M7LfECv/
	 bWDCFAozguy3w==
Message-ID: <e738cf05-6fa6-4ca7-ba18-7f90bd316473@kernel.org>
Date: Wed, 1 Jan 2025 22:09:24 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-3-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250102004854.14874-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/1/25 18:47, Derek J. Clark wrote:
> Adds lenovo-wmi-gamezone.c which provides a driver for the Lenovo
> GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
> Provides ACPI platform profiles over WMI.
> 
> v2:
> - Use devm_kzalloc to ensure driver can be instanced, remove global
>    reference.
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
>   MAINTAINERS                                |   7 +
>   drivers/platform/x86/Kconfig               |  11 ++
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c | 203 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi.h          | 105 +++++++++++
>   5 files changed, 327 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index baf0eeb9a355..8f8a6aec6b92 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13034,6 +13034,13 @@ S:	Maintained
>   W:	http://legousb.sourceforge.net/
>   F:	drivers/usb/misc/legousbtower.c
>   
> +LENOVO WMI drivers
> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.c
> +F:	drivers/platform/x86/lenovo-wmi.h
> +
>   LETSKETCH HID TABLET DRIVER
>   M:	Hans de Goede <hdegoede@redhat.com>
>   L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..9a6ac7fdec9f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,17 @@ config IBM_RTL
>   	 state = 0 (BIOS SMIs on)
>   	 state = 1 (BIOS SMIs off)
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
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b142947067..7cb29a480ed2 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
>   
>   # Intel
>   obj-y				+= intel/
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

You can't go and put a static function in a header.  It needs to be in 
it's own source file.

> +
> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instance,
> +				    u32 method_id, u32 arg0, u32 arg1,
> +				    u32 *retval);
 > +> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 
instance,
> +				    u32 method_id, u32 arg0, u32 arg1,
> +				    u32 *retval)
> +{

Likewise you can't put this here even if it's used by multiple drivers.

You can leave the prototypes here, but the implementation needs to be 
moved to a C source file and the symbol needs to be exported from one 
driver and used by all the others that need it (maybe a "common" one?)

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

Can you use __free on the acpi_object so you don't need to worry about 
cleanup in the error paths?

> +
> +	return 0;
> +}
> +
> +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
> +				    u32 method_id, u32 arg0, u32 *retval);
> +
 > +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 
instance,> +				    u32 method_id, u32 arg0, u32 *retval)
> +{
> +	return lenovo_wmidev_evaluate_method_2(wdev, instance, method_id, arg0,
> +					       0, retval);

Same comment as above about source code in the headers.

> +}
> +
> +#endif /* !_LENOVO_WMI_H_ */

