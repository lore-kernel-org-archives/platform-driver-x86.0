Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4BE3EDE7F;
	Tue, 12 May 2026 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613450; cv=pass; b=MV+IHCLP5vBsPsv9Ln+8MKMRqoirM7hqZxSMKP+ykcBPVT8FmYhVowTflbNKmHQBqoDjV3XSn9MbAEIwpLYeZlDDzwSznuWyyRzZrXrjx/LojUcuGyKSznpQkm0E7/KdrfcurqGLHtQepGkPcFbpFwCwjXFn3SDSioktKfrLtec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613450; c=relaxed/simple;
	bh=f1oX2z+wbYFi1zmU1oQDEpCWl4CkO7rUBK1Lab7ay0c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=D/uz9BiQg5ujDFBfMHBGYr2yS0u7DCKfPsYFsHIuqSmH7+HtEVUi7c6BrhYKkuL5HAMmIilu7vX768rs7qnilKZsoojbs7jPR95kU8N/l5WVQ4H3f9C8Ifa+hYLDF40sTIeAdu7MEtjMqCx/iJw5mn2gyhs0c01EvfkHMg6trMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=IAKobGHP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="IAKobGHP"
ARC-Seal: i=1; a=rsa-sha256; t=1778613439; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D1R5Uk/8ndS+Rjmuwnh8CcdWwTi18AKwzBNu86YorNjYaA4NR4GzPUCDouANhG1F1SaUJOsrZDbWW18oYrEbwD0pFm8VpYZnw3tQpHISAiGyzCJ0PfkHip6PdIhe2w0tz4we//dr1SnEsyiSptq845BNyDqCuXuvjZjfHzIZ4/Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778613439; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5Rq71d3Q4OulWfRLKOO0CP0iDOsXASsLX36uyULn7L8=; 
	b=fzKq1gdUWjnxnLic2VZQ64/7lV1Monb5AaIHvwhI8522lkVvwTgh3hzVbstQK74G5OAuClyJDBn9JTXHejyFgxI7LnZlUTd0XFoS0j4WQQzmyvoqDya9CPzwZtcREXDFD6JF17HaIpujnkKtw9GlqvsakTdaU9UU98ENOs2CcTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778613439;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=5Rq71d3Q4OulWfRLKOO0CP0iDOsXASsLX36uyULn7L8=;
	b=IAKobGHPTbt6yEr6szyOfMh/2rukgkhba0ROHoUf/ee4XZXNk2S6oGiUZHM0v5BE
	TvXGABVLaieWRPhLJJm0xipkgs03JIrafpq8JN5cN8TRvSKleyWdVrszIBaCYdjqWOz
	vmSUyaUxk4h3xKvafImYVkZvCEKP1yiJNYOyeGrCkl8b+6uq6/0sBkaTQsdkk5CGQF+
	ccYvzJw9Hoc4VBH1UlpmQ001IbsSejOHBzF+K3xU3nJGXf5HO7Dz5oVF4NTebxmIqq3
	R1DtQbhGKzR9eq6LfEMFWAg1ezJ83B3geMJW+j9LjF8w8vGuqt5TnVwefp6qqznl30D
	CJ/zBjpwqw==
Received: by mx.zohomail.com with SMTPS id 1778613436928746.8850988783212;
	Tue, 12 May 2026 12:17:16 -0700 (PDT)
Date: Wed, 13 May 2026 03:16:28 +0800
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Greg KH <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_usb=3A_typec=3A_ucsi=3A_acpi=3A_D?=
 =?US-ASCII?Q?isable_on_devices_with_broken_firmware?=
User-Agent: Thunderbird for Android
In-Reply-To: <bbea5db0-f19c-4bf4-a8b9-db764d22fc71@app.fastmail.com>
References: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe> <2026051146-husked-ladybug-0c9f@gregkh> <c1df76ba422eebfc733f1c73655582804d0e2921.camel@rong.moe> <06e5005d-8621-4031-b3a3-6fd735cebbd4@app.fastmail.com> <f7e11c958432701c69651f0666ec1604383113e3.camel@rong.moe> <bbea5db0-f19c-4bf4-a8b9-db764d22fc71@app.fastmail.com>
Message-ID: <2B0AC553-0CAA-41E2-B6B6-A9379BF6F5D5@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Mark,

