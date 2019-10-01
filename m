From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] platform/x86: asus-laptop: switch to using polled mode of
 input devices
Date: Tue, 1 Oct 2019 11:57:00 -0700
Message-ID: <20191001185700.GA46611@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, acpi4asus-user@lists.sourceforge.net
List-Id: platform-driver-x86.vger.kernel.org

We have added polled mode to the normal input devices with the intent of
retiring input_polled_dev. This converts Asus laptop driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Also removed no longed needed set_bit(EV_ABS, ...) as
input_set_abs_oarams() does it for us.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: removed input-polldev.h include

 drivers/platform/x86/Kconfig       |  1 -
 drivers/platform/x86/asus-laptop.c | 71 +++++++++++++++---------------
 2 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1b67bb578f9f..f0a93f630455 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -94,7 +94,6 @@ config ASUS_LAPTOP
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	select INPUT_SPARSEKMAP
-	select INPUT_POLLDEV
 	---help---
 	  This is a driver for Asus laptops, Lenovo SL and the Pegatron
 	  Lucid tablet. It may also support some MEDION, JVC or VICTOR
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 472af7edf0af..fc6446209854 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -34,7 +34,6 @@
 #include <linux/uaccess.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
-#include <linux/input-polldev.h>
 #include <linux/rfkill.h>
 #include <linux/slab.h>
 #include <linux/dmi.h>
@@ -244,7 +243,7 @@ struct asus_laptop {
 
 	struct input_dev *inputdev;
 	struct key_entry *keymap;
-	struct input_polled_dev *pega_accel_poll;
+	struct input_dev *pega_accel_poll;
 
 	struct asus_led wled;
 	struct asus_led bled;
@@ -446,9 +445,9 @@ static int pega_acc_axis(struct asus_laptop *asus, int curr, char *method)
 	return clamp_val((short)val, -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP);
 }
 
-static void pega_accel_poll(struct input_polled_dev *ipd)
+static void pega_accel_poll(struct input_dev *input)
 {
-	struct device *parent = ipd->input->dev.parent;
+	struct device *parent = input->dev.parent;
 	struct asus_laptop *asus = dev_get_drvdata(parent);
 
 	/* In some cases, the very first call to poll causes a
@@ -457,10 +456,10 @@ static void pega_accel_poll(struct input_polled_dev *ipd)
 	 * device, and perhaps a firmware bug. Fake the first report. */
 	if (!asus->pega_acc_live) {
 		asus->pega_acc_live = true;
-		input_report_abs(ipd->input, ABS_X, 0);
-		input_report_abs(ipd->input, ABS_Y, 0);
-		input_report_abs(ipd->input, ABS_Z, 0);
-		input_sync(ipd->input);
+		input_report_abs(input, ABS_X, 0);
+		input_report_abs(input, ABS_Y, 0);
+		input_report_abs(input, ABS_Z, 0);
+		input_sync(input);
 		return;
 	}
 
@@ -471,25 +470,24 @@ static void pega_accel_poll(struct input_polled_dev *ipd)
 	/* Note transform, convert to "right/up/out" in the native
 	 * landscape orientation (i.e. the vector is the direction of
 	 * "real up" in the device's cartiesian coordinates). */
-	input_report_abs(ipd->input, ABS_X, -asus->pega_acc_x);
-	input_report_abs(ipd->input, ABS_Y, -asus->pega_acc_y);
-	input_report_abs(ipd->input, ABS_Z,  asus->pega_acc_z);
-	input_sync(ipd->input);
+	input_report_abs(input, ABS_X, -asus->pega_acc_x);
+	input_report_abs(input, ABS_Y, -asus->pega_acc_y);
+	input_report_abs(input, ABS_Z,  asus->pega_acc_z);
+	input_sync(input);
 }
 
 static void pega_accel_exit(struct asus_laptop *asus)
 {
 	if (asus->pega_accel_poll) {
-		input_unregister_polled_device(asus->pega_accel_poll);
-		input_free_polled_device(asus->pega_accel_poll);
+		input_unregister_device(asus->pega_accel_poll);
+		asus->pega_accel_poll = NULL;
 	}
-	asus->pega_accel_poll = NULL;
 }
 
 static int pega_accel_init(struct asus_laptop *asus)
 {
 	int err;
-	struct input_polled_dev *ipd;
+	struct input_dev *input;
 
 	if (!asus->is_pega_lucid)
 		return -ENODEV;
@@ -499,37 +497,39 @@ static int pega_accel_init(struct asus_laptop *asus)
 	    acpi_check_handle(asus->handle, METHOD_XLRZ, NULL))
 		return -ENODEV;
 
-	ipd = input_allocate_polled_device();
-	if (!ipd)
+	input = input_allocate_device();
+	if (!input)
 		return -ENOMEM;
 
-	ipd->poll = pega_accel_poll;
-	ipd->poll_interval = 125;
-	ipd->poll_interval_min = 50;
-	ipd->poll_interval_max = 2000;
-
-	ipd->input->name = PEGA_ACCEL_DESC;
-	ipd->input->phys = PEGA_ACCEL_NAME "/input0";
-	ipd->input->dev.parent = &asus->platform_device->dev;
-	ipd->input->id.bustype = BUS_HOST;
+	input->name = PEGA_ACCEL_DESC;
+	input->phys = PEGA_ACCEL_NAME "/input0";
+	input->dev.parent = &asus->platform_device->dev;
+	input->id.bustype = BUS_HOST;
 
-	set_bit(EV_ABS, ipd->input->evbit);
-	input_set_abs_params(ipd->input, ABS_X,
+	input_set_abs_params(input, ABS_X,
 			     -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP, 0, 0);
-	input_set_abs_params(ipd->input, ABS_Y,
+	input_set_abs_params(input, ABS_Y,
 			     -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP, 0, 0);
-	input_set_abs_params(ipd->input, ABS_Z,
+	input_set_abs_params(input, ABS_Z,
 			     -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP, 0, 0);
 
-	err = input_register_polled_device(ipd);
+	err = input_setup_polling(input, pega_accel_poll);
 	if (err)
 		goto exit;
 
-	asus->pega_accel_poll = ipd;
+	input_set_poll_interval(input, 125);
+	input_set_min_poll_interval(input, 50);
+	input_set_max_poll_interval(input, 2000);
+
+	err = input_register_device(input);
+	if (err)
+		goto exit;
+
+	asus->pega_accel_poll = input;
 	return 0;
 
 exit:
-	input_free_polled_device(ipd);
+	input_free_device(input);
 	return err;
 }
 
@@ -1550,8 +1550,7 @@ static void asus_acpi_notify(struct acpi_device *device, u32 event)
 
 	/* Accelerometer "coarse orientation change" event */
 	if (asus->pega_accel_poll && event == 0xEA) {
-		kobject_uevent(&asus->pega_accel_poll->input->dev.kobj,
-			       KOBJ_CHANGE);
+		kobject_uevent(&asus->pega_accel_poll->dev.kobj, KOBJ_CHANGE);
 		return ;
 	}
 
-- 
2.23.0.444.g18eeb5a265-goog


-- 
Dmitry
