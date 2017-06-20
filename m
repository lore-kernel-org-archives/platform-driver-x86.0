From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform/x86: dell-laptop: Fix bogus keyboard
 backlight sysfs interface
Date: Tue, 20 Jun 2017 20:25:36 +0300
Message-ID: <CAHp75Vc+9X5LKnoaO=Q3UGqH4Ok-pBxKpgE5zFSpcX_1e9v2=A@mail.gmail.com>
References: <20170620030519.629-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35489 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751140AbdFTRZm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2017 13:25:42 -0400
In-Reply-To: <20170620030519.629-1-kai.heng.feng@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 20, 2017 at 6:05 AM, Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
> Dell Latitude 3160 does not have keyboard backlight, but there is a
> sysfs interface for it, which does nothing at all.
>
> KBD_LED_ON_TOKEN is the only token can be found. Since it doesn't have
> KBD_LED_OFF_TOKEN or KBD_LED_AUTO_*_TOKEN, it should be safe to assume
> at least two tokens should be present to support keyboard backlight.
> Not all models have ON token - they may have multiple AUTO tokens instead=
.
>
> Models which do not use SMBIOS token to control keyboard backlight, also
> have this issue. Brightness level is 0 on these models. Verified on Dell
> Inspiron 3565.
>
> Reports keyboard backlight is supported only when at least two modes are
> present.
>

Pushed to testing, thanks!

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>
> v4:
> Change commit log - not all models have ON token.
>
> v3:
> Change the logic, there should be at least two modes present to claim it
> supports backlight. Suggested by Pali Roh=C3=A1r.
>
> v2:
> The only token can be found is actually KBD_LED_ON_TOKEN, which is BIT(5)=
,
> instead of KBD_LED_OFF_TOKEN. Change commit log accordingly.
>
> Use token bit to make the intention more clear.
> Also consider kbd_mode_levels_count and kbd_info.levels, suggested by
> Pali Roh=C3=A1r.
>
> Use XOR to simplify the bitmask comparison, suggested by
> Andy Shevchenko.
>
>  drivers/platform/x86/dell-laptop.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index ec202094bd50..f42159fd2031 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -1510,7 +1510,11 @@ static void kbd_init(void)
>         ret =3D kbd_init_info();
>         kbd_init_tokens();
>
> -       if (kbd_token_bits !=3D 0 || ret =3D=3D 0)
> +       /*
> +        * Only supports keyboard backlight when it has at least two mode=
s.
> +        */
> +       if ((ret =3D=3D 0 && (kbd_info.levels !=3D 0 || kbd_mode_levels_c=
ount >=3D 2))
> +           || kbd_get_valid_token_counts() >=3D 2)
>                 kbd_led_present =3D true;
>  }
>
> --
> 2.13.1
>



--=20
With Best Regards,
Andy Shevchenko