=E4=BA=8E 2026=E5=B9=B45=E6=9C=8813=E6=97=A5 GMT+08:00 02:28:56=EF=BC=8CMa=
rk Pearson <mpearson-lenovo@squebb=2Eca> =E5=86=99=E9=81=93=EF=BC=9A
>Hi Rong
>
>On Tue, May 12, 2026, at 8:46 AM, Rong Zhang wrote:
>> Hi Mark,
>>
>> On Mon, 2026-05-11 at 19:11 -0400, Mark Pearson wrote:
>>> On Mon, May 11, 2026, at 3:12 PM, Rong Zhang wrote:
>>> > (+CC Mark Pearson from Lenovo)
>>> >=20
>>> > Hi Greg,
>>> >=20
>>> > On Mon, 2026-05-11 at 20:25 +0200, Greg Kroah-Hartman wrote:
>>> > > On Tue, May 12, 2026 at 01:59:34AM +0800, Rong Zhang wrote:
>>> > > > Some Lenovo devices have broken firmware, which reads/writes hal=
f-valid-
>>> > > > half-garbage values=2E
>>> > >=20
>>> > > How does this work with this firmware on other operating systems? =
=C2=A0
>>> > >=20
>>> >=20
>>> > The timeout=C2=A0can hardly reached unless a bunch of events cause m=
ultiple
>>> > drivers to compete for the same mutex simultaneously=2E
>>> >=20
>>> > If other operating systems' UCSI drivers don't send any command duri=
ng
>>> > power events, they won't suffer from the mutex acquisition timeout=
=2E
>>> > Also, if other drivers on these operating systems don't touch the mu=
tex
>>> > on power events at all, their UCSI drivers should work well too=2E
>>> >=20
>>> > These operating systems' UCSI drivers are powered by undefined behav=
ior
>>> > (TM) in both cases=2E
>>> >=20
>>> > > What
>>> > > is the odds of fixing the firmware?
>>> >=20
>>> > They are not Linux-certified devices, so Lenovo is very unlikely to =
fix
>>> > the firmware unless it breaks Windows :(
>>> >=20
>>> > Quoting Mark Pearson's reply to the bugzilla thread:
>>> >=20
>>> >    I can't promise anything - I don't have any official levers to pu=
ll for
>>> >    this platform I'm afraid (it is better to buy Linux supported/cer=
tified
>>> >    systems ;) )
>>> >=20
>>> > https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D221065#c38
>>> >=20
>>> > >=20
>>> > > > Given that everything is broken, disable ucsi_acpi on these devi=
ces=2E The
>>> > > > impact of disabling it is minimal, as Lenovo laptops usually hav=
e most
>>> > > > USCI commands more or less stubbed, and the EC can always handle=
s USB-C
>>> > > > events on its own=2E
>>> > > >=20
>>> > > > Link: https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D221065=
#c33
>>> > > > Signed-off-by: Rong Zhang <i@rong=2Emoe>
>>> > > > ---
>>> > > >  drivers/usb/typec/ucsi/ucsi_acpi=2Ec | 91 +++++++++++++++++++++=
+++++++++++++++++
>>> > > >  1 file changed, 91 insertions(+)
>>> > > >=20
>>> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi=2Ec b/drivers/usb/=
typec/ucsi/ucsi_acpi=2Ec
>>> > > > index 6b92f296e985=2E=2E7632b441d401 100644
>>> > > > --- a/drivers/usb/typec/ucsi/ucsi_acpi=2Ec
>>> > > > +++ b/drivers/usb/typec/ucsi/ucsi_acpi=2Ec
>>> > > > @@ -155,6 +155,91 @@ static const struct dmi_system_id ucsi_acpi=
_quirks[] =3D {
>>> > > >  	{ }
>>> > > >  };
>>> > > > =20
>>> > > > +static const struct dmi_system_id ucsi_acpi_broken_devices[] =
=3D {
>>> > > > +	/* Firmware reads/writes half-valid-half-garbage values=2E */
>>> > > > +
>>> > > > +	/* BIOS: P1CN??WW */
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo IdeaPad 5 2-in-1 14AHP9",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DR"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo IdeaPad 5 2-in-1 16AHP9",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DS"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +
>>> > > > +	/* BIOS: R0CN??WW */
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo IdeaPad Slim 5 14AKP10",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83NJ"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo IdeaPad Slim 5 14AKP10",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HX"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo IdeaPad Slim 5 16AKP10",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +
>>> > > > +	/* BIOS: QXCN??WW */
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo Yoga 7 2-in-1 14AKP10",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JR"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo Yoga 7 2-in-1 16AKP10",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JU"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +
>>> > > > +	/* BIOS: LNCN??WW */
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo Yoga Pro 7 14ARP8",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AU"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo Slim Pro 7 14ARP8",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AX"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +
>>> > > > +	/* BIOS: PSCN??WW */
>>> > > > +	{
>>> > > > +		=2Eident =3D "Lenovo Yoga Pro 7 14ASP9",
>>> > > > +		=2Ematches =3D {
>>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
>>> > > > +		},
>>> > > > +	},
>>> > > > +	{ }
>>> > > > +};
>>> > >=20
>>> > > That is a lot of devices to exclude, are you sure that none of the=
m will
>>> > > ever work properly?
>>> >=20
>>> > Yes=2E I carefully checked all acpidumps for these devices provided =
by
>>> > device owners who replied to the bugzilla thread, and confirmed that
>>> > they all share the same UCSI-ACPI implementation=2E
>>> >=20
>>> > 83DR, 83HN, 83HY, 83AU, 83JR are owned by these device owners=2E Oth=
er
>>> > devices share the same BIOS images (see comments in the match table)=
, so
>>> > I added them as well=2E
>>> >=20
>>> > Device owners also reported their dmesg dumps/snips with ucsi_acpi
>>> > errors=2E
>>> >=20
>>> > As a reference, buggy ASL methods are shown as below=2E
>>> >=20
>>> > \_SB=2EPCI0=2ELPC0=2EEC0:
>>> >                     Method (ECRD, 1, Serialized)
>>> >                     {
>>> >                         Local0 =3D Acquire (ECMT, 0x03E8)
>>> >                         If ((Local0 =3D=3D Zero))
>>> >                         {
>>> >                             If (ECAV)
>>> >                             {
>>> >                                 Local1 =3D DerefOf (Arg0)
>>> >                                 Release (ECMT)
>>> >                                 Return (Local1)
>>> >                             }
>>> >                             Else
>>> >                             {
>>> >                                 Release (ECMT)
>>> >                             }
>>> >                         }
>>> >=20
>>> >                         Return (Zero)
>>> >                     }
>>> >=20
>>> >                     Method (ECWT, 2, Serialized)
>>> >                     {
>>> >                         Local0 =3D Acquire (ECMT, 0x03E8)
>>> >                         If ((Local0 =3D=3D Zero))
>>> >                         {
>>> >                             If (ECAV)
>>> >                             {
>>> >                                 Arg1 =3D Arg0
>>> >                             }
>>> >=20
>>> >                             Release (ECMT)
>>> >                         }
>>> >                     }
>>> >=20
>>> > \_SB=2EUBTC:
>>> >             Method (ECWR, 0, Serialized)
>>> >             {
>>> >                 IO80 =3D 0xD0
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO0, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO0))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO1, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO1))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO2, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO2))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO3, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO3))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO4, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO4))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO5, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO5))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO6, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO6))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO7, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO7))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO8, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO8))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGO9, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGO9))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGOA, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGOA))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGOB, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGOB))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGOC, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGOC))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGOD, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGOD))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGOE, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGOE))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (MGOF, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EMGOF))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL0, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL0))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL1, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL1))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL2, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL2))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL3, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL3))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL4, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL4))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL5, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL5))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL6, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL6))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (CTL7, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2ECTL7))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (0xE0, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EUSDC))
>>> >                 IO80 =3D 0xD1
>>> >             }
>>> >=20
>>> >             Method (ECRD, 0, Serialized)
>>> >             {
>>> >                 IO80 =3D 0xD3
>>> >                 MGI0 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI0))
>>> >                 MGI1 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI1))
>>> >                 MGI2 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI2))
>>> >                 MGI3 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI3))
>>> >                 MGI4 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI4))
>>> >                 MGI5 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI5))
>>> >                 MGI6 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI6))
>>> >                 MGI7 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI7))
>>> >                 MGI8 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI8))
>>> >                 MGI9 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGI9))
>>> >                 MGIA =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGIA))
>>> >                 MGIB =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGIB))
>>> >                 MGIC =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGIC))
>>> >                 MGID =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGID))
>>> >                 MGIE =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGIE))
>>> >                 MGIF =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EMGIF))
>>> >                 VER1 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EVER1))
>>> >                 VER2 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2EVER2))
>>> >                 RSV1 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2ERSV1))
>>> >                 RSV2 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2ERSV2))
>>> >                 CCI0 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2ECCI0))
>>> >                 CCI1 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2ECCI1))
>>> >                 CCI2 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2ECCI2))
>>> >                 CCI3 =3D \_SB=2EPCI0=2ELPC0=2EEC0=2EECRD (RefOf (\_S=
B=2EPCI0=2ELPC0=2EEC0=2ECCI3))
>>> >                 \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT (0xE1, RefOf (\_SB=
=2EPCI0=2ELPC0=2EEC0=2EUSGC))
>>> >                 IO80 =3D 0xD4
>>> >             }
>>> >=20
>>> >             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific=
=20
>>> > Method
>>> >             {
>>> >                 If ((Arg0 =3D=3D ToUUID=20
>>> > ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
>>> >                 {
>>> >                     If ((ToInteger (Arg2) =3D=3D Zero))
>>> >                     {
>>> >                         Return (Buffer (One)
>>> >                         {
>>> >                              0x0F                                   =
   =20
>>> >       // =2E
>>> >                         })
>>> >                     }
>>> >                     ElseIf ((ToInteger (Arg2) =3D=3D One))
>>> >                     {
>>> >                         ECWR ()
>>> >                     }
>>> >                     ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
>>> >                     {
>>> >                         ECRD ()
>>> >                     }
>>> >                     Else
>>> >                     {
>>> >                         Return (Zero)
>>> >                     }
>>> >                 }
>>> >=20
>>> >                 Return (Zero)
>>> >             }
>>> >         }
>>> >=20
>>> > Thanks,
>>> > Rong
>>> >=20
>>> > >=20
>>> > > thanks,
>>> > >=20
>>> > > greg k-h
>>>=20
>>> My biggest concern with this patch is it stands a chance of growing ra=
pidly and extensively=2E
>>
>> If the length of match table is a concern, we can turn this into an
>> allow list, i=2Ee=2E, disable ucsi_acpi on all Ryzen-based (after Rembr=
andt-
>> R) IdeaPad and Yoga devices by default if the allow list doesn't
>> matches, as it seems that these devices heavily shares the same UCSI-
>> ACPI implementation (probably developed by the same teams?)=2E
>>
>> I don't have a strong preference on either, so it's up to you and Greg=
=2E
>>
>
>An allow list would be worse from my (slightly selfish) perspective=2E
>
>>> We've been having a ton of UCSI issues on this years Thinkpad systems=
=2E We'll get them fixed, though it's been slow going=2E
>>
>> I don't think ThinkPad devices have the same issue, as their USCI-ACPI
>> implementations are completely different, which matches with my
>> understanding to Lenovo firmware, i=2Ee=2E, ThinkPad firmware is genera=
lly
>> developed by different teams compared to IdeaPad/Yoga teams=2E
>>
>> For example, ThinkPad Z16 Gen 1 (21D4/21D5) seems to implement the UCSI=
-
>> ACPI DSM properly (my analysis attached at the end of the reply)=2E Eve=
n
>> if it is problematic, it must be caused by a different bug=2E
>>
>
>I'm testing on platforms that aren't released yet=2E Generally you're rig=
ht - it's not a problem=2E But this years platforms have been bad (I don't =
think it's related to the CPU vendor)

Well, while the bug itself has nothing to do with the CPU vendor, platform=
s with the same CPU vendor are more likely to share most ACPI implementatio=
ns=2E I guess that's why the bug here is only seen on AMD-based ones=2E

>
>>>=20
>>> I don't understand it yet (and your notes above might be useful for na=
rrowing it down)=2E The FW team says the FW passes all the UCSI tests under=
 Windows,=C2=A0
