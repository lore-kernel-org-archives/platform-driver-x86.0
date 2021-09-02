Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDB1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 23:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4747560F21
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 23:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhIBXVs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 19:21:48 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:36559 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232902AbhIBXVs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 19:21:48 -0400
Date:   Fri, 3 Sep 2021 01:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1630624848;
        bh=/BjBMCPNHjCBYQb/5VFfSC0NJQ+jknWmjbaLUQ60iCU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lrsAUTvy3W2gldnxULac9POvXhqvHK1U1r5qDYxzaqWd6gtNLh6MsZVpWLhkRw6/t
         oram98IKjeBb+jawBXzkoR6j7PbLMg2fHJqW0mn7op8DVnRAyojcN+yZFs+rmjwaPg
         wCBIuzz/Z4ld79gAbGNoRELD7WxoIkHC2FATLhs8=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, mario.limonciello@outlook.com,
        pobrn@protonmail.com, andy.shevchenko@gmail.com,
        hdegoede@redhat.com, aplattner@nvidia.com
Subject: Re: [PATCH v5] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Message-ID: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
References: <f4802d28-3674-bbc3-0377-52d3d03af4fe@redhat.com>
 <20210902214718.13628-1-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210902214718.13628-1-ddadap@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Daniel,

one more actual thing and two tiny nitpicks.

On 2021-09-02T16:47-0500, Daniel Dadap wrote:
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

system's -> systems

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
> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
> new file mode 100644
> index 000000000000..fa3f41302299
> --- /dev/null
> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> @@ -0,0 +1,194 @@
> [..]
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
> +	if (ret > 0)
> +		return -EINVAL;
> +	else if (ret < 0)
> +		return ret;

Nowhere else is the return value of wmi_call_wmaa() checked explicitly for
greater than zero and less than zero. Why here?
At least wmaa_backlight_update_status() should have identical semantics.
The case ret > 0 should never happen.

> +
> +	return level;
> +}
> [..]
> +
> +
> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> +
> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
> +	{ .guid_string = WMAA_WMI_GUID },

This could also be inlined as:
	{ "603E9613-EF25-4338-A3D0-C46177516DB7" },

More a stylistic thing though.

Thomas
