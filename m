Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D33B5DF6;
	Tue, 12 May 2026 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590301; cv=pass; b=rxrfEJ7hxPw10KGc/EF1hedlzI7XOC3FOzabWTXcZQtAsnHcU7Yjyrzoqs8SxYacnkaRiwq+DF+1d0UbD+/t/Vm0c9yF/VpcdNv62sW3vhIwt01xBKNpaCnV2INt1xdheSwxMNvAHrg3z2ZA1c9UGODwpI8CeM7UmeDHjqHq+xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590301; c=relaxed/simple;
	bh=hHsmaeHs+EmTF2Q9J9gU3j8wYJ5b0UlHRX7eR0Zr/so=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=X2U1e/tL0oAFgY919SnNo/XOY3XYqvA/SM3COBYvzhTAtk7YeGnq7M2P1kcpK7NCc7UN8A5uyn77IbgKD0rYXvf/4FFqJyNtiVxNAznuc2aZtkNhwisO05pN6Inx0zUiVlk4Co8ou6DnUvVaCd7eRZz0hSMloMLyOBni4xlLHpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Lw6Vtp7G; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Lw6Vtp7G"
ARC-Seal: i=1; a=rsa-sha256; t=1778590291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nKLA77/rgQAQr+DJk9a27035ez3cQo49QGOwnfTFo4WhGWpuuB3z0jBYr7OPVUviuPfcYUWKV7a/Sqp8J47RsG7mRR/+po78sr9qjg6BDhRGAqxsZyiCJz0eUhD0ZRlpH0oCLs8Vq9Ev+iaSmPoo8yJnuJgX5wWCF1Hw2Ax03vQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778590291; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tUzR+gMNw6RZWG6Kz32ZZ4epDczQYPf/E9RhAa1EcNQ=; 
	b=WYpt3uzJLLHpjAyAd3xM8KcxyYPW7DgNuvlKD/itEdaKRgFNEUbkQHdB5VO1P7Hc/6fG6Zt7PcWv6/BlyjzkU0LorL1eZwfQdVrJBBTUfTsh8T17GGG8T6hETCfkvTnPjVu2we8SCvNyNPlm+LFeNoGMktz1Tn2LDEzeYbEAfls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778590291;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=tUzR+gMNw6RZWG6Kz32ZZ4epDczQYPf/E9RhAa1EcNQ=;
	b=Lw6Vtp7GNW2qIIKs4zOdRnyLmHy5hkO7wSPodUe8aY6FuKcfOpmUAq9JDesWaJu5
	xsx1PoWGHeEJzxisEgKbBoEmac6tVr8DK3kPyuMvF0Qc/G7cByBrSWDtqZKBLWSJEtW
	8LxhbhgC5x+lpP+XAorFlc+uA64B53ik3rNWgXDU4Nq7ezJ/nKTwAQ7HRKbXxYjuvht
	cmhjAV1cXE5JrdLrT0MQCdKsKrBbHiYSLjaN2a0kW0MF/q+By9NE1rpI56VcxYToVpr
	m2EskbNywh8QSyZpsOYw3Oost/XZStnm/sraurZVk5HAJbO7xTMsG8DL3ftUEfK0RbI
	7VGr6MJMhw==
Received: by mx.zohomail.com with SMTPS id 1778590288671213.5069573348187;
	Tue, 12 May 2026 05:51:28 -0700 (PDT)
Message-ID: <f7e11c958432701c69651f0666ec1604383113e3.camel@rong.moe>
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Disable on devices with broken
 firmware
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Greg KH
	 <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede
	 <hansg@kernel.org>, linux-usb@vger.kernel.org, 
 "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <06e5005d-8621-4031-b3a3-6fd735cebbd4@app.fastmail.com>
References: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe>
	 <2026051146-husked-ladybug-0c9f@gregkh>
	 <c1df76ba422eebfc733f1c73655582804d0e2921.camel@rong.moe>
	 <06e5005d-8621-4031-b3a3-6fd735cebbd4@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 20:46:20 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Mark,

