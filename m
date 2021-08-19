Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25275C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 09:09:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D3EA61131
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 09:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbhHSJJm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 05:09:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54532 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234545AbhHSJJl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 05:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629364145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WnXpqr4AEm5G0ufbH0HVBttWCHL/YPkBxdRoTVtSo3A=;
        b=e1oLD0vQQYszGYFhrKD1q1wu1DXBdXCwqNxYoZ7jES73QCUv6NcstQ843SYsw7waUaIl++
        FDQ9cw/BzGf3HHBsw/3ERyldrWn7QGOBjvMVBPJvgxRtXmw7OX5geqriGkZUN5b9dp3Cg+
        WhrVX5F6FKMXGEuyyUKYWtdpzggoadY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-AybF2MWVO0qkFvi7ll7B8w-1; Thu, 19 Aug 2021 05:09:01 -0400
X-MC-Unique: AybF2MWVO0qkFvi7ll7B8w-1
Received: by mail-ej1-f71.google.com with SMTP id k12-20020a170906680cb02905aeccdbd1efso1988178ejr.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Aug 2021 02:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WnXpqr4AEm5G0ufbH0HVBttWCHL/YPkBxdRoTVtSo3A=;
        b=TyzrzankSXamzVk6CuhT1RsdVflVoXiOFg5a3heK7bMzjtLG3N6fYyi7mHJCClqCo5
         zn4vw0BsPhuG173Pn8GgaoNPqnm4pI0pw4KDSgBAH6p5W4Qg65VXNCJGWkTstM8ct1Wj
         nVAZjmRSH8NmmfYT52QUayiGHMzgO3fq8SGDX8HYFR2FND4Cbh1Z8Ekt2iXViZFG+QEM
         niQ5fFxvSpanZ0li97cIkCeO9IueFlkGEw7P/a50PK+ElfgxmSuFmorjewy/0/8BcCtS
         l5qmj39qodPEcw5rc42rzWvr+6dd7RndUZK2pIGxpkq6zmf+SUZXuAxhX5oW+3xfPPLK
         XOgA==
X-Gm-Message-State: AOAM5329NzY2o3uIcpvZvIaXpSYCTUZGKf2ARQuBT1UTtFZq6YZmRbZ9
        q+YfgDNcTxlygYJeOmZzng5KBZD6s4tXLTOik0n2lpKfH+Yvv3GI0kJlo0fDGVv+QNmgIXK7e12
        yW7hr27nVdPQwFMyLklv81xDnYWbROIyVuf0NeIU1deMQL3mKBzaJAetyhYeCR52/+kHvlZDXbO
        IqZm0BqURyJA==
X-Received: by 2002:a17:906:ae51:: with SMTP id lf17mr14385394ejb.161.1629364140705;
        Thu, 19 Aug 2021 02:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw91jumXP8YlNau0KKoILyWWZ9EHWAHgEgqVpcFejbaOMNYk38DHDTu1+1PrdoxRbf+JWi66w==
X-Received: by 2002:a17:906:ae51:: with SMTP id lf17mr14385373ejb.161.1629364140515;
        Thu, 19 Aug 2021 02:09:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v15sm962402ejq.116.2021.08.19.02.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 02:09:00 -0700 (PDT)
Subject: Re: [PATCH v3 14/20] platform/x86: intel_atomisp2_led: Move to intel
 sub-directory
To:     Kate Hsuan <hpa@redhat.com>, Alex Hung <alex.hung@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210819033001.20136-1-hpa@redhat.com>
 <20210819033001.20136-15-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3df6595a-0543-8fc3-21e8-d07ba3ae368f@redhat.com>
