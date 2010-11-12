From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: toshiba_acpi.c: Full TOS1900 device support
Date: Thu, 11 Nov 2010 17:10:38 -0700
Message-ID: <AANLkTin94udpwFkH+yqH95fu9Q=WCu2u80_DaHHp+zyR@mail.gmail.com>
References: <AANLkTikff5b9zhCLEmyoHZPTPaREuHE1qp21SLA0v=83@mail.gmail.com>
	<20101026192028.GA17880@srcf.ucam.org>
	<AANLkTinmsNzAkp_ZGcaNyVRVMu0Rc4-C+xPKuSOS5jRJ@mail.gmail.com>
	<20101027192913.GA14828@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:51269 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751360Ab0KLAKk convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Nov 2010 19:10:40 -0500
In-Reply-To: <20101027192913.GA14828@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Ok, take two, here goes the patch again for review, took me a bit to
figure it out what to do with the raw data from i8042_install_filter, b=
ut
here it is:


--- toshiba_acpi.c	2010-10-26 12:54:00.868913701 -0600
+++ toshiba_new/toshiba_acpi.c	2010-11-11 17:09:55.652960623 -0700
@@ -35,7 +35,7 @@
  *
  */

-#define TOSHIBA_ACPI_VERSION	"0.19"
+#define TOSHIBA_ACPI_VERSION	"0.20"
 #define PROC_INTERFACE_VERSION	1

 #include <linux/kernel.h>
@@ -48,8 +48,12 @@
 #include <linux/platform_device.h>
 #include <linux/rfkill.h>
 #include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
+#include <linux/pci.h>
+#include <linux/workqueue.h>
+#include <linux/i8042.h>

 #include <asm/uaccess.h>

@@ -65,11 +69,18 @@
 #define MY_INFO KERN_INFO MY_LOGPREFIX

 /* Toshiba ACPI method paths */
-#define METHOD_LCD_BRIGHTNESS	"\\_SB_.PCI0.VGA_.LCD_._BCM"
 #define TOSH_INTERFACE_1	"\\_SB_.VALD"
 #define TOSH_INTERFACE_2	"\\_SB_.VALZ"
 #define METHOD_VIDEO_OUT	"\\_SB_.VALX.DSSX"
 #define GHCI_METHOD		".GHCI"
+#define SPFC_METHOD		".SPFC"
+#define EVENTS_METHOD		"INFO"
+#define EC_INTERFACE_1		"\\_SB.PCI0.LPC.EC0"
+#define EC_INTERFACE_2		"\\_SB.PCI0.LPC0.EC0"
+#define EC_INTERFACE_3		"\\_SB.PCI0.LPCB.EC0"
+#define NOTIFY_METHOD		"NTFY"
+
+#define TOSHIBA_FN_SCAN         0x6e	/* Fn key scancode */

 /* Toshiba HCI interface definitions
  *
@@ -108,6 +119,7 @@
 #define HCI_VIDEO_OUT_LCD		0x1
 #define HCI_VIDEO_OUT_CRT		0x2
 #define HCI_VIDEO_OUT_TV		0x4
+#define HCI_VIDEO_OUT_DVI		0x8
 #define HCI_WIRELESS_KILL_SWITCH	0x01
 #define HCI_WIRELESS_BT_PRESENT		0x0f
 #define HCI_WIRELESS_BT_ATTACH		0x40
@@ -121,36 +133,31 @@
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
@@ -163,7 +170,6 @@

 /* acpi interface wrappers
  */
-
 static int is_valid_acpi_path(const char *methodName)
 {
 	acpi_handle handle;
@@ -173,6 +179,45 @@
 	return !ACPI_FAILURE(status);
 }

