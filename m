From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 17 Jun 2011 18:38:12 -0600
Message-ID: <4DFC8014020000230002E662@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
 <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
 <4DE74CEF.3020608@flanto.de>
 <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
 <4DE8D876.7060304@flanto.de>
 <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
 <4DF08626.3050802@canonical.com>
 <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
 <4DF87EA2.3050204@flanto.de>
 <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com>
 <4DFB6CDE.4020003@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:33458 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753258Ab1FRAiV (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Fri, 17 Jun 2011 20:38:21 -0400
In-Reply-To: <4DFB6CDE.4020003@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=94=EF=BC=8C2011-06-17 =E6=96=BC 17:03 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 17.06.2011 15:09, Joey Lee wrote:
> > Could you pleas share the dmidecode information to me? just need:=20
> > 	dmidecode > dmidecode.log
> >=20
>=20
> No problem, see attachment.
>=20
> > I want to generate a acer-wmi patch to test AMW0 method on your mac=
hine.
> >=20
> > For IdeaPad S205, this case is too special for acer machines, I sti=
ll
> > thought that will be better support it in ideapad-laptop. But, we c=
an
> > test on acer-wmi first.
>=20
> To me it seems logical to solve the problem in ideapad-laptop and not=
 in
> acer-wmi as the laptop is obviously of ideapad type :)
> I will be happily testing patches to solve the issue.
>=20

Could you please help to test this patch? This is just a test patch, an=
d
I didn't evaluation AWM0 in update rfkill state polling because I didn'=
t
think evaluate AWM0 per second is a good idea.

Please probe acer-wmi driver then report rfkill state. That's see what
the situation, then we add AWM0 part in next patch.

PS:
Sorry for I didn't compiler and test this patch because I didn't take
acer netbook back to home.


Thank's
Joey Lee


From 0e0602a099775fafa21b3428d50bcca2be58c3fb Mon Sep 17 00:00:00 2001
=46rom: Lee, Chun-Yi <jlee@novell.com>
Date: Sat, 18 Jun 2011 08:32:03 +0800
Subject: [PATCH] acer-wmi: support Lenovo S205

Just for testing. I didn't evaluate AMW0 in polling.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |   30 ++++++++++++++++++++++++++++--
 1 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 005417b..424b83e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -304,6 +304,10 @@ static struct quirk_entry quirk_fujitsu_amilo_li_1=
718 =3D {
 	.wireless =3D 2,
 };
=20
+static struct quirk_entry quirk_lenovo_ideapad_s205 =3D {
+	.wireless =3D 3,
+};
+
 /* The Aspire One has a dummy ACPI-WMI interface - disable it */
 static struct dmi_system_id __devinitdata acer_blacklist[] =3D {
 	{
@@ -450,6 +454,15 @@ static struct dmi_system_id acer_quirks[] =3D {
 		},
 		.driver_data =3D &quirk_medion_md_98300,
 	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "Lenovo Ideapad S205",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
+		},
+		.driver_data =3D &quirk_lenovo_ideapad_s205,
+	},
 	{}
 };
=20
@@ -542,6 +555,12 @@ struct wmi_interface *iface)
 				return AE_ERROR;
 			*value =3D result & 0x1;
 			return AE_OK;
+		case 3:
+			err =3D ec_read(0x78, &result);
+			if (err)
+				return AE_ERROR;
+			*value =3D result & 0x1;
+			return AE_OK;
 		default:
 			err =3D ec_read(0xA, &result);
 			if (err)
@@ -1266,8 +1285,15 @@ static void acer_rfkill_update(struct work_struc=
t *ignored)
 	acpi_status status;
=20
 	status =3D get_u32(&state, ACER_CAP_WIRELESS);
-	if (ACPI_SUCCESS(status))
-		rfkill_set_sw_state(wireless_rfkill, !state);
+	if (ACPI_SUCCESS(status)) {
+		if (quirks->wireless =3D=3D 3) {
+			pr_info("acer_rfkill_update state: %d", state);
+			rfkill_set_hw_state(wireless_rfkill, !state);
+			/* TODO: set AWM0? */
+		} else {
+			rfkill_set_sw_state(wireless_rfkill, !state);
+		}
+	}
=20
 	if (has_cap(ACER_CAP_BLUETOOTH)) {
 		status =3D get_u32(&state, ACER_CAP_BLUETOOTH);
--=20
1.6.0.2
