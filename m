Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C54C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 13:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiKGNtp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 08:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiKGNto (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 08:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB071AD9C
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 05:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667828926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lnEkZ9meexT9prDHkyYhCNuj5pE+dL8lEdjE7m8TY1E=;
        b=Z+fL+1bCSyhpxiZt++oMCGO1ppDpSlgF9lyeMSHhnVtpHVuI+QG/LRgouN0fUJZsRbds9l
        skXpMvXd5z3sKGY7hdLzE9WF/4JAAuAxRq9loNDiVJhyQycQNKqno7VA212ol5wHJI4kpl
        Q0Ti1PLeaOw/TSZ30iKOyQ3w7RxB0OI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-gbZX2ltSN4-Cw1s8uiD41g-1; Mon, 07 Nov 2022 08:48:44 -0500
X-MC-Unique: gbZX2ltSN4-Cw1s8uiD41g-1
Received: by mail-ed1-f70.google.com with SMTP id h9-20020a05640250c900b00461d8ee12e2so8425435edb.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 05:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnEkZ9meexT9prDHkyYhCNuj5pE+dL8lEdjE7m8TY1E=;
        b=hGVOeNrh4FY9zFvgypX8XrbNulRNMHAz01F/OO1SYXmCrLQsx0dN/N8BHVeHT5FcA+
         R6YmSXn/acnsnu2h51BY2uyPaqS6uMEY5QABFlT2DvXUVo1DkrkhZnLTjthaijznFjtl
         D9DQ+5t4eDwzDtyYm9a1/3GqdLoSY+eXq2sA5JBVXaz1JPJppJAwR1Uzwr2h20bf31qE
         U44N3DXvPb0BMyp6eBY49AqUZdQEd9m4XwiEi66VawO++SsbC3anjFaJoqifPEiz7pbT
         spAk/Wdo8pigBRJVwhO+c9sd+mHRsRoDOsIZcfHwvRTr3GUL1Fx0QXgIiZc6z/RfRa8q
         esVw==
X-Gm-Message-State: ACrzQf0obGdrHejWR2/Z9sg/tTAlgeyPkIrpHk8sPGiPnFEec78CUJns
        wmYe5LbtOaka2UF410YtRVBsru2pEIaMK+T6fr4jF3WinsQddF8USG836uayTx6Ph4WHRqFovhq
        O64Yqob7EcJkyHx4n+RA5XRnUfE9d2rMTMA==
X-Received: by 2002:a17:906:6898:b0:7ae:2ae6:f57e with SMTP id n24-20020a170906689800b007ae2ae6f57emr18741070ejr.126.1667828923653;
        Mon, 07 Nov 2022 05:48:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7ghcgyU29iGTZrlOjvueAqiBudcMQ/IbJHfum9uxso8mYDg0VKaIFgWFmG5pgK7IvXdAuY8w==
X-Received: by 2002:a17:906:6898:b0:7ae:2ae6:f57e with SMTP id n24-20020a170906689800b007ae2ae6f57emr18741046ejr.126.1667828923305;
        Mon, 07 Nov 2022 05:48:43 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b3-20020a17090630c300b007ae0fde7a9asm3370064ejb.201.2022.11.07.05.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 05:48:42 -0800 (PST)
Message-ID: <66b3bfc0-d0b8-89f9-6a7c-f7f92fc85be0@redhat.com>
Date:   Mon, 7 Nov 2022 14:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 1/6] Moving existing HP drivers to a central location
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
 <20221020201033.12790-2-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221020201033.12790-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

Sorry for the long silence, I have not done any pdx86 patch review
the last 2 weeks due to personal circumstances.

On 10/20/22 22:10, Jorge Lopez wrote:
> The purpose of this patch is to provide a central location where all
> HP related drivers are found. HP drivers will recide under
> drivers/platform/x86/hp directory.
> 
> Introduce changes to Kconfig file to list all HP driver under "HP X86
> Platform Specific Device Drivers" menu option. Additional changes
> include update MAINTAINERS file to indicate hp related drivers new
> path.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

Thank you for this patch. I've applied this to my review-hans branch now,
since it is good to get the move done to avoid conflicts if any changes get
submitted to the moved drivers later.

I will try to review the rest of this series later this week (likely
coming Wednesday).

Note I've done a bunch of cleanups while applying this, see inline comments.


> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  MAINTAINERS                                |  4 +-
>  drivers/platform/x86/Kconfig               | 80 ++++++----------------
>  drivers/platform/x86/Makefile              |  4 +-
>  drivers/platform/x86/hp/Kconfig            | 65 ++++++++++++++++++
>  drivers/platform/x86/hp/Makefile           | 10 +++
>  drivers/platform/x86/{ => hp}/hp-wmi.c     |  0
>  drivers/platform/x86/{ => hp}/hp_accel.c   |  0
>  drivers/platform/x86/{ => hp}/tc1100-wmi.c |  0
>  8 files changed, 98 insertions(+), 65 deletions(-)
>  create mode 100644 drivers/platform/x86/hp/Kconfig
>  create mode 100644 drivers/platform/x86/hp/Makefile
>  rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
>  rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
>  rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5a918c703b63..48f6705c19f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9289,7 +9289,7 @@ F:	drivers/net/wireless/intersil/hostap/
>  HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Orphan
> -F:	drivers/platform/x86/tc1100-wmi.c
> +F:	drivers/platform/x86/hp/tc1100-wmi.c
>  
>  HPET:	High Precision Event Timers driver
>  M:	Clemens Ladisch <clemens@ladisch.de>
> @@ -11747,7 +11747,7 @@ M:	Eric Piel <eric.piel@tremplin-utc.net>
>  S:	Maintained
>  F:	Documentation/misc-devices/lis3lv02d.rst
>  F:	drivers/misc/lis3lv02d/
> -F:	drivers/platform/x86/hp_accel.c
> +F:	drivers/platform/x86/hp/hp_accel.c
>  
>  LIST KUNIT TEST
>  M:	David Gow <davidgow@google.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f5312f51de19..731cf9945df5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -81,7 +81,7 @@ config MXM_WMI
>         tristate "WMI support for MXM Laptop Graphics"
>         depends on ACPI_WMI
>  	help
> -          MXM is a standard for laptop graphics cards, the WMI interface
> +	  MXM is a standard for laptop graphics cards, the WMI interface
>  	  is required for switchable nvidia graphics machines
>  
>  config PEAQ_WMI

This...

> @@ -163,18 +163,18 @@ config ACERHDF
>  	  here.
>  
>  config ACER_WIRELESS
> -        tristate "Acer Wireless Radio Control Driver"
> -        depends on ACPI
> -        depends on INPUT
> +	tristate "Acer Wireless Radio Control Driver"
> +	depends on ACPI
> +	depends on INPUT
>  	help
> -          The Acer Wireless Radio Control handles the airplane mode hotkey
> -          present on new Acer laptops.
> +	  The Acer Wireless Radio Control handles the airplane mode hotkey
> +	  present on new Acer laptops.
>  
> -          Say Y or M here if you have an Acer notebook with an airplane mode
> -          hotkey.
> +	  Say Y or M here if you have an Acer notebook with an airplane mode
> +	  hotkey.
>  
> -          If you choose to compile this driver as a module the module will be
> -          called acer-wireless.
> +	  If you choose to compile this driver as a module the module will be
> +	  called acer-wireless.
>  
>  config ACER_WMI
>  	tristate "Acer WMI Laptop Extras"

And this ...

> @@ -400,17 +400,17 @@ config FUJITSU_TABLET
>         depends on ACPI
>         depends on INPUT
>  	help
> -         This is a driver for tablets built by Fujitsu:
> +	 This is a driver for tablets built by Fujitsu:
>  
> -           * Lifebook P1510/P1610/P1620/Txxxx
> -           * Stylistic ST5xxx
> -           * Possibly other Fujitsu tablet models
> +	   * Lifebook P1510/P1610/P1620/Txxxx
> +	   * Stylistic ST5xxx
> +	   * Possibly other Fujitsu tablet models
>  
> -         It adds support for the panel buttons, docking station detection,
> -         tablet/notebook mode detection for convertible and
> -         orientation detection for docked slates.
> +	 It adds support for the panel buttons, docking station detection,
> +	 tablet/notebook mode detection for convertible and
> +	 orientation detection for docked slates.
>  
> -         If you have a Fujitsu convertible or slate, say Y or M here.
> +	 If you have a Fujitsu convertible or slate, say Y or M here.
>  
>  config GPD_POCKET_FAN
>  	tristate "GPD Pocket Fan Controller support"

And this, are all unrelated whitespace changes which I have dropped.

