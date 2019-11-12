From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the ezpad 6 m4 tablet
Date: Tue, 12 Nov 2019 15:17:11 +0100
Message-ID: <20191112141711.26220-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, youling257 <youling257@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen info for the Jumper EZpad 6 m4 tablet.

Reported-and-tested-by: youling257 <youling257@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/=
touchscreen_dmi.c
index ba494ace83d4..4a09b479cda5 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -343,6 +343,22 @@ static const struct ts_dmi_data jumper_ezpad_6_pro_b_d=
ata =3D {
 =09.properties     =3D jumper_ezpad_6_pro_b_props,
 };
=20
+static const struct property_entry jumper_ezpad_6_m4_props[] =3D {
+=09PROPERTY_ENTRY_U32("touchscreen-min-x", 35),
+=09PROPERTY_ENTRY_U32("touchscreen-min-y", 15),
+=09PROPERTY_ENTRY_U32("touchscreen-size-x", 1950),
+=09PROPERTY_ENTRY_U32("touchscreen-size-y", 1525),
+=09PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-jumper-ezpad-6-m4.fw"),
+=09PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+=09PROPERTY_ENTRY_BOOL("silead,home-button"),
+=09{ }
+};
+
+static const struct ts_dmi_data jumper_ezpad_6_m4_data =3D {
+=09.acpi_name=09=3D "MSSL1680:00",
+=09.properties=09=3D jumper_ezpad_6_m4_props,
+};
+
 static const struct property_entry jumper_ezpad_mini3_props[] =3D {
 =09PROPERTY_ENTRY_U32("touchscreen-min-x", 23),
 =09PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
@@ -866,6 +882,16 @@ const struct dmi_system_id touchscreen_dmi_table[] =3D=
 {
 =09=09=09DMI_MATCH(DMI_BIOS_DATE, "04/24/2018"),
 =09=09},
 =09},
+=09{
+=09=09/* Jumper EZpad 6 m4 */
+=09=09.driver_data =3D (void *)&jumper_ezpad_6_m4_data,
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "jumper"),
+=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "EZpad"),
+=09=09=09/* Jumper8.S106x.A00C.1066 with the version dropped */
+=09=09=09DMI_MATCH(DMI_BIOS_VERSION, "Jumper8.S106x"),
+=09=09},
+=09},
 =09{
 =09=09/* Jumper EZpad mini3 */
 =09=09.driver_data =3D (void *)&jumper_ezpad_mini3_data,
--=20
2.23.0
