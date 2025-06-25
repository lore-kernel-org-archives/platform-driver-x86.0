Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36817A2F8
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jun 2025 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838792; cv=none; b=gK3IDeK55pNYr4wNz4rXoZFLEKItiFTo3+koC1zf50+7wVz1KjfnG5jwqEkqmXIqiXZiHdiRwGmK2tkUX/lu0JHXzd+jqKMDrYEXvJ8aln/cWoTSYwlVNesblB1NF2CamBbB7nzr27VUyZq7FSphOZkgSKZHYCHqrATUuRq+t0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838792; c=relaxed/simple;
	bh=9XVyFRCTu7CjCcRd/bdqL7lBYTA2otciW3YlZSFnCxs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PvGQ836ccIXq1dOaJvkElyOlz5IXuMYaGWIWxdaEqa7XjDR9XGw/kHPjK8ptBsXa0W6laTvkkbtwvIiKCqg2iNvVPjuQF3mBC+ZD1AhPbHvhL7RZn8YbL+etJlYJnPSND8Z3q6HHzO18PgZwmLJgpLC7C2gsLmyQoEAhd5nsIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se; spf=pass smtp.mailfrom=benis.se; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benis.se
Date: Wed, 25 Jun 2025 08:06:11 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: =?utf-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
Message-ID: <5I8UDmgF_DcJBmBE0zgCXjuvmmhLamDCHkpnkAwRjSAkCa5xcFUvU-SmAeymxTajjDPR8avuW55RxOjhd8idK6jLy-hz8i-Ma3RHSaFy2Gs=@benis.se>
In-Reply-To: <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se> <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de>
Feedback-ID: 18592338:user:proton
X-Pm-Message-ID: c2b2272a8c8ac1e9b300475de65dc136a03df38c
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

The acpidump is here: https://drive.benis.se/s/pcKLAL7i8zncX8q



Best regards,
Benjamin Hasselgren-Hall=C3=A9n


On Monday, 23 June 2025 at 20:52, Armin Wolf <W_Armin@gmx.de> wrote:

> Am 23.06.25 um 15:52 schrieb Benjamin Hasselgren-Hall=C3=A9n:
>=20
> > Hi dear Linux friends,
> >=20
> > This is very much a long shot and I understand if no one got any time o=
r motivation for this.However, I am trying to understand how HP Omnibook Ul=
tra Flip (a laptop with Lunar Lake platform) working with power profiles. T=
he reason is that it seems to be very limited while running Linux (to 30 wa=
tts to be exact, no matter the power profile, this is for the whole laptop,=
 to compare with something the Omnibook Ultra 14 with AMD Strix draws up to=
 over 70 watts, sure more power hungry platform but still). Also the gpu pe=
rformance is not as it should be.
> > So if anyone got the time or so - let me know where to start digging!
> >=20
> > Best regards,
> > Benjamin Hasselgren-Hall=C3=A9n
>=20
> Can you share the output of "acpidump"?
>=20
> Thanks,
> Armin Wolf
