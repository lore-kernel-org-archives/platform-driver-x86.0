From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/8] platform/x86: fujitsu-laptop: move hotkey input device setup to a separate function
Date: Mon, 20 Mar 2017 10:32:20 +0100
Message-ID: <20170320093224.18541-5-kernel@kempniu.pl>
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

Simplify error handling in acpi_fujitsu_laptop_add() by moving code
responsible for setting up the input device to a separate function.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 74 ++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 3483ac37bee5..b1a08d83330b 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -756,6 +756,46 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 
 /* ACPI device for hotkey handling */
 
+static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
+{
+	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
+	struct input_dev *input;
+	int error;
+
+	fujitsu_laptop->input = input = input_allocate_device();
+	if (!input)
+		return -ENOMEM;
+
+	snprintf(fujitsu_laptop->phys, sizeof(fujitsu_laptop->phys),
+		 "%s/video/input0", acpi_device_hid(device));
+
+	input->name = acpi_device_name(device);
+	input->phys = fujitsu_laptop->phys;
+	input->id.bustype = BUS_HOST;
+	input->id.product = 0x06;
+	input->dev.parent = &device->dev;
+
+	set_bit(EV_KEY, input->evbit);
+	set_bit(fujitsu_bl->keycode1, input->keybit);
+	set_bit(fujitsu_bl->keycode2, input->keybit);
+	set_bit(fujitsu_bl->keycode3, input->keybit);
+	set_bit(fujitsu_bl->keycode4, input->keybit);
+	set_bit(fujitsu_bl->keycode5, input->keybit);
+	set_bit(KEY_TOUCHPAD_TOGGLE, input->keybit);
+	set_bit(KEY_UNKNOWN, input->keybit);
+
+	error = input_register_device(input);
+	if (error)
+		goto err_free_input_dev;
+
+	return 0;
+
+err_free_input_dev:
+	input_free_device(input);
+
+	return error;
+}
+
 static int fujitsu_laptop_platform_add(void)
 {
 	int ret;
@@ -794,7 +834,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 {
 	int result = 0;
 	int state = 0;
-	struct input_dev *input;
 	int error;
 	int i;
 
@@ -816,33 +855,9 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 		goto err_stop;
 	}
 
-	fujitsu_laptop->input = input = input_allocate_device();
-	if (!input) {
-		error = -ENOMEM;
-		goto err_free_fifo;
-	}
-
-	snprintf(fujitsu_laptop->phys, sizeof(fujitsu_laptop->phys),
-		 "%s/video/input0", acpi_device_hid(device));
-
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
+	error = acpi_fujitsu_laptop_input_setup(device);
 	if (error)
-		goto err_free_input_dev;
+		goto err_free_fifo;
 
 	error = acpi_bus_update_power(fujitsu_laptop->acpi_handle, &state);
 	if (error) {
@@ -960,10 +975,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	return result;
 
 err_unregister_input_dev:
-	input_unregister_device(input);
-	input = NULL;
-err_free_input_dev:
-	input_free_device(input);
+	input_unregister_device(fujitsu_laptop->input);
 err_free_fifo:
 	kfifo_free(&fujitsu_laptop->fifo);
 err_stop:
-- 
2.12.0
