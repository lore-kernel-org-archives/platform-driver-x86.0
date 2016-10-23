From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
 hotplug driver in Kconfig
Date: Sun, 23 Oct 2016 07:51:53 -0700
Message-ID: <20161023145153.GC120221@f23x64.localdomain>
References: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57580 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753020AbcJWOvo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Oct 2016 10:51:44 -0400
Content-Disposition: inline
In-Reply-To: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vadimp@mellanox.com
Cc: fengguang.wu@intel.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com

On Sun, Oct 23, 2016 at 12:45:27PM +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
> 
> Add select HWMON for mlxcpld-hotplug driver config, since it requires
> hwmon APIs.

Is this in response to the 0-day Error report?

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
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
