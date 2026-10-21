Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567850;
	b=1nfb6HsRPOacVQ5AY4ODL6Sb5O+YzjrQpUOkHrFVClsAqJjdA5HROSIIGrcbwXP2II4l
	 GTE8qM7e2yL8i/wNvo79Erx7KjZqmVarWAI8N3jeKeL4bnT0QUBAJqvooJVr2E5HUhrZZ
	 VDqte/6v6qjvC3fN8erv8cGIkxmbrfdYfE69IqK8g9NkCFFLkSqAyhcN8ppcqhh0Jn9Wz
	 4p2Z3adQPlZYeQ13hP+/6vX4Q6d0pV1w0tCbTvALfmQyBGPi1ciVAwIDjn8Wrb1bj/Q9z
	 xO6E7CBiyBD/QJNrt8ATghgTc21qyONfTdY1faCFETD+Rc3Prd5fIZV+9Uk6M5ppvSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567850;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=W31E15VGlOVQep9EqF26ElQ82xuMa5K/7EK5I1I/cIc=;
	b=3t/Hyzc2cIUzu8l/ff968gd3Wk0lD/b7oman1hR7UDjHK+wktUpw4FbRgxE69Qm2AFcm
	 DoSK940bbIIvsDdZa7jy8aN/beEPghOmg0jdWEeWEPkHks5pRf1dPjIVQmA0QH+zByfg9
	 FHYEUcu3KqOfHgOsUbmjKucvER3nGBNv8G9Kj4gKHc3L/BsEItXMmkYvMKrHwnBTKV1Re
	 JbPtSrxnShuM7LfVbIXBnGnOALqQi/EpdlsAPUIIwViWAU68xGC92kvWyn/PlURucsQIA
	 +4F4qwTtPqBMi4YnWLMvdpYFGBb4GX6+d+J4OYXHEnjwBW9drD/oNyK28qBr42BQAaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=cfmpDUOQ;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6FE606A319;
	Wed, 21 Oct 2026 07:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6FE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=cfmpDUOQ
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2CD1F80B59;
	Wed, 21 Oct 2026 09:30:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i272z7d774F3; Wed, 21 Oct 2026 09:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792567847; bh=rELVij0bL8e8NTCJ6ISjSfRIzs33gAJQF13WpzmKwso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cfmpDUOQw99xQmhWpBR7Dnp4FWlZ7YX4F/6nMi1aoPjvOxnUryN7q6NyKVrE9yBus
	 v2BGMqSkgWzvjQAi8MgQzW/IkEg1pyZCmHEk3xhYQGPR8HFkO2qCi1hoWm4iQmMGWc
	 FR7SJecm67y44Vtro7XVOXdRf5+Y6wJU9GUKiLEw5OKQ+igKfT1wqjzZaJ/ITiH3/1
	 YXBYFPMOSdO5U9Mcb6CAmEkeaaKyyf4E5+vt6+45bTaxvtCTEWZAKs9m1cUa0hG/dt
	 NhSlOY7UOHhPFbXTjlt9KCX/VCt0wGMPkGAVvdQyj2bpBwTBJ7CmBkP0JBAcZ9vyHf
	 bagPVuOLkipWg==
From: Marco Scardovi <scardracs@disroot.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>,
 Denis Benato <denis.benato@linux.dev>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 1/7] platform/x86: asus-armoury: add power limits quirk for
 G713QR
Date: Wed, 21 Oct 2026 09:30:33 +0200
Message-ID: <W1K_qYn4STu-RNblanTwqQ@disroot.org>
In-Reply-To: <20261021070948.19916-2-scardracs@disroot.org>
References:
 <20261021070948.19916-1-scardracs@disroot.org>
 <20261021070948.19916-2-scardracs@disroot.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data mercoled=C3=AC 21 ottobre 2026 09:08:13 Ora legale dell=E2=80=99Eur=
opa centrale,=20
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
> @@ -1132,6 +1132,19 @@
>  	},
>  	{
>  		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
> +		},
> +		.driver_data =3D &(struct power_data) {
> +			.ac_data =3D &(struct power_limits) {
> +				.ppt_pl1_spl_max =3D 80,
> +				.ppt_pl1_spl_min =3D 15,
> +				.ppt_pl2_sppt_max =3D 80,
> +				.ppt_pl2_sppt_min =3D 15,
> +			},
> +		},
> +	},
> +	{
> +		.matches =3D {
>  			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),
>  		},
>  		.driver_data =3D &(struct power_data) {

So I found out the problem is with disroot itself and git send-email instea=
d=20
of something else. Sending cover letter here.

=46rom: Marco Scardovi <scardracs@disroot.org>
Date: Wed, 21 Oct 2026 08:54:47 +0200
Subject: [PATCH v4 0/7] platform/x86: asus-armoury: add/update power limits=
=20
quirks

Hi Ilpo,
thank you for pointing it out: while adding the nv_tgp_* values the
indentation fell off, adding one too much /t into it. In the meantime one
more model has been added (for those wondering the models I add are
specifically requested on [0] and I've started adding them on batches).

Changes in v4:
 - Fix power_limits[] entry indentation (was off by one tab).
 - Add GU605CM to the list.

Changes in v3 [1]:
 - FA608PM, FA608UH, and FA608UP now include nv_tgp_min/max derived from
   AC_Config.TGP and TGPItem Level* offsets (missing in v2).

Changes in v2 [2]:
 - Corrected English grammar.

Changes in v1 [3]:
 - First release.

 1/7: add G713QR
 2/7: add FA608PM
 3/7: add FA608UH
 4/7: add FA608UP
 5/7: add GA402NV
 6/7: add G533QS
 7/7: add GU605CM

[0] https://github.com/OpenGamingCollective/asusctl/issues/124
[1] https://lore.kernel.org/all/20261016130342.69923-2-scardracs@disroot.or=
g/
[2] https://lore.kernel.org/all/20261016121432.35071-2-scardracs@disroot.or=
g/
[3] https://lore.kernel.org/all/20261015181850.170862-2-scardracs@disroot.o=
rg/

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
=2D-=20
2.56.0




