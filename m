From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: toshiba_acpi.c: Full TOS1900 device support
Date: Mon, 6 Dec 2010 10:41:15 -0700
Message-ID: <AANLkTinqv+UGn_BopA=oET+255tvUfCZKd5_y_NWHyBZ@mail.gmail.com>
References: <AANLkTikff5b9zhCLEmyoHZPTPaREuHE1qp21SLA0v=83@mail.gmail.com>
	<20101026192028.GA17880@srcf.ucam.org>
	<AANLkTinmsNzAkp_ZGcaNyVRVMu0Rc4-C+xPKuSOS5jRJ@mail.gmail.com>
	<20101027192913.GA14828@srcf.ucam.org>
	<AANLkTin94udpwFkH+yqH95fu9Q=WCu2u80_DaHHp+zyR@mail.gmail.com>
	<20101124191711.GA6198@srcf.ucam.org>
	<AANLkTinaR4MbArfs20xLZMUjTa32sSLZfzRrnApgiGqS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinaR4MbArfs20xLZMUjTa32sSLZfzRrnApgiGqS@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Matthew,

Here's the v3 of the patch with your changes and adapted to devices
with SPFC method, also added the Toshiba Software Configuration
Interface (SCI) registers and functions (which Illumination uses).


--- toshiba_acpi.c	2010-12-06 10:32:17.197704744 -0700
+++ toshiba_acpi.c	2010-12-05 17:23:24.745438137 -0700
@@ -5,6 +5,7 @@
  *  Copyright (C) 2002-2004 John Belmonte
  *  Copyright (C) 2008 Philip Langdale
  *  Copyright (C) 2010 Pierre Ducroquet
+ *  Copyright (C) 2010 Azael Avalos
  *
  *  This program is free software; you can redistribute it and/or modi=
fy
  *  it under the terms of the GNU General Public License as published =
by
@@ -35,7 +36,7 @@
  *
  */

-#define TOSHIBA_ACPI_VERSION	"0.19"
+#define TOSHIBA_ACPI_VERSION	"0.20"
 #define PROC_INTERFACE_VERSION	1

 #include <linux/kernel.h>
@@ -48,8 +49,12 @@
 #include <linux/platform_device.h>
 #include <linux/rfkill.h>
 #include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
+#include <linux/sysdev.h>
+#include <linux/workqueue.h>
+#include <linux/i8042.h>

 #include <asm/uaccess.h>

@@ -65,11 +70,9 @@
 #define MY_INFO KERN_INFO MY_LOGPREFIX

 /* Toshiba ACPI method paths */
-#define METHOD_LCD_BRIGHTNESS	"\\_SB_.PCI0.VGA_.LCD_._BCM"
-#define TOSH_INTERFACE_1	"\\_SB_.VALD"
-#define TOSH_INTERFACE_2	"\\_SB_.VALZ"
 #define METHOD_VIDEO_OUT	"\\_SB_.VALX.DSSX"
-#define GHCI_METHOD		".GHCI"
+
+#define TOSHIBA_FN_SCAN                0x6e

 /* Toshiba HCI interface definitions
  *
@@ -83,23 +86,37 @@

 #define HCI_WORDS			6

-/* operations */
+/* HCI operations */
 #define HCI_SET				0xff00
 #define HCI_GET				0xfe00
+/* SCI operations */
+#define SCI_SUPPORT_CHECK		0xf000
+#define SCI_OPEN			0xf100
+#define SCI_CLOSE			0xf200
+#define SCI_SET				0xf400
+#define SCI_GET				0xf300

-/* return codes */
+/* HCI return codes */
 #define HCI_SUCCESS			0x0000
 #define HCI_FAILURE			0x1000
 #define HCI_NOT_SUPPORTED		0x8000
 #define HCI_EMPTY			0x8c00
+/* SCI return codes */
+#define SCI_NOT_SUPPORTED		HCI_NOT_SUPPORTED
+#define SCI_ALREADY_OPEN		0x8100
+#define SCI_NOT_OPENED			0x8200
+#define SCI_NOT_PRESENT			0x8600
+#define SCI_NOT_INSTALLED		0x8e00

-/* registers */
+/* HCI registers */
 #define HCI_FAN				0x0004
 #define HCI_SYSTEM_EVENT		0x0016
 #define HCI_VIDEO_OUT			0x001c
 #define HCI_HOTKEY_EVENT		0x001e
 #define HCI_LCD_BRIGHTNESS		0x002a
 #define HCI_WIRELESS			0x0056
