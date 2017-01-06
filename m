From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: rework logolamp_set() to
 properly handle errors
Date: Fri, 6 Jan 2017 17:25:44 +0200
Message-ID: <CAHp75VfGOW9sD-SLssDqvzbqEmw=21JPZAz_stgm2pRpm5GNrQ@mail.gmail.com>
References: <20170105131129.5750-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36524 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758170AbdAFPZs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Jan 2017 10:25:48 -0500
In-Reply-To: <20170105131129.5750-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 5, 2017 at 3:11 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempni=
u.pl> wrote:
> Potential errors returned by some call_fext_func() calls inside
> logolamp_set() are currently ignored.  Rework logolamp_set() to properly
> handle them.  This causes one more call_fext_func() call to be made in
> the LED_OFF case, though one could argue that this is logically the
> right thing to do (even though the extra call is not needed to shut the
> LED off).
>
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
> This is a follow-up to a recent patch, "platform/x86: fujitsu-laptop:
> use brightness_set_blocking for LED-setting callbacks" and thus needs
> the latter to be applied first (currently it is already applied in
> testing).
>
> Instead of sticking "if (ret < 0) return ret;" in two branches I decided
> to restructure logolamp_set() for improved clarity and also to make it
> resemble logolamp_get() a bit more.
>
>  drivers/platform/x86/fujitsu-laptop.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86=
/fujitsu-laptop.c
> index b725a907a91f..12f7a8346dd0 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -271,15 +271,19 @@ static int call_fext_func(int cmd, int arg0, int ar=
g1, int arg2)
>  static int logolamp_set(struct led_classdev *cdev,
>                                enum led_brightness brightness)
>  {
> -       if (brightness >=3D LED_FULL) {
> -               call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED=
_ON);
> -               return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FU=
NC_LED_ON);
> -       } else if (brightness >=3D LED_HALF) {
> -               call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED=
_ON);
> -               return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FU=
NC_LED_OFF);
> -       } else {
> -               return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, F=
UNC_LED_OFF);

> +       int ret, poweron =3D FUNC_LED_OFF, always =3D FUNC_LED_OFF;
> +
> +       if (brightness >=3D LED_HALF) {
> +               poweron =3D FUNC_LED_ON;
> +               if (brightness >=3D LED_FULL)
> +                       always =3D FUNC_LED_ON;
>         }

But if you set ON by default the above could be written like

    if (brightness < LED_FULL)
        always =3D FUNC_LED_OFF;

    if (brightness < LED_HALF)
        poweron =3D FUNC_LED_OFF;

> +
> +       ret =3D call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron)=
;
> +       if (ret < 0)
> +               return ret;
> +
> +       return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
>  }
>
>  static int kblamps_set(struct led_classdev *cdev,
> --
> 2.11.0
>



--=20
With Best Regards,
Andy Shevchenko
