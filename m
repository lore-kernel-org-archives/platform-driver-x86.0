From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the MP-man MPWIN895CL tablet
Date: Wed,  1 Apr 2020 10:03:48 +0200
Message-ID: <20200401080348.5128-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add touchscreen info for the MP-man MPWIN895CL tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x8=
6/touchscreen_dmi.c
index 6ec8923dec1a..931814e62454 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -373,6 +373,23 @@ static const struct ts_dmi_data jumper_ezpad_mini3_d=
ata =3D {
 	.properties	=3D jumper_ezpad_mini3_props,
 };
=20
+static const struct property_entry mpman_mpwin895cl_props[] =3D {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 3),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1150),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-mpman-mpwin895cl.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data mpman_mpwin895cl_data =3D {
+	.acpi_name	=3D "MSSL1680:00",
+	.properties	=3D mpman_mpwin895cl_props,
+};
+
 static const struct property_entry myria_my8307_props[] =3D {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1720),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -908,6 +925,14 @@ const struct dmi_system_id touchscreen_dmi_table[] =3D=
 {
 			DMI_MATCH(DMI_PRODUCT_NAME, "FlexBook edge11 - M-FBE11"),
 		},
 	},
+	{
+		/* MP Man MPWIN895CL */
+		.driver_data =3D (void *)&mpman_mpwin895cl_data,
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "MPMAN"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MPWIN8900CL"),
+		},
+	},
 	{
 		/* Myria MY8307 */
 		.driver_data =3D (void *)&myria_my8307_data,
--=20
2.26.0
