Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268E18C31
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jun 2025 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944052; cv=none; b=L56ttRUKcqUdXKxaEVkeA46+cNORuIuT61t6+eEMQEPhnglawg6q4DhWkfs79TLy9PCD2119pdC1qC31eoe3DGzbw+TQwZeWb5yoIsKnUW/CWg9DfZnFI2/humPNzTzFb3vrP1wQG5U8WceClEU5Wzf8Jdf9LRMHKIbWmm/tTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944052; c=relaxed/simple;
	bh=RqhTSc59RkoThiJcxUu9TQvB6KaNswYKvYB0Xq7Qafg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M14tG0l6ILpDkLUn8yljDo6Z4EvzrI2nuE+AF1AkcOWvilMy0GytXQ5i89Nhj8+uM+SJBqH82Em4KcRl599XfZ7vUMi/CZoi/X15OP58F9HkTIcWKDzm4czYNylXEqFAvMnI7KQzjR3hj3vSYfn/yZL7iuLfNdJqwisAP/nh7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se; spf=pass smtp.mailfrom=benis.se; arc=none smtp.client-ip=79.135.106.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benis.se
Date: Thu, 26 Jun 2025 13:20:32 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: =?utf-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
Message-ID: <X-40AqXfdmQw5shUOk3VSaHSXmwJYWHPmDDMLyGUH6GpMt56ty5SbNg8EVfyI_uC9J07uqZ2TtGJmmpB_x8-xpcVOw29fnKzJZ4n9L0x78A=@benis.se>
In-Reply-To: <de8321ce-e595-460a-81d7-f7dae8a7b790@gmx.de>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se> <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de> <5I8UDmgF_DcJBmBE0zgCXjuvmmhLamDCHkpnkAwRjSAkCa5xcFUvU-SmAeymxTajjDPR8avuW55RxOjhd8idK6jLy-hz8i-Ma3RHSaFy2Gs=@benis.se> <9642ad7e-3e57-45f9-bfd9-beac3e55418e@gmx.de> <GXC8NQl6AY_N7nQAOCRLt7SDGjFNll_TnqQyzYnP_b1weGkRqITOR-kHKcM66lPonOCo9xO2nSWXr7yycwfFuKmjRMtXVlJKya8-qvvkGik=@benis.se> <de8321ce-e595-460a-81d7-f7dae8a7b790@gmx.de>
Feedback-ID: 18592338:user:proton
X-Pm-Message-ID: 8d25d754ee487d5e022495b189224a3a6941367c
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi again,

dmesg: https://drive.benis.se/s/2crz7zPzkrzaqXN

So I tested thermald again. So here are some results.

Before:=20
Running Valheim the power draw is 35w and the fps is 41.=20

After I have installed thermald:
Running Valheim the power draw is 44w and the fps is 46

So it's working, but I also noticed that it doesn't matter if I change the =
power profile. Same performance and power draw. So something is still weird=
.

Also the bug with the fun still running while the laptop is suspended is an=
 issue.


Thank you very much for your guidance Armin!




Best regards,
Benjamin Hasselgren-Hall=C3=A9n


On Wednesday, 25 June 2025 at 23:43, Armin Wolf <W_Armin@gmx.de> wrote:

> Am 25.06.25 um 23:22 schrieb Benjamin Hasselgren-Hall=C3=A9n:
>=20
> > The laptop do complain about not being able to load hp-wmi during boot.=
 Same on Fedora 42 as on Debian 13 (with kernel 6.15).
>=20
>=20
> Can you share the output of dmesg?
>=20
> > I did install thermald and that might have increased the power budget (=
which is good) - but introduced some bug that keeps the fans on even while =
suspended.
>=20
>=20
> Please elaborate.
>=20
> Thanks,
> Armin Wolf
>=20
> > Best regards,
> > Benjamin Hasselgren-Hall=C3=A9n
> >=20
> > On Wednesday, 25 June 2025 at 15:44, Armin Wolf W_Armin@gmx.de wrote:
> >=20
> > > Am 25.06.25 um 10:06 schrieb Benjamin Hasselgren-Hall=C3=A9n:
> > >=20
> > > > Hi,
> > > >=20
> > > > The acpidump is here: https://drive.benis.se/s/pcKLAL7i8zncX8q
> > > >=20
> > > > Best regards,
> > > > Benjamin Hasselgren-Hall=C3=A9n
> > >=20
> > > The hp-wmi driver should be able to control the platform profile on y=
our device. Does this
> > > driver load and register a platform profile handler?
> > >=20
> > > Additionally you might need to install and setup the intel thermal da=
emon for the platform
> > > profile settings to work.
> > >=20
> > > Thanks,
> > > Armin Wolf
> > >=20
> > > > On Monday, 23 June 2025 at 20:52, Armin Wolf W_Armin@gmx.de wrote:
> > > >=20
> > > > > Am 23.06.25 um 15:52 schrieb Benjamin Hasselgren-Hall=C3=A9n:
> > > > >=20
> > > > > > Hi dear Linux friends,
> > > > > >=20
> > > > > > This is very much a long shot and I understand if no one got an=
y time or motivation for this.However, I am trying to understand how HP Omn=
ibook Ultra Flip (a laptop with Lunar Lake platform) working with power pro=
files. The reason is that it seems to be very limited while running Linux (=
to 30 watts to be exact, no matter the power profile, this is for the whole=
 laptop, to compare with something the Omnibook Ultra 14 with AMD Strix dra=
ws up to over 70 watts, sure more power hungry platform but still). Also th=
e gpu performance is not as it should be.
> > > > > > So if anyone got the time or so - let me know where to start di=
gging!
> > > > > >=20
> > > > > > Best regards,
> > > > > > Benjamin Hasselgren-Hall=C3=A9n
> > > > > > Can you share the output of "acpidump"?
> > > > > > Thanks,
> > > > > > Armin Wolf
