From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad: add rfkill whitelist entry for Yoga 3 1170
Date: Mon, 15 Jun 2015 13:26:47 -0700
Message-ID: <20150615202647.GB83198@vmdeb7>
References: <5498848.9yV42J8a1L@wuerfel>
 <4113282.CaC1reWxk0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57994 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754117AbbFOU0t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 16:26:49 -0400
Content-Disposition: inline
In-Reply-To: <4113282.CaC1reWxk0@wuerfel>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@linux.intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

On Sat, Jun 13, 2015 at 03:24:32PM +0200, Arnd Bergmann wrote:
> This adds one more entry to the whitelist of machines that do not have
> a physical rfkill switch. Unfortunately, the Yoga 3 generation seems
> to use upper-case letters for the YOGA 3 Pro-1370, while it uses normal
> capitalization for its Yoga 3 1170 sibling.
> 
> In order to catch all variants of the Yoga 3, I'm now using both strings
> as wildcards here, which should also cover the 1470 model, and possible
> changes in the string that could happen in firmware updates.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index cb7cd8d79329..8e455c1429ee 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -855,7 +855,14 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>  		.ident = "Lenovo Yoga 3 Pro 1370",

I believe we should also update the ident to indicate the inclusion of the 1470
model since you dropped the 1370 specifier from the product version.

(Also, please use my infradead ID specified in MAINTAINERS for
platform-drivers-x86)

Thanks,

>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo Yoga 3 1170 / 1470",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 3"),
>  		},
>  	},
>  	{}
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center
