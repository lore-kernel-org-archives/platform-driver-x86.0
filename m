Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AE2C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 09:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbiFVJ67 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbiFVJ65 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 05:58:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7827C39819
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655891935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1Li5yWCxy8hm+mUXLX90nC9xBeLtxFGP2iVdq9k3q7s=;
        b=eiumnQzU/eNr2/hz3pyJaf6panaqj16DOPkkUARWlXIAfKELHkEAwhgzQO8P6lrJHhP6uH
        NZ6141fRz8b7UXH4f+upNQ2GRGEqYjhbC3hZoI81pKuF5gY8CNqQAQO2EkRZ2KgbFRXpjT
        CW80XCEIim0N3HIUqta9QOmN3EIidTw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-clVtfI5MOGiMaPb6OVKCpQ-1; Wed, 22 Jun 2022 05:58:54 -0400
X-MC-Unique: clVtfI5MOGiMaPb6OVKCpQ-1
Received: by mail-ed1-f70.google.com with SMTP id g7-20020a056402424700b00435ac9c7a8bso1080974edb.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1Li5yWCxy8hm+mUXLX90nC9xBeLtxFGP2iVdq9k3q7s=;
        b=6ssqX+mvQ6FcL5G7pp1PX9ONUAEvc1UeRhic764Jc+IZ3K49Bv9IVfOoQohGrdcadM
         XcDXtvQ5Encepzey148qrtNbTeMqwXfyUjjEv2dQh6lZq8+R1J1iGIGL1mmWMO+ZCVw1
         pvoi0Zze6naqLqX7WEQZNox0Tv8LPpQujgqOsD6WdNLU89FGvb0DAphD8cCWLN0y+vlv
         f/o2bKMNo0bb3cj20YPa2WBbVwDPcX8j8x/cP+4n/VIovMWrbpwRi2sja3Zm1oLLxKyZ
         jQ7ZZcGh9og2e4V28/GzDjmJKg4jh6wk+GJf59XDlxFrfqVcFJqt4zNsoFrkvFca127q
         YrPA==
X-Gm-Message-State: AJIora+kfxET0LTKQHxqvOyfpkccfHlbUMIVmvTtJSKc+xMj/LOREcnW
        qk3+alnf1FVV+PR0+qkdSIyOHpQsHYuzXt4RHLgzaWTxlZmIYYVi+5aDVuKjqCFjlsu8qGl26ma
        x09zlxrH/P4psjwFTxCyX0wTsmxgUMWqKBQ==
X-Received: by 2002:a17:906:2252:b0:711:d2e6:9e7e with SMTP id 18-20020a170906225200b00711d2e69e7emr2514255ejr.161.1655891932847;
        Wed, 22 Jun 2022 02:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSQQY/QSXTBvh/gQBcYC1DHyX02KVvQ7xJn9BhjQEHPnAENhQR5pykJgJ56V2uwrQ2FhFAIw==
X-Received: by 2002:a17:906:2252:b0:711:d2e6:9e7e with SMTP id 18-20020a170906225200b00711d2e69e7emr2514230ejr.161.1655891932586;
        Wed, 22 Jun 2022 02:58:52 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906169200b00705976bcd01sm8779665ejd.206.2022.06.22.02.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:58:51 -0700 (PDT)
Message-ID: <a14ba197-c484-8b7d-fcb2-cfad1a85dba7@redhat.com>
Date:   Wed, 22 Jun 2022 11:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] platform/x86: Move AMD platform drivers to separate
 directory
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
        andy.shevchenko@gmail.com,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>
