From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Tue, 28 Dec 2010 21:30:03 -0700
Message-ID: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vpivaini@cs.helsinki.fi
Cc: carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

Hi Vainio,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2010-12-28 =E6=96=BC 19:28 +0200=EF=BC=8CVi=
lle-Pekka Vainio =E6=8F=90=E5=88=B0=EF=BC=9A
> I decided to upload the files to the web instead of attaching them to
> the email since they are quite large.
>=20
> ti, 2010-12-28 kello 08:36 -0700, Joey Lee kirjoitti:
> > It's not make sense acer-wmi probe on Ideapad S12 netbook, could yo=
u
> > please help to attached the following information?
> >=20
> > - modinfo acer-wmi > acer-wmi.log
>=20
> http://vpv.kapsi.fi/ideapad-s12/modinfo-acer-wmi.txt
>=20
> > - dmesg > dmesg.log
>=20
> http://vpv.kapsi.fi/ideapad-s12/dmesg-acer-wmi.txt
>=20
> > - dmidecode > dmidecode.log
>=20
> http://vpv.kapsi.fi/ideapad-s12/dmidecode-acer-wmi.txt
>=20
> > - acpidump > acpidump.dat
>=20
> http://vpv.kapsi.fi/ideapad-s12/acpidump.dat
>=20

It's funny Lenovo S12's _WDG have GUID that matches with Acer AMW0.

Dump from Lenovo Ideapad S12's _WDG:

67C3371D-95A3-4C37-BB61-DD47B491DAAB:
        object_id: AB
        notify_id: 41
        reserved: 42
        instance_count: 1
        flags: 0x2 ACPI_WMI_METHOD


In acer-wmi code:

#define AMW0_GUID1              "67C3371D-95A3-4C37-BB61-DD47B491DAAB"

MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");	//match



Maybe Wistron is the ODM (or OEM) to manufacture Lenovo Ideapad S12 ?
Anyway,=20
I added this Ideapad S12 to blacklist in acer-wmi driver because it mus=
t
supported by ideapad-laptop driver.

I also added Cc. to Carlos Corbacho, need his review.

Does is possible you help to test this patch?


Thank's a lot!
Joey Lee



From 194a1b499c36db057319712220af8ec7400030d7 Mon Sep 17 00:00:00 2001
=46rom: Lee, Chun-Yi <jlee@novell.com>
Date: Wed, 29 Dec 2010 00:17:23 +0800
Subject: [PATCH] Add Lenovo Ideapad S12 to acer blacklist

The Lenovo Ideapad S12's _WDG have GUID that matches with AMW0, it caus=
es
acer-wmi driver auto-probe when system boot but there already have
ideapad-laptop driver to support Ideapad serial.
So, add Lenovo Ideapad S12 to acer blacklist to disable it.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
---
 drivers/platform/x86/acer-wmi.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 28288ad..387ac7c 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -310,6 +310,17 @@ static struct dmi_system_id __devinitdata acer_bla=
cklist[] =3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
 		},
 	},
+	/*
+	 * The Lenovo Ideapad S12 have GUID that matches with AMW0 - disable =
it.
+	 * There already have ideapad-laptop driver to support Ideapad serial=
=2E
+	 */
+	{
+		.ident =3D "Lenovo Ideapad S12",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "20021,2959"),
+		},
+	},
 	{}
 };
=20
--=20
1.6.0.2
