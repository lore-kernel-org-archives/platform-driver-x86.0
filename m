From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3] platform/x86: dell-laptop: Fix bogus keyboard
 backlight sysfs interface
Date: Mon, 19 Jun 2017 12:43:25 +0200
Message-ID: <20170619104325.GC32387@pali>
References: <20170619102739.30449-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35775 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753769AbdFSKn2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2017 06:43:28 -0400
Content-Disposition: inline
In-Reply-To: <20170619102739.30449-1-kai.heng.feng@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: andy@infradead.org, mjg59@srcf.ucam.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 19 June 2017 18:27:39 Kai-Heng Feng wrote:
> Dell Latitude 3160 does not have keyboard backlight, but there is a
> sysfs interface for it, which does nothing at all.
> 
> KBD_LED_ON_TOKEN is the only token can be found. Since it doesn't have
> KBD_LED_OFF_TOKEN or KBD_LED_AUTO_*_TOKEN, it should be safe to assume
> at least both ON and OFF token should be present to support keyboard
> backlight.

This is not truth. E.g. E6440 does not have ON token, but has more AUTO
tokens.

> Models which do not use SMBIOS token to control keyboard backlight, also
> have this issue. Brightness level is 0 on these models. Verified on Dell
> Inspiron 3565.
> 
> Reports keyboard backlight is supported only when at least two modes are
> present.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

But logic in code looks to be correct now. So fix commit message and you
can add my Reviewed-by.

> ---
> 
> v3:
> Change the logic, there should be at least two modes present to claim it
> supports backlight. Suggested by Pali Rohár.
> 
> v2:
> The only token can be found is actually KBD_LED_ON_TOKEN, which is BIT(5),
> instead of KBD_LED_OFF_TOKEN. Change commit log accordingly.
> 
> Use token bit to make the intention more clear.
> Also consider kbd_mode_levels_count and kbd_info.levels, suggested by
> Pali Rohár.
> 
> Use XOR to simplify the bitmask comparison, suggested by
> Andy Shevchenko.
> 
>  drivers/platform/x86/dell-laptop.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index ec202094bd50..f42159fd2031 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -1510,7 +1510,11 @@ static void kbd_init(void)
>  	ret = kbd_init_info();
>  	kbd_init_tokens();
>  
> -	if (kbd_token_bits != 0 || ret == 0)
> +	/*
> +	 * Only supports keyboard backlight when it has at least two modes.
> +	 */
> +	if ((ret == 0 && (kbd_info.levels != 0 || kbd_mode_levels_count >= 2))
> +	    || kbd_get_valid_token_counts() >= 2)
>  		kbd_led_present = true;
>  }
>  

-- 
Pali Rohár
pali.rohar@gmail.com
