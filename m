From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
 hotplug driver in Kconfig
Date: Sun, 23 Oct 2016 09:57:21 -0700
Message-ID: <a20039d5-6456-7450-f83c-572c5ce4fb8f@infradead.org>
References: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:53340 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754861AbcJWQ5b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Oct 2016 12:57:31 -0400
In-Reply-To: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vadimp@mellanox.com, dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com

On 10/23/16 05:45, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
> 
> Add select HWMON for mlxcpld-hotplug driver config, since it requires
> hwmon APIs.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 65d9b04..1853769 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1032,6 +1032,7 @@ config MLX_CPLD_PLATFORM
>  	tristate "Mellanox platform hotplug driver support"
>  	default n
>  	depends on MLX_PLATFORM
> +	select HWMON
>  	select I2C
>  	---help---
>  	  This driver handles hot-plug events for the power suppliers, power
> 

Hi,
did you test this?  I would expect it to cause a kconfig warning,
something about HWMON having a dependency on HAS_IOMEM.

thanks.
-- 
~Randy