+/* SCI registers */
+#define SCI_ILLUMINATION		0x014e

 /* field definitions */
 #define HCI_LCD_BRIGHTNESS_BITS		3
@@ -113,44 +130,77 @@
 #define HCI_WIRELESS_BT_ATTACH		0x40
 #define HCI_WIRELESS_BT_POWER		0x80

+struct acpi_ec {
+	acpi_handle handle;
+	unsigned long gpe;
+	unsigned long command_addr;
+	unsigned long data_addr;
+	unsigned long global_lock;
+	unsigned long flags;
+	struct mutex lock;
+	wait_queue_head_t wait;
+	struct list_head list;
+	struct transaction *curr;
+	spinlock_t curr_lock;
+	struct sys_device sysdev;
+};
+
+extern struct acpi_ec *first_ec;
+
+struct toshiba_acpi_dev {
+	struct platform_device *p_dev;
+	struct acpi_device *acpi_dev;
+	struct rfkill *bt_rfk;
+	struct input_dev *hotkey_dev;
+	struct work_struct hotkey_work;
+	int illumination_installed;
+	acpi_handle handle;
+
+	int hci_type;
+	char *hci_method;
+
+	const char *bt_name;
+
+	struct mutex mutex;
+};
+
+static struct toshiba_acpi_dev toshiba_acpi =3D {
+	.bt_name =3D "Toshiba Bluetooth",
+};
+
 static const struct acpi_device_id toshiba_device_ids[] =3D {
 	{"TOS6200", 0},
 	{"TOS6208", 0},
-	{"TOS1900", 0},
+	{"TOS1900", 1},
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, toshiba_device_ids);

-struct key_entry {
-	char type;
-	u16 code;
-	u16 keycode;
-};
-
-enum {KE_KEY, KE_END};
-
 static struct key_entry toshiba_acpi_keymap[]  =3D {
-	{KE_KEY, 0x101, KEY_MUTE},
-	{KE_KEY, 0x102, KEY_ZOOMOUT},
-	{KE_KEY, 0x103, KEY_ZOOMIN},
-	{KE_KEY, 0x13b, KEY_COFFEE},
-	{KE_KEY, 0x13c, KEY_BATTERY},
-	{KE_KEY, 0x13d, KEY_SLEEP},
-	{KE_KEY, 0x13e, KEY_SUSPEND},
-	{KE_KEY, 0x13f, KEY_SWITCHVIDEOMODE},
-	{KE_KEY, 0x140, KEY_BRIGHTNESSDOWN},
-	{KE_KEY, 0x141, KEY_BRIGHTNESSUP},
-	{KE_KEY, 0x142, KEY_WLAN},
-	{KE_KEY, 0x143, KEY_PROG1},
-	{KE_KEY, 0xb05, KEY_PROG2},
-	{KE_KEY, 0xb06, KEY_WWW},
-	{KE_KEY, 0xb07, KEY_MAIL},
-	{KE_KEY, 0xb30, KEY_STOP},
-	{KE_KEY, 0xb31, KEY_PREVIOUSSONG},
-	{KE_KEY, 0xb32, KEY_NEXTSONG},
-	{KE_KEY, 0xb33, KEY_PLAYPAUSE},
-	{KE_KEY, 0xb5a, KEY_MEDIA},
-	{KE_END, 0, 0},
+	{KE_KEY, 0x100, { KEY_FN } },
+	{KE_KEY, 0x101, { KEY_MUTE } },
+	{KE_KEY, 0x102, { KEY_ZOOMOUT } },
+	{KE_KEY, 0x103, { KEY_ZOOMIN } },
+	{KE_KEY, 0x139, { KEY_ZOOMRESET } },
+	{KE_KEY, 0x13b, { KEY_COFFEE } },
+	{KE_KEY, 0x13c, { KEY_BATTERY } },
+	{KE_KEY, 0x13d, { KEY_SLEEP } },
+	{KE_KEY, 0x13e, { KEY_SUSPEND } },
+	{KE_KEY, 0x13f, { KEY_SWITCHVIDEOMODE } },
+	{KE_KEY, 0x140, { KEY_BRIGHTNESSDOWN } },
+	{KE_KEY, 0x141, { KEY_BRIGHTNESSUP } },
+	{KE_KEY, 0x142, { KEY_WLAN } },
+	{KE_KEY, 0x143, { KEY_PROG1 } },
+	{KE_KEY, 0x17f, { KEY_FN } },
+	{KE_KEY, 0xb05, { KEY_PROG2 } },
+	{KE_KEY, 0xb06, { KEY_WWW } },
+	{KE_KEY, 0xb07, { KEY_MAIL } },
+	{KE_KEY, 0xb30, { KEY_STOP } },
+	{KE_KEY, 0xb31, { KEY_PREVIOUSSONG } },
+	{KE_KEY, 0xb32, { KEY_NEXTSONG } },
+	{KE_KEY, 0xb33, { KEY_PLAYPAUSE } },
+	{KE_KEY, 0xb5a, { KEY_MEDIA } },
+	{KE_END, 0},
 };

 /* utility
@@ -164,15 +214,6 @@
 /* acpi interface wrappers
  */

