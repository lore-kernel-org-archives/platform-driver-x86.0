From: Andy Ross <andy.ross@windriver.com>
Subject: [PATCH 3/4] asus-laptop: Pegatron Lucid accelerometer
Date: Thu, 24 Mar 2011 15:02:09 -0700
Message-ID: <1301004130-3294-4-git-send-email-andy.ross@windriver.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from li44-10.members.linode.com ([72.14.181.10]:44867 "EHLO
	plausible.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757292Ab1CXWIj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 18:08:39 -0400
In-Reply-To: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Support the built-in accelerometer on the Lucid tablets as a standard
3-axis input device.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 drivers/platform/x86/Kconfig       |    9 ++-
 drivers/platform/x86/asus-laptop.c |  137 +++++++++++++++++++++++++++++++++++-
 2 files changed, 141 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b6f983e..43906f5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -67,10 +67,11 @@ config ASUS_LAPTOP
 	  This is a driver for Asus laptops and the Pegatron Lucid
 	  tablet. It may also support some MEDION, JVC or VICTOR
 	  laptops. It makes all the extra buttons generate standard
-	  ACPI events and input events. It also adds support for video
-	  output switching, LCD backlight control, Bluetooth and Wlan
-	  control, and most importantly, allows you to blink those
-	  fancy LEDs.
+	  ACPI events and input events, and on the Lucid the built-in
+	  accelerometer appears as an input device.  It also adds
+	  support for video output switching, LCD backlight control,
+	  Bluetooth and Wlan control, and most importantly, allows you
+	  to blink those fancy LEDs.
 
 	  For more information and a userspace daemon for handling the extra
 	  buttons see <http://acpi4asus.sf.net>.
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 6651d8c..9b07368 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -224,6 +224,14 @@ static char *display_get_paths[] = {
 #define PEGA_READ_ALS_H	0x02
 #define PEGA_READ_ALS_L	0x03
 
+#define PEGA_ACCEL_NAME "pega_accel"
+#define PEGA_ACCEL_DESC "Pegatron Lucid Tablet Accelerometer"
+#define METHOD_XLRX "XLRX"
+#define METHOD_XLRY "XLRY"
+#define METHOD_XLRZ "XLRZ"
+#define PEGA_ACC_CLAMP 512 /* 1G accel is reported as ~256, so clamp to 2G */
+#define PEGA_ACC_RETRIES 3
+
 /*
  * Define a specific led structure to keep the main structure clean
  */
@@ -249,6 +257,7 @@ struct asus_laptop {
 
 	struct input_dev *inputdev;
 	struct key_entry *keymap;
+	struct input_polled_dev *pega_accel_poll;
 
 	struct asus_led mled;
 	struct asus_led tled;
@@ -262,6 +271,10 @@ struct asus_laptop {
 	bool have_rsts;
 	bool have_pega_lucid;
 	int lcd_state;
+	bool pega_acc_live;
+	int pega_acc_x;
+	int pega_acc_y;
+	int pega_acc_z;
 
 	struct rfkill *gps_rfkill;
 
@@ -390,6 +403,99 @@ static int asus_pega_lucid_set(struct asus_laptop *asus, int unit, bool enable)
 	return write_acpi_int(asus->handle, method, unit);
 }
 
+static int pega_acc_axis(struct asus_laptop *asus, int curr, char *method)
+{
+	int i, delta;
+	unsigned long long val;
+	for (i = 0; i < PEGA_ACC_RETRIES; i++) {
+		acpi_evaluate_integer(asus->handle, method, NULL, &val);
+
+		/* The output is noisy.  From reading the ASL
+		 * dissassembly, timeout errors are returned with 1's
+		 * in the high word, and the lack of locking around
+		 * thei hi/lo byte reads means that a transition
+		 * between (for example) -1 and 0 could be read as
+		 * 0xff00 or 0x00ff. */
+		delta = abs(curr - (short)val);
+		if (delta < 128 && !(val & ~0xffff))
+			break;
+	}
+	return clamp_val((short)val, -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP);
+}
+
+static void pega_accel_poll(struct input_polled_dev *ipd)
+{
+	struct device *parent = ipd->input->dev.parent;
+	struct asus_laptop *asus = dev_get_drvdata(parent);
+
+	/* In some cases, the very first call to poll causes a
+	 * recursive fault under the polldev worker.  This is
+	 * apparently related to very early userspace access to the
+	 * device, and perhaps a firmware bug.  See related comments
+	 * in asus_platform_probe regarding the fragility of these
+	 * methods early in the boot.  Fake the first report. */
+	if (!asus->pega_acc_live) {
+		asus->pega_acc_live = true;
+		input_report_abs(ipd->input, ABS_X, 0);
+		input_report_abs(ipd->input, ABS_Y, 0);
+		input_report_abs(ipd->input, ABS_Z, 0);
+		input_sync(ipd->input);
+		return;
+	}
+
+	asus->pega_acc_x = pega_acc_axis(asus, asus->pega_acc_x, METHOD_XLRX);
+	asus->pega_acc_y = pega_acc_axis(asus, asus->pega_acc_y, METHOD_XLRY);
+	asus->pega_acc_z = pega_acc_axis(asus, asus->pega_acc_z, METHOD_XLRZ);
+
+	/* Note transform, convert to "right/up/out" in the native
+	 * landscape orientation (i.e. the vector is the direction of
+	 * "real up" in the device's cartiesian coordinates). */
+	input_report_abs(ipd->input, ABS_X, -asus->pega_acc_x);
+	input_report_abs(ipd->input, ABS_Y, -asus->pega_acc_y);
+	input_report_abs(ipd->input, ABS_Z,  asus->pega_acc_z);
+	input_sync(ipd->input);
+}
+
+static void pega_accel_probe(struct asus_laptop *asus)
+{
+	int err;
+	struct input_polled_dev *ipd;
+
+	if (!asus->have_pega_lucid ||
+	    acpi_check_handle(asus->handle, METHOD_XLRX, NULL) ||
+	    acpi_check_handle(asus->handle, METHOD_XLRY, NULL) ||
+	    acpi_check_handle(asus->handle, METHOD_XLRZ, NULL))
+		return;
+
+	ipd = input_allocate_polled_device();
+	if (!ipd)
+		return;
+
+	ipd->poll = pega_accel_poll;
+	ipd->poll_interval = 125;
+	ipd->poll_interval_min = 50;
+	ipd->poll_interval_max = 2000;
+
+	ipd->input->name = PEGA_ACCEL_DESC;
+	ipd->input->phys = PEGA_ACCEL_NAME "/input0";
+	ipd->input->dev.parent = &asus->platform_device->dev;
+	ipd->input->id.bustype = BUS_HOST;
+
+	set_bit(EV_ABS, ipd->input->evbit);
+	input_set_abs_params(ipd->input, ABS_X,
+			     -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP, 0, 0);
+	input_set_abs_params(ipd->input, ABS_Y,
+			     -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP, 0, 0);
+	input_set_abs_params(ipd->input, ABS_Z,
+			     -PEGA_ACC_CLAMP, PEGA_ACC_CLAMP, 0, 0);
+
+	err = input_register_polled_device(ipd);
+	if (err)
+		input_free_polled_device(ipd);
+	else
+		asus->pega_accel_poll = ipd;
+}
+
 /* Generic LED function */
 static int asus_led_set(struct asus_laptop *asus, const char *method,
 			 int value)
@@ -1459,11 +1565,40 @@ static void asus_platform_exit(struct asus_laptop *asus)
 	platform_device_unregister(asus->platform_device);
 }
 
+static int asus_platform_probe(struct platform_device *pd)
+{
+	struct asus_laptop *asus = dev_get_drvdata(&pd->dev);
+
+	/* This is instantiated during platform driver initialization
+	 * becuase if it's done from underneath asus_acpi_add(), the
+	 * resulting input device can be grabbed by an early userspace
+	 * reader before ACPI initialization is finished and something
+	 * oopses underneath the acpi_evaluate_integer() call out of
+	 * pega_accel_poll().  Firmware bug? */
+	pega_accel_probe(asus);
+
+	return 0;
+}
+
+static int __devexit asus_platform_remove(struct platform_device *pd)
+{
+	struct asus_laptop *asus = dev_get_drvdata(&pd->dev);
+	if (asus->pega_accel_poll) {
+		input_unregister_polled_device(asus->pega_accel_poll);
+		input_free_polled_device(asus->pega_accel_poll);
+	}
+	asus->pega_accel_poll = NULL;
+	return 0;
+}
+
+
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = ASUS_LAPTOP_FILE,
 		.owner = THIS_MODULE,
-	}
+	},
+	.probe  = asus_platform_probe,
+	.remove = asus_platform_remove,
 };
 
 static int asus_handle_init(char *name, acpi_handle * handle,
-- 
1.7.1
