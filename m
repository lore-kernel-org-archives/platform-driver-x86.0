From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 01/11] vga_switcheroo: Add support for switching only the DDC
Date: Sun,  1 Jun 2014 12:38:33 -0400
Message-ID: <1401640723-2058-2-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60026 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753120AbaFAQiz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:38:55 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>

From: Seth Forshee <seth.forshee@canonical.com>

During graphics driver initialization its useful to be able to mux only
the DDC to the inactive client in order to read the EDID. Add a
switch_ddc callback to allow capable handlers to provide this
functionality, and add vga_switcheroo_switch_ddc() to allow DRM to mux
only the DDC.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 38 +++++++++++++++++++++++++++++++++++++-
 include/linux/vga_switcheroo.h   |  4 ++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index ec0ae2d..dd1d587 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -256,6 +256,28 @@ void vga_switcheroo_client_fb_set(struct pci_dev *pdev,
 }
 EXPORT_SYMBOL(vga_switcheroo_client_fb_set);
 
+int vga_switcheroo_switch_ddc(struct pci_dev *pdev)
+{
+	int ret = 0;
+	int id;
+
+	mutex_lock(&vgasr_mutex);
+
+	if (!vgasr_priv.handler) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (vgasr_priv.handler->switch_ddc) {
+		id = vgasr_priv.handler->get_client_id(pdev);
+		ret = vgasr_priv.handler->switch_ddc(id);
+	}
+out:
+	mutex_unlock(&vgasr_mutex);
+	return ret;
+}
+EXPORT_SYMBOL(vga_switcheroo_switch_ddc);
+
 static int vga_switcheroo_show(struct seq_file *m, void *v)
 {
 	struct vga_switcheroo_client *client;
@@ -353,9 +375,15 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client)
 		console_unlock();
 	}
 
+	if (vgasr_priv.handler->switch_ddc) {
+		ret = vgasr_priv.handler->switch_ddc(new_client->id);
+		if (ret)
+			return ret;
+	}
+
 	ret = vgasr_priv.handler->switchto(new_client->id);
 	if (ret)
-		return ret;
+		goto restore_ddc;
 
 	if (new_client->ops->reprobe)
 		new_client->ops->reprobe(new_client->pdev);
@@ -367,6 +395,14 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client)
 
 	new_client->active = true;
 	return 0;
+
+restore_ddc:
+	if (vgasr_priv.handler->switch_ddc) {
+		int id = (new_client->id == VGA_SWITCHEROO_IGD) ?
+			VGA_SWITCHEROO_DIS : VGA_SWITCHEROO_IGD;
+		vgasr_priv.handler->switch_ddc(id);
+	}
+	return ret;
 }
 
 static bool check_can_switch(void)
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index 502073a..37d6850 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -29,6 +29,7 @@ enum vga_switcheroo_client_id {
 };
 
 struct vga_switcheroo_handler {
+	int (*switch_ddc)(enum vga_switcheroo_client_id id);
 	int (*switchto)(enum vga_switcheroo_client_id id);
 	int (*power_state)(enum vga_switcheroo_client_id id,
 			   enum vga_switcheroo_state state);
@@ -54,6 +55,8 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
 void vga_switcheroo_client_fb_set(struct pci_dev *dev,
 				  struct fb_info *info);
 
+int vga_switcheroo_switch_ddc(struct pci_dev *pdev);
+
 int vga_switcheroo_register_handler(struct vga_switcheroo_handler *handler);
 void vga_switcheroo_unregister_handler(void);
 
@@ -71,6 +74,7 @@ static inline void vga_switcheroo_unregister_client(struct pci_dev *dev) {}
 static inline int vga_switcheroo_register_client(struct pci_dev *dev,
 		const struct vga_switcheroo_client_ops *ops, bool driver_power_control) { return 0; }
 static inline void vga_switcheroo_client_fb_set(struct pci_dev *dev, struct fb_info *info) {}
+static inline void vga_switcheroo_switch_ddc(struct pci_dev *pdev) { return NULL; }
 static inline int vga_switcheroo_register_handler(struct vga_switcheroo_handler *handler) { return 0; }
 static inline int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
 	const struct vga_switcheroo_client_ops *ops,
-- 
1.8.5.3
