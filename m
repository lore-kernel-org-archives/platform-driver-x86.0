From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v5 3/6] platform/x86: huawei-wmi: Implement huawei wmi management
Date: Mon, 23 Sep 2019 22:48:08 -0400
Message-ID: <20190924024821.497-4-ayman.bagabas@gmail.com>
References: <20190924024821.497-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924024821.497-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sinan Kaya <okaya@kernel.org>, Takashi Iwai <tiwai@suse.de>, Ayman Bagabas <ayman.bagabas@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>, Matan Ziv-Av <matan@svgalib.org>, Hans de Goede <hdegoede@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Huawei Matebook laptops come with a WMI management interface that can
control various aspects of the device. This interface is also found on
the old Matebook X released in 2017.

Use that to control the mic mute LED.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 217 +++++++++++++++++++++++++-----
 1 file changed, 180 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 0e919bf56ad1..41904b1cc284 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -11,18 +11,35 @@
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
+
+union hwmi_arg {
+	u64 cmd;
+	u8 args[8];
+};
+
 struct quirk_entry {
 	bool battery_reset;
 	bool ec_micmute;
@@ -35,8 +52,8 @@ struct huawei_wmi {
 	struct input_dev *idev[2];
 	struct led_classdev cdev;
 	struct platform_device *pdev;
-	acpi_handle handle;
-	char *acpi_method;
+
+	struct mutex wmi_lock;
 };
 
 struct huawei_wmi *huawei_wmi;
@@ -110,52 +127,168 @@ static const struct dmi_system_id huawei_quirks[] = {
 	{  }
 };
 
+/* Utils */
+
+static int huawei_wmi_call(struct acpi_buffer *in, struct acpi_buffer *out)
+{
+	acpi_status status;
+
+	mutex_lock(&huawei_wmi->wmi_lock);
+	status = wmi_evaluate_method(HWMI_METHOD_GUID, 0, 1, in, out);
+	mutex_unlock(&huawei_wmi->wmi_lock);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&huawei_wmi->pdev->dev, "Failed to evaluate wmi method\n");
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
+static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
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
+		err = huawei_wmi_call(&in, &out);
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
+				dev_err(&huawei_wmi->pdev->dev, "Bad buffer length, got %d\n", obj->buffer.length);
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
+				dev_err(&huawei_wmi->pdev->dev, "Bad package count, got %d\n", obj->package.count);
+				err = -EIO;
+				goto fail_cmd;
+			}
+
+			obj = &obj->package.elements[1];
+			if (obj->type != ACPI_TYPE_BUFFER) {
+				dev_err(&huawei_wmi->pdev->dev, "Bad package element type, got %d\n", obj->type);
+				err = -EIO;
+				goto fail_cmd;
+			}
+			len = obj->buffer.length;
+
+			break;
+		/* Shouldn't get here! */
+		default:
+			dev_err(&huawei_wmi->pdev->dev, "Unexpected obj type, got: %d\n", obj->type);
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
+/* LEDs */
+
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		enum led_brightness brightness)
 {
-	struct huawei_wmi *huawei = dev_get_drvdata(led_cdev->dev->parent);
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
-	if (strcmp(huawei->acpi_method, "SPIN") == 0) {
-		args[0].integer.value = 0;
-		args[2].integer.value = brightness ? 1 : 0;
-	} else if (strcmp(huawei->acpi_method, "WPIN") == 0) {
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
+		if (!handle)
+			return -ENODEV;
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
+		union hwmi_arg arg;
 
-	status = acpi_evaluate_object(huawei->handle, huawei->acpi_method, &arg_list, NULL);
-	if (ACPI_FAILURE(status))
-		return -ENXIO;
+		arg.cmd = MICMUTE_LED_SET;
+		arg.args[2] = brightness;
 
-	return 0;
+		return huawei_wmi_cmd(arg.cmd, NULL, 0);
+	}
 }
 
 static void huawei_wmi_leds_setup(struct device *dev)
 {
 	struct huawei_wmi *huawei = dev_get_drvdata(dev);
 
-	huawei->handle = ec_get_handle();
-	if (!huawei->handle)
-		return;
-
-	if (acpi_has_method(huawei->handle, "SPIN"))
-		huawei->acpi_method = "SPIN";
-	else if (acpi_has_method(huawei->handle, "WPIN"))
-		huawei->acpi_method = "WPIN";
-	else
-		return;
-
 	huawei->cdev.name = "platform::micmute";
 	huawei->cdev.max_brightness = 1;
 	huawei->cdev.brightness_set_blocking = &huawei_wmi_micmute_led_set;
@@ -258,6 +391,7 @@ static void huawei_wmi_input_exit(struct device *dev, const char *guid)
 
 static const struct wmi_device_id huawei_wmi_events_id_table[] = {
 	{ .guid_string = WMI0_EVENT_GUID },
+	{ .guid_string = HWMI_EVENT_GUID },
 	{  }
 };
 
@@ -284,7 +418,12 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 		guid++;
 	}
 
-	huawei_wmi_leds_setup(&pdev->dev);
+	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		mutex_init(&huawei_wmi->wmi_lock);
+
+		huawei_wmi_leds_setup(&pdev->dev);
+	}
+
 	return 0;
 }
 
@@ -299,6 +438,9 @@ static int huawei_wmi_remove(struct platform_device *pdev)
 		guid++;
 	}
 
+	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+	}
+
 	return 0;
 }
 
@@ -354,6 +496,7 @@ static __exit void huawei_wmi_exit(void)
 module_init(huawei_wmi_init);
 module_exit(huawei_wmi_exit);
 
+MODULE_ALIAS("wmi:"HWMI_METHOD_GUID);
 MODULE_DEVICE_TABLE(wmi, huawei_wmi_events_id_table);
 MODULE_AUTHOR("Ayman Bagabas <ayman.bagabas@gmail.com>");
 MODULE_DESCRIPTION("Huawei WMI laptop extras driver");
-- 
2.21.0
