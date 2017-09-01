From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 03/11] mux: consumer.h: Add MUX_USB_* state constant defines
Date: Fri,  1 Sep 2017 23:48:37 +0200
Message-ID: <20170901214845.7153-4-hdegoede@redhat.com>
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

Add MUX_USB_* state constant defines, which can be used by USB
device/host and Type-C polarity/role/altmode mux drivers and consumers
to ensure that they agree on the meaning of the mux_control_select()
state argument.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/mux/consumer.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index 912dd48a3a5d..e3ec9b4db962 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -15,6 +15,22 @@
 
 #include <linux/compiler.h>
 
+/*
+ * Mux state values for USB muxes, used for both USB device/host role muxes
+ * as well as for Type-C polarity/role/altmode muxes.
+ *
+ * MUX_USB_POLARITY_INV may be or-ed together with any other mux-state as
+ * inverted-polarity (Type-C plugged in upside down) can happen with any
+ * other mux-state.
+ */
+#define MUX_USB_POLARITY_INV	BIT(0)   /* Polarity inverted bit */
+#define MUX_USB_NONE		(1 << 1) /* Mux open / not connected */
+#define MUX_USB_DEVICE		(2 << 1) /* USB device mode */
+#define MUX_USB_HOST		(3 << 1) /* USB host mode */
+#define MUX_USB_HOST_AND_DP_SRC	(4 << 1) /* USB host + 2 lanes Display Port */
+#define MUX_USB_DP_SRC		(5 << 1) /* 4 lanes Display Port source */
+#define MUX_USB_STATES		(6 << 1)
+
 struct device;
 struct mux_control;
 
-- 
2.13.5
