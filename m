Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E7426D3F
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750655; cv=none; b=l11Qd5KDXIoUjbB1Bn3Zew31BnOA3lDJmim3wZDPxyAPjSZ1xmMDMfcyuOPtleI8Zp5Zs+2OLSwR1VM/A6Ts1g6Tb9VUpXL0xFz8lKFkl4YAv8ZR+NUNfXwi/6up21rqUOEmBVl6dsB0Ot5AXdPoyVxqQ4o65LBddGdHqNhaFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750655; c=relaxed/simple;
	bh=MWrTq1IYqx8eEXDgACyPRrwYWOF3/1aPM3t+cHWXvqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDjFtgT7HHvTu/VdMSYxkjw8pAwORuxh4xx6io3yJVh0DrNc/dc2y55fQ8e+qgR4r/gA8gnNwl3qpJWrvUaU+9rsbP9Pde8RYLUSq9tiRqBJO2W+okWRKx94Asu6EZRlucw3vi3s4lVfcQ9NtF/j3h0vmJ3SOKb+tr8FHZ7vGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZYZLiIH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZYZLiIH"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c20e70a0962so137645466b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750651; x=1788355451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9JiN/Q5of2Un3vhVZlsQfZMPr7ConSac3y0iRHMAXU=;
        b=hZYZLiIHTZ41xg1TYR4+kKlXn92AIGegaI4B3SA+U7uCeMNOsLDu6waJh+4NxpPfdi
         1tegFszhT0a/HqjzCHA05gy9jGS3YsPmsMPci1OQ98xL5mRLdgKLfjn5MmyGMhN5MWrh
         mHWU9WZynz/0Kvacx7DSH2qE5U/sV4Ixuo1yaahkJFAEAB+SUzGsprCXRiOM+txWVHfy
         5tZPPeeGUsYoVg7CugVFxLcQMhmBz48cM+BLKjOLiYTY1VCZ6DEWnNmG8qlHGu9ZhWDj
         lEkBLRlsePzu9KYKnvaCkW/txoGsYyhvMmuOEzVYFS+devTbbquf7dXoTp5TvaNqk7tv
         ktzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750651; x=1788355451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9JiN/Q5of2Un3vhVZlsQfZMPr7ConSac3y0iRHMAXU=;
        b=nV8/Kqcp/4fvR0tFyQxmhIBlSivWRskknO6Pz00vW2VYZsKs5BEcZ3AfR9aG0AcKzb
         jC7NGZFuu+t+7VwpKOnNuLGNWp4mm0OuHHcxp38qdD03vsXtjHWwmWm295NqfJOwjREv
         At6QUBIj3SGgkoL6Cak4Vzw/XNnvTSHxY6o1P0mZz6qG+1tql6pXfUR6Ii1VV1Z1E3DB
         69mql979knLU8DjRjwaQEmLLuqYLOYZlrpQ8qe8t5LRzd1UB9QHxZmj/4G785GGnIsvt
         AyEF0xb2QUIbhqem5Z7HCh5YwJl2xwVzZPBUCDOXvjmz+xbYezgJ0K2B0g8et6T78M87
         OXTg==
X-Forwarded-Encrypted: i=1; AHgh+RrfMBCJO2mDC5E8G8TG9hNoucoKktnmQ1tXxuVB5xClFQvXILBJWYVXwHZsXBFA6hHz191zuJq2OWg6Jy3PEqEGYGXf@vger.kernel.org
X-Gm-Message-State: AFuF++krZ6jPyjlkZfD4TsfGHIgu/qWUKAggTbDG5ZYfdWWfudpXy7VK
	rkjHe5q4u6eYjrCOuTOO7Rk7b825bsqCJdLTFGil1LzQI1yIrDTYzfqA
X-Gm-Gg: AR+sD12KwGyQa9ticEWa5uQRl5+52JcXgrioopzlsOZIh+bcG4wK5c74Slp0dX7CgAd
	MIqcSv6fvRNcHsPT53BysYnMk2FqrZzqVyWqn3w9gpluLzjWTQNaLMo98oZiXA95FHZOOeSnllC
	wmM5DVsei1uJZD+nqOycMwGVy4NVKL7h1W452yOCzWBa2bx2ZQb71gYTAql8AebZW+ZIUwE+VOB
	YprAkMKhFWaduBUYhE8Pec9VWCRgRpBdVKXkmjm/hsdSteyHcmMXcZm/bugoElOETg5PjCqNiMY
	uKzmEHP+x2YAZ5LlMioj3Ff69az4tXpCJtxpDZyAPuMxPGgnUGWbi1ik8tP9DJQETl7o7yEnSAa
	ZCeosqB9IUSKtipv1smOGQEfSoNlRSGVs8dHs1M6ESTjmZYjclNLr7COqVi2HM91Z6WHLz0nvNu
	paO4MIoRYWnY/vbzSoMuYva8vsaJLp0QRxUqLCTLEQpUa1ufhnG0bF/YPXx/YSOpHwytmm9Yf8x
	B0n11I3R3F+XJg/OPJvkEIfCWkwfxYKrnwE7FSe1tTosLqjvXjtnqE=
