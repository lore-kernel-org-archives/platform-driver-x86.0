From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/5] platform/x86: intel-vbtn: Do not advertise switches to userspace if they are not there
Date: Sat,  2 May 2020 20:29:49 +0200
Message-ID: <20200502182951.114231-4-hdegoede@redhat.com>
References: <20200502182951.114231-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200502182951.114231-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
switch on 2-in-1's") added a DMI chassis-type check to avoid accidentally
reporting SW_TABLET_MODE =3D 1 to userspace on laptops (specifically on t=
he
Dell XPS 9360), to avoid e.g. userspace ignoring touchpad events because
userspace thought the device was in tablet-mode.

But if we are not getting the initial status of the switch because the
device does not have a tablet mode, then we really should not advertise
the presence of a tablet-mode switch to userspace at all, as userspace ma=
y
use the mere presence of this switch for certain heuristics.

Fixes: de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode=
 switch on 2-in-1's")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
index 634096cef21a..500fae82e12c 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -55,6 +55,7 @@ static const struct key_entry intel_vbtn_switchmap[] =3D=
 {
 struct intel_vbtn_priv {
 	struct key_entry keymap[KEYMAP_LEN];
 	struct input_dev *input_dev;
+	bool has_switches;
 	bool wakeup_mode;
 };
=20
@@ -70,7 +71,7 @@ static int intel_vbtn_input_setup(struct platform_devic=
e *device)
 		keymap_len +=3D ARRAY_SIZE(intel_vbtn_keymap);
 	}
=20
-	if (true) {
+	if (priv->has_switches) {
 		memcpy(&priv->keymap[keymap_len], intel_vbtn_switchmap,
 		       ARRAY_SIZE(intel_vbtn_switchmap) *
 		       sizeof(struct key_entry));
@@ -138,16 +139,12 @@ static void notify_handler(acpi_handle handle, u32 =
event, void *context)
=20
 static void detect_tablet_mode(struct platform_device *device)
 {
-	const char *chassis_type =3D dmi_get_system_info(DMI_CHASSIS_TYPE);
 	struct intel_vbtn_priv *priv =3D dev_get_drvdata(&device->dev);
 	acpi_handle handle =3D ACPI_HANDLE(&device->dev);
 	unsigned long long vgbs;
 	acpi_status status;
 	int m;
=20
-	if (!(chassis_type && strcmp(chassis_type, "31") =3D=3D 0))
-		return;
-
 	status =3D acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
 	if (ACPI_FAILURE(status))
 		return;
@@ -158,6 +155,19 @@ static void detect_tablet_mode(struct platform_devic=
e *device)
 	input_report_switch(priv->input_dev, SW_DOCK, m);
 }
=20
+static bool intel_vbtn_has_switches(acpi_handle handle)
+{
+	const char *chassis_type =3D dmi_get_system_info(DMI_CHASSIS_TYPE);
+	unsigned long long vgbs;
+	acpi_status status;
+
+	if (!(chassis_type && strcmp(chassis_type, "31") =3D=3D 0))
+		return false;
+
+	status =3D acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
+	return ACPI_SUCCESS(status);
+}
+
 static int intel_vbtn_probe(struct platform_device *device)
 {
 	acpi_handle handle =3D ACPI_HANDLE(&device->dev);
@@ -176,13 +186,16 @@ static int intel_vbtn_probe(struct platform_device =
*device)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
=20
+	priv->has_switches =3D intel_vbtn_has_switches(handle);
+
 	err =3D intel_vbtn_input_setup(device);
 	if (err) {
 		pr_err("Failed to setup Intel Virtual Button\n");
 		return err;
 	}
=20
-	detect_tablet_mode(device);
+	if (priv->has_switches)
+		detect_tablet_mode(device);
=20
 	status =3D acpi_install_notify_handler(handle,
 					     ACPI_DEVICE_NOTIFY,
--=20
2.26.0
