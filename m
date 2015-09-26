From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] platform: x86: PMC IPC depends on ACPI
Date: Fri, 25 Sep 2015 18:53:56 -0700
Message-ID: <5605FAB4.9000606@infradead.org>
References: <1443199123-13979-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53204 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753475AbbIZBx6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Sep 2015 21:53:58 -0400
In-Reply-To: <1443199123-13979-1-git-send-email-lee.jones@linaro.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Cc: qipeng.zha@intel.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org

On 09/25/15 09:38, Lee Jones wrote:
> This patch solves:
> 
> on x86_64:
> 
> when CONFIG_ACPI is not enabled:
> 
> ../drivers/mfd/intel_soc_pmic_bxtwc.c: In function 'bxtwc_probe':
> ../drivers/mfd/intel_soc_pmic_bxtwc.c:342:2:
>     error: implicit declaration of function 'acpi_evaluate_integer' [-Werror=implicit-function-declaration]
>         status = acpi_evaluate_integer(handle, "_HRV", NULL, &hrv);
>         ^
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index c69bb70..744cb80 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -914,6 +914,7 @@ config PVPANIC
>  
>  config INTEL_PMC_IPC
>  	tristate "Intel PMC IPC Driver"
> +	depends on ACPI
>  	---help---
>  	This driver provides support for PMC control on some Intel platforms.
>  	The PMC is an ARC processor which defines IPC commands for communication
> 


-- 
~Randy
