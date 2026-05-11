Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBD4D2ECF;
	Mon, 11 May 2026 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527083; cv=pass; b=BI5NAe0ZJWY73PEe7p9HFPmAzkpKwdvl1+sUM8xvslttq25xn/FF/KYZBSciZ93GZ5P7291xmC22/72OAOkAvTocZx2A18Sdtd7uu/blceNGuTKCOycpb480s/jbYOcot8IlV8AKg5m/YOEZBVAl3zk4R/ROxxfuHSBWbYASqYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527083; c=relaxed/simple;
	bh=1tHvLyXozR6pXs01H/7Be0MKqzITTj43KyGhkxPUITc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S1YOV8SqHAsxI9fJcxFRCAQODO8yig/G4R5pPPhKDlPHI0D+8P/1HsgptuS0u6AcIxNdr7ZDm9h7QKzhsBkCvEPe1eg05VHRNqfYCpRDuvZ0Z4KOVEfES0j4mUqW/GKDgf3p5DcbVKqs4ewAYuEOhRGMYcZho/j/tG+gfNIT6g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=GeADWzqG; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="GeADWzqG"
ARC-Seal: i=1; a=rsa-sha256; t=1778527072; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fVT7fhl/vylfDutE49NFrKdtKY6RmkWUskpia+n5dPA/rvrLBQ7yhmpfs1Ku0lH+Na1TXUL06Tnh3rYYqOcpfkKUVuoO5Np7HoSW0xVmgz4NtucQ93YC+bkrTn/jLEGF9+qau7h7qYdq7LJ2dW1xm7lNxYJsjuou4N7tD34WCWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778527072; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UMzPmVCU3PePyPf4P8Qsb8SFyFcSl/yBmK6YyvaUr9Q=; 
	b=exAG6QuqbR0CJBHma2Vnln2KDKlRvJugd0Ysm1wQpPX6OQJbD1+J/MrGlbxymu0y7hhvqfHXtCrsJilyBmKZ23DiPZGG00d54w/nu0HlHGhBMfmLm1HO5jFOFbGbs1Zt77c1bq8+3HKje7kQ4Z/BlL5wC4Qgj+dPvxQPZ36K+TY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778527071;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=UMzPmVCU3PePyPf4P8Qsb8SFyFcSl/yBmK6YyvaUr9Q=;
	b=GeADWzqGCSm+gwqPYjuSCdUGP8esxjF8y4pwOJkvCpOO0yK1RxI00Adn9Uj0hveU
	C1wU6GW86meEOS0gDTf1fhAfqeIxxVEaRU5P/BtoqkXYqptrjAXCNd7CWXaMCy/EkSa
	nesXaxmKiVZyQFKRGKBqZs6tPRfnNzQem23kfcuiBBEKrHE9kPuTg0ttCYMEzyUBHSc
	cntIzUcaHGEhYzDKndYKs/3eFvZqJYzqmSfgFsMpXCrUyBYWUCn+OFk1my6krVT2zCc
	cjwmV6i0m3S4XSm0KSmFWH7gu4eRUEVDhgWxEdylmCDBNlRh1uTFK5wyyGe6GDHVRer
	F66EJLycLw==
Received: by mx.zohomail.com with SMTPS id 1778527069435967.9514096803472;
	Mon, 11 May 2026 12:17:49 -0700 (PDT)
Message-ID: <c1df76ba422eebfc733f1c73655582804d0e2921.camel@rong.moe>
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Disable on devices with broken
 firmware
From: Rong Zhang <i@rong.moe>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Heikki Krogerus
	 <heikki.krogerus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
	linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <2026051146-husked-ladybug-0c9f@gregkh>
References: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe>
	 <2026051146-husked-ladybug-0c9f@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:12:43 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

(+CC Mark Pearson from Lenovo)

Hi Greg,

