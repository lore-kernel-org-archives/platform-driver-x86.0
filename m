From: Seth Forshee <seth.forshee@canonical.com>
Subject: =?UTF-8?q?=5BRFC=20PATCH=201/5=5D=20toshiba=5Facpi=3A=20Convert=20to=20use=20acpi=5Fdriver?=
Date: Mon, 29 Aug 2011 16:04:51 -0500
Message-ID: <1314651895-24345-2-git-send-email-seth.forshee@canonical.com>
References: <1314651895-24345-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59512 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755092Ab1H2VFD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Aug 2011 17:05:03 -0400
In-Reply-To: <1314651895-24345-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Changes toshiba_acpi to register an acpi driver and eliminates the
platform device it was using. Also eliminates most global
variables, moving them into toshiba_acpi_dev, along with some
other miscellaneous fixes and cleanup.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/toshiba_acpi.c |  506 ++++++++++++++++++---------=
--------
 1 files changed, 261 insertions(+), 245 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86=
/toshiba_acpi.c
index cb009b2..604c666 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -47,7 +47,6 @@
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/backlight.h>
-#include <linux/platform_device.h>
 #include <linux/rfkill.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -111,6 +110,22 @@ MODULE_LICENSE("GPL");
 #define HCI_WIRELESS_BT_ATTACH		0x40
 #define HCI_WIRELESS_BT_POWER		0x80
