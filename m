Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52AA2C3255;
	Fri, 16 Oct 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156167; cv=none; b=Mg0FxSpjPlhsok6yqFdWGiSuBAU7WLjj4b6S7OaqhDcZDIhA7WW1TfpV35ROhgMYck1R6M92CurAEtfN2Zx5OmpWc4aOOPVyLpU76G6FawTEH2PZNsa6SZv6ZB2D6Z+JwOI2m4nQLednYeOOfUjtVnrILEfwUYzVpnfLVbWt4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156167; c=relaxed/simple;
	bh=yfuGhkRfJh4DGptjcTurEX/F5q3zn95/7HuMQy6b2GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TByF2VLADmMtYl/W8KWM9WGzaVapT2Il9Oh6OpYzUZKHuAGQmA1paPj2p+2iVG+GFEFMESbmUVWahulVCIXID9z8/6R6Nllq9emw6s8wZa26Ykv1iWiIHyj6VkfVRE5iKNRgOTZfh7APg5kTW0pALlOPPAXwCZfQ0TzInVXW4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Y3kxqTYB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Y3kxqTYB"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6E50580B7F;
	Fri, 16 Oct 2026 15:09:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4F_5ky34S4F; Fri, 16 Oct 2026 15:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792156163; bh=yfuGhkRfJh4DGptjcTurEX/F5q3zn95/7HuMQy6b2GE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y3kxqTYB0fcBA+J+c0LkF43F7zE/KU5d0+tgvU16uqbhtWl4WoNrWODinhVKdSJFo
	 vf4GTo75G1RYt3Gzl1Kk0V3cUGlenljUtB/8bEjDjjbbm4gJlXSqpsWcP3cHj4f4Qh
	 z0+WdVUgM4ZO4KmXebInzmy+G0WhaCD4FI3Uo3QQ++zCFwduNxQ8iIXWHNzoz222P5
	 H1oehVLubltifDLNcKDzvUsDeZ/cbQNJ5HuSal0tRpy6nFsElysItaxYagn9oUt4sq
	 Nl2BTiuxhX1HRh3W6tJ+GrScl/cbxA9rBTAOjHC7NY4EQNM+CZNTfiT2H7sRiAvK/S
	 SDNS7wFVvSSjw==
From: Marco Scardovi <scardracs@disroot.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>,
 Denis Benato <denis.benato@linux.dev>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 1/6] platform/x86: asus-armoury: add power limits quirk for
 G713QR
Date: Fri, 16 Oct 2026 15:09:10 +0200
Message-ID: <a4wgP33YQQayT9y_yt9msQ@disroot.org>
In-Reply-To: <20261016130342.69923-2-scardracs@disroot.org>
References:
 <20261016130342.69923-1-scardracs@disroot.org>
 <20261016130342.69923-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data venerd=C3=AC 16 ottobre 2026 15:03:37 Ora legale dell=E2=80=99Europ=
a centrale,=20
Marco Scardovi ha scritto:
> Add a power limits quirk entry for the ASUS G713QR laptop. The limits
> are extracted from the device's ThrottleGear XML configuration.
>=20
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
>  1 file changed, 13 insertions(+), 0 deletions(-)
>=20
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -1130,6 +1130,19 @@
>  			.requires_fan_curve =3D true,
>  		},
>  	},
> +		{
> +			.matches =3D {
> +				DMI_MATCH(DMI_BOARD_NAME,=20
"G713QR"),
> +			},
> +			.driver_data =3D &(struct power_data) {
> +				.ac_data =3D &(struct power_limits)=20
{
> +					.ppt_pl1_spl_max =3D 80,
> +					.ppt_pl1_spl_min =3D 15,
> +					.ppt_pl2_sppt_max =3D 80,
> +					.ppt_pl2_sppt_min =3D 15,
> +				},
> +			},
> +		},
>  	{
>  		.matches =3D {
>  			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),

I don't really get why git 2.56 refuses to send the cover letter: I've neve=
r=20
had this problem before...

"From: Marco Scardovi <scardracs@disroot.org>
Date: Fri, 16 Oct 2026 14:57:05 +0200
Subject: [PATCH v3 0/6] platform/x86: asus-armoury: add/update power limits=
=20
quirks

Hi Ilpo,
sent the v3 because in the meantime I found how to pick up the missing
nv_tgp_{minx,max} from the ThrottleGear file. They are all encrypted
so it took a bit of time figuring it out.

This series adds power limits quirk entries for ASUS laptops. The limits
are extracted from each device's ThrottleGear XML configuration.

Changes in v3:
 - FA608PM, FA608UH, and FA608UP now include nv_tgp_min/max derived from
   AC_Config.TGP and TGPItem Level* offsets (missing in v2).
  =20
Changes in v2 [1]:
 - Corrected english grammar

Changes in v1 [2]:
 - First release

[1] https://lore.kernel.org/all/20261016121432.35071-7-scardracs@disroot.or=
g/
[2] https://lore.kernel.org/all/20261015181850.170862-2-scardracs@disroot.o=
rg/

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
=2D-=20
2.56.0"



