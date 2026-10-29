Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294347;
	b=nRnBzZkrXB7zwic7N0TiPkrQ1rXhIjfdQejscwDQulY9hyxTOzIXRcU9I1WtGirraMB9
	 hR1CCF+6myJtmADAQqD1rZTMWQTq3uTjJw1AyRPIAL+meYYjOIiIdqeeHEDxcHVBF1hhT
	 /J9334XCxIUt+GjFQCbXb7SjmD6jO5kR1bPrm1GgFgnsjBzVV/mD+Nlkf5ghyn8jUZf6V
	 kTwWYj4CeFoKLlDBl5vuemHJ6s1b+oaXWJeuMWqCPcF5CBr+QSY0ZhVpAUjE+FA6JW8aE
	 ULRiLyEVOY0H2a5TufqMdNr61HhgenJ2POfTjH8A80t3+vjKLLYh7KfgJ57tKJUOdfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294347;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=uysAvzGfnvqlsO0iNyVk0n8cyBRWB53uaIurpjRC7SM=;
	b=jBeUTk8gkEibO6GUWHCrz8SrZMwEIN+Qd9fPhiulC+Ou/vSKnbWvdrkxmyMe9vv4QAgx
	 T6pekb02ntgovsA2YApcLyBtG/pF6nvtVkhgYAAgJcYQKh9E+737XebyOH7BuKEk7dO/O
	 rxqLN7AWcym0/JSn5jSEArM1F7DhArz8V1owKZZtmisY56pWlRBy6LACIhIDzgcwJwP1c
	 Zz4zHMH+FxNtBezNh8e/IIFHPyVffDaWdnDXJBz9oQEhcicpEN2LyzJvx9T7Z0Ib05NIN
	 mXnJht8Hcglq9PnLkgRI/k3DugRS3U4RPbrm2ReHzIHDTF5EQGVAJRDCmk+Nf555PKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZKyzEVWI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1B606A31A;
	Thu, 29 Oct 2026 17:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZKyzEVWI
ARC-Seal: i=1; a=rsa-sha256; t=1793294311; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UkCQfL5oChRC4OaPEv1j3zfH31YFN7YUmdLPy2R8y2ZwThIG9p2QmaY/z86skHwnrmeoayHPAMrUjNuXTmnPBz6QoONXmJd3Rkgsdex/mGO0EVjzLCB5pevedwSNsrAWvo1aE5VvC23VACeHy/aaw1t8zekZa/JRW23qbvmyZhM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793294311; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uysAvzGfnvqlsO0iNyVk0n8cyBRWB53uaIurpjRC7SM=; 
	b=lse2ekdjjCpFYf6gd3o5/g4GWNd5EgN9qldgcOByPGYSBItJ0gR9WE/s8Q7yp0MR3cbvq4PLtsDiq4p0ZLmEuXVyxSXM6q2CIy+xxLFM+qHAB0ht9eMpYzbe6YLcurfG6V94ld6AsTHVfcb4f0K0Al26IJUAanfGOVH444uKTFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ZKyzEVWIEuRsaWbobBCP1EAkDr/KjpR3HawmGNnOPTBdpIyL7+AjQ4THdVXpxOL3KRi1NaCz7q+xjzhMGJhax8xwHwh8NrXb2yTxtl4ZF7Y5s23WLJLSmxvK8cCT0bmbHF0lI9ugtWBc6LbysHCITx2RJgS72+cSFQV5JD+FLkHNcM4tcsSa2xb0+5jftGlAci24KH3Ocfpl+AJuCBsxoibtkTGv73KvkuQCAKz5ernnFAVRUj59FX+40ljU8wgveJHzr90qN2WSX1LYsmLftBCzmdXg3iHmjHyyNHQGJUlbs3VRnsxHpHzbl8O/er6PCCoxZmvUPKzS92Wcfi6TcA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=uysAvzGfnvqlsO0iNyVk0n8cyBRWB53uaIurpjRC7SM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17932943100310.48654493677486244;
	Thu, 29 Oct 2026 10:18:30 -0700 (PDT)
Message-ID: <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe>
Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in
 tablet mode; EC expects VPC 0x2A with posture data
