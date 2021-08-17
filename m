Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FCEC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 18:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49A3460F41
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 18:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhHQSsC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Aug 2021 14:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59695 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231616AbhHQSsB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Aug 2021 14:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629226047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C4+uwsWxjoOT7bvze9LXayv54Gs2tbBgtTykgdzB31M=;
        b=Un3KO3iZy9qubSfX7Ei6rKPAgyc2LtJ5KF/KzduXFH4pbGGBxBygnvI3W2LKFbK32f3rH7
        v9ijM2E3HXBlwe63N23NEolDKHKbdbjGKO8N3GXxJp6og9j3Ggkn662L5b182Lwct/6b2w
        Bu7LouOH7sTHOsrO7c8TDRGH5QuxYFE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-uTKXBgxwNCGrXqR5JxQCKw-1; Tue, 17 Aug 2021 14:47:27 -0400
X-MC-Unique: uTKXBgxwNCGrXqR5JxQCKw-1
Received: by mail-ej1-f71.google.com with SMTP id h22-20020a170906719600b005bc74a33a63so2505366ejk.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Aug 2021 11:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C4+uwsWxjoOT7bvze9LXayv54Gs2tbBgtTykgdzB31M=;
        b=W8CI+88chYe3xR2Ln+J4FoIzTwfvKSmzgW86jS16lZMZxE0GK2fcFAWypY3ywaxp6s
         BTeMWNs68vRswrYCGjAyK4TCwbfG55s1AXz8Nqw7fhD+sAyb6stYRld+29pUEfLJfCk6
         ZUFwnND/lavBn1xK8mQ/iKKPAjJuoOL/N3gQRzEaBlouH3b1vB9LGAtVGaxulKc/0RwU
         O+E0DJ+g3hcIddfBzjPYxIupfA7WZIMFKlgBNlQ4Kjx7Kh1Yl8bobPwluPIEaXGqin6Z
         H6b2684NVS9WIOc9vaH0GjRLxPRqrlyoc8oX1aJ1Jwei1m8cmC7nTsZA1sPMbWMdmqNV
         eqOA==
X-Gm-Message-State: AOAM532+VQBqB6vV+xrFhHP0wTl3p1Cp4LufxpGMhxCGkQBkGg5+z3oU
        bcwiL3IBC4cL74mvNzY8Zy/7/EioxKaHIaaz5HKpl5l96qsXpqGA7i37eRyf8LFBQQCYBYz2oXA
        fz2yG5cYzu0IRfLcmL0HzvQ2rQJ4pIFpX9Q==
X-Received: by 2002:a17:906:b08e:: with SMTP id x14mr5443723ejy.40.1629226045328;
        Tue, 17 Aug 2021 11:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjByuwQ9bYwlmTHdGVcGgInS5vSr/YgVNNA+jOrBRTbXJO1OcJ6tAizLKJwBFDicmGeYM3HQ==
X-Received: by 2002:a17:906:b08e:: with SMTP id x14mr5443696ejy.40.1629226045144;
        Tue, 17 Aug 2021 11:47:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ca4sm1093211ejb.1.2021.08.17.11.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 11:47:24 -0700 (PDT)
Subject: Re: [PATCH v7 1/5] platform/x86/intel: intel_pmc_core: Move
 intel_pmc_core* files to pmc subfolder
To:     Gayatri Kammela <gayatri.kammela@intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, irenic.rajneesh@gmail.com,
        andriy.shevchenko@linux.intel.com, vicamo.yang@canonical.com,
        srinivas.pandruvada@intel.com, david.e.box@intel.com,
        chao.qin@intel.com, linux-kernel@vger.kernel.org,
        tamar.mashiah@intel.com, gregkh@linuxfoundation.org,
        rajatja@google.com, Shyam-sundar.S-k@amd.com,
        Alexander.Deucher@amd.com, mlimonci@amd.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <cover.1629091915.git.gayatri.kammela@intel.com>
 <81b6292e50af54fb7eeabfefde6f4a3d283b0b96.1629091915.git.gayatri.kammela@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c07aa6a9-2cf9-db15-bf8c-9e6ac536a521@redhat.com>
