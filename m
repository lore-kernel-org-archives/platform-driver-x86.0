Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4F4C432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 09:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22C776054E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 09:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243555AbhIAJ0c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Sep 2021 05:26:32 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:50093 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243418AbhIAJ0b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Sep 2021 05:26:31 -0400
Date:   Wed, 1 Sep 2021 11:25:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1630488331;
        bh=kAsZtNSUYYQwYr0HASITl0rL5NhZ7jxb5TLXeV9pqRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z2X9oEaZasQPTpQnOwSWoW/7snWqkkC58wUPX7sZkvSwxMUBOxExkGJZP0p9CSzTy
         puQ/Vk0Ecw10X/Q74RLJXZDtGAY92l6HTslkjdD+eZr6lqEYb84Sq3Z8XGJjJjCuzZ
         Qjnyyw3R4kTVH0h0JLTE82Z9gvI7KiPEZphig5aU=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, andy.shevchenko@gmail.com,
        hdegoede@redhat.com, mario.limonciello@outlook.com,
        pobrn@protonmail.com, dvhart@infradead.org,
        Aaron Plattner <aplattner@nvidia.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Message-ID: <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210831224906.1072-1-ddadap@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Daniel,

a few minor comments, not sure if they should be reason for a reroll.

Thomas

Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>

On Di, 2021-08-31T17:49-0500, Daniel Dadap wrote:
> 
> A number of upcoming notebook computer designs drive the internal
> display panel's backlight PWM through the Embedded Controller (EC).
> This EC-based backlight control can be plumbed through to an ACPI
> "WMAA" method interface, which in turn can be wrapped by WMI with
> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
> 
> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
> backlight class driver to control backlight levels on systems with
> EC-driven backlights.
> 
> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
> 
> v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
>      <mario.limonciello@outlook.com>; various cleanups suggested by
>      Barnab??s P??cze <pobrn@protonmail.com>
> v3: Address assorted style nits raised by Andy Shevchenko
>      <andy.shevchenko@gmail.com> in response to a related patch; remove
>      additional behavior change to WMI subsystem from patch series as
>      recommended by Hans de Goede <hdegoede@redhat.com> 
> v4: Use MODULE_DEVICE_TABLE() (Thomas Wei??schuh <thomas@t-8ch.de>)
>     Fix scope of internal driver state; various style fixes (Barnab??s
>     P??cze, Andy Shevchenko)
>     Use devm_backlight_device_register() (Barnab??s P??cze)
>     Add kerneldoc comments for enums and structs (Andy Shevchenko)

It seems your Mailsetup breaks Unicode.

>  MAINTAINERS                               |   6 +
>  drivers/platform/x86/Kconfig              |  16 ++
>  drivers/platform/x86/Makefile             |   1 +
>  drivers/platform/x86/wmaa-backlight-wmi.c | 185 ++++++++++++++++++++++
>  4 files changed, 208 insertions(+)
>  create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bbaecde94aa0..fd7362a86c6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20008,6 +20008,12 @@ L:	linux-wireless@vger.kernel.org
>  S:	Odd fixes
>  F:	drivers/net/wireless/wl3501*
>  
> +WMAA BACKLIGHT DRIVER
> +M:	Daniel Dadap <ddadap@nvidia.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/wmaa-backlight-wmi.c
> +
>  WOLFSON MICROELECTRONICS DRIVERS
>  L:	patches@opensource.cirrus.com
>  S:	Supported
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..0df908ef8d7c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,22 @@ config PEAQ_WMI
>  	help
>  	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
>  
> +config WMAA_BACKLIGHT_WMI
> +	tristate "ACPI WMAA Backlight Driver"
> +	depends on ACPI_WMI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  This driver provides a sysfs backlight interface for notebook
> +	  systems which expose the WMAA ACPI method and an associated WMI
> +	  wrapper to drive LCD backlight levels through the system's
> +	  Embedded Controller (EC).
> +
> +	  Say Y or M here if you want to control the backlight on a notebook
> +	  system with an EC-driven backlight using the ACPI WMAA method.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called wmaa-backlight-wmi.
> +
>  config XIAOMI_WMI
>  	tristate "Xiaomi WMI key driver"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..109c1714237d 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= intel-wmi-sbl-fw-update.o
>  obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
>  obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>  obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)	+= wmaa-backlight-wmi.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>  
> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
> new file mode 100644
> index 000000000000..cb1a973803b1
> --- /dev/null
> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.

Also 2021?

> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +/**
> + * enum wmaa_method - WMI method IDs for ACPI WMAA
> + *
> + * @WMAA_LEVEL:  Get or set the brightness level,
> + *               or get the maximum brightness level.
> + * @WMAA_SOURCE: Get the source for backlight control.
> + */
> +enum wmaa_method {
> +	WMAA_LEVEL = 1,
> +	WMAA_SOURCE = 2,
> +};

Nitpick: No need for explicit values here.

> +/**
> + * enum wmaa_get_or_set - Operation mode for ACPI WMAA method
> + *
> + * @WMAA_GET:     Get the current brightness level or backlight source.
> + * @WMAA_SET:     Set the brightness level.
> + * @WMAA_GET_MAX: Get the maximum brightness level. This is only valid when the
> + *                WMI method is %WMAA_LEVEL.
> + */
> +enum wmaa_get_or_set {

Nitpick: wmaa_operation/command

> +	WMAA_GET = 0,
> +	WMAA_SET = 1,
> +	WMAA_GET_MAX = 2
> +};

Nitpick: No need for explicit values here.

