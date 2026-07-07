Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D1BA34
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412702; cv=none; b=prpJbXqECuJRLJ7s2Qg4t9NYiJJK/sUGAPHYznAB8/tSgjBzCj9piDBkvrww4r+/LEqNO7uYF4WWhBY2HkvQ1J1W+tA0fB8W6IwQLd8RRxGDakMMM/911nChxIa2nkP3FJaUbXFx+qtOMYfBIc0DQ6eKjiLec3de6g+OCYeWkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412702; c=relaxed/simple;
	bh=Xx0uV/daSXwNeLx18IUGX3ShQi8n76KmsQyNHmNwYEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAFCtpvg6ElL0IwNmUlRUrca0+JlhZ2DPRJbKVMuxLe9AzZxCWq2KXs6M8gsH+Q/PPbbWPXxezpPlGm+x8LjoUvq1/0TnLLeqEVbEYOCSGimJG8ftDxrjlNYTn+gEFAiW/mYZhdOybXP8669T/YRkAYJ6kXFtaAwyA8GbyxLYoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ktZbawVG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ktZbawVG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4720d22c94aso3758412f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 01:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783412698; x=1784017498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3m84hpRnlbNxTh++uagjjEDtw4pmEvwWgkTFsggIld0=;
        b=ktZbawVGmOhwHsSRw6iZ4Mq+36XpMyAE29NlW0+HmzPT2Y1QgGmwguPzSxUkwTNOZu
         pOOwibMf26lGEk5dNeakfAZfuwymtK6yh983XgfNLyUT9bT1MS9wLIHSlU1/f/JNgGzs
         hBJ0zKOVsznTP72aa/gRnpQxjJhkX6ge93zIKky9hBcFmck9OmCL/+g4Sv28814esM10
         9Q4Vr+495rBCoKVUrWVMqBJ+ns5O4LsB7Qi00R30/NU8/Tv/XLewUmqK1hErrnIipwAB
         h6WCUBOGEo7m0vZnPnu374QHDxpos46k2+KY35Q84L5ZB/RsRhKQ5J7oqweSsDpqS+ut
         SS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412698; x=1784017498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3m84hpRnlbNxTh++uagjjEDtw4pmEvwWgkTFsggIld0=;
        b=OMPT3+YFS30rUzlk5/do6Qu+B2e7Eq0dYnfxKBC6vCja8vI3y79Gy53UG1JP1sFCNz
         MK6vDobK8lDatixq4kKg3kIwg4nS+rFBfSerSC1dXaOXsgVN+qEUKgIphrY4jn2zjOAT
         Uoi6fpvpaxfQEwj4imfbbmFUNAUHpTwQP74WwcPJxt/fcTk6jnOdK0eVQRRiVQ3Tt9bd
         p0z2T+/Jb6kkhZibNEi2PT++gfU9lS6pEX19JK5/2XX/0wxA8QwYdVoKY/3LUdyVZ1W+
         CFO2KznJ3Uv7kfPWOB8wMCvLCM4eKAh46MPve3gbflBWKRD04c1oZvoHDsPXlhSbXOWu
         gaQw==
X-Forwarded-Encrypted: i=1; AHgh+Rpj8NL0npnZLL08B9dSeZqIiGq9lBXpMdco8Bh7qJRkk24iYn8U+0eOOSYOD4zJLZUWct12bHx9yk0g7hK5sj8PIphH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+8VQ7CnM5pmMRz1vpVmTf/1UUzuJNLBaBTCHrxbbjo0yPokJy
	XzVtqWq4WiecGGkcnVgV9fiQWW54BndkVQjRYBOmhwHlczpi10lTVKzMYI12MydZ+iWlSMDcP6V
	gCDN2U9A=
