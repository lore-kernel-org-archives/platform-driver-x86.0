From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 1/2] fujitsu-laptop: Drop unneeded include
Date: Mon, 17 Mar 2014 22:24:15 +1030
Message-ID: <20140317115415.GA1258@marvin.atrad.com.au>
References: <20140317120022.538264f9@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:56417 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932672AbaCQLyh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Mar 2014 07:54:37 -0400
Content-Disposition: inline
In-Reply-To: <20140317120022.538264f9@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>, jwoithe@just42.net

Acked-by: Jonathan Woithe <jwoithe@just42.net>

On Mon, Mar 17, 2014 at 12:00:22PM +0100, Jean Delvare wrote:
> The fujitsu-laptop driver includes <linux/video_output.h> but doesn't
> call any of its functions. Drop the unneeded include to avoid
> unnecessary driver rebuilds.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Jonathan Woithe <jwoithe@just42.net>
> Cc: Matthew Garrett <matthew.garrett@nebula.com>
> ---
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
> -- 
> Jean Delvare
> SUSE L3 Support
