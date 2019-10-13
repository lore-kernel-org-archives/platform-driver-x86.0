From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/4] docs: admin-guide: Move Dell RBU document from driver-api
Date: Sun, 13 Oct 2019 09:23:42 +0300
Message-ID: <CAHp75VfJLDd315SUx+s6WN6-mp-gUSZmhDbydU91_oe0pLbYwg@mail.gmail.com>
References: <20191012171114.6589-1-j.neuschaefer@gmx.net> <20191012171114.6589-2-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012171114.6589-2-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Linux Documentation List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Stuart Hayes <stuart.w.hayes@gmail.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Cornelia Huck <cohuck@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, Shobhit Kukreti <shobhitkukreti@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sinan Kaya <okaya@kernel.org>, Takashi Iwai <tiwai@suse.de>, Ayman Bagabas <ayman.bagabas@gmail.com>, Matan Ziv-Av <matan@svgalib.org>, Hans de Goede <hdegoede@redhat.com>, Enrico Weigelt, metux IT consul
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Oct 12, 2019 at 8:17 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> This document describes how an admin can use the dell_rbu driver, rather
> than any in-kernel API details.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/{driver-api =3D> admin-guide}/dell_rbu.rst | 0
>  Documentation/admin-guide/index.rst                    | 1 +
>  Documentation/driver-api/index.rst                     | 1 -
>  drivers/platform/x86/Kconfig                           | 2 +-
>  drivers/platform/x86/dell_rbu.c                        | 2 +-
>  5 files changed, 3 insertions(+), 3 deletions(-)
>  rename Documentation/{driver-api =3D> admin-guide}/dell_rbu.rst (100%)
>
> diff --git a/Documentation/driver-api/dell_rbu.rst b/Documentation/admin-=
guide/dell_rbu.rst
> similarity index 100%
> rename from Documentation/driver-api/dell_rbu.rst
> rename to Documentation/admin-guide/dell_rbu.rst
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-gu=
ide/index.rst
> index 545ea26364b7..4405b7485312 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -72,6 +72,7 @@ configure specific aspects of kernel behavior to your l=
iking.
>     clearing-warn-once
>     cpu-load
>     cputopology
> +   dell_rbu
>     device-mapper/index
>     efi-stub
>     ext4
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-ap=
i/index.rst
> index 2b3b6949381e..6a3ac50f51f0 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -72,7 +72,6 @@ available subsections can be seen below.
>     connector
>     console
>     dcdbas
> -   dell_rbu
>     edid
>     eisa
>     ipmb
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index ae21d08c65e8..a890f47fbeec 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -259,7 +259,7 @@ config DELL_RBU
>          DELL system. Note you need a Dell OpenManage or Dell Update pack=
age (DUP)
>          supporting application to communicate with the BIOS regarding th=
e new
>          image for the image update to take effect.
> -        See <file:Documentation/driver-api/dell_rbu.rst> for more detail=
s on the driver.
> +        See <file:Documentation/admin-guide/dell_rbu.rst> for more detai=
ls on the driver.
>
>
>  config FUJITSU_LAPTOP
> diff --git a/drivers/platform/x86/dell_rbu.c b/drivers/platform/x86/dell_=
rbu.c
> index 3691391fea6b..7d5453326b43 100644
> --- a/drivers/platform/x86/dell_rbu.c
> +++ b/drivers/platform/x86/dell_rbu.c
> @@ -24,7 +24,7 @@
>   * on every time the packet data is written. This driver requires an
>   * application to break the BIOS image in to fixed sized packet chunks.
>   *
> - * See Documentation/driver-api/dell_rbu.rst for more info.
> + * See Documentation/admin-guide/dell_rbu.rst for more info.
>   */
>  #include <linux/init.h>
>  #include <linux/module.h>
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko
