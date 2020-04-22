From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: asus-nb-wmi: Do not load on Asus T100TA and T200TA
Date: Thu, 23 Apr 2020 00:05:59 +0200
Message-ID: <20200422220559.99726-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

asus-nb-wmi does not add any extra functionality on these Asus
Transformer books. They have detachable keyboards, so the hotkeys are
send through a HID device (and handled by the hid-asus driver) and also
the rfkill functionality is not used on these devices.

Besides not adding any extra functionality, initializing the WMI interfac=
e
on these devices actually has a negative side-effect. For some reason
the \_SB.ATKD.INIT() function which asus_wmi_platform_init() calls drives
GPO2 (INT33FC:02) pin 8, which is connected to the front facing webcam LE=
D,
high and there is no (WMI or other) interface to drive this low again
causing the LED to be permanently on, even during suspend.

This commit adds a blacklist of DMI system_ids on which not to load the
asus-nb-wmi and adds these Transformer books to this list. This fixes
the webcam LED being permanently on under Linux.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/as=
us-nb-wmi.c
index 6f12747a359a..c4404d9c1de4 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -515,9 +515,33 @@ static struct asus_wmi_driver asus_nb_wmi_driver =3D=
 {
 	.detect_quirks =3D asus_nb_wmi_quirks,
 };
=20
+static const struct dmi_system_id asus_nb_wmi_blacklist[] __initconst =3D=
 {
+	{
+		/*
+		 * asus-nb-wm adds no functionality. The T100TA has a detachable
+		 * USB kbd, so no hotkeys and it has no WMI rfkill; and loading
+		 * asus-nb-wm causes the camera LED to turn and _stay_ on.
+		 */
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
+		},
+	},
+	{
+		/* The Asus T200TA has the same issue as the T100TA */
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T200TA"),
+		},
+	},
+	{} /* Terminating entry */
+};
=20
 static int __init asus_nb_wmi_init(void)
 {
+	if (dmi_check_system(asus_nb_wmi_blacklist))
+		return -ENODEV;
+
 	return asus_wmi_register_driver(&asus_nb_wmi_driver);
 }
=20
--=20
2.26.0
