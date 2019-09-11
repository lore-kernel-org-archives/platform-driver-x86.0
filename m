From: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Subject: [PATCH v2] platform/x86: dell-laptop: fix broken kbd backlight on Inspiron 10xx
Date: Thu, 12 Sep 2019 00:07:45 +0200
Message-ID: <156940489220.8635.14349142383780268583@WARFSTATION>
References: <20190925082149.yjhmmb64i4h6sddi@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925082149.yjhmmb64i4h6sddi@pali>
Date: Wed, 25 Sep 2019 11:48:12 +0200
Sender: linux-kernel-owner@vger.kernel.org
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
index d27be2836bc2..ffe5abbdadda 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -33,6 +33,7 @@
=20
 struct quirk_entry {
 	bool touchpad_led;
+	bool kbd_broken_backlight;
 	bool kbd_led_levels_off_1;
 	bool kbd_missing_ac_tag;
=20
@@ -73,6 +74,10 @@ static struct quirk_entry quirk_dell_latitude_e6410 =3D {
 	.kbd_led_levels_off_1 =3D true,
 };
=20
+static struct quirk_entry quirk_dell_inspiron_1012 =3D {
+	.kbd_broken_backlight =3D true,
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
@@ -2040,6 +2063,9 @@ static int __init kbd_led_init(struct device *dev)
 {
 	int ret;
=20
+	if (quirks && quirks->kbd_broken_backlight)
+		return -ENODEV;
+
 	kbd_init();
 	if (!kbd_led_present)
 		return -ENODEV;
--=20
2.19.2
