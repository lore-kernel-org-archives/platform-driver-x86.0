Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C5645
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763389008; cv=none; b=Y/ufv/z9pNkyqfIhA48GXRaCpwyv3aXyKb17TwmBl/50bh5DrEfLBVEco3jJhT8H1M2b5vgubyULM2Y1xOi7dtmna+wUk5Fv1CVFKjSm6sMpSncfaZhrabOlxLEpkgi5rBr81hsgVvezwazf16WRdQWI+FZ+E5krilhrhRJOsa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763389008; c=relaxed/simple;
	bh=pgtrK7fI/Gpsl3Sq18iP4CtfjfTdyByRmFaOSEY21BY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HI4zKI4/a6WG9g07TJUI+9EOVCcal8HYuxlhr10k7qLYV5LAqWphyTLacnnUqq+6xkKD7V8nKXGG35iTQN7dp9AfQ1v1MeAZkSQpJ+J9OxeYRKcLQ0oLnplb5mwLywKoAdQEkUmFvTExlkeZbimL4ZH2UwNzmA167gLzivGiJhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HU6u7pS/; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HU6u7pS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1763389004; x=1763648204;
	bh=pgtrK7fI/Gpsl3Sq18iP4CtfjfTdyByRmFaOSEY21BY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HU6u7pS/FNSLMDnsEK6ZMvU0/Tz0kHuUuHGc14A+K+0z4NX791sIJhfaVdbUh+EEF
	 cPBHtu3n32k+I7mUmDCM3ydntcjZjI9Lc2YJIy5taf1lGOzYufqEwjsIU/xWoxOrsy
	 vCC02sG5Oa4FV9PYyWmd3LFpE7Cii0NiwTOZX4n6OuLtRAUE6tW9NM5Vuwdh8QV9qU
	 ZPKjhfOcuSOQB47xcuMMWep4OwoymH3rLl+2ge8lTTUiA6EgMCFuH2gMj3BiQJIM02
	 nyV829JJY37sGXmlygTszZnDABZLIb6ixjyy7JJs0+amkOSzVVbPwhz7IzxHcuxczw
	 5Oa6KzG2RXVPQ==
Date: Mon, 17 Nov 2025 14:16:41 +0000
To: Hans de Goede <hansg@kernel.org>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <2G1Vx6ELBJdtsttOaIreX8NQUZANOMqphJRY0tzKTZ_Nkc2AcuC2aAtaciLDb32nIplKSNMOtyagsquIkdvFI7xb2Q1WKhb3V-4hybqQ3js=@protonmail.com>
In-Reply-To: <b32efcf0-9e15-4ece-bf1c-6327b49f6aa5@kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de> <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com> <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de> <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org> <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com> <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com> <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com> <b32efcf0-9e15-4ece-bf1c-6327b49f6aa5@kernel.org>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 15062820fe24cde0f0e8c0f7a6988a2615885d5b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, November 17th, 2025 at 3:48 PM, Hans de Goede <hansg@kernel.org>=
 wrote:

> Hi,
>=20
> On 16-Nov-25 23:14, Bugaddr wrote:
>=20
> > Hi everyone,
> >=20
> > I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro 5 AN515-5=
8.
> >=20
> > ROOT CAUSE:
> > Firmware sends wrong scancode (0xef) which Linux maps to KEY_BRIGHTNESS=
DOWN instead of keyboard backlight control.
> >=20
> > SOLUTION:
> > Install this udev hwdb rule:
> >=20
> > sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/null << '=
EOF'
> > # Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
> > evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitroAN515-58
> > KEYBOARD_KEY_ef=3Dreserved
> > EOF
> >=20
> > sudo systemd-hwdb update && sudo udevadm trigger --sysname-match=3D"eve=
nt*"
> >=20
> > TESTED ON:
> > - Kernel: 6.17.8-arch1-1
> > - Distribution: Arch Linux
> > - Desktop: KDE Plasma (Wayland)
> >=20
> > I have blogged my full analysis here: https://bugaddr.tech/posts/2025-1=
1-16-debugging-the-acer-nitro-5-an515-58-fn-f10-keyboard-backlight-bug-on-l=
inux/
>=20
>=20
> Good work on debugging this and nice blogpost.
>=20
> Question do the brightness up/down hotkeys still work after the hwdb fix =
?
>=20
> As Armin mentioned you really should submit a pull-request to systemd to =
get
> this added to distros so the next Acer Nitro 5 AN515-58 will not be hit b=
y
> this issue. See e.g.:
>=20
> https://github.com/systemd/systemd/pull/39392/commits
>=20
> which makes some slightly different changes to hwdb.d/60-keyboard.hwdb
>=20
> Regards,
>=20
> Hans

Yes, all buttons (display & keyboard backlight up/down) works perfectly aft=
er this hwdb fix. Yes, I am going to open a pull request to systemd regardi=
ng this fix.

Regards,
Bugaddr
