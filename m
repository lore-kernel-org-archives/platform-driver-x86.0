From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 5/5] platform/x86: intel-vbtn: Fix probe failure on devices with only switches
Date: Sat,  2 May 2020 20:29:51 +0200
Message-ID: <20200502182951.114231-6-hdegoede@redhat.com>
References: <20200502182951.114231-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200502182951.114231-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On some devices the INT33D6 vbtn device is only used to report
tablet-mode / docked status (switches) and there are no vbtn managed
buttons.

On these devices there is no VBDL object.

Move the VBDL check to a intel_vbtn_has_buttons() helper and only exit
from intel_vbtn_probe() with -ENODEV when there are both no buttons and
no switches. Also only report the buttons being present to userspace if
the has_buttons check has succeeded.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
index 4921fc15dc6c..4efc70b693a7 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -55,6 +55,7 @@ static const struct key_entry intel_vbtn_switchmap[] =3D=
 {
 struct intel_vbtn_priv {
 	struct key_entry keymap[KEYMAP_LEN];
 	struct input_dev *input_dev;
+	bool has_buttons;
 	bool has_switches;
 	bool wakeup_mode;
 };
@@ -64,7 +65,7 @@ static int intel_vbtn_input_setup(struct platform_devic=
e *device)
 	struct intel_vbtn_priv *priv =3D dev_get_drvdata(&device->dev);
 	int ret, keymap_len =3D 0;
=20
-	if (true) {
+	if (priv->has_buttons) {
 		memcpy(&priv->keymap[keymap_len], intel_vbtn_keymap,
 		       ARRAY_SIZE(intel_vbtn_keymap) *
 		       sizeof(struct key_entry));
@@ -155,6 +156,14 @@ static void detect_tablet_mode(struct platform_devic=
e *device)
 	input_report_switch(priv->input_dev, SW_DOCK, m);
 }
=20
+static bool intel_vbtn_has_buttons(acpi_handle handle)
+{
+	acpi_status status;
+
+	status =3D acpi_evaluate_object(handle, "VBDL", NULL, NULL);
+	return ACPI_SUCCESS(status);
+}
+
 static bool intel_vbtn_has_switches(acpi_handle handle)
 {
 	const char *chassis_type =3D dmi_get_system_info(DMI_CHASSIS_TYPE);
@@ -181,12 +190,15 @@ static bool intel_vbtn_has_switches(acpi_handle han=
dle)
 static int intel_vbtn_probe(struct platform_device *device)
 {
 	acpi_handle handle =3D ACPI_HANDLE(&device->dev);
+	bool has_buttons, has_switches;
 	struct intel_vbtn_priv *priv;
 	acpi_status status;
 	int err;
=20
-	status =3D acpi_evaluate_object(handle, "VBDL", NULL, NULL);
-	if (ACPI_FAILURE(status)) {
+	has_buttons =3D intel_vbtn_has_buttons(handle);
+	has_switches =3D intel_vbtn_has_switches(handle);
+
+	if (!has_buttons && !has_switches) {
 		dev_warn(&device->dev, "failed to read Intel Virtual Button driver\n")=
;
 		return -ENODEV;
 	}
@@ -196,7 +208,8 @@ static int intel_vbtn_probe(struct platform_device *d=
evice)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
=20
-	priv->has_switches =3D intel_vbtn_has_switches(handle);
+	priv->has_buttons =3D has_buttons;
+	priv->has_switches =3D has_switches;
=20
 	err =3D intel_vbtn_input_setup(device);
 	if (err) {
--=20
2.26.0
