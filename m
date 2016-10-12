From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: add SERIO_I8042 dependency
Date: Wed, 12 Oct 2016 23:04:10 +0200
Message-ID: <20161012210233.GA127258@f23x64.localdomain>
References: <20161012193224.127356-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57920 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752237AbcJLWUY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2016 18:20:24 -0400
Content-Disposition: inline
In-Reply-To: <20161012193224.127356-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Oleksij Rempel <linux@rempel-privat.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 12, 2016 at 09:31:40PM +0200, Arnd Bergmann wrote:
> A recent bugfix added a call to i8042_install_filter but did
> not add the dependency, leading to possible link errors:
> 
> drivers/platform/built-in.o: In function `asus_nb_wmi_quirks':
> asus-nb-wmi.c:(.text+0x23af): undefined reference to `i8042_install_filter'
> 
> This adds a dependency on SERIO_I8042||SERIO_I8042=n to indicate
> that we can build the driver when the i8042 driver is disabled,
> but it cannot be built-in when that is a loadable module.
> 
> Fixes: b5643539b825 ("platform/x86: asus-wmi: Filter buggy scan codes on ASUS Q500A")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks again Arnd, queued to testing. Will try to include in a pull request
within the merge window, but travel may push it out to early next week if
connectivity or travel goes south.

> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9756c8354b37..6bca28472605 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -576,6 +576,7 @@ config ASUS_WMI
>  config ASUS_NB_WMI
>  	tristate "Asus Notebook WMI Driver"
>  	depends on ASUS_WMI
> +	depends on SERIO_I8042 || SERIO_I8042 = n
>  	---help---
>  	  This is a driver for newer Asus notebooks. It adds extra features
>  	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
> -- 
> 2.9.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
