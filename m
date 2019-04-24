From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Mark expected switch fall-throughs
Date: Wed, 24 Apr 2019 12:05:01 -0700
Message-ID: <CAGXu5jKRO45m1TRDPA09sv0j+cZCC8e1w+oQty4YfOttKP3FYA@mail.gmail.com>
References: <20190424181543.GA31200@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424181543.GA31200@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 24, 2019 at 11:15 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
>
> This patch fixes the following warnings:
>
> drivers/platform/x86/thinkpad_acpi.c: In function =E2=80=98thermal_get_se=
nsor=E2=80=99:
> drivers/platform/x86/thinkpad_acpi.c:6316:6: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
>    if (idx >=3D 8 && idx <=3D 15) {
>       ^
> drivers/platform/x86/thinkpad_acpi.c:6322:2: note: here
>   case TPACPI_THERMAL_TPEC_8:
>   ^~~~
> drivers/platform/x86/thinkpad_acpi.c: In function =E2=80=98hotkey_notify=
=E2=80=99:
> drivers/platform/x86/thinkpad_acpi.c:4208:7: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
>     if (tp_features.hotkey_wlsw &&
>        ^
> drivers/platform/x86/thinkpad_acpi.c:4216:3: note: here
>    default:
>    ^~~~~~~
>
> Warning level 3 was used: -Wimplicit-fallthrough=3D3
>
> Notice that, in this particular case, the code comments are modified
> in accordance with what GCC is expecting to find.
>
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index 57d9ae9d8e56..826e9a276818 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4212,7 +4212,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u=
32 event)
>                                 known_ev =3D true;
>                                 break;
>                         }
> -                       /* fallthrough to default */
> +                       /* fallthrough - to default */
>                 default:
>                         known_ev =3D false;
>                 }
> @@ -6317,8 +6317,8 @@ static int thermal_get_sensor(int idx, s32 *value)
>                         t =3D TP_EC_THERMAL_TMP8;
>                         idx -=3D 8;
>                 }
> -               /* fallthrough */
>  #endif
> +               /* fallthrough */
>         case TPACPI_THERMAL_TPEC_8:
>                 if (idx <=3D 7) {
>                         if (!acpi_ec_read(t + idx, &tmp))
> --
> 2.21.0
>


--=20
Kees Cook
