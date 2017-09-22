From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 07/14] xhci: Add Intel cherrytrail extended cap / otg phy
 mux handling
Date: Fri, 22 Sep 2017 20:37:56 +0200
Message-ID: <20170922183803.10701-7-hdegoede@redhat.com>
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

The Intel cherrytrail xhci controller has an extended cap mmio-range
which contains registers to control the muxing to the xhci (host mode)
or the dwc3 (device mode) and vbus-detection for the otg usb-phy.

Having a mux driver included in the xhci code (or under drivers/usb/host)
is not desirable. So this commit adds a simple handler for this extended
capability, which creates a platform device with the caps mmio region as
resource, this allows us to write a separate platform mux driver for the
mux.

Note this commit adds a call to the new xhci_ext_cap_init() function
to xhci_pci_probe(), it is added here because xhci_ext_cap_init() must
be called only once. If in the future we also want to handle ext-caps
on non pci XHCI HCDs from xhci_ext_cap_init() a call to it should also
be added to other bus probe paths.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Check xHCI controller PCI device-id instead of only checking for the
 Intel Extended capability ID, as the Extended capability ID is used on
 other model Intel xHCI controllers too

Changes in v3:
-Add a new generic xhci_ext_cap_init() function and handle the new
 XHCI_INTEL_CHT_USB_MUX quirk there.
---
 drivers/usb/host/Makefile        |  2 +-
 drivers/usb/host/xhci-ext-caps.c | 88 ++++++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-ext-caps.h |  2 +
 drivers/usb/host/xhci-pci.c      |  5 +++
 drivers/usb/host/xhci.h          |  2 +
 5 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/host/xhci-ext-caps.c

diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index cf2691fffcc0..59329a9cf392 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -10,7 +10,7 @@ fhci-y += fhci-mem.o fhci-tds.o fhci-sched.o
 
 fhci-$(CONFIG_FHCI_DEBUG) += fhci-dbg.o
 
-xhci-hcd-y := xhci.o xhci-mem.o
+xhci-hcd-y := xhci.o xhci-mem.o xhci-ext-caps.o
 xhci-hcd-y += xhci-ring.o xhci-hub.o xhci-dbg.o
 xhci-hcd-y += xhci-trace.o
 ifneq ($(CONFIG_USB_XHCI_MTK), )
diff --git a/drivers/usb/host/xhci-ext-caps.c b/drivers/usb/host/xhci-ext-caps.c
new file mode 100644
index 000000000000..8bc4787afdd0
--- /dev/null
+++ b/drivers/usb/host/xhci-ext-caps.c
@@ -0,0 +1,88 @@
+/*
+ * XHCI extended capability handling
+ *
+ * Copyright (c) 2017 Hans de Goede <hdegoede@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/platform_device.h>
+#include "xhci.h"
+
+static void xhci_intel_unregister_pdev(void *arg)
+{
+	platform_device_unregister(arg);
+}
+
+static int xhci_create_intel_cht_mux_pdev(struct xhci_hcd *xhci, u32 cap_offset)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct device *dev = hcd->self.controller;
+	struct platform_device *pdev;
+	struct resource	res = { 0, };
+	int ret;
+
+	pdev = platform_device_alloc("intel_cht_usb_mux", PLATFORM_DEVID_NONE);
+	if (!pdev) {
+		xhci_err(xhci, "couldn't allocate intel_cht_usb_mux pdev\n");
+		return -ENOMEM;
+	}
+
+	res.start = hcd->rsrc_start + cap_offset;
+	res.end	  = res.start + 0x3ff;
+	res.name  = "intel_cht_usb_mux";
+	res.flags = IORESOURCE_MEM;
+
+	ret = platform_device_add_resources(pdev, &res, 1);
+	if (ret) {
+		dev_err(dev, "couldn't add resources to intel_cht_usb_mux pdev\n");
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	pdev->dev.parent = dev;
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		dev_err(dev, "couldn't register intel_cht_usb_mux pdev\n");
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, xhci_intel_unregister_pdev, pdev);
+	if (ret) {
+		dev_err(dev, "couldn't add unregister action for intel_cht_usb_mux pdev\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+int xhci_ext_cap_init(struct xhci_hcd *xhci)
+{
+	void __iomem *base = &xhci->cap_regs->hc_capbase;
+	u32 cap_offset, val;
+	int ret;
+
+	cap_offset = xhci_find_next_ext_cap(base, 0, 0);
+
+	while (cap_offset) {
+		val = readl(base + cap_offset);
+
+		switch (XHCI_EXT_CAPS_ID(val)) {
+		case XHCI_EXT_CAPS_VENDOR_INTEL:
+			if (xhci->quirks & XHCI_INTEL_CHT_USB_MUX) {
+				ret = xhci_create_intel_cht_mux_pdev(
+							    xhci, cap_offset);
+				if (ret)
+					return ret;
+			}
+			break;
+		}
+		cap_offset = xhci_find_next_ext_cap(base, cap_offset, 0);
+	}
+
+	return 0;
+}
diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index c1b404224839..872fbec1347f 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -51,6 +51,8 @@
 #define XHCI_EXT_CAPS_ROUTE	5
 /* IDs 6-9 reserved */
 #define XHCI_EXT_CAPS_DEBUG	10
+/* Vendor caps */
+#define XHCI_EXT_CAPS_VENDOR_INTEL	192
 /* USB Legacy Support Capability - section 7.1.1 */
 #define XHCI_HC_BIOS_OWNED	(1 << 16)
 #define XHCI_HC_OS_OWNED	(1 << 24)
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 8071c8fdd15e..f088c5012503 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -188,6 +188,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 		 pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI) {
 		xhci->quirks |= XHCI_SSIC_PORT_UNUSED;
+		xhci->quirks |= XHCI_INTEL_CHT_USB_MUX;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 	    (pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
@@ -315,6 +316,10 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto dealloc_usb2_hcd;
 	}
 
+	retval = xhci_ext_cap_init(xhci);
+	if (retval)
+		goto put_usb3_hcd;
+
 	retval = usb_add_hcd(xhci->shared_hcd, dev->irq,
 			IRQF_SHARED);
 	if (retval)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2abaa4d6d39d..0b3ed0044b4d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1828,6 +1828,7 @@ struct xhci_hcd {
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_7	(1 << 26)
 #define XHCI_U2_DISABLE_WAKE	(1 << 27)
 #define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	(1 << 28)
+#define XHCI_INTEL_CHT_USB_MUX	(1 << 29)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
@@ -2012,6 +2013,7 @@ void xhci_init_driver(struct hc_driver *drv,
 		      const struct xhci_driver_overrides *over);
 int xhci_disable_slot(struct xhci_hcd *xhci,
 			struct xhci_command *command, u32 slot_id);
+int xhci_ext_cap_init(struct xhci_hcd *xhci);
 
 int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
 int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
-- 
2.14.1
