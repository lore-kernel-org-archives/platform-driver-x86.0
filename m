From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 1/8] platform/x86: fujitsu-laptop: distinguish current uses of device-specific data
Date: Fri, 19 May 2017 09:44:41 +0200
Message-ID: <20170519074448.12716-2-kernel@kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In portions of the driver which use device-specific data, rename local
variables from fujitsu_bl and fujitsu_laptop to priv in order to clearly
distinguish these parts from code that uses module-wide data.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 48 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 7f49d92914c9..024ef339179a 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -348,26 +348,26 @@ static const struct key_entry keymap_backlight[] = {
 
 static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
 {
-	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
+	struct fujitsu_bl *priv = acpi_driver_data(device);
 	int ret;
 
-	fujitsu_bl->input = devm_input_allocate_device(&device->dev);
-	if (!fujitsu_bl->input)
+	priv->input = devm_input_allocate_device(&device->dev);
+	if (!priv->input)
 		return -ENOMEM;
 
-	snprintf(fujitsu_bl->phys, sizeof(fujitsu_bl->phys),
-		 "%s/video/input0", acpi_device_hid(device));
+	snprintf(priv->phys, sizeof(priv->phys), "%s/video/input0",
+		 acpi_device_hid(device));
 
-	fujitsu_bl->input->name = acpi_device_name(device);
-	fujitsu_bl->input->phys = fujitsu_bl->phys;
-	fujitsu_bl->input->id.bustype = BUS_HOST;
-	fujitsu_bl->input->id.product = 0x06;
+	priv->input->name = acpi_device_name(device);
+	priv->input->phys = priv->phys;
+	priv->input->id.bustype = BUS_HOST;
+	priv->input->id.product = 0x06;
 
-	ret = sparse_keymap_setup(fujitsu_bl->input, keymap_backlight, NULL);
+	ret = sparse_keymap_setup(priv->input, keymap_backlight, NULL);
 	if (ret)
 		return ret;
 
-	return input_register_device(fujitsu_bl->input);
+	return input_register_device(priv->input);
 }
 
 static int fujitsu_backlight_register(struct acpi_device *device)
@@ -541,27 +541,27 @@ static const struct dmi_system_id fujitsu_laptop_dmi_table[] = {
 
 static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 {
-	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
 	int ret;
 
-	fujitsu_laptop->input = devm_input_allocate_device(&device->dev);
-	if (!fujitsu_laptop->input)
+	priv->input = devm_input_allocate_device(&device->dev);
+	if (!priv->input)
 		return -ENOMEM;
 
-	snprintf(fujitsu_laptop->phys, sizeof(fujitsu_laptop->phys),
-		 "%s/video/input0", acpi_device_hid(device));
+	snprintf(priv->phys, sizeof(priv->phys), "%s/video/input0",
+		 acpi_device_hid(device));
 
-	fujitsu_laptop->input->name = acpi_device_name(device);
-	fujitsu_laptop->input->phys = fujitsu_laptop->phys;
-	fujitsu_laptop->input->id.bustype = BUS_HOST;
-	fujitsu_laptop->input->id.product = 0x06;
+	priv->input->name = acpi_device_name(device);
+	priv->input->phys = priv->phys;
+	priv->input->id.bustype = BUS_HOST;
+	priv->input->id.product = 0x06;
 
 	dmi_check_system(fujitsu_laptop_dmi_table);
-	ret = sparse_keymap_setup(fujitsu_laptop->input, keymap, NULL);
+	ret = sparse_keymap_setup(priv->input, keymap, NULL);
 	if (ret)
 		return ret;
 
-	return input_register_device(fujitsu_laptop->input);
+	return input_register_device(priv->input);
 }
 
 static int fujitsu_laptop_platform_add(void)
@@ -863,11 +863,11 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 {
-	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
 
 	fujitsu_laptop_platform_remove();
 
-	kfifo_free(&fujitsu_laptop->fifo);
+	kfifo_free(&priv->fifo);
 
 	return 0;
 }
-- 
2.13.0
