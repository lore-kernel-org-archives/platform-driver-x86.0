From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v2 1/8] platform/x86: huawei-wmi: move to platform driver
Date: Wed, 12 Jun 2019 23:04:07 -0400
Message-ID: <20190613030416.25807-2-ayman.bagabas@gmail.com>
References: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ayman.bagabas@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

This move is necessary because the driver is no longer only a hotkeys
driver and platform_driver offers easier future extensibility. Along
with that, some renames have been made to identify the WMI device in ASL
code. AMW0 -> HWMI which is the UID of this WMI device found on
supported laptops. WMI0 is the device name and has no UID, therefore,
left as it is.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 231 ++++++++++++++++++++----------
 1 file changed, 154 insertions(+), 77 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 52fcac5b393a..4a9e14d3b705 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- *  Huawei WMI hotkeys
+ *  Huawei WMI laptop extras driver
  *
  *  Copyright (C) 2018	      Ayman Bagabas <ayman.bagabas@gmail.com>
  */
@@ -10,23 +10,27 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/wmi.h>
 
 /*
  * Huawei WMI GUIDs
  */
-#define WMI0_EVENT_GUID "59142400-C6A3-40fa-BADB-8A2652834100"
-#define AMW0_EVENT_GUID "ABBC0F5C-8EA1-11D1-A000-C90629100000"
+#define HWMI_EVENT_GUID "ABBC0F5C-8EA1-11D1-A000-C90629100000"
 
+/* Legacy GUIDs */
 #define WMI0_EXPENSIVE_GUID "39142400-C6A3-40fa-BADB-8A2652834100"
+#define WMI0_EVENT_GUID "59142400-C6A3-40fa-BADB-8A2652834100"
 
-struct huawei_wmi_priv {
-	struct input_dev *idev;
+
+struct huawei_wmi {
 	struct led_classdev cdev;
-	acpi_handle handle;
-	char *acpi_method;
+	struct input_dev *idev[2];
+	struct platform_device *pdev;
 };
 
+struct platform_device *huawei_wmi_pdev;
+
 static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_KEY,    0x281, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY,    0x282, { KEY_BRIGHTNESSUP } },
@@ -37,17 +41,20 @@ static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_KEY,    0x289, { KEY_WLAN } },
 	// Huawei |M| key
 	{ KE_KEY,    0x28a, { KEY_CONFIG } },
-	// Keyboard backlight
+	// Keyboard backlit
 	{ KE_IGNORE, 0x293, { KEY_KBDILLUMTOGGLE } },
 	{ KE_IGNORE, 0x294, { KEY_KBDILLUMUP } },
 	{ KE_IGNORE, 0x295, { KEY_KBDILLUMUP } },
 	{ KE_END,	 0 }
 };
 
+/* LEDs */
+
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		enum led_brightness brightness)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(led_cdev->dev->parent);
+	char *acpi_method;
+	acpi_handle handle;
 	acpi_status status;
 	union acpi_object args[3];
 	struct acpi_object_list arg_list = {
@@ -55,55 +62,54 @@ static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		.count = ARRAY_SIZE(args),
 	};
 
+	handle = ec_get_handle();
+	if (!handle) {
+		dev_err(led_cdev->dev->parent, "Failed to get EC handle\n");
+		return -ENODEV;
+	}
+
 	args[0].type = args[1].type = args[2].type = ACPI_TYPE_INTEGER;
 	args[1].integer.value = 0x04;
 
-	if (strcmp(priv->acpi_method, "SPIN") == 0) {
+	if (acpi_has_method(handle, "SPIN")) {
+		acpi_method = "SPIN";
 		args[0].integer.value = 0;
 		args[2].integer.value = brightness ? 1 : 0;
-	} else if (strcmp(priv->acpi_method, "WPIN") == 0) {
+	} else if (acpi_has_method(handle, "WPIN")) {
+		acpi_method = "WPIN";
 		args[0].integer.value = 1;
 		args[2].integer.value = brightness ? 0 : 1;
 	} else {
-		return -EINVAL;
+		return -ENODEV;
 	}
 
-	status = acpi_evaluate_object(priv->handle, priv->acpi_method, &arg_list, NULL);
-	if (ACPI_FAILURE(status))
-		return -ENXIO;
+	status = acpi_evaluate_object(handle, acpi_method, &arg_list, NULL);
+	if (ACPI_FAILURE(status)) {
+		return -ENODEV;
+	}
 
 	return 0;
 }
 
-static int huawei_wmi_leds_setup(struct wmi_device *wdev)
+static int huawei_wmi_leds_setup(struct device *dev)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
 
