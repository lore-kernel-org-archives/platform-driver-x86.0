From: joeyli <jlee@suse.com>
Subject: Re: drivers/platform/x86/acer-wmi.c: Support for another Lenovo
 Ideapad S205
Date: Fri, 16 Mar 2012 12:34:32 +0800
Message-ID: <1331872472.10557.251.camel@linux-s257.site>
References: <4F600A1D.5060002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:23513 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429Ab2CPEgN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 16 Mar 2012 00:36:13 -0400
In-Reply-To: <4F600A1D.5060002@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vaclav Mocek <vmocek@gmail.com>
Cc: jlee@novell.com, mjg@redhat.com, platform-driver-x86@vger.kernel.org

Hi Vaclav,=20

=E6=96=BC =E4=B8=89=EF=BC=8C2012-03-14 =E6=96=BC 03:01 +0000=EF=BC=8CVa=
clav Mocek =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi all,
>=20
> I am an unhappy owner of Lenovo Ideapad S205 and the drivers in the=20
> current development kernel (2f1c2b8) soft-blocks its Wi-Fi. S205 load=
s=20
> two kernel modules - ideapad-laptop.c and acer-wmi.c. The rfkill is=20
> controlled by acer-wmi.c and there is already a support for S205:
>=20
>      {
>          .callback =3D dmi_matched,
>          .ident =3D "Lenovo Ideapad S205",
>          .matches =3D {
>              DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>              DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
>          },
>          .driver_data =3D &quirk_lenovo_ideapad_s205,
>      },
>=20
> Unfortunately, my netbook has a different DMI_PRODUCT_NAME - "Brazos"=
=20
> instead of "10382LG" and there are at least eighteen possibilities [1=
].=20
> I spent some time Googling, comparing Smolt profiles, reading S205=20
> Hardware Maintenance Manual [2]  and analysing the BIOS updates. It=20
> seems, that all S205 are based on AMD platform called "Inagua" (E300,=
=20
> E350, E450), use two types of Wi-Fi cards (RaLink RT3090 and AR9285),=
=20
> various combination of SO DIMMs (2 x 1GB, 1 x 2GB, 2 x 2GB), differen=
t=20
> sizes of hardrives and different keyboard layouts; so overall there a=
re=20
> pretty much the same.
>=20
> There is a rare netbook called Lenovo Ideapad S205s ("s" at the end),=
=20
> but this one is based on Intel's processors [3].
>=20
> My proposal is very simple:
>=20
>      {
>           .callback =3D dmi_matched,
>           .ident =3D "Lenovo Ideapad S205",
>           .matches =3D {
>               DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -            DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad S205"),
>           },
>           .driver_data =3D &quirk_lenovo_ideapad_s205,
>       },
>=20
> It works. We are not able to test all product names and if the checki=
ng=20
> of DMI_PRODUCT_NAME is really required, it should be done in an=20
> additional step. The current situation is pretty bad - problems with=20
> UEFI booting (the only possibility)[4], impossibility to switch the=20
> power off, failing brightness control - and without a functional netw=
ork=20
> connection for a start, it is better to throw it out of the window.
>=20
> [1]=20
> http://smolt.fedoraproject.org/reports/view_profiles?profile=3DIdeapa=
d+S205&search=3DSubmit+Query
> [2] http://www.manualowl.com/m/Lenovo/IdeaPad-S205/Manual/192357
> [3] http://www.manualowl.com/m/Lenovo/IdeaPad-S205s/Manual/227621
> [4]=20
> http://fedoraproject.org/wiki/Common_F16_bugs#UEFI_install_to_Lenovo_=
Ideapad_S205_fails_to_boot
>=20
>=20
> Best Regards
>=20
> Vaclav Mocek
>=20
>=20

Thanks for your investigation!

I don't want change the dmi config for the already works machine, but
add your S205 "Brazos" to table is ok.=20
Actually, that will be better ideapad-laptop driver can take care this
machine.

If you want, Please kindly try this patch.


Thanks a lot!
Joey Lee

From 02a341b8142f71190c09a1a4fe509922b8f055c4 Mon Sep 17 00:00:00 2001
=46rom: "Lee, Chun-Yi" <jlee@suse.com>
Date: Fri, 16 Mar 2012 12:31:08 +0800
Subject: [PATCH] acer-wmi: add support Lenovo Ideapad S205 Brazos

acer-wmi: add support Lenovo Ideapad S205 Brazos

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 1e5290b..f158956 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -468,6 +468,15 @@ static struct dmi_system_id acer_quirks[] =3D {
 	},
 	{
 		.callback =3D dmi_matched,
+		.ident =3D "Lenovo Ideapad S205",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Brazos"),
+		},
+		.driver_data =3D &quirk_lenovo_ideapad_s205,
+	},
+	{
+		.callback =3D dmi_matched,
 		.ident =3D "Lenovo 3000 N200",
 		.matches =3D {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
--=20
1.7.7
