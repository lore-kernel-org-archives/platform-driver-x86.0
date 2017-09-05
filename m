From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 07/11] extcon: intel-int3496: Add support for controlling the USB-role mux
Date: Tue,  5 Sep 2017 18:42:17 +0200
Message-ID: <20170905164221.11266-8-hdegoede@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905164221.11266-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Cherry Trail SoCs have a built-in USB-role mux for switching between
the host and device controllers, rather then using an external mux
controller by a GPIO.

There is a driver using the mux-subsys to control this mux, this
commit adds support to the intel-int3496 driver to get a mux_controller
handle for the mux and set the mux through the mux-subsys rather then
through a GPIO.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-Drop || COMPILE_TEST from Kconfig deepnds on, as we will now fail to
 compile on !X86
-Minor code style tweaks
---
 drivers/extcon/Kconfig                |  3 +-
 drivers/extcon/extcon-intel-int3496.c | 59 +++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index a7bca4207f44..168f9d710ea0 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -44,7 +44,8 @@ config EXTCON_GPIO
 
 config EXTCON_INTEL_INT3496
 	tristate "Intel INT3496 ACPI device extcon driver"
-	depends on GPIOLIB && ACPI && (X86 || COMPILE_TEST)
+	depends on GPIOLIB && ACPI && X86
+	select MULTIPLEXER
 	help
 	  Say Y here to enable extcon support for USB OTG ports controlled by
 	  an Intel INT3496 ACPI device.
diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index 1a45e745717d..3c8e17449c12 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -23,8 +23,13 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/mux/consumer.h>
+#include <linux/mux/usb.h>
 #include <linux/platform_device.h>
 
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
 #define INT3496_GPIO_USB_ID	0
 #define INT3496_GPIO_VBUS_EN	1
 #define INT3496_GPIO_USB_MUX	2
@@ -37,6 +42,8 @@ struct int3496_data {
 	struct gpio_desc *gpio_usb_id;
 	struct gpio_desc *gpio_vbus_en;
 	struct gpio_desc *gpio_usb_mux;
+	struct mux_control *usb_mux;
+	bool usb_mux_set;
 	int usb_id_irq;
 };
 
@@ -56,11 +63,32 @@ static const struct acpi_gpio_mapping acpi_int3496_default_gpios[] = {
 	{ },
 };
 
+static struct mux_lookup acpi_int3496_cht_mux_lookup[] = {
+	{
+		.provider = "intel_cht_usb_mux",
+		.dev_id   = "INT3496:00",
+		.mux_name = "usb-role-mux",
+	},
+};
+
+#define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
+
+static const struct x86_cpu_id cht_cpu_ids[] = {
+	ICPU(INTEL_FAM6_ATOM_AIRMONT),		/* Braswell, Cherry Trail */
+	{}
+};
+
+static bool int3496_soc_has_mux(void)
+{
+	return x86_match_cpu(cht_cpu_ids);
+}
+
 static void int3496_do_usb_id(struct work_struct *work)
 {
 	struct int3496_data *data =
 		container_of(work, struct int3496_data, work.work);
 	int id = gpiod_get_value_cansleep(data->gpio_usb_id);
+	int ret;
 
 	/* id == 1: PERIPHERAL, id == 0: HOST */
 	dev_dbg(data->dev, "Connected %s cable\n", id ? "PERIPHERAL" : "HOST");
@@ -72,6 +100,22 @@ static void int3496_do_usb_id(struct work_struct *work)
 	if (!IS_ERR(data->gpio_usb_mux))
 		gpiod_direction_output(data->gpio_usb_mux, id);
 
+	if (data->usb_mux) {
+		/*
+		 * The mux framework expects multiple competing users, we must
+		 * release our previous setting before applying the new one.
+		 */
+		if (data->usb_mux_set)
+			mux_control_deselect(data->usb_mux);
+
+		ret = mux_control_select(data->usb_mux,
+					 id ? MUX_USB_DEVICE : MUX_USB_HOST);
+		if (ret)
+			dev_err(data->dev, "Error setting mux: %d\n", ret);
+
+		data->usb_mux_set = ret == 0;
+	}
+
 	if (!IS_ERR(data->gpio_vbus_en))
 		gpiod_direction_output(data->gpio_vbus_en, !id);
 
@@ -107,6 +151,21 @@ static int int3496_probe(struct platform_device *pdev)
 	data->dev = dev;
 	INIT_DELAYED_WORK(&data->work, int3496_do_usb_id);
 
+	if (int3496_soc_has_mux()) {
+		mux_add_table(acpi_int3496_cht_mux_lookup,
+			      ARRAY_SIZE(acpi_int3496_cht_mux_lookup));
+		data->usb_mux = devm_mux_control_get(dev, "usb-role-mux");
+		/* Doing this here keeps our error handling clean. */
+		mux_remove_table(acpi_int3496_cht_mux_lookup,
+				 ARRAY_SIZE(acpi_int3496_cht_mux_lookup));
+		if (IS_ERR(data->usb_mux)) {
+			ret = PTR_ERR(data->usb_mux);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "can't get mux: %d\n", ret);
+			return ret;
+		}
+	}
+
 	data->gpio_usb_id = devm_gpiod_get(dev, "id", GPIOD_IN);
 	if (IS_ERR(data->gpio_usb_id)) {
 		ret = PTR_ERR(data->gpio_usb_id);
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
