From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 03/11] mux: core: Add usb.h header with MUX_USB_* and and MUX_TYPEC_* state constants
Date: Tue,  5 Sep 2017 18:42:13 +0200
Message-ID: <20170905164221.11266-4-hdegoede@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905164221.11266-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add MUX_USB_* and MUX_TYPEC_* state constant defines, which can be used by
USB device/host, resp. Type-C polarity/role/altmode mux drivers and
consumers to ensure that they agree on the meaning of the
mux_control_select() state argument.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Start numbering of defines at 0 not 1
-Use a new usb.h header, rather then adding these to consumer.h
-Add separate MUX_USB_* and MUX_TYPEC_* defines
---
 include/linux/mux/usb.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/linux/mux/usb.h

diff --git a/include/linux/mux/usb.h b/include/linux/mux/usb.h
new file mode 100644
index 000000000000..44df5eca5256
--- /dev/null
+++ b/include/linux/mux/usb.h
@@ -0,0 +1,32 @@
+/*
+ * mux/usb.h - definitions for USB multiplexers
+ *
+ * Copyright (C) 2017 Hans de Goede <hdegoede@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef _LINUX_MUX_USB_H
+#define _LINUX_MUX_USB_H
+
+/* Mux state values for USB device/host role muxes */
+#define MUX_USB_DEVICE		(0) /* USB device mode */
+#define MUX_USB_HOST		(1) /* USB host mode */
+#define MUX_USB_STATES		(2)
+
+/*
+ * Mux state values for Type-C polarity/role/altmode muxes.
+ *
+ * MUX_TYPEC_POLARITY_INV may be or-ed together with any other mux-state as
+ * inverted-polarity (Type-C plugged in upside down) can happen with any
+ * other mux-state.
+ */
+#define MUX_TYPEC_POLARITY_INV		BIT(0)   /* Polarity inverted bit */
+#define MUX_TYPEC_DEVICE		(0 << 1) /* USB device mode */
+#define MUX_TYPEC_HOST			(1 << 1) /* USB host mode */
+#define MUX_TYPEC_HOST_AND_DP_SRC	(2 << 1) /* USB host + 2 lanes DP src */
+#define MUX_TYPEC_DP_SRC		(3 << 1) /* 4 lanes Display Port src */
+#define MUX_TYPEC_STATES		(4 << 1)
+
+#endif /* _LINUX_MUX_TYPEC_H */
-- 
2.13.5