>>>=20
>>
>> It's just like you can safely use MT-unsafe libc functions in a single-
>> threaded program -- this doesn't prove the MT-safety of these functions=
=2E
>>
>> As I've said, the timeout will only reach when a lot of ACPI methods
>> compete for the ECMT mutex as the same time=2E If they tested it with
>> little background noise, the mutex acquisition timeout was never reache=
d
>> so no test failed=2E
>>
>>> but on Linux it's really bad and I see the same on my HW=2E
>>
>> Well, I have another conjecture=2E Typical Windows users don't bother
>> taking a look at Windows Event Viewer at all, so they never notices any
>> error related to the ECMT mutex=2E In contrast, checking dmesg is much
>> easier=2E
>>
>
>You might be right=2E I'm told there is a bunch of qualification testing =
they do against Windows but I don't know the details and I've definitely pr=
eviously seen garbage results previously with invalid connector numbers bei=
ng returned (that we got fixed); so I'm personally dubious=2E
>
>Agreed that regular Windows users won't notice=2E I get this all the time=
 - we fix stuff (usually ACPI  errors) that Windows just covers up=2E Such =
is the penalty for being a superior OS ;)
>
>>>=20
>>> Hopefully once we figure out what is going on with the Thinkpads the o=
ther platforms will benefit? but flagging that this error is not uncommon=
=2E
>>
>> See my analysis at the end of the reply=2E
>>
>>>=20
>>> I'd be surprised if this is Lenovo only to be honest=2E=C2=A0
>>>=20
>>
>> That's not surprising=2E This is not an issue of EC itself, but rather =
an
>> issue of improper implementation of the UCSI-ACPI DSM method, as well a=
s
>> other EC-related ACPI methods=2E
>>
>
>My concern is that you could end up seeing this on a lot of different HW=
=2E
>
>Maybe we just need to be more brutal when an error is detected and quit a=
t that point with a pr_err "your UCSI FW is bad, report it to the vendor" a=
nd not retry?

