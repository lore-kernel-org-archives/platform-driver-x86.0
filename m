From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] X86, Acer, WMI: Do not double include linux/dmi.h
 in acer-wmi.c
Date: Mon, 24 Jan 2011 18:34:18 -0700
Message-ID: <4D3EC34A020000230002799D@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jj@chaosbits.net
Cc: trivial@kernel.org, mjg@redhat.com, carlos@strangeworlds.co.uk, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Jesper,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2011-01-24 =E6=96=BC 22:12 +0100=EF=BC=8CJe=
sper Juhl =E6=8F=90=E5=88=B0=EF=BC=9A
> Including linux/dmi.h once in drivers/platform/x86/acer-wmi.c is enou=
gh.
>=20
> Signed-off-by: Jesper Juhl <jj@chaosbits.net>
> ---
>  acer-wmi.c |    1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index c5c4b8c..f21eb53 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -39,7 +39,6 @@
>  #include <linux/slab.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> -#include <linux/dmi.h>
> =20
>  #include <acpi/acpi_drivers.h>
> =20
>=20

Reviewed-by: Lee, Chun-Yi <jlee@novell.com>

Thank's for your patch to fix my fail.

Joey Lee
