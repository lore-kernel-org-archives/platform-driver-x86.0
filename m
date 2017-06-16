From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Fix bogus keyboard backlight
 sysfs interface
Date: Fri, 16 Jun 2017 09:52:20 +0200
Message-ID: <20170616075220.GV5248@pali>
References: <20170616073539.1185-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33841 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752375AbdFPHwd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 03:52:33 -0400
Content-Disposition: inline
In-Reply-To: <20170616073539.1185-1-kai.heng.feng@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi!

On Friday 16 June 2017 15:35:39 Kai-Heng Feng wrote:
> Dell Latitude 3160 does not have keyboard backlight, but there is a
> sysfs interface for it, which does nothing at all.
> 
> KBD_LED_OFF_TOKEN is the only token can be found. Since it doesn't have
> KBD_LED_ON_TOKEN or KBD_LED_AUTO_*_TOKEN, it should be safe to assume it
> does not support keyboard backlight.
> 
> Reports keyboard backlight is supported only when tokens other than
> KBD_LED_OFF_TOKEN can be found.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index ec202094bd50..743d7ce8c0c8 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -1510,7 +1510,11 @@ static void kbd_init(void)
>  	ret = kbd_init_info();
>  	kbd_init_tokens();
>  
> -	if (kbd_token_bits != 0 || ret == 0)
> +	/*
> +	 * If KBD_LED_OFF_TOKEN is the only token,
> +	 * consider there is no keyboard backlight.
> +	 */
> +	if ((kbd_token_bits & ~BIT(5)) != 0 || ret == 0)

Should not this check to be rather:

(kbd_token_bits != 0 && (kbd_token_bits & BIT(KBD_LED_OFF_TOKEN)) != BIT(KBD_LED_OFF_TOKEN))

To express that we have at least one token at it is different from
KBD_LED_OFF_TOKEN token?

>  		kbd_led_present = true;
>  }
>  

And more important, there are three ways how to control keyboard
backlight level:

1) Via SMBIOS token
2) Via SMBIOS call 4/11/0x2 (arg2, byte0)
3) Via SMBIOS call 4/11/0x2 (arg3, byte2)

You are adding special case when only one SMBIOS toekn OFF is present
which belongs to 1).

Therefore there should be same check for 2) and 3) that there are more
the one option to set...

-- 
Pali Rohár
pali.rohar@gmail.com
