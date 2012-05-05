From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add Acer Extensa 5235 to video backlight
 vendor
Date: Sat, 05 May 2012 20:26:14 +0800
Message-ID: <1336220774.5272.3104.camel@linux-s257.site>
References: <1334739667-20398-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:44504 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755052Ab2EEM3V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 5 May 2012 08:29:21 -0400
In-Reply-To: <1334739667-20398-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, Bence Lukacs <lukacs.bence1@gmail.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

=E6=96=BC =E4=B8=89=EF=BC=8C2012-04-18 =E6=96=BC 17:01 +0800=EF=BC=8CLe=
e, Chun-Yi =E6=8F=90=E5=88=B0=EF=BC=9A
> From: "Lee, Chun-Yi" <jlee@suse.com>
>=20
> Acer Extensa 5235 laptop have broken _BCM implemenation, the AML
> code wrote value to EC register but firmware didn't change brighenss.
>=20
> Fortunately, the brightness control works on those machines with vend=
or mode.
> So, add this machine to video backlight vendor mode quirk table.
>=20
> Reference: bko#42833
> 	https://bugzilla.kernel.org/show_bug.cgi?id=3D42833
>=20
> Cc: Bence Lukacs <lukacs.bence1@gmail.com>
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Dmitry Torokhov <dtor@mail.ru>
> Cc: Corentin Chary <corentincj@iksaif.net>
> Cc: Thomas Renninger <trenn@suse.de>
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index c1a3fd8..c2a237f 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -523,6 +523,14 @@ static const struct dmi_system_id video_vendor_d=
mi_table[] =3D {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
>  		},
>  	},
> +	{
> +		.callback =3D video_set_backlight_video_vendor,
> +		.ident =3D "Acer Extensa 5235",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
> +		},
> +	},
>  	{}
>  };
> =20

Collected more issue machines need add to quirk table.

I just re-sent patch:
[PATCH] acer-wmi: add 3 laptops to video backlight vendor mode quirk
table


Thanks
Joey Lee
