Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DF4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BFE860FBF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238217AbhIMJDN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 05:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58175 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235890AbhIMJDJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 05:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631523714;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ksa/cuR/X7uRKRFtGGQc32Hqelb4zZUhHL1Feuax50k=;
        b=FcYtcejAJZVYtk+n/l3q5Z8GzEifENfWgpi9Lqyp7+AXvJsWFmEaUPHH/muY/LGNmWK8Dd
        U90N5gDR4VMzPD9dkRsyiYjXeigw3xk+6YC/+oS9sxia3FtgNuYW56KB2Oa0Sa1MZVgN9n
        4Re9YEeH3UbIVWQQWLZDutixCv1Tm9M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-3Pgy8-z2NwCXKHTYGfyK-w-1; Mon, 13 Sep 2021 05:01:53 -0400
X-MC-Unique: 3Pgy8-z2NwCXKHTYGfyK-w-1
Received: by mail-ed1-f69.google.com with SMTP id y21-20020a056402359500b003cd0257fc7fso4584816edc.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 02:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ksa/cuR/X7uRKRFtGGQc32Hqelb4zZUhHL1Feuax50k=;
        b=pvTY4ZyhpqI1E42hhjJC0ZWJSy09rMFmjGI+KY78+mELuELJlg6DWYUAZkUd4/wm3x
         hBxiGP3hqm07ozWtxenfm2SQRbdrKULnnlBTiw7tqe8MPRdrectNib1L4PqczcwnWBbp
         05VNVF46TXaxoTVg/MkVB3lb7t/Q0lnXKfO9D6iRSxR0ojD2epMiegQu+c+ovz/LMeFh
         05Ebmgdkm3wi95LBduWmLS7uYtjyPsNjQrFAx4VsMxHZ2yJXFsTGjWGgOYLWBU/m4nMz
         k4k26PnnC7L/OZ7RKbQQ+IfqEs0csVKmZvp3gpxwiDHItDuQvkzRBS9hq9smt644V4L7
         Sjfw==
X-Gm-Message-State: AOAM533GXTtAPo1qKwrFbYSZYrkZlAkRcnQEkpJjb4m0nrO3vPr1g6lw
        3A//MTXAbyYPKuY76tRtipZ75ldXHwntCLmbrxUNpDqq3oAQ8XZoi4gUrPs1Zp3yWWaXgfoJIY9
        8Bw5ZNAA9njtM5Gqm8PhGGjsYgvEbJ7Jnaw==
X-Received: by 2002:a05:6402:283:: with SMTP id l3mr11882448edv.399.1631523711709;
        Mon, 13 Sep 2021 02:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz2rEa8hYieDB+qmzqc9LxTaeRYiLDSLDiP3+OIv72/NaKvIGhfice+ThkJDl2xLO7vdzwuA==
X-Received: by 2002:a05:6402:283:: with SMTP id l3mr11882425edv.399.1631523711411;
        Mon, 13 Sep 2021 02:01:51 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id o3sm3133015eju.123.2021.09.13.02.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 02:01:51 -0700 (PDT)
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>,
        platform-driver-x86@vger.kernel.org
Cc:     mario.limonciello@outlook.com, pobrn@protonmail.com,
        andy.shevchenko@gmail.com, aplattner@nvidia.com,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
