From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Fri, 27 Dec 2013 11:51:14 +0800
Message-ID: <1388116274.3539.6046.camel@linux-s257.site>
References: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:37646 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754205Ab3L0EMk (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Thu, 26 Dec 2013 23:12:40 -0500
In-Reply-To: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org

Hi Oleksij,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2013-12-05 =E6=96=BC 14:00 +0100=EF=BC=8COl=
eksij Rempel =E6=8F=90=E5=88=B0=EF=BC=9A
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  drivers/platform/x86/acer-wmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index c9076bd..d5ca1648 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -572,6 +572,14 @@ static const struct dmi_system_id video_vendor_d=
mi_table[] =3D {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
>  		},
>  	},
> +	{
> +		.callback =3D video_set_backlight_video_vendor,
> +		.ident =3D "Acer Aspire E1-572",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire E1-572"),
> +		},
> +	},
>  	{}
>  };
> =20

I have applied this patch, build and load acer-wmi driver, didn't see
problem.

Acked-by: Lee, Chun-Yi <jlee@suse.com>


Thanks for your patch!
Joey Lee
