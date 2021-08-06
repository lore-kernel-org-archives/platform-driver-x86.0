Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D096C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E56D1606A5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 13:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbhHFNqn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Aug 2021 09:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26892 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344426AbhHFNqn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 09:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628257587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tkRZHy+UnHcFcZ4UB+Q0GKhpBG9r25ysyKZ/X0+Phko=;
        b=Z7PHwQ9kPkJZLitFZ5nIEAxcUyLOqCo5gsKKymkDZxH3b7QMdsU2wp3ntKoRkQegNXjMdd
        3r8tSv25saHcwjAJtORWqgkzkkjzMXEAXuj2he9Ahil4L9i9jJjkovaSVU0twVIDMlXdvF
        RcvS4+TZfEVRlbHCugVfxsiWU+OYHQw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-J6ut7d_PPtGV6hRfNFMnkw-1; Fri, 06 Aug 2021 09:46:26 -0400
X-MC-Unique: J6ut7d_PPtGV6hRfNFMnkw-1
Received: by mail-ed1-f71.google.com with SMTP id d12-20020a50fe8c0000b02903a4b519b413so4952971edt.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Aug 2021 06:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tkRZHy+UnHcFcZ4UB+Q0GKhpBG9r25ysyKZ/X0+Phko=;
        b=LTgwVkPPw+GEwOgcl8tnJk2C+Lvt4qbRXhNCOnF+EvaLQHOrTVA8UKWbLG4RPU3AH8
         /BpmevfiCLeb6+GKydcWSfjCkK+5cmycavQsKhiEb4BRA8tV+yy+/4XC0WdzFOxIraaj
         9dsNEJMp+hY+8K2vKZW67noSD7EasK6oN4kyQHwW4xkCxxbN4ap6J1vBGwtTyjSR1fbO
         pWx4v05Sn7dZZzZ6lgpAS5pOxyOAJ93b68dKZvvXMOUOb3LR4zZ5gx2M6xnXgDM1m5Yt
         JRwEsKj+EPO8mBjAKXxCBiefCsM8rOaVKkhNiYV25wcEk6ZPrfx/EkSU95dbgweqqmtx
         mfIQ==
X-Gm-Message-State: AOAM530xwbylh/qQYGdkOZJfsOd0BTkDaZeWYDkAc8YLQ23w6zBRqSXH
        zGuydYthS9UG+I2osvZd3jMMg0RDH/kDC5mjFlyxhdmkaEmqis7X98Rl41j8Ps/HQHEDBtZOWhN
        xPiM1IVEFhqM6A/RjKDQzR+XeI1vR16JRAw==
X-Received: by 2002:a17:906:5e45:: with SMTP id b5mr9883156eju.301.1628257584813;
        Fri, 06 Aug 2021 06:46:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUOH4aEgGALRmgcgIWTHj48XrR1zdrzSgKPxyK/q4ZLdRVn2mMbMC9U44/xlLTBh7sSd8sqA==
X-Received: by 2002:a17:906:5e45:: with SMTP id b5mr9883139eju.301.1628257584660;
        Fri, 06 Aug 2021 06:46:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j11sm2378198edr.49.2021.08.06.06.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 06:46:24 -0700 (PDT)
Subject: Re: [RFT, PATCH v1 1/1] platform/x86: dell-smo8800: Convert to be a
 platform driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <20210803194039.35083-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3f7cfce8-0c05-1b02-86c9-995199185541@redhat.com>
