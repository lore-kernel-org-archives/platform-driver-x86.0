From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] platform/x86: Make SILEAD_DMI depend on
 TOUCHSCREEN_SILEAD
Date: Wed, 3 May 2017 08:28:42 +0200
Message-ID: <20170503082842.2cc02d4c@endymion>
References: <20170428210019.GA32026@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58729 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750966AbdECG2p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 May 2017 02:28:45 -0400
In-Reply-To: <20170428210019.GA32026@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Darren Hart (VMware)" <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Fri, 28 Apr 2017 14:00:19 -0700, Darren Hart (VMware) wrote:
> SILEAD_DMI provides platform specific data for the TOUCHSCREEN_SILEAD
> driver. Make this explicitly clear in the Kconfig depends.
> 
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9e5b2c2..5690664 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1101,7 +1101,7 @@ config INTEL_TURBO_MAX_3
>  
>  config SILEAD_DMI
>  	bool "Tablets with Silead touchscreens"
> -	depends on ACPI && DMI && I2C=y && INPUT
> +	depends on ACPI && DMI && I2C=y && INPUT && TOUCHSCREEN_SILEAD
>  	---help---
>  	  Certain ACPI based tablets with Silead touchscreens do not have
>  	  enough data in ACPI tables for the touchscreen driver to handle

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks Darren,
-- 
Jean Delvare
SUSE L3 Support
