From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 5/5] dell-wmi: support Dell Inspiron M5110
Date: Mon, 29 Feb 2016 14:00:57 +0100
Message-ID: <20160229130057.GJ21814@pali>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-6-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456298416-29683-6-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 24 February 2016 08:20:15 Micha=C5=82 K=C4=99pie=C5=84 wro=
te:
> Similarly to Dell Vostro V131, Dell Inspiron M5110 also requires an
> SMBIOS request to be issued in order for WMI events to be generated a=
nd
> does not raise an i8042 interrupt when the Dell Instant Launch hotkey=
 is
> pressed.  However, the event code for that hotkey on this machine is
> 0xe029, so add it to the legacy keymap.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> Tested-by: Darek Stojaczyk <darek.stojaczyk@gmail.com>
> ---
>  drivers/platform/x86/dell-wmi.c |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index ffc957b5..b1479ab 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -62,6 +62,14 @@ static int __init dmi_matched(const struct dmi_sys=
tem_id *dmi)
>  static const struct dmi_system_id dell_wmi_smbios_list[] __initconst=
 =3D {
>  	{
>  		.callback =3D dmi_matched,
> +		.ident =3D "Dell Inspiron M5110",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron M5110"),
> +		},
> +	},
> +	{
> +		.callback =3D dmi_matched,
>  		.ident =3D "Dell Vostro V131",
>  		.matches =3D {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> @@ -110,8 +118,11 @@ static const struct key_entry dell_wmi_legacy_ke=
ymap[] __initconst =3D {
> =20
>  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> =20
> -	/* Shortcut and audio panel keys */
> +	/* Dell Instant Launch key */
>  	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> +	{ KE_KEY, 0xe029, { KEY_PROG4 } },
> +
> +	/* Audio panel key */
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> =20
>  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },

That's better, add my Reviewed-by.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
