From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: [PATCH 4/4] platform/x86: topstar-laptop: add optional WLAN LED
 workaround
Date: Tue, 17 Oct 2017 18:18:39 +0200
Message-ID: <2c2f8077e8d39fca1cacae0fbe69486ffeb3ab4b.1508255487.git.gdouezangrard@gmail.com>
References: <cover.1508255487.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1508255487.git.gdouezangrard@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Topstar U931 laptops provide an LED synced with the WLAN adapter
hard-blocking state. Unfortunately, some models seem to be defective,
making impossible to hard-block the adapter with the WLAN switch and
thus the LED is useless.

An ACPI method is available to programmatically control this switch and
it indirectly allows to control the LED.

This commit registers the LED within the corresponding subsystem, making
possible for instance to use an rfkill-based trigger to synchronize the
LED with the soft-blocking state.

This feature is disabled by default and can be enabled with the
`led_workaround` module parameter.

Signed-off-by: Guillaume Douézan-Grard <gdouezangrard@gmail.com>
---
 drivers/platform/x86/Kconfig          |  2 +
 drivers/platform/x86/topstar-laptop.c | 83 +++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 80b87954f6dd..392f09066a80 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -684,6 +684,8 @@ config TOPSTAR_LAPTOP
 	depends on ACPI
 	depends on INPUT
 	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
+	select NEW_LEDS
 	---help---
 	  This driver adds support for hotkeys found on Topstar laptops.
 
diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index e2ee1e5cc734..f57a082fb75f 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -22,15 +22,87 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/leds.h>
 
 #define TOPSTAR_LAPTOP_CLASS "topstar"
 
+static bool led_workaround;
+module_param_named(led_workaround, led_workaround, bool, 0444);
+MODULE_PARM_DESC(led_workaround,
+		"Enables software-based WLAN LED control on systems with defective hardware switch");
+
 struct topstar_laptop {
 	struct acpi_device *device;
 	struct platform_device *platform;
 	struct input_dev *input;
+	struct led_classdev led;
 };
 
+/*
+ * LED
+ */
+
+static enum led_brightness topstar_led_get(struct led_classdev *led)
+{
+	return led->brightness;
+}
+
+static int topstar_led_set(struct led_classdev *led,
+		enum led_brightness state)
+{
+	struct topstar_laptop *topstar = container_of(led,
+			struct topstar_laptop, led);
+
+	struct acpi_object_list params;
+	union acpi_object in_obj;
+	unsigned long long int ret;
+	acpi_status status;
+
+	params.count = 1;
+	params.pointer = &in_obj;
+	in_obj.type = ACPI_TYPE_INTEGER;
+	in_obj.integer.value = 0x83;
+
+	/*
+	 * Topstar ACPI returns 0x30001 when the LED is ON and 0x30000 when it
+	 * is OFF.
+	 */
+	status = acpi_evaluate_integer(topstar->device->handle,
+			"GETX", &params, &ret);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	/*
+	 * FNCX(0x83) toggles the LED (more precisely, it is supposed to
+	 * act as an hardware switch and disconnect the WLAN adapter but
+	 * it seems to be faulty on some models like the Topstar U931
+	 * Notebook).
+	 */
+	if ((ret == 0x30001 && state == LED_OFF)
+			|| (ret == 0x30000 && state != LED_OFF)) {
+		status = acpi_execute_simple_method(topstar->device->handle,
+				"FNCX", 0x83);
+		if (ACPI_FAILURE(status))
+			return -1;
+	}
+
+	return 0;
+}
+
+static int topstar_led_init(struct topstar_laptop *topstar)
+{
+	topstar->led.name = "topstar::wlan";
+	topstar->led.brightness_get = topstar_led_get;
+	topstar->led.brightness_set_blocking = topstar_led_set;
+	topstar->led.default_trigger = "rfkill0";
+	return led_classdev_register(&topstar->platform->dev, &topstar->led);
+}
+
+static void topstar_led_exit(struct topstar_laptop *topstar)
+{
+	led_classdev_unregister(&topstar->led);
+}
+
 /*
  * Input
  */
@@ -218,8 +290,16 @@ static int topstar_acpi_add(struct acpi_device *device)
 	if (err)
 		goto err_acpi_input;
 
+	if (led_workaround) {
+		err = topstar_led_init(topstar);
+		if (err)
+			goto err_acpi_led;
+	}
+
 	return 0;
 
+err_acpi_led:
+	topstar_input_exit(topstar);
 err_acpi_input:
 	topstar_platform_exit(topstar);
 err_acpi_platform:
@@ -233,6 +313,9 @@ static int topstar_acpi_remove(struct acpi_device *device)
 {
 	struct topstar_laptop *topstar = acpi_driver_data(device);
 
+	if (led_workaround)
+		topstar_led_exit(topstar);
+
 	topstar_input_exit(topstar);
 	topstar_platform_exit(topstar);
 	topstar_acpi_exit(topstar);
-- 
2.14.1
