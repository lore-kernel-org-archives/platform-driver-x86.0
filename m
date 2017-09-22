From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 05/14] mux: core: Add usb.h header with MUX_USB_* and and
 MUX_TYPEC_* state constants
Date: Fri, 22 Sep 2017 20:37:54 +0200
Message-ID: <20170922183803.10701-5-hdegoede@redhat.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170922183803.10701-1-hdegoede@redhat.com>
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

Changes in v3:
-Simplify MUX_TYPEC_* states, drop having separate USB HOST / DEVICE states
---
 include/linux/mux/usb.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 include/linux/mux/usb.h

diff --git a/include/linux/mux/usb.h b/include/linux/mux/usb.h
new file mode 100644
index 000000000000..2fec06846e14
--- /dev/null
+++ b/include/linux/mux/usb.h
@@ -0,0 +1,31 @@
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
+#define MUX_TYPEC_USB			(0 << 1) /* USB only mode */
+#define MUX_TYPEC_USB_AND_DP		(1 << 1) /* USB host + 2 lanes DP */
+#define MUX_TYPEC_DP			(2 << 1) /* 4 lanes Display Port */
+#define MUX_TYPEC_STATES		(3 << 1)
+
+#endif /* _LINUX_MUX_TYPEC_H */
-- 
2.14.1
