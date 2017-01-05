From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] platform/x86: dell-smbios: Auto-select as needed
Date: Thu, 05 Jan 2017 15:44:34 +0200
Message-ID: <1483623874.9552.240.camel@linux.intel.com>
References: <20170105091443.3d0ab344@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:1819 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S970874AbdAENst (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Jan 2017 08:48:49 -0500
In-Reply-To: <20170105091443.3d0ab344@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>

On Thu, 2017-01-05 at 09:14 +0100, Jean Delvare wrote:
> Dell-smbios is a helper module, it serves no purpose on its own, so
> do not present it as an option to the user. Instead, select it
> automatically whenever a driver which needs it is selected.
> 
> Also select DCDBAS as needed, instead of depending on it, so that
> the Dell driver options are always visible.
> 
> As a clean-up, I removed the "default n" statements as they are not
> needed (n is the default default.)

Pushed to testing, thanks!

> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Michał Kępień <kernel@kempniu.pl>
> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changes since v2:
>  * Change the subject as suggested by Andy.
>  * Remove "default n" as suggested by Andy.
> Changes since v1:
>  * Select DCDBAS instead of depending on it. This is more
>    user-friendly and avoids the confusing transitive dependencies
>    which Pali didn't like.
> 
>  drivers/platform/x86/Kconfig |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> --- linux-4.10-rc2.orig/drivers/platform/x86/Kconfig	2017-01-01 
> 23:31:53.000000000 +0100
> +++ linux-4.10-rc2/drivers/platform/x86/Kconfig	2017-01-05
> 09:06:24.722834567 +0100
> @@ -92,9 +92,8 @@ config ASUS_LAPTOP
>  	  If you have an ACPI-compatible ASUS laptop, say Y or M
> here.
>  
>  config DELL_SMBIOS
> -	tristate "Dell SMBIOS Support"
> -	depends on DCDBAS
> -	default n
> +	tristate
> +	select DCDBAS
>  	---help---
>  	This module provides common functions for kernel modules
> using
>  	Dell SMBIOS.
> @@ -103,16 +102,15 @@ config DELL_SMBIOS
>  
>  config DELL_LAPTOP
>  	tristate "Dell Laptop Extras"
> -	depends on DELL_SMBIOS
>  	depends on DMI
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on RFKILL || RFKILL = n
>  	depends on SERIO_I8042
> +	select DELL_SMBIOS
>  	select POWER_SUPPLY
>  	select LEDS_CLASS
>  	select NEW_LEDS
> -	default n
>  	---help---
>  	This driver adds support for rfkill and backlight control to
> Dell
>  	laptops (except for some models covered by the Compal
> driver).
> @@ -123,7 +121,7 @@ config DELL_WMI
>  	depends on DMI
>  	depends on INPUT
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
> -	depends on DELL_SMBIOS
> +	select DELL_SMBIOS
>  	select INPUT_SPARSEKMAP
>  	---help---
>  	  Say Y here if you want to support WMI-based hotkeys on Dell
> laptops.
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