> @@ -424,24 +424,7 @@ config GPD_POCKET_FAN
>  	  of the CPU temperature. Say Y or M if the kernel may be used on a
>  	  GPD pocket.
>  
> -config HP_ACCEL
> -	tristate "HP laptop accelerometer"
> -	depends on INPUT && ACPI
> -	depends on SERIO_I8042
> -	select SENSORS_LIS3LV02D
> -	select NEW_LEDS
> -	select LEDS_CLASS
> -	help
> -	  This driver provides support for the "Mobile Data Protection System 3D"
> -	  or "3D DriveGuard" feature of HP laptops. On such systems the driver
> -	  should load automatically (via ACPI alias).
> -
> -	  Support for a led indicating disk protection will be provided as
> -	  hp::hddprotect. For more information on the feature, refer to
> -	  Documentation/misc-devices/lis3lv02d.rst.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called hp_accel.
> +source "drivers/platform/x86/hp/Kconfig"
>  
>  config WIRELESS_HOTKEY
>  	tristate "Wireless hotkey button"
> @@ -455,30 +438,6 @@ config WIRELESS_HOTKEY
>  	 To compile this driver as a module, choose M here: the module will
>  	 be called wireless-hotkey.
>  
> -config HP_WMI
> -	tristate "HP WMI extras"
> -	depends on ACPI_WMI
> -	depends on INPUT
> -	depends on RFKILL || RFKILL = n
> -	select INPUT_SPARSEKMAP
> -	select ACPI_PLATFORM_PROFILE
> -	select HWMON
> -	help
> -	 Say Y here if you want to support WMI-based hotkeys on HP laptops and
> -	 to read data from WMI such as docking or ambient light sensor state.
> -
> -	 To compile this driver as a module, choose M here: the module will
> -	 be called hp-wmi.
> -
> -config TC1100_WMI
> -	tristate "HP Compaq TC1100 Tablet WMI Extras"
> -	depends on !X86_64
> -	depends on ACPI
> -	depends on ACPI_WMI
> -	help
> -	  This is a driver for the WMI extensions (wireless and bluetooth power
> -	  control) of the HP Compaq TC1100 tablet.
> -
>  config IBM_RTL
>  	tristate "Device driver to enable PRTL support"
>  	depends on PCI
> @@ -1153,3 +1112,4 @@ config P2SB
>  	  The main purpose of this library is to unhide P2SB device in case
>  	  firmware kept it hidden on some platforms in order to access devices
>  	  behind it.
> +

Another unrelated whitespace change, also dropped.

> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5a428caa654a..415dc5576396 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -55,9 +55,7 @@ obj-$(CONFIG_FUJITSU_TABLET)	+= fujitsu-tablet.o
>  obj-$(CONFIG_GPD_POCKET_FAN)	+= gpd-pocket-fan.o
>  
>  # Hewlett Packard
> -obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
> -obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
> -obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
> +obj-y				+= hp/

This should be:

obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP) += hp/

Fixed while applying

>  
>  # Hewlett Packard Enterprise
>  obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
> new file mode 100644
> index 000000000000..426e3575ddc3
> --- /dev/null
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# X86 Platform Specific Drivers
> +#
> +menuconfig X86_PLATFORM_DRIVERS_HP
> +	bool "HP X86 Platform Specific Device Drivers"
> +	default y

This default y should not be here, drivers should normally not be enabled
by default and since you have added default m to the other entries below
(which is good), we need this one to not have a default so we don't end
up unconditionally enabling the drivers.

I've dropped the "default y" while applying this.

> +	depends on X86_PLATFORM_DEVICES
> +	help
> +	  Say Y here to get to see options for device drivers for various
> +	  HP x86 platforms, including vendor-specific laptop extension drivers.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.
> +
> +if X86_PLATFORM_DRIVERS_HP
> +
> +config HP_ACCEL
> +	tristate "HP laptop accelerometer"
> +	default m
> +	depends on INPUT && ACPI
> +	depends on SERIO_I8042
> +	select SENSORS_LIS3LV02D
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	help
> +	  This driver provides support for the "Mobile Data Protection System 3D"
> +	  or "3D DriveGuard" feature of HP laptops. On such systems the driver
> +	  should load automatically (via ACPI alias).
> +
> +	  Support for a led indicating disk protection will be provided as
> +	  hp::hddprotect. For more information on the feature, refer to
> +	  Documentation/misc-devices/lis3lv02d.rst.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called hp_accel.
> +
> +config HP_WMI
> +	tristate "HP WMI extras"
> +	default m
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on RFKILL || RFKILL = n
> +	select INPUT_SPARSEKMAP
> +	select ACPI_PLATFORM_PROFILE
> +	select HWMON
> +	help
> +	 Say Y here if you want to support WMI-based hotkeys on HP laptops and
> +	 to read data from WMI such as docking or ambient light sensor state.
> +
> +	 To compile this driver as a module, choose M here: the module will
> +	 be called hp-wmi.
> +
> +config TC1100_WMI
> +	tristate "HP Compaq TC1100 Tablet WMI Extras"
> +	default m
> +	depends on !X86_64
> +	depends on ACPI
> +	depends on ACPI_WMI
> +	help
> +	  This is a driver for the WMI extensions (wireless and bluetooth power
> +	  control) of the HP Compaq TC1100 tablet.
> +
> +
> + endif # X86_PLATFORM_DRIVERS_HP
> diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
> new file mode 100644
> index 000000000000..f651a405e876
> --- /dev/null
> +++ b/drivers/platform/x86/hp/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/x86/hp
> +# x86 Platform-Specific Drivers
> +#
> +
> +# Hewlett Packard
> +obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
> +obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
> +obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/hp-wmi.c
> rename to drivers/platform/x86/hp/hp-wmi.c
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
> similarity index 100%
> rename from drivers/platform/x86/hp_accel.c
> rename to drivers/platform/x86/hp/hp_accel.c
> diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/hp/tc1100-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/tc1100-wmi.c
> rename to drivers/platform/x86/hp/tc1100-wmi.c


Regards,

Hans


