From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 06/11] mux: Add Pericom PI3USB30532 Type-C mux driver
Date: Fri,  1 Sep 2017 23:48:40 +0200
Message-ID: <20170901214845.7153-7-hdegoede@redhat.com>
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

Add a driver for the Pericom PI3USB30532 Type-C cross switch /
mux chip found on some devices with a Type-C port.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mux/Kconfig       | 10 +++++
 drivers/mux/Makefile      |  2 +
 drivers/mux/pi3usb30532.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 drivers/mux/pi3usb30532.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 17938918bf93..19a3065c34e6 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -58,4 +58,14 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_PI3USB30532
+	tristate "Pericom PI3USB30532 Type-C cross switch driver"
+	depends on I2C
+	help
+	  This driver adds support for the Pericom PI3USB30532 Type-C cross
+	  switch / mux chip found on some devices with a Type-C port.
+
+	  To compile the driver as a module, choose M here: the module will
+	  be called mux-pi3usb30532.
+
 endmenu
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index a12e812c7966..7563dbf04593 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -7,9 +7,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
 mux-intel_cht_usb_mux-objs	:= intel_cht_usb_mux.o
+mux-pi3usb30532-objs		:= pi3usb30532.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
 obj-$(CONFIG_MUX_CHT_USB_MUX)	+= mux-intel_cht_usb_mux.o
+obj-$(CONFIG_MUX_PI3USB30532)	+= mux-pi3usb30532.o
diff --git a/drivers/mux/pi3usb30532.c b/drivers/mux/pi3usb30532.c
new file mode 100644
index 000000000000..fa8abd851520
--- /dev/null
+++ b/drivers/mux/pi3usb30532.c
@@ -0,0 +1,97 @@
+/*
+ * Pericom PI3USB30532 Type-C cross switch / mux driver
+ *
+ * Copyright (c) 2017 Hans de Goede <hdegoede@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation, or (at your option)
+ * any later version.
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mux/consumer.h> /* For the MUX_USB_* defines */
+#include <linux/mux/driver.h>
+
+#define PI3USB30532_CONF			0x00
+
+#define PI3USB30532_CONF_OPEN			0x00
+#define PI3USB30532_CONF_SWAP			0x01
+#define PI3USB30532_CONF_4LANE_DP		0x02
+#define PI3USB30532_CONF_USB3			0x04
+#define PI3USB30532_CONF_USB3_AND_2LANE_DP	0x06
+
+struct pi3usb30532_mux {
+	struct i2c_client *client;
+};
+
+static int pi3usb30532_mux_set_mux(struct mux_control *mux_ctrl, int state)
+{
+	struct pi3usb30532_mux *mux = mux_chip_priv(mux_ctrl->chip);
+	u8 conf = PI3USB30532_CONF_OPEN;
+
+	switch (state & ~MUX_USB_POLARITY_INV) {
+	case MUX_USB_NONE:
+		conf = PI3USB30532_CONF_OPEN;
+		break;
+	case MUX_USB_DEVICE:
+	case MUX_USB_HOST:
+		conf = PI3USB30532_CONF_USB3;
+		break;
+	case MUX_USB_HOST_AND_DP_SRC:
+		conf = PI3USB30532_CONF_USB3_AND_2LANE_DP;
+		break;
+	case MUX_USB_DP_SRC:
+		conf = PI3USB30532_CONF_4LANE_DP;
+		break;
+	}
+
+	if (state & MUX_USB_POLARITY_INV)
+		conf |= PI3USB30532_CONF_SWAP;
+
+	return i2c_smbus_write_byte_data(mux->client, PI3USB30532_CONF, conf);
+}
+
+static const struct mux_control_ops pi3usb30532_mux_ops = {
+	.set = pi3usb30532_mux_set_mux,
+};
+
+static int pi3usb30532_mux_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct pi3usb30532_mux *mux;
+	struct mux_chip *mux_chip;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*mux));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	mux_chip->ops = &pi3usb30532_mux_ops;
+	mux_chip->mux[0].states = MUX_USB_STATES;
+	mux = mux_chip_priv(mux_chip);
+	mux->client = client;
+
+	return devm_mux_chip_register(dev, mux_chip);
+}
+
+static const struct i2c_device_id pi3usb30532_mux_table[] = {
+	{ "pi3usb30532" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pi3usb30532_mux_table);
+
+static struct i2c_driver pi3usb30532_mux_driver = {
+	.driver = {
+		.name = "pi3usb30532",
+	},
+	.probe_new = pi3usb30532_mux_probe,
+	.id_table = pi3usb30532_mux_table,
+};
+
+module_i2c_driver(pi3usb30532_mux_driver);
+
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("Pericom PI3USB30532 Type-C mux driver");
+MODULE_LICENSE("GPL");
-- 
2.13.5
