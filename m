From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-smbios: fix DCDBAS dependency, better
Date: Tue, 13 Mar 2018 08:00:46 -0700
Message-ID: <20180313150046.GB20710@localhost.localdomain>
References: <20180313114310.1998450-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180313114310.1998450-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 13, 2018 at 12:42:57PM +0100, Arnd Bergmann wrote:
> The rework of the dell laptop modules caused a link error:
> 
> drivers/platform/x86/dell-smbios-smm.o: In function `dell_smbios_smm_call':
> dell-smbios-smm.c:(.text+0x77): undefined reference to `dcdbas_smi_request'
> 
> We already have a fix for that, but this was only a partial solution,
> since CONFIG_DELL_LAPTOP and CONFIG_DELL_WMI select CONFIG_DELL_SMBIOS
> regardless of that dependency.
> 
> We can either add the same 'DCDBAS || DCDBAS=n' dependency for those two
> as well, or replace the 'select' with a 'depends on'. The second approach
> seems cleaner, so I'm picking that here.

Thanks Arnd,

This thing has gotten out of hand. We're working on some additional
fixes related driver loading order when built-in as well. There is a
similar dependency on ACPI_WMI too.

I have a patch out pending review/testing on that.

We were trying to avoid having SMBIOS being required to be selected in
order for Dell Laptop to appear in the menu. Similarly for Dell WMI
Hotkeys.

I'm awaiting some feedback, but at the moment, it is looking like we
will have to revert the patches you cite below, and try again in 4.17,
likely with a DELL_EXTRAS menuconfig which allows us to default things
like DELL_SMBIOS to m and present a more intuitive config menu.

> 
> Fixes: 32d7b19bad96 ("platform/x86: dell-smbios: Resolve dependency error on DCDBAS")
> Fixes: 25d47027e100 ("platform/x86: dell-smbios: Link all dell-smbios-* modules together")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 28905793b5e5..0aec62bb5c61 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -151,7 +151,7 @@ config DELL_LAPTOP
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on RFKILL || RFKILL = n
>  	depends on SERIO_I8042
> -	select DELL_SMBIOS
> +	depends on DELL_SMBIOS
>  	select POWER_SUPPLY
>  	select LEDS_CLASS
>  	select NEW_LEDS
> @@ -165,8 +165,8 @@ config DELL_WMI
>  	depends on DMI
>  	depends on INPUT
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
> +	depends on DELL_SMBIOS
>  	select DELL_WMI_DESCRIPTOR
> -	select DELL_SMBIOS
>  	select INPUT_SPARSEKMAP
>  	---help---
>  	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
> -- 
> 2.9.0
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