-static int is_valid_acpi_path(const char *methodName)
-{
-	acpi_handle handle;
-	acpi_status status;
-
-	status =3D acpi_get_handle(NULL, (char *)methodName, &handle);
-	return !ACPI_FAILURE(status);
-}
-
 static int write_acpi_int(const char *methodName, int val)
 {
 	struct acpi_object_list params;
@@ -185,27 +226,8 @@
 	in_objs[0].integer.value =3D val;

 	status =3D acpi_evaluate_object(NULL, (char *)methodName, &params, NU=
LL);
-	return (status =3D=3D AE_OK);
-}
-
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
+	return (ACPI_SUCCESS(status));
 }
-#endif
-
-static const char *method_hci /*=3D 0*/ ;

 /* Perform a raw HCI call.  Here we don't care about input or output b=
uffer
  * format.
@@ -229,9 +251,10 @@
 	results.length =3D sizeof(out_objs);
 	results.pointer =3D out_objs;

-	status =3D acpi_evaluate_object(NULL, (char *)method_hci, &params,
-				      &results);
-	if ((status =3D=3D AE_OK) && (out_objs->package.count <=3D HCI_WORDS)=
) {
+	status =3D acpi_evaluate_object(toshiba_acpi.acpi_dev->handle,
+				      toshiba_acpi.hci_method,
+				      &params, &results);
+	if ((ACPI_SUCCESS(status)) && (out_objs->package.count <=3D HCI_WORDS=
)) {
 		for (i =3D 0; i < out_objs->package.count; ++i) {
 			out[i] =3D out_objs->package.elements[i].integer.value;
 		}
@@ -270,7 +293,7 @@
 	u32 in[HCI_WORDS] =3D { HCI_SET, reg, in1, in2, 0, 0 };
 	u32 out[HCI_WORDS];
 	acpi_status status =3D hci_raw(in, out);
-	*result =3D (status =3D=3D AE_OK) ? out[0] : HCI_FAILURE;
+	*result =3D (ACPI_SUCCESS(status)) ? out[0] : HCI_FAILURE;
 	return status;
 }

@@ -281,38 +304,82 @@
 	acpi_status status =3D hci_raw(in, out);
 	*out1 =3D out[2];
 	*out2 =3D out[3];
-	*result =3D (status =3D=3D AE_OK) ? out[0] : HCI_FAILURE;
+	*result =3D (ACPI_SUCCESS(status)) ? out[0] : HCI_FAILURE;
 	return status;
 }

-struct toshiba_acpi_dev {
-	struct platform_device *p_dev;
-	struct rfkill *bt_rfk;
-	struct input_dev *hotkey_dev;
-	int illumination_installed;
-	acpi_handle handle;
+static int sci_present(void)
+{
+	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];

-	const char *bt_name;
+	/* Check system for SCI support */
+	in[0] =3D SCI_SUPPORT_CHECK;
+	hci_raw(in, out);
+	if (out[0] =3D=3D SCI_NOT_PRESENT) {
+		printk(MY_INFO "Toshiba SCI not available\n");
+		return 0;
+	}

