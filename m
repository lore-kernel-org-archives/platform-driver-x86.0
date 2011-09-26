From: "Herton R. Krzesinski" <herton.krzesinski@canonical.com>
Subject: Re: [PATCH] topstar-latop: ignore 0x82 event
Date: Mon, 26 Sep 2011 10:28:49 -0300
Message-ID: <20110926132849.GB2634@herton-IdeaPad-Y430>
References: <1317042294-18251-1-git-send-email-manuel.lauss@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33509 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750846Ab1IZN2z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Sep 2011 09:28:55 -0400
Content-Disposition: inline
In-Reply-To: <1317042294-18251-1-git-send-email-manuel.lauss@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: Herton Ronaldo Krzesinski <herton@canonical.com>, platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>

On Mon, Sep 26, 2011 at 03:04:54PM +0200, Manuel Lauss wrote:
> Event 0x82 is emitted whenever a backlight event happens (brightness
> change, backlight on/off).  For instance, when display is switched
> off after a timeout, event 0x82 is emitted, and along with it a keypress
> which switches the display back on again.

Oh interesting side effect since 170531ba, really sparse_keymap_report_event
when not finding the key now generates a KEY_UNKNOWN press.

The fix is ok, I think the best approach is just ignoring it:

Acked-by: Herton R. Krzesinski <herton.krzesinski@canonical.com>

> 
> This patch adds 0x82 to the event ignore list so that the display stays
> off when it is automatically switched off.
> 
> Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
> ---
>  drivers/platform/x86/topstar-laptop.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
> index 4c20447..d528daa 100644
> --- a/drivers/platform/x86/topstar-laptop.c
> +++ b/drivers/platform/x86/topstar-laptop.c
> @@ -41,6 +41,7 @@ static const struct key_entry topstar_keymap[] = {
>  	{ KE_KEY, 0x8c, { KEY_MEDIA } },
>  
>  	/* Known non hotkey events don't handled or that we don't care yet */
> +	{ KE_IGNORE, 0x82, }, /* backlight event */
>  	{ KE_IGNORE, 0x8e, },
>  	{ KE_IGNORE, 0x8f, },
>  	{ KE_IGNORE, 0x90, },
> -- 
> 1.7.6.1
> 

-- 
[]'s
Herton
