From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Wed, 9 Feb 2011 14:44:19 -0800
Message-ID: <20110209144419.f673facf.rdunlap@xenotime.net>
References: <20110209224006.GA11202@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:51535 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753887Ab1BIWoV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Feb 2011 17:44:21 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <platform-driver-x86@vger.kernel.org>; Wed, 9 Feb 2011 14:44:19 -0800
In-Reply-To: <20110209224006.GA11202@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Wed, 9 Feb 2011 14:40:06 -0800 Greg KH wrote:

> From: Greg Kroah-Hartman <gregkh@suse.de>
> 
> This adds the samsung-laptop driver to the kernel.  It now supports
> all known Samsung laptops.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> ---
>  Documentation/ABI/testing/sysfs-driver-samsung-laptop |   19 
>  drivers/platform/x86/Kconfig                          |   13 
>  drivers/platform/x86/Makefile                         |    1 
>  drivers/platform/x86/samsung-laptop.c                 |  768 ++++++++++++++++++
>  4 files changed, 801 insertions(+)
> 
> Matthew, this is a copy of the latest version in the linux-next tree of the
> driver.  Once it has been accepted into your tree, I'll delete the
> staging driver.  Or, if you want to give your ACK, I can just move the
> driver from staging into this directory in my tree, which will properly
> preserve the history of the code.


> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d163bc2..da9aed1 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -654,4 +654,17 @@ config XO1_RFKILL
>  	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
>  	  laptop.
>  
> +config SAMSUNG_LAPTOP
> +	tristate "Samsung Laptop driver"
> +	depends on RFKILL && BACKLIGHT_CLASS_DEVICE && X86

This entire Kconfig file already depends on X86, so the "&& X86" above
is redundant.

> +	---help---
> +	  This module implements a driver for a wide range of different
> +	  Samsung laptops.  It offers control over the different
> +	  function keys, wireless LED, LCD backlight level, and
> +	  sometimes provides a "performance_control" sysfs file to allow
> +	  the performance level of the laptop to be changed.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called samsung-laptop.
> +
>  endif # X86_PLATFORM_DEVICES


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
