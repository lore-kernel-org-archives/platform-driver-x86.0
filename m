From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/1] acer-wmi: set the touchpad toggle key code to
 KEY_TOUCHPAD_TOGGLE
Date: Tue, 1 Mar 2011 09:13:44 -0800
Message-ID: <20110301171344.GA27560@core.coreip.homeip.net>
References: <1298999231-11304-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:60997 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752769Ab1CARNu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Mar 2011 12:13:50 -0500
Received: by pzk35 with SMTP id 35so833830pzk.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Mar 2011 09:13:49 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1298999231-11304-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentincj@iksaif.net>

On Wed, Mar 02, 2011 at 01:07:11AM +0800, Lee, Chun-Yi wrote:
> Set the touchpad toggle key code from F22 to KEY_TOUCHPAD_TOGGLE,
> and userspace should use udev's key re-mapping facilities while X
> is unable to process keycodes above 255 to adjust to the keycode.
> 
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Dmitry Torokhov <dtor@mail.ru>
> Cc: Corentin Chary <corentincj@iksaif.net>
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>

Acked-by: Dmitry Torokhov <dtor@mail.ru>

> ---
>  drivers/platform/x86/acer-wmi.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 38b34a7..d10b280 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -109,7 +109,7 @@ static const struct key_entry acer_wmi_keymap[] = {
>  	{KE_KEY, 0x23, {KEY_PROG3} },    /* P_Key */
>  	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
>  	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
> -	{KE_KEY, 0x82, {KEY_F22} },      /* Touch Pad On/Off */
> +	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
>  	{KE_END, 0}
>  };
>  
> -- 
> 1.6.0.2
> 

-- 
Dmitry
