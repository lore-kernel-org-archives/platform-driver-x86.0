From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
 hotplug driver in Kconfig
Date: Mon, 24 Oct 2016 11:58:45 +0300
Message-ID: <1477299525.6423.39.camel@linux.intel.com>
References: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:24243 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934500AbcJXI7E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2016 04:59:04 -0400
In-Reply-To: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vadimp@mellanox.com, dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Sun, 2016-10-23 at 12:45 +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
> 
> Add select HWMON for mlxcpld-hotplug driver config, since it requires
> hwmon APIs.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig
> b/drivers/platform/x86/Kconfig
> index 65d9b04..1853769 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1032,6 +1032,7 @@ config MLX_CPLD_PLATFORM
>  	tristate "Mellanox platform hotplug driver support"


>  	default n

Btw, I thought the _default_ is 'n' and thus this line is not needed.

>  	depends on MLX_PLATFORM
> +	select HWMON
>  	select I2C
>  	---help---
>  	  This driver handles hot-plug events for the power
> suppliers, power

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