X-Gm-Gg: AfdE7cn2R367fuMuTFaY35OQqV6HFdEEahT+QlYA0p4WD94q/0YRZvd8kns60ypmV4A
	TH6zAmiUjaFGsJessj2PnETKQq7zyU+G5J4+FRA9KPFpoumiHUOVbtNHfp5A0iHJttN1ATdVFw4
	sOcyTC0nZczpmmw04dVPk5OZ/LL+/qXsBM+Wj+lfkiYzyIEWBPozv3DqOGx46BNh8BzP2Mq2ERQ
	iBt83Z/jvfGJdJy93OBqmVmkOhV9C5KSa5s59brjAbB1TmSYf+zJX0WgouWj7L+7qtoIIUrPpeu
	UBBZNrg2k4bK2wmi4+DOBjMv9egy9MjN3kJ2+RBjyXkJQqhCSURefDOHfXm8TFuSG3/hA+2qzsa
	LKM5zKsvB05gjtdD4gPBbZ3Ro4kN4As87DoFLc7ttSVBRATJmaPoJH6A5FB4MzcJduFwN10bW3Q
	AiNBS1Q+iMG8SZLOrZQ/iRNsEvhLamLXULgTyae5ipWoQc64BynVnJokwp1E7SkbvNju3nzPdDy
	zqO
X-Received: by 2002:a5d:6e54:0:b0:473:c18:f2cb with SMTP id ffacd0b85a97d-47de6696340mr3353765f8f.18.1783412698256;
        Tue, 07 Jul 2026 01:24:58 -0700 (PDT)
