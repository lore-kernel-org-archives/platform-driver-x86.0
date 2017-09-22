From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 14/14] platform/x86: intel_cht_int33fe: Add mux mappings for the Type-C port
Date: Fri, 22 Sep 2017 20:38:03 +0200
Message-ID: <20170922183803.10701-14-hdegoede@redhat.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170922183803.10701-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We need to add mappings for the mux subsys to be able to find the
muxes for the fusb302 driver to be able to control the PI3USB30532
Type-C mux and the device/host mux integrated in the CHT SoC.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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
2.14.1
