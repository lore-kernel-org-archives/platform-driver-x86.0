From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wireless: Fix format specifier
Date: Thu, 31 May 2018 13:35:38 +0300
Message-ID: <CAHp75VcorKkNiK+0m6cVsT2zccUMqSOibcod0BdobwT76YS4nw@mail.gmail.com>
References: <20180522212956.5433-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180522212956.5433-1-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Upstreaming Team <linux@endlessm.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 23, 2018 at 12:29 AM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
> From: Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>
>
> u64 should be printed with %llx instead of %x and cast to uint.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>
> ---
>  drivers/platform/x86/asus-wireless.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/=
asus-wireless.c
> index f086469ea740..6afd011de9e5 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -72,7 +72,7 @@ static u64 asus_wireless_method(acpi_handle handle, con=
st char *method,
>                 acpi_handle_err(handle,
>                                 "Failed to eval method %s, param %#x (%d)=
\n",
>                                 method, param, s);
> -       acpi_handle_debug(handle, "%s returned %#x\n", method, (uint) ret=
);
> +       acpi_handle_debug(handle, "%s returned %#llx\n", method, ret);
>         return ret;
>  }
>
> --
> 2.17.0
>



--=20
With Best Regards,
Andy Shevchenko
