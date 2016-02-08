From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 5/5] asus-wmi: Add quirk_no_rfkill for the Asus Z550MA
Date: Mon, 8 Feb 2016 13:03:38 -0800
Message-ID: <20160208210338.GR1779@malice.jf.intel.com>
References: <1454951123-27470-1-git-send-email-jprvita@endlessm.com>
 <1454951123-27470-6-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42782 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754995AbcBHVDj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Feb 2016 16:03:39 -0500
Content-Disposition: inline
In-Reply-To: <1454951123-27470-6-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Mon, Feb 08, 2016 at 12:05:23PM -0500, Jo=E3o Paulo Rechi Vita wrote=
:

I'm waiting for the RFKILL reviews to complete, but quickly, patches 4 =
and 5
require a commit message. There is always something you can add here, f=
or
example, do these not have a switch or is it handled by a different dri=
ver? Etc.

> Signed-off-by: Jo=E3o Paulo Rechi Vita <jprvita@endlessm.com>
> Reported-by: Ming Shuo Chiu <chiu@endlessm.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x8=
6/asus-nb-wmi.c
> index 4ded187..5adb842 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -328,6 +328,15 @@ static const struct dmi_system_id asus_quirks[] =
=3D {
>  		},
>  		.driver_data =3D &quirk_no_rfkill,
>  	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "ASUSTeK COMPUTER INC. Z550MA",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Z550MA"),
> +		},
> +		.driver_data =3D &quirk_no_rfkill,
> +	},
>  	{},
>  };
> =20
> --=20
> 2.5.0
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
