From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 03/11] vga_switcheroo: Add command line option
Date: Sun,  1 Jun 2014 12:38:35 -0400
Message-ID: <1401640723-2058-4-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60048 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753353AbaFAQjA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:39:00 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

Add a command line option in order to allow the user to provide a perferred
GPU at boot time.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 Documentation/kernel-parameters.txt |  5 +++++
 drivers/gpu/vga/vga_switcheroo.c    | 29 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index 30a8ad0d..6e6d505 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -3486,6 +3486,11 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
 			This is actually a boot loader parameter; the value is
 			passed to the kernel using a special protocol.
 
+	vga_switcheroo= [HW] Switches the enabled GPU at boot time.
+			Format: { IGD | DIS }
+			IGD -- enable the Integrated GPU
+			DIS -- enable the Discrete GPU
+
 	vmalloc=nn[KMG]	[KNL,BOOT] Forces the vmalloc area to have an exact
 			size of <nn>. This can be used to increase the
 			minimum size (128MB on x86). It can also be used to
diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index c06ad5f..6d95626 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -67,6 +67,11 @@ struct vgasr_priv {
 static int vga_switcheroo_debugfs_init(struct vgasr_priv *priv);
 static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv);
 
+static enum vga_switcheroo_client_id vga_switcheroo_default = -1;
+
+static int vga_switchto_stage1(struct vga_switcheroo_client *new_client);
+static int vga_switchto_stage2(struct vga_switcheroo_client *new_client);
+
 /* only one switcheroo per system */
 static struct vgasr_priv vgasr_priv = {
 	.clients = LIST_HEAD_INIT(vgasr_priv.clients),
@@ -107,6 +112,18 @@ static void vga_switcheroo_enable(void)
 				vgasr_priv.handler->switch_ddc(old_id);
 		}
 	}
+
+	list_for_each_entry(client, &vgasr_priv.clients, list) {
+		if (!client->active && client->id == vga_switcheroo_default) {
+			ret = vga_switchto_stage1(client);
+			if (ret)
+				printk(KERN_ERR "vga_switcheroo: switching failed stage 1 %d\n", ret);
+
+			ret = vga_switchto_stage2(client);
+			if (ret)
+				printk(KERN_ERR "vga_switcheroo: switching failed stage 2 %d\n", ret);
+		}
+	}
 	vga_switcheroo_debugfs_init(&vgasr_priv);
 	vgasr_priv.active = true;
 }
@@ -748,3 +765,15 @@ int vga_switcheroo_init_domain_pm_optimus_hdmi_audio(struct device *dev, struct
 	return -EINVAL;
 }
 EXPORT_SYMBOL(vga_switcheroo_init_domain_pm_optimus_hdmi_audio);
+
+static int __init vga_switcheroo_setup(char *str)
+{
+	if (!strcmp(str, "IGD"))
+		vga_switcheroo_default = VGA_SWITCHEROO_IGD;
+	else if (!strcmp(str, "DIS"))
+		vga_switcheroo_default = VGA_SWITCHEROO_DIS;
+
+	return 1;
+}
+
+__setup("vga_switcheroo=", vga_switcheroo_setup);
-- 
1.8.5.3
