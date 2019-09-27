From: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Subject: [PATCH v3] platform/x86: dell-laptop: disable kbd backlight on Inspiron 10xx
Date: Fri, 27 Sep 2019 23:19:03 +0200
Message-ID: <156961914387.417.14261217089484891942@WARFSTATION>
References: <20190925082149.yjhmmb64i4h6sddi@pali> <156940489220.8635.14349142383780268583@WARFSTATION> <CAHp75VfkL3QGXYjeEEqr75SWCKo1SDEqS9q3YEQWYM4iXbUzcg@mail.gmail.com> <20190926081146.f4f26kun7ekwqsgj@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926081146.f4f26kun7ekwqsgj@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali Rohar <pali.rohar@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

This patch adds a quirk disabling keyboard backlight support for the
Dell Inspiron 1012 and 1018.

Those models wrongly report supporting keyboard backlight control
features (through SMBIOS tokens) even though they're not equipped with
a backlit keyboard. This led to broken controls being exposed
through sysfs by this driver which froze the system when used.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D107651
Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
---
 drivers/platform/x86/dell-laptop.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell=
-laptop.c
index d27be2836bc2..74e988f839e8 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -33,6 +33,7 @@
=20
 struct quirk_entry {
 	bool touchpad_led;
+	bool kbd_led_not_present;
 	bool kbd_led_levels_off_1;
 	bool kbd_missing_ac_tag;
=20
@@ -73,6 +74,10 @@ static struct quirk_entry quirk_dell_latitude_e6410 =3D {
 	.kbd_led_levels_off_1 =3D true,
 };
=20
+static struct quirk_entry quirk_dell_inspiron_1012 =3D {
+	.kbd_led_not_present =3D true,
+};
+
 static struct platform_driver platform_driver =3D {
 	.driver =3D {
 		.name =3D "dell-laptop",
@@ -310,6 +315,24 @@ static const struct dmi_system_id dell_quirks[] __init=
const =3D {
 		},
 		.driver_data =3D &quirk_dell_latitude_e6410,
 	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "Dell Inspiron 1012",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
+		},
+		.driver_data =3D &quirk_dell_inspiron_1012,
+	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "Dell Inspiron 1018",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1018"),
+		},
+		.driver_data =3D &quirk_dell_inspiron_1012,
+	},
 	{ }
 };
=20
@@ -1493,6 +1516,9 @@ static void kbd_init(void)
 {
 	int ret;
=20
+	if (quirks && quirks->kbd_led_not_present)
+		return;
+
 	ret =3D kbd_init_info();
 	kbd_init_tokens();
=20
--=20
2.19.2
