Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB6211290
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jun 2025 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886563; cv=none; b=llPu6WQVFXYk895ohJyOa1aMxIhvej3F95UpZr66OO9+Qvdr10Qt6FRROY8sOoz8oU7TFsX69n6pLODPskQaYULOLpGaYUpKKKMRk58BLMJKSK0MJf86LrKEA6lB0YwhJCWDEiVjyUme63dGMThSnY492PkVih+p/+EG0myGS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886563; c=relaxed/simple;
	bh=NGKesD+BrIb5rT3vrWWOut+41mk9ExsyS48rrtkK0Wg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGiWQp/lLCQbigQk/22R1mo3KUtUHq9xBCWOF4RVa6Scku2d/SnNgNRxXBDwtym5HBZISURxoPJ9pbSxIUx7rNT3CKV/0KyyKxGVUzOQCcfv2AtRpLOUDN2b1PV2tUrlUAEtC606NQjZ7rJfdfPgg/qoJ4prHpthK7tov4qeP7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se; spf=pass smtp.mailfrom=benis.se; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benis.se
Date: Wed, 25 Jun 2025 21:22:31 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: =?utf-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
Message-ID: <GXC8NQl6AY_N7nQAOCRLt7SDGjFNll_TnqQyzYnP_b1weGkRqITOR-kHKcM66lPonOCo9xO2nSWXr7yycwfFuKmjRMtXVlJKya8-qvvkGik=@benis.se>
In-Reply-To: <9642ad7e-3e57-45f9-bfd9-beac3e55418e@gmx.de>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se> <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de> <5I8UDmgF_DcJBmBE0zgCXjuvmmhLamDCHkpnkAwRjSAkCa5xcFUvU-SmAeymxTajjDPR8avuW55RxOjhd8idK6jLy-hz8i-Ma3RHSaFy2Gs=@benis.se> <9642ad7e-3e57-45f9-bfd9-beac3e55418e@gmx.de>
Feedback-ID: 18592338:user:proton
X-Pm-Message-ID: e215189fa0fdb904631d60db5cf334a8ccaa1352
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The laptop do complain about not being able to load hp-wmi during boot. Sam=
e on Fedora 42 as on Debian 13 (with kernel 6.15).=20

I did install thermald and that might have increased the power budget (whic=
h is good) - but introduced some bug that keeps the fans on even while susp=
ended.



Best regards,
Benjamin Hasselgren-Hall=C3=A9n


On Wednesday, 25 June 2025 at 15:44, Armin Wolf <W_Armin@gmx.de> wrote:

> Am 25.06.25 um 10:06 schrieb Benjamin Hasselgren-Hall=C3=A9n:
>=20
> > Hi,
> >=20
> > The acpidump is here: https://drive.benis.se/s/pcKLAL7i8zncX8q
> >=20
> > Best regards,
> > Benjamin Hasselgren-Hall=C3=A9n
>=20
>=20
> The hp-wmi driver should be able to control the platform profile on your =
device. Does this
> driver load and register a platform profile handler?
>=20
> Additionally you might need to install and setup the intel thermal daemon=
 for the platform
> profile settings to work.
>=20
> Thanks,
> Armin Wolf
>=20
> > On Monday, 23 June 2025 at 20:52, Armin Wolf W_Armin@gmx.de wrote:
> >=20
> > > Am 23.06.25 um 15:52 schrieb Benjamin Hasselgren-Hall=C3=A9n:
> > >=20
> > > > Hi dear Linux friends,
> > > >=20
> > > > This is very much a long shot and I understand if no one got any ti=
me or motivation for this.However, I am trying to understand how HP Omniboo=
k Ultra Flip (a laptop with Lunar Lake platform) working with power profile=
s. The reason is that it seems to be very limited while running Linux (to 3=
0 watts to be exact, no matter the power profile, this is for the whole lap=
top, to compare with something the Omnibook Ultra 14 with AMD Strix draws u=
p to over 70 watts, sure more power hungry platform but still). Also the gp=
u performance is not as it should be.
> > > > So if anyone got the time or so - let me know where to start diggin=
g!
> > > >=20
> > > > Best regards,
> > > > Benjamin Hasselgren-Hall=C3=A9n
> > > > Can you share the output of "acpidump"?
> > >=20
> > > Thanks,
> > > Armin Wolf