Date:   Fri, 6 Aug 2021 15:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803194039.35083-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/3/21 9:40 PM, Andy Shevchenko wrote:
> ACPI core in conjunction with platform driver core provides
> an infrastructure to enumerate ACPI devices. Use it in order
> to remove a lot of boilerplate code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  drivers/platform/x86/dell/Kconfig        |  2 +-
>  drivers/platform/x86/dell/dell-smo8800.c | 74 ++++++------------------
>  2 files changed, 20 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 9e7314d90bea..821aba31821c 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -140,7 +140,7 @@ config DELL_SMBIOS_SMM
>  config DELL_SMO8800
>  	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
>  	default m
> -	depends on ACPI
> +	depends on ACPI || COMPILE_TEST
>  	help
>  	  Say Y here if you want to support SMO88XX freefall devices
>  	  on Dell Latitude laptops.
> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> index 5d9304a7de1b..3385e852104c 100644
> --- a/drivers/platform/x86/dell/dell-smo8800.c
> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> @@ -10,13 +10,14 @@
>  
>  #define DRIVER_NAME "smo8800"
>  
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/acpi.h>
> +#include <linux/fs.h>
>  #include <linux/interrupt.h>
> +#include <linux/kernel.h>
>  #include <linux/miscdevice.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/uaccess.h>
> -#include <linux/fs.h>
>  
>  struct smo8800_device {
>  	u32 irq;                     /* acpi device irq */
> @@ -44,37 +45,6 @@ static irqreturn_t smo8800_interrupt_thread(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static acpi_status smo8800_get_resource(struct acpi_resource *resource,
> -					void *context)
> -{
> -	struct acpi_resource_extended_irq *irq;
> -
> -	if (resource->type != ACPI_RESOURCE_TYPE_EXTENDED_IRQ)
> -		return AE_OK;
> -
> -	irq = &resource->data.extended_irq;
> -	if (!irq || !irq->interrupt_count)
> -		return AE_OK;
> -
> -	*((u32 *)context) = irq->interrupts[0];
> -	return AE_CTRL_TERMINATE;
> -}
> -
> -static u32 smo8800_get_irq(struct acpi_device *device)
> -{
> -	u32 irq = 0;
> -	acpi_status status;
> -
> -	status = acpi_walk_resources(device->handle, METHOD_NAME__CRS,
> -				     smo8800_get_resource, &irq);
> -	if (ACPI_FAILURE(status)) {
> -		dev_err(&device->dev, "acpi_walk_resources failed\n");
> -		return 0;
> -	}
> -
> -	return irq;
> -}
> -
>  static ssize_t smo8800_misc_read(struct file *file, char __user *buf,
>  				 size_t count, loff_t *pos)
>  {
> @@ -136,7 +106,7 @@ static const struct file_operations smo8800_misc_fops = {
>  	.release = smo8800_misc_release,
>  };
>  
> -static int smo8800_add(struct acpi_device *device)
> +static int smo8800_probe(struct platform_device *device)
>  {
>  	int err;
>  	struct smo8800_device *smo8800;
> @@ -160,14 +130,12 @@ static int smo8800_add(struct acpi_device *device)
>  		return err;
>  	}
>  
> -	device->driver_data = smo8800;
> +	platform_set_drvdata(device, smo8800);
>  
> -	smo8800->irq = smo8800_get_irq(device);
> -	if (!smo8800->irq) {
> -		dev_err(&device->dev, "failed to obtain IRQ\n");
> -		err = -EINVAL;
> +	err = platform_get_irq(device, 0);
> +	if (err < 0)
>  		goto error;
> -	}
> +	smo8800->irq = err;
>  
>  	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
>  				   smo8800_interrupt_thread,
> @@ -189,9 +157,9 @@ static int smo8800_add(struct acpi_device *device)
>  	return err;
>  }
>  
> -static int smo8800_remove(struct acpi_device *device)
> +static int smo8800_remove(struct platform_device *device)
>  {
> -	struct smo8800_device *smo8800 = device->driver_data;
> +	struct smo8800_device *smo8800 = platform_get_drvdata(device);
>  
>  	free_irq(smo8800->irq, smo8800);
>  	misc_deregister(&smo8800->miscdev);
> @@ -211,21 +179,17 @@ static const struct acpi_device_id smo8800_ids[] = {
>  	{ "SMO8831", 0 },
>  	{ "", 0 },
>  };
> -
>  MODULE_DEVICE_TABLE(acpi, smo8800_ids);
>  
> -static struct acpi_driver smo8800_driver = {
> -	.name = DRIVER_NAME,
> -	.class = "Latitude",
> -	.ids = smo8800_ids,
> -	.ops = {
> -		.add = smo8800_add,
> -		.remove = smo8800_remove,
> +static struct platform_driver smo8800_driver = {
> +	.probe = smo8800_probe,
> +	.remove = smo8800_remove,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.acpi_match_table = smo8800_ids,
>  	},
> -	.owner = THIS_MODULE,
>  };
> -
> -module_acpi_driver(smo8800_driver);
> +module_platform_driver(smo8800_driver);
>  
>  MODULE_DESCRIPTION("Dell Latitude freefall driver (ACPI SMO88XX)");
>  MODULE_LICENSE("GPL");
> 

