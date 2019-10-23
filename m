From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH resend] Add touchscreen platform data for the Schneider SCT101CTM tablet
Date: Wed, 23 Oct 2019 20:53:23 +0200
Message-ID: <20191023185323.13552-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Gorbea Ainz <danielgorbea@hotmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Daniel Gorbea Ainz <danielgorbea@hotmail.com>

Add touchscreen platform data for the Schneider SCT101CTM tablet

Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
hdegoede: Resend from my email address as vger.kernel.org does not like
Daniel's emails
---
 drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/=
touchscreen_dmi.c
index 8bfef880e216..ba494ace83d4 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -549,6 +549,24 @@ static const struct ts_dmi_data pov_mobii_wintab_p1006=
w_v10_data =3D {
 =09.properties=09=3D pov_mobii_wintab_p1006w_v10_props,
 };
=20
+static const struct property_entry schneider_sct101ctm_props[] =3D {
+=09PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
+=09PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+=09PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+=09PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+=09PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+=09PROPERTY_ENTRY_STRING("firmware-name",
+=09=09=09      "gsl1680-schneider-sct101ctm.fw"),
+=09PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+=09PROPERTY_ENTRY_BOOL("silead,home-button"),
+=09{ }
+};
+
+static const struct ts_dmi_data schneider_sct101ctm_data =3D {
+=09.acpi_name=09=3D "MSSL1680:00",
+=09.properties=09=3D schneider_sct101ctm_props,
+};
+
 static const struct property_entry teclast_x3_plus_props[] =3D {
 =09PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 =09PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
@@ -968,6 +986,14 @@ const struct dmi_system_id touchscreen_dmi_table[] =3D=
 {
 =09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
 =09=09},
 =09},
+=09{
+=09=09/* Schneider SCT101CTM */
+=09=09.driver_data =3D (void *)&schneider_sct101ctm_data,
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
+=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
+=09=09},
+=09},
 =09{
 =09=09/* Teclast X3 Plus */
 =09=09.driver_data =3D (void *)&teclast_x3_plus_data,
--=20
2.23.0