On Mon, 2026-05-11 at 19:11 -0400, Mark Pearson wrote:
> On Mon, May 11, 2026, at 3:12 PM, Rong Zhang wrote:
> > (+CC Mark Pearson from Lenovo)
> >=20
> > Hi Greg,
> >=20
> > On Mon, 2026-05-11 at 20:25 +0200, Greg Kroah-Hartman wrote:
> > > On Tue, May 12, 2026 at 01:59:34AM +0800, Rong Zhang wrote:
> > > > Some Lenovo devices have broken firmware, which reads/writes half-v=
alid-
> > > > half-garbage values.
> > >=20
> > > How does this work with this firmware on other operating systems? =C2=
=A0
> > >=20
> >=20
> > The timeout=C2=A0can hardly reached unless a bunch of events cause mult=
iple
> > drivers to compete for the same mutex simultaneously.
> >=20
> > If other operating systems' UCSI drivers don't send any command during
> > power events, they won't suffer from the mutex acquisition timeout.
> > Also, if other drivers on these operating systems don't touch the mutex
> > on power events at all, their UCSI drivers should work well too.
> >=20
> > These operating systems' UCSI drivers are powered by undefined behavior
> > (TM) in both cases.
> >=20
> > > What
> > > is the odds of fixing the firmware?
> >=20
> > They are not Linux-certified devices, so Lenovo is very unlikely to fix
> > the firmware unless it breaks Windows :(
> >=20
> > Quoting Mark Pearson's reply to the bugzilla thread:
> >=20
> >    I can't promise anything - I don't have any official levers to pull =
for
> >    this platform I'm afraid (it is better to buy Linux supported/certif=
ied
> >    systems ;) )
> >=20
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c38
> >=20
> > >=20
> > > > Given that everything is broken, disable ucsi_acpi on these devices=
. The
> > > > impact of disabling it is minimal, as Lenovo laptops usually have m=
ost
> > > > USCI commands more or less stubbed, and the EC can always handles U=
SB-C
> > > > events on its own.
> > > >=20
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c33
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi_acpi.c | 91 ++++++++++++++++++++++++++=
++++++++++++
> > > >  1 file changed, 91 insertions(+)
> > > >=20
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec=
/ucsi/ucsi_acpi.c
> > > > index 6b92f296e985..7632b441d401 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > > > @@ -155,6 +155,91 @@ static const struct dmi_system_id ucsi_acpi_qu=
irks[] =3D {
> > > >  	{ }
> > > >  };
> > > > =20
> > > > +static const struct dmi_system_id ucsi_acpi_broken_devices[] =3D {
> > > > +	/* Firmware reads/writes half-valid-half-garbage values. */
> > > > +
> > > > +	/* BIOS: P1CN??WW */
> > > > +	{
> > > > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 14AHP9",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DR"),
> > > > +		},
> > > > +	},
> > > > +	{
> > > > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 16AHP9",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DS"),
> > > > +		},
> > > > +	},
> > > > +
> > > > +	/* BIOS: R0CN??WW */
> > > > +	{
> > > > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83NJ"),
> > > > +		},
> > > > +	},
> > > > +	{
> > > > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HX"),
> > > > +		},
> > > > +	},
> > > > +	{
> > > > +		.ident =3D "Lenovo IdeaPad Slim 5 16AKP10",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
> > > > +		},
> > > > +	},
> > > > +
> > > > +	/* BIOS: QXCN??WW */
> > > > +	{
> > > > +		.ident =3D "Lenovo Yoga 7 2-in-1 14AKP10",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JR"),
> > > > +		},
> > > > +	},
> > > > +	{
> > > > +		.ident =3D "Lenovo Yoga 7 2-in-1 16AKP10",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JU"),
> > > > +		},
> > > > +	},
> > > > +
> > > > +	/* BIOS: LNCN??WW */
> > > > +	{
> > > > +		.ident =3D "Lenovo Yoga Pro 7 14ARP8",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AU"),
> > > > +		},
> > > > +	},
> > > > +	{
> > > > +		.ident =3D "Lenovo Slim Pro 7 14ARP8",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AX"),
> > > > +		},
> > > > +	},
> > > > +
> > > > +	/* BIOS: PSCN??WW */
> > > > +	{
> > > > +		.ident =3D "Lenovo Yoga Pro 7 14ASP9",
> > > > +		.matches =3D {
> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
> > > > +		},
> > > > +	},
> > > > +	{ }
> > > > +};
> > >=20
> > > That is a lot of devices to exclude, are you sure that none of them w=
ill
> > > ever work properly?
> >=20
> > Yes. I carefully checked all acpidumps for these devices provided by
> > device owners who replied to the bugzilla thread, and confirmed that
> > they all share the same UCSI-ACPI implementation.
> >=20
> > 83DR, 83HN, 83HY, 83AU, 83JR are owned by these device owners. Other
> > devices share the same BIOS images (see comments in the match table), s=
o
> > I added them as well.
> >=20
> > Device owners also reported their dmesg dumps/snips with ucsi_acpi
> > errors.
> >=20
> > As a reference, buggy ASL methods are shown as below.
> >=20
> > \_SB.PCI0.LPC0.EC0:
> >                     Method (ECRD, 1, Serialized)
> >                     {
> >                         Local0 =3D Acquire (ECMT, 0x03E8)
> >                         If ((Local0 =3D=3D Zero))
> >                         {
> >                             If (ECAV)
> >                             {
> >                                 Local1 =3D DerefOf (Arg0)
> >                                 Release (ECMT)
> >                                 Return (Local1)
> >                             }
> >                             Else
> >                             {
> >                                 Release (ECMT)
> >                             }
> >                         }
> >=20
> >                         Return (Zero)
> >                     }
> >=20
> >                     Method (ECWT, 2, Serialized)
> >                     {
> >                         Local0 =3D Acquire (ECMT, 0x03E8)
> >                         If ((Local0 =3D=3D Zero))
> >                         {
> >                             If (ECAV)
> >                             {
> >                                 Arg1 =3D Arg0
> >                             }
> >=20
> >                             Release (ECMT)
> >                         }
> >                     }
> >=20
> > \_SB.UBTC:
> >             Method (ECWR, 0, Serialized)
> >             {
> >                 IO80 =3D 0xD0
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO0, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO0))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO1, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO1))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO2, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO2))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO3, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO3))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO4, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO4))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO5, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO5))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO6, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO6))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO7, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO7))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO8, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO8))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO9, RefOf (\_SB.PCI0.LPC0.EC=
0.MGO9))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOA, RefOf (\_SB.PCI0.LPC0.EC=
0.MGOA))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOB, RefOf (\_SB.PCI0.LPC0.EC=
0.MGOB))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOC, RefOf (\_SB.PCI0.LPC0.EC=
0.MGOC))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOD, RefOf (\_SB.PCI0.LPC0.EC=
0.MGOD))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOE, RefOf (\_SB.PCI0.LPC0.EC=
0.MGOE))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOF, RefOf (\_SB.PCI0.LPC0.EC=
0.MGOF))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL0, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL0))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL1, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL1))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL2, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL2))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL3, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL3))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL4, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL4))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL5, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL5))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL6, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL6))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL7, RefOf (\_SB.PCI0.LPC0.EC=
0.CTL7))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (0xE0, RefOf (\_SB.PCI0.LPC0.EC=
0.USDC))
> >                 IO80 =3D 0xD1
> >             }
> >=20
> >             Method (ECRD, 0, Serialized)
> >             {
> >                 IO80 =3D 0xD3
> >                 MGI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI0))
> >                 MGI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI1))
> >                 MGI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI2))
> >                 MGI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI3))
> >                 MGI4 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI4))
> >                 MGI5 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI5))
> >                 MGI6 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI6))
> >                 MGI7 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI7))
> >                 MGI8 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI8))
> >                 MGI9 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGI9))
> >                 MGIA =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGIA))
> >                 MGIB =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGIB))
> >                 MGIC =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGIC))
> >                 MGID =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGID))
> >                 MGIE =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGIE))
> >                 MGIF =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.MGIF))
> >                 VER1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.VER1))
> >                 VER2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.VER2))
> >                 RSV1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.RSV1))
> >                 RSV2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.RSV2))
> >                 CCI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.CCI0))
> >                 CCI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.CCI1))
> >                 CCI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.CCI2))
> >                 CCI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0=
.EC0.CCI3))
> >                 \_SB.PCI0.LPC0.EC0.ECWT (0xE1, RefOf (\_SB.PCI0.LPC0.EC=
0.USGC))
> >                 IO80 =3D 0xD4
> >             }
> >=20
> >             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific=20
> > Method
> >             {
> >                 If ((Arg0 =3D=3D ToUUID=20
> > ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
> >                 {
> >                     If ((ToInteger (Arg2) =3D=3D Zero))
> >                     {
> >                         Return (Buffer (One)
> >                         {
> >                              0x0F                                      =
=20
> >       // .
> >                         })
> >                     }
> >                     ElseIf ((ToInteger (Arg2) =3D=3D One))
> >                     {
> >                         ECWR ()
> >                     }
> >                     ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
> >                     {
> >                         ECRD ()
> >                     }
> >                     Else
> >                     {
> >                         Return (Zero)
> >                     }
> >                 }
> >=20
> >                 Return (Zero)
> >             }
> >         }
> >=20
> > Thanks,
> > Rong
> >=20
> > >=20
> > > thanks,
> > >=20
> > > greg k-h
>=20
> My biggest concern with this patch is it stands a chance of growing rapid=
ly and extensively.

If the length of match table is a concern, we can turn this into an
allow list, i.e., disable ucsi_acpi on all Ryzen-based (after Rembrandt-
R) IdeaPad and Yoga devices by default if the allow list doesn't
matches, as it seems that these devices heavily shares the same UCSI-
ACPI implementation (probably developed by the same teams?).

I don't have a strong preference on either, so it's up to you and Greg.

> We've been having a ton of UCSI issues on this years Thinkpad systems. We=
'll get them fixed, though it's been slow going.

I don't think ThinkPad devices have the same issue, as their USCI-ACPI
implementations are completely different, which matches with my
understanding to Lenovo firmware, i.e., ThinkPad firmware is generally
developed by different teams compared to IdeaPad/Yoga teams.

For example, ThinkPad Z16 Gen 1 (21D4/21D5) seems to implement the UCSI-
ACPI DSM properly (my analysis attached at the end of the reply). Even
if it is problematic, it must be caused by a different bug.

>=20
> I don't understand it yet (and your notes above might be useful for narro=
wing it down). The FW team says the FW passes all the UCSI tests under Wind=
ows,=C2=A0
>=20

