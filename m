From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/8] platform/x86: fujitsu-laptop: switch to a managed backlight input device
Date: Mon, 20 Mar 2017 10:32:18 +0100
Message-ID: <20170320093224.18541-3-kernel@kempniu.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33233 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753301AbdCTJcb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2017 05:32:31 -0400
Received: by mail-lf0-f68.google.com with SMTP id r36so9627096lfi.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2017 02:32:29 -0700 (PDT)
In-Reply-To: <20170320093224.18541-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Use a managed input device for brightness events in order to simplify
two error paths and one cleanup function while also reducing the number
of local variables required.  Remove double assignment to make
checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 47 +++++++++++------------------------
 1 file changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 2b0dcf989e2a..68e338c6a876 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -593,36 +593,24 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
 static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
 {
 	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
-	struct input_dev *input;
-	int error;
 
-	fujitsu_bl->input = input = input_allocate_device();
-	if (!input)
+	fujitsu_bl->input = devm_input_allocate_device(&device->dev);
+	if (!fujitsu_bl->input)
 		return -ENOMEM;
 
 	snprintf(fujitsu_bl->phys, sizeof(fujitsu_bl->phys),
 		 "%s/video/input0", acpi_device_hid(device));
 
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
-	if (error)
-		goto err_free_input_dev;
-
-	return 0;
-
-err_free_input_dev:
-	input_free_device(input);
+	fujitsu_bl->input->name = acpi_device_name(device);
+	fujitsu_bl->input->phys = fujitsu_bl->phys;
+	fujitsu_bl->input->id.bustype = BUS_HOST;
+	fujitsu_bl->input->id.product = 0x06;
+	fujitsu_bl->input->evbit[0] = BIT(EV_KEY);
+	set_bit(KEY_BRIGHTNESSUP, fujitsu_bl->input->keybit);
+	set_bit(KEY_BRIGHTNESSDOWN, fujitsu_bl->input->keybit);
+	set_bit(KEY_UNKNOWN, fujitsu_bl->input->keybit);
 
-	return error;
+	return input_register_device(fujitsu_bl->input);
 }
 
 static int fujitsu_backlight_register(void)
@@ -659,12 +647,12 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 
 	error = acpi_fujitsu_bl_input_setup(device);
 	if (error)
-		goto err_stop;
+		return error;
 
 	error = acpi_bus_update_power(fujitsu_bl->acpi_handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
-		goto err_unregister_input_dev;
+		return error;
 	}
 
 	pr_info("ACPI: %s [%s] (%s)\n",
@@ -704,24 +692,17 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		error = fujitsu_backlight_register();
 		if (error)
-			goto err_unregister_input_dev;
+			return error;
 	}
 
 	return 0;
-
-err_unregister_input_dev:
-	input_unregister_device(fujitsu_bl->input);
-err_stop:
-	return error;
 }
 
 static int acpi_fujitsu_bl_remove(struct acpi_device *device)
 {
 	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
-	struct input_dev *input = fujitsu_bl->input;
 
 	backlight_device_unregister(fujitsu_bl->bl_device);
-	input_unregister_device(input);
 
 	fujitsu_bl->acpi_handle = NULL;
 
-- 
2.12.0