This can hardly be detected=2E

The usci_acpi driver know few UCSI things because it's just a transport dr=
iver=2E It don't really understand what's in the buffer=2E Should we detect=
 it, we would have to do so in the typec_ucsi driver, which is non-optimal=
=2E

Moreover, a half-valid-half-garbage value could happen to be interpreted a=
s a completely valid value (but *different* from the real value), as long a=
s the garbage bytes are lucky enough=2E So the detection itself will be unr=
eliable=2E That's why I said "everything is broken" in the commit message -=
- we can't trust the buffer any more=2E

If you really want some sorts of detection, the only things we can detect =
are ACPI object names=2E I don't think overfitting to them is a good idea a=
nd it will definitely lead to a mess if someday a BIOS update fixes the bug=
=2E

>
>There's a huge number of different PCs being released every year, Linux u=
sage is growing, any list approach feels doomed to me=2E

TBH, using a device match table is the least invasive and the most common =
approach=2E

>
>>> I might be wrong, but there's really not a lot common between an Ideap=
ad and Thinkpad - they're completely different FW teams=2E=C2=A0I would exp=
ect the chances that this shows up elsewhere to be reasonable, in which cas=
e your list will grow even more=2E
>>
>> That's why the best solution is BIOS update=2E It would be great if Len=
ovo
>> provides BIOS updates to fix all these ECMT chaos=2E
>>
>> Meanwhile, some devices (namely, 83JR and 83JU) in the match table have=
,
>> unfortunately, reached the "End of Development Support" as their BIOS
>> download pages show:
>>
>> https://pcsupport=2Elenovo=2Ecom/us/en/products/laptops-and-netbooks/yo=
ga-series/yoga-7-2-in-1-14akp10/83jr/downloads/ds573496
>> https://pcsupport=2Elenovo=2Ecom/us/en/products/laptops-and-netbooks/yo=
ga-series/yoga-7-2-in-1-16akp10/83ju/downloads/ds573496
>>
>> =2E=2E=2E and PSREF says 83DR, 83AU and 83AX are "withdrawn," which mea=
ns they
>> are EOL according to the FAQs:
>>
>> https://psref=2Elenovo=2Ecom/WDProduct/IdeaPad/IdeaPad_5_2_in_1_14AHP9
>> https://psref=2Elenovo=2Ecom/WDProduct/Yoga/Yoga_Pro_7_14ARP8
>> https://psref=2Elenovo=2Ecom/WDProduct/lenovo_slim_pro_7_14arp8
>>
>
>Yeah, I know=2E And it sucks that we can't just have Linux on everything =
with vendor suport=2E One day we'll get there=2E=2E=2E=2E=2E

