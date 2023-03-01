Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2962CC6FA9D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 18:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjCASFH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 13:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjCASFG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 13:05:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A722B19B4
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 10:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677693847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uA8mWRzcawb/iOY8VKGaSF2wpTCNVoY22nH9W3NUYis=;
        b=LTDzlUa/4rDt12D9/PeFv6EI/bOWiydv43ow65pGan9D5P/upSSS7sphxo4Fx/KBjNphBh
        gBHxvAjOFvQJCt7F2zw5mayrdCRJbyNbaQAJJxdzqCeZaoHPqYdWiIU6MGHe/z0t43Ldpd
        abU2+n9c3F3mTd8mZQPE/CLlEHjtc+0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-i3Cx0KofPeeUOR57EzlefQ-1; Wed, 01 Mar 2023 13:04:06 -0500
X-MC-Unique: i3Cx0KofPeeUOR57EzlefQ-1
Received: by mail-ed1-f72.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so20070669edc.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 10:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uA8mWRzcawb/iOY8VKGaSF2wpTCNVoY22nH9W3NUYis=;
        b=sNzA11cQXTCtCfhNn9eFf6mwAf3DHVIY53dsTC+0lPUauGdIGLFz8KplRWkX6XtwD7
         m4Z6JsAg9tzSOqyDc9R8/jcZwkWQNUPh5iVxEBN+UHuoLIOKab+2L/1/IIrqK19lYAoF
         IPlVu5YyA6cr8p/5Bow5RuRWrIjck77KDdolhGehkyV+sSIU9X+9cvs76vr8Qe6MBlbY
         eGsf0XeRFAUYrlgP6BYWaLqthDj55tcoQFHCzFtPVu0khM7in75oZ0HHb3WDu7Uvgs/5
         rxSt+HFZNAgBD5Soc9bIxYVlyKgBgdw8RcUjuAnRgCgi09XGIf781xNFiDNy85q/IXpJ
         O1Uw==
X-Gm-Message-State: AO0yUKXZ/GhC/JaEj5ehPaIRCdSxFzVqaW4zx7ucISXyqrU9oANcYpBU
        Sd60lxJ5rNff9vk3aWtZZjrxJi/6wVkA4xynutbF98/GmNlaZFygo2ejwXGfa8LFjgKFQXr93pT
        IjvJbu3zQhtwrV0WnkGg4dV/Ko7Jd6/DGnA==
X-Received: by 2002:aa7:dd48:0:b0:4ac:c7b3:8c27 with SMTP id o8-20020aa7dd48000000b004acc7b38c27mr8167249edw.28.1677693843453;
        Wed, 01 Mar 2023 10:04:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+PtM7Aa8tqwMX79Nfl7KklBegm+cAn5HXFitwmc2FnblzIp711z1qVJwfpjLWXQCD/ZuAkhg==
X-Received: by 2002:aa7:dd48:0:b0:4ac:c7b3:8c27 with SMTP id o8-20020aa7dd48000000b004acc7b38c27mr8167223edw.28.1677693843132;
        Wed, 01 Mar 2023 10:04:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fy21-20020a170906b7d500b008cda6560404sm6039385ejb.193.2023.03.01.10.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 10:04:02 -0800 (PST)
Message-ID: <a6281345-95e1-3e8d-b6fb-146c1852373f@redhat.com>
Date:   Wed, 1 Mar 2023 19:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] leds: simatic-ipc-leds-gpio: introduce more
 Kconfig switches
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230301170215.23382-1-henning.schild@siemens.com>
 <20230301170215.23382-4-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230301170215.23382-4-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 18:02, Henning Schild wrote:
> To describe the dependency chain better and allow for potential
> fine-grained config tuning, introduce Kconfig switch for the individual
> GPIO based drivers.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  drivers/leds/simple/Kconfig  | 31 ++++++++++++++++++++++++++++---
>  drivers/leds/simple/Makefile |  7 +++----
>  2 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
> index fd2b8225d926..44fa0f93cb3b 100644
> --- a/drivers/leds/simple/Kconfig
> +++ b/drivers/leds/simple/Kconfig
> @@ -1,11 +1,36 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config LEDS_SIEMENS_SIMATIC_IPC
>  	tristate "LED driver for Siemens Simatic IPCs"
> -	depends on LEDS_GPIO

Since it is simatic-ipc-leds-gpio-core.c which actually registers
the LEDs GPIO platform device, this one should stay IMHO.


>  	depends on SIEMENS_SIMATIC_IPC
>  	help
>  	  This option enables support for the LEDs of several Industrial PCs
>  	  from Siemens.
>  
> -	  To compile this driver as a module, choose M here: the modules
> -	  will be called simatic-ipc-leds and simatic-ipc-leds-gpio.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-leds.
> +
> +config LEDS_SIEMENS_SIMATIC_IPC_APOLLOLAKE
> +	tristate "LED driver for Siemens Simatic IPCs based on Intel Apollo Lake GPIO"
> +	depends on LEDS_GPIO

And then it can be dropped here.

> +	depends on PINCTRL_BROXTON

> +	depends on SIEMENS_SIMATIC_IPC

This should be "depends on LEDS_SIEMENS_SIMATIC_IPC" since it
actually uses symbol from that module.

> +	default LEDS_SIEMENS_SIMATIC_IPC
> +	help
> +	  This option enables support for the LEDs of several Industrial PCs
> +	  from Siemens based on Apollo Lake GPIO i.e. IPC127E.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-leds-gpio-apollolake.
> +
> +config LEDS_SIEMENS_SIMATIC_IPC_F7188X
> +	tristate "LED driver for Siemens Simatic IPCs based on Nuvoton GPIO"
> +	depends on LEDS_GPIO

Idem.

> +	depends on GPIO_F7188X
> +	depends on SIEMENS_SIMATIC_IPC

Idem.

> +	default LEDS_SIEMENS_SIMATIC_IPC
> +	help
> +	  This option enables support for the LEDs of several Industrial PCs
> +	  from Siemens based on Nuvoton GPIO i.e. IPC227G.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-leds-gpio-f7188x.
> diff --git a/drivers/leds/simple/Makefile b/drivers/leds/simple/Makefile
> index ed9057f7b6da..e3e840cea275 100644
> --- a/drivers/leds/simple/Makefile
> +++ b/drivers/leds/simple/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)  += simatic-ipc-leds-gpio-core.o
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds-gpio-apollolake.o
> -obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds-gpio-f7188x.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)			+= simatic-ipc-leds.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC_APOLLOLAKE)	+= simatic-ipc-leds-gpio-core.o simatic-ipc-leds-gpio-apollolake.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC_F7188X)		+= simatic-ipc-leds-gpio-core.o simatic-ipc-leds-gpio-f7188x.o

Regards,

Hans

