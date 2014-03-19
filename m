From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH RESEND] fujitsu-laptop: Drop unneeded include
Date: Wed, 19 Mar 2014 23:33:06 +0100
Message-ID: <1770609.RsqzMFrygU@vostro.rjw.lan>
References: <20140319193846.22821b12@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:54771 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758392AbaCSWRf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 Mar 2014 18:17:35 -0400
In-Reply-To: <20140319193846.22821b12@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Woithe <jwoithe@just42.net>, Matthew Garrett <matthew.garrett@nebula.com>

On Wednesday, March 19, 2014 07:38:46 PM Jean Delvare wrote:
> The fujitsu-laptop driver includes <linux/video_output.h> but doesn't
> call any of its functions. Drop the unneeded include to avoid
> unnecessary driver rebuilds.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Acked-by: Jonathan Woithe <jwoithe@just42.net>
> Cc: Matthew Garrett <matthew.garrett@nebula.com>

Well, thanks, but why didn't you send it to the same CC list as the original
patch set?  This doesn't make it particularly convenient to handle ...

> ---
> Resending with Rafael in Cc so that he can include it in a larger
> clean-up patch series.
> 
>  drivers/platform/x86/fujitsu-laptop.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-3.14-rc6.orig/drivers/platform/x86/fujitsu-laptop.c	2014-03-17 11:31:04.273862743 +0100
> +++ linux-3.14-rc6/drivers/platform/x86/fujitsu-laptop.c	2014-03-17 11:31:19.961145958 +0100
> @@ -66,7 +66,6 @@
>  #include <linux/backlight.h>
>  #include <linux/input.h>
>  #include <linux/kfifo.h>
> -#include <linux/video_output.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> 
> 
> 

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
