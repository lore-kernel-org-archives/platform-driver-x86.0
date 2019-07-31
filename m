From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 2/9] platform/x86: huawei-wmi: Move to platform driver
Date: Wed, 31 Jul 2019 13:52:48 -0400
Message-ID: <20190731175255.25676-3-ayman.bagabas@gmail.com>
References: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Move from WMI driver to platform driver. This move is necessary since
the driver is no longer a hotkeys driver only. Platform driver makes it
easier for users to access sysfs attributes under (i.e.
/sys/devices/platform/huawei-wmi) compared to wmi driver.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
Do you think we should stick to wmi driver especially after
"platform/x86: wmi: add context pointer field to struct wmi_device_id"
https://patchwork.kernel.org/patch/10963421/ which is basically was my
issue with wmi driver where there wasn't a way to distinguish what wmi
device is associated with which guid.

I believe that platform driver is more suitable for this since it has
grown from just a hotkeys driver and users can access sysfs of this
easily with platform driver. What do you think?

 drivers/platform/x86/huawei-wmi.c | 152 +++++++++++++++++++++---------
 1 file changed, 110 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index a1159850a16c..12cae450fc1f 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -10,6 +10,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/wmi.h>
 
 /*
@@ -23,12 +24,15 @@
 
 
 struct huawei_wmi_priv {
-	struct input_dev *idev;
+	struct input_dev *idev[2];
 	struct led_classdev cdev;
 	acpi_handle handle;
 	char *acpi_method;
+	struct platform_device *pdev;
 };
 
+struct platform_device *huawei_wmi_pdev;
+
 static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_KEY,    0x281, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY,    0x282, { KEY_BRIGHTNESSUP } },
@@ -46,6 +50,8 @@ static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_END,	 0 }
 };
 
+/* LEDs */
+
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		enum led_brightness brightness)
 {
@@ -77,9 +83,9 @@ static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-static int huawei_wmi_leds_setup(struct wmi_device *wdev)
+static int huawei_wmi_leds_setup(struct device *dev)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
+	struct huawei_wmi_priv *priv = dev_get_drvdata(dev);
 
 	priv->handle = ec_get_handle();
 	if (!priv->handle)
@@ -97,15 +103,16 @@ static int huawei_wmi_leds_setup(struct wmi_device *wdev)
 	priv->cdev.brightness_set_blocking = huawei_wmi_micmute_led_set;
 	priv->cdev.default_trigger = "audio-micmute";
 	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-	priv->cdev.dev = &wdev->dev;
+	priv->cdev.dev = dev;
 	priv->cdev.flags = LED_CORE_SUSPENDRESUME;
 
-	return devm_led_classdev_register(&wdev->dev, &priv->cdev);
+	return devm_led_classdev_register(dev, &priv->cdev);
 }
 
-static void huawei_wmi_process_key(struct wmi_device *wdev, int code)
+/* Input */
+
+static void huawei_wmi_process_key(struct input_dev *idev, int code)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
 	const struct key_entry *key;
 
 	/*
@@ -129,81 +136,142 @@ static void huawei_wmi_process_key(struct wmi_device *wdev, int code)
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
+static int huawei_wmi_input_setup(struct device *dev,
+		struct input_dev **idev)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
 	int err;
 
-	priv->idev = devm_input_allocate_device(&wdev->dev);
-	if (!priv->idev)
+	*idev = devm_input_allocate_device(dev);
+	if (!*idev)
 		return -ENOMEM;
 
-	priv->idev->name = "Huawei WMI hotkeys";
-	priv->idev->phys = "wmi/input0";
-	priv->idev->id.bustype = BUS_HOST;
-	priv->idev->dev.parent = &wdev->dev;
+	(*idev)->name = "Huawei WMI hotkeys";
+	(*idev)->phys = "wmi/input0";
+	(*idev)->id.bustype = BUS_HOST;
+	(*idev)->dev.parent = dev;
 
-	err = sparse_keymap_setup(priv->idev, huawei_wmi_keymap, NULL);
+	err = sparse_keymap_setup(*idev, huawei_wmi_keymap, NULL);
 	if (err)
 		return err;
 
-	return input_register_device(priv->idev);
+	return input_register_device(*idev);
 }
 
-static int huawei_wmi_probe(struct wmi_device *wdev, const void *context)
+/* Huawei driver */
+
+static int huawei_wmi_probe(struct platform_device *pdev)
 {
 	struct huawei_wmi_priv *priv;
 	int err;
 
-	priv = devm_kzalloc(&wdev->dev, sizeof(struct huawei_wmi_priv), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct huawei_wmi_priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	dev_set_drvdata(&wdev->dev, priv);
+	priv->pdev = pdev;
+	dev_set_drvdata(&pdev->dev, priv);
+
+	if (wmi_has_guid(WMI0_EVENT_GUID)) {
+		err = huawei_wmi_input_setup(&pdev->dev, &priv->idev[0]) ||
+				wmi_install_notify_handler(WMI0_EVENT_GUID,
+					huawei_wmi_input_notify, priv->idev[0]);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to setup input device\n");
+			return err;
+		}
+	}
 
-	err = huawei_wmi_input_setup(wdev);
-	if (err)
-		return err;
+	if (wmi_has_guid(HWMI_EVENT_GUID)) {
+		err = huawei_wmi_input_setup(&pdev->dev, &priv->idev[1]) ||
+				wmi_install_notify_handler(HWMI_EVENT_GUID,
+					huawei_wmi_input_notify, priv->idev[1]);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to setup input device\n");
+			return err;
+		}
+	}
 
-	return huawei_wmi_leds_setup(wdev);
+	return huawei_wmi_leds_setup(&pdev->dev);
 }
 
-static const struct wmi_device_id huawei_wmi_id_table[] = {
-	{ .guid_string = WMI0_EVENT_GUID },
-	{ .guid_string = HWMI_EVENT_GUID },
-	{  }
-};
+static int huawei_wmi_remove(struct platform_device *pdev)
+{
+	if (wmi_has_guid(WMI0_EVENT_GUID))
+		wmi_remove_notify_handler(WMI0_EVENT_GUID);
+
+	if (wmi_has_guid(HWMI_EVENT_GUID))
+		wmi_remove_notify_handler(HWMI_EVENT_GUID);
 
-static struct wmi_driver huawei_wmi_driver = {
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
+	if (err)
+		return err;
+
+	huawei_wmi_pdev = platform_device_register_simple("huawei-wmi", -1, NULL, 0);
+	if (IS_ERR(huawei_wmi_pdev)) {
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
 MODULE_DESCRIPTION("Huawei WMI laptop extras driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1
