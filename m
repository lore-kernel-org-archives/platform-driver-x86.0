Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBE8C001E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Jul 2023 10:48:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjGaKrx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Jul 2023 06:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjGaKrt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jul 2023 06:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F011DE59
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690800420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mI5wUOEnZT5MMbC9DqxmGyKMLKWx0FpMXmr9pHBPoMo=;
        b=WMhzX+Nu+9SNC721+T37pcxA3BIQlgA57Y3ULZpuMmbeWoh8T/qJFgvGybXYfscmxtDye+
        EHT9ZehtU5VjTyytM2pcZK6mXSAdlwJOT2tA4dzB20UHN1R6kXcnVHgSDrCTZHigtiBDuO
        4iR3rnZWIF2jA9ybePoOzpv+PpQgMIc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-kIJYSnuoNjma2TULNn2w9A-1; Mon, 31 Jul 2023 06:46:59 -0400
X-MC-Unique: kIJYSnuoNjma2TULNn2w9A-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b9b2fb9770so38985811fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 03:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690800418; x=1691405218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mI5wUOEnZT5MMbC9DqxmGyKMLKWx0FpMXmr9pHBPoMo=;
        b=lcC9gZLrcxxn8g8OpAmDORkuQS4POYKFUX4Z3Rrv963AmkXmTuZfnqk8xhtQvuNIl6
         ac/52Vy36LiJVfyreBovuaMlx5nwTVI6M4D6QMS7Ow09Em6bxaBzir2waKDE/8PWJPFj
         bgURpYEpSaCri0ASYFFTYQGs/QcGX+0/bHDcadRE8iFSFc0BAfeA7M5bwtE16LMCwsi3
         sdOkN8nlCt43uatUCMDHew/hGjrdQxcdNhLbnf4jczlK+jA6DE5g2OdTMf06AlP6TZFf
         psaPPvgW767F1xN0uUp51sHlneGrYhdjUmJWKQ5/tm7qk1cYfBpP0Up6K3pfjXPeZDST
         2U8A==
X-Gm-Message-State: ABy/qLaV6TbeM5zl0IgR52dKw9owZ33sIzjRkAy+1aKlojKGCd7Pfojt
        ULMHnPk2C6DFsfD1VuJrbahBJU7Q+3hydGqUJSw3lWqIRWGorDOE9BM97UPuwISqapEAid7KH0R
        TP4HUlb2s/np8A567ZFGpyCQXuNM5QesXbg==
X-Received: by 2002:a2e:80c5:0:b0:2b9:ee3e:240b with SMTP id r5-20020a2e80c5000000b002b9ee3e240bmr1129321ljg.41.1690800417701;
        Mon, 31 Jul 2023 03:46:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHcXUe3wE+uQC1mdFXAZd/fTs7afCX1RT6gv70TGoakC/qgwTeUPzG9yZlbaQEaKty2GNFOnw==
X-Received: by 2002:a2e:80c5:0:b0:2b9:ee3e:240b with SMTP id r5-20020a2e80c5000000b002b9ee3e240bmr1129302ljg.41.1690800417231;
        Mon, 31 Jul 2023 03:46:57 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709064f1a00b0099bd86f9248sm5983673eju.63.2023.07.31.03.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 03:46:56 -0700 (PDT)
Message-ID: <befb4205-2457-1e9f-1722-c583642a6607@redhat.com>
Date:   Mon, 31 Jul 2023 12:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] platform/x86: Move all simatic ipc drivers to the
 subdirectory siemens
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tobias Schaffner <tobias.schaffner@siemens.com>
References: <20230719153518.13073-1-henning.schild@siemens.com>
 <20230719153518.13073-4-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230719153518.13073-4-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/19/23 17:35, Henning Schild wrote:
> With more files around move everything to a subdirectory. Users will
> only see the several options once they enable the main one.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Thank you, I have merged this entire series into
the platform-drivers-x86-simatic-ipc branch now:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-simatic-ipc

I did make 2 small changes to patch 3/3 while merging:

1. Only decend into the siemens subdir if CONFIG_SIEMENS_SIMATIC_IPC is set:

--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -131,7 +131,7 @@ obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
 obj-$(CONFIG_X86_INTEL_LPSS)		+= pmc_atom.o
 
 # Siemens Simatic Industrial PCs
-obj-y					+= siemens/
+obj-$(CONFIG_SIEMENS_SIMATIC_IPC)	+= siemens/
 
 # Winmate
 obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o

2. Move the "default SIEMENS_SIMATIC_IPC*" lines to directly under
the "tristate ..." lines as suggested by Andy.

Note it will show up there once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
merged into the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






