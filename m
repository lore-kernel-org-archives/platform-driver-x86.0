Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12CC221F03
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Sep 2025 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901603; cv=none; b=QI5Fn+piWTQRPSritjZHwkSTdYqE+sc03oWtU85Vey7/gdclHlsthsJ/QjgC/vgPTsvrn5F2SrJhsetrO9/HxlcFOaIuXHArd2QJpx3CEKuXOpfE4M3Iea1r6f4TsT/qYoQqAgPjWp4K7B1eB5Dtd6UolySgMtkgRQOOHS1Q4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901603; c=relaxed/simple;
	bh=o8G/me4w4gsQgGMbDIh3CDTSYAQ+pH134pn+oDTYjI4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxQs+WAIqAlgQj1jyQTJG/cBuW7TFMvnb9y451x987S9XUW/sI3d5xOXIPpSV9nt8G1UGrrLs+ZYhj9vPyxd0sVcjga00OalCc0p/XhnOj5+YlH4w9PGogwaZv3HTpB9ig+slidbP6x0PrZyXqhsHFzCcYURW3iZ4H9ORGgjjr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=nzzj2wOq; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="nzzj2wOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758901593; x=1759160793;
	bh=o8G/me4w4gsQgGMbDIh3CDTSYAQ+pH134pn+oDTYjI4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nzzj2wOqWkaQbPHnDBZQF0UDhRT2sek7dVxERKtjmctJ0jpuCNigghuelxUZeVyht
	 4CRNxfTHGolUWwVgSeak4CVnoFEQWXygi7LwKxgx37C5ePnB3aoP9L5tmwIzNPdx2n
	 deOKKtDxM3KQlDAA0qeiT5tfujx5puIErEoMCNLs18xXFPAwLktrrMQCxZlAG5MFSh
	 qKTMt5nORdDzlSpRaNwdHbRwNf2CIBdSQ76hv6H27a3amSEgCoZoSaEiSzs5m3GWsm
	 di6lcXJizlDNhbBY3L2AbX5zDgGr1fyy31MyBVMac2TzcFI6otRpE9VJvnmV/MJEI4
	 tfgn/sMP2tw2Q==
Date: Fri, 26 Sep 2025 15:46:28 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <NrGt0qNxCBdMTcLHyNFJ2klHP9_7HVpz9tVv6T1rIvxwhF4B6BYcaToAwVqQwnLrbHLNdocyXFKTTRXVIPacTSFNXxc1JWvMftd-mghHPaY=@protonmail.com>
In-Reply-To: <Rp-IgT7jUeYXNJHRkwjBtmDjRy1mJxY-pA5rrxMkR0J2gaKOyoOvUAi4QP3I94Fe28zToRzbcp9SURVpu8_wi-R3Dhz1VT6fxRhI398mZ48=@protonmail.com>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de> <Rp-IgT7jUeYXNJHRkwjBtmDjRy1mJxY-pA5rrxMkR0J2gaKOyoOvUAi4QP3I94Fe28zToRzbcp9SURVpu8_wi-R3Dhz1VT6fxRhI398mZ48=@protonmail.com>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 56b2678b0765bce687efab15d8dcfe5f62423896
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






Sent with Proton Mail secure email.

On Friday, September 26th, 2025 at 9:15 PM, Bugaddr <Bugaddr@protonmail.com=
> wrote:

> > Am 13.06.25 um 19:12 schrieb Bugaddr:
> >=20
> > > Hello,
> > > I'm writing to report what appears to be a bug affecting the Acer AN5=
15-58 laptop, and I would appreciate any assistance in investigating or res=
olving it.
> > >=20
> > > When I press Fn + F10=E2=80=94which is intended to increase the keybo=
ard backlight brightness=E2=80=94the display brightness unexpectedly decrea=
ses along with it. Furthermore, the display brightness continues to lower i=
ncrementally, until I manually press Fn + Brightness Up to stop and reverse=
 it.
> > >=20
> > > After pressing Fn + Brightness Up, the display brightness behavior re=
turns to normal, and the issue does not reoccur=E2=80=94however, from that =
point onward, the Brightness Down key no longer works.
> > >=20
> > > This behavior is consistent and reproducible. I'm happy to assist wit=
h any debugging, log collection, or kernel testing as needed.
> > >=20
> > > Best regards,
> > > Bugaddr
> >=20
> > Hi,
> >=20
> > can you share the output of "acpidump"?
> >=20
> > Thanks,
> > Armin Wolf

Hello, Sorry for late reply, but checkout this:
https://paste.rs/Nqca3

Thanks,
Bugaddr
