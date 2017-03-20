From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 5/8] platform/x86: fujitsu-laptop: switch to a managed hotkey input device
Date: Mon, 20 Mar 2017 10:32:21 +0100
Message-ID: <20170320093224.18541-6-kernel@kempniu.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320093224.18541-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use a managed input device for hotkey events in order to simplify two
error paths and one cleanup function while also reducing the number of
local variables required.  Remove double assignment to make checkpatch
happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 55 ++++++++++++-----------------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b1a08d83330b..74da588ed871 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -759,41 +759,29 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 {
 	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
-	struct input_dev *input;
-	int error;
 
-	fujitsu_laptop->input = input = input_allocate_device();
-	if (!input)
+	fujitsu_laptop->input = devm_input_allocate_device(&device->dev);
+	if (!fujitsu_laptop->input)
 		return -ENOMEM;
 
 	snprintf(fujitsu_laptop->phys, sizeof(fujitsu_laptop->phys),
 		 "%s/video/input0", acpi_device_hid(device));
 
-	input->name = acpi_device_name(device);
-	input->phys = fujitsu_laptop->phys;
-	input->id.bustype = BUS_HOST;
-	input->id.product = 0x06;
-	input->dev.parent = &device->dev;
-
-	set_bit(EV_KEY, input->evbit);
-	set_bit(fujitsu_bl->keycode1, input->keybit);
-	set_bit(fujitsu_bl->keycode2, input->keybit);
-	set_bit(fujitsu_bl->keycode3, input->keybit);
-	set_bit(fujitsu_bl->keycode4, input->keybit);
-	set_bit(fujitsu_bl->keycode5, input->keybit);
-	set_bit(KEY_TOUCHPAD_TOGGLE, input->keybit);
-	set_bit(KEY_UNKNOWN, input->keybit);
-
-	error = input_register_device(input);
-	if (error)
-		goto err_free_input_dev;
-
-	return 0;
-
-err_free_input_dev:
-	input_free_device(input);
-
-	return error;
+	fujitsu_laptop->input->name = acpi_device_name(device);
+	fujitsu_laptop->input->phys = fujitsu_laptop->phys;
+	fujitsu_laptop->input->id.bustype = BUS_HOST;
+	fujitsu_laptop->input->id.product = 0x06;
+
+	set_bit(EV_KEY, fujitsu_laptop->input->evbit);
+	set_bit(fujitsu_bl->keycode1, fujitsu_laptop->input->keybit);
+	set_bit(fujitsu_bl->keycode2, fujitsu_laptop->input->keybit);
+	set_bit(fujitsu_bl->keycode3, fujitsu_laptop->input->keybit);
+	set_bit(fujitsu_bl->keycode4, fujitsu_laptop->input->keybit);
+	set_bit(fujitsu_bl->keycode5, fujitsu_laptop->input->keybit);
+	set_bit(KEY_TOUCHPAD_TOGGLE, fujitsu_laptop->input->keybit);
+	set_bit(KEY_UNKNOWN, fujitsu_laptop->input->keybit);
+
+	return input_register_device(fujitsu_laptop->input);
 }
 
 static int fujitsu_laptop_platform_add(void)
@@ -862,7 +850,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	error = acpi_bus_update_power(fujitsu_laptop->acpi_handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
-		goto err_unregister_input_dev;
+		goto err_free_fifo;
 	}
 
 	pr_info("ACPI: %s [%s] (%s)\n",
@@ -911,7 +899,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	error = fujitsu_laptop_platform_add();
 	if (error)
-		goto err_unregister_input_dev;
+		goto err_free_fifo;
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
@@ -974,8 +962,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	return result;
 
-err_unregister_input_dev:
-	input_unregister_device(fujitsu_laptop->input);
 err_free_fifo:
 	kfifo_free(&fujitsu_laptop->fifo);
 err_stop:
@@ -985,7 +971,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 {
 	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
-	struct input_dev *input = fujitsu_laptop->input;
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (fujitsu_laptop->logolamp_registered)
@@ -1003,8 +988,6 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 
 	fujitsu_laptop_platform_remove();
 
-	input_unregister_device(input);
-
 	kfifo_free(&fujitsu_laptop->fifo);
 
 	fujitsu_laptop->acpi_handle = NULL;
-- 
2.12.0