> +/**
> + * enum wmaa_source - Backlight brightness control source identification
> + *
> + * @WMAA_SOURCE_GPU:   Backlight brightness is controlled by the GPU.
> + * @WMAA_SOURCE_EC:    Backlight brightness is controlled by the system's
> + *                     Embedded Controller (EC).
> + * @WMAA_SOURCE_AUX:   Backlight brightness is controlled over the DisplayPort
> + *                     AUX channel.
> + */
> +enum wmaa_source {
> +	WMAA_SOURCE_GPU = 1,
> +	WMAA_SOURCE_EC = 2,
> +	WMAA_SOURCE_AUX = 3
> +};
> +
> +/**
> + * struct wmaa_args - arguments for the ACPI WMAA method
> + *
> + * @set:     Pass in an &enum wmaa_get_or_set value to select between getting or
> + *           setting a value.
> + * @val:     In parameter for value to set when operating in %WMAA_SET mode. Not
> + *           used in %WMAA_GET or %WMAA_GET_MAX mode.
> + * @ret:     Out parameter returning retrieved value when operating in %WMAA_GET
> + *           or %WMAA_GET_MAX mode. Not used in %WMAA_SET mode.
> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
> + *
> + * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
> + * The value passed in to @val or returned by @ret will be a brightness value
> + * when the WMI method ID is %WMAA_LEVEL, or an &enum wmaa_source value when
> + * the WMI method ID is %WMAA_SOURCE.
> + */
> +struct wmaa_args {
> +	u32 set;
> +	u32 val;
> +	u32 ret;
> +	u32 ignored[3];
> +};
> +
> +static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method method, enum wmaa_get_or_set set, u32 *val)
> +{
> +	struct wmaa_args args = {
> +		.set = set,
> +		.val = 0,
> +		.ret = 0,
> +	};
> +	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
> +	acpi_status status;
> +
> +	if (set == WMAA_SET)
> +		args.val = *val;
> +
> +	status = wmidev_evaluate_method(w, 0, method, &buf, &buf);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&w->dev, "ACPI WMAA failed with %s\n",
> +			acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	if (set != WMAA_SET)
> +		*val = args.ret;
> +
> +	return 0;
> +}
> +
> +static int wmaa_backlight_update_status(struct backlight_device *bd)
> +{
> +	struct wmi_device *wdev = bl_get_data(bd);
> +
> +	return wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_SET, &bd->props.brightness);
> +}
> +
> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
> +{
> +	struct wmi_device *wdev = bl_get_data(bd);
> +	u32 level = 0;
> +	int ret;
> +
> +	ret = wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_GET, &level);
> +
> +	if (ret)
> +		dev_err(&bd->dev, "ACPI WMAA failed to get backlight level.\n");

Would it make sense to log the actual error?

Also while the backlight core does not seem to actually handle it, other
drivers return a negative errno on failure.

> +
> +	return level;
> +}
> +
> +static const struct backlight_ops wmaa_backlight_ops = {
> +	.update_status = wmaa_backlight_update_status,
> +	.get_brightness = wmaa_backlight_get_brightness
> +};
> +
> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
> +{
> +	struct backlight_properties props = {};
> +	struct backlight_device *backlight;
> +	u32 source;
> +	int ret;
> +
> +	ret = wmi_call_wmaa(w, WMAA_SOURCE, WMAA_GET, &source);
> +	if (ret)
> +		return ret;
> +
> +	if (source != WMAA_SOURCE_EC) {
> +		/* This driver is only to be used when brightness control is
> +		 * handled by the EC; otherwise, the GPU driver(s) should handle
> +		 * brightness control. */

checkpatch.pl wants this end-of-comment to be on its own line.

> +		return -ENODEV;
> +	}
> +
> +	/* Identify this backlight device as a platform device so that it can
> +	 * be prioritized over any exposed GPU-driven raw device(s). */

checkpatch.pl wants this end-of-comment to be on its own line.

> +	props.type = BACKLIGHT_PLATFORM;

Is this WMI method a standard interface?
If so, BACKLIGHT_FIRMWARE might actually fit better and still fulfill the
requirements.
The actual maintainers would know better than me, though.

> +
> +	ret = wmi_call_wmaa(w, WMAA_LEVEL, WMAA_GET_MAX, &props.max_brightness);
> +	if (ret)
> +		return ret;
> +
> +	ret = wmi_call_wmaa(w, WMAA_LEVEL, WMAA_GET, &props.brightness);
> +	if (ret)
> +		return ret;
> +
> +	backlight = devm_backlight_device_register(
> +		&w->dev, "wmaa_backlight",
> +		&w->dev, w, &wmaa_backlight_ops, &props);
> +	if (IS_ERR(backlight))
> +		return PTR_ERR(backlight);
> +
> +	return 0;

Could use PTR_ERR_OR_ZERO().

> +}
> +
> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> +
> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
> +	{ .guid_string = WMAA_WMI_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, wmaa_backlight_wmi_id_table);
> +
> +static struct wmi_driver wmaa_backlight_wmi_driver = {
> +	.driver = {
> +		.name = "wmaa-backlight"
> +	},
> +	.probe = wmaa_backlight_wmi_probe,
> +	.id_table = wmaa_backlight_wmi_id_table
> +};
> +module_wmi_driver(wmaa_backlight_wmi_driver);
> +
> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
> +MODULE_LICENSE("GPL v2");

"GPL" seems to be the more modern one.
(Equivalent to  "GPL v2", see Documentation/process/license-rules.rst)
