From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] apple-gmux: Fix kconfig dependencies
Date: Thu, 02 Aug 2012 13:19:21 -0700
Message-ID: <501AE0C9.1060402@xenotime.net>
References: <1341240929-3400-1-git-send-email-seth.forshee@canonical.com> <1343927714-14937-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343927714-14937-1-git-send-email-seth.forshee@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Arun Raghavan <arun.raghavan@collabora.co.uk>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 08/02/2012 10:15 AM, Seth Forshee wrote:

> Fix the dependencies of apple-gmux to prevent it from being built-in
> when one or more of its dependencies is built as a module. Otherwise it
> can fail to build due to missing symbols.
> 
> v2: Add dependency on ACPI to fix build failure when ACPI=n
> 
> Reported-by: Arun Raghavan <arun.raghavan@collabora.co.uk>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>


Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  drivers/platform/x86/Kconfig |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2a262f5..637074d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -758,8 +758,11 @@ config SAMSUNG_Q10
>  
>  config APPLE_GMUX
>  	tristate "Apple Gmux Driver"
> +	depends on ACPI
>  	depends on PNP
> -	select BACKLIGHT_CLASS_DEVICE
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on BACKLIGHT_APPLE=n || BACKLIGHT_APPLE
> +	depends on ACPI_VIDEO=n || ACPI_VIDEO
>  	---help---
>  	  This driver provides support for the gmux device found on many
>  	  Apple laptops, which controls the display mux for the hybrid



-- 
~Randy