X-Received: by 2002:a17:907:6093:b0:c08:417e:3696 with SMTP id a640c23a62f3a-c250c318ec5mr803788066b.20.1787750651038;
        Wed, 26 Aug 2026 06:24:11 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ae4dsm648518666b.39.2026.08.26.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:24:10 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 1/2] xhci: Restore SSIC state on the Lenovo Yoga Book
Date: Wed, 26 Aug 2026 15:24:02 +0200
Message-ID: <20260826132403.3345072-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132403.3345072-1-mauriziocasciano7@gmail.com>
References: <20260826132403.3345072-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L connects its XMM7260 modem through
the Cherry Trail xHCI SSIC port. Firmware leaves SSIC vendor registers
in a state which prevents reliable enumeration after controller setup
and power transitions.

Add a DMI-scoped quirk which restores the SSIC register banks,
configures link retraining and reapplies the state after resume. The
register definitions and sequence are derived from Intel's GPL-2.0
xHCI vendor-capability implementation.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/usb/host/xhci-intel-cap.c
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/usb/host/xhci-pci.c  | 114 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-ring.c |  31 ++++++++++
 drivers/usb/host/xhci.h      |   1 +
 3 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..39d3ffa64185 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
@@ -25,6 +26,17 @@
 #define SSIC_PORT_CFG2_OFFSET	0x30
 #define PROG_DONE		(1 << 30)
 #define SSIC_PORT_UNUSED	(1 << 31)
+#define SSIC_RETRAIN_TIMEOUT	GENMASK(24, 21)
+#define SSIC_SS_PORT_LINK_CTRL	0x80ec
+#define SSIC_SS_PORT_LINK_CTRL_U3_MASK	GENMASK(11, 9)
+#define SSIC_ACCESS_CTRL	0x4
+#define SSIC_ACCESS_CTRL_OFFSET	0x110
+#define SSIC_ACCESS_CTRL_REGISTER_BANK_VALID	BIT(25)
+#define XHCI_EXT_CAPS_INTEL_HOST	192
+#define XHCI_EXT_CAPS_INTEL_SSIC	196
+#define XHCI_EXT_CAPS_INTEL_SSIC_PROFILE	197
+#define DUAL_ROLE_CFG0		0x68
+#define EN_PIPE_4_1_SYNC_PHY_STATUS	BIT(23)
 #define SPARSE_DISABLE_BIT	17
 #define SPARSE_CNTL_ENABLE	0xC12C
 
@@ -99,6 +111,87 @@ static const char hcd_name[] = "xhci_hcd";
 
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
 
+static const struct dmi_system_id xhci_yogabook_ssic_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+	},
+	{ }
+};
+
+static int xhci_yogabook_ssic_ext_cap(struct xhci_hcd *xhci, int id)
+{
+	return xhci_find_next_ext_cap(xhci->cap_regs, 0, id);
+}
+
+static void xhci_yogabook_ssic_restore_banks(struct xhci_hcd *xhci)
+{
+	u8 __iomem *base = (u8 __iomem *)xhci->cap_regs;
+	int offset;
+	int i;
+
+	offset = xhci_yogabook_ssic_ext_cap(xhci,
+					    XHCI_EXT_CAPS_INTEL_SSIC_PROFILE);
+	if (!offset) {
+		xhci_warn(xhci, "Yoga Book SSIC profile capability is missing\n");
+		return;
+	}
+
+	for (i = 0; i < SSIC_PORT_NUM; i++) {
+		void __iomem *reg = base + offset + SSIC_ACCESS_CTRL +
+				    i * SSIC_ACCESS_CTRL_OFFSET;
+		u32 val = readl(reg);
+
+		writel(val | SSIC_ACCESS_CTRL_REGISTER_BANK_VALID, reg);
+		readl(reg);
+	}
+}
+
+static void xhci_yogabook_ssic_prepare_reset(struct xhci_hcd *xhci)
+{
+	u8 __iomem *base = (u8 __iomem *)xhci->cap_regs;
+	void __iomem *reg;
+	int host_cap;
+	u32 val;
+
+	host_cap = xhci_yogabook_ssic_ext_cap(xhci,
+					      XHCI_EXT_CAPS_INTEL_HOST);
+	if (!host_cap) {
+		xhci_warn(xhci, "Yoga Book Intel host capability is missing\n");
+		return;
+	}
+
+	reg = base + host_cap + DUAL_ROLE_CFG0;
+	val = readl(reg) | EN_PIPE_4_1_SYNC_PHY_STATUS;
+	writel(val, reg);
+	readl(reg);
+}
+
+static void xhci_yogabook_ssic_configure(struct xhci_hcd *xhci)
+{
+	u8 __iomem *base = (u8 __iomem *)xhci->cap_regs;
+	void __iomem *reg;
+	u32 val;
+
+	if (!xhci_yogabook_ssic_ext_cap(xhci, XHCI_EXT_CAPS_INTEL_SSIC))
+		xhci_warn(xhci, "Yoga Book Intel SSIC capability is missing\n");
+
+	reg = base + SSIC_PORT_CFG2;
+	val = readl(reg) & ~SSIC_RETRAIN_TIMEOUT;
+	writel(val, reg);
+	readl(reg);
+
+	reg = base + SSIC_SS_PORT_LINK_CTRL;
+	val = readl(reg) & ~SSIC_SS_PORT_LINK_CTRL_U3_MASK;
+	writel(val, reg);
+	readl(reg);
+
+	xhci_yogabook_ssic_restore_banks(xhci);
+	xhci_info(xhci, "Yoga Book XMM7260 SSIC initialization applied\n");
+}
+
 static int xhci_pci_setup(struct usb_hcd *hcd);
 static int xhci_pci_run(struct usb_hcd *hcd);
 static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
