From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 6/8] platform/x86: fujitsu-laptop: use a sparse keymap for hotkey event generation
Date: Mon, 20 Mar 2017 10:32:22 +0100
Message-ID: <20170320093224.18541-7-kernel@kempniu.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34878 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753368AbdCTJce (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2017 05:32:34 -0400
Received: by mail-lf0-f65.google.com with SMTP id v2so9608747lfi.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2017 02:32:32 -0700 (PDT)
In-Reply-To: <20170320093224.18541-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Simplify hotkey event generation by using a sparse keymap.  As sparse
keymap operates on scancodes instead of keycodes, adjust variable names
and debug messages accordingly.

This patch only handles the default keymap for clarity.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 111 +++++++++++++---------------------
 1 file changed, 41 insertions(+), 70 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 74da588ed871..8f1c9c204110 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -756,9 +756,22 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 
 /* ACPI device for hotkey handling */
 
+static const struct key_entry keymap_default[] = {
+	{ KE_KEY, KEY1_CODE, { KEY_PROG1 } },
+	{ KE_KEY, KEY2_CODE, { KEY_PROG2 } },
+	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
+	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
+	{ KE_KEY, KEY5_CODE, { KEY_RFKILL } },
+	{ KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_END, 0 }
+};
+
+static const struct key_entry *keymap = keymap_default;
+
 static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 {
 	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
+	int ret;
 
 	fujitsu_laptop->input = devm_input_allocate_device(&device->dev);
 	if (!fujitsu_laptop->input)
@@ -772,14 +785,9 @@ static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 	fujitsu_laptop->input->id.bustype = BUS_HOST;
 	fujitsu_laptop->input->id.product = 0x06;
 
-	set_bit(EV_KEY, fujitsu_laptop->input->evbit);
-	set_bit(fujitsu_bl->keycode1, fujitsu_laptop->input->keybit);
-	set_bit(fujitsu_bl->keycode2, fujitsu_laptop->input->keybit);
-	set_bit(fujitsu_bl->keycode3, fujitsu_laptop->input->keybit);
-	set_bit(fujitsu_bl->keycode4, fujitsu_laptop->input->keybit);
-	set_bit(fujitsu_bl->keycode5, fujitsu_laptop->input->keybit);
-	set_bit(KEY_TOUCHPAD_TOGGLE, fujitsu_laptop->input->keybit);
-	set_bit(KEY_UNKNOWN, fujitsu_laptop->input->keybit);
+	ret = sparse_keymap_setup(fujitsu_laptop->input, keymap, NULL);
+	if (ret)
+		return ret;
 
 	return input_register_device(fujitsu_laptop->input);
 }
@@ -995,61 +1003,54 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 	return 0;
 }
 
-static void acpi_fujitsu_laptop_press(int keycode)
+static void acpi_fujitsu_laptop_press(int scancode)
 {
 	struct input_dev *input = fujitsu_laptop->input;
 	int status;
 
 	status = kfifo_in_locked(&fujitsu_laptop->fifo,
-				 (unsigned char *)&keycode, sizeof(keycode),
+				 (unsigned char *)&scancode, sizeof(scancode),
 				 &fujitsu_laptop->fifo_lock);
-	if (status != sizeof(keycode)) {
+	if (status != sizeof(scancode)) {
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
-			    "Could not push keycode [0x%x]\n", keycode);
+			    "Could not push scancode [0x%x]\n", scancode);
 		return;
 	}
-	input_report_key(input, keycode, 1);
-	input_sync(input);
+	sparse_keymap_report_event(input, scancode, 1, false);
 	vdbg_printk(FUJLAPTOP_DBG_TRACE,
-		    "Push keycode into ringbuffer [%d]\n", keycode);
+		    "Push scancode into ringbuffer [0x%x]\n", scancode);
 }
 
 static void acpi_fujitsu_laptop_release(void)
 {
 	struct input_dev *input = fujitsu_laptop->input;
-	int keycode, status;
+	int scancode, status;
 
 	while (true) {
 		status = kfifo_out_locked(&fujitsu_laptop->fifo,
-					  (unsigned char *)&keycode,
-					  sizeof(keycode),
+					  (unsigned char *)&scancode,
+					  sizeof(scancode),
 					  &fujitsu_laptop->fifo_lock);
-		if (status != sizeof(keycode))
+		if (status != sizeof(scancode))
 			return;
-		input_report_key(input, keycode, 0);
-		input_sync(input);
+		sparse_keymap_report_event(input, scancode, 0, false);
 		vdbg_printk(FUJLAPTOP_DBG_TRACE,
-			    "Pop keycode from ringbuffer [%d]\n", keycode);
+			    "Pop scancode from ringbuffer [0x%x]\n", scancode);
 	}
 }
 
 static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 {
 	struct input_dev *input;
-	int keycode;
-	unsigned int irb = 1;
-	int i;
+	int scancode, i = 0;
+	unsigned int irb;
 
 	input = fujitsu_laptop->input;
 
 	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
-		keycode = KEY_UNKNOWN;
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "Unsupported event [0x%x]\n", event);
-		input_report_key(input, keycode, 1);
-		input_sync(input);
-		input_report_key(input, keycode, 0);
-		input_sync(input);
+		sparse_keymap_report_event(input, -1, 1, true);
 		return;
 	}
 
@@ -1057,40 +1058,16 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 		fujitsu_laptop->flags_state =
 			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
 
-	i = 0;
-	while ((irb =
-		call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0
-			&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE) {
-		switch (irb & 0x4ff) {
-		case KEY1_CODE:
-			keycode = fujitsu_bl->keycode1;
-			break;
-		case KEY2_CODE:
-			keycode = fujitsu_bl->keycode2;
-			break;
-		case KEY3_CODE:
-			keycode = fujitsu_bl->keycode3;
-			break;
-		case KEY4_CODE:
-			keycode = fujitsu_bl->keycode4;
-			break;
-		case KEY5_CODE:
-			keycode = fujitsu_bl->keycode5;
-			break;
-		case 0:
-			keycode = 0;
-			break;
-		default:
+	while ((irb = call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0 &&
+	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE) {
+		scancode = irb & 0x4ff;
+		if (sparse_keymap_entry_from_scancode(input, scancode))
+			acpi_fujitsu_laptop_press(scancode);
+		else if (scancode == 0)
+			acpi_fujitsu_laptop_release();
+		else
 			vdbg_printk(FUJLAPTOP_DBG_WARN,
 				    "Unknown GIRB result [%x]\n", irb);
-			keycode = -1;
-			break;
-		}
-
-		if (keycode > 0)
-			acpi_fujitsu_laptop_press(keycode);
-		else if (keycode == 0)
-			acpi_fujitsu_laptop_release();
 	}
 
 	/* On some models (first seen on the Skylake-based Lifebook
@@ -1098,14 +1075,8 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	 * handled in software; its state is queried using FUNC_FLAGS
 	 */
 	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
-	    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26))) {
-		keycode = KEY_TOUCHPAD_TOGGLE;
-		input_report_key(input, keycode, 1);
-		input_sync(input);
-		input_report_key(input, keycode, 0);
-		input_sync(input);
-	}
-
+	    (call_fext_func(FLAG_RFKILL, 0x1, 0x0, 0x0) & BIT(26)))
+		sparse_keymap_report_event(input, BIT(26), 1, true);
 }
 
 /* Initialization */
-- 
2.12.0
