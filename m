From: Lukas Wunner <lukas@wunner.de>
Subject: Re: Backlight control does not work on an Apple dual-GPU
 (intel/nvidia) system using nouveau
Date: Sun, 14 Feb 2016 14:24:01 +0100
Message-ID: <20160214132401.GA15948@wunner.de>
References: <56BF996F.3030503@guruburu.com>
 <20160213233912.GA16687@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout3.hostsharing.net ([176.9.242.54]:42493 "EHLO
	mailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbcBNNXg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Feb 2016 08:23:36 -0500
Content-Disposition: inline
In-Reply-To: <20160213233912.GA16687@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gaele Strootman <gaele@guruburu.com>
Cc: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bruno Bierbaumer <bruno@bierbaumer.net>, Michael Marineau <mike@marineau.org>

Hi Gaele,

On Sun, Feb 14, 2016 at 12:39:12AM +0100, Lukas Wunner wrote:
> On dual GPU MacBook Pros, brightness is controlled by gmux.
> It is changed by writing to gmux' I/O port range, 0x700 - 0x7FF.
> gmux is located on the LPC bus, i.e. behind the southbridge.
> 
> For communication with gmux to work, the above-mentioned I/O port
> range needs to be routed to bus 00, where the LPC bus bridge is
> located. Incidentally the integrated GPU is also located on that
> same bus, whereas the discrete GPU is on a different bus. (It is
> directly connected to the PCI Root Complex in the CPU.)

FWIW, I've cobbled together an experimental patch (included below)
which locks I/O to the LPC bridge instead of the integrated GPU.

This requires a modification to vgaarb.c to deal with not just
PCI_CLASS_DISPLAY_VGA, but also PCI_CLASS_BRIDGE_ISA devices.
As to the justification, well it *could* be argued that back in
the 1990s we had mainboards with PCI + ISA slots and for backward
compatibility we need to support VGA devices in ISA slots located
behind a PCI/ISA bridge. ;-)

Seriously though, maybe you want to give this a try and see if
it solves the issue for you (apply with git am --scissors).

Best regards,

Lukas

-- >8 --
Subject: [PATCH] apple-gmux: Fix IO locking

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/vga/vgaarb.c          |  3 ++-
 drivers/platform/x86/apple-gmux.c | 51 ++++++++++++++-------------------------
 2 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index f17cb04..b23b471 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -529,7 +529,8 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	u16 cmd;
 
 	/* Only deal with VGA class devices */
-	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
+	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA &&
+	    (pdev->class >> 8) != PCI_CLASS_BRIDGE_ISA)
 		return false;
 
 	/* Allocate structure */
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index f236250..999daad 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -48,10 +48,10 @@
 struct apple_gmux_data {
 	unsigned long iostart;
 	unsigned long iolen;
+	struct pci_dev *lpc_bridge;
 	bool indexed;
 	struct mutex index_lock;
 
-	struct pci_dev *pdev;
 	struct backlight_device *bdev;
 
 	/* switcheroo data */
@@ -530,34 +530,17 @@ static int gmux_resume(struct device *dev)
 	return 0;
 }
 
-static struct pci_dev *gmux_get_io_pdev(void)
-{
-	struct pci_dev *pdev = NULL;
-
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
-		u16 cmd;
-
-		pci_read_config_word(pdev, PCI_COMMAND, &cmd);
-		if (!(cmd & PCI_COMMAND_IO))
-			continue;
-
-		return pdev;
-	}
-
-	return NULL;
-}
-
 static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 {
 	struct apple_gmux_data *gmux_data;
 	struct resource *res;
+	struct pci_dev *lpc_bridge;
 	struct backlight_properties props;
 	struct backlight_device *bdev;
 	u8 ver_major, ver_minor, ver_release;
 	int ret = -ENXIO;
 	acpi_status status;
 	unsigned long long gpe;
-	struct pci_dev *pdev = NULL;
 
 	if (apple_gmux_data)
 		return -EBUSY;
@@ -622,16 +605,17 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	 * disables IO/MEM used for backlight control on some systems.
 	 * Lock IO+MEM to GPU with active IO to prevent switch.
 	 */
-	pdev = gmux_get_io_pdev();
-	if (pdev && vga_tryget(pdev,
-			       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM)) {
-		pr_err("IO+MEM vgaarb-locking for PCI:%s failed\n",
-			pci_name(pdev));
+	lpc_bridge = pci_get_class(PCI_CLASS_BRIDGE_ISA << 8, NULL);
+	if (lpc_bridge &&
+	    !vga_tryget(lpc_bridge, VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM)) {
+		pr_debug("Locked IO to %s\n", pci_name(lpc_bridge));
+		gmux_data->lpc_bridge = lpc_bridge;
+	} else {
+		pr_err("Failed to lock IO to %s\n", pci_name(lpc_bridge));
+		pci_dev_put(lpc_bridge);
 		ret = -EBUSY;
 		goto err_release;
-	} else if (pdev)
-		pr_info("locked IO for PCI:%s\n", pci_name(pdev));
-	gmux_data->pdev = pdev;
+	}
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_PLATFORM;
@@ -725,10 +709,11 @@ err_enable_gpe:
 err_notify:
 	backlight_device_unregister(bdev);
 err_release:
-	if (gmux_data->pdev)
-		vga_put(gmux_data->pdev,
+	if (gmux_data->lpc_bridge) {
+		vga_put(gmux_data->lpc_bridge,
 			VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM);
-	pci_dev_put(pdev);
+		pci_dev_put(gmux_data->lpc_bridge);
+	}
 	release_region(gmux_data->iostart, gmux_data->iolen);
 err_free:
 	kfree(gmux_data);
@@ -748,10 +733,10 @@ static void gmux_remove(struct pnp_dev *pnp)
 					   &gmux_notify_handler);
 	}
 
-	if (gmux_data->pdev) {
-		vga_put(gmux_data->pdev,
+	if (gmux_data->lpc_bridge) {
+		vga_put(gmux_data->lpc_bridge,
 			VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM);
-		pci_dev_put(gmux_data->pdev);
+		pci_dev_put(gmux_data->lpc_bridge);
 	}
 	backlight_device_unregister(gmux_data->bdev);
 
-- 
2.1.0
