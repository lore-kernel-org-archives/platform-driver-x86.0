From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: set default trigger for
 radio LED to rfkill-any
Date: Sat, 17 Dec 2016 12:00:07 +1030
Message-ID: <20161217013007.GA12015@marvin.atrad.com.au>
References: <20161216144603.19100-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:47052 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758103AbcLQBiL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Dec 2016 20:38:11 -0500
Content-Disposition: inline
In-Reply-To: <20161216144603.19100-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 16, 2016 at 03:46:03PM +0100, Micha?? K??pie?? wrote:
> The "radio components indicator" LED present in Lifebook E734/E744/E754
> should be lit when any radio transmitter is enabled, so set its default
> trigger to rfkill-any.

This shouldn't cause any problems.  At the end of the day it's only the
default; if for some reason it's inappropriate for any systems we could do
an override.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
> Note: the rfkill-any trigger is currently only present in
> mac80211-next/master.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 61f39ab..bfc0eb3 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -202,6 +202,7 @@ static void radio_led_set(struct led_classdev *cdev,
>  
>  static struct led_classdev radio_led = {
>   .name = "fujitsu::radio_led",
> + .default_trigger = "rfkill-any",
>   .brightness_get = radio_led_get,
>   .brightness_set = radio_led_set
>  };
