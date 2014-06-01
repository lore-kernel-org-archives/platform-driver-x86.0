From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 06/11] vga_switcheroo: Add enable() call to clients and permit deferral of dynamic PM
Date: Sun,  1 Jun 2014 12:38:38 -0400
Message-ID: <1401640723-2058-7-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60098 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752533AbaFAQjS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:39:18 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

We may not know whether the platform supports dynamic PM of GPUs until the
switcheroo handler is registered. Add an enable() callback for clients and
another entry point to switcheroo in order to permit them to set dynamic PM
appropriately.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 17 +++++++++++++++++
 include/linux/vga_switcheroo.h   |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index c5e97d4..199a111 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -108,6 +108,9 @@ static void vga_switcheroo_enable(void)
 
 		client->id = ret;
 
+		if (client->ops->enable)
+			client->ops->enable(client->pdev);
+
 		if (!client->active && client->ops->reprobe_connectors) {
 			int old_id = (client->id == VGA_SWITCHEROO_IGD) ?
 				VGA_SWITCHEROO_DIS : VGA_SWITCHEROO_IGD;
@@ -670,6 +673,20 @@ static void vga_switcheroo_power_switch(struct pci_dev *pdev, enum vga_switchero
 	vgasr_priv.handler->power_state(client->id, state);
 }
 
+void vga_switcheroo_set_dynamic_support(struct pci_dev *pdev, bool dynamic)
+{
+	struct vga_switcheroo_client *client;
+
+	client = find_client_from_pci(&vgasr_priv.clients, pdev);
+	if (!client)
+		return;
+
+	client->driver_power_control = dynamic;
+
+	return;
+}
+EXPORT_SYMBOL(vga_switcheroo_set_dynamic_support);
+
 /* force a PCI device to a certain state - mainly to turn off audio clients */
 
 void vga_switcheroo_set_dynamic_switch(struct pci_dev *pdev, enum vga_switcheroo_state dynamic)
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index 4bba934..5a483c6 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -44,6 +44,7 @@ struct vga_switcheroo_client_ops {
 	void (*reprobe)(struct pci_dev *dev);
 	void (*reprobe_connectors)(struct pci_dev *dev);
 	bool (*can_switch)(struct pci_dev *dev);
+	void (*enable)(struct pci_dev *dev);
 };
 
 #if defined(CONFIG_VGA_SWITCHEROO)
@@ -67,6 +68,7 @@ int vga_switcheroo_process_delayed_switch(void);
 
 int vga_switcheroo_get_client_state(struct pci_dev *dev);
 
+void vga_switcheroo_set_dynamic_support(struct pci_dev *pdev, bool dynamic);
 void vga_switcheroo_set_dynamic_switch(struct pci_dev *pdev, enum vga_switcheroo_state dynamic);
 
 int vga_switcheroo_init_domain_pm_ops(struct device *dev, struct dev_pm_domain *domain);
@@ -94,6 +96,7 @@ static inline void vga_switcheroo_unregister_handler(void) {}
 static inline int vga_switcheroo_process_delayed_switch(void) { return 0; }
 static inline int vga_switcheroo_get_client_state(struct pci_dev *dev) { return VGA_SWITCHEROO_ON; }
 
+static inline void vga_switcheroo_set_dynamic_support(struct pci_dev *pdev, bool dynamic) {}
 static inline void vga_switcheroo_set_dynamic_switch(struct pci_dev *pdev, enum vga_switcheroo_state dynamic) {}
 
 static inline int vga_switcheroo_init_domain_pm_ops(struct device *dev, struct dev_pm_domain *domain) { return -EINVAL; }
-- 
1.8.5.3
