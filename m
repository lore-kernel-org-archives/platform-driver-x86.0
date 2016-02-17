From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 2/5] dell-wmi, dell-laptop: select DMI
Date: Tue, 16 Feb 2016 22:39:37 -0800
Message-ID: <20160217063937.GB20116@dvhart-mobl5.amr.corp.intel.com>
References: <cover.1455553470.git.luto@kernel.org>
 <f134070fe93b5ce81ceea9071497d853b7e7db9c.1455553470.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59835 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756448AbcBQGjz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 01:39:55 -0500
Content-Disposition: inline
In-Reply-To: <f134070fe93b5ce81ceea9071497d853b7e7db9c.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

On Mon, Feb 15, 2016 at 08:32:34AM -0800, Andy Lutomirski wrote:
> dell-wmi and dell-laptop will compile but won't work right if DMI
> isn't selected.

Was this necessitated by patch 1/5, or was this an existing problem? If the
former, I'd prefer to just include this in 1/5. If the latter, this is fine.

> 
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
> 
> Changes from v2 and v3: None
> 
> Changes from v1:
>  - New patch.
> 
> drivers/platform/x86/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 3e4d9c3e83fd..659e13b1e6f0 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -112,6 +112,7 @@ config DELL_LAPTOP
>  	select POWER_SUPPLY
>  	select LEDS_CLASS
>  	select NEW_LEDS
> +	select DMI
>  	default n
>  	---help---
>  	This driver adds support for rfkill and backlight control to Dell
> @@ -123,6 +124,7 @@ config DELL_WMI
>  	depends on INPUT
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	select INPUT_SPARSEKMAP
> +	select DMI
>  	---help---
>  	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
>  
> -- 
> 2.5.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
