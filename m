From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] Support MSI Poulsbo netbook U110/U115
Date: Fri, 13 Aug 2010 03:05:58 -0600
Message-ID: <4C659796020000230001EA4E@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: mjg@redhat.com, gregkh@suse.de, trenn@suse.de, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Dennis.Jansen@web.de

Hi Matthew,=20

Dennis help me to ported this patch to 2.6.35, and it works as expected=
=2E
Could you please give me any suggestions for this patch?


Thank's a lot!
Joey Lee

=E6=96=BC =E4=BA=8C=EF=BC=8C2010-07-13 =E6=96=BC 15:54 +0800=EF=BC=8CLe=
e, Chun-Yi =E6=8F=90=E5=88=B0=EF=BC=9A
> The MSI U110/U115's DSDT have opregion declare, but i915 drm driver
> does not support Poulsbo ship. It causes the acpi backlight control
> interface not generate by i915 drm driver.
> But, we are sure the MSI Poulsbo netbook U110/U115 have workable
> _BCM,_BQC implementation in DSDT and it control brightness by using
> EC but not opregion.
>=20
> So, put a dmi detection in msi-laptop driver and also add wlan/blueto=
oth
> rfkill support on U110/U115.
>=20
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> ---
>  drivers/platform/x86/msi-laptop.c |   41 +++++++++++++++++++++++++++=
++++++++++
>  1 files changed, 41 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86=
/msi-laptop.c
> index afd762b..5f62ad8 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -60,6 +60,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/rfkill.h>
>  #include <linux/i8042.h>
> +#include <acpi/video.h>
> =20
>  #define MSI_DRIVER_VERSION "0.5"
> =20
> @@ -524,6 +525,42 @@ static struct dmi_system_id __initdata msi_load_=
scm_models_dmi_table[] =3D {
>  		},
>  		.callback =3D dmi_check_cb
>  	},
> +	{
> +		.ident =3D "MSI U110",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "U110"),
> +		},
> +		.callback =3D dmi_check_cb
> +	},
> +	{
> +		.ident =3D "MSI U115",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "U115"),
> +		},
> +		.callback =3D dmi_check_cb
> +	},
> +	{ }
> +};
> +
> +static struct dmi_system_id __initdata msi_poulsbo_dmi_table[] =3D {
> +	{
> +		.ident =3D "MSI U110",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "U110"),
> +		},
> +		.callback =3D dmi_check_cb
> +	},
> +	{
> +		.ident =3D "MSI U115",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "U115"),
> +		},
> +		.callback =3D dmi_check_cb
> +	},
>  	{ }
>  };
> =20
> @@ -801,6 +838,8 @@ static int __init msi_init(void)
>  	if (acpi_video_backlight_support()) {
>  		printk(KERN_INFO "MSI: Brightness ignored, must be controlled "
>  		       "by ACPI video driver\n");
> +		if (dmi_check_system(msi_poulsbo_dmi_table))
> +			acpi_video_register();
>  	} else {
>  		struct backlight_properties props;
>  		memset(&props, 0, sizeof(struct backlight_properties));
> @@ -919,3 +958,5 @@ MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:p=
nMS-N034:*");
>  MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N051:*");
>  MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
>  MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnCR620:*");
> +MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU110:*");
> +MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU115:*");
