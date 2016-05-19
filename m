From: Marco Trevisan <mail@3v1n0.net>
Subject: [PATCH] thinkpad_acpi: save kbdlight state on suspend and restore it on resume
Date: Thu, 19 May 2016 03:23:02 +0200
Message-ID: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36547 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751906AbcESBXR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 May 2016 21:23:17 -0400
Received: by mail-wm0-f66.google.com with SMTP id w143so17026281wmw.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 May 2016 18:23:17 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>

=46rom: Marco Trevisan (Trevi=C3=B1o) <mail@3v1n0.net>

Override default LED class suspend/resume handles, by keeping track of
the brightness level before suspending so that it can be automatically
restored on resume by calling default resume handler.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c | 43 ++++++++++++++++++++++++++++=
+++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
index 1f9783c..10111c2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5041,6 +5041,8 @@ static int kbdlight_set_level(int level)
 	return 0;
 }
=20
+static int kbdlight_set_level_and_update(int level);
+
 static int kbdlight_get_level(void)
 {
 	int status =3D 0;
@@ -5108,7 +5110,7 @@ static void kbdlight_set_worker(struct work_struc=
t *work)
 			container_of(work, struct tpacpi_led_classdev, work);
=20
 	if (likely(tpacpi_lifecycle =3D=3D TPACPI_LIFE_RUNNING))
-		kbdlight_set_level(data->new_state);
+		kbdlight_set_level_and_update(data->new_state);
 }
=20
 static void kbdlight_sysfs_set(struct led_classdev *led_cdev,
@@ -5139,7 +5141,6 @@ static struct tpacpi_led_classdev tpacpi_led_kbdl=
ight =3D {
 		.max_brightness	=3D 2,
 		.brightness_set	=3D &kbdlight_sysfs_set,
 		.brightness_get	=3D &kbdlight_sysfs_get,
-		.flags		=3D LED_CORE_SUSPENDRESUME,
 	}
 };
=20
@@ -5177,6 +5178,20 @@ static void kbdlight_exit(void)
 	flush_workqueue(tpacpi_wq);
 }
=20
+static int kbdlight_set_level_and_update(int level)
+{
+	int ret;
+	struct led_classdev *led_cdev;
+
+	ret =3D kbdlight_set_level(level);
+	led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
+
+	if (ret =3D=3D 0 && !(led_cdev->flags & LED_SUSPENDED))
+		led_cdev->brightness =3D level;
+
+	return ret;
+}
+
 static int kbdlight_read(struct seq_file *m)
 {
 	int level;
@@ -5217,13 +5232,35 @@ static int kbdlight_write(char *buf)
 	if (level =3D=3D -1)
 		return -EINVAL;
=20
-	return kbdlight_set_level(level);
+	return kbdlight_set_level_and_update(level);
+}
+
+static void kbdlight_suspend(void)
+{
+	struct led_classdev *led_cdev;
+
+	if (!tp_features.kbdlight)
+		return;
+
+	led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
+	led_update_brightness(led_cdev);
+	led_classdev_suspend(led_cdev);
+}
+
+static void kbdlight_resume(void)
+{
+	if (!tp_features.kbdlight)
+		return;
+
+	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
=20
 static struct ibm_struct kbdlight_driver_data =3D {
 	.name =3D "kbdlight",
 	.read =3D kbdlight_read,
 	.write =3D kbdlight_write,
+	.suspend =3D kbdlight_suspend,
+	.resume =3D kbdlight_resume,
 	.exit =3D kbdlight_exit,
 };
=20
--=20
1.9.1
