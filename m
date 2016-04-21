From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] asus-laptop: remove redundant initializers
Date: Fri, 22 Apr 2016 02:01:53 +0300
Message-ID: <CAHp75VesGPg28bDhsXCuuQGNuwedhivY9Dd+FLWUSMeWpvhrjQ@mail.gmail.com>
References: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34479 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751594AbcDUXBy convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Apr 2016 19:01:54 -0400
In-Reply-To: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Apr 16, 2016 at 3:01 AM, Giedrius Statkevi=C4=8Dius
<giedrius.statkevicius@gmail.com> wrote:
> Initializing rv to AE_OK is pointless because later function results =
are
> assigned to them and only then the variable is used
>
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmai=
l.com>

=46ine to me:
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> ---
>  drivers/platform/x86/asus-laptop.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index f2b5d0a..d86d42e 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -771,7 +771,7 @@ static int asus_read_brightness(struct backlight_=
device *bd)
>  {
>         struct asus_laptop *asus =3D bl_get_data(bd);
>         unsigned long long value;
> -       acpi_status rv =3D AE_OK;
> +       acpi_status rv;
>
>         rv =3D acpi_evaluate_integer(asus->handle, METHOD_BRIGHTNESS_=
GET,
>                                    NULL, &value);
> @@ -865,7 +865,7 @@ static ssize_t infos_show(struct device *dev, str=
uct device_attribute *attr,
>         int len =3D 0;
>         unsigned long long temp;
>         char buf[16];           /* enough for all info */
> -       acpi_status rv =3D AE_OK;
> +       acpi_status rv;
>
>         /*
>          * We use the easy way, we don't care of off and count,
> @@ -1265,7 +1265,7 @@ static DEVICE_ATTR_RO(ls_value);
>  static int asus_gps_status(struct asus_laptop *asus)
>  {
>         unsigned long long status;
> -       acpi_status rv =3D AE_OK;
> +       acpi_status rv;
>
>         rv =3D acpi_evaluate_integer(asus->handle, METHOD_GPS_STATUS,
>                                    NULL, &status);
> --
> 2.8.0
>



--=20
With Best Regards,
Andy Shevchenko