+static acpi_status execute_acpi_method(acpi_handle handle, char *metho=
d,
+				       const int *param, int *result)
+{
+	struct acpi_object_list args_list;
+	struct acpi_buffer buff;
+	union acpi_object in_obj, out_obj;
+	acpi_status status;
+
+	if (param) {
+		args_list.count =3D 1;
+		args_list.pointer =3D &in_obj;
+		in_obj.type =3D ACPI_TYPE_INTEGER;
+		in_obj.integer.value =3D *param;
+	} else
+		args_list.count =3D 0;
+
+	buff.length =3D sizeof(out_obj);
+	buff.pointer =3D &out_obj;
+
+	status =3D acpi_evaluate_object(handle, method, &args_list, &buff);
+	if (ACPI_FAILURE(status)) {
+		printk(MY_ERR
+		       "ACPI method (%s) execution failed\n", method);
+		return -EINVAL;
+	}
+
+	if (!result)
+		return status;
+
+	if (out_obj.type !=3D ACPI_TYPE_INTEGER) {
+		printk(MY_ERR
+		       "ACPI method result is not a number\n");
+		return -EINVAL;
+	}
+
+	*result =3D out_obj.integer.value;
+	return status;
+}
+
 static int write_acpi_int(const char *methodName, int val)
 {
 	struct acpi_object_list params;
@@ -289,8 +334,11 @@
 	struct platform_device *p_dev;
 	struct rfkill *bt_rfk;
 	struct input_dev *hotkey_dev;
+	struct work_struct hotkey_work;
 	int illumination_installed;
 	acpi_handle handle;
+	acpi_handle ec_handle;
+	bool spfc;

 	const char *bt_name;

@@ -366,7 +414,7 @@
 	acpi_status status;
 	enum led_brightness result;

-	/*=C3=82 First request : initialize communication. */
+	/*=C2=A0First request : initialize communication. */
 	in[0] =3D 0xf100;
 	status =3D hci_raw(in, out);
 	if (ACPI_FAILURE(status)) {
@@ -508,10 +556,10 @@
 	u32 value;

 	hci_read1(HCI_LCD_BRIGHTNESS, &value, &hci_result);
-	if (hci_result =3D=3D HCI_SUCCESS) {
+	if (hci_result =3D=3D HCI_SUCCESS)
 		return (value >> HCI_LCD_BRIGHTNESS_SHIFT);
-	} else
-		return -EFAULT;
+
+	return -EFAULT;
 }

 static int lcd_proc_show(struct seq_file *m, void *v)
@@ -543,7 +591,7 @@
 	if (hci_result !=3D HCI_SUCCESS)
 		return -EFAULT;

-	return 0;
+	return 0;
 }

 static int set_lcd_status(struct backlight_device *bd)
@@ -852,89 +900,88 @@
         .update_status  =3D set_lcd_status,
 };

-static struct key_entry *toshiba_acpi_get_entry_by_scancode(unsigned i=
nt code)
+static bool toshiba_i8042_filter(unsigned char data, unsigned char str=
,
+			     struct serio *port)
 {
-	struct key_entry *key;
+	if (str & 0x20)
+		return false;

-	for (key =3D toshiba_acpi_keymap; key->type !=3D KE_END; key++)
-		if (code =3D=3D key->code)
-			return key;
+	if (unlikely(data =3D=3D 0xe0))
+		return false;
+	else if ((data & 0x7f) =3D=3D TOSHIBA_FN_SCAN)
+		schedule_work(&toshiba_acpi.hotkey_work);

-	return NULL;
+	return false;
 }

-static struct key_entry *toshiba_acpi_get_entry_by_keycode(unsigned in=
t code)
+static acpi_status get_spfc_events(int *hotkey)
 {
-	struct key_entry *key;
-
-	for (key =3D toshiba_acpi_keymap; key->type !=3D KE_END; key++)
-		if (code =3D=3D key->keycode && key->type =3D=3D KE_KEY)
-			return key;
-
-	return NULL;
-}
+	acpi_status status;

