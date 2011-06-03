From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 03 Jun 2011 17:43:42 +0200
Message-ID: <4DE9012E.5040207@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:41632 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755302Ab1FCPnp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:43:45 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

The code is now forwarding the SW_RFKILL_ALL event; added a couple of Fn 
combos too.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/include/linux/sonypi.h
+++ b/include/linux/sonypi.h
@@ -114,6 +114,7 @@
  #define SONYPI_EVENT_BRIGHTNESS_PRESSED		71
  #define SONYPI_EVENT_MEDIA_PRESSED		72
  #define SONYPI_EVENT_VENDOR_PRESSED		73
+#define SONYPI_EVENT_RFKILL_ALL			74

  /* get/set brightness */
  #define SONYPI_IOCGBRT		_IOR('v', 0, __u8)
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -142,6 +142,7 @@ MODULE_PARM_DESC(kbd_backlight_timeout,


  static int sony_rfkill_handle = -1;
+static int sony_nc_get_rfkill_hwblock(void);

  /*********** Input Devices ***********/

@@ -241,7 +242,8 @@ static int sony_laptop_input_index[] = {
  	57,	/* 70 SONYPI_EVENT_VOLUME_DEC_PRESSED */
  	-1,	/* 71 SONYPI_EVENT_BRIGHTNESS_PRESSED */
  	58,	/* 72 SONYPI_EVENT_MEDIA_PRESSED */
-	59,	/* 72 SONYPI_EVENT_VENDOR_PRESSED */
+	59,	/* 73 SONYPI_EVENT_VENDOR_PRESSED */
+	-1,	/* 74 SONYPI_EVENT_RFKILL_ALL */
  };

  static int sony_laptop_input_keycode_map[] = {
@@ -335,6 +337,7 @@ static void sony_laptop_report_input_eve
  	struct input_dev *jog_dev = sony_laptop_input.jog_dev;
  	struct input_dev *key_dev = sony_laptop_input.key_dev;
  	struct sony_laptop_keypress kp = { NULL };
+	int rfk_switch;

  	if (event == SONYPI_EVENT_FNKEY_RELEASED ||
  			event == SONYPI_EVENT_ANYBUTTON_RELEASED) {
@@ -363,6 +366,14 @@ static void sony_laptop_report_input_eve
  		kp.dev = jog_dev;
  		break;

+	case SONYPI_EVENT_RFKILL_ALL:
+		rfk_switch = sony_nc_get_rfkill_hwblock();
+		if (!(rfk_switch < 0)) {
+			input_report_switch(key_dev, SW_RFKILL_ALL, rfk_switch);
+			input_sync(key_dev);
+		}
+		return;
+
  	default:
  		if (event >= ARRAY_SIZE(sony_laptop_input_index)) {
  			dprintk("sony_laptop_report_input_event, event not known: %d\n", 
event);
@@ -438,6 +449,14 @@ static int sony_laptop_setup_input(struc
  		__set_bit(sony_laptop_input_keycode_map[i], key_dev->keybit);
  	__clear_bit(KEY_RESERVED, key_dev->keybit);

+	if (sony_rfkill_handle != -1) {
+		int rfk_switch;
+
+		rfk_switch = sony_nc_get_rfkill_hwblock();
+		input_set_capability(key_dev, EV_SW, SW_RFKILL_ALL);
+		input_report_switch(key_dev, SW_RFKILL_ALL, rfk_switch);
+	}
+
  	error = input_register_device(key_dev);
  	if (error)
  		goto err_free_keydev;
@@ -1079,10 +1098,6 @@ struct sony_nc_event {
  };

  static struct sony_nc_event sony_100_events[] = {
-	{ 0x90, SONYPI_EVENT_PKEY_P1 },
-	{ 0x10, SONYPI_EVENT_ANYBUTTON_RELEASED },
-	{ 0x91, SONYPI_EVENT_PKEY_P2 },
-	{ 0x11, SONYPI_EVENT_ANYBUTTON_RELEASED },
  	{ 0x81, SONYPI_EVENT_FNKEY_F1 },
  	{ 0x01, SONYPI_EVENT_FNKEY_RELEASED },
  	{ 0x82, SONYPI_EVENT_FNKEY_F2 },
@@ -1097,12 +1112,20 @@ static struct sony_nc_event sony_100_eve
  	{ 0x06, SONYPI_EVENT_FNKEY_RELEASED },
  	{ 0x87, SONYPI_EVENT_FNKEY_F7 },
  	{ 0x07, SONYPI_EVENT_FNKEY_RELEASED },
+	{ 0x88, SONYPI_EVENT_FNKEY_F8 },
+	{ 0x08, SONYPI_EVENT_FNKEY_RELEASED },
  	{ 0x89, SONYPI_EVENT_FNKEY_F9 },
  	{ 0x09, SONYPI_EVENT_FNKEY_RELEASED },
  	{ 0x8A, SONYPI_EVENT_FNKEY_F10 },
  	{ 0x0A, SONYPI_EVENT_FNKEY_RELEASED },
+	{ 0x8B, SONYPI_EVENT_FNKEY_F11 },
+	{ 0x0B, SONYPI_EVENT_FNKEY_RELEASED },
  	{ 0x8C, SONYPI_EVENT_FNKEY_F12 },
  	{ 0x0C, SONYPI_EVENT_FNKEY_RELEASED },
+	{ 0x90, SONYPI_EVENT_PKEY_P1 },
+	{ 0x10, SONYPI_EVENT_ANYBUTTON_RELEASED },
+	{ 0x91, SONYPI_EVENT_PKEY_P2 },
+	{ 0x11, SONYPI_EVENT_ANYBUTTON_RELEASED },
  	{ 0x9d, SONYPI_EVENT_ZOOM_PRESSED },
  	{ 0x1d, SONYPI_EVENT_ANYBUTTON_RELEASED },
  	{ 0x9f, SONYPI_EVENT_CD_EJECT_PRESSED },
