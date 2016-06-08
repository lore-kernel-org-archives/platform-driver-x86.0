From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] platform/x86: Drop duplicate dependencies on X86
Date: Wed, 8 Jun 2016 13:21:29 -0700
Message-ID: <20160608202129.GF28348@f23x64.localdomain>
References: <20160526114323.763237f5@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36391 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751560AbcFHUVa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 16:21:30 -0400
Content-Disposition: inline
In-Reply-To: <20160526114323.763237f5@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: platform-driver-x86@vger.kernel.org

On Thu, May 26, 2016 at 11:43:23AM +0200, Jean Delvare wrote:
> The whole menu depends on X86 so there is no point in repeating this
> dependency on individual driver entries.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Darren Hart <dvhart@infradead.org>
> ---
>  drivers/platform/x86/Kconfig |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> --- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.029103790 +0200
> +++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:35:23.704400044 +0200
> @@ -103,7 +103,6 @@ config DELL_SMBIOS
>  
>  config DELL_LAPTOP
>  	tristate "Dell Laptop Extras"
> -	depends on X86
>  	depends on DMI
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
> @@ -751,7 +750,7 @@ config TOSHIBA_WMI
>  
>  config ACPI_CMPC
>  	tristate "CMPC Laptop Extras"
> -	depends on X86 && ACPI
> +	depends on ACPI
>  	depends on RFKILL || RFKILL=n
>  	select INPUT
>  	select BACKLIGHT_CLASS_DEVICE
> @@ -850,7 +849,7 @@ config INTEL_IMR
>  
>  config IBM_RTL
>  	tristate "Device driver to enable PRTL support"
> -	depends on X86 && PCI
> +	depends on PCI
>  	---help---
>  	 Enable support for IBM Premium Real Time Mode (PRTM).
>  	 This module will allow you the enter and exit PRTM in the BIOS via
> @@ -884,7 +883,6 @@ config XO15_EBOOK
>  
>  config SAMSUNG_LAPTOP
>  	tristate "Samsung Laptop driver"
> -	depends on X86
>  	depends on RFKILL || RFKILL = n
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on BACKLIGHT_CLASS_DEVICE
> 

Was there a reason you omitted removing the X86 depends from SENSORS_HDAPS and
INTEL_PMC_CORE?

I've dropped these as well and queued this for 4.8, please let me know if you
deliberately left these in.

-- 
Darren Hart
Intel Open Source Technology Center
