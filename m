From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Fix bogus keyboard backlight
 sysfs interface
Date: Sun, 18 Jun 2017 15:44:50 +0300
Message-ID: <CAHp75Vc9OaAMm47PANHGCCtuyjt6y368e3nmx+aJe6DEWXFyTw@mail.gmail.com>
References: <20170616073539.1185-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35190 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752187AbdFRMow (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Jun 2017 08:44:52 -0400
In-Reply-To: <20170616073539.1185-1-kai.heng.feng@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 16, 2017 at 10:35 AM, Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
> Dell Latitude 3160 does not have keyboard backlight, but there is a
> sysfs interface for it, which does nothing at all.
>
> KBD_LED_OFF_TOKEN is the only token can be found. Since it doesn't have
> KBD_LED_ON_TOKEN or KBD_LED_AUTO_*_TOKEN, it should be safe to assume it
> does not support keyboard backlight.
>
> Reports keyboard backlight is supported only when tokens other than
> KBD_LED_OFF_TOKEN can be found.

Okay, I'm waiting for v2 with Pali's or mine suggestion applied.

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
>         ret = kbd_init_info();
>         kbd_init_tokens();
>
> -       if (kbd_token_bits != 0 || ret == 0)
> +       /*
> +        * If KBD_LED_OFF_TOKEN is the only token,
> +        * consider there is no keyboard backlight.
> +        */
> +       if ((kbd_token_bits & ~BIT(5)) != 0 || ret == 0)
>                 kbd_led_present = true;
>  }
>
> --
> 2.13.1
>



-- 
With Best Regards,
Andy Shevchenko
