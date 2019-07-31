From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 3/9] platform/x86: huawei-wmi: Implement huawei wmi management interface
Date: Wed, 31 Jul 2019 13:52:49 -0400
Message-ID: <20190731175255.25676-4-ayman.bagabas@gmail.com>
References: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731175255.25676-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Huawei Matebook laptops come with a WMI management interface that can
control various aspects of the device. This interface is also found on
the old Matebook X released in 2017.

Implement basic functionality of this interface along with supported
command IDs that are implemented in this series.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 130 ++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 12cae450fc1f..27520b0f8956 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -10,24 +10,36 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/wmi.h>
 
 /*
  * Huawei WMI GUIDs
  */
+#define HWMI_METHOD_GUID "ABBC0F5B-8EA1-11D1-A000-C90629100000"
 #define HWMI_EVENT_GUID "ABBC0F5C-8EA1-11D1-A000-C90629100000"
 
 /* Legacy GUIDs */
 #define WMI0_EXPENSIVE_GUID "39142400-C6A3-40fa-BADB-8A2652834100"
 #define WMI0_EVENT_GUID "59142400-C6A3-40fa-BADB-8A2652834100"
 
+/* HWMI commands */
+
+enum {
+	BATTERY_THRESH_GET		= 0x00001103, /* \GBTT */
+	BATTERY_THRESH_SET		= 0x00001003, /* \SBTT */
+	FN_LOCK_GET			= 0x00000604, /* \GFRS */
+	FN_LOCK_SET			= 0x00000704, /* \SFRS */
+	MICMUTE_LED_SET			= 0x00000b04, /* \SMLS */
+};
 
 struct huawei_wmi_priv {
 	struct input_dev *idev[2];
 	struct led_classdev cdev;
 	acpi_handle handle;
 	char *acpi_method;
+	struct mutex wmi_lock;
 	struct platform_device *pdev;
 };
 
@@ -50,6 +62,116 @@ static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_END,	 0 }
 };
 
+/* Utils */
+
+static int huawei_wmi_call(struct device *dev, struct acpi_buffer *in,
+		struct acpi_buffer *out)
+{
+	struct huawei_wmi_priv *priv = dev_get_drvdata(dev);
+	acpi_status status;
+
+	mutex_lock(&priv->wmi_lock);
+	status = wmi_evaluate_method(HWMI_METHOD_GUID, 0, 1, in, out);
+	mutex_unlock(&priv->wmi_lock);
+	if (ACPI_FAILURE(status)) {
+		dev_err(dev, "Failed to evaluate wmi method\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/* HWMI takes a 64 bit input and returns either a package with 2 buffers, one of
+ * 4 bytes and the other of 256 bytes, or one buffer of size 0x104 (260) bytes.
+ * The first 4 bytes are ignored, we ignore the first 4 bytes buffer if we got a
+ * package, or skip the first 4 if a buffer of 0x104 is used. The first byte of
+ * the remaining 0x100 sized buffer has the return status of every call. In case
+ * the return status is non-zero, we return -ENODEV but still copy the returned
+ * buffer to the given buffer parameter (buf).
+ */
+static int huawei_wmi_cmd(struct device *dev, u64 arg, u8 *buf, size_t buflen)
+{
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer in;
+	union acpi_object *obj;
+	size_t len;
+	int err, i;
+
+	in.length = sizeof(arg);
+	in.pointer = &arg;
+
+	/* Some models require calling HWMI twice to execute a command. We evaluate
+	 * HWMI and if we get a non-zero return status we evaluate it again.
+	 */
+	for (i = 0; i < 2; i++) {
+		err = huawei_wmi_call(dev,  &in, &out);
+		if (err)
+			goto fail_cmd;
+
+		obj = out.pointer;
+		if (!obj) {
+			err = -EIO;
+			goto fail_cmd;
+		}
+
+		switch (obj->type) {
+		/* Models that implement both "legacy" and HWMI tend to return a 0x104
+		 * sized buffer instead of a package of 0x4 and 0x100 buffers.
+		 */
+		case ACPI_TYPE_BUFFER:
+			if (obj->buffer.length == 0x104) {
+				// Skip the first 4 bytes.
+				obj->buffer.pointer += 4;
+				len = 0x100;
+			} else {
+				dev_err(dev, "Bad buffer length, got %d\n", obj->buffer.length);
+				err = -EIO;
+				goto fail_cmd;
+			}
+
+			break;
+		/* HWMI returns a package with 2 buffer elements, one of 4 bytes and the
+		 * other is 256 bytes.
+		 */
+		case ACPI_TYPE_PACKAGE:
+			if (obj->package.count != 2) {
+				dev_err(dev, "Bad package count, got %d\n", obj->package.count);
+				err = -EIO;
+				goto fail_cmd;
+			}
+
+			obj = &obj->package.elements[1];
+			if (obj->type != ACPI_TYPE_BUFFER) {
+				dev_err(dev, "Bad package element type, got %d\n", obj->type);
+				err = -EIO;
+				goto fail_cmd;
+			}
+			len = obj->buffer.length;
+
+			break;
+		/* Shouldn't get here! */
+		default:
+			dev_err(dev, "Unexpected obj type, got: %d\n", obj->type);
+			err = -EIO;
+			goto fail_cmd;
+		}
+
+		if (!*obj->buffer.pointer)
+			break;
+	}
+
+	err = (*obj->buffer.pointer) ? -ENODEV : 0;
+
+	if (buf) {
+		len = min(buflen, len);
+		memcpy(buf, obj->buffer.pointer, len);
+	}
+
+fail_cmd:
+	kfree(out.pointer);
+	return err;
+}
+
 /* LEDs */
 
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
@@ -222,6 +344,10 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		mutex_init(&priv->wmi_lock);
+	}
+
 	return huawei_wmi_leds_setup(&pdev->dev);
 }
 
@@ -233,6 +359,9 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 	if (wmi_has_guid(HWMI_EVENT_GUID))
 		wmi_remove_notify_handler(HWMI_EVENT_GUID);
 
+	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+	}
+
 	return 0;
 }
 
@@ -272,6 +401,7 @@ module_exit(huawei_wmi_exit);
 
 MODULE_ALIAS("wmi:"WMI0_EVENT_GUID);
 MODULE_ALIAS("wmi:"HWMI_EVENT_GUID);
+MODULE_ALIAS("wmi:"HWMI_METHOD_GUID);
 MODULE_AUTHOR("Ayman Bagabas <ayman.bagabas@gmail.com>");
 MODULE_DESCRIPTION("Huawei WMI laptop extras driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1