References: <20220608193212.2827257-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220608193212.2827257-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/8/22 21:32, Shyam Sundar S K wrote:
> Currently, AMD supported platform drivers are grouped under generic "x86"
> folder structure. Move the current drivers (amd-pmc and amd_hsmp) to a
> separate directory. This would also mean the newer driver submissions to
> pdx86 subsystem in the future will also land in AMD specific directory.
> 
> Reviewed-by: Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
> Tested-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
> v3:
>  - Address collision problem when module with same name is used.
> 
> v2:
>  - drop "amd" prefix from the file names
> 
>  MAINTAINERS                                   |  4 +--
>  drivers/platform/x86/Kconfig                  | 27 +---------------
>  drivers/platform/x86/Makefile                 |  3 +-
>  drivers/platform/x86/amd/Kconfig              | 31 +++++++++++++++++++
>  drivers/platform/x86/amd/Makefile             | 11 +++++++
>  .../platform/x86/{amd_hsmp.c => amd/hsmp.c}   |  0
>  drivers/platform/x86/{amd-pmc.c => amd/pmc.c} |  0
>  7 files changed, 46 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/Kconfig
>  create mode 100644 drivers/platform/x86/amd/Makefile
>  rename drivers/platform/x86/{amd_hsmp.c => amd/hsmp.c} (100%)
>  rename drivers/platform/x86/{amd-pmc.c => amd/pmc.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6d3bd9d2a8d..2a34deb24594 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -996,7 +996,7 @@ AMD PMC DRIVER
>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/amd-pmc.*
> +F:	drivers/platform/x86/amd/pmc.c
>  
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> @@ -1006,7 +1006,7 @@ S:	Maintained
>  F:	Documentation/x86/amd_hsmp.rst
>  F:	arch/x86/include/asm/amd_hsmp.h
>  F:	arch/x86/include/uapi/asm/amd_hsmp.h
> -F:	drivers/platform/x86/amd_hsmp.c
> +F:	drivers/platform/x86/amd/hsmp.c
>  
>  AMD POWERPLAY AND SWSMU
>  M:	Evan Quan <evan.quan@amd.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f08ad85683cb..b1879980ce2e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -196,32 +196,7 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> -config AMD_PMC
> -	tristate "AMD SoC PMC driver"
> -	depends on ACPI && PCI && RTC_CLASS
> -	help
> -	  The driver provides support for AMD Power Management Controller
> -	  primarily responsible for S2Idle transactions that are driven from
> -	  a platform firmware running on SMU. This driver also provides a debug
> -	  mechanism to investigate the S2Idle transactions and failures.
> -
> -	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
> -
> -	  If you choose to compile this driver as a module the module will be
> -	  called amd-pmc.
> -
> -config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64
> -	help
> -	  The driver provides a way for user space tools to monitor and manage
> -	  system management functionality on EPYC server CPUs from AMD.
> -
> -	  Host System Management Port (HSMP) interface is a mailbox interface
> -	  between the x86 core and the System Management Unit (SMU) firmware.
> -
> -	  If you choose to compile this driver as a module the module will be
> -	  called amd_hsmp.
> +source "drivers/platform/x86/amd/Kconfig"
>  
>  config ADV_SWBUTTON
>  	tristate "Advantech ACPI Software Button Driver"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 4a59f47a46e2..48abfe50aaf5 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -23,8 +23,7 @@ obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>  
>  # AMD
> -obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> +obj-y				+= amd/
>  
>  # Advantech
>  obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> new file mode 100644
> index 000000000000..c0d0a3c5170c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# AMD x86 Platform Specific Drivers
> +#
> +
> +config AMD_PMC
> +	tristate "AMD SoC PMC driver"
> +	depends on ACPI && PCI && RTC_CLASS
> +	help
> +	  The driver provides support for AMD Power Management Controller
> +	  primarily responsible for S2Idle transactions that are driven from
> +	  a platform firmware running on SMU. This driver also provides a debug
> +	  mechanism to investigate the S2Idle transactions and failures.
> +
> +	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd-pmc.
> +
> +config AMD_HSMP
> +	tristate "AMD HSMP Driver"
> +	depends on AMD_NB && X86_64
> +	help
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC server CPUs from AMD.
> +
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> new file mode 100644
> index 000000000000..a36688653203
> --- /dev/null
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for drivers/platform/x86/amd
> +# AMD x86 Platform-Specific Drivers
> +#
> +
> +amd-pmc-y			:= pmc.o
> +obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
> +amd_hsmp-y			:= hsmp.o
> +obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> +
> diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd/hsmp.c
> similarity index 100%
> rename from drivers/platform/x86/amd_hsmp.c
> rename to drivers/platform/x86/amd/hsmp.c
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd/pmc.c
> similarity index 100%
> rename from drivers/platform/x86/amd-pmc.c
> rename to drivers/platform/x86/amd/pmc.c

