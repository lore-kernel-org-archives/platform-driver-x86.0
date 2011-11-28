From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH v2 10/16] samsung-laptop: cleanup KConfig
Date: Mon, 28 Nov 2011 10:01:15 -0600
Message-ID: <20111128160115.GC21912@thinkpad-t410>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
 <1322301613-8801-11-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57336 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751795Ab1K1QBT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Nov 2011 11:01:19 -0500
Content-Disposition: inline
In-Reply-To: <1322301613-8801-11-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Sat, Nov 26, 2011 at 11:00:07AM +0100, Corentin Chary wrote:
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> ---
>  drivers/platform/x86/Kconfig |   11 +++++++----
>  1 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7f43cf8..ec13bc5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -744,13 +744,16 @@ config XO15_EBOOK
>  
>  config SAMSUNG_LAPTOP
>  	tristate "Samsung Laptop driver"
> -	depends on RFKILL && BACKLIGHT_CLASS_DEVICE && X86
> +	depends on X86
> +	depends on RFKILL || RFKILL = n
> +	depends BACKLIGHT_CLASS_DEVICE

Shouldn't this be 'depends on BACKLIGHT_CLASS_DEVICE'?
