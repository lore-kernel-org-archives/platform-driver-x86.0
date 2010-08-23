From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] Support MSI Poulsbo netbook U110/U115
Date: Mon, 23 Aug 2010 05:54:45 -0600
Message-ID: <4C72EE25020000230001F28F@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: gregkh@suse.de, trenn@suse.de, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Dennis.Jansen@web.de

Hi Matthew,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2010-08-17 =E6=96=BC 08:56 -0600=EF=BC=8CJo=
ey Lee =E6=8F=90=E5=88=B0=EF=BC=9A
> > I've thought about this a bit more and now lean towards thinking th=
at=20
> > putting the PCI IDs in the ACPI video driver is the best way to go.=
 The=20
> > alternative is to only fix it for MSI, which isn't the best option.=
 On=20
>=20
> OK! Got it!
> I will try to put the PCI IDs in ACPI video driver then send out the
> patch for review ASAP.
>=20

I just sand the "Add intel drm blacklist to intel_opregion_present
detect" patch to you and I put all Poulsbo/Morrestown PCI IDs in
blacklist in the patch.

> > the other hand, I looked at adding support to the Poulsbo driver an=
d it=20
> > actually seems pretty easy, so to be honest I'd prefer it if that g=
ot=20
> > done instead.
> >=20
>=20
> I am not good for video driver, but will also try to look at it.
>=20

I readed the following mail loop for Poulsbo drm driver:

http://sourceforge.net/mailarchive/message.php?msg_name=3D49C3CB88.2000=
202%40shipmail.org

Looks like GregKH is working on extract 2D video driver for
Poulsbo/Morrestown. We will need the 2D driver then add the opregion
support in Poulsbo 2D dirver like the Ironlake.


Thank's a lot!
Joey Lee
