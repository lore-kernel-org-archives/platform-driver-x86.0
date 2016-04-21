From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/2] asus-laptop: correct error handling in sysfs_acpi_set
Date: Thu, 21 Apr 2016 23:34:13 +0300
Message-ID: <CAHp75Vc8qrSouEUNP5p8OuzVgS84D8pLA_iS0wLzgrocdLcLwQ@mail.gmail.com>
References: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
	<1460764917-1042-2-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35290 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751959AbcDUUeO convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Apr 2016 16:34:14 -0400
In-Reply-To: <1460764917-1042-2-git-send-email-giedrius.statkevicius@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Apr 16, 2016 at 3:01 AM, Giedrius Statkevi=C4=8Dius
<giedrius.statkevicius@gmail.com> wrote:
> Properly return rv back to the caller in the case of an error in
> parse_arg. In the process remove a unused variable 'out'.
>
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmai=
l.com>
> ---
>  drivers/platform/x86/asus-laptop.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index d86d42e..9a69734 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -946,11 +946,10 @@ static ssize_t sysfs_acpi_set(struct asus_lapto=
p *asus,
>                               const char *method)
>  {
>         int rv, value;
> -       int out =3D 0;
>
>         rv =3D parse_arg(buf, count, &value);

Just noticed (might be a separate patch for this) that parse_arg
pretty much duplicated kstrotint().

> -       if (rv > 0)
> -               out =3D value ? 1 : 0;
> +       if (rv <=3D 0)
> +               return rv;
>
>         if (write_acpi_int(asus->handle, method, value))
>                 return -ENODEV;
> --
> 2.8.0
>



--=20
With Best Regards,
Andy Shevchenko