-	priv->handle = ec_get_handle();
-	if (!priv->handle)
-		return 0;
+	huawei->cdev.name = "platform::micmute";
+	huawei->cdev.max_brightness = 1;
+	huawei->cdev.brightness_set_blocking = huawei_wmi_micmute_led_set;
+	huawei->cdev.default_trigger = "audio-micmute";
+	huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+	huawei->cdev.dev = dev->parent;
+	huawei->cdev.flags = LED_CORE_SUSPENDRESUME;
 
-	if (acpi_has_method(priv->handle, "SPIN"))
-		priv->acpi_method = "SPIN";
-	else if (acpi_has_method(priv->handle, "WPIN"))
-		priv->acpi_method = "WPIN";
-	else
-		return 0;
-
-	priv->cdev.name = "platform::micmute";
-	priv->cdev.max_brightness = 1;
-	priv->cdev.brightness_set_blocking = huawei_wmi_micmute_led_set;
-	priv->cdev.default_trigger = "audio-micmute";
-	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-	priv->cdev.dev = &wdev->dev;
-	priv->cdev.flags = LED_CORE_SUSPENDRESUME;
-
-	return devm_led_classdev_register(&wdev->dev, &priv->cdev);
+	return devm_led_classdev_register(dev, &huawei->cdev);
 }
 
-static void huawei_wmi_process_key(struct wmi_device *wdev, int code)
+/* Input */
+
+static void huawei_wmi_process_key(struct input_dev *idev, int code)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
 	const struct key_entry *key;
 
 	/*
@@ -117,8 +123,10 @@ static void huawei_wmi_process_key(struct wmi_device *wdev, int code)
 		acpi_status status;
 
 		status = wmi_query_block(WMI0_EXPENSIVE_GUID, 0, &response);
-		if (ACPI_FAILURE(status))
+		if (ACPI_FAILURE(status)) {
+			dev_err(&idev->dev, "Failed to query wmi block\n");
 			return;
+		}
 
 		obj = (union acpi_object *)response.pointer;
 		if (obj && obj->type == ACPI_TYPE_INTEGER)
@@ -127,81 +135,150 @@ static void huawei_wmi_process_key(struct wmi_device *wdev, int code)
 		kfree(response.pointer);
 	}
 
-	key = sparse_keymap_entry_from_scancode(priv->idev, code);
+	key = sparse_keymap_entry_from_scancode(idev, code);
 	if (!key) {
-		dev_info(&wdev->dev, "Unknown key pressed, code: 0x%04x\n", code);
+		dev_info(&idev->dev, "Unknown key pressed, code: 0x%04x\n", code);
 		return;
 	}
 
-	sparse_keymap_report_entry(priv->idev, key, 1, true);
+	sparse_keymap_report_entry(idev, key, 1, true);
 }
 
-static void huawei_wmi_notify(struct wmi_device *wdev,
-		union acpi_object *obj)
+static void huawei_wmi_input_notify(u32 value, void *context)
 {
-	if (obj->type == ACPI_TYPE_INTEGER)
-		huawei_wmi_process_key(wdev, obj->integer.value);
+	struct input_dev *idev = (struct input_dev *)context;
+	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+
+	status = wmi_get_event_data(value, &response);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&idev->dev, "Unable to get event data\n");
+		return;
+	}
+
+	obj = (union acpi_object *)response.pointer;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		huawei_wmi_process_key(idev, obj->integer.value);
 	else
-		dev_info(&wdev->dev, "Bad response type %d\n", obj->type);
+		dev_err(&idev->dev, "Bad response type\n");
+
+	kfree(response.pointer);
 }
 
-static int huawei_wmi_input_setup(struct wmi_device *wdev)
+static int huawei_wmi_input_setup(struct platform_device *pdev,
+		struct input_dev **idev)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
 	int err;
 
-	priv->idev = devm_input_allocate_device(&wdev->dev);
-	if (!priv->idev)
+	*idev = devm_input_allocate_device(&pdev->dev);
+	if (!*idev)
 		return -ENOMEM;
 
-	priv->idev->name = "Huawei WMI hotkeys";
-	priv->idev->phys = "wmi/input0";
-	priv->idev->id.bustype = BUS_HOST;
-	priv->idev->dev.parent = &wdev->dev;
+	(*idev)->name = "Huawei WMI hotkeys";
+	(*idev)->phys = "wmi/input0";
+	(*idev)->id.bustype = BUS_HOST;
+	(*idev)->dev.parent = &pdev->dev;
 
-	err = sparse_keymap_setup(priv->idev, huawei_wmi_keymap, NULL);
+	err = sparse_keymap_setup(*idev, huawei_wmi_keymap, NULL);
 	if (err)
 		return err;
 
-	return input_register_device(priv->idev);
+	return input_register_device(*idev);
 }
 
-static int huawei_wmi_probe(struct wmi_device *wdev)
+/* Huawei driver */
+
+static int huawei_wmi_probe(struct platform_device *pdev)
 {
-	struct huawei_wmi_priv *priv;
+	struct huawei_wmi *huawei;
 	int err;
 
-	priv = devm_kzalloc(&wdev->dev, sizeof(struct huawei_wmi_priv), GFP_KERNEL);
-	if (!priv)
+	huawei = devm_kzalloc(&pdev->dev, sizeof(struct huawei_wmi), GFP_KERNEL);
+	if (!huawei)
 		return -ENOMEM;
 
-	dev_set_drvdata(&wdev->dev, priv);
+	huawei->pdev = pdev;
+	dev_set_drvdata(&pdev->dev, huawei);
+
+	if (wmi_has_guid(WMI0_EVENT_GUID)) {
+		err = huawei_wmi_input_setup(pdev, &huawei->idev[0]);
+		if (err)
+			dev_err(&pdev->dev, "Failed to setup input device\n");
+		err = wmi_install_notify_handler(WMI0_EVENT_GUID,
+				huawei_wmi_input_notify, huawei->idev[0]);
+		if (err)
+			dev_err(&pdev->dev, "Failed to install notify handler\n");
+	}
 
-	err = huawei_wmi_input_setup(wdev);
-	if (err)
-		return err;
+	if (wmi_has_guid(HWMI_EVENT_GUID)) {
+		err = huawei_wmi_input_setup(pdev, &huawei->idev[1]);
+		if (err)
+			dev_err(&pdev->dev, "Failed to setup input device\n");
+		err = wmi_install_notify_handler(HWMI_EVENT_GUID,
+				huawei_wmi_input_notify, huawei->idev[1]);
+		if (err)
+			dev_err(&pdev->dev, "Failed to install notify handler\n");
+	}
 
-	return huawei_wmi_leds_setup(wdev);
+	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		err = huawei_wmi_leds_setup(&pdev->dev);
+		if (err)
+			dev_err(&pdev->dev, "Failed to setup leds\n");
+	}
+	return 0;
 }
 
