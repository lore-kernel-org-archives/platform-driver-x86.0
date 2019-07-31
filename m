From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 5/9] platform/x86: huawei-wmi: Control micmute led through wmi interface
Date: Wed, 31 Jul 2019 13:52:51 -0400
Message-ID: <20190731175255.25676-6-ayman.bagabas@gmail.com>
References: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Now that huawei WMI management interface is implemented, micmute LED can
be controlled easily through this interface. Exception is the Matebook X
(2017) which continue to uses ACPI EC method to control the LED. This
model can control the LED through the legacy WMI interface which is not
implemented ATM.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 86 ++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 8f918138053a..9013a05d2832 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -46,8 +46,6 @@ static struct quirk_entry *quirks;
 struct huawei_wmi_priv {
 	struct input_dev *idev[2];
 	struct led_classdev cdev;
-	acpi_handle handle;
-	char *acpi_method;
 	struct mutex wmi_lock;
 	struct platform_device *pdev;
 };
@@ -238,49 +236,57 @@ static int huawei_wmi_cmd(struct device *dev, u64 arg, u8 *buf, size_t buflen)
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		enum led_brightness brightness)
 {
-	struct huawei_wmi_priv *priv = dev_get_drvdata(led_cdev->dev->parent);
-	acpi_status status;
-	union acpi_object args[3];
-	struct acpi_object_list arg_list = {
-		.pointer = args,
-		.count = ARRAY_SIZE(args),
-	};
-
-	args[0].type = args[1].type = args[2].type = ACPI_TYPE_INTEGER;
-	args[1].integer.value = 0x04;
-
-	if (strcmp(priv->acpi_method, "SPIN") == 0) {
-		args[0].integer.value = 0;
-		args[2].integer.value = brightness ? 1 : 0;
-	} else if (strcmp(priv->acpi_method, "WPIN") == 0) {
-		args[0].integer.value = 1;
-		args[2].integer.value = brightness ? 0 : 1;
+	/* This is a workaround until the "legacy" interface is implemented. */
+	if (quirks && quirks->ec_micmute) {
+		char *acpi_method;
+		acpi_handle handle;
+		acpi_status status;
+		union acpi_object args[3];
+		struct acpi_object_list arg_list = {
+			.pointer = args,
+			.count = ARRAY_SIZE(args),
+		};
+
+		handle = ec_get_handle();
+		if (!handle) {
+			dev_err(led_cdev->dev->parent, "Failed to get EC handle\n");
+			return -ENODEV;
+		}
+
+		args[0].type = args[1].type = args[2].type = ACPI_TYPE_INTEGER;
+		args[1].integer.value = 0x04;
+
+		if (acpi_has_method(handle, "SPIN")) {
+			acpi_method = "SPIN";
+			args[0].integer.value = 0;
+			args[2].integer.value = brightness ? 1 : 0;
+		} else if (acpi_has_method(handle, "WPIN")) {
+			acpi_method = "WPIN";
+			args[0].integer.value = 1;
+			args[2].integer.value = brightness ? 0 : 1;
+		} else {
+			return -ENODEV;
+		}
+
+		status = acpi_evaluate_object(handle, acpi_method, &arg_list, NULL);
+		if (ACPI_FAILURE(status))
+			return -ENODEV;
+
+		return 0;
 	} else {
-		return -EINVAL;
-	}
+		u8 arg[8];
 
-	status = acpi_evaluate_object(priv->handle, priv->acpi_method, &arg_list, NULL);
-	if (ACPI_FAILURE(status))
-		return -ENXIO;
+		*(u64 *)arg = MICMUTE_LED_SET;
+		arg[2] = brightness;
 
-	return 0;
+		return huawei_wmi_cmd(led_cdev->dev->parent, *(u64 *)arg, NULL, NULL);
+	}
 }
 
 static int huawei_wmi_leds_setup(struct device *dev)
 {
 	struct huawei_wmi_priv *priv = dev_get_drvdata(dev);
 
-	priv->handle = ec_get_handle();
-	if (!priv->handle)
-		return 0;
-
-	if (acpi_has_method(priv->handle, "SPIN"))
-		priv->acpi_method = "SPIN";
-	else if (acpi_has_method(priv->handle, "WPIN"))
-		priv->acpi_method = "WPIN";
-	else
-		return 0;
-
 	priv->cdev.name = "platform::micmute";
 	priv->cdev.max_brightness = 1;
 	priv->cdev.brightness_set_blocking = huawei_wmi_micmute_led_set;
@@ -412,9 +418,15 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
 		mutex_init(&priv->wmi_lock);
+
+		err = huawei_wmi_leds_setup(&pdev->dev);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to setup leds\n");
+			return err;
+		}
 	}
 
-	return huawei_wmi_leds_setup(&pdev->dev);
+	return 0;
 }
 
 static int huawei_wmi_remove(struct platform_device *pdev)
-- 
2.20.1