It's just like you can safely use MT-unsafe libc functions in a single-
threaded program -- this doesn't prove the MT-safety of these functions.

As I've said, the timeout will only reach when a lot of ACPI methods
compete for the ECMT mutex as the same time. If they tested it with
little background noise, the mutex acquisition timeout was never reached
so no test failed.

> but on Linux it's really bad and I see the same on my HW.

Well, I have another conjecture. Typical Windows users don't bother
taking a look at Windows Event Viewer at all, so they never notices any
error related to the ECMT mutex. In contrast, checking dmesg is much
easier.

>=20
> Hopefully once we figure out what is going on with the Thinkpads the othe=
r platforms will benefit? but flagging that this error is not uncommon.

See my analysis at the end of the reply.

>=20
> I'd be surprised if this is Lenovo only to be honest.=C2=A0
>=20

That's not surprising. This is not an issue of EC itself, but rather an
issue of improper implementation of the UCSI-ACPI DSM method, as well as
other EC-related ACPI methods.

> I might be wrong, but there's really not a lot common between an Ideapad =
and Thinkpad - they're completely different FW teams.=C2=A0I would expect t=
he chances that this shows up elsewhere to be reasonable, in which case you=
r list will grow even more.

That's why the best solution is BIOS update. It would be great if Lenovo
provides BIOS updates to fix all these ECMT chaos.