Date:   Mon, 13 Sep 2021 11:01:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903003838.15797-1-ddadap@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/3/21 2:38 AM, Daniel Dadap wrote:
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
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> 
> v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
>     <mario.limonciello@outlook.com>; various cleanups suggested by
>     Barnabás Pőcze <pobrn@protonmail.com>
> v3: Address assorted style nits raised by Andy Shevchenko
>     <andy.shevchenko@gmail.com> in response to a related patch; remove
>     additional behavior change to WMI subsystem from patch series as
>     recommended by Hans de Goede <hdegoede@redhat.com> 
> v4: Use MODULE_DEVICE_TABLE() (Thomas Weißschuh <thomas@t-8ch.de>)
>     Fix scope of internal driver state; various style fixes (Barnabás
>     Pőcze, Andy Shevchenko)
>     Use devm_backlight_device_register() (Barnabás Pőcze)
>     Add kerneldoc comments for enums and structs (Andy Shevchenko)
> v5: Remove Aaron Plattner as author, as suggested by Aaron Plattner
>     <aplattner@nvidia.com>
>     Register as BACKLIGHT_FIRMWARE rather than BACKLIGHT_PLATFORM;
>     Return negative errno if .get_brightness() fails (Thomas Weißschuh)
>     Assorted style improvements (Andy Shevchenko, Thomas Weißschuh)
> v6: Make behavior of callers of wmi_call_wmaa() more consistent;
>     simplify potentially confusing description in Kconfig help text
>     (Thomas Weißschuh)
> 
>  MAINTAINERS                               |   6 +
>  drivers/platform/x86/Kconfig              |  16 ++
>  drivers/platform/x86/Makefile             |   1 +
>  drivers/platform/x86/wmaa-backlight-wmi.c | 205 ++++++++++++++++++++++
>  4 files changed, 228 insertions(+)
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
> index d12db6c316ea..00f021eda25c 100644
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
> +	  wrapper to drive LCD backlight levels through the Embedded Controller
> +	  (EC).
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
> index 000000000000..f5c4f8337c2c
> --- /dev/null
> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/backlight.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +/**
> + * enum wmaa_method - WMI method IDs for ACPI WMAA
> + * @WMAA_METHOD_LEVEL:  Get or set the brightness level,
> + *                      or get the maximum brightness level.
> + * @WMAA_METHOD_SOURCE: Get the source for backlight control.
> + */
> +enum wmaa_method {
> +	WMAA_METHOD_LEVEL = 1,
> +	WMAA_METHOD_SOURCE = 2,
> +	WMAA_METHOD_MAX
> +};
> +
> +/**
> + * enum wmaa_mode - Operation mode for ACPI WMAA method
> + * @WMAA_MODE_GET:           Get the current brightness level or source.
> + * @WMAA_MODE_SET:           Set the brightness level.
> + * @WMAA_MODE_GET_MAX_LEVEL: Get the maximum brightness level. This is only
> + *                           valid when the WMI method is %WMAA_METHOD_LEVEL.
> + */
> +enum wmaa_mode {
> +	WMAA_MODE_GET = 0,
> +	WMAA_MODE_SET = 1,
> +	WMAA_MODE_GET_MAX_LEVEL = 2,
> +	WMAA_MODE_MAX
> +};
> +
> +/**
> + * enum wmaa_source - Backlight brightness control source identification
> + * @WMAA_SOURCE_GPU:   Backlight brightness is controlled by the GPU.
> + * @WMAA_SOURCE_EC:    Backlight brightness is controlled by the system's
> + *                     Embedded Controller (EC).
> + * @WMAA_SOURCE_AUX:   Backlight brightness is controlled over the DisplayPort
> + *                     AUX channel.
> + */
> +enum wmaa_source {
> +	WMAA_SOURCE_GPU = 1,
> +	WMAA_SOURCE_EC = 2,
> +	WMAA_SOURCE_AUX = 3,
> +	WMAA_SOURCE_MAX
> +};
> +
> +/**
> + * struct wmaa_args - arguments for the ACPI WMAA method
> + * @mode:    Pass in an &enum wmaa_mode value to select between getting or
> + *           setting a value.
> + * @val:     In parameter for value to set when operating in %WMAA_MODE_SET
> + *           mode. Not used in %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode.
> + * @ret:     Out parameter returning retrieved value when operating in
> + *           %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode. Not used in
> + *           %WMAA_MODE_SET mode.
> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
> + *
> + * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
> + * The value passed in to @val or returned by @ret will be a brightness value
> + * when the WMI method ID is %WMAA_METHOD_LEVEL, or an &enum wmaa_source value
> + * when the WMI method ID is %WMAA_METHOD_SOURCE.
> + */
> +struct wmaa_args {
> +	u32 mode;
> +	u32 val;
> +	u32 ret;
> +	u32 ignored[3];
> +};
> +
> +/**
> + * wmi_call_wmaa() - helper function for calling ACPI WMAA via its WMI wrapper
> + * @w:    Pointer to the struct wmi_device identified by %WMAA_WMI_GUID
> + * @id:   The method ID for the ACPI WMAA method (e.g. %WMAA_METHOD_LEVEL or
> + *        %WMAA_METHOD_SOURCE)
> + * @mode: The operation to perform on the ACPI WMAA method (e.g. %WMAA_MODE_SET
> + *        or %WMAA_MODE_GET)
> + * @val:  Pointer to a value passed in by the caller when @mode is
> + *        %WMAA_MODE_SET, or a value passed out to the caller when @mode is
> + *        %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL.
> + *
> + * Returns 0 on success, or a negative error number on failure.
> + */
> +static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method id, enum wmaa_mode mode, u32 *val)
> +{
> +	struct wmaa_args args = {
> +		.mode = mode,
> +		.val = 0,
> +		.ret = 0,
> +	};
> +	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
> +	acpi_status status;
> +
> +	if (id < WMAA_METHOD_LEVEL || id >= WMAA_METHOD_MAX ||
> +	    mode < WMAA_MODE_GET || mode >= WMAA_MODE_MAX)
> +		return -EINVAL;
> +
> +	if (mode == WMAA_MODE_SET)
> +		args.val = *val;
> +
> +	status = wmidev_evaluate_method(w, 0, id, &buf, &buf);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&w->dev, "ACPI WMAA failed: %s\n",
> +			acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	if (mode != WMAA_MODE_SET)
> +		*val = args.ret;
> +
> +	return 0;
> +}
> +
> +static int wmaa_backlight_update_status(struct backlight_device *bd)
> +{
> +	struct wmi_device *wdev = bl_get_data(bd);
> +
> +	return wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_SET,
> +			     &bd->props.brightness);
> +}
> +
> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
> +{
> +	struct wmi_device *wdev = bl_get_data(bd);
> +	u32 level;
> +	int ret;
> +
> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET, &level);
> +	if (ret < 0)
> +		return ret;
> +
> +	return level;
> +}
> +
> +static const struct backlight_ops wmaa_backlight_ops = {
> +	.update_status = wmaa_backlight_update_status,
> +	.get_brightness = wmaa_backlight_get_brightness,
> +};
> +
> +static int wmaa_backlight_wmi_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct backlight_properties props = {};
> +	struct backlight_device *bdev;
> +	u32 source;
> +	int ret;
> +
> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_SOURCE, WMAA_MODE_GET, &source);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * This driver is only to be used when brightness control is handled
> +	 * by the EC; otherwise, the GPU driver(s) should control brightness.
> +	 */
> +	if (source != WMAA_SOURCE_EC)
> +		return -ENODEV;
> +
> +	/*
> +	 * Identify this backlight device as a firmware device so that it can
> +	 * be prioritized over any exposed GPU-driven raw device(s).
> +	 */
> +	props.type = BACKLIGHT_FIRMWARE;
> +
> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET_MAX_LEVEL,
> +			    &props.max_brightness);
> +	if (ret)
> +		return ret;
> +
> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET,
> +			    &props.brightness);
> +	if (ret)
> +		return ret;
> +
> +	bdev = devm_backlight_device_register(&wdev->dev, "wmaa_backlight",
> +					      &wdev->dev, wdev,
> +					      &wmaa_backlight_ops, &props);
> +	return PTR_ERR_OR_ZERO(bdev);
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
> +		.name = "wmaa-backlight",
> +	},
> +	.probe = wmaa_backlight_wmi_probe,
> +	.id_table = wmaa_backlight_wmi_id_table,
> +};
> +module_wmi_driver(wmaa_backlight_wmi_driver);
> +
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
> +MODULE_LICENSE("GPL");
> 

