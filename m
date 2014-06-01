From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 05/11] vga_switcheroo: Allow handlers to indicate that they can handle PM
Date: Sun,  1 Jun 2014 12:38:37 -0400
Message-ID: <1401640723-2058-6-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60077 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752614AbaFAQjK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:39:10 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

Most switcheroo setups attach power management to one of the GPUs. This is
not always the case, so provide a mechanism for handlers to declare that
they can change the power state of GPUs and permit drivers to obtain this
information.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 8 ++++++++
 include/linux/vga_switcheroo.h   | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 1a80b93..c5e97d4 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -825,6 +825,14 @@ struct edid *vga_switcheroo_get_edid(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(vga_switcheroo_get_edid);
 
+bool vga_switcheroo_handler_pm(void) {
+	if (!vgasr_priv.handler)
+		return false;
+
+	return vgasr_priv.handler->handler_pm;
+}
+EXPORT_SYMBOL(vga_switcheroo_handler_pm);
+
 static int __init vga_switcheroo_setup(char *str)
 {
 	if (!strcmp(str, "IGD"))
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index 07b07fc..4bba934 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -36,6 +36,7 @@ struct vga_switcheroo_handler {
 			   enum vga_switcheroo_state state);
 	int (*init)(void);
 	int (*get_client_id)(struct pci_dev *pdev);
+	bool handler_pm;
 };
 
 struct vga_switcheroo_client_ops {
@@ -76,6 +77,8 @@ u8 *vga_switcheroo_get_dpcd(struct pci_dev *pdev);
 int vga_switcheroo_set_edid(struct edid *edid);
 struct edid *vga_switcheroo_get_edid(struct pci_dev *pdev);
 
+bool vga_switcheroo_handler_pm(void);
+
 #else
 
 static inline void vga_switcheroo_unregister_client(struct pci_dev *dev) {}
@@ -101,5 +104,7 @@ static inline u8 *vga_switcheroo_get_dpcd(struct pci_dev *pdev) { return NULL };
 static inline int vga_switcheroo_set_edid(struct edid *edid) { return 0 };
 static inline struct edid *vga_switcheroo_get_edid(struct pci_dev *pdev) { return NULL };
 
+static inline bool vga_switcheroo_handler_pm(void) { return false; };
+
 #endif
 #endif /* _LINUX_VGA_SWITCHEROO_H_ */
-- 
1.8.5.3
