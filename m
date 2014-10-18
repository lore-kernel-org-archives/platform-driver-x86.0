From: Giedrius Statkevicius <giedriuswork@gmail.com>
Subject: [PATCH RFC] platform: hp_accel: add a i8042 filter to remove accelerometer data
Date: Sat, 18 Oct 2014 23:59:22 +0300
Message-ID: <1413665962-3830-1-git-send-email-giedriuswork@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:56622 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751483AbaJRU7u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 18 Oct 2014 16:59:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: eric.piel@tremplin-utc.net
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,
this patch fixes bug #84941 from the kernel bugzilla. Basically, it
seems that the accelerometer sends some signals as button presses
through the keyboard bus. The keys in the report are 0xa5-0xa8 but in
the filter function they are reported as 0x25-0x28. This patch adds a
i8042 filter that removes these scancodes from the keyboard stream in a
similar fashion to how idealpad_sidebar.c does this. I've done a RFC
because I'm not sure if there is more portable way to do this and if
these codes are the same for all machines. So could please someone
respond who uses this driver and tell which invalid keypresses appear
(if they do) in your `dmesg` that are reported by atkbd?

Also, I'm not sure if there is a publicly available documentation for h=
p
3d driveguard (I couldn't find it). That would definetly make it clear
if this patch is correct or not.

Adding a signed off by line incase you find this patch good and want to
apply it.

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
---
 drivers/platform/x86/hp_accel.c | 42 +++++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_=
accel.c
index 13e14ec..b1bea8c 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -38,6 +38,8 @@
 #include <linux/atomic.h>
 #include <linux/acpi.h>
 #include "../../misc/lis3lv02d/lis3lv02d.h"
+#include <linux/i8042.h>
+#include <linux/serio.h>
=20
 #define DRIVER_NAME     "hp_accel"
 #define ACPI_MDPS_CLASS "accelerometer"
@@ -73,6 +75,13 @@ static inline void delayed_sysfs_set(struct led_clas=
sdev *led_cdev,
=20
 /* HP-specific accelerometer driver ----------------------------------=
-- */
=20
+/* Codes of signals that the accelerometer sends
+ * through the keyboard bus */
+#define ACCEL_1 0x25
+#define ACCEL_2 0x26
+#define ACCEL_3 0x27
+#define ACCEL_4 0x28
+
 /* For automatic insertion of the module */
 static const struct acpi_device_id lis3lv02d_device_ids[] =3D {
 	{"HPQ0004", 0}, /* HP Mobile Data Protection System PNP */
@@ -82,7 +91,6 @@ static const struct acpi_device_id lis3lv02d_device_i=
ds[] =3D {
 };
 MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
=20
-
 /**
  * lis3lv02d_acpi_init - ACPI _INI method: initialize the device.
  * @lis3: pointer to the device struct
@@ -294,6 +302,32 @@ static void lis3lv02d_enum_resources(struct acpi_d=
evice *device)
 		printk(KERN_DEBUG DRIVER_NAME ": Error getting resources\n");
 }
=20
+static bool hp_accel_i8042_filter(unsigned char data, unsigned char st=
r,
+				  struct serio *port)
+{
+	static bool extended;
+
+	if (str & I8042_STR_AUXDATA)
+		return false;
+
+	if (data =3D=3D 0xe0) {
+		extended =3D true;
+		return true;
+	}
+
+	if (!extended)
+		return false;
+
+	extended =3D false;
+	if (likely(data !=3D ACCEL_1) && likely(data !=3D ACCEL_2) &&
+	    likely(data !=3D ACCEL_3) && likely(data !=3D ACCEL_4)) {
+		serio_interrupt(port, 0xe0, 0);
+		return false;
+	}
+
+	return true;
+}
+
 static int lis3lv02d_add(struct acpi_device *device)
 {
 	int ret;
@@ -326,6 +360,11 @@ static int lis3lv02d_add(struct acpi_device *devic=
e)
 	if (ret)
 		return ret;
=20
+	/* filter to remove accelerometer data from keyboard bus stream */
+	ret =3D i8042_install_filter(hp_accel_i8042_filter);
+	if (ret)
+		i8042_remove_filter(hp_accel_i8042_filter);
+
 	INIT_WORK(&hpled_led.work, delayed_set_status_worker);
 	ret =3D led_classdev_register(NULL, &hpled_led.led_classdev);
 	if (ret) {
@@ -343,6 +382,7 @@ static int lis3lv02d_remove(struct acpi_device *dev=
ice)
 	if (!device)
 		return -EINVAL;
=20
+	i8042_remove_filter(hp_accel_i8042_filter);
 	lis3lv02d_joystick_disable(&lis3_dev);
 	lis3lv02d_poweroff(&lis3_dev);
=20
--=20
2.1.2