> ---
>  drivers/platform/x86/Kconfig                  | 59 +----------------
>  drivers/platform/x86/Makefile                 |  6 +-
>  drivers/platform/x86/siemens/Kconfig          | 63 +++++++++++++++++++
>  drivers/platform/x86/siemens/Makefile         | 11 ++++
>  .../simatic-ipc-batt-apollolake.c             |  0
>  .../simatic-ipc-batt-elkhartlake.c            |  0
>  .../{ => siemens}/simatic-ipc-batt-f7188x.c   |  0
>  .../x86/{ => siemens}/simatic-ipc-batt.c      |  0
>  .../x86/{ => siemens}/simatic-ipc-batt.h      |  0
>  .../platform/x86/{ => siemens}/simatic-ipc.c  |  0
>  10 files changed, 76 insertions(+), 63 deletions(-)
>  create mode 100644 drivers/platform/x86/siemens/Kconfig
>  create mode 100644 drivers/platform/x86/siemens/Makefile
>  rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt-apollolake.c (100%)
>  rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt-elkhartlake.c (100%)
>  rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt-f7188x.c (100%)
>  rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt.c (100%)
>  rename drivers/platform/x86/{ => siemens}/simatic-ipc-batt.h (100%)
>  rename drivers/platform/x86/{ => siemens}/simatic-ipc.c (100%)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 487d3d8f4da9..f5fcb1ca1b63 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1074,64 +1074,7 @@ config INTEL_SCU_IPC_UTIL
>  	  low level access for debug work and updating the firmware. Say
>  	  N unless you will be doing this on an Intel MID platform.
>  
> -config SIEMENS_SIMATIC_IPC
> -	tristate "Siemens Simatic IPC Class driver"
> -	help
> -	  This Simatic IPC class driver is the central of several drivers. It
> -	  is mainly used for system identification, after which drivers in other
> -	  classes will take care of driving specifics of those machines.
> -	  i.e. LEDs and watchdog.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called simatic-ipc.
> -
> -config SIEMENS_SIMATIC_IPC_BATT
> -	tristate "CMOS battery driver for Siemens Simatic IPCs"
> -	depends on HWMON
> -	depends on SIEMENS_SIMATIC_IPC
> -	default SIEMENS_SIMATIC_IPC
> -	help
> -	  This option enables support for monitoring the voltage of the CMOS
> -	  batteries of several Industrial PCs from Siemens.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called simatic-ipc-batt.
> -
> -config SIEMENS_SIMATIC_IPC_BATT_APOLLOLAKE
> -	tristate "CMOS Battery monitoring for Simatic IPCs based on Apollo Lake GPIO"
> -	depends on PINCTRL_BROXTON
> -	depends on SIEMENS_SIMATIC_IPC_BATT
> -	default SIEMENS_SIMATIC_IPC_BATT
> -	help
> -	  This option enables CMOS battery monitoring for Simatic Industrial PCs
> -	  from Siemens based on Apollo Lake GPIO.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called simatic-ipc-batt-apollolake.
> -
> -config SIEMENS_SIMATIC_IPC_BATT_ELKHARTLAKE
> -	tristate "CMOS Battery monitoring for Simatic IPCs based on Elkhart Lake GPIO"
> -	depends on PINCTRL_ELKHARTLAKE
> -	depends on SIEMENS_SIMATIC_IPC_BATT
> -	default SIEMENS_SIMATIC_IPC_BATT
> -	help
> -	  This option enables CMOS battery monitoring for Simatic Industrial PCs
> -	  from Siemens based on Elkhart Lake GPIO.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called simatic-ipc-batt-elkhartlake.
> -
> -config SIEMENS_SIMATIC_IPC_BATT_F7188X
> -	tristate "CMOS Battery monitoring for Simatic IPCs based on Nuvoton GPIO"
> -	depends on GPIO_F7188X
> -	depends on SIEMENS_SIMATIC_IPC_BATT
> -	default SIEMENS_SIMATIC_IPC_BATT
> -	help
> -	  This option enables CMOS battery monitoring for Simatic Industrial PCs
> -	  from Siemens based on Nuvoton GPIO.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called simatic-ipc-batt-elkhartlake.
> +source "drivers/platform/x86/siemens/Kconfig"
>  
>  config WINMATE_FM07_KEYS
>  	tristate "Winmate FM07/FM07P front-panel keys driver"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 522da0d1584d..d4a6c18d0dde 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -131,11 +131,7 @@ obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
>  obj-$(CONFIG_X86_INTEL_LPSS)		+= pmc_atom.o
>  
>  # Siemens Simatic Industrial PCs
> -obj-$(CONFIG_SIEMENS_SIMATIC_IPC)			+= simatic-ipc.o
> -obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT)			+= simatic-ipc-batt.o
> -obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT_APOLLOLAKE)	+= simatic-ipc-batt-apollolake.o
> -obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT_ELKHARTLAKE)	+= simatic-ipc-batt-elkhartlake.o
> -obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT_F7188X)		+= simatic-ipc-batt-f7188x.o
> +obj-y					+= siemens/
>  
>  # Winmate
>  obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
> diff --git a/drivers/platform/x86/siemens/Kconfig b/drivers/platform/x86/siemens/Kconfig
> new file mode 100644
> index 000000000000..8e78dc609a38
> --- /dev/null
> +++ b/drivers/platform/x86/siemens/Kconfig
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Siemens X86 Platform Specific Drivers
> +#
> +
> +config SIEMENS_SIMATIC_IPC
> +	tristate "Siemens Simatic IPC Class driver"
> +	help
> +	  This Simatic IPC class driver is the central of several drivers. It
> +	  is mainly used for system identification, after which drivers in other
> +	  classes will take care of driving specifics of those machines.
> +	  i.e. LEDs and watchdog.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc.
> +
> +config SIEMENS_SIMATIC_IPC_BATT
> +	tristate "CMOS battery driver for Siemens Simatic IPCs"
> +	depends on HWMON
> +	depends on SIEMENS_SIMATIC_IPC
> +	default SIEMENS_SIMATIC_IPC
> +	help
> +	  This option enables support for monitoring the voltage of the CMOS
> +	  batteries of several Industrial PCs from Siemens.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-batt.
> +
> +config SIEMENS_SIMATIC_IPC_BATT_APOLLOLAKE
> +	tristate "CMOS Battery monitoring for Simatic IPCs based on Apollo Lake GPIO"
> +	depends on PINCTRL_BROXTON
> +	depends on SIEMENS_SIMATIC_IPC_BATT
> +	default SIEMENS_SIMATIC_IPC_BATT
> +	help
> +	  This option enables CMOS battery monitoring for Simatic Industrial PCs
> +	  from Siemens based on Apollo Lake GPIO.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-batt-apollolake.
> +
> +config SIEMENS_SIMATIC_IPC_BATT_ELKHARTLAKE
> +	tristate "CMOS Battery monitoring for Simatic IPCs based on Elkhart Lake GPIO"
> +	depends on PINCTRL_ELKHARTLAKE
> +	depends on SIEMENS_SIMATIC_IPC_BATT
> +	default SIEMENS_SIMATIC_IPC_BATT
> +	help
> +	  This option enables CMOS battery monitoring for Simatic Industrial PCs
> +	  from Siemens based on Elkhart Lake GPIO.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-batt-elkhartlake.
> +
> +config SIEMENS_SIMATIC_IPC_BATT_F7188X
> +	tristate "CMOS Battery monitoring for Simatic IPCs based on Nuvoton GPIO"
> +	depends on GPIO_F7188X
> +	depends on SIEMENS_SIMATIC_IPC_BATT
> +	default SIEMENS_SIMATIC_IPC_BATT
> +	help
> +	  This option enables CMOS battery monitoring for Simatic Industrial PCs
> +	  from Siemens based on Nuvoton GPIO.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called simatic-ipc-batt-elkhartlake.
> diff --git a/drivers/platform/x86/siemens/Makefile b/drivers/platform/x86/siemens/Makefile
> new file mode 100644
> index 000000000000..2b384b4cb8ba
> --- /dev/null
> +++ b/drivers/platform/x86/siemens/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/x86/siemens
> +# Siemens x86 Platform-Specific Drivers
> +#
> +
> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC)			+= simatic-ipc.o
> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT)			+= simatic-ipc-batt.o
> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT_APOLLOLAKE)	+= simatic-ipc-batt-apollolake.o
> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT_ELKHARTLAKE)	+= simatic-ipc-batt-elkhartlake.o
> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC_BATT_F7188X)		+= simatic-ipc-batt-f7188x.o
> diff --git a/drivers/platform/x86/simatic-ipc-batt-apollolake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> similarity index 100%
> rename from drivers/platform/x86/simatic-ipc-batt-apollolake.c
> rename to drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> diff --git a/drivers/platform/x86/simatic-ipc-batt-elkhartlake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> similarity index 100%
> rename from drivers/platform/x86/simatic-ipc-batt-elkhartlake.c
> rename to drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> diff --git a/drivers/platform/x86/simatic-ipc-batt-f7188x.c b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> similarity index 100%
> rename from drivers/platform/x86/simatic-ipc-batt-f7188x.c
> rename to drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> diff --git a/drivers/platform/x86/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> similarity index 100%
> rename from drivers/platform/x86/simatic-ipc-batt.c
> rename to drivers/platform/x86/siemens/simatic-ipc-batt.c
> diff --git a/drivers/platform/x86/simatic-ipc-batt.h b/drivers/platform/x86/siemens/simatic-ipc-batt.h
> similarity index 100%
> rename from drivers/platform/x86/simatic-ipc-batt.h
> rename to drivers/platform/x86/siemens/simatic-ipc-batt.h
> diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
> similarity index 100%
> rename from drivers/platform/x86/simatic-ipc.c
> rename to drivers/platform/x86/siemens/simatic-ipc.c