Meanwhile, some devices (namely, 83JR and 83JU) in the match table have,
unfortunately, reached the "End of Development Support" as their BIOS
download pages show:

https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/yoga-serie=
s/yoga-7-2-in-1-14akp10/83jr/downloads/ds573496
https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/yoga-serie=
s/yoga-7-2-in-1-16akp10/83ju/downloads/ds573496

... and PSREF says 83DR, 83AU and 83AX are "withdrawn," which means they
are EOL according to the FAQs:

https://psref.lenovo.com/WDProduct/IdeaPad/IdeaPad_5_2_in_1_14AHP9
https://psref.lenovo.com/WDProduct/Yoga/Yoga_Pro_7_14ARP8
https://psref.lenovo.com/WDProduct/lenovo_slim_pro_7_14arp8

>=20
> Can we wait until a bit more investigation has been done on Thinkpad?=C2=
=A0
>=20

I originally decided to wait a few months before submitting this. Three
months had passed and Hans suggested I should submit this:

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c68

As my analysis will show, I don't think the issue on IdeaPad/Yoga has
anything in common with ThinkPad.

My speculation on the UCSI issues on ThinkPad is that they might be
caused by the EC itself or the local mutex (so other ACPI methods may
access EC simultaneously while ucsi_acpi accessing the EC).

