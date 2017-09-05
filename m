From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 09/11] staging: typec: Add Generic TCPC mux driver using the mux subsys
Date: Tue,  5 Sep 2017 18:42:19 +0200
Message-ID: <20170905164221.11266-10-hdegoede@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905164221.11266-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

So far the mux functionality of the tcpm code has not been hooked up
in any tcpc drivers. This commit adds a generic TCPC mux driver using
the mux subsys, which tcpc drivers can use to provide mux functionality
in cases where an external my is used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/typec/Makefile       |   2 +-
 drivers/staging/typec/tcpc_gen_mux.c | 131 +++++++++++++++++++++++++++++++++++
 drivers/staging/typec/tcpm.h         |   2 +
 3 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/typec/tcpc_gen_mux.c

diff --git a/drivers/staging/typec/Makefile b/drivers/staging/typec/Makefile
index 30a7e29cbc9e..623d78114ee3 100644
--- a/drivers/staging/typec/Makefile
+++ b/drivers/staging/typec/Makefile
@@ -1,3 +1,3 @@
-obj-$(CONFIG_TYPEC_TCPM)	+= tcpm.o
+obj-$(CONFIG_TYPEC_TCPM)	+= tcpm.o tcpc_gen_mux.o
 obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
 obj-y				+= fusb302/
diff --git a/drivers/staging/typec/tcpc_gen_mux.c b/drivers/staging/typec/tcpc_gen_mux.c
new file mode 100644
index 000000000000..d40f9eaaddf5
--- /dev/null
+++ b/drivers/staging/typec/tcpc_gen_mux.c
@@ -0,0 +1,131 @@
+/*
+ * Generic TCPC mux driver using the mux subsys
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
+#include <linux/mux/consumer.h>
+#include <linux/mux/usb.h>
+#include "tcpm.h"
+
+struct tcpc_gen_mux_data {
+	struct tcpc_mux_dev mux;
+	struct device *dev;
+	struct mux_control *type_c_mode_mux; /* Type-C cross switch / mux */
+	struct mux_control *usb_role_mux;    /* USB Device / Host mode mux */
+	bool muxes_set;
+};
+
+static int tcpc_gen_mux_set(struct tcpc_mux_dev *mux_dev,
+			    enum tcpc_mux_mode mux_mode,
+			    enum tcpc_usb_switch usb_config,
+			    enum typec_cc_polarity polarity)
+{
+	struct tcpc_gen_mux_data *data =
+		container_of(mux_dev, struct tcpc_gen_mux_data, mux);
+	unsigned int typec_state = MUX_TYPEC_DEVICE;
+	unsigned int usb_state = MUX_USB_DEVICE;
+	int ret;
+
+	/* Put the muxes back in their open (idle) state */
+	if (data->muxes_set) {
+		mux_control_deselect(data->type_c_mode_mux);
+		if (data->usb_role_mux)
+			mux_control_deselect(data->usb_role_mux);
+		data->muxes_set = false;
+	}
+
+	switch (mux_mode) {
+	case TYPEC_MUX_NONE:
+		/* Muxes are in their open state, done. */
+		return 0;
+	case TYPEC_MUX_USB_DEVICE:
+		typec_state = MUX_TYPEC_DEVICE;
+		usb_state = MUX_USB_DEVICE;
+		break;
+	case TYPEC_MUX_USB_HOST:
+		typec_state = MUX_TYPEC_HOST;
+		usb_state = MUX_USB_HOST;
+		break;
+	case TYPEC_MUX_DP:
+		typec_state = MUX_TYPEC_DP_SRC;
+		break;
+	case TYPEC_MUX_DOCK:
+		typec_state = MUX_TYPEC_HOST_AND_DP_SRC;
+		usb_state = MUX_USB_HOST;
+		break;
+	}
+
+	if (polarity)
+		typec_state |= MUX_TYPEC_POLARITY_INV;
+
+	ret = mux_control_select(data->type_c_mode_mux, typec_state);
+	if (ret) {
+		dev_err(data->dev, "Error setting Type-C mode mux: %d\n", ret);
+		return ret;
+	}
+
+	if (!data->usb_role_mux)
+		goto out;
+
+	ret = mux_control_select(data->usb_role_mux, usb_state);
+	if (ret) {
+		dev_err(data->dev, "Error setting USB role mux: %d\n", ret);
+		mux_control_deselect(data->type_c_mode_mux);
+		return ret;
+	}
+
+out:
+	data->muxes_set = true;
+	return 0;
+}
+
+struct tcpc_mux_dev *devm_tcpc_gen_mux_create(struct device *dev)
+{
+	struct tcpc_gen_mux_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	data->type_c_mode_mux = devm_mux_control_get(dev, "type-c-mode-mux");
+	if (IS_ERR(data->type_c_mode_mux)) {
+		ret = PTR_ERR(data->type_c_mode_mux);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Error getting Type-C mux: %d\n", ret);
+		return ERR_PTR(-ret);
+	}
+
+	data->usb_role_mux = devm_mux_control_get(dev, "usb-role-mux");
+	if (IS_ERR(data->usb_role_mux)) {
+		ret = PTR_ERR(data->usb_role_mux);
+		/* The USB role mux is optional */
+		if (ret == -ENODEV) {
+			data->usb_role_mux = NULL;
+		} else {
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Error getting USB role mux: %d\n",
+					ret);
+			return ERR_PTR(-ret);
+		}
+	}
+
+	data->dev = dev;
+	data->mux.set = tcpc_gen_mux_set;
+
+	return &data->mux;
+}
+EXPORT_SYMBOL_GPL(devm_tcpc_gen_mux_create);
+
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("Generic Type-C mux driver using the mux subsys");
+MODULE_LICENSE("GPL");
diff --git a/drivers/staging/typec/tcpm.h b/drivers/staging/typec/tcpm.h
index f662eed48c86..36789005a2b0 100644
--- a/drivers/staging/typec/tcpm.h
+++ b/drivers/staging/typec/tcpm.h
@@ -164,4 +164,6 @@ void tcpm_pd_transmit_complete(struct tcpm_port *port,
 void tcpm_pd_hard_reset(struct tcpm_port *port);
 void tcpm_tcpc_reset(struct tcpm_port *port);
 
+struct tcpc_mux_dev *devm_tcpc_gen_mux_create(struct device *dev);
+
 #endif /* __LINUX_USB_TCPM_H */
-- 
2.13.5
