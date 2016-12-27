From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: set default trigger for
 radio LED to rfkill-any
Date: Tue, 27 Dec 2016 13:51:22 +0200
Message-ID: <CAHp75Ve1p8VfwxKcg7AZmdiU=ZXj0iQfdzriuMCR9cRHe2JjVg@mail.gmail.com>
References: <20161216144603.19100-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35881 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754688AbcL0LvY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Dec 2016 06:51:24 -0500
In-Reply-To: <20161216144603.19100-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Dec 16, 2016 at 4:46 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempn=
iu.pl> wrote:
> The "radio components indicator" LED present in Lifebook E734/E744/E754
> should be lit when any radio transmitter is enabled, so set its default
> trigger to rfkill-any.
>

Pushed to testing, thanks!

> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
> Note: the rfkill-any trigger is currently only present in
> mac80211-next/master.
>
>  drivers/platform/x86/fujitsu-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86=
/fujitsu-laptop.c
> index 61f39ab..bfc0eb3 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -202,6 +202,7 @@ static void radio_led_set(struct led_classdev *cdev,
>
>  static struct led_classdev radio_led =3D {
>   .name =3D "fujitsu::radio_led",
> + .default_trigger =3D "rfkill-any",
>   .brightness_get =3D radio_led_get,
>   .brightness_set =3D radio_led_set
>  };
> --
> 2.10.2
>



--=20
With Best Regards,
Andy Shevchenko
