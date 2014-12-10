From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: Re: [PATCH v2] acpi: Add "acpi_osi=" for ASUS X200MA to enable brightness
Date: Wed, 10 Dec 2014 17:29:11 +0300
Message-ID: <548858B7.1020307@gmail.com>
References: <54845180.4060206@gmail.com> <548465CA.8020905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <548465CA.8020905@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This patch is only a temporary hack. This issue should be fixed by othe=
r ways.
See https://bugzilla.kernel.org/show_bug.cgi?id=3D70241#c70

07.12.2014 17:35, Dmitry Tunin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Add "acpi_osi=3D" quirk for ASUS X200MA
> More information can be found in UX302LA bugreport
> https://bugzilla.kernel.org/show_bug.cgi?id=3D70241
>
> I reported it to launchpad too
> https://bugs.launchpad.net/ubuntu/bug/1400068
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
> ---
>   drivers/acpi/blacklist.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/drivers/acpi/blacklist.c b/drivers/acpi/blacklist.c
> index 7556e7c..f78ed08 100644
> --- a/drivers/acpi/blacklist.c
> +++ b/drivers/acpi/blacklist.c
> @@ -162,6 +162,17 @@ static int __init dmi_disable_osi_win8(const str=
uct dmi_system_id *d)
>       acpi_osi_setup("!Windows 2012");
>       return 0;
>   }
> +/*
> + * Some ASUS models firmware declares 16 devices instead of 8
> + * 'acpi_osi=3D' kernel parameter fixes it
> + * Without this parameters brightness keys Fn+F5 and F6 do not work
> + */
> +static int __init dmi_disable_osi_all(const struct dmi_system_id *d)
> +{
> +    printk(KERN_NOTICE PREFIX "DMI detected: %s\n", d->ident);
> +    acpi_osi_setup("");
> +    return 0;
> +}
>
>   static struct dmi_system_id acpi_osi_dmi_table[] __initdata =3D {
>       {
> @@ -371,6 +382,15 @@ static struct dmi_system_id acpi_osi_dmi_table[]=
 __initdata =3D {
>                DMI_MATCH(DMI_PRODUCT_NAME, "1015PX"),
>           },
>       },
> +    /* Without this brightness keys do not work */
> +    {
> +    .callback =3D dmi_disable_osi_all,
> +    .ident =3D "ASUSTeK COMPUTER INC. X200MA",
> +    .matches =3D {
> +             DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +             DMI_MATCH(DMI_PRODUCT_NAME, "X200MA"),
> +        },
> +    },
>       {}
>   };
>
