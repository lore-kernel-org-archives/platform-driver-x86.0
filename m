From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 11/11] platform/x86: intel_cht_int33fe: Add mux mappings for the Type-C port
Date: Tue,  5 Sep 2017 18:42:21 +0200
Message-ID: <20170905164221.11266-12-hdegoede@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905164221.11266-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

We need to add mappings for the mux subsys to be able to find the
muxes for the fusb302 driver to be able to control the PI3USB30532
Type-C mux and the device/host mux integrated in the CHT SoC.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/Kconfig             |  1 +
 drivers/platform/x86/intel_cht_int33fe.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 312d2472b8b3..830ff8d0a1eb 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -794,6 +794,7 @@ config ACPI_CMPC
 config INTEL_CHT_INT33FE
 	tristate "Intel Cherry Trail ACPI INT33FE Driver"
 	depends on X86 && ACPI && I2C && REGULATOR
+	select MULTIPLEXER
 	---help---
 	  This driver add support for the INT33FE ACPI device found on
 	  some Intel Cherry Trail devices.
diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
index b2925d996613..89ba510dac78 100644
--- a/drivers/platform/x86/intel_cht_int33fe.c
+++ b/drivers/platform/x86/intel_cht_int33fe.c
@@ -24,6 +24,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/mux/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -35,6 +36,19 @@ struct cht_int33fe_data {
 	struct i2c_client *pi3usb30532;
 };
 
+static struct mux_lookup cht_int33fe_mux_lookup[] = {
+	{
+		.provider = "i2c-pi3usb30532",
+		.dev_id   = "i2c-fusb302",
+		.mux_name = "type-c-mode-mux",
+	},
+	{
+		.provider = "intel_cht_usb_mux",
+		.dev_id   = "i2c-fusb302",
+		.mux_name = "usb-role-mux",
+	},
+};
+
 /*
  * Grrr I severly dislike buggy BIOS-es. At least one BIOS enumerates
  * the max17047 both through the INT33FE ACPI device (it is right there
@@ -177,6 +191,9 @@ static int cht_int33fe_probe(struct i2c_client *client)
 	board_info.properties = fusb302_props;
 	board_info.irq = fusb302_irq;
 
+	mux_add_table(cht_int33fe_mux_lookup,
+		      ARRAY_SIZE(cht_int33fe_mux_lookup));
+
 	data->fusb302 = i2c_acpi_new_device(dev, 2, &board_info);
 	if (!data->fusb302)
 		goto out_unregister_max17047;
@@ -200,6 +217,9 @@ static int cht_int33fe_probe(struct i2c_client *client)
 	if (data->max17047)
 		i2c_unregister_device(data->max17047);
 
+	mux_remove_table(cht_int33fe_mux_lookup,
+		      ARRAY_SIZE(cht_int33fe_mux_lookup));
+
 	return -EPROBE_DEFER; /* Wait for the i2c-adapter to load */
 }
 
@@ -212,6 +232,9 @@ static int cht_int33fe_remove(struct i2c_client *i2c)
 	if (data->max17047)
 		i2c_unregister_device(data->max17047);
 
+	mux_remove_table(cht_int33fe_mux_lookup,
+		      ARRAY_SIZE(cht_int33fe_mux_lookup));
+
 	return 0;
 }
 
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