On Mon, 2026-05-11 at 20:25 +0200, Greg Kroah-Hartman wrote:
> On Tue, May 12, 2026 at 01:59:34AM +0800, Rong Zhang wrote:
> > Some Lenovo devices have broken firmware, which reads/writes half-valid=
-
> > half-garbage values.
>=20
> How does this work with this firmware on other operating systems? =C2=A0
>=20

The timeout=C2=A0can hardly reached unless a bunch of events cause multiple
drivers to compete for the same mutex simultaneously.

If other operating systems' UCSI drivers don't send any command during
power events, they won't suffer from the mutex acquisition timeout.
Also, if other drivers on these operating systems don't touch the mutex
on power events at all, their UCSI drivers should work well too.

These operating systems' UCSI drivers are powered by undefined behavior
(TM) in both cases.

> What
> is the odds of fixing the firmware?

They are not Linux-certified devices, so Lenovo is very unlikely to fix
the firmware unless it breaks Windows :(

Quoting Mark Pearson's reply to the bugzilla thread:

   I can't promise anything - I don't have any official levers to pull for
   this platform I'm afraid (it is better to buy Linux supported/certified
   systems ;) )

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c38

>=20
> > Given that everything is broken, disable ucsi_acpi on these devices. Th=
e
> > impact of disabling it is minimal, as Lenovo laptops usually have most
> > USCI commands more or less stubbed, and the EC can always handles USB-C
> > events on its own.
> >=20
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c33
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  drivers/usb/typec/ucsi/ucsi_acpi.c | 91 ++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 91 insertions(+)
> >=20
> > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucs=
i/ucsi_acpi.c
> > index 6b92f296e985..7632b441d401 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > @@ -155,6 +155,91 @@ static const struct dmi_system_id ucsi_acpi_quirks=
[] =3D {
> >  	{ }
> >  };
> > =20
> > +static const struct dmi_system_id ucsi_acpi_broken_devices[] =3D {
> > +	/* Firmware reads/writes half-valid-half-garbage values. */
> > +
> > +	/* BIOS: P1CN??WW */
> > +	{
> > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 14AHP9",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DR"),
> > +		},
> > +	},
> > +	{
> > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 16AHP9",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DS"),
> > +		},
> > +	},
> > +
> > +	/* BIOS: R0CN??WW */
> > +	{
> > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83NJ"),
> > +		},
> > +	},
> > +	{
> > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HX"),
> > +		},
> > +	},
> > +	{
> > +		.ident =3D "Lenovo IdeaPad Slim 5 16AKP10",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
> > +		},
> > +	},
> > +
> > +	/* BIOS: QXCN??WW */
> > +	{
> > +		.ident =3D "Lenovo Yoga 7 2-in-1 14AKP10",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JR"),
> > +		},
> > +	},
> > +	{
> > +		.ident =3D "Lenovo Yoga 7 2-in-1 16AKP10",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JU"),
> > +		},
> > +	},
> > +
> > +	/* BIOS: LNCN??WW */
> > +	{
> > +		.ident =3D "Lenovo Yoga Pro 7 14ARP8",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AU"),
> > +		},
> > +	},
> > +	{
> > +		.ident =3D "Lenovo Slim Pro 7 14ARP8",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AX"),
> > +		},
> > +	},
> > +
> > +	/* BIOS: PSCN??WW */
> > +	{
> > +		.ident =3D "Lenovo Yoga Pro 7 14ASP9",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
> > +		},
> > +	},
> > +	{ }
> > +};
>=20
> That is a lot of devices to exclude, are you sure that none of them will
> ever work properly?

Yes. I carefully checked all acpidumps for these devices provided by
device owners who replied to the bugzilla thread, and confirmed that
they all share the same UCSI-ACPI implementation.

83DR, 83HN, 83HY, 83AU, 83JR are owned by these device owners. Other
devices share the same BIOS images (see comments in the match table), so
I added them as well.

Device owners also reported their dmesg dumps/snips with ucsi_acpi
errors.