-	struct mutex mutex;
-};
+	return 1;
+}
+
+static int sci_open(void)
+{
+	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+
+	if (!sci_present())
+		return HCI_FAILURE;
+
+	in[0] =3D SCI_OPEN;
+	hci_raw(in, out);
+	if (out[0] =3D=3D SCI_ALREADY_OPEN) {
+		printk(MY_NOTICE "Toshiba SCI already opened\n");
+		return HCI_SUCCESS;
+	}
+
+	return out[0];
+}
+
+static int sci_close(void)
+{
+	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+
+	if (!sci_present())
+		return HCI_FAILURE;
+
+	in[0] =3D SCI_CLOSE;
+	hci_raw(in, out);
+	if (out[0] =3D=3D SCI_NOT_OPENED)
+		printk(MY_INFO "Toshiba SCI not opened\n");
+
+	return out[0];
+}

 /* Illumination support */
 static int toshiba_illumination_available(void)
 {
 	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
-	acpi_status status;
+	int ret;

-	in[0] =3D 0xf100;
-	status =3D hci_raw(in, out);
-	if (ACPI_FAILURE(status)) {
+	ret =3D sci_open();
+	if (ret =3D=3D HCI_FAILURE) {
 		printk(MY_INFO "Illumination device not available\n");
 		return 0;
 	}
-	in[0] =3D 0xf400;
-	status =3D hci_raw(in, out);
-	return 1;
+
+	in[0] =3D SCI_GET;
+	in[1] =3D SCI_ILLUMINATION;
+	hci_raw(in, out);
+	if (out[0] =3D=3D HCI_SUCCESS)
+		return 1;
+
+	printk(MY_INFO "Illumination device not available\n");
+
+	return 0;
 }

 static void toshiba_illumination_set(struct led_classdev *cdev,
@@ -320,77 +387,41 @@
 {
 	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
-	acpi_status status;

-	/* First request : initialize communication. */
-	in[0] =3D 0xf100;
-	status =3D hci_raw(in, out);
-	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Illumination device not available\n");
+	in[0] =3D SCI_SET;
+	in[1] =3D SCI_ILLUMINATION;
+	/* Switch the illumination on/off */
+	in[2] =3D (brightness) ? 1 : 0;
+	hci_raw(in, out);
+	if (out[0] =3D=3D HCI_FAILURE) {
+		printk(MY_ERR "ACPI call for illumination failed.\n");
 		return;
-	}
-
-	if (brightness) {
-		/* Switch the illumination on */
-		in[0] =3D 0xf400;
-		in[1] =3D 0x14e;
-		in[2] =3D 1;
-		status =3D hci_raw(in, out);
-		if (ACPI_FAILURE(status)) {
-			printk(MY_INFO "ACPI call for illumination failed.\n");
-			return;
-		}
-	} else {
-		/* Switch the illumination off */
-		in[0] =3D 0xf400;
-		in[1] =3D 0x14e;
-		in[2] =3D 0;
-		status =3D hci_raw(in, out);
-		if (ACPI_FAILURE(status)) {
-			printk(MY_INFO "ACPI call for illumination failed.\n");
-			return;
-		}
-	}
+	} else if (out[0] =3D=3D SCI_NOT_SUPPORTED)
+		printk(MY_INFO "Illumination not supported\n");

-	/* Last request : close communication. */
-	in[0] =3D 0xf200;
-	in[1] =3D 0;
-	in[2] =3D 0;
-	hci_raw(in, out);
+	return;
 }

 static enum led_brightness toshiba_illumination_get(struct led_classde=
v *cdev)
 {
 	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
-	acpi_status status;
 	enum led_brightness result;

-	/*=C3=82 First request : initialize communication. */
-	in[0] =3D 0xf100;
-	status =3D hci_raw(in, out);
-	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Illumination device not available\n");
-		return LED_OFF;
-	}
-
+	in[0] =3D SCI_GET;
+	in[1] =3D SCI_ILLUMINATION;
 	/* Check the illumination */
-	in[0] =3D 0xf300;
-	in[1] =3D 0x14e;
-	status =3D hci_raw(in, out);
-	if (ACPI_FAILURE(status)) {
+	hci_raw(in, out);
+	if (out[0] =3D=3D HCI_FAILURE) {
 		printk(MY_INFO "ACPI call for illumination failed.\n");
 		return LED_OFF;
+	} else if (out[0] =3D=3D SCI_NOT_SUPPORTED) {
+		printk(MY_INFO "Illumination not supported\n");
+		return LED_OFF;
 	}

 	result =3D out[2] ? LED_FULL : LED_OFF;

-	/* Last request : close communication. */
-	in[0] =3D 0xf200;
-	in[1] =3D 0;
-	in[2] =3D 0;
-	hci_raw(in, out);
-
 	return result;
 }

@@ -401,10 +432,6 @@
 	.brightness_get =3D toshiba_illumination_get,
 };

-static struct toshiba_acpi_dev toshiba_acpi =3D {
-	.bt_name =3D "Toshiba Bluetooth",
-};
-
 /* Bluetooth rfkill handlers */

 static u32 hci_get_bt_present(bool *present)
@@ -848,93 +875,128 @@
 }

 static struct backlight_ops toshiba_backlight_data =3D {
-        .get_brightness =3D get_lcd,
-        .update_status  =3D set_lcd_status,
+	  .get_brightness =3D get_lcd,
+	  .update_status  =3D set_lcd_status,
 };

