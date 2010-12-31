From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Fri, 31 Dec 2010 02:10:49 -0700
Message-ID: <4D1E38C90200002300026390@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: vpivaini@cs.helsinki.fi, dwmw2@infradead.org, platform-driver-x86@vger.kernel.org

Add Cc. David Woodhouse

Hi Carlos,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2010-12-30 =E6=96=BC 10:04 +0000=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Wednesday 29 December 2010 04:30:03 Joey Lee wrote:
>=20
> [..]
>=20
> > Maybe Wistron is the ODM (or OEM) to manufacture Lenovo Ideapad S12=
 ?
> > Anyway,
> > I added this Ideapad S12 to blacklist in acer-wmi driver because it=
 must
> > supported by ideapad-laptop driver.
> >=20
> > I also added Cc. to Carlos Corbacho, need his review.
>=20
> I suspect this is the same as all the Acer netbooks - they provide a =
dummy WMI=20
> interface which doesn't actually do anything. It would be nicer if th=
ere were=20
> a more generic way to do this, but this will do for now (I may try to=
 play=20
> around with my Aspire One and see if I can figure out some way to det=
ect the=20
> dummy interface, without needing to resort to DMI).
>=20

The issue reporter Vainio help to dump the acpi informatoin and put
here:
> - acpidump > acpidump.dat
http://vpv.kapsi.fi/ideapad-s12/acpidump.dat

There have AMW0 declare in DSDT:

        Device (AMW0)
        { =20
            Name (_HID, "*pnp0c14")
            Name (_UID, 0x00)
            Name (WLMP, 0x00)
            Name (WMID, 0x00)
            Name (B0ED, Buffer (0x04)

Per Vainio's report, the wlan rfkill cann't set to un-block when he use=
d
acer-wmi driver, but ideapad-laptop driver handle the killswitches
better.

Sorry,
I have no ideapad S12 machine for double check. Need David Woodhouse or
Ville-Pekka Vainio's confirm the ideapad-laptop driver supports Ideapad
S12 netbook.

I just simply checked the ideapad-laptop source code, it handle the
killswitch state by access EC address, if it works, then acer-wmi don't
need probe and touch the same function. So, I thought still need add
S12's dmi information to blacklist in acer-wmi to avoid conflict.

> [..]
>=20
> > From: Lee, Chun-Yi <jlee@novell.com>
> > Date: Wed, 29 Dec 2010 00:17:23 +0800
> > Subject: [PATCH] Add Lenovo Ideapad S12 to acer blacklist
> >=20
> > The Lenovo Ideapad S12's _WDG have GUID that matches with AMW0, it =
causes
> > acer-wmi driver auto-probe when system boot but there already have
> > ideapad-laptop driver to support Ideapad serial.
> > So, add Lenovo Ideapad S12 to acer blacklist to disable it.
> >=20
> > Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> > Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
>=20
> Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

Thank's a lot for your acked.

Joey Lee

> > ---
> >  drivers/platform/x86/acer-wmi.c |   11 +++++++++++
> >  1 files changed, 11 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c
> > b/drivers/platform/x86/acer-wmi.c index 28288ad..387ac7c 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -310,6 +310,17 @@ static struct dmi_system_id __devinitdata
> > acer_blacklist[] =3D { DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
> >  		},
> >  	},
> > +	/*
> > +	 * The Lenovo Ideapad S12 have GUID that matches with AMW0 - disa=
ble it.
> > +	 * There already have ideapad-laptop driver to support Ideapad se=
rial.
> > +	 */
> > +	{
> > +		.ident =3D "Lenovo Ideapad S12",
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "20021,2959"),
> > +		},
> > +	},
> >  	{}
> >  };