Date:   Thu, 19 Aug 2021 11:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819033001.20136-15-hpa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/21 5:29 AM, Kate Hsuan wrote:
> Move intel_atomisp2_led to intel sub-directory to improve
> readability.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/platform/x86/Kconfig                  | 34 -----------------
>  drivers/platform/x86/Makefile                 |  4 +-
>  drivers/platform/x86/intel/Kconfig            |  1 +
>  drivers/platform/x86/intel/Makefile           |  2 +
>  drivers/platform/x86/intel/atomisp2/Kconfig   | 38 +++++++++++++++++++
>  drivers/platform/x86/intel/atomisp2/Makefile  |  9 +++++
>  .../atomisp2/led.c}                           |  0
>  .../atomisp2/pm.c}                            |  0
>  8 files changed, 52 insertions(+), 36 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/atomisp2/Kconfig
>  create mode 100644 drivers/platform/x86/intel/atomisp2/Makefile
>  rename drivers/platform/x86/{intel_atomisp2_led.c => intel/atomisp2/led.c} (100%)
>  rename drivers/platform/x86/{intel_atomisp2_pm.c => intel/atomisp2/pm.c} (100%)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 163dc73f3f95..196e70a8b264 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -667,40 +667,6 @@ config THINKPAD_LMI
>  
>  source "drivers/platform/x86/intel/Kconfig"
>  
> -config INTEL_ATOMISP2_LED
> -	tristate "Intel AtomISP2 camera LED driver"
> -	depends on GPIOLIB && LEDS_GPIO
> -	help
> -	  Many Bay Trail and Cherry Trail devices come with a camera attached
> -	  to Intel's Image Signal Processor. Linux currently does not have a
> -	  driver for these, so they do not work as a camera. Some of these
> -	  camera's have a LED which is controlled through a GPIO.
> -
> -	  Some of these devices have a firmware issue where the LED gets turned
> -	  on at boot. This driver will turn the LED off at boot and also allows
> -	  controlling the LED (repurposing it) through the sysfs LED interface.
> -
> -	  Which GPIO is attached to the LED is usually not described in the
> -	  ACPI tables, so this driver contains per-system info about the GPIO
> -	  inside the driver, this means that this driver only works on systems
> -	  the driver knows about.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called intel_atomisp2_led.
> -
> -config INTEL_ATOMISP2_PM
> -	tristate "Intel AtomISP2 dummy / power-management driver"
> -	depends on PCI && IOSF_MBI && PM
> -	depends on !INTEL_ATOMISP
> -	help
> -	  Power-management driver for Intel's Image Signal Processor found on
> -	  Bay Trail and Cherry Trail devices. This dummy driver's sole purpose
> -	  is to turn the ISP off (put it in D3) to save power and to allow
> -	  entering of S0ix modes.
> -
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called intel_atomisp2_pm.
> -
>  config INTEL_HID_EVENT
>  	tristate "INTEL HID Event"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 3d25ba595d4f..2a48171c11c1 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -61,6 +61,8 @@ obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
>  # Hewlett Packard Enterprise
>  obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>  
> +
> +
>  # IBM Thinkpad and Lenovo
>  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>  obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
> @@ -71,8 +73,6 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  # Intel
>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)		+= intel/
>  
> -obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
> -obj-$(CONFIG_INTEL_ATOMISP2_PM)		+= intel_atomisp2_pm.o
>  obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
> diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
> index f4f21c2f9230..01db66ec1462 100644
> --- a/drivers/platform/x86/intel/Kconfig
> +++ b/drivers/platform/x86/intel/Kconfig
> @@ -19,6 +19,7 @@ if X86_PLATFORM_DRIVERS_INTEL
>  source "drivers/platform/x86/intel/int33fe/Kconfig"
>  source "drivers/platform/x86/intel/int3472/Kconfig"
>  source "drivers/platform/x86/intel/pmt/Kconfig"
> +source "drivers/platform/x86/intel/atomisp2/Kconfig"
>  
>  config INTEL_BXTWC_PMIC_TMU
>  	tristate "Intel BXT Whiskey Cove TMU Driver"
> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
> index 317e8f8d144a..05a012118ea1 100644
> --- a/drivers/platform/x86/intel/Makefile
> +++ b/drivers/platform/x86/intel/Makefile
> @@ -7,6 +7,8 @@
>  obj-$(CONFIG_INTEL_CHT_INT33FE)		+= int33fe/
>  obj-$(CONFIG_INTEL_SKL_INT3472)		+= int3472/
>  obj-$(CONFIG_INTEL_PMT_CLASS)		+= pmt/
> +obj-$(CONFIG_INTEL_ATOMISP2_LED)       += atomisp2/
> +obj-$(CONFIG_INTEL_ATOMISP2_PM)                += atomisp2/