-static const struct wmi_device_id huawei_wmi_id_table[] = {
-	{ .guid_string = WMI0_EVENT_GUID },
-	{ .guid_string = AMW0_EVENT_GUID },
-	{  }
-};
+static int huawei_wmi_remove(struct platform_device *pdev)
+{
+	if (wmi_has_guid(WMI0_EVENT_GUID))
+		wmi_remove_notify_handler(WMI0_EVENT_GUID);
 
-static struct wmi_driver huawei_wmi_driver = {
+	if (wmi_has_guid(HWMI_EVENT_GUID))
+		wmi_remove_notify_handler(HWMI_EVENT_GUID);
+
+	return 0;
+}
+
+static struct platform_driver huawei_wmi_driver = {
 	.driver = {
 		.name = "huawei-wmi",
 	},
-	.id_table = huawei_wmi_id_table,
 	.probe = huawei_wmi_probe,
-	.notify = huawei_wmi_notify,
+	.remove = huawei_wmi_remove,
 };
 
-module_wmi_driver(huawei_wmi_driver);
+static __init int huawei_wmi_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&huawei_wmi_driver);
+	if (err) {
+		pr_err("Failed to register platform driver\n");
+		return err;
+	}
+
+	huawei_wmi_pdev = platform_device_register_simple("huawei-wmi", -1, NULL, 0);
+	if (IS_ERR(huawei_wmi_pdev)) {
+		pr_err("Failed to register platform device\n");
+		platform_driver_unregister(&huawei_wmi_driver);
+		return PTR_ERR(huawei_wmi_pdev);
+	}
+
+	return 0;
+}
+
+static __exit void huawei_wmi_exit(void)
+{
+	platform_device_unregister(huawei_wmi_pdev);
+	platform_driver_unregister(&huawei_wmi_driver);
+}
+
+module_init(huawei_wmi_init);
+module_exit(huawei_wmi_exit);
 
-MODULE_DEVICE_TABLE(wmi, huawei_wmi_id_table);
+MODULE_ALIAS("wmi:"WMI0_EVENT_GUID);
+MODULE_ALIAS("wmi:"HWMI_EVENT_GUID);
 MODULE_AUTHOR("Ayman Bagabas <ayman.bagabas@gmail.com>");
-MODULE_DESCRIPTION("Huawei WMI hotkeys");
+MODULE_DESCRIPTION("Huawei WMI laptop extras driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1
