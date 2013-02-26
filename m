From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] ideapad-laptop: Depend on BACKLIGHT_CLASS_DEVICE instead
 of selecting it
Date: Tue, 26 Feb 2013 15:07:05 +0800
Message-ID: <512C5F19.2050202@canonical.com>
References: <1361829717-32058-1-git-send-email-matthew.garrett@nebula.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:55805 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756077Ab3BZHHL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Feb 2013 02:07:11 -0500
In-Reply-To: <1361829717-32058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org

On 02/26/2013 06:01 AM, Matthew Garrett wrote:
> Selecting BACKLIGHT_CLASS_DEVICE doesn't guarantee that any of its
> dependencies are enabled, and these are complicated. Depending isn't ideal
> for configuration UI purposes, but is probably more appropriate here.
> 
> Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 242c524..3338437 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -299,8 +299,8 @@ config IDEAPAD_LAPTOP
>  	depends on ACPI
>  	depends on RFKILL && INPUT
>  	depends on SERIO_I8042
> +	depends on BACKLIGHT_CLASS_DEVICE
>  	select INPUT_SPARSEKMAP
> -	select BACKLIGHT_CLASS_DEVICE
>  	help
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
> 

Acked-by: Ike Panhc <ike.pan@canonical.com>

It might be worthy to consider to apply the same modification for
ASUS_LAPTOP, SONY_LAPTOP, EEEPC_LAPTOP, ACPI_CMPC, SAMSUNG_Q10
and THINKPAD_ACPI to avoid the warning.