@@ -383,6 +476,12 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 	    pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI)
 		xhci->quirks |= XHCI_SSIC_PORT_UNUSED;
+	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
+	    pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI &&
+	    dmi_check_system(xhci_yogabook_ssic_dmi_table)) {
+		xhci->quirks |= XHCI_YOGABOOK_SSIC;
+		xhci_yogabook_ssic_prepare_reset(xhci);
+	}
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 	    (pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_XHCI ||
@@ -586,6 +685,9 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 
 	xhci->allow_single_roothub = 1;
 
+	if (xhci->quirks & XHCI_YOGABOOK_SSIC)
+		xhci_yogabook_ssic_configure(xhci);
+
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_acpi_rtd3_enable(pdev);
 
@@ -857,6 +959,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	bool power_lost = msg.event == PM_EVENT_RESTORE;
 	bool is_auto_resume = msg.event == PM_EVENT_AUTO_RESUME;
+	int ret;
 
 	reset_control_reset(xhci->reset);
 
@@ -881,13 +984,22 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
 		usb_enable_intel_xhci_ports(pdev);
 
+	if (xhci->quirks & XHCI_YOGABOOK_SSIC) {
+		xhci_yogabook_ssic_prepare_reset(xhci);
+		xhci_yogabook_ssic_restore_banks(xhci);
+	}
+
 	if (xhci->quirks & XHCI_SSIC_PORT_UNUSED)
 		xhci_ssic_port_unused_quirk(hcd, false);
 
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
-	return xhci_resume(xhci, power_lost, is_auto_resume);
+	ret = xhci_resume(xhci, power_lost, is_auto_resume);
+	if (!ret && (xhci->quirks & XHCI_YOGABOOK_SSIC))
+		xhci_yogabook_ssic_configure(xhci);
+
+	return ret;
 }
 
 static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 97a1b53c18ef..4ec5dcd1bad5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -62,10 +62,40 @@
 #include "xhci.h"
 #include "xhci-trace.h"
 
+#define YOGABOOK_SSIC_RETRAIN_CFG2	0x880c
+#define YOGABOOK_SSIC_RETRAIN_TIMEOUT	GENMASK(24, 21)
+#define YOGABOOK_SSIC_USB3_PORT		5
+
 static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);
 
+static void xhci_yogabook_ssic_update_retrain(struct xhci_hcd *xhci,
+					      struct xhci_port *port,
+					      u32 portsc)
+{
+	u8 __iomem *base = (u8 __iomem *)xhci->cap_regs;
+	void __iomem *reg = base + YOGABOOK_SSIC_RETRAIN_CFG2;
+	u32 val;
+
+	if (!(xhci->quirks & XHCI_YOGABOOK_SSIC) ||
+	    port->rhub != &xhci->usb3_rhub ||
+	    port->hcd_portnum + 1 != YOGABOOK_SSIC_USB3_PORT ||
+	    !(portsc & (PORT_CSC | PORT_PLC)))
+		return;
+
+	val = readl(reg);
+	if (!(portsc & PORT_CONNECT))
+		val &= ~YOGABOOK_SSIC_RETRAIN_TIMEOUT;
+	else if ((portsc & PORT_PLS_MASK) == XDEV_U0)
+		val |= YOGABOOK_SSIC_RETRAIN_TIMEOUT;
+	else
+		return;
+
+	writel(val, reg);
+	readl(reg);
+}
+
 /*
  * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
  * address of the TRB.
@@ -2035,6 +2065,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		 hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
 
 	trace_xhci_handle_port_status(port, portsc);
+	xhci_yogabook_ssic_update_retrain(xhci, port, portsc);
 
 	if (hcd->state == HC_STATE_SUSPENDED) {
 		xhci_dbg(xhci, "resume root hub\n");
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..28072cfbd39e 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1647,6 +1647,7 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+#define XHCI_YOGABOOK_SSIC	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.53.0

