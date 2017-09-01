From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 11/11] platform/x86: intel_cht_int33fe: Add mux mappings for
 the Type-C port
Date: Fri,  1 Sep 2017 23:48:45 +0200
Message-ID: <20170901214845.7153-12-hdegoede@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170901214845.7153-1-hdegoede@redhat.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

We need to add mappings for the mux subsys to be able to find the
muxes for the fusb302 driver to be able to control the PI3USB30532
Type-C mux and the device/host mux integrated in the CHT SoC.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig             |  1 +
 drivers/platform/x86/intel_cht_int33fe.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c5554577681a..4256e05ee584 100644
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
index 24a1662be81d..611b8af9cefd 100644
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
@@ -170,6 +184,9 @@ static int cht_int33fe_probe(struct i2c_client *client)
 	board_info.properties = fusb302_props;
 	board_info.irq = fusb302_irq;
 
+	mux_add_table(cht_int33fe_mux_lookup,
+		      ARRAY_SIZE(cht_int33fe_mux_lookup));
+
 	data->fusb302 = i2c_acpi_new_device(dev, 2, &board_info);
 	if (!data->fusb302)
 		goto out_unregister_max17047;
@@ -193,6 +210,9 @@ static int cht_int33fe_probe(struct i2c_client *client)
 	if (data->max17047)
 		i2c_unregister_device(data->max17047);
 
+	mux_remove_table(cht_int33fe_mux_lookup,
+		      ARRAY_SIZE(cht_int33fe_mux_lookup));
+
 	return -EPROBE_DEFER; /* Wait for the i2c-adapter to load */
 }
 
@@ -205,6 +225,9 @@ static int cht_int33fe_remove(struct i2c_client *i2c)
 	if (data->max17047)
 		i2c_unregister_device(data->max17047);
 
+	mux_remove_table(cht_int33fe_mux_lookup,
+		      ARRAY_SIZE(cht_int33fe_mux_lookup));
+
 	return 0;
 }
 
-- 
2.13.5
