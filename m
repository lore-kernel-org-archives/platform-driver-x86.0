From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell Vostro V131
Date: Tue,  1 Dec 2015 20:51:34 +0100
Message-ID: <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
References: <20151130211542.GE30553@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151130211542.GE30553@malice.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On some laptop models (e.g. Dell Vostro V131), pressing the Dell Instan=
t
Launch hotkey does not raise an i8042 interrupt - only WMI event 0xe025
is generated.  As there seems to be no ACPI method or SMI call to
determine without possible side effects whether a given machine is
capable of simulating a keypress when this hotkey is pressed, DMI
matching is used to whitelist the models for which an input event shoul=
d
be generated when WMI event 0xe025 is received.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
Changes from v1:

  - Use DMI matching instead of a module parameter
  - Change flag name to improve readability

Darren, I am aware this patch conflicts with Andy's WMI rework series
posted yesterday, so please just let me know if you want me to rebase.

 drivers/platform/x86/dell-wmi.c |   39 +++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 8cb0f57..27c8f49 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -47,6 +47,38 @@ static int acpi_video;
=20
 MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
=20
+struct quirk_entry {
+	bool process_dell_instant_launch;
+};
+
+static struct quirk_entry *quirks;
+
+static struct quirk_entry quirk_unknown =3D {
+};
+
+static struct quirk_entry quirk_dell_vostro_v131 =3D {
+	.process_dell_instant_launch =3D true,
+};
+
+static int __init dmi_matched(const struct dmi_system_id *dmi)
+{
+	quirks =3D dmi->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id dell_wmi_quirks[] __initconst =3D {
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "Dell Vostro V131",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
+		},
+		.driver_data =3D &quirk_dell_vostro_v131,
+	},
+	{ }
+};
+
 /*
  * Certain keys are flagged as KE_IGNORE. All of these are either
  * notifications (rather than requests for change) or are also sent
@@ -87,7 +119,7 @@ static const struct key_entry dell_wmi_legacy_keymap=
[] __initconst =3D {
 	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
=20
 	/* Shortcut and audio panel keys */
-	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
+	{ KE_KEY, 0xe025, { KEY_PROG4 } },
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
=20
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
@@ -183,6 +215,9 @@ static void dell_wmi_process_key(int reported_key)
 	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) && acpi_video)
 		return;
=20
+	if (key->keycode =3D=3D KEY_PROG4 && !quirks->process_dell_instant_la=
unch)
+		return;
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
=20
@@ -432,6 +467,8 @@ static int __init dell_wmi_init(void)
 		return -ENODEV;
 	}
=20
+	quirks =3D &quirk_unknown;
+	dmi_check_system(dell_wmi_quirks);
 	dmi_walk(find_hk_type, NULL);
 	acpi_video =3D acpi_video_get_backlight_type() !=3D acpi_backlight_ve=
ndor;
=20
--=20
1.7.10.4
