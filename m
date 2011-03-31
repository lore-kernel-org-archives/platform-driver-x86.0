From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 15/23] msi-laptop: pr_<level> neatening
Date: Thu, 31 Mar 2011 00:41:32 -0600
Message-ID: <4D94BCCC020000230002AA37@novprvlin0050.provo.novell.com>
References: <cover.1301436234.git.joe@perches.com>
 <d4a53369c7b28b2c673661325b75c6eb23f61505.1301436234.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d4a53369c7b28b2c673661325b75c6eb23f61505.1301436234.git.joe@perches.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: joe@perches.com
Cc: mjg@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-03-29 =E6=96=BC 15:21 -0700=EF=BC=8CJo=
e Perches =E6=8F=90=E5=88=B0=EF=BC=9A
> Just making it a bit more like other logging message uses.
>=20
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/platform/x86/msi-laptop.c |    9 ++++-----
>  1 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86=
/msi-laptop.c
> index 23fb2af..f89c0b6 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -447,7 +447,7 @@ static struct platform_device *msipf_device;
> =20
>  static int dmi_check_cb(const struct dmi_system_id *id)
>  {
> -	pr_info("Identified laptop model '%s'.\n", id->ident);
> +	pr_info("Identified laptop model '%s'\n", id->ident);
>  	return 1;
>  }
> =20
> @@ -875,8 +875,7 @@ static int __init msi_init(void)
>  	/* Register backlight stuff */
> =20
>  	if (acpi_video_backlight_support()) {
> -		pr_info("Brightness ignored, must be controlled "
> -		       "by ACPI video driver\n");
> +		pr_info("Brightness ignored, must be controlled by ACPI video driv=
er\n");
>  	} else {
>  		struct backlight_properties props;
>  		memset(&props, 0, sizeof(struct backlight_properties));
> @@ -930,7 +929,7 @@ static int __init msi_init(void)
>  	if (auto_brightness !=3D 2)
>  		set_auto_brightness(auto_brightness);
> =20
> -	pr_info("driver "MSI_DRIVER_VERSION" successfully loaded.\n");
> +	pr_info("driver " MSI_DRIVER_VERSION " successfully loaded\n");
> =20
>  	return 0;
> =20
> @@ -978,7 +977,7 @@ static void __exit msi_cleanup(void)
>  	if (auto_brightness !=3D 2)
>  		set_auto_brightness(1);
> =20
> -	pr_info("driver unloaded.\n");
> +	pr_info("driver unloaded\n");
>  }
> =20
>  module_init(msi_init);

Thank's, it's ok to me.

Acked-by: Lee, Chun-Yi <jlee@novell.com>