From: Rong Zhang <i@rong.moe>
To: Mahir Faisal <mahirfaisalantiq33@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>
Cc: Gergo Koteles <soyer@irl.hu>, Andrew Kallmeyer <kallmeyeras@gmail.com>,
  =?ISO-8859-1?Q?Andr=E9?= Apitzsch	 <git@apitzsch.eu>, Swapnil Devesh
 <me@sidevesh.com>, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com>
References: 
	<CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 01:13:21 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Mahir,

Thanks for the report.

On Thu, 2026-10-29 at 03:21 +0600, Mahir Faisal wrote:
> Hello,
>=20
> On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
> laptop is folded into tablet/tent/stand mode under Linux, while on
> Windows it turns off. I traced the difference to a VPC command that
> the Windows YMC service sends on every posture change and that Linux
> does not send. Details below; I'd appreciate your view on whether
> lenovo-ymc/ideapad-laptop should send it.
>=20
> System
> ------
>   Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
>   BIOS:   LHCN30WW (latest)
>   Kernel: 7.2.11-300.fc45.x86_64 (Fedora)
>=20
> Symptom
> -------
> When folded, the EC disables the keyboard (no input reaches a VT) and
> SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
> backlight, however, stays at its previous level. Writes through
> KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored in
> the EC (KBLS reads back the new value) but are not applied while
> folded, so there is no way to turn the backlight off without
> unfolding.
>=20
> The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW,
> "EC Notification":
>   "Fix the issue of keyboard backlight is on when turn on in notebook
>    mode and change NoteBook mode to Yoga mode."
>=20
> The DSDT contains no tablet-mode handling in KBLC, and _Q1B only does
> Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.
>=20
> What Windows does
> -----------------
> The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
> ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byte
> buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
> Management". Its handler for that IOCTL maps function 0x0C to VPC
> command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as the
> data byte, using the same VDAT/VCMD sequence as write_ec_cmd().
>=20
> Values of X observed in YMC.exe:
>   0x0A  service start
>   0x08  posture !=3D laptop (tent/stand/tablet)
>   0x09  posture =3D=3D laptop
>   0x0B  service stop

What if:

- 0x0A is not sent on start
- 0x08/0x09 is sent after sending 0x0B
- 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times

>=20
> Current Linux behaviour
> -----------------------
> ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and only
> for models in ymc_ec_trigger_quirk_dmi_table. Booting with
> ideapad_laptop.ymc_ec_trigger=3D1 on this machine has no effect on the
> backlight.
>=20
> Test
> ----
> Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data>
> followed by VPCW 1 0x2a, then polling VPCR 1 until 0:
>=20
>   data 0x0A, then fold      -> no change, backlight stays on
>   fold, then data 0x08      -> EC turns the keyboard backlight off
>   unfold, then data 0x09    -> keyboard and backlight work normally

What if 0x0B is sent when the keyboard backlight is on?

>=20
> I'm currently running a small userspace daemon that sends 0x0A at
> start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
> reliably so far.

What if:
- 0x08 is sent when unfolded
- 0x09 is sent when folded

>=20
> Suggestion
> ----------
> On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported posture
> is anything other than laptop and 0x09 for laptop, instead of 1. This
> might also be worth doing outside the quirk table, since it matches
> what the Windows driver does on every model it supports. I can't tell
> whether data 1 is still needed on the models already in the quirk
> table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
> that hardware would need to check.

There is a chance that the 0x0A[start] =3D> (0x08[fold] <=3D> 0x09[unfold])
=3D> 0x0B[stop] sequence is generic. Derek, Mark, could you confirm if the
sequence exists in the documentation? If so, I think we can replace the
quirk table and the module parameter with the standard sequence. I will
prepare a patch once I get enough information.

+CC Gergo, Andrew, Andr=C3=A9, Swapnil

I believe the quirk was concluded by trial and error. Could you test if
the above sequence works on your devices?

>=20
> I can provide an acpidump, the disassembly excerpts, or test patches
> on this machine.

An acpidump would be helpful.

Thanks,
Rong

>=20
> Disclosure: AI assistance was used to troubleshoot the issue and draft
> this email.
>=20
> Thanks,
> Mahir