Here is the issue of entering into the subdir twice if both
options are enabled again (and also the indent is wrong
and seems to be using spaces).

I've fixed this by adding making some changes to:
drivers/platform/x86/intel/atomisp2/Kconfig

I added:

config INTEL_ATOMISP2_PDX86
	bool

Which is basically a hidden (not user selectable) bool option,
defaulting to N (which is the default default)

And then I added:

	select INTEL_ATOMISP2_PDX86

The the config bits for both CONFIG_INTEL_ATOMISP2_LED and CONFIG_INTEL_ATOMISP2_PM
and then used the new CONFIG_INTEL_ATOMISP2_PDX86 in the Makefile to dive into
the subdir.

I have made these changes while merging the series there is no need for
a new version.

Regards,

Hans





>  
>  # Intel PMIC / PMC / P-Unit devices
>  intel_bxtwc_tmu-y			:= bxtwc_tmu.o
> diff --git a/drivers/platform/x86/intel/atomisp2/Kconfig b/drivers/platform/x86/intel/atomisp2/Kconfig
> new file mode 100644
> index 000000000000..e5851d8c33eb
> --- /dev/null
> +++ b/drivers/platform/x86/intel/atomisp2/Kconfig
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Intel x86 Platform Specific Drivers
> +#
> +
> +config INTEL_ATOMISP2_LED
> +        tristate "Intel AtomISP2 camera LED driver"
> +        depends on GPIOLIB && LEDS_GPIO
> +        help
> +          Many Bay Trail and Cherry Trail devices come with a camera attached
> +          to Intel's Image Signal Processor. Linux currently does not have a
> +          driver for these, so they do not work as a camera. Some of these
> +          camera's have a LED which is controlled through a GPIO.
> +
> +          Some of these devices have a firmware issue where the LED gets turned
> +          on at boot. This driver will turn the LED off at boot and also allows
> +          controlling the LED (repurposing it) through the sysfs LED interface.
> +
> +          Which GPIO is attached to the LED is usually not described in the
> +          ACPI tables, so this driver contains per-system info about the GPIO
> +          inside the driver, this means that this driver only works on systems
> +          the driver knows about.
> +
> +          To compile this driver as a module, choose M here: the module
> +          will be called intel_atomisp2_led.
> +
> +config INTEL_ATOMISP2_PM
> +        tristate "Intel AtomISP2 dummy / power-management driver"
> +        depends on PCI && IOSF_MBI && PM
> +        depends on !INTEL_ATOMISP
> +        help
> +          Power-management driver for Intel's Image Signal Processor found on
> +          Bay Trail and Cherry Trail devices. This dummy driver's sole purpose
> +          is to turn the ISP off (put it in D3) to save power and to allow
> +          entering of S0ix modes.
> +
> +          To compile this driver as a module, choose M here: the module
> +          will be called intel_atomisp2_pm.
> diff --git a/drivers/platform/x86/intel/atomisp2/Makefile b/drivers/platform/x86/intel/atomisp2/Makefile
> new file mode 100644
> index 000000000000..96b1e877d1f1
> --- /dev/null
> +++ b/drivers/platform/x86/intel/atomisp2/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Intel x86 Platform Specific Drivers
> +#
> +
> +intel_atomisp2_led-y			:= led.o
> +obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
> +intel_atomisp2_pm-y			+= pm.o
> +obj-$(CONFIG_INTEL_ATOMISP2_PM)		+= intel_atomisp2_pm.o
> diff --git a/drivers/platform/x86/intel_atomisp2_led.c b/drivers/platform/x86/intel/atomisp2/led.c
> similarity index 100%
> rename from drivers/platform/x86/intel_atomisp2_led.c
> rename to drivers/platform/x86/intel/atomisp2/led.c
> diff --git a/drivers/platform/x86/intel_atomisp2_pm.c b/drivers/platform/x86/intel/atomisp2/pm.c
> similarity index 100%
> rename from drivers/platform/x86/intel_atomisp2_pm.c
> rename to drivers/platform/x86/intel/atomisp2/pm.c
> 

