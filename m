Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4A2BDC1C;
	Fri, 16 Oct 2026 08:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138596; cv=none; b=XS82UannXosfc0Jie5UQQIcCCNPaNmTHzRT7WB3hO5BSCbt4yX2gAWAZi/57pXMXFODso0+LqTgB/WJ6fasA1NUT1nTFJCVpb0ve5IkEWA09O/1jU/xWERoETwTAoAeixFObej6w7pWgVB3Hvc/cAyRtCtNcykVtO2mki8APf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138596; c=relaxed/simple;
	bh=6TOnW/MA4pMf99mGWUzYsj73jWLOXg/h4TzwFJtG1x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oqw84HhEb19pkko6FhTDn8Q4cKaNvdfWkMhR7a8RoigViICmCSjQhwEWQzauv+/u32yRHI6KbOWZI0o9YCpuHM4zcIEgRqj7ZLHuPwH0+5x2tkoEkL7UzGRBesOAh6I9zxxNtw53cMZKz5Rn3lyaFVIBEanpfynyAz/hoo1gi40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CtrghCmD; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CtrghCmD"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A48C78086C;
	Fri, 16 Oct 2026 10:16:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfgfk5ePhhTs; Fri, 16 Oct 2026 10:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792138591; bh=6TOnW/MA4pMf99mGWUzYsj73jWLOXg/h4TzwFJtG1x8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CtrghCmD4i1Cocg3bZXAewE9n71xPHw6tKpwQ6Kzvjwp66kQhIvNtLOeRoPXQFK9p
	 8F9YZTq5k2AO1xbDF25C/hK1xxQmrdVH8QZUnhHN9oXzBQ9o5/+0Ynrs2IMuEVX0e7
	 l43/seT75UKZl6ooFlZ+imXM0J7KugJRcInTSJCLK0db2Lv6QbvsV88yic5JS7o3gK
	 hWJl7dHYBMvQ+e13PUtr0vW+nUJhNo6De9unz8NH8dKe1osyHloI68nZp1zp9r1jfF
	 ScdjIssUJOQw7ah1nIE537/geQ2n1cevAC/4UgyM2wiBmd9HwQV0vf9eecU+6kDASd
	 lNFj7gXop/jeA==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>,
 Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 6/6] platform/x86: asus-armoury: add power limits quirk for G533QS
Date: Fri, 16 Oct 2026 10:16:17 +0200
Message-ID: <3aECX-AIQvCO8gjgxWHq5g@disroot.org>
In-Reply-To: <20261015181850.170862-7-scardracs@disroot.org>
References:
 <20261015181850.170862-1-scardracs@disroot.org>
 <20261015181850.170862-7-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data gioved=C3=AC 15 ottobre 2026 20:18:50 Ora legale dell=E2=80=99Europ=
a centrale,=20
Marco Scardovi ha scritto:
> add power limits quirk entry for ASUS G533QS laptop.
> The limits are extracted from the device's ThrottleGear XML configuration.
>=20
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
>  1 file changed, 13 insertions(+), 0 deletions(-)
>=20
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -1223,6 +1223,19 @@
>  	},
>  		{
>  			.matches =3D {
> +				DMI_MATCH(DMI_BOARD_NAME,=20
"G533QS"),
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
> +		{
> +			.matches =3D {
>  				DMI_MATCH(DMI_BOARD_NAME,=20
"G713QR"),
>  			},
>  			.driver_data =3D &(struct power_data) {

There was a cover as well but seems it didn't start at all...
@Ilpo these are the models I sent +2 new models asked in the meantime (that=
's
why I waited a bit to send them again). I don't have any rush to see them
merged as always.

Best Regards,
Marco



