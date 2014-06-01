From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 02/11] vga_switcheroo: Add support for reprobing connectors
Date: Sun,  1 Jun 2014 12:38:34 -0400
Message-ID: <1401640723-2058-3-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60039 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753353AbaFAQi6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:38:58 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

If display MUXing is handled by an external driver, the handler may not
initialise until some time after the graphics drivers originally bound. If
the driver is unable to detect some drivers unless appropriately MUXed, this
will cause problems. This patch adds a callback to allow switcheroo to
retrigger the driver's output probing.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 10 ++++++++++
 include/linux/vga_switcheroo.h   |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index dd1d587..c06ad5f 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -96,6 +96,16 @@ static void vga_switcheroo_enable(void)
 			return;
 
 		client->id = ret;
+
+		if (!client->active && client->ops->reprobe_connectors) {
+			int old_id = (client->id == VGA_SWITCHEROO_IGD) ?
+				VGA_SWITCHEROO_DIS : VGA_SWITCHEROO_IGD;
+			if (vgasr_priv.handler->switch_ddc)
+				vgasr_priv.handler->switch_ddc(client->id);
+			client->ops->reprobe_connectors(client->pdev);
+			if (vgasr_priv.handler->switch_ddc)
+				vgasr_priv.handler->switch_ddc(old_id);
+		}
 	}
 	vga_switcheroo_debugfs_init(&vgasr_priv);
 	vgasr_priv.active = true;
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index 37d6850..bae62fd 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -40,6 +40,7 @@ struct vga_switcheroo_handler {
 struct vga_switcheroo_client_ops {
 	void (*set_gpu_state)(struct pci_dev *dev, enum vga_switcheroo_state);
 	void (*reprobe)(struct pci_dev *dev);
+	void (*reprobe_connectors)(struct pci_dev *dev);
 	bool (*can_switch)(struct pci_dev *dev);
 };
 
-- 
1.8.5.3
