From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] platform/x86: Make SILEAD_DMI depend on
 TOUCHSCREEN_SILEAD
Date: Fri, 28 Apr 2017 14:09:00 -0700
Message-ID: <20170428210900.GG4949@dtor-ws>
References: <20170428210019.GA32026@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35110 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163425AbdD1VJD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 17:09:03 -0400
Content-Disposition: inline
In-Reply-To: <20170428210019.GA32026@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Darren Hart (VMware)" <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Jean Delvare <jdelvare@suse.de>

On Fri, Apr 28, 2017 at 02:00:19PM -0700, Darren Hart (VMware) wrote:
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

Bikeshed: TOUCHSCREEN_SILEAD already depends on INPUT, so you can drop
INPUT dependency.

Otherwise

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
