From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] asus-laptop: correct error handling in asus_read_brightness()
Date: Fri, 22 Apr 2016 02:09:22 +0300
Message-ID: <CAHp75VeS86iWKxTGVWmSgVcJ9cTgLWM7tDAmdonipB7pskJEHg@mail.gmail.com>
References: <1460766432-5390-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:32961 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753927AbcDUXJX convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Apr 2016 19:09:23 -0400
In-Reply-To: <1460766432-5390-1-git-send-email-giedrius.statkevicius@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Apr 16, 2016 at 3:27 AM, Giedrius Statkevi=C4=8Dius
<giedrius.statkevicius@gmail.com> wrote:
> It is possible that acpi_evaluate_integer might fail and value would =
not be
> set to any value so correct this defect by returning 0 in case of an
> error. This is also the correct thing to return because the backlight
> subsystem will print the old value of brightness in this case.
>
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmai=
l.com>
> ---
>  drivers/platform/x86/asus-laptop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index 9a69734..15f1311 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -775,8 +775,10 @@ static int asus_read_brightness(struct backlight=
_device *bd)
>
>         rv =3D acpi_evaluate_integer(asus->handle, METHOD_BRIGHTNESS_=
GET,
>                                    NULL, &value);
> -       if (ACPI_FAILURE(rv))
> +       if (ACPI_FAILURE(rv)) {
>                 pr_warn("Error reading brightness\n");
> +               return 0;
> +       }

This looks like a workaround.
I suppose the real fix is to return here an error code and fix all call=
ers, like
drivers/video/backlight/backlight.c.

>
>         return value;
>  }
> --
> 2.8.0
>



--=20
With Best Regards,
Andy Shevchenko
