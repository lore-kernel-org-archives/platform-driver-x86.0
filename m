From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 1/8] platform/x86: fujitsu-laptop: move backlight input device setup to a separate function
Date: Mon, 20 Mar 2017 10:32:17 +0100
Message-ID: <20170320093224.18541-2-kernel@kempniu.pl>
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

Simplify error handling in acpi_fujitsu_bl_add() by moving code
responsible for setting up the input device to a separate function.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 64 +++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index f3ccef3d5a1e..2b0dcf989e2a 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -590,6 +590,41 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
 
 /* ACPI device for LCD brightness control */
 
+static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
+{
+	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
+	struct input_dev *input;
+	int error;
+
+	fujitsu_bl->input = input = input_allocate_device();
+	if (!input)
+		return -ENOMEM;
+
+	snprintf(fujitsu_bl->phys, sizeof(fujitsu_bl->phys),
+		 "%s/video/input0", acpi_device_hid(device));
+
+	input->name = acpi_device_name(device);
+	input->phys = fujitsu_bl->phys;
+	input->id.bustype = BUS_HOST;
+	input->id.product = 0x06;
+	input->dev.parent = &device->dev;
+	input->evbit[0] = BIT(EV_KEY);
+	set_bit(KEY_BRIGHTNESSUP, input->keybit);
+	set_bit(KEY_BRIGHTNESSDOWN, input->keybit);
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
 static int fujitsu_backlight_register(void)
 {
 	struct backlight_properties props = {
@@ -612,7 +647,6 @@ static int fujitsu_backlight_register(void)
 static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
 	int state = 0;
-	struct input_dev *input;
 	int error;
 
 	if (!device)
@@ -623,28 +657,9 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
 	device->driver_data = fujitsu_bl;
 
-	fujitsu_bl->input = input = input_allocate_device();
-	if (!input) {
-		error = -ENOMEM;
-		goto err_stop;
-	}
-
-	snprintf(fujitsu_bl->phys, sizeof(fujitsu_bl->phys),
-		 "%s/video/input0", acpi_device_hid(device));
-
-	input->name = acpi_device_name(device);
-	input->phys = fujitsu_bl->phys;
-	input->id.bustype = BUS_HOST;
-	input->id.product = 0x06;
-	input->dev.parent = &device->dev;
-	input->evbit[0] = BIT(EV_KEY);
-	set_bit(KEY_BRIGHTNESSUP, input->keybit);
-	set_bit(KEY_BRIGHTNESSDOWN, input->keybit);
-	set_bit(KEY_UNKNOWN, input->keybit);
-
-	error = input_register_device(input);
+	error = acpi_fujitsu_bl_input_setup(device);
 	if (error)
-		goto err_free_input_dev;
+		goto err_stop;
 
 	error = acpi_bus_update_power(fujitsu_bl->acpi_handle, &state);
 	if (error) {
@@ -695,10 +710,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	return 0;
 
 err_unregister_input_dev:
-	input_unregister_device(input);
-	input = NULL;
-err_free_input_dev:
-	input_free_device(input);
+	input_unregister_device(fujitsu_bl->input);
 err_stop:
 	return error;
 }
-- 
2.12.0