Well, that's why we've already seen a lot of quirk table entries in variou=
s drivers and will see more in the future=2E

Using a match table in such a case isn't that horrible from my perspective=
=2E

>
>>>=20
>>> Can we wait until a bit more investigation has been done on Thinkpad?=
=C2=A0
>>>=20
>>
>> I originally decided to wait a few months before submitting this=2E Thr=
ee
>> months had passed and Hans suggested I should submit this:
>>
>> https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D221065#c68
>>
>> As my analysis will show, I don't think the issue on IdeaPad/Yoga has
>> anything in common with ThinkPad=2E
>>
>> My speculation on the UCSI issues on ThinkPad is that they might be
>> caused by the EC itself or the local mutex (so other ACPI methods may
>> access EC simultaneously while ucsi_acpi accessing the EC)=2E
>>
>>> Right now it's on a small list of gating issues on a few of our platfo=
rms - so it is getting a bit more attention=2E=C2=A0
>>>=20
>>
>> Did you refer to "a ton of UCSI issues on this years Thinkpad systems,"
>> or the ECMT chaos on these IdeaPad/Yoga devices?
>>
>>> Once we have root cause it might be easier to find a better solution?
>>>=20
>>> Mark
>>
>> UCSI-ACPI DSM on ThinkPad Z16 Gen 1 (21D4/21D5):
>>
>> /*
>>  * This is an example of my comments=2E
>>  */
>>
>> /*
>>  * ThinkPad: UBSY is a local mutex, so no other methods compete for it=
=2E
>>  *
>>  * IdeaPad/Yoga: ECMT is shared among a lot of ACPI methods:
>>  *
>>  *   $ grep -rE 'Acquire \(=2E*ECMT' | wc -l
>>  *   21
>>  *   $ grep -orE 'Acquire \(=2E*ECMT[^)]+' | cut -d ',' -f2 | xargs -i=
=20
>> bash -c 'echo $(( {} ))ms' | sort -n | uniq -c
>>  *    1 300ms
>>  *    2 1000ms
>>  *    4 2000ms
>>  *    4 8192ms
>>  *   10 40960ms
>>  */
>>             Mutex (UBSY, 0x00)
>>             Method (SECM, 1, Serialized)
>>             {
>>                 Local0 =3D 0x64
>>                 While (((\_SB=2ESCMD !=3D 0x00) && (Local0 !=3D 0x00)))
>>                 {
>>                     Sleep (0x01)
>>                     Local0--
>>                 }
>>
>>                 \_SB=2ESCMD =3D Arg0
>>                 If ((Arg0 =3D=3D 0x02))
>>                 {
>>                     Local0 =3D 0x64
>>                     While (((\_SB=2ESCMD !=3D 0x00) && (Local0 !=3D 0x0=
0)))
>>                     {
>>                         Sleep (0x01)
>>                         Local0--
>>                     }
>>                 }
>>             }
>>
>> /*
>>  * ThinkPad: the UBSY mutex protects the whole UCSI methods=2E
>>  *
>>  * IdeaPad/Yoga: the ECMT mutex protects a single byte read/write to th=
e EC,
>>  * i=2Ee=2E, protects \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT and \_SB=2EPCI0=
=2ELPC0=2EEC0=2EECRD=2E
>>  */
>>             Method (ECWR, 0, Serialized)
>>             {
>> /*
>>  * ThinkPad: the acquisition of UBSY has no timeout (0xFFFF means no ti=
meout
>>  * according to the ACPI spec), so it will never fail=2E
>>  *
>>  * IdeaPad/Yoga: \_SB=2EPCI0=2ELPC0=2EEC0=2EECWT and \_SB=2EPCI0=2ELPC0=
=2EEC0=2EECRD silently
>>  * fail after the 1s timeout is reached while their callers never check=
 for
>>  * failure=2E
>>  */
>>                 Acquire (UBSY, 0xFFFF)
>> /*
>>  * ThinkPad: direct EC access, the UCSI buffer and the EC are synchroni=
zed=2E
>>  *
>>  * IdeaPad/Yoga: the helper functions fail silently when the timeout is=
 reached,
>>  * leaving the UCSI buffer and the EC are out of sync=2E
>>  */
>>                 \_SB=2EMGO0 =3D MGO0 /* \_SB_=2EUBTC=2EMGO0 */
>>                 \_SB=2EMGO1 =3D MGO1 /* \_SB_=2EUBTC=2EMGO1 */
>>                 \_SB=2EMGO2 =3D MGO2 /* \_SB_=2EUBTC=2EMGO2 */
>>                 \_SB=2EMGO3 =3D MGO3 /* \_SB_=2EUBTC=2EMGO3 */
>>                 \_SB=2EMGO4 =3D MGO4 /* \_SB_=2EUBTC=2EMGO4 */
>>                 \_SB=2EMGO5 =3D MGO5 /* \_SB_=2EUBTC=2EMGO5 */
>>                 \_SB=2EMGO6 =3D MGO6 /* \_SB_=2EUBTC=2EMGO6 */
>>                 \_SB=2EMGO7 =3D MGO7 /* \_SB_=2EUBTC=2EMGO7 */
>>                 \_SB=2EMGO8 =3D MGO8 /* \_SB_=2EUBTC=2EMGO8 */
>>                 \_SB=2EMGO9 =3D MGO9 /* \_SB_=2EUBTC=2EMGO9 */
>>                 \_SB=2EMGOA =3D MGOA /* \_SB_=2EUBTC=2EMGOA */
>>                 \_SB=2EMGOB =3D MGOB /* \_SB_=2EUBTC=2EMGOB */
>>                 \_SB=2EMGOC =3D MGOC /* \_SB_=2EUBTC=2EMGOC */
>>                 \_SB=2EMGOD =3D MGOD /* \_SB_=2EUBTC=2EMGOD */
>>                 \_SB=2EMGOE =3D MGOE /* \_SB_=2EUBTC=2EMGOE */
>>                 \_SB=2EMGOF =3D MGOF /* \_SB_=2EUBTC=2EMGOF */
>>                 \_SB=2ECTL0 =3D CTL0 /* \_SB_=2EUBTC=2ECTL0 */
>>                 \_SB=2ECTL1 =3D CTL1 /* \_SB_=2EUBTC=2ECTL1 */
>>                 \_SB=2ECTL2 =3D CTL2 /* \_SB_=2EUBTC=2ECTL2 */
>>                 \_SB=2ECTL3 =3D CTL3 /* \_SB_=2EUBTC=2ECTL3 */
>>                 \_SB=2ECTL4 =3D CTL4 /* \_SB_=2EUBTC=2ECTL4 */
>>                 \_SB=2ECTL5 =3D CTL5 /* \_SB_=2EUBTC=2ECTL5 */
>>                 \_SB=2ECTL6 =3D CTL6 /* \_SB_=2EUBTC=2ECTL6 */
>>                 \_SB=2ECTL7 =3D CTL7 /* \_SB_=2EUBTC=2ECTL7 */
>>                 Sleep (0x19)
>>                 SECM (0x01)
>>                 Release (UBSY)
>>             }
>>
>>             Method (ECRD, 0, Serialized)
>>             {
>> /*
>>  * Same as above=2E
>>  */
>>                 Acquire (UBSY, 0xFFFF)
>>                 SECM (0x02)
>>                 Sleep (0x19)
>>                 MGI0 =3D \_SB=2EMGI0
>>                 MGI1 =3D \_SB=2EMGI1
>>                 MGI2 =3D \_SB=2EMGI2
>>                 MGI3 =3D \_SB=2EMGI3
>>                 MGI4 =3D \_SB=2EMGI4
>>                 MGI5 =3D \_SB=2EMGI5
>>                 MGI6 =3D \_SB=2EMGI6
>>                 MGI7 =3D \_SB=2EMGI7
>>                 MGI8 =3D \_SB=2EMGI8
>>                 MGI9 =3D \_SB=2EMGI9
>>                 MGIA =3D \_SB=2EMGIA
>>                 MGIB =3D \_SB=2EMGIB
>>                 MGIC =3D \_SB=2EMGIC
>>                 MGID =3D \_SB=2EMGID
>>                 MGIE =3D \_SB=2EMGIE
>>                 MGIF =3D \_SB=2EMGIF
>>                 CCI0 =3D \_SB=2ECCI0
>>                 CCI1 =3D \_SB=2ECCI1
>>                 CCI2 =3D \_SB=2ECCI2
>>                 CCI3 =3D \_SB=2ECCI3
>>                 Release (UBSY)
>>             }
>>
>>             [=2E=2E=2E]
>>
>>             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific=20
>> Method
>>             {
>>                 If ((Arg0 =3D=3D ToUUID=20
>> ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
>>                 {
>>                     If ((ToInteger (Arg2) =3D=3D 0x00))
>>                     {
>>                         Return (Buffer (0x01)
>>                         {
>>                              0x0F                                      =
=20
>>       // =2E
>>                         })
>>                     }
>>                     ElseIf ((ToInteger (Arg2) =3D=3D 0x01))
>>                     {
>>                         ECWR ()
>>                     }
>>                     ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
>>                     {
>>                         ECRD ()
>>                     }
>>                 }
>>
>>                 Return (0x00)
>>             }
>>
>> The acpidump can be found at=20
>> https://github=2Ecom/linuxhw/ACPI/blob/master/Notebook/Lenovo/ThinkPad/=
ThinkPad%20Z16%20Gen%201%2021D4S02A00/41C7BA241943=2Ebin
>>
>Been tied up in meetings today, but I do plan on seeing if this matches w=
hat I'm seeing=2E On my todo list=2E=2E=2E

Thanks a lot for your efforts in pushing Lenovo's Linux support so far=2E =
I've used Lenovo laptops for years and your efforts definitely make my life=
 easier :)

Thanks,
Rong

>
>Mark
