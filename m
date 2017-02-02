From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: silead depends on I2C being built-in
Date: Thu, 2 Feb 2017 15:45:43 +0100
Message-ID: <859e4199-8c8d-c1a8-6898-5ed4fe4572e4@redhat.com>
References: <20170202142744.3418986-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54830 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751201AbdBBOqS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2017 09:46:18 -0500
In-Reply-To: <20170202142744.3418986-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 02-02-17 15:25, Arnd Bergmann wrote:
> The new driver cannot be a loadable module, so if I2C is loadable, we get this
> link error:
>
> drivers/platform/built-in.o: In function `silead_ts_dmi_init':
> silead_dmi.c:(.init.text+0x2ef): undefined reference to `i2c_bus_type'
>
> This makes the Kconfig dependency stricter to require I2C=y.
>
> Fixes: 9eeda3897a85 ("platform/x86: add support for devices with Silead touchscreens")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you.

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards.

Hans


> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index dd4952ac8797..a7fe9b9f975d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1079,7 +1079,7 @@ config INTEL_TURBO_MAX_3
>
>  config SILEAD_DMI
>  	bool "Tablets with Silead touchscreens"
> -	depends on ACPI && DMI && I2C && INPUT
> +	depends on ACPI && DMI && I2C=y && INPUT
>  	---help---
>  	  Certain ACPI based tablets with Silead touchscreens do not have
>  	  enough data in ACPI tables for the touchscreen driver to handle
>
