Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC19C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C18764E2C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhBCKtr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 05:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41817 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232865AbhBCKtq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 05:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612349299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HBwOEBX4yFSOtth9+CnfPFqdkq9CYcuop/GK31obPLM=;
        b=DG4JSZ+axRZNLsyVP4hsOe+BaxJdjqu1H4B1tF8BjZTj+3CWdhcfmeZbJ0qz8QiCl0KFRo
        ph0U+Kei81Cd5cKGhTIvg53y9PvrX0iyGHcvrrIPFKn4vTeI2KRUP5mugb8kr7aNi2cRcF
        yc0vcQeSDI+ZwQKcOMXaGpQ3v4mS2c4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-Ff70rxMYOs-qsXLJfOzo0w-1; Wed, 03 Feb 2021 05:48:17 -0500
X-MC-Unique: Ff70rxMYOs-qsXLJfOzo0w-1
Received: by mail-ej1-f72.google.com with SMTP id d15so11689978ejc.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 02:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HBwOEBX4yFSOtth9+CnfPFqdkq9CYcuop/GK31obPLM=;
        b=gtYZhAMGaP8Tbvxihe+Qr8MAkwFkGZLMtNvZhoGltTY84Iq7ta5aP+zxt7TfhVpFYu
         hhOqNUl+IPaG1+JgnpB8LPNR0m1uLXXA4U5TxaFZuczBYJ/bL04WuRohonawq4olykLb
         aLLV8OZKgM3NrJuRzeIc84Uht7qc2gE8R7plcENd1GMLZNl0WvxVOV4cgnWwGGqWu7dz
         ZlZZibkHQPtlLfytJd+HGCSvKvyzpJLcDSMM5SLF20aX+t6bJ8xO1SnEwsUIKflhcS1t
         Ze91S6/HFctKjmLr7vv9tGFxwaNFlfrXT2bBHANajYgcnORokgWqYTzqP8kWI2W/32oT
         9Hmg==
X-Gm-Message-State: AOAM531vWaoD6voy7UEeS9GDHZTUglkffBF1gt3gytgq6y3h7T2IQROk
        Ox8966rGS6NDMCmufMfuAeVZyIPkKOfJpUD/chvObnPZwRZG3pf+ALwUsKaxW+S544CQQjBRQUP
        CtdO+TZn3nr9iRUWt1knXNWqBsnLvyMXxp7fnNEK7jkezWJke23ZT2agHaKtvx7TEaSAYw116F1
        Jytp3Dh9U95g==
X-Received: by 2002:a50:fe18:: with SMTP id f24mr2226478edt.276.1612349296572;
        Wed, 03 Feb 2021 02:48:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwx9faP5MjedI9U0TPNLksrAiqHYuc8x7pRkd/hMWgBdXdDx9qaKU6qvGD3PXLdp7moNQJPkg==
X-Received: by 2002:a50:fe18:: with SMTP id f24mr2226465edt.276.1612349296307;
        Wed, 03 Feb 2021 02:48:16 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id x20sm812412ejv.66.2021.02.03.02.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:48:15 -0800 (PST)
Subject: Re: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if
 ACPI_WMI'
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com>
Date:   Wed, 3 Feb 2021 11:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/21 3:00 PM, Andy Shevchenko wrote:
> Surround WMI drivers by 'if ACPI_WMI' instead of depending
> each of them separately.

This does not cover all drivers which depend on ACPI_WMI; and in
for-next there is a new UV_SYSFS Kconfig symbol in the middle of
the block which you are surrounding with if ACPI_WMI .. endif
and that new Kconfig symbol does not depend on ACPI_WMI.

Admittedly I should have payed more attention when the UV_SYSFS
symbol was merged, but atm there is no real ordering in the
Kconfig symbols.

Personally I think having e.g. the non WMI and WMI based drivers
for say Asus laptops together makes more sense then grouping
the WMI drivers together.

I'm tempted to add a commit to for-next which just sorts everything
alphabetically. Doing so might cause conflicts, so doing it
close (but not too close) to the merge window seems like a good
time to do this.

What do you think (about just sorting all the symbols alphabetically) ?

Regards,

Hans



> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/Kconfig | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4a5798a0ce0c..288f8f82d796 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -37,9 +37,10 @@ config ACPI_WMI
>  	  It is safe to enable this driver even if your DSDT doesn't define
>  	  any ACPI-WMI devices.
>  
> +if ACPI_WMI
> +
>  config WMI_BMOF
>  	tristate "WMI embedded Binary MOF driver"
> -	depends on ACPI_WMI
>  	default ACPI_WMI
>  	help
>  	  Say Y here if you want to be able to read a firmware-embedded
> @@ -54,7 +55,6 @@ config ALIENWARE_WMI
>  	depends on ACPI
>  	depends on LEDS_CLASS
>  	depends on NEW_LEDS
> -	depends on ACPI_WMI
>  	help
>  	 This is a driver for controlling Alienware BIOS driven
>  	 features.  It exposes an interface for controlling the AlienFX
> @@ -64,7 +64,6 @@ config ALIENWARE_WMI
>  config HUAWEI_WMI
>  	tristate "Huawei WMI laptop extras driver"
>  	depends on ACPI_BATTERY
> -	depends on ACPI_WMI
>  	depends on INPUT
>  	select INPUT_SPARSEKMAP
>  	select LEDS_CLASS
> @@ -91,7 +90,6 @@ config UV_SYSFS
>  
>  config INTEL_WMI_SBL_FW_UPDATE
>  	tristate "Intel WMI Slim Bootloader firmware update signaling driver"
> -	depends on ACPI_WMI
>  	help
>  	  Say Y here if you want to be able to use the WMI interface to signal
>  	  Slim Bootloader to trigger update on next reboot.
> @@ -101,7 +99,6 @@ config INTEL_WMI_SBL_FW_UPDATE
>  
>  config INTEL_WMI_THUNDERBOLT
>  	tristate "Intel WMI thunderbolt force power driver"
> -	depends on ACPI_WMI
>  	help
>  	  Say Y here if you want to be able to use the WMI interface on select
>  	  systems to force the power control of Intel Thunderbolt controllers.
> @@ -112,22 +109,19 @@ config INTEL_WMI_THUNDERBOLT
>  	  be called intel-wmi-thunderbolt.
>  
>  config MXM_WMI
> -       tristate "WMI support for MXM Laptop Graphics"
> -       depends on ACPI_WMI
> +	tristate "WMI support for MXM Laptop Graphics"
>  	help
>            MXM is a standard for laptop graphics cards, the WMI interface
>  	  is required for switchable nvidia graphics machines
>  
>  config PEAQ_WMI
>  	tristate "PEAQ 2-in-1 WMI hotkey driver"
> -	depends on ACPI_WMI
>  	depends on INPUT
>  	help
>  	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
>  
>  config XIAOMI_WMI
>  	tristate "Xiaomi WMI key driver"
> -	depends on ACPI_WMI
>  	depends on INPUT
>  	help
>  	  Say Y here if you want to support WMI-based keys on Xiaomi notebooks.
> @@ -135,6 +129,8 @@ config XIAOMI_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called xiaomi-wmi.
>  
> +endif # ACPI_WMI
> +
>  config ACERHDF
>  	tristate "Acer Aspire One temperature and fan driver"
>  	depends on ACPI && THERMAL
> 

