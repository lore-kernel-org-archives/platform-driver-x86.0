From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the PiPO W11 tablet
Date: Fri,  3 Jan 2020 16:00:59 +0100
Message-ID: <20200103150059.14762-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Josten <timjosten@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Tim Josten <timjosten@gmail.com>

Add touchscreen info for the PiPO W11 tablet.

Signed-off-by: Tim Josten <timjosten@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x8=
6/touchscreen_dmi.c
index 4a09b479cda5..3c9d913b71b3 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -511,6 +511,23 @@ static const struct ts_dmi_data pipo_w2s_data =3D {
 	.properties	=3D pipo_w2s_props,
 };
=20
+static const struct property_entry pipo_w11_props[] =3D {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 15),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1984),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1532),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl1680-pipo-w11.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data pipo_w11_data =3D {
+	.acpi_name	=3D "MSSL1680:00",
+	.properties	=3D pipo_w11_props,
+};
+
 static const struct property_entry pov_mobii_wintab_p800w_v20_props[] =3D=
 {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 32),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
@@ -969,6 +986,17 @@ const struct dmi_system_id touchscreen_dmi_table[] =3D=
 {
 			DMI_MATCH(DMI_PRODUCT_NAME, "W2S"),
 		},
 	},
+	{
+		/* Pipo W11 */
+		.driver_data =3D (void *)&pipo_w11_data,
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "PIPO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
+			/* Above matches are too generic, add bios-ver match */
+			DMI_MATCH(DMI_BIOS_VERSION,
+				  "JS-BI-10.6-SF133GR300-GA55B-024-F"),
+		},
+	},
 	{
 		/* Ployer Momo7w (same hardware as the Trekstor ST70416-6) */
 		.driver_data =3D (void *)&trekstor_surftab_wintron70_data,
--=20
2.23.0
