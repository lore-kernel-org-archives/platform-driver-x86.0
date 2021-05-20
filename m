Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567A4C433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 12:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31FAF61163
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 12:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242341AbhETMPJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 May 2021 08:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43243 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237441AbhETMPA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 May 2021 08:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621512816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DJ8PqteuQ5GxjRgUEem9n1QR6RNQrPdWUZ9qVlnTYnA=;
        b=PaP2GEDca+e9piK3uZpUcAJPGRbl+XtpwN/hYvAL3IQao8Cz888YfM1WYN0PePIJwKJAIE
        T19nElXO4IVdY2gCys8ExaVtHt1fBoyIvOmbGb9I3l1jSw73UZ+wkme5CQEsD19g6MHKnV
        xAIbyVo49d+2kRsE3J1KeXGU6seiS+Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-V8gLz-qGOAq5h2F04vyb4A-1; Thu, 20 May 2021 08:13:34 -0400
X-MC-Unique: V8gLz-qGOAq5h2F04vyb4A-1
Received: by mail-ed1-f72.google.com with SMTP id h16-20020a0564020950b029038cbdae8cbaso9388266edz.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 May 2021 05:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DJ8PqteuQ5GxjRgUEem9n1QR6RNQrPdWUZ9qVlnTYnA=;
        b=gsVWMOND3+HfBRgjQbmcXMCZEw2Ww6wXf1d8EHYt4wL5HZZfb7+gtdaR3cYeIlqFko
         ISvx9S7Q4bHk+hvVDjMoCznOK/Jj9BnGhxSwGWGkrt4NOrsCIaYHggFVMeC7OJA1XGly
         L052Hhwok15nms2BA8AWeN7qvH79Guc0OtBsBQ4yAAF3up0r5QHW0nJicidzI4mQINKU
         ErIKxIvdgSZ6DdHoIbE0LMqVYHhbPrHCYKiWN9kXDpUpbCCiRQf2KzqgPEHrLdxV80sS
         YD2YnzwuUCaa+ykXu2Vl7VoW9G5B0msC2hZCzW+hsrGRxtuL2bfygNwnjyX6nBhtSFbr
         WouA==
X-Gm-Message-State: AOAM533+UegyZjEEf9jbT0m/myypwNkdPPiqb7b7HO+SkzDIkJhgtV6P
        +KGa+ZSgKA65I3a7I6IbENc3u53kPohe4Ivmeh8+95gmyH38c0j8uKk8t/Cq5EsCGw2DWXtwil7
        82/rkoEZ6TjAv2MsnV70ySM77L2K7wrw1zA==
X-Received: by 2002:aa7:d455:: with SMTP id q21mr4644508edr.2.1621512812512;
        Thu, 20 May 2021 05:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBEEypbIotDjS/S2vKbU8WL1xxm/+WZe4+iyRafzcaogmoM14kDQIf7ERBB8/zu1NThGb3TQ==