As a reference, buggy ASL methods are shown as below.

\_SB.PCI0.LPC0.EC0:
                    Method (ECRD, 1, Serialized)
                    {
                        Local0 =3D Acquire (ECMT, 0x03E8)
                        If ((Local0 =3D=3D Zero))
                        {
                            If (ECAV)
                            {
                                Local1 =3D DerefOf (Arg0)
                                Release (ECMT)
                                Return (Local1)
                            }
                            Else
                            {
                                Release (ECMT)
                            }
                        }

                        Return (Zero)
                    }

                    Method (ECWT, 2, Serialized)
                    {
                        Local0 =3D Acquire (ECMT, 0x03E8)
                        If ((Local0 =3D=3D Zero))
                        {
                            If (ECAV)
                            {
                                Arg1 =3D Arg0
                            }

                            Release (ECMT)
                        }
                    }

\_SB.UBTC:
            Method (ECWR, 0, Serialized)
            {
                IO80 =3D 0xD0
                \_SB.PCI0.LPC0.EC0.ECWT (MGO0, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O0))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO1, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O1))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO2, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O2))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO3, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O3))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO4, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O4))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO5, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O5))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO6, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O6))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO7, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O7))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO8, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O8))
                \_SB.PCI0.LPC0.EC0.ECWT (MGO9, RefOf (\_SB.PCI0.LPC0.EC0.MG=
O9))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOA, RefOf (\_SB.PCI0.LPC0.EC0.MG=
OA))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOB, RefOf (\_SB.PCI0.LPC0.EC0.MG=
OB))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOC, RefOf (\_SB.PCI0.LPC0.EC0.MG=
OC))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOD, RefOf (\_SB.PCI0.LPC0.EC0.MG=
OD))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOE, RefOf (\_SB.PCI0.LPC0.EC0.MG=
OE))
                \_SB.PCI0.LPC0.EC0.ECWT (MGOF, RefOf (\_SB.PCI0.LPC0.EC0.MG=
OF))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL0, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L0))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL1, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L1))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL2, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L2))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL3, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L3))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL4, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L4))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL5, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L5))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL6, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L6))
                \_SB.PCI0.LPC0.EC0.ECWT (CTL7, RefOf (\_SB.PCI0.LPC0.EC0.CT=
L7))
                \_SB.PCI0.LPC0.EC0.ECWT (0xE0, RefOf (\_SB.PCI0.LPC0.EC0.US=
DC))
                IO80 =3D 0xD1
            }

            Method (ECRD, 0, Serialized)
            {
                IO80 =3D 0xD3
                MGI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI0))
                MGI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI1))
                MGI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI2))
                MGI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI3))
                MGI4 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI4))
                MGI5 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI5))
                MGI6 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI6))
                MGI7 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI7))
                MGI8 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI8))
                MGI9 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGI9))
                MGIA =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGIA))
                MGIB =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGIB))
                MGIC =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGIC))
                MGID =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGID))
                MGIE =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGIE))
                MGIF =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.MGIF))
                VER1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.VER1))
                VER2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.VER2))
                RSV1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.RSV1))
                RSV2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.RSV2))
                CCI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.CCI0))
                CCI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.CCI1))
                CCI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.CCI2))
                CCI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC0.EC0=
.CCI3))
                \_SB.PCI0.LPC0.EC0.ECWT (0xE1, RefOf (\_SB.PCI0.LPC0.EC0.US=
GC))
                IO80 =3D 0xD4
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 =3D=3D ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b50=
08f") /* Unknown UUID */))
                {
                    If ((ToInteger (Arg2) =3D=3D Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x0F                                          =
   // .
                        })
                    }
                    ElseIf ((ToInteger (Arg2) =3D=3D One))
                    {
                        ECWR ()
                    }
                    ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
                    {
                        ECRD ()
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Return (Zero)
            }
        }

Thanks,
Rong

>=20
> thanks,
>=20
> greg k-h
