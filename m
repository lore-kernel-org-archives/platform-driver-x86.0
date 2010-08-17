From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] Support MSI Poulsbo netbook U110/U115
Date: Tue, 17 Aug 2010 08:56:28 -0600
Message-ID: <4C6B2FBC020000230001ED68@novprvlin0050.provo.novell.com>
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

=46irst, thank's for your kindy suggestion, it's good to us.

=E6=96=BC =E4=B8=80=EF=BC=8C2010-08-16 =E6=96=BC 16:56 +0100=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> On Fri, Aug 13, 2010 at 03:05:58AM -0600, Joey Lee wrote:
> > Hi Matthew,=20
> >=20
> > Dennis help me to ported this patch to 2.6.35, and it works as expe=
cted.
> > Could you please give me any suggestions for this patch?
>=20
> I've thought about this a bit more and now lean towards thinking that=
=20
> putting the PCI IDs in the ACPI video driver is the best way to go. T=
he=20
> alternative is to only fix it for MSI, which isn't the best option. O=
n=20

OK! Got it!
I will try to put the PCI IDs in ACPI video driver then send out the
patch for review ASAP.

> the other hand, I looked at adding support to the Poulsbo driver and =
it=20
> actually seems pretty easy, so to be honest I'd prefer it if that got=
=20
> done instead.
>=20

I am not good for video driver, but will also try to look at it.


Thank's a lot!
Joey Lee