=20
+struct toshiba_acpi_dev {
+	struct acpi_device *acpi_dev;
+	const char *method_hci;
+	struct rfkill *bt_rfk;
+	struct input_dev *hotkey_dev;
+	struct backlight_device *backlight_dev;
+	struct led_classdev led_dev;
+	int illumination_installed;
+	int force_fan;
+	int last_key_event;
+	int key_event_valid;
+	acpi_handle handle;
+
+	struct mutex mutex;
+};
+
 static const struct acpi_device_id toshiba_device_ids[] =3D {
 	{"TOS6200", 0},
 	{"TOS6208", 0},
@@ -119,7 +134,7 @@ static const struct acpi_device_id toshiba_device_i=
ds[] =3D {
 };
 MODULE_DEVICE_TABLE(acpi, toshiba_device_ids);
=20
-static const struct key_entry toshiba_acpi_keymap[] __initconst =3D {
+static const struct key_entry toshiba_acpi_keymap[] __devinitconst =3D=
 {
 	{ KE_KEY, 0x101, { KEY_MUTE } },
 	{ KE_KEY, 0x102, { KEY_ZOOMOUT } },
 	{ KE_KEY, 0x103, { KEY_ZOOMIN } },
@@ -179,29 +194,11 @@ static int write_acpi_int(const char *methodName,=
 int val)
 	return (status =3D=3D AE_OK);
 }
=20
-#if 0
-static int read_acpi_int(const char *methodName, int *pVal)
-{
-	struct acpi_buffer results;
-	union acpi_object out_objs[1];
-	acpi_status status;
-
-	results.length =3D sizeof(out_objs);
-	results.pointer =3D out_objs;
-
-	status =3D acpi_evaluate_object(0, (char *)methodName, 0, &results);
-	*pVal =3D out_objs[0].integer.value;
-
-	return (status =3D=3D AE_OK) && (out_objs[0].type =3D=3D ACPI_TYPE_IN=
TEGER);
-}
-#endif
-
-static const char *method_hci /*=3D 0*/ ;
-
 /* Perform a raw HCI call.  Here we don't care about input or output b=
uffer
  * format.
  */
-static acpi_status hci_raw(const u32 in[HCI_WORDS], u32 out[HCI_WORDS]=
)
+static acpi_status hci_raw(struct toshiba_acpi_dev *dev,=20
+			   const u32 in[HCI_WORDS], u32 out[HCI_WORDS])
 {
 	struct acpi_object_list params;
 	union acpi_object in_objs[HCI_WORDS];
@@ -220,7 +217,7 @@ static acpi_status hci_raw(const u32 in[HCI_WORDS],=
 u32 out[HCI_WORDS])
 	results.length =3D sizeof(out_objs);
 	results.pointer =3D out_objs;
=20
-	status =3D acpi_evaluate_object(NULL, (char *)method_hci, &params,
+	status =3D acpi_evaluate_object(NULL, (char *)dev->method_hci, &param=
s,
 				      &results);
 	if ((status =3D=3D AE_OK) && (out_objs->package.count <=3D HCI_WORDS)=
) {
 		for (i =3D 0; i < out_objs->package.count; ++i) {
@@ -237,85 +234,79 @@ static acpi_status hci_raw(const u32 in[HCI_WORDS=
], u32 out[HCI_WORDS])
  * may be useful (such as "not supported").
  */
=20
-static acpi_status hci_write1(u32 reg, u32 in1, u32 * result)
+static acpi_status hci_write1(struct toshiba_acpi_dev *dev, u32 reg,
+			      u32 in1, u32 * result)
 {
 	u32 in[HCI_WORDS] =3D { HCI_SET, reg, in1, 0, 0, 0 };
 	u32 out[HCI_WORDS];
-	acpi_status status =3D hci_raw(in, out);
+	acpi_status status =3D hci_raw(dev, in, out);
 	*result =3D (status =3D=3D AE_OK) ? out[0] : HCI_FAILURE;
 	return status;
 }
=20
-static acpi_status hci_read1(u32 reg, u32 * out1, u32 * result)
+static acpi_status hci_read1(struct toshiba_acpi_dev *dev, u32 reg,
+			     u32 * out1, u32 * result)
 {
 	u32 in[HCI_WORDS] =3D { HCI_GET, reg, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
-	acpi_status status =3D hci_raw(in, out);
+	acpi_status status =3D hci_raw(dev, in, out);
 	*out1 =3D out[2];
 	*result =3D (status =3D=3D AE_OK) ? out[0] : HCI_FAILURE;
 	return status;
 }
=20
-static acpi_status hci_write2(u32 reg, u32 in1, u32 in2, u32 *result)
+static acpi_status hci_write2(struct toshiba_acpi_dev *dev, u32 reg,
+			      u32 in1, u32 in2, u32 *result)
 {
 	u32 in[HCI_WORDS] =3D { HCI_SET, reg, in1, in2, 0, 0 };
 	u32 out[HCI_WORDS];
-	acpi_status status =3D hci_raw(in, out);
+	acpi_status status =3D hci_raw(dev, in, out);
 	*result =3D (status =3D=3D AE_OK) ? out[0] : HCI_FAILURE;
 	return status;
 }
=20
-static acpi_status hci_read2(u32 reg, u32 *out1, u32 *out2, u32 *resul=
t)
+static acpi_status hci_read2(struct toshiba_acpi_dev *dev, u32 reg,
+			     u32 *out1, u32 *out2, u32 *result)
 {
 	u32 in[HCI_WORDS] =3D { HCI_GET, reg, *out1, *out2, 0, 0 };
 	u32 out[HCI_WORDS];
-	acpi_status status =3D hci_raw(in, out);
+	acpi_status status =3D hci_raw(dev, in, out);
 	*out1 =3D out[2];
 	*out2 =3D out[3];
 	*result =3D (status =3D=3D AE_OK) ? out[0] : HCI_FAILURE;
 	return status;
 }
=20
-struct toshiba_acpi_dev {
-	struct platform_device *p_dev;
-	struct rfkill *bt_rfk;
-	struct input_dev *hotkey_dev;
-	int illumination_installed;
-	acpi_handle handle;
-
-	const char *bt_name;
-
-	struct mutex mutex;
-};
-
 /* Illumination support */
-static int toshiba_illumination_available(void)
+static int toshiba_illumination_available(struct toshiba_acpi_dev *dev=
)
 {
 	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
 	acpi_status status;
=20
 	in[0] =3D 0xf100;
-	status =3D hci_raw(in, out);
+	status =3D hci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_info("Illumination device not available\n");
 		return 0;
 	}
 	in[0] =3D 0xf400;
-	status =3D hci_raw(in, out);
+	status =3D hci_raw(dev, in, out);
 	return 1;
 }
=20
 static void toshiba_illumination_set(struct led_classdev *cdev,
 				     enum led_brightness brightness)
 {
+	struct toshiba_acpi_dev *dev =3D container_of(cdev,
+			struct toshiba_acpi_dev, led_dev);
 	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
 	acpi_status status;
=20
 	/* First request : initialize communication. */
 	in[0] =3D 0xf100;
-	status =3D hci_raw(in, out);
+	status =3D hci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_info("Illumination device not available\n");
 		return;
@@ -326,7 +317,7 @@ static void toshiba_illumination_set(struct led_cla=
ssdev *cdev,
 		in[0] =3D 0xf400;
 		in[1] =3D 0x14e;
 		in[2] =3D 1;
-		status =3D hci_raw(in, out);
+		status =3D hci_raw(dev, in, out);
 		if (ACPI_FAILURE(status)) {
 			pr_info("ACPI call for illumination failed\n");
 			return;
@@ -336,7 +327,7 @@ static void toshiba_illumination_set(struct led_cla=
ssdev *cdev,
 		in[0] =3D 0xf400;
 		in[1] =3D 0x14e;
 		in[2] =3D 0;
-		status =3D hci_raw(in, out);
+		status =3D hci_raw(dev, in, out);
 		if (ACPI_FAILURE(status)) {
 			pr_info("ACPI call for illumination failed.\n");
 			return;
@@ -347,11 +338,13 @@ static void toshiba_illumination_set(struct led_c=
lassdev *cdev,
 	in[0] =3D 0xf200;
 	in[1] =3D 0;
 	in[2] =3D 0;
-	hci_raw(in, out);
+	hci_raw(dev, in, out);
 }
=20
 static enum led_brightness toshiba_illumination_get(struct led_classde=
v *cdev)
 {
+	struct toshiba_acpi_dev *dev =3D container_of(cdev,
+			struct toshiba_acpi_dev, led_dev);
 	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
 	acpi_status status;
@@ -359,7 +352,7 @@ static enum led_brightness toshiba_illumination_get=
(struct led_classdev *cdev)
=20
 	/*=C2=A0First request : initialize communication. */
 	in[0] =3D 0xf100;
-	status =3D hci_raw(in, out);
+	status =3D hci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_info("Illumination device not available\n");
 		return LED_OFF;
@@ -368,7 +361,7 @@ static enum led_brightness toshiba_illumination_get=
(struct led_classdev *cdev)
 	/* Check the illumination */
 	in[0] =3D 0xf300;
 	in[1] =3D 0x14e;
-	status =3D hci_raw(in, out);
+	status =3D hci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_info("ACPI call for illumination failed.\n");
 		return LED_OFF;
@@ -380,46 +373,35 @@ static enum led_brightness toshiba_illumination_g=
et(struct led_classdev *cdev)
 	in[0] =3D 0xf200;
 	in[1] =3D 0;
 	in[2] =3D 0;
-	hci_raw(in, out);
+	hci_raw(dev, in, out);
=20
 	return result;
 }
=20
-static struct led_classdev toshiba_led =3D {
-	.name           =3D "toshiba::illumination",
-	.max_brightness =3D 1,
-	.brightness_set =3D toshiba_illumination_set,
-	.brightness_get =3D toshiba_illumination_get,
-};
-
-static struct toshiba_acpi_dev toshiba_acpi =3D {
-	.bt_name =3D "Toshiba Bluetooth",
-};
-
 /* Bluetooth rfkill handlers */
=20
-static u32 hci_get_bt_present(bool *present)
+static u32 hci_get_bt_present(struct toshiba_acpi_dev *dev, bool *pres=
ent)
 {
 	u32 hci_result;
 	u32 value, value2;
=20
 	value =3D 0;
 	value2 =3D 0;
-	hci_read2(HCI_WIRELESS, &value, &value2, &hci_result);
+	hci_read2(dev, HCI_WIRELESS, &value, &value2, &hci_result);
 	if (hci_result =3D=3D HCI_SUCCESS)
 		*present =3D (value & HCI_WIRELESS_BT_PRESENT) ? true : false;
=20
 	return hci_result;
 }
=20
-static u32 hci_get_radio_state(bool *radio_state)
+static u32 hci_get_radio_state(struct toshiba_acpi_dev *dev, bool *rad=
io_state)
 {
 	u32 hci_result;
 	u32 value, value2;
=20
 	value =3D 0;
 	value2 =3D 0x0001;
-	hci_read2(HCI_WIRELESS, &value, &value2, &hci_result);
+	hci_read2(dev, HCI_WIRELESS, &value, &value2, &hci_result);
=20
 	*radio_state =3D value & HCI_WIRELESS_KILL_SWITCH;
 	return hci_result;
@@ -436,7 +418,7 @@ static int bt_rfkill_set_block(void *data, bool blo=
cked)
 	value =3D (blocked =3D=3D false);
=20
 	mutex_lock(&dev->mutex);
-	if (hci_get_radio_state(&radio_state) !=3D HCI_SUCCESS) {
+	if (hci_get_radio_state(dev, &radio_state) !=3D HCI_SUCCESS) {
 		err =3D -EBUSY;
 		goto out;
 	}
@@ -446,8 +428,8 @@ static int bt_rfkill_set_block(void *data, bool blo=
cked)
 		goto out;
 	}
=20
-	hci_write2(HCI_WIRELESS, value, HCI_WIRELESS_BT_POWER, &result1);
-	hci_write2(HCI_WIRELESS, value, HCI_WIRELESS_BT_ATTACH, &result2);
+	hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_POWER, &result1)=
;
+	hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_ATTACH, &result2=
);
=20
 	if (result1 !=3D HCI_SUCCESS || result2 !=3D HCI_SUCCESS)
 		err =3D -EBUSY;
@@ -467,7 +449,7 @@ static void bt_rfkill_poll(struct rfkill *rfkill, v=
oid *data)
=20
 	mutex_lock(&dev->mutex);
=20
-	hci_result =3D hci_get_radio_state(&value);
+	hci_result =3D hci_get_radio_state(dev, &value);
 	if (hci_result !=3D HCI_SUCCESS) {
 		/* Can't do anything useful */
 		mutex_unlock(&dev->mutex);
@@ -488,17 +470,14 @@ static const struct rfkill_ops toshiba_rfk_ops =3D=
 {
 };
=20
 static struct proc_dir_entry *toshiba_proc_dir /*=3D 0*/ ;
-static struct backlight_device *toshiba_backlight_device;
-static int force_fan;
-static int last_key_event;
-static int key_event_valid;
=20
 static int get_lcd(struct backlight_device *bd)
 {
+	struct toshiba_acpi_dev *dev =3D bl_get_data(bd);
 	u32 hci_result;
 	u32 value;
=20
-	hci_read1(HCI_LCD_BRIGHTNESS, &value, &hci_result);
+	hci_read1(dev, HCI_LCD_BRIGHTNESS, &value, &hci_result);
 	if (hci_result =3D=3D HCI_SUCCESS) {
 		return (value >> HCI_LCD_BRIGHTNESS_SHIFT);
 	} else
@@ -507,8 +486,13 @@ static int get_lcd(struct backlight_device *bd)
=20
 static int lcd_proc_show(struct seq_file *m, void *v)
 {
-	int value =3D get_lcd(NULL);
+	struct toshiba_acpi_dev *dev =3D m->private;
+	int value;
+
+	if (!dev->backlight_dev)
+		return -ENODEV;
=20
+	value =3D get_lcd(dev->backlight_dev);
 	if (value >=3D 0) {
 		seq_printf(m, "brightness:              %d\n", value);
 		seq_printf(m, "brightness_levels:       %d\n",
@@ -522,15 +506,15 @@ static int lcd_proc_show(struct seq_file *m, void=
 *v)
=20
 static int lcd_proc_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, lcd_proc_show, NULL);
+	return single_open(file, lcd_proc_show, PDE(inode)->data);
 }
=20
-static int set_lcd(int value)
+static int set_lcd(struct toshiba_acpi_dev *dev, int value)
 {
 	u32 hci_result;
=20
 	value =3D value << HCI_LCD_BRIGHTNESS_SHIFT;
-	hci_write1(HCI_LCD_BRIGHTNESS, value, &hci_result);
+	hci_write1(dev, HCI_LCD_BRIGHTNESS, value, &hci_result);
 	if (hci_result !=3D HCI_SUCCESS)
 		return -EFAULT;
=20
@@ -539,12 +523,14 @@ static int set_lcd(int value)
=20
 static int set_lcd_status(struct backlight_device *bd)
 {
-	return set_lcd(bd->props.brightness);
+	struct toshiba_acpi_dev *dev =3D bl_get_data(bd);
+	return set_lcd(dev, bd->props.brightness);
 }
=20
 static ssize_t lcd_proc_write(struct file *file, const char __user *bu=
f,
 			      size_t count, loff_t *pos)
 {
+	struct toshiba_acpi_dev *dev =3D PDE(file->f_path.dentry->d_inode)->d=
ata;
 	char cmd[42];
 	size_t len;
 	int value;
@@ -557,7 +543,7 @@ static ssize_t lcd_proc_write(struct file *file, co=
nst char __user *buf,
=20
 	if (sscanf(cmd, " brightness : %i", &value) =3D=3D 1 &&
 	    value >=3D 0 && value < HCI_LCD_BRIGHTNESS_LEVELS) {
-		ret =3D set_lcd(value);
+		ret =3D set_lcd(dev, value);
 		if (ret =3D=3D 0)
 			ret =3D count;
 	} else {
@@ -577,10 +563,11 @@ static const struct file_operations lcd_proc_fops=
 =3D {
=20
 static int video_proc_show(struct seq_file *m, void *v)
 {
+	struct toshiba_acpi_dev *dev =3D m->private;
 	u32 hci_result;
 	u32 value;
=20
-	hci_read1(HCI_VIDEO_OUT, &value, &hci_result);
+	hci_read1(dev, HCI_VIDEO_OUT, &value, &hci_result);
 	if (hci_result =3D=3D HCI_SUCCESS) {
 		int is_lcd =3D (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
 		int is_crt =3D (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
@@ -597,12 +584,13 @@ static int video_proc_show(struct seq_file *m, vo=
id *v)
=20
 static int video_proc_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, video_proc_show, NULL);
+	return single_open(file, video_proc_show, PDE(inode)->data);
 }
=20
 static ssize_t video_proc_write(struct file *file, const char __user *=
buf,
 				size_t count, loff_t *pos)
 {
+	struct toshiba_acpi_dev *dev =3D PDE(file->f_path.dentry->d_inode)->d=
ata;
 	char *cmd, *buffer;
 	int value;
 	int remain =3D count;
@@ -644,7 +632,7 @@ static ssize_t video_proc_write(struct file *file, =
const char __user *buf,
=20
 	kfree(cmd);
=20
-	hci_read1(HCI_VIDEO_OUT, &video_out, &hci_result);
+	hci_read1(dev, HCI_VIDEO_OUT, &video_out, &hci_result);
 	if (hci_result =3D=3D HCI_SUCCESS) {
 		unsigned int new_video_out =3D video_out;
 		if (lcd_out !=3D -1)
@@ -675,13 +663,14 @@ static const struct file_operations video_proc_fo=
ps =3D {
=20
 static int fan_proc_show(struct seq_file *m, void *v)
 {
+	struct toshiba_acpi_dev *dev =3D m->private;
 	u32 hci_result;
 	u32 value;
=20
-	hci_read1(HCI_FAN, &value, &hci_result);
+	hci_read1(dev, HCI_FAN, &value, &hci_result);
 	if (hci_result =3D=3D HCI_SUCCESS) {
 		seq_printf(m, "running:                 %d\n", (value > 0));
-		seq_printf(m, "force_on:                %d\n", force_fan);
+		seq_printf(m, "force_on:                %d\n", dev->force_fan);
 	} else {
 		pr_err("Error reading fan status\n");
 	}
@@ -691,12 +680,13 @@ static int fan_proc_show(struct seq_file *m, void=
 *v)
=20
 static int fan_proc_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, fan_proc_show, NULL);
+	return single_open(file, fan_proc_show, PDE(inode)->data);
 }
=20
 static ssize_t fan_proc_write(struct file *file, const char __user *bu=
f,
 			      size_t count, loff_t *pos)
 {
+	struct toshiba_acpi_dev *dev =3D PDE(file->f_path.dentry->d_inode)->d=
ata;
 	char cmd[42];
 	size_t len;
 	int value;
@@ -709,11 +699,11 @@ static ssize_t fan_proc_write(struct file *file, =
const char __user *buf,
=20
 	if (sscanf(cmd, " force_on : %i", &value) =3D=3D 1 &&
 	    value >=3D 0 && value <=3D 1) {
-		hci_write1(HCI_FAN, value, &hci_result);
+		hci_write1(dev, HCI_FAN, value, &hci_result);
 		if (hci_result !=3D HCI_SUCCESS)
 			return -EFAULT;
 		else
-			force_fan =3D value;
+			dev->force_fan =3D value;
 	} else {
 		return -EINVAL;
 	}
@@ -732,21 +722,22 @@ static const struct file_operations fan_proc_fops=
 =3D {
=20
 static int keys_proc_show(struct seq_file *m, void *v)
 {
+	struct toshiba_acpi_dev *dev =3D m->private;
 	u32 hci_result;
 	u32 value;
=20
-	if (!key_event_valid) {
-		hci_read1(HCI_SYSTEM_EVENT, &value, &hci_result);
+	if (!dev->key_event_valid) {
+		hci_read1(dev, HCI_SYSTEM_EVENT, &value, &hci_result);
 		if (hci_result =3D=3D HCI_SUCCESS) {
-			key_event_valid =3D 1;
-			last_key_event =3D value;
+			dev->key_event_valid =3D 1;
+			dev->last_key_event =3D value;
 		} else if (hci_result =3D=3D HCI_EMPTY) {
 			/* better luck next time */
 		} else if (hci_result =3D=3D HCI_NOT_SUPPORTED) {
 			/* This is a workaround for an unresolved issue on
 			 * some machines where system events sporadically
 			 * become disabled. */
-			hci_write1(HCI_SYSTEM_EVENT, 1, &hci_result);
+			hci_write1(dev, HCI_SYSTEM_EVENT, 1, &hci_result);
 			pr_notice("Re-enabled hotkeys\n");
 		} else {
 			pr_err("Error reading hotkey status\n");
@@ -754,20 +745,21 @@ static int keys_proc_show(struct seq_file *m, voi=
d *v)
 		}
 	}
=20
-	seq_printf(m, "hotkey_ready:            %d\n", key_event_valid);
-	seq_printf(m, "hotkey:                  0x%04x\n", last_key_event);
+	seq_printf(m, "hotkey_ready:            %d\n", dev->key_event_valid);
+	seq_printf(m, "hotkey:                  0x%04x\n", dev->last_key_even=
t);
 end:
 	return 0;
 }
=20
 static int keys_proc_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, keys_proc_show, NULL);
+	return single_open(file, keys_proc_show, PDE(inode)->data);
 }
=20
 static ssize_t keys_proc_write(struct file *file, const char __user *b=
uf,
 			       size_t count, loff_t *pos)
 {
+	struct toshiba_acpi_dev *dev =3D PDE(file->f_path.dentry->d_inode)->d=
ata;
 	char cmd[42];
 	size_t len;
 	int value;
@@ -778,7 +770,7 @@ static ssize_t keys_proc_write(struct file *file, c=
onst char __user *buf,
 	cmd[len] =3D '\0';
=20
 	if (sscanf(cmd, " hotkey_ready : %i", &value) =3D=3D 1 && value =3D=3D=
 0) {
-		key_event_valid =3D 0;
+		dev->key_event_valid =3D 0;
 	} else {
 		return -EINVAL;
 	}
@@ -820,13 +812,19 @@ static const struct file_operations version_proc_=
fops =3D {
=20
 #define PROC_TOSHIBA		"toshiba"
=20
-static void __init create_toshiba_proc_entries(void)
+static void __devinit
+create_toshiba_proc_entries(struct toshiba_acpi_dev *dev)
 {
-	proc_create("lcd", S_IRUGO | S_IWUSR, toshiba_proc_dir, &lcd_proc_fop=
s);
-	proc_create("video", S_IRUGO | S_IWUSR, toshiba_proc_dir, &video_proc=
_fops);
-	proc_create("fan", S_IRUGO | S_IWUSR, toshiba_proc_dir, &fan_proc_fop=
s);
-	proc_create("keys", S_IRUGO | S_IWUSR, toshiba_proc_dir, &keys_proc_f=
ops);
-	proc_create("version", S_IRUGO, toshiba_proc_dir, &version_proc_fops)=
;
+	proc_create_data("lcd", S_IRUGO | S_IWUSR, toshiba_proc_dir,
+			 &lcd_proc_fops, dev);
+	proc_create_data("video", S_IRUGO | S_IWUSR, toshiba_proc_dir,
+			 &video_proc_fops, dev);
+	proc_create_data("fan", S_IRUGO | S_IWUSR, toshiba_proc_dir,
+			 &fan_proc_fops, dev);
+	proc_create_data("keys", S_IRUGO | S_IWUSR, toshiba_proc_dir,
+			 &keys_proc_fops, dev);
+	proc_create_data("version", S_IRUGO, toshiba_proc_dir,
+			 &version_proc_fops, dev);
 }
=20
 static void remove_toshiba_proc_entries(void)
@@ -843,224 +841,242 @@ static const struct backlight_ops toshiba_backl=
ight_data =3D {
         .update_status  =3D set_lcd_status,
 };
=20
-static void toshiba_acpi_notify(acpi_handle handle, u32 event, void *c=
ontext)
-{
-	u32 hci_result, value;
-
-	if (event !=3D 0x80)
-		return;
-	do {
-		hci_read1(HCI_SYSTEM_EVENT, &value, &hci_result);
-		if (hci_result =3D=3D HCI_SUCCESS) {
-			if (value =3D=3D 0x100)
-				continue;
-			/* act on key press; ignore key release */
-			if (value & 0x80)
-				continue;
-
-			if (!sparse_keymap_report_event(toshiba_acpi.hotkey_dev,
-							value, 1, true)) {
-				pr_info("Unknown key %x\n",
-				       value);
-			}
-		} else if (hci_result =3D=3D HCI_NOT_SUPPORTED) {
-			/* This is a workaround for an unresolved issue on
-			 * some machines where system events sporadically
-			 * become disabled. */
-			hci_write1(HCI_SYSTEM_EVENT, 1, &hci_result);
-			pr_notice("Re-enabled hotkeys\n");
-		}
-	} while (hci_result !=3D HCI_EMPTY);
-}
-
-static int __init toshiba_acpi_setup_keyboard(char *device)
+static int __devinit toshiba_acpi_setup_keyboard(struct toshiba_acpi_d=
ev *dev,
+						 char *device_path)
 {
 	acpi_status status;
 	int error;
=20
-	status =3D acpi_get_handle(NULL, device, &toshiba_acpi.handle);
+	status =3D acpi_get_handle(NULL, device_path, &dev->handle);
 	if (ACPI_FAILURE(status)) {
 		pr_info("Unable to get notification device\n");
 		return -ENODEV;
 	}
=20
-	toshiba_acpi.hotkey_dev =3D input_allocate_device();
-	if (!toshiba_acpi.hotkey_dev) {
+	dev->hotkey_dev =3D input_allocate_device();
+	if (!dev->hotkey_dev) {
 		pr_info("Unable to register input device\n");
 		return -ENOMEM;
 	}
=20
-	toshiba_acpi.hotkey_dev->name =3D "Toshiba input device";
-	toshiba_acpi.hotkey_dev->phys =3D device;
-	toshiba_acpi.hotkey_dev->id.bustype =3D BUS_HOST;
+	dev->hotkey_dev->name =3D "Toshiba input device";
+	dev->hotkey_dev->phys =3D device_path;
+	dev->hotkey_dev->id.bustype =3D BUS_HOST;
=20
-	error =3D sparse_keymap_setup(toshiba_acpi.hotkey_dev,
-				    toshiba_acpi_keymap, NULL);
+	error =3D sparse_keymap_setup(dev->hotkey_dev, toshiba_acpi_keymap, N=
ULL);
 	if (error)
 		goto err_free_dev;
=20
-	status =3D acpi_install_notify_handler(toshiba_acpi.handle,
-				ACPI_DEVICE_NOTIFY, toshiba_acpi_notify, NULL);
-	if (ACPI_FAILURE(status)) {
-		pr_info("Unable to install hotkey notification\n");
-		error =3D -ENODEV;
-		goto err_free_keymap;
-	}
-
-	status =3D acpi_evaluate_object(toshiba_acpi.handle, "ENAB", NULL, NU=
LL);
+	status =3D acpi_evaluate_object(dev->handle, "ENAB", NULL, NULL);
 	if (ACPI_FAILURE(status)) {
 		pr_info("Unable to enable hotkeys\n");
 		error =3D -ENODEV;
-		goto err_remove_notify;
+		goto err_free_keymap;
 	}
=20
-	error =3D input_register_device(toshiba_acpi.hotkey_dev);
+	error =3D input_register_device(dev->hotkey_dev);
 	if (error) {
 		pr_info("Unable to register input device\n");
-		goto err_remove_notify;
+		goto err_free_keymap;
 	}
=20
 	return 0;
=20
- err_remove_notify:
-	acpi_remove_notify_handler(toshiba_acpi.handle,
-				   ACPI_DEVICE_NOTIFY, toshiba_acpi_notify);
  err_free_keymap:
-	sparse_keymap_free(toshiba_acpi.hotkey_dev);
+	sparse_keymap_free(dev->hotkey_dev);
  err_free_dev:
-	input_free_device(toshiba_acpi.hotkey_dev);
-	toshiba_acpi.hotkey_dev =3D NULL;
+	input_free_device(dev->hotkey_dev);
+	dev->hotkey_dev =3D NULL;
 	return error;
 }
=20
-static void toshiba_acpi_exit(void)
+static int toshiba_acpi_remove(struct acpi_device *acpi_dev, int type)
 {
-	if (toshiba_acpi.hotkey_dev) {
-		acpi_remove_notify_handler(toshiba_acpi.handle,
-				ACPI_DEVICE_NOTIFY, toshiba_acpi_notify);
-		sparse_keymap_free(toshiba_acpi.hotkey_dev);
-		input_unregister_device(toshiba_acpi.hotkey_dev);
-	}
+	struct toshiba_acpi_dev *dev =3D acpi_driver_data(acpi_dev);
=20
-	if (toshiba_acpi.bt_rfk) {
-		rfkill_unregister(toshiba_acpi.bt_rfk);
-		rfkill_destroy(toshiba_acpi.bt_rfk);
-	}
+	remove_toshiba_proc_entries();
=20
-	if (toshiba_backlight_device)
-		backlight_device_unregister(toshiba_backlight_device);
+	if (dev->hotkey_dev) {
+		input_unregister_device(dev->hotkey_dev);
+		sparse_keymap_free(dev->hotkey_dev);
+	}
=20
-	remove_toshiba_proc_entries();
+	if (dev->bt_rfk) {
+		rfkill_unregister(dev->bt_rfk);
+		rfkill_destroy(dev->bt_rfk);
+	}
=20
-	if (toshiba_proc_dir)
-		remove_proc_entry(PROC_TOSHIBA, acpi_root_dir);
+	if (dev->backlight_dev)
+		backlight_device_unregister(dev->backlight_dev);
=20
-	if (toshiba_acpi.illumination_installed)
-		led_classdev_unregister(&toshiba_led);
+	if (dev->illumination_installed)
+		led_classdev_unregister(&dev->led_dev);
=20
-	platform_device_unregister(toshiba_acpi.p_dev);
+	kfree(dev);
=20
-	return;
+	return 0;
 }
=20
-static int __init toshiba_acpi_init(void)
+static int __devinit toshiba_acpi_add(struct acpi_device *acpi_dev)
 {
+	struct toshiba_acpi_dev *dev;
 	u32 hci_result;
 	bool bt_present;
 	int ret =3D 0;
 	struct backlight_properties props;
=20
-	if (acpi_disabled)
-		return -ENODEV;
+	pr_info("Toshiba Laptop ACPI Extras version %s\n",
+	       TOSHIBA_ACPI_VERSION);
+
+	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+	dev->acpi_dev =3D acpi_dev;
+	acpi_dev->driver_data =3D dev;
=20
 	/* simple device detection: look for HCI method */
 	if (is_valid_acpi_path(TOSH_INTERFACE_1 GHCI_METHOD)) {
-		method_hci =3D TOSH_INTERFACE_1 GHCI_METHOD;
-		if (toshiba_acpi_setup_keyboard(TOSH_INTERFACE_1))
+		dev->method_hci =3D TOSH_INTERFACE_1 GHCI_METHOD;
+		if (toshiba_acpi_setup_keyboard(dev, TOSH_INTERFACE_1))
 			pr_info("Unable to activate hotkeys\n");
 	} else if (is_valid_acpi_path(TOSH_INTERFACE_2 GHCI_METHOD)) {
-		method_hci =3D TOSH_INTERFACE_2 GHCI_METHOD;
-		if (toshiba_acpi_setup_keyboard(TOSH_INTERFACE_2))
+		dev->method_hci =3D TOSH_INTERFACE_2 GHCI_METHOD;
+		if (toshiba_acpi_setup_keyboard(dev, TOSH_INTERFACE_2))
 			pr_info("Unable to activate hotkeys\n");
-	} else
-		return -ENODEV;
-
-	pr_info("Toshiba Laptop ACPI Extras version %s\n",
-	       TOSHIBA_ACPI_VERSION);
-	pr_info("    HCI method: %s\n", method_hci);
-
-	mutex_init(&toshiba_acpi.mutex);
-
-	toshiba_acpi.p_dev =3D platform_device_register_simple("toshiba_acpi"=
,
-							      -1, NULL, 0);
-	if (IS_ERR(toshiba_acpi.p_dev)) {
-		ret =3D PTR_ERR(toshiba_acpi.p_dev);
-		pr_err("unable to register platform device\n");
-		toshiba_acpi.p_dev =3D NULL;
-		toshiba_acpi_exit();
-		return ret;
+	} else {
+		ret =3D -ENODEV;
+		goto error;
 	}
=20
-	force_fan =3D 0;
-	key_event_valid =3D 0;
+	pr_info("HCI method: %s\n", dev->method_hci);
+
+	mutex_init(&dev->mutex);
=20
 	/* enable event fifo */
-	hci_write1(HCI_SYSTEM_EVENT, 1, &hci_result);
+	hci_write1(dev, HCI_SYSTEM_EVENT, 1, &hci_result);
=20
-	toshiba_proc_dir =3D proc_mkdir(PROC_TOSHIBA, acpi_root_dir);
-	if (!toshiba_proc_dir) {
-		toshiba_acpi_exit();
-		return -ENODEV;
-	} else {
-		create_toshiba_proc_entries();
-	}
+	create_toshiba_proc_entries(dev);
=20
 	props.type =3D BACKLIGHT_PLATFORM;
 	props.max_brightness =3D HCI_LCD_BRIGHTNESS_LEVELS - 1;
-	toshiba_backlight_device =3D backlight_device_register("toshiba",
-							     &toshiba_acpi.p_dev->dev,
-							     NULL,
-							     &toshiba_backlight_data,
-							     &props);
-        if (IS_ERR(toshiba_backlight_device)) {
-		ret =3D PTR_ERR(toshiba_backlight_device);
+	dev->backlight_dev =3D backlight_device_register("toshiba",
+						       &acpi_dev->dev,
+						       dev,
+						       &toshiba_backlight_data,
+						       &props);
+        if (IS_ERR(dev->backlight_dev)) {
+		ret =3D PTR_ERR(dev->backlight_dev);
=20
 		pr_err("Could not register toshiba backlight device\n");
-		toshiba_backlight_device =3D NULL;
-		toshiba_acpi_exit();
-		return ret;
+		dev->backlight_dev =3D NULL;
+		goto error;
 	}
=20
 	/* Register rfkill switch for Bluetooth */
-	if (hci_get_bt_present(&bt_present) =3D=3D HCI_SUCCESS && bt_present)=
 {
-		toshiba_acpi.bt_rfk =3D rfkill_alloc(toshiba_acpi.bt_name,
-						   &toshiba_acpi.p_dev->dev,
-						   RFKILL_TYPE_BLUETOOTH,
-						   &toshiba_rfk_ops,
-						   &toshiba_acpi);
-		if (!toshiba_acpi.bt_rfk) {
+	if (hci_get_bt_present(dev, &bt_present) =3D=3D HCI_SUCCESS && bt_pre=
sent) {
+		dev->bt_rfk =3D rfkill_alloc("Toshiba Bluetooth",
+					   &acpi_dev->dev,
+					   RFKILL_TYPE_BLUETOOTH,
+					   &toshiba_rfk_ops,
+					   dev);
+		if (!dev->bt_rfk) {
 			pr_err("unable to allocate rfkill device\n");
-			toshiba_acpi_exit();
-			return -ENOMEM;
+			ret =3D -ENOMEM;
+			goto error;
 		}
=20
-		ret =3D rfkill_register(toshiba_acpi.bt_rfk);
+		ret =3D rfkill_register(dev->bt_rfk);
 		if (ret) {
 			pr_err("unable to register rfkill device\n");
-			rfkill_destroy(toshiba_acpi.bt_rfk);
-			toshiba_acpi_exit();
-			return ret;
+			rfkill_destroy(dev->bt_rfk);
+			goto error;
 		}
 	}
=20
-	toshiba_acpi.illumination_installed =3D 0;
-	if (toshiba_illumination_available()) {
-		if (!led_classdev_register(&(toshiba_acpi.p_dev->dev),
-					   &toshiba_led))
-			toshiba_acpi.illumination_installed =3D 1;
+	if (toshiba_illumination_available(dev)) {
+		dev->led_dev.name =3D "toshiba::illumination";
+		dev->led_dev.max_brightness =3D 1;
+		dev->led_dev.brightness_set =3D toshiba_illumination_set;
+		dev->led_dev.brightness_get =3D toshiba_illumination_get;
+		if (!led_classdev_register(&acpi_dev->dev, &dev->led_dev))
+			dev->illumination_installed =3D 1;
 	}
=20
 	return 0;
+
+error:
+	toshiba_acpi_remove(acpi_dev, 0);
+	return ret;
+}
+
+static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 even=
t)
+{
+	struct toshiba_acpi_dev *dev =3D acpi_driver_data(acpi_dev);
+	u32 hci_result, value;
+
+	if (event !=3D 0x80)
+		return;
+	do {
+		hci_read1(dev, HCI_SYSTEM_EVENT, &value, &hci_result);
+		if (hci_result =3D=3D HCI_SUCCESS) {
+			if (value =3D=3D 0x100)
+				continue;
+			/* act on key press; ignore key release */
+			if (value & 0x80)
+				continue;
+
+			if (!sparse_keymap_report_event(dev->hotkey_dev,
+							value, 1, true)) {
+				pr_info("Unknown key %x\n",
+				       value);
+			}
+		} else if (hci_result =3D=3D HCI_NOT_SUPPORTED) {
+			/* This is a workaround for an unresolved issue on
+			 * some machines where system events sporadically
+			 * become disabled. */
+			hci_write1(dev, HCI_SYSTEM_EVENT, 1, &hci_result);
+			pr_notice("Re-enabled hotkeys\n");
+		}
+	} while (hci_result !=3D HCI_EMPTY);
+}
+
+
+static struct acpi_driver toshiba_acpi_driver =3D {
+	.name	=3D "Toshiba ACPI driver",
+	.owner	=3D THIS_MODULE,
+	.ids	=3D toshiba_device_ids,
+	.flags	=3D ACPI_DRIVER_ALL_NOTIFY_EVENTS,
+	.ops	=3D {
+		.add		=3D toshiba_acpi_add,
+		.remove		=3D toshiba_acpi_remove,
+		.notify		=3D toshiba_acpi_notify,
+	},
+};
+
+static int __init toshiba_acpi_init(void)
+{
+	int ret;
+
+	toshiba_proc_dir =3D proc_mkdir(PROC_TOSHIBA, acpi_root_dir);
+	if (!toshiba_proc_dir) {
+		pr_err("Unable to create proc dir " PROC_TOSHIBA "\n");
+		return -ENODEV;
+	}
+
+	ret =3D acpi_bus_register_driver(&toshiba_acpi_driver);
+	if (ret) {
+		pr_err("Failed to register ACPI driver: %d\n", ret);
+		remove_proc_entry(PROC_TOSHIBA, acpi_root_dir);
+	}
+
+	return ret;
+}
+
+static void __exit toshiba_acpi_exit(void)
+{
+	acpi_bus_unregister_driver(&toshiba_acpi_driver);
+	if (toshiba_proc_dir)
+		remove_proc_entry(PROC_TOSHIBA, acpi_root_dir);
 }
=20
 module_init(toshiba_acpi_init);
--=20
1.7.4.1