Date:   Tue, 17 Aug 2021 20:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <81b6292e50af54fb7eeabfefde6f4a3d283b0b96.1629091915.git.gayatri.kammela@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/16/21 6:58 PM, Gayatri Kammela wrote:
> As part of collecting Intel x86 specific drivers in their own
> folder, move intel_pmc_core* files to its own subfolder there.
> 
> Cc: Chao Qin <chao.qin@intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: David Box <david.e.box@intel.com>
> Cc: You-Sheng Yang <vicamo.yang@canonical.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> ---
>  MAINTAINERS                                   |  2 +-
>  drivers/platform/x86/Kconfig                  | 21 ------------------
>  drivers/platform/x86/Makefile                 |  1 -
>  drivers/platform/x86/intel/Kconfig            |  1 +
>  drivers/platform/x86/intel/Makefile           |  1 +
>  drivers/platform/x86/intel/pmc/Kconfig        | 22 +++++++++++++++++++
>  drivers/platform/x86/intel/pmc/Makefile       |  6 +++++
>  .../{intel_pmc_core.c => intel/pmc/core.c}    |  2 +-
>  .../{intel_pmc_core.h => intel/pmc/core.h}    |  0
>  .../pmc/core_platform.c}                      |  0
>  10 files changed, 32 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/pmc/Kconfig
>  create mode 100644 drivers/platform/x86/intel/pmc/Makefile
>  rename drivers/platform/x86/{intel_pmc_core.c => intel/pmc/core.c} (99%)
>  rename drivers/platform/x86/{intel_pmc_core.h => intel/pmc/core.h} (100%)
>  rename drivers/platform/x86/{intel_pmc_core_pltdrv.c => intel/pmc/core_platform.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd25e4ecf0b9..5e118faf8018 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9477,7 +9477,7 @@ M:	David E Box <david.e.box@intel.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-platform-intel-pmc
> -F:	drivers/platform/x86/intel_pmc_core*
> +F:	drivers/platform/x86/intel/pmc/core*
>  
>  INTEL PMIC GPIO DRIVERS
>  M:	Andy Shevchenko <andy@kernel.org>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..c4ee38eba44b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1187,27 +1187,6 @@ config INTEL_MRFLD_PWRBTN
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called intel_mrfld_pwrbtn.
>  
> -config INTEL_PMC_CORE
> -	tristate "Intel PMC Core driver"
> -	depends on PCI
> -	depends on ACPI
> -	help
> -	  The Intel Platform Controller Hub for Intel Core SoCs provides access
> -	  to Power Management Controller registers via various interfaces. This
> -	  driver can utilize debugging capabilities and supported features as
> -	  exposed by the Power Management Controller. It also may perform some
> -	  tasks in the PMC in order to enable transition into the SLPS0 state.
> -	  It should be selected on all Intel platforms supported by the driver.
> -
> -	  Supported features:
> -		- SLP_S0_RESIDENCY counter
> -		- PCH IP Power Gating status
> -		- LTR Ignore / LTR Show
> -		- MPHY/PLL gating status (Sunrisepoint PCH only)
> -		- SLPS0 Debug registers (Cannonlake/Icelake PCH)
> -		- Low Power Mode registers (Tigerlake and beyond)
> -		- PMC quirks as needed to enable SLPS0/S0ix
> -
>  config INTEL_PMT_CLASS
>  	tristate
>  	help
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..43d36f8c36f1 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -128,7 +128,6 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
>  obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
>  obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
>  obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
> -obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o

This Makefile line will build 2 separate .ko files: intel_pmc_core.ko and
intel_pmc_core_pltdrv.ko when CONFIG_INTEL_PMC_CORE=m

>  obj-$(CONFIG_INTEL_PMT_CLASS)		+= intel_pmt_class.o
>  obj-$(CONFIG_INTEL_PMT_TELEMETRY)	+= intel_pmt_telemetry.o
>  obj-$(CONFIG_INTEL_PMT_CRASHLOG)	+= intel_pmt_crashlog.o

<snip>

> diff --git a/drivers/platform/x86/intel/pmc/Makefile b/drivers/platform/x86/intel/pmc/Makefile
> new file mode 100644
> index 000000000000..c92e66846a4a
> --- /dev/null
> +++ b/drivers/platform/x86/intel/pmc/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +
> +obj-$(CONFIG_INTEL_PMC_CORE)	+= intel_pmc_core.o
> +intel_pmc_core-objs		:= core.o \
> +				   core_platform.o

Whereas this will now build a single intel_pmc_core.ko containing both object files,
but the 2 .c files have:

module_platform_driver(pmc_core_driver);
(which is a macro expanding to a module_init + module_exit function)

resp.

module_init(pmc_core_platform_init);
module_exit(pmc_core_platform_exit);

So now we have 2 module_init (and _exit) functions in a single .ko
file and the build will fail, not good.

Also instead of "intel_pmc_core-objs :=" you should use "intel_pmc_core-y :="

And this series is based on 5.14-rc6, causing it to not apply
because the pmt driver has already been moved to
drivers/platform/x86 and this patch is using a base which
is missing that move.

pdx86 patches should be based on:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Please make sure the next version is based on my review-hans branch,
there are some other intel driver renames in flight (and e.g. the
pmt one has already landed) and I would like to be able to apply
this without needing to manually resolve conflicts.

Regards,

Hans



> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel/pmc/core.c
> similarity index 99%
> rename from drivers/platform/x86/intel_pmc_core.c
> rename to drivers/platform/x86/intel/pmc/core.c
> index b0e486a6bdfb..f9de78b08e5d 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -31,7 +31,7 @@
>  #include <asm/msr.h>
>  #include <asm/tsc.h>
>  
> -#include "intel_pmc_core.h"
> +#include "core.h"
>  
>  #define ACPI_S0IX_DSM_UUID		"57a6512e-3979-4e9d-9708-ff13b2508972"
>  #define ACPI_GET_LOW_MODE_REGISTERS	1
> diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel/pmc/core.h
> similarity index 100%
> rename from drivers/platform/x86/intel_pmc_core.h
> rename to drivers/platform/x86/intel/pmc/core.h
> diff --git a/drivers/platform/x86/intel_pmc_core_pltdrv.c b/drivers/platform/x86/intel/pmc/core_platform.c
> similarity index 100%
> rename from drivers/platform/x86/intel_pmc_core_pltdrv.c
> rename to drivers/platform/x86/intel/pmc/core_platform.c
> 