Received: from localhost (p200300f65f47db0437b4d928ee3eb6f8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:37b4:d928:ee3e:b6f8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f2186bsm31517435f8f.36.2026.07.07.01.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:24:57 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:24:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	PDx86 ML <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Imminent rebase of pdx86 trees to v7.2-rc2
Message-ID: <akyoRk2xTaYcLamH@monoceros>
References: <8084b592-cb10-2ae4-603a-615f053ca01d@linux.intel.com>
 <akuE9tvj29Y6crEk@monoceros>
 <akvDc_LAMy25o6xo@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctgofqqpxdmyesq2"
Content-Disposition: inline
In-Reply-To: <akvDc_LAMy25o6xo@ashevche-desk.local>


--ctgofqqpxdmyesq2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Imminent rebase of pdx86 trees to v7.2-rc2
MIME-Version: 1.0

Hello Andy,

On Mon, Jul 06, 2026 at 06:02:11PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 06, 2026 at 12:37:36PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jul 06, 2026 at 11:48:18AM +0300, Ilpo J=E4rvinen wrote:
> > > Because of the recent mid-rc-cycle merge of the rework for=20
> > > mod_devicetable.h in d2c9a99135da ("Merge tag 'device-id-rework' of=
=20
> > > git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux"), I'll =
be=20
> > > (re)basing our pdx86 tree on top of v7.2-rc2.
> >=20
> > Probably to late now, but I guess merging v7.2-rc2 into your tree to
> > handle (potential?) merge conflicts would have been the solution that
> > doesn't involve a rebase.
>=20
> Rebases are cleaner in this situation.

Yes, a rebase yields a cleaner result, but less history and more hassle
for your downstreams. The tree being used by downstream developers and
Ilpo's urge to notify them for this rebase, would be a strong indicator
for me to not rebase but to pull in v7.2-rc2 (or only the
device-id-rework tag).

Looking at next-20260706 (where drivers-x86 is
ff7836fa850c2f815bc219f1e48f6ec8699f4ae7 which is still based on v7.2-rc1) =
and

	https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86=
=2Egit review-ilpo-next

(51a153f2747fad5dc566f94238b08da07d6a6fb6, based on v7.2-rc2), I wonder
if just doing nothing would have been the right approach:

	$ git range-diff linus/master..ff7836fa850c2f815bc219f1e48f6ec8699f4ae7 li=
nus/master..51a153f2747fad5dc566f94238b08da07d6a6fb6
	 1:  4799d6229436 =3D  1:  7bc99dff4d97 platform/x86: asus-armoury: gate P=
PT writes behind active fan curve
	 2:  2f70f3d2fd3d =3D  2:  27ef0cdcdc20 platform/x86: msi-ec: Add MSI Raid=
er A18 HX A9WJG EC firmware
	 3:  2d79283eec8d =3D  3:  63af040b0b40 platform/x86: uniwill-laptop: Add =
keyboard backlight support
	 4:  c7f3d21c8f50 =3D  4:  69be0016c161 platform/x86: uniwill-laptop: Hand=
le screen-related events
	 5:  e8a41051b95b =3D  5:  c393505bab5b platform/x86: uniwill-laptop: Add =
AC auto boot support
	 6:  58d88f08ab1f =3D  6:  e02c8d7a197d platform/x86: uniwill-laptop: Add =
support for USB powershare
	 7:  c1c6633e3f1f =3D  7:  e76799915b86 platform/x86: uniwill-laptop: Add =
support for the MACHENIKE L16 Pro
	 8:  62f334005d59 =3D  8:  efd0636aaedb platform/x86: uniwill-laptop: Add =
support for the AiStone X4SP4NAL
	 9:  e451ae739a2c =3D  9:  866e728b489b platform/x86: uniwill-laptop: Add =
lightbar support for LAPQC71A/B
	10:  385bf4f87b05 =3D 10:  e5a316220dae platform/x86: hp-wmi: Introduce bo=
ard-specific feature data
	11:  9ed0f2562f9a =3D 11:  c1ce649189ed platform/x86: hp-wmi: Drive fan co=
ntrol from board data
	12:  5417f92a1d46 =3D 12:  c95f61d198c7 platform/x86: hp-wmi: Add Victus 1=
5-fb0xxx support
	13:  a3ec96c8b7bc =3D 13:  dd26a15b1d28 platform/x86: dell-privacy: Fix ra=
ce condition
	14:  f58553cda9aa =3D 14:  16e2c381d72c platform/x86: dell-wmi-base: Fix r=
esource leak on module load failure
	15:  cfe467c730f6 =3D 15:  530a2dd4ee84 platform/x86: dell-wmi-base: Fix h=
andling of ultra performance key
	16:  74850eb0012b =3D 16:  356f771f3a4a platform/x86: dell-ddv: Use no_fre=
e_ptr() to simplify error handling
	17:  43a862be3002 =3D 17:  3488f4727898 platform/x86: msi-wmi: Reformat ms=
i_wmi_notify()
	18:  0c716d1848ac =3D 18:  41cd652e1b8f platform/x86: msi-wmi: Add MSI Cla=
w M-Center keys
	19:  0df706e5e724 =3D 19:  9e560f6761e3 platform/x86: dell-wmi-sysman: Don=
't hex dump attribute security buffer
	20:  ace16d4d3f38 =3D 20:  e05f35070d27 platform/x86: lenovo/ymc: Only mat=
ch lower byte in WMI lid switch query response
	21:  d3f2ecd21924 =3D 21:  bfd4586c8458 platform/surface: aggregator: Cons=
istently define ssam_device_ids using named initializers
	22:  2f0fab3e8ef9 =3D 22:  be3e8304fc35 power: supply: surface_{battery,ch=
arger}: Consistently define ssam_device_ids using named initializers
	23:  f3aaddb8a085 =3D 23:  67444032146a platform/x86: toshiba_bluetooth: U=
se more common error handling code in toshiba_bt_rfkill_probe()
	24:  f820f61f079a =3D 24:  258da36b410d platform/x86/amd/hsmp: Validate AC=
PI UID before parsing socket index
	25:  1cacf5e8693d =3D 25:  18506e66652e platform/x86/amd/hsmp: Validate _D=
SD mailbox sub-package element count
	26:  0c963c5b4d68 =3D 26:  dabf39aac670 platform/x86/amd/hsmp: Pass struct=
 device explicitly to ACPI mailbox parsers
	27:  ff7836fa850c =3D 27:  67e753cf0448 platform/x86/amd/hsmp: Gate the da=
ta plane on a fully initialized socket
	 -:  ------------ > 28:  d8258e35a542 platform/x86: asus-laptop: Stop sett=
ing acpi_device_name/class()
	 -:  ------------ > 29:  c327e5c90164 platform/x86: eeepc-laptop: Stop set=
ting acpi_device_name/class()
	 -:  ------------ > 30:  c0948dcbc48a platform/x86: fujitsu-laptop: Stop s=
etting acpi_device_name/class()
	 -:  ------------ > 31:  852a85c15a7f platform/x86: fujitsu-tablet: Stop s=
etting acpi_device_name/class()
	 -:  ------------ > 32:  fc0ed8545cb0 platform/x86: thinkpad_acpi: Stop se=
tting acpi_device_class()
	 -:  ------------ > 33:  68a04fe822ac platform/x86: panasonic-laptop: Stop=
 setting acpi_device_name/class()
	 -:  ------------ > 34:  d3d6f7e72a77 platform/x86: sony-laptop: Stop sett=
ing acpi_device_class()
	 -:  ------------ > 35:  5fec95ebc3ad platform/x86: toshiba_acpi: Do not u=
se uninitialized device_class
	 -:  ------------ > 36:  a3fbc0114add platform/x86: toshiba_haps: Do not u=
se uninitialized device_class
	 -:  ------------ > 37:  90a0805bc911 platform/x86: xo15-ebook: Stop setti=
ng acpi_device_name/class()
	 -:  ------------ > 38:  51a153f2747f platform/x86: topstar-laptop: Stop s=
etting acpi_device_name/class()

The rebase went cleanly without any change, and ...

	$ git log -G'#include' 67e753cf0448..51a153f2747f
	$

the patches on top of the cleanly rebased ones don't touch any include
stuff.

As long as no patches should be applied that actually depend on the
rework that went into -rc2, I would have just continued with my branch
on top of -rc1.
To handle the anxiety that the rework might break something in my
branch, I'd just merge -rc2, test, and if nothing relevant is found, I'd
just throw away the test merge again.

> Basically what Linux has done should
> have been done just before issuing -rc1.

Well, getting such a rework ready before -rc1 is difficult. A driver
that is added late in the merge window might break these changes. So I
still think the way we chose to do it (i.e. getting the changes into
next directly after -rc1 and merge just before -rc2 after no issues
showed up) is sane.

=46rom my POV "mid-rc-cycle merge" is unjustified blaming. Yes, it was
after -rc1, but as argued above before -rc1 is hard and IMHO it doesn't
matter much if it goes in soon after -rc1 or just before -rc2 because
only the tags are sync points and keeping some flexibility by exposing
it for testing in next instead of Linus's tree is IMHO also justified.

Best regards
Uwe

--ctgofqqpxdmyesq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpMt9QACgkQj4D7WH0S
/k7yuwf7B3Gq1Lc1bS9kI9QEQowo+zYH+SAv1bH+KSJmGHiUds6orGKp+Yb5I35u
MUPKjO65uicGyIpWG+tr4PdxfeueWEmWnQTCVnUNJyp0YJoPQbTXHdlMP1eD/1BG
zO3Dn3odw1H1zG4G6VgvnVBCfoJc7v0dqDv3EEBt4Ks7XfZsUyYGAcBHNNT4xguo
FTF067tnobdFxTdSw2zCZy2l41Td7p7BBDjViUqKksHnftWftwzPbr92iUOLHrhY
XO3GG7FeEw4U5RQ+G8C86D0hzrDDXh3BO9/C+AjQXP9pN8NC5eITS1EUpzNVG3DM
o0ZvAVM8PLc+HaD0hdkRlP+/yEpyzQ==
=NtXt
-----END PGP SIGNATURE-----

--ctgofqqpxdmyesq2--
