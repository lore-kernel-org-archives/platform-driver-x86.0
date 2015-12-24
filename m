From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Thu, 24 Dec 2015 19:46:57 +0100
Message-ID: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35401 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754551AbbLXSr5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Dec 2015 13:47:57 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This patch adds support for controlling keyboard backlight via standard
linux led class interface (::kbd_backlight). It uses ACPI HKEY device w=
ith
MLCG and MLCS methods.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>
---
 drivers/platform/x86/thinkpad_acpi.c |  205 ++++++++++++++++++++++++++=
++++++++
 1 file changed, 205 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
index 0bed473..477afa1 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -303,6 +303,7 @@ static struct {
 	u32 hotkey_mask:1;
 	u32 hotkey_wlsw:1;
 	u32 hotkey_tablet:1;
+	u32 kbdlight:1;
 	u32 light:1;
 	u32 light_status:1;
 	u32 bright_acpimode:1;
@@ -4986,6 +4987,206 @@ static struct ibm_struct video_driver_data =3D =
{
 #endif /* CONFIG_THINKPAD_ACPI_VIDEO */
=20
 /*********************************************************************=
****
+ * Keyboard backlight subdriver
+ */
+
+static int kbdlight_set_level(int level)
+{
+	if (!hkey_handle)
+		return -ENXIO;
+
+	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
+		return -EIO;
+
+	return 0;
+}
+
+static int kbdlight_get_level(void)
+{
+	int status =3D 0;
+
+	if (!hkey_handle)
+		return -ENXIO;
+
+	if (!acpi_evalf(hkey_handle, &status, "MLCG", "dd", 0))
+		return -EIO;
+
+	if (status < 0)
+		return status;
+
+	return status & 0x3;
+}
+
+static bool kbdlight_is_supported(void)
+{
+	int status =3D 0;
+
+	if (!hkey_handle)
+		return false;
+
+	if (!acpi_has_method(hkey_handle, "MLCG")) {
+		vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG is unavailable\n");
+		return false;
+	}
+
+	if (!acpi_evalf(hkey_handle, &status, "MLCG", "qdd", 0)) {
+		vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG failed\n");
+		return false;
+	}
+
+	if (status < 0) {
+		vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG err: %d\n", status);
+		return false;
+	}
+
+	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status)=
;
+	/*
+	 * Guessed test for keyboard backlight:
+	 *
+	 * Machines with backlight keyboard return:
+	 *   b010100000010000000XX - ThinkPad X1 Carbon 3rd
+	 *   b110100010010000000XX - ThinkPad x230
+	 *   b010100000010000000XX - ThinkPad x240
+	 *   b010100000010000000XX - ThinkPad W541
+	 * (XX is current backlight level)
+	 *
+	 * Machines without backlight keyboard return:
+	 *   b10100001000000000000 - ThinkPad x230
+	 *   b10110001000000000000 - ThinkPad E430
+	 *   b00000000000000000000 - ThinkPad E450
+	 *
+	 * Candidate BITs for detection test (XOR):
+	 *   b01000000001000000000
+	 *              ^
+	 */
+	return status & BIT(9);
+}
+
+static void kbdlight_set_worker(struct work_struct *work)
+{
+	struct tpacpi_led_classdev *data =3D
+			container_of(work, struct tpacpi_led_classdev, work);
+
+	if (likely(tpacpi_lifecycle =3D=3D TPACPI_LIFE_RUNNING))
+		kbdlight_set_level(data->new_state);
+}
+
+static void kbdlight_sysfs_set(struct led_classdev *led_cdev,
+			enum led_brightness brightness)
+{
+	struct tpacpi_led_classdev *data =3D
+			container_of(led_cdev,
+				     struct tpacpi_led_classdev,
+				     led_classdev);
+	data->new_state =3D brightness;
+	queue_work(tpacpi_wq, &data->work);
+}
+
+static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led=
_cdev)
+{
+	int level;
+
+	level =3D kbdlight_get_level();
+	if (level < 0)
+		return 0;
+
+	return level;
+}
+
+static struct tpacpi_led_classdev tpacpi_led_kbdlight =3D {
+	.led_classdev =3D {
+		.name		=3D "tpacpi::kbd_backlight",
+		.max_brightness	=3D 2,
+		.brightness_set	=3D &kbdlight_sysfs_set,
+		.brightness_get	=3D &kbdlight_sysfs_get,
+	}
+};
+
+static int __init kbdlight_init(struct ibm_init_struct *iibm)
+{
+	int rc;
+
+	vdbg_printk(TPACPI_DBG_INIT, "initializing kbdlight subdriver\n");
+
+	TPACPI_ACPIHANDLE_INIT(hkey);
+	INIT_WORK(&tpacpi_led_kbdlight.work, kbdlight_set_worker);
+
+	if (!kbdlight_is_supported()) {
+		tp_features.kbdlight =3D 0;
+		vdbg_printk(TPACPI_DBG_INIT, "kbdlight is unsupported\n");
+		return 1;
+	}
+
+	tp_features.kbdlight =3D 1;
+
+	rc =3D led_classdev_register(&tpacpi_pdev->dev,
+				   &tpacpi_led_kbdlight.led_classdev);
+	if (rc < 0) {
+		tp_features.kbdlight =3D 0;
+		return rc;
+	}
+
+	return 0;
+}
+
+static void kbdlight_exit(void)
+{
+	if (tp_features.kbdlight)
+		led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
+	flush_workqueue(tpacpi_wq);
+}
+
+static int kbdlight_read(struct seq_file *m)
+{
+	int level;
+
+	if (!tp_features.kbdlight) {
+		seq_printf(m, "status:\t\tnot supported\n");
+	} else {
+		level =3D kbdlight_get_level();
+		if (level < 0)
+			seq_printf(m, "status:\t\terror %d\n", level);
+		else
+			seq_printf(m, "status:\t\t%d\n", level);
+		seq_printf(m, "commands:\t0, 1, 2\n");
+	}
+
+	return 0;
+}
+
+static int kbdlight_write(char *buf)
+{
+	char *cmd;
+	int level =3D -1;
+
+	if (!tp_features.kbdlight)
+		return -ENODEV;
+
+	while ((cmd =3D next_cmd(&buf))) {
+		if (strlencmp(cmd, "0") =3D=3D 0)
+			level =3D 0;
+		else if (strlencmp(cmd, "1") =3D=3D 0)
+			level =3D 1;
+		else if (strlencmp(cmd, "2") =3D=3D 0)
+			level =3D 2;
+		else
+			return -EINVAL;
+	}
+
+	if (level =3D=3D -1)
+		return -EINVAL;
+
+	return kbdlight_set_level(level);
+}
+
+static struct ibm_struct kbdlight_driver_data =3D {
+	.name =3D "kbdlight",
+	.read =3D kbdlight_read,
+	.write =3D kbdlight_write,
+	.exit =3D kbdlight_exit,
+};
+
+/*********************************************************************=
****
  * Light (thinklight) subdriver
  */
=20
@@ -9207,6 +9408,10 @@ static struct ibm_init_struct ibms_init[] __init=
data =3D {
 	},
 #endif
 	{
+		.init =3D kbdlight_init,
+		.data =3D &kbdlight_driver_data,
+	},
+	{
 		.init =3D light_init,
 		.data =3D &light_driver_data,
 	},
--=20
1.7.9.5