-static struct key_entry *toshiba_acpi_get_entry_by_scancode(unsigned i=
nt code)
+static acpi_status execute_acpi_method(acpi_handle handle, char *metho=
d,
+                                      const int *param, int *result)
 {
-	struct key_entry *key;
+	struct acpi_object_list args_list;
+	struct acpi_buffer buff;
+	union acpi_object in_obj, out_obj;
+	acpi_status status;

-	for (key =3D toshiba_acpi_keymap; key->type !=3D KE_END; key++)
-		if (code =3D=3D key->code)
-			return key;
+	if (param) {
+		args_list.count =3D 1;
+		args_list.pointer =3D &in_obj;
+		in_obj.type =3D ACPI_TYPE_INTEGER;
+		in_obj.integer.value =3D *param;
+	} else {
+		args_list.count =3D 0;
+	}

-	return NULL;
+	buff.length =3D sizeof(out_obj);
+	buff.pointer =3D &out_obj;
+
+	status =3D acpi_evaluate_object(handle, method, &args_list, &buff);
+	if (ACPI_FAILURE(status)) {
+		printk(MY_ERR
+			"ACPI method (%s) execution failed\n", method);
+		return -EINVAL;
+	}
+
+	if (!result)
+		return status;
+
+	if (out_obj.type !=3D ACPI_TYPE_INTEGER) {
+		printk(MY_ERR
+			"ACPI method result is not a number\n");
+		return -EINVAL;
+	}
+
+	*result =3D out_obj.integer.value;
+	return status;
 }

-static struct key_entry *toshiba_acpi_get_entry_by_keycode(unsigned in=
t code)
+static bool toshiba_i8042_filter(unsigned char data, unsigned char str=
,
+                                struct serio *port)
 {
-	struct key_entry *key;
+	if (str & 0x20)
+		return false;

-	for (key =3D toshiba_acpi_keymap; key->type !=3D KE_END; key++)
-		if (code =3D=3D key->keycode && key->type =3D=3D KE_KEY)
-			return key;
+	if (unlikely(data =3D=3D 0xe0))
+		return false;

-	return NULL;
+	if ((data & 0x7f) =3D=3D TOSHIBA_FN_SCAN) {
+		schedule_work(&toshiba_acpi.hotkey_work);
+		return true;
+	}
+
+	return false;
 }

