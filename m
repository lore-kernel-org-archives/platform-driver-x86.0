From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH -next] platform: x86: fix silead_dmi build error and
 depends
Date: Tue, 31 Jan 2017 09:39:51 +0100
Message-ID: <466ab0fe-51fa-4160-0e9f-fa1998734f0b@redhat.com>
References: <8c34389b-9ea3-88af-7d63-db1ca746083b@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33926 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750805AbdAaIke (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 03:40:34 -0500
In-Reply-To: <8c34389b-9ea3-88af-7d63-db1ca746083b@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>

Hi,

On 31-01-17 01:44, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> This driver cannot be built as a loadable module, so it should not
> be built unless I2C=y and INPUT=y.
>
> Fixes this build error:
> drivers/built-in.o: In function `silead_ts_dmi_init':
> silead_dmi.c:(.init.text+0xf00e): undefined reference to `i2c_bus_type'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thank you for catching this. However the depends on INPUT is not
necessary at all (likely a copy and paste error during development)
can you please do a v2 dropping the input dependency all together ?

Regards,

Hans



> ---
>  drivers/platform/x86/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I don't see why the "depends on INPUT" was there at all,
> but I modified its requirement anyway.  Maybe it can be removed...
>
> --- linux-next-20170130.orig/drivers/platform/x86/Kconfig
> +++ linux-next-20170130/drivers/platform/x86/Kconfig
> @@ -1079,7 +1079,7 @@ config INTEL_TURBO_MAX_3
>
>  config SILEAD_DMI
>  	bool "Tablets with Silead touchscreens"
> -	depends on ACPI && DMI && I2C && INPUT
> +	depends on ACPI && DMI && I2C=y && INPUT=y
>  	---help---
>  	  Certain ACPI based tablets with Silead touchscreens do not have
>  	  enough data in ACPI tables for the touchscreen driver to handle
>