X-Received: by 2002:aa7:d455:: with SMTP id q21mr4644494edr.2.1621512812311;
        Thu, 20 May 2021 05:13:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a7sm1437323edr.15.2021.05.20.05.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 05:13:31 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: Rename hp-wireless to wireless-hotkey
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20210519174405.30155-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6dd6b785-e808-2c8e-4b20-71dc6ef57cb8@redhat.com>
Date:   Thu, 20 May 2021 14:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519174405.30155-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/19/21 7:44 PM, Mario Limonciello wrote:
> This driver was originally intended to support some HP laptops, but
> later support was added for Xioami and AMD laptops.
> 
> Rename it to make it clear that it supports a larger variety of
> systems.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

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
>  drivers/platform/x86/Kconfig           |   9 ++-
>  drivers/platform/x86/Makefile          |   3 +-
>  drivers/platform/x86/hp-wireless.c     | 102 ------------------------
>  drivers/platform/x86/wireless-hotkey.c | 103 +++++++++++++++++++++++++
>  4 files changed, 109 insertions(+), 108 deletions(-)
>  delete mode 100644 drivers/platform/x86/hp-wireless.c
>  create mode 100644 drivers/platform/x86/wireless-hotkey.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 60592fb88e7a..9a668dae2738 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -415,16 +415,17 @@ config HP_ACCEL
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called hp_accel.
>  
> -config HP_WIRELESS
> -	tristate "HP wireless button"
> +config WIRELESS_HOTKEY
> +	tristate "Wireless hotkey button"
>  	depends on ACPI
>  	depends on INPUT
>  	help
> -	 This driver provides supports for new HP wireless button for Windows 8.
> +	 This driver provides supports for the wireless buttons found on some AMD,
> +	 HP, & Xioami laptops.
>  	 On such systems the driver should load automatically (via ACPI alias).
>  
>  	 To compile this driver as a module, choose M here: the module will
> -	 be called hp-wireless.
> +	 be called wireless-hotkey.
>  
>  config HP_WMI
>  	tristate "HP WMI extras"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index dcc8cdb95b4d..f4e7630186b0 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -52,7 +52,6 @@ obj-$(CONFIG_GPD_POCKET_FAN)	+= gpd-pocket-fan.o
>  
>  # Hewlett Packard
>  obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
> -obj-$(CONFIG_HP_WIRELESS)	+= hp-wireless.o
>  obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
>  obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
>  
> @@ -115,7 +114,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>  obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
>  obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
> -
> +obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
>  # Intel uncore drivers
>  obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
>  obj-$(CONFIG_INTEL_RST)				+= intel-rst.o
> diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
> deleted file mode 100644
> index 0753ef18e721..000000000000
> --- a/drivers/platform/x86/hp-wireless.c
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *  Airplane mode button for HP & Xiaomi laptops
> - *
> - *  Copyright (C) 2014-2017 Alex Hung <alex.hung@canonical.com>
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
> -#include <linux/input.h>
> -#include <linux/platform_device.h>
> -#include <linux/acpi.h>
> -#include <acpi/acpi_bus.h>
> -
> -MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("Alex Hung");
> -MODULE_ALIAS("acpi*:HPQ6001:*");
> -MODULE_ALIAS("acpi*:WSTADEF:*");
> -MODULE_ALIAS("acpi*:AMDI0051:*");
> -
> -static struct input_dev *hpwl_input_dev;
> -
> -static const struct acpi_device_id hpwl_ids[] = {
> -	{"HPQ6001", 0},
> -	{"WSTADEF", 0},
> -	{"AMDI0051", 0},
> -	{"", 0},
> -};
> -
> -static int hp_wireless_input_setup(void)
> -{
> -	int err;
> -
> -	hpwl_input_dev = input_allocate_device();
> -	if (!hpwl_input_dev)
> -		return -ENOMEM;
> -
> -	hpwl_input_dev->name = "HP Wireless hotkeys";
> -	hpwl_input_dev->phys = "hpq6001/input0";
> -	hpwl_input_dev->id.bustype = BUS_HOST;
> -	hpwl_input_dev->evbit[0] = BIT(EV_KEY);
> -	set_bit(KEY_RFKILL, hpwl_input_dev->keybit);
> -
> -	err = input_register_device(hpwl_input_dev);
> -	if (err)
> -		goto err_free_dev;
> -
> -	return 0;
> -
> -err_free_dev:
> -	input_free_device(hpwl_input_dev);
> -	return err;
> -}
> -
> -static void hp_wireless_input_destroy(void)
> -{
> -	input_unregister_device(hpwl_input_dev);
> -}
> -
> -static void hpwl_notify(struct acpi_device *acpi_dev, u32 event)
> -{
> -	if (event != 0x80) {
> -		pr_info("Received unknown event (0x%x)\n", event);
> -		return;
> -	}
> -
> -	input_report_key(hpwl_input_dev, KEY_RFKILL, 1);
> -	input_sync(hpwl_input_dev);
> -	input_report_key(hpwl_input_dev, KEY_RFKILL, 0);
> -	input_sync(hpwl_input_dev);
> -}
> -
> -static int hpwl_add(struct acpi_device *device)
> -{
> -	int err;
> -
> -	err = hp_wireless_input_setup();
> -	if (err)
> -		pr_err("Failed to setup hp wireless hotkeys\n");
> -
> -	return err;
> -}
> -
> -static int hpwl_remove(struct acpi_device *device)
> -{
> -	hp_wireless_input_destroy();
> -	return 0;
> -}
> -
> -static struct acpi_driver hpwl_driver = {
> -	.name	= "hp-wireless",
> -	.owner	= THIS_MODULE,
> -	.ids	= hpwl_ids,
> -	.ops	= {
> -		.add	= hpwl_add,
> -		.remove	= hpwl_remove,
> -		.notify	= hpwl_notify,
> -	},
> -};
> -
> -module_acpi_driver(hpwl_driver);
> diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
> new file mode 100644
> index 000000000000..b010e4ca3383
> --- /dev/null
> +++ b/drivers/platform/x86/wireless-hotkey.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Airplane mode button for AMD, HP & Xiaomi laptops
> + *
> + *  Copyright (C) 2014-2017 Alex Hung <alex.hung@canonical.com>
> + *  Copyright (C) 2021 Advanced Micro Devices
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <acpi/acpi_bus.h>
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Alex Hung");
> +MODULE_ALIAS("acpi*:HPQ6001:*");
> +MODULE_ALIAS("acpi*:WSTADEF:*");
> +MODULE_ALIAS("acpi*:AMDI0051:*");
> +
> +static struct input_dev *wl_input_dev;
> +
> +static const struct acpi_device_id wl_ids[] = {
> +	{"HPQ6001", 0},
> +	{"WSTADEF", 0},
> +	{"AMDI0051", 0},
> +	{"", 0},
> +};
> +
> +static int wireless_input_setup(void)
> +{
> +	int err;
> +
> +	wl_input_dev = input_allocate_device();
> +	if (!wl_input_dev)
> +		return -ENOMEM;
> +
> +	wl_input_dev->name = "Wireless hotkeys";
> +	wl_input_dev->phys = "hpq6001/input0";
> +	wl_input_dev->id.bustype = BUS_HOST;
> +	wl_input_dev->evbit[0] = BIT(EV_KEY);
> +	set_bit(KEY_RFKILL, wl_input_dev->keybit);
> +
> +	err = input_register_device(wl_input_dev);
> +	if (err)
> +		goto err_free_dev;
> +
> +	return 0;
> +
> +err_free_dev:
> +	input_free_device(wl_input_dev);
> +	return err;
> +}
> +
> +static void wireless_input_destroy(void)
> +{
> +	input_unregister_device(wl_input_dev);
> +}
> +
> +static void wl_notify(struct acpi_device *acpi_dev, u32 event)
> +{
> +	if (event != 0x80) {
> +		pr_info("Received unknown event (0x%x)\n", event);
> +		return;
> +	}
> +
> +	input_report_key(wl_input_dev, KEY_RFKILL, 1);
> +	input_sync(wl_input_dev);
> +	input_report_key(wl_input_dev, KEY_RFKILL, 0);
> +	input_sync(wl_input_dev);
> +}
> +
> +static int wl_add(struct acpi_device *device)
> +{
> +	int err;
> +
> +	err = wireless_input_setup();
> +	if (err)
> +		pr_err("Failed to setup hp wireless hotkeys\n");
> +
> +	return err;
> +}
> +
> +static int wl_remove(struct acpi_device *device)
> +{
> +	wireless_input_destroy();
> +	return 0;
> +}
> +
> +static struct acpi_driver wl_driver = {
> +	.name	= "wireless-hotkey",
> +	.owner	= THIS_MODULE,
> +	.ids	= wl_ids,
> +	.ops	= {
> +		.add	= wl_add,
> +		.remove	= wl_remove,
> +		.notify	= wl_notify,
> +	},
> +};
> +
> +module_acpi_driver(wl_driver);
> 

