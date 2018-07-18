From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [FIXED][PATCH] dell-laptop: Fix backlight detection
Date: Wed, 18 Jul 2018 13:23:12 +0300
Message-ID: <CAHp75VcUJ70dtNcGfuJbo473ddOJ4_RdgcNsk_sVE5uVeHf_4Q@mail.gmail.com>
References: <20180718100601.GA30600@han>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718100601.GA30600@han>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Damien_Th=C3=A9bault?= <damien@dtbo.net>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 18, 2018 at 1:06 PM, Damien Th=C3=A9bault <damien@dtbo.net> wro=
te:
> Fix return code check for "max brightness" ACPI call.
>
> The dell laptop ACPI video brightness control is not present on dell
> laptops anymore, but was present in older kernel versions.
>
> The code that checks the return value is incorrect since the SMM
> refactoring.
>
> The old code was:
>   if (buffer->output[0] =3D=3D 0)
>
> Which was changed to:
>   ret =3D dell_send_request(...)
>   if (ret)
>
> However, dell_send_request() will return 0 if buffer->output[0] =3D=3D 0,
> so we must change the check to:
>   if (ret =3D=3D 0)
>
> This issue was found on a Dell M4800 laptop, and the fix tested on it
> as well.
>

I have pushed this to my review and testing queue, thanks!

But I'm going to push this to Linus this week since it's definitely
stable material.

> Fixes: 549b4930f057 ("dell-smbios: Introduce dispatcher for SMM calls")
> Signed-off-by: Damien Th=C3=A9bault <damien@dtbo.net>
> Tested-by: Damien Th=C3=A9bault <damien@dtbo.net>
> Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index f1fa8612db40..06978c14c83b 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2185,7 +2185,7 @@ static int __init dell_init(void)
>                 dell_fill_request(&buffer, token->location, 0, 0, 0);
>                 ret =3D dell_send_request(&buffer,
>                                         CLASS_TOKEN_READ, SELECT_TOKEN_AC=
);
> -               if (ret)
> +               if (ret =3D=3D 0)
>                         max_intensity =3D buffer.output[3];
>         }
>
> --
> 2.18.0
>



--=20
With Best Regards,
Andy Shevchenko