-static int toshiba_acpi_getkeycode(struct input_dev *dev,
-				   unsigned int scancode, unsigned int *keycode)
+static int toshiba_acpi_query_event(int *hotkey)
 {
-	struct key_entry *key =3D toshiba_acpi_get_entry_by_scancode(scancode=
);
+	acpi_status status;

-	if (key && key->type =3D=3D KE_KEY) {
-		*keycode =3D key->keycode;
-		return 0;
+	if (!first_ec) {
+		printk(MY_ERR "No EC device available\n");
+		return -ENODEV;
 	}

-	return -EINVAL;
+	status =3D execute_acpi_method(first_ec->handle, "NTFY", NULL, NULL);
+	if (ACPI_FAILURE(status)) {
+		printk(MY_ERR "Unable to query EC\n");
+		return -EIO;
+	}
+
+	status =3D execute_acpi_method(toshiba_acpi.acpi_dev->handle, "INFO",
+				    NULL, hotkey);
+	if (ACPI_FAILURE(status)) {
+		printk(MY_ERR "Unable to request hotkey from EC\n");
+		return -EIO;
+	}
+
+	return 0;
 }

-static int toshiba_acpi_setkeycode(struct input_dev *dev,
-				   unsigned int scancode, unsigned int keycode)
+static void toshiba_report_input_event(int value)
 {
-	struct key_entry *key;
-	unsigned int old_keycode;
+	if (value =3D=3D 0x100)
+               return;

-	key =3D toshiba_acpi_get_entry_by_scancode(scancode);
-	if (key && key->type =3D=3D KE_KEY) {
-		old_keycode =3D key->keycode;
-		key->keycode =3D keycode;
-		set_bit(keycode, dev->keybit);
-		if (!toshiba_acpi_get_entry_by_keycode(old_keycode))
-			clear_bit(old_keycode, dev->keybit);
-		return 0;
+	/* act on key press; ignore key release */
+	if (value & 0x80)
+		return;
+
+	if (!sparse_keymap_report_event(toshiba_acpi.hotkey_dev, value, 1,
+					true)) {
+		printk(MY_INFO "Unknown key %x\n", value);
 	}
+}

-	return -EINVAL;
+static void toshiba_acpi_work(struct work_struct *work)
+{
+	int hotkey;
+
+	if (toshiba_acpi_query_event(&hotkey))
+		printk(MY_ERR "Failed to get hotkey events\n");
+	else
+		toshiba_report_input_event(hotkey);
 }

-static void toshiba_acpi_notify(acpi_handle handle, u32 event, void *c=
ontext)
+static void toshiba_acpi_notify(struct acpi_device *device, u32 event)
 {
 	u32 hci_result, value;
-	struct key_entry *key;

-	if (event !=3D 0x80)
+	if (event !=3D 0x80 || toshiba_acpi.hci_type =3D=3D 2)
 		return;
+
 	do {
 		hci_read1(HCI_SYSTEM_EVENT, &value, &hci_result);
 		if (hci_result =3D=3D HCI_SUCCESS) {
-			if (value =3D=3D 0x100)
-				continue;
-			/* act on key press; ignore key release */
-			if (value & 0x80)
-				continue;
-
-			key =3D toshiba_acpi_get_entry_by_scancode
-				(value);
-			if (!key) {
-				printk(MY_INFO "Unknown key %x\n",
-				       value);
-				continue;
-			}
-			input_report_key(toshiba_acpi.hotkey_dev,
-					 key->keycode, 1);
-			input_sync(toshiba_acpi.hotkey_dev);
-			input_report_key(toshiba_acpi.hotkey_dev,
-					 key->keycode, 0);
-			input_sync(toshiba_acpi.hotkey_dev);
+			toshiba_report_input_event(value);
 		} else if (hci_result =3D=3D HCI_NOT_SUPPORTED) {
 			/* This is a workaround for an unresolved issue on
 			 * some machines where system events sporadically
@@ -945,64 +1007,94 @@
 	} while (hci_result !=3D HCI_EMPTY);
 }

-static int toshiba_acpi_setup_keyboard(char *device)
+static int __init toshiba_acpi_setup_keyboard(void)
 {
 	acpi_status status;
-	acpi_handle handle;
-	int result;
-	const struct key_entry *key;
+	int error;

-	status =3D acpi_get_handle(NULL, device, &handle);
-	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Unable to get notification device\n");
-		return -ENODEV;
+	toshiba_acpi.hotkey_dev =3D input_allocate_device();
+	if (!toshiba_acpi.hotkey_dev) {
+		printk(MY_INFO "Unable to register input device\n");
+		return -ENOMEM;
 	}

-	toshiba_acpi.handle =3D handle;
+	toshiba_acpi.hotkey_dev->name =3D "Toshiba input device";
+	toshiba_acpi.hotkey_dev->phys =3D "acpi/toshiba";
+	toshiba_acpi.hotkey_dev->id.bustype =3D BUS_HOST;

-	status =3D acpi_evaluate_object(handle, "ENAB", NULL, NULL);
-	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Unable to enable hotkeys\n");
-		return -ENODEV;
+	error =3D sparse_keymap_setup(toshiba_acpi.hotkey_dev,
+			  toshiba_acpi_keymap, NULL);
+	if (error)
+		goto err_free_dev;
+
+	if (toshiba_acpi.hci_type =3D=3D 2) {
+		error =3D i8042_install_filter(toshiba_i8042_filter);
+		if (error) {
+			printk(MY_ERR "Unable to install key filter\n");
+			goto err_free_keymap;
+		}
+
+		INIT_WORK(&toshiba_acpi.hotkey_work, toshiba_acpi_work);
 	}

-	status =3D acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
-					      toshiba_acpi_notify, NULL);
+	status =3D acpi_evaluate_object(toshiba_acpi.acpi_dev->handle, "ENAB"=
,
+				      NULL, NULL);
 	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Unable to install hotkey notification\n");
-		return -ENODEV;
+		printk(MY_INFO "Unable to enable hotkeys\n");
+		error =3D -ENODEV;
+		goto err_free_keymap;
 	}

-	toshiba_acpi.hotkey_dev =3D input_allocate_device();
-	if (!toshiba_acpi.hotkey_dev) {
+	error =3D input_register_device(toshiba_acpi.hotkey_dev);
+	if (error) {
 		printk(MY_INFO "Unable to register input device\n");
-		return -ENOMEM;
+		 goto err_free_keymap;
 	}

-	toshiba_acpi.hotkey_dev->name =3D "Toshiba input device";
-	toshiba_acpi.hotkey_dev->phys =3D device;
-	toshiba_acpi.hotkey_dev->id.bustype =3D BUS_HOST;
-	toshiba_acpi.hotkey_dev->getkeycode =3D toshiba_acpi_getkeycode;
-	toshiba_acpi.hotkey_dev->setkeycode =3D toshiba_acpi_setkeycode;
+	return 0;

-	for (key =3D toshiba_acpi_keymap; key->type !=3D KE_END; key++) {
-		set_bit(EV_KEY, toshiba_acpi.hotkey_dev->evbit);
-		set_bit(key->keycode, toshiba_acpi.hotkey_dev->keybit);
+err_free_keymap:
+	if (toshiba_acpi.hci_type =3D=3D 2)
+		i8042_remove_filter(toshiba_i8042_filter);
+err_free_dev:
+	input_free_device(toshiba_acpi.hotkey_dev);
+	toshiba_acpi.hotkey_dev =3D NULL;
+	return error;
+}
+
+static int find_hci_method(void)
+{
+	acpi_status status;
+	acpi_handle handle;
+
+	status =3D acpi_get_handle(toshiba_acpi.acpi_dev->handle,
+				 "GHCI", &handle);
+	if (ACPI_SUCCESS(status)) {
+		toshiba_acpi.hci_type =3D 1;
+		toshiba_acpi.hci_method =3D "GHCI";
+		return 0;
 	}

-	result =3D input_register_device(toshiba_acpi.hotkey_dev);
-	if (result) {
-		printk(MY_INFO "Unable to register input device\n");
-		return result;
+	status =3D acpi_get_handle(toshiba_acpi.acpi_dev->handle,
+				 "SPFC", &handle);
+	if (ACPI_SUCCESS(status)) {
+		toshiba_acpi.hci_type =3D 2;
+		toshiba_acpi.hci_method =3D "SPFC";
+		return 0;
 	}

-	return 0;
+	toshiba_acpi.hci_type =3D 0;
+	toshiba_acpi.hci_method =3D NULL;
+
+	return 1;
 }

-static void toshiba_acpi_exit(void)
+static void toshiba_acpi_cleanup(void)
 {
-	if (toshiba_acpi.hotkey_dev)
+	if (toshiba_acpi.hotkey_dev) {
 		input_unregister_device(toshiba_acpi.hotkey_dev);
+		sparse_keymap_free(toshiba_acpi.hotkey_dev);
+	}

 	if (toshiba_acpi.bt_rfk) {
 		rfkill_unregister(toshiba_acpi.bt_rfk);
@@ -1017,69 +1109,67 @@
 	if (toshiba_proc_dir)
 		remove_proc_entry(PROC_TOSHIBA, acpi_root_dir);

-	acpi_remove_notify_handler(toshiba_acpi.handle, ACPI_DEVICE_NOTIFY,
-				   toshiba_acpi_notify);
-
-	if (toshiba_acpi.illumination_installed)
+	if (toshiba_acpi.illumination_installed) {
 		led_classdev_unregister(&toshiba_led);
-
-	platform_device_unregister(toshiba_acpi.p_dev);
+		sci_close();
+	}

 	return;
 }

-static int __init toshiba_acpi_init(void)
+static int toshiba_acpi_remove(struct acpi_device *device, int type)
+{
+	if (toshiba_acpi.hci_type =3D=3D 2)
+		i8042_remove_filter(toshiba_i8042_filter);
+
+	toshiba_acpi_cleanup();
+
+	return 0;
+}
+
+static int __devinit toshiba_acpi_add(struct acpi_device *device)
 {
 	u32 hci_result;
 	bool bt_present;
 	int ret =3D 0;
 	struct backlight_properties props;

-	if (acpi_disabled)
-		return -ENODEV;
-
-	/* simple device detection: look for HCI method */
-	if (is_valid_acpi_path(TOSH_INTERFACE_1 GHCI_METHOD)) {
-		method_hci =3D TOSH_INTERFACE_1 GHCI_METHOD;
-		if (toshiba_acpi_setup_keyboard(TOSH_INTERFACE_1))
-			printk(MY_INFO "Unable to activate hotkeys\n");
-	} else if (is_valid_acpi_path(TOSH_INTERFACE_2 GHCI_METHOD)) {
-		method_hci =3D TOSH_INTERFACE_2 GHCI_METHOD;
-		if (toshiba_acpi_setup_keyboard(TOSH_INTERFACE_2))
-			printk(MY_INFO "Unable to activate hotkeys\n");
-	} else
-		return -ENODEV;
-
 	printk(MY_INFO "Toshiba Laptop ACPI Extras version %s\n",
 	       TOSHIBA_ACPI_VERSION);
-	printk(MY_INFO "    HCI method: %s\n", method_hci);

 	mutex_init(&toshiba_acpi.mutex);

-	toshiba_acpi.p_dev =3D platform_device_register_simple("toshiba_acpi"=
,
-							      -1, NULL, 0);
-	if (IS_ERR(toshiba_acpi.p_dev)) {
-		ret =3D PTR_ERR(toshiba_acpi.p_dev);
-		printk(MY_ERR "unable to register platform device\n");
-		toshiba_acpi.p_dev =3D NULL;
-		toshiba_acpi_exit();
+	force_fan =3D 0;
+	key_event_valid =3D 0;
+
+	toshiba_acpi.acpi_dev =3D device;
+
+	ret =3D find_hci_method();
+	if (ret) {
+		printk(MY_INFO "HCI interface not found\n");
 		return ret;
 	}

-	force_fan =3D 0;
-	key_event_valid =3D 0;
+	ret =3D toshiba_acpi_setup_keyboard();
+	if (ret) {
+		printk(MY_ERR "Unable to setup hotkeys\n");
+		return ret;
+	}

 	/* enable event fifo */
 	hci_write1(HCI_SYSTEM_EVENT, 1, &hci_result);
+	/* enable hotkey event */
+	hci_write1(HCI_HOTKEY_EVENT, 1, &hci_result);

 	toshiba_proc_dir =3D proc_mkdir(PROC_TOSHIBA, acpi_root_dir);
 	if (!toshiba_proc_dir) {
-		toshiba_acpi_exit();
-		return -ENODEV;
+		ret =3D -ENODEV;
+		goto out;
 	} else {
 		create_toshiba_proc_entries();
 	}

+	memset(&props, 0, sizeof(struct backlight_properties));
 	props.max_brightness =3D HCI_LCD_BRIGHTNESS_LEVELS - 1;
 	toshiba_backlight_device =3D backlight_device_register("toshiba",
 							     &toshiba_acpi.p_dev->dev,
@@ -1091,8 +1181,7 @@

 		printk(KERN_ERR "Could not register toshiba backlight device\n");
 		toshiba_backlight_device =3D NULL;
-		toshiba_acpi_exit();
-		return ret;
+		goto out;
 	}

 	/* Register rfkill switch for Bluetooth */
@@ -1104,16 +1193,15 @@
 						   &toshiba_acpi);
 		if (!toshiba_acpi.bt_rfk) {
 			printk(MY_ERR "unable to allocate rfkill device\n");
-			toshiba_acpi_exit();
-			return -ENOMEM;
+			ret =3D -ENOMEM;
+			goto out;
 		}

 		ret =3D rfkill_register(toshiba_acpi.bt_rfk);
 		if (ret) {
 			printk(MY_ERR "unable to register rfkill device\n");
 			rfkill_destroy(toshiba_acpi.bt_rfk);
-			toshiba_acpi_exit();
-			return ret;
+			goto out;
 		}
 	}

@@ -1124,7 +1212,48 @@
 			toshiba_acpi.illumination_installed =3D 1;
 	}

-	return 0;
+out:
+	if (ret)
+		toshiba_acpi_cleanup();
+	return ret;
+}
+
+static struct acpi_driver toshiba_acpi_driver =3D {
+	.name =3D "Toshiba ACPI driver",
+	.owner =3D THIS_MODULE,
+	.ids =3D toshiba_device_ids,
+	.flags =3D ACPI_DRIVER_ALL_NOTIFY_EVENTS,
+	.ops =3D {
+		.add =3D toshiba_acpi_add,
+		.remove =3D toshiba_acpi_remove,
+		.notify =3D toshiba_acpi_notify,
+	}
+};
+
+static int __init toshiba_acpi_init(void)
+{
+	int ret;
+
+	toshiba_acpi.p_dev =3D platform_device_register_simple("toshiba_acpi"=
,
+							     -1, NULL, 0);
+	if (IS_ERR(toshiba_acpi.p_dev)) {
+		printk(MY_ERR "unable to register platform device\n");
+		return PTR_ERR(toshiba_acpi.p_dev);
+	}
+
+	ret =3D acpi_bus_register_driver(&toshiba_acpi_driver);
+	if (ret) {
+		printk(MY_ERR "unable to register acpi driver\n");
+		platform_device_unregister(toshiba_acpi.p_dev);
+	}
+
+	return ret;
+}
+
+static void __exit toshiba_acpi_exit(void)
+{
+	acpi_bus_unregister_driver(&toshiba_acpi_driver);
+	platform_device_unregister(toshiba_acpi.p_dev);
 }

 module_init(toshiba_acpi_init);



--=20
-- El mundo apesta y vosotros apestais tambien --