> Right now it's on a small list of gating issues on a few of our platforms=
 - so it is getting a bit more attention.=C2=A0
>=20

Did you refer to "a ton of UCSI issues on this years Thinkpad systems,"
or the ECMT chaos on these IdeaPad/Yoga devices?

> Once we have root cause it might be easier to find a better solution?
>=20
> Mark

UCSI-ACPI DSM on ThinkPad Z16 Gen 1 (21D4/21D5):

/*
 * This is an example of my comments.
 */

/*
 * ThinkPad: UBSY is a local mutex, so no other methods compete for it.
 *
 * IdeaPad/Yoga: ECMT is shared among a lot of ACPI methods:
 *
 *   $ grep -rE 'Acquire \(.*ECMT' | wc -l
 *   21
 *   $ grep -orE 'Acquire \(.*ECMT[^)]+' | cut -d ',' -f2 | xargs -i bash -=
c 'echo $(( {} ))ms' | sort -n | uniq -c
 *    1 300ms
 *    2 1000ms
 *    4 2000ms
 *    4 8192ms
 *   10 40960ms
 */
            Mutex (UBSY, 0x00)
            Method (SECM, 1, Serialized)
            {
                Local0 =3D 0x64
                While (((\_SB.SCMD !=3D 0x00) && (Local0 !=3D 0x00)))
                {
                    Sleep (0x01)
                    Local0--
                }

                \_SB.SCMD =3D Arg0
                If ((Arg0 =3D=3D 0x02))
                {
                    Local0 =3D 0x64
                    While (((\_SB.SCMD !=3D 0x00) && (Local0 !=3D 0x00)))
                    {
                        Sleep (0x01)
                        Local0--
                    }
                }
            }