-static int toshiba_acpi_getkeycode(struct input_dev *dev,
-				   unsigned int scancode, unsigned int *keycode)
-{
-	struct key_entry *key =3D toshiba_acpi_get_entry_by_scancode(scancode=
);
+	/* Some models (Satellite X205, A135, NB600, among others) need
+	 * to call the NTFY method first in order to get the hotkey events.
+	 * But not all (TOS1900) models implement this.
+	 */
+	if (toshiba_acpi.ec_handle !=3D NULL) {
+		status =3D execute_acpi_method(toshiba_acpi.ec_handle,
+			  NOTIFY_METHOD, NULL, NULL);
+		if (ACPI_FAILURE(status)) {
+			printk(MY_ERR "ACPI method (%s) execution failed\n",
+				  NOTIFY_METHOD);
+			return -EIO;
+		}
+	}

-	if (key && key->type =3D=3D KE_KEY) {
-		*keycode =3D key->keycode;
-		return 0;
+	/* Now we can poll the INFO method to get last pressed hotkey */
+	status =3D execute_acpi_method(toshiba_acpi.handle,
+			  EVENTS_METHOD, NULL, hotkey);
+	if (ACPI_FAILURE(status)) {
+		printk(MY_ERR "ACPI method (%s) execution failed\n",
+			  EVENTS_METHOD);
+		return -EIO;
 	}

-	return -EINVAL;
+	return status;
 }

-static int toshiba_acpi_setkeycode(struct input_dev *dev,
-				   unsigned int scancode, unsigned int keycode)
+static void handle_spfc_hotkeys(struct work_struct *work)
 {
-	struct key_entry *key;
-	unsigned int old_keycode;
+	acpi_status status;
+	int hotkey;

-	key =3D toshiba_acpi_get_entry_by_scancode(scancode);
-	if (key && key->type =3D=3D KE_KEY) {
-		old_keycode =3D key->keycode;
-		key->keycode =3D keycode;
-		set_bit(keycode, dev->keybit);
-		if (!toshiba_acpi_get_entry_by_keycode(old_keycode))
-			clear_bit(old_keycode, dev->keybit);
-		return 0;
+	status =3D get_spfc_events(&hotkey);
+	if (ACPI_FAILURE(status)) {
+		printk(MY_ERR "Failed to get hotkey event\n");
+		return;
 	}

-	return -EINVAL;
+	/* We only care about a key press */
+	if ((hotkey =3D=3D 0x100) || (hotkey & 0x80))
+		return;
+
+	if (!sparse_keymap_report_event(toshiba_acpi.hotkey_dev,
+				  hotkey, 1, true))
+		printk(MY_INFO "Unknown key %x\n", hotkey);
 }

 static void toshiba_acpi_notify(acpi_handle handle, u32 event, void *c=
ontext)
 {
 	u32 hci_result, value;
-	struct key_entry *key;

 	if (event !=3D 0x80)
 		return;
 	do {
 		hci_read1(HCI_SYSTEM_EVENT, &value, &hci_result);
 		if (hci_result =3D=3D HCI_SUCCESS) {
-			if (value =3D=3D 0x100)
-				continue;
 			/* act on key press; ignore key release */
-			if (value & 0x80)
+			if ((value =3D=3D 0x100) || (value & 0x80))
 				continue;

-			key =3D toshiba_acpi_get_entry_by_scancode
-				(value);
-			if (!key) {
+			if (!sparse_keymap_report_event(toshiba_acpi.hotkey_dev,
+					     value, 1, true)) {
 				printk(MY_INFO "Unknown key %x\n",
 				       value);
-				continue;
 			}
-			input_report_key(toshiba_acpi.hotkey_dev,
-					 key->keycode, 1);
-			input_sync(toshiba_acpi.hotkey_dev);
-			input_report_key(toshiba_acpi.hotkey_dev,
-					 key->keycode, 0);
-			input_sync(toshiba_acpi.hotkey_dev);
 		} else if (hci_result =3D=3D HCI_NOT_SUPPORTED) {
 			/* This is a workaround for an unresolved issue on
 			 * some machines where system events sporadically
@@ -943,33 +990,43 @@
 			printk(MY_NOTICE "Re-enabled hotkeys\n");
 		}
 	} while (hci_result !=3D HCI_EMPTY);
+=09
 }

-static int toshiba_acpi_setup_keyboard(char *device)
+static int set_ec_handle(void)
 {
 	acpi_status status;
-	acpi_handle handle;
-	int result;
-	const struct key_entry *key;
+	char *ec_device;

-	status =3D acpi_get_handle(NULL, device, &handle);
-	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Unable to get notification device\n");
+	if (is_valid_acpi_path(EC_INTERFACE_1 "." NOTIFY_METHOD))
+		ec_device =3D EC_INTERFACE_1;
+	else if (is_valid_acpi_path(EC_INTERFACE_2 "." NOTIFY_METHOD))
+		ec_device =3D EC_INTERFACE_2;
+	else if (is_valid_acpi_path(EC_INTERFACE_3 "." NOTIFY_METHOD))
+		ec_device =3D EC_INTERFACE_3;
+	else {
+		printk(MY_NOTICE "No known EC interface found.\n");
 		return -ENODEV;
 	}

-	toshiba_acpi.handle =3D handle;
-
-	status =3D acpi_evaluate_object(handle, "ENAB", NULL, NULL);
+	status =3D acpi_get_handle(NULL, ec_device, &toshiba_acpi.ec_handle);
 	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Unable to enable hotkeys\n");
+		printk(MY_INFO "Unable to get EC device handle\n");
 		return -ENODEV;
 	}
+	printk(MY_INFO "    EC device handle: %s\n", ec_device);

-	status =3D acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
-					      toshiba_acpi_notify, NULL);
+	return 0;
+}
+
+static int __init toshiba_acpi_setup_keyboard(char *device)
+{
+	acpi_status status;
+	int error;
+
+	status =3D acpi_get_handle(NULL, device, &toshiba_acpi.handle);
 	if (ACPI_FAILURE(status)) {
-		printk(MY_INFO "Unable to install hotkey notification\n");
+		printk(MY_INFO "Unable to get notification device\n");
 		return -ENODEV;
 	}

@@ -982,27 +1039,96 @@
 	toshiba_acpi.hotkey_dev->name =3D "Toshiba input device";
 	toshiba_acpi.hotkey_dev->phys =3D device;
 	toshiba_acpi.hotkey_dev->id.bustype =3D BUS_HOST;
-	toshiba_acpi.hotkey_dev->getkeycode =3D toshiba_acpi_getkeycode;
-	toshiba_acpi.hotkey_dev->setkeycode =3D toshiba_acpi_setkeycode;
+	toshiba_acpi.hotkey_dev->id.vendor =3D PCI_VENDOR_ID_TOSHIBA;

-	for (key =3D toshiba_acpi_keymap; key->type !=3D KE_END; key++) {
-		set_bit(EV_KEY, toshiba_acpi.hotkey_dev->evbit);
-		set_bit(key->keycode, toshiba_acpi.hotkey_dev->keybit);
+	error =3D sparse_keymap_setup(toshiba_acpi.hotkey_dev,
+			  toshiba_acpi_keymap, NULL);
+	if (error)
+		goto err_free_dev;
+
+	if (toshiba_acpi.spfc) {
+		status =3D acpi_evaluate_object(toshiba_acpi.handle, "ENAB", NULL, N=
ULL);
+		if (ACPI_FAILURE(status)) {
+			printk(MY_INFO "Unable to enable hotkeys\n");
+			error =3D -ENODEV;
+			goto err_free_keymap;
+		}
+
+		error =3D i8042_install_filter(toshiba_i8042_filter);
+		if (error) {
+			printk(MY_ERR "Unable to install key filter\n");
+			goto err_free_keymap;
+		}
+=09
+		INIT_WORK(&toshiba_acpi.hotkey_work, handle_spfc_hotkeys);
+	} else {
+		status =3D acpi_install_notify_handler(toshiba_acpi.handle,
+				  ACPI_DEVICE_NOTIFY, toshiba_acpi_notify, NULL);
+		if (ACPI_FAILURE(status)) {
+			printk(MY_INFO "Unable to install hotkey notification\n");
+			error =3D -ENODEV;
+			goto err_free_keymap;
+		}
 	}

-	result =3D input_register_device(toshiba_acpi.hotkey_dev);
-	if (result) {
-		printk(MY_INFO "Unable to register input device\n");
-		return result;
+	error =3D input_register_device(toshiba_acpi.hotkey_dev);
+	if (error) {
+		printk(MY_ERR "Unable to register input device\n");
+		if (toshiba_acpi.spfc)
+			goto err_remove_filter;
+		else
+			goto err_free_keymap;
 	}

 	return 0;
+
+err_remove_filter:
+	i8042_remove_filter(toshiba_i8042_filter);
+err_free_keymap:
+	sparse_keymap_free(toshiba_acpi.hotkey_dev);
+err_free_dev:
+	input_free_device(toshiba_acpi.hotkey_dev);
+	toshiba_acpi.hotkey_dev =3D NULL;
+	return error;
+}
+
+static int set_device_handle(void)
+{
+	/* simple device detection: look for HCI method */
+	if (is_valid_acpi_path(TOSH_INTERFACE_1 GHCI_METHOD)) {
+		method_hci =3D TOSH_INTERFACE_1 GHCI_METHOD;
+		toshiba_acpi.spfc =3D false;
+		if (!toshiba_acpi_setup_keyboard(TOSH_INTERFACE_1))
+			return 0;
+	} else if (is_valid_acpi_path(TOSH_INTERFACE_2 GHCI_METHOD)) {
+		method_hci =3D TOSH_INTERFACE_2 GHCI_METHOD;
+		toshiba_acpi.spfc =3D false;
+		if (!toshiba_acpi_setup_keyboard(TOSH_INTERFACE_2))
+			return 0;
+	} else if (is_valid_acpi_path(TOSH_INTERFACE_2 SPFC_METHOD)) {
+		method_hci =3D TOSH_INTERFACE_2 SPFC_METHOD;
+		toshiba_acpi.spfc =3D true;
+		if (!toshiba_acpi_setup_keyboard(TOSH_INTERFACE_2))
+			return 0;
+	} else
+		printk(MY_INFO "No supported Toshiba interface found\n");
+
+	return -ENODEV;
 }

 static void toshiba_acpi_exit(void)
 {
-	if (toshiba_acpi.hotkey_dev)
+	if (toshiba_acpi.hotkey_dev) {
+		if (toshiba_acpi.spfc) {
+			flush_scheduled_work();
+			i8042_remove_filter(toshiba_i8042_filter);
+		} else {
+			acpi_remove_notify_handler(toshiba_acpi.handle,
+				  ACPI_DEVICE_NOTIFY, toshiba_acpi_notify);
+		}
+		sparse_keymap_free(toshiba_acpi.hotkey_dev);
 		input_unregister_device(toshiba_acpi.hotkey_dev);
+	}

 	if (toshiba_acpi.bt_rfk) {
 		rfkill_unregister(toshiba_acpi.bt_rfk);
@@ -1017,13 +1143,11 @@
 	if (toshiba_proc_dir)
 		remove_proc_entry(PROC_TOSHIBA, acpi_root_dir);

-	acpi_remove_notify_handler(toshiba_acpi.handle, ACPI_DEVICE_NOTIFY,
-				   toshiba_acpi_notify);
-
 	if (toshiba_acpi.illumination_installed)
 		led_classdev_unregister(&toshiba_led);

-	platform_device_unregister(toshiba_acpi.p_dev);
+	if (toshiba_acpi.p_dev)
+		platform_device_unregister(toshiba_acpi.p_dev);

 	return;
 }
@@ -1038,16 +1162,7 @@
 	if (acpi_disabled)
 		return -ENODEV;

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
+	if (set_device_handle())
 		return -ENODEV;

 	printk(MY_INFO "Toshiba Laptop ACPI Extras version %s\n",
@@ -1072,6 +1187,21 @@
 	/* enable event fifo */
 	hci_write1(HCI_SYSTEM_EVENT, 1, &hci_result);

+	/* TOS1900 models hotkey activation */
+	if (toshiba_acpi.spfc) {
+		/* Some TOS1900 models don't implement the ENAB method,
+		 * and hotkeys activation goes by calling HCI_HOTKEY_EVENT
+		 */
+		hci_write1(HCI_HOTKEY_EVENT, 1, &hci_result);
+		/* The EC handle must be set for models without
+		 * the ENAB method so they can access the NOTIFY method,
+		 * and thus, access the INFO method...
+		 */
+		if (set_ec_handle())
+			toshiba_acpi.ec_handle =3D NULL;
+	} else
+		toshiba_acpi.ec_handle =3D NULL;
+
 	toshiba_proc_dir =3D proc_mkdir(PROC_TOSHIBA, acpi_root_dir);
 	if (!toshiba_proc_dir) {
 		toshiba_acpi_exit();
@@ -1080,19 +1210,24 @@
 		create_toshiba_proc_entries();
 	}

-	props.max_brightness =3D HCI_LCD_BRIGHTNESS_LEVELS - 1;
-	toshiba_backlight_device =3D backlight_device_register("toshiba",
-							     &toshiba_acpi.p_dev->dev,
-							     NULL,
-							     &toshiba_backlight_data,
-							     &props);
-        if (IS_ERR(toshiba_backlight_device)) {
-		ret =3D PTR_ERR(toshiba_backlight_device);
-
-		printk(KERN_ERR "Could not register toshiba backlight device\n");
-		toshiba_backlight_device =3D NULL;
-		toshiba_acpi_exit();
-		return ret;
+	/* Only register backlight if the ACPI backlight is not
+	 * available or if a TOS1900 device is not detected
+	 */
+	if (!toshiba_acpi.spfc || !acpi_video_backlight_support()) {
+		memset(&props, 0, sizeof(struct backlight_properties));
+		props.max_brightness =3D HCI_LCD_BRIGHTNESS_LEVELS - 1;
+		toshiba_backlight_device =3D backlight_device_register("toshiba",
+						    &toshiba_acpi.p_dev->dev,
+						    NULL,
+						    &toshiba_backlight_data,
+						    &props);
+		if (IS_ERR(toshiba_backlight_device)) {
+			printk(KERN_ERR
+			       "Could not register toshiba backlight device\n");
+			toshiba_backlight_device =3D NULL;
+			toshiba_acpi_exit();
+			return PTR_ERR(toshiba_backlight_device);
+		}
 	}

 	/* Register rfkill switch for Bluetooth */



--=20
-- El mundo apesta y vosotros apestais tambien --