/*
 * ThinkPad: the UBSY mutex protects the whole UCSI methods.
 *
 * IdeaPad/Yoga: the ECMT mutex protects a single byte read/write to the EC=
,
 * i.e., protects \_SB.PCI0.LPC0.EC0.ECWT and \_SB.PCI0.LPC0.EC0.ECRD.
 */
            Method (ECWR, 0, Serialized)
            {
/*
 * ThinkPad: the acquisition of UBSY has no timeout (0xFFFF means no timeou=
t
 * according to the ACPI spec), so it will never fail.
 *
 * IdeaPad/Yoga: \_SB.PCI0.LPC0.EC0.ECWT and \_SB.PCI0.LPC0.EC0.ECRD silent=
ly
 * fail after the 1s timeout is reached while their callers never check for
 * failure.
 */
                Acquire (UBSY, 0xFFFF)
/*
 * ThinkPad: direct EC access, the UCSI buffer and the EC are synchronized.
 *
 * IdeaPad/Yoga: the helper functions fail silently when the timeout is rea=
ched,
 * leaving the UCSI buffer and the EC are out of sync.
 */
                \_SB.MGO0 =3D MGO0 /* \_SB_.UBTC.MGO0 */
                \_SB.MGO1 =3D MGO1 /* \_SB_.UBTC.MGO1 */
                \_SB.MGO2 =3D MGO2 /* \_SB_.UBTC.MGO2 */
                \_SB.MGO3 =3D MGO3 /* \_SB_.UBTC.MGO3 */
                \_SB.MGO4 =3D MGO4 /* \_SB_.UBTC.MGO4 */
                \_SB.MGO5 =3D MGO5 /* \_SB_.UBTC.MGO5 */
                \_SB.MGO6 =3D MGO6 /* \_SB_.UBTC.MGO6 */
                \_SB.MGO7 =3D MGO7 /* \_SB_.UBTC.MGO7 */
                \_SB.MGO8 =3D MGO8 /* \_SB_.UBTC.MGO8 */
                \_SB.MGO9 =3D MGO9 /* \_SB_.UBTC.MGO9 */
                \_SB.MGOA =3D MGOA /* \_SB_.UBTC.MGOA */
                \_SB.MGOB =3D MGOB /* \_SB_.UBTC.MGOB */
                \_SB.MGOC =3D MGOC /* \_SB_.UBTC.MGOC */
                \_SB.MGOD =3D MGOD /* \_SB_.UBTC.MGOD */
                \_SB.MGOE =3D MGOE /* \_SB_.UBTC.MGOE */
                \_SB.MGOF =3D MGOF /* \_SB_.UBTC.MGOF */
                \_SB.CTL0 =3D CTL0 /* \_SB_.UBTC.CTL0 */
                \_SB.CTL1 =3D CTL1 /* \_SB_.UBTC.CTL1 */
                \_SB.CTL2 =3D CTL2 /* \_SB_.UBTC.CTL2 */
                \_SB.CTL3 =3D CTL3 /* \_SB_.UBTC.CTL3 */
                \_SB.CTL4 =3D CTL4 /* \_SB_.UBTC.CTL4 */
                \_SB.CTL5 =3D CTL5 /* \_SB_.UBTC.CTL5 */
                \_SB.CTL6 =3D CTL6 /* \_SB_.UBTC.CTL6 */
                \_SB.CTL7 =3D CTL7 /* \_SB_.UBTC.CTL7 */
                Sleep (0x19)
                SECM (0x01)
                Release (UBSY)
            }

            Method (ECRD, 0, Serialized)
            {
/*
 * Same as above.
 */
                Acquire (UBSY, 0xFFFF)
                SECM (0x02)
                Sleep (0x19)
                MGI0 =3D \_SB.MGI0
                MGI1 =3D \_SB.MGI1
                MGI2 =3D \_SB.MGI2
                MGI3 =3D \_SB.MGI3
                MGI4 =3D \_SB.MGI4
                MGI5 =3D \_SB.MGI5
                MGI6 =3D \_SB.MGI6
                MGI7 =3D \_SB.MGI7
                MGI8 =3D \_SB.MGI8
                MGI9 =3D \_SB.MGI9
                MGIA =3D \_SB.MGIA
                MGIB =3D \_SB.MGIB
                MGIC =3D \_SB.MGIC
                MGID =3D \_SB.MGID
                MGIE =3D \_SB.MGIE
                MGIF =3D \_SB.MGIF
                CCI0 =3D \_SB.CCI0
                CCI1 =3D \_SB.CCI1
                CCI2 =3D \_SB.CCI2
                CCI3 =3D \_SB.CCI3
                Release (UBSY)
            }

            [...]

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 =3D=3D ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b50=
08f") /* Unknown UUID */))
                {
                    If ((ToInteger (Arg2) =3D=3D 0x00))
                    {
                        Return (Buffer (0x01)
                        {
                             0x0F                                          =
   // .
                        })
                    }
                    ElseIf ((ToInteger (Arg2) =3D=3D 0x01))
                    {
                        ECWR ()
                    }
                    ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
                    {
                        ECRD ()
                    }
                }

                Return (0x00)
            }

The acpidump can be found at https://github.com/linuxhw/ACPI/blob/master/No=
tebook/Lenovo/ThinkPad/ThinkPad%20Z16%20Gen%201%2021D4S02A00/41C7BA241943.b=
in

Thanks,
Rong
