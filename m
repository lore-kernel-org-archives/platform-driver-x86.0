From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v5 05/12] drm/edid: Switch DDC when reading the EDID
Date: Mon, 11 Jan 2016 20:09:20 +0100
Message-ID: <b898d0da4c134f2642d0122479006863e1830723.1452525860.git.lukas@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:56371 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296AbcAKTKq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:10:46 -0500
In-Reply-To: <cover.1452525860.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>, Dave Airlie <airlied@redhat.com>

Originally by Seth Forshee <seth.forshee@canonical.com>, 2012-10-04:
    Some dual graphics machines support muxing the DDC separately from
    the display, so make use of this functionality when reading the EDID
    on the inactive GPU. Also serialize drm_get_edid() with a mutex to
    avoid races on the DDC mux state.

Modified by Dave Airlie <airlied@gmail.com>, 2012-12-22:
    I can't figure out why I didn't like this, but I rewrote this [...]
    to lock/unlock the ddc lines [...]. I think I'd prefer something
    like that otherwise the interface got really ugly.

Modified by Lukas Wunner <lukas@wunner.de>, 2015-04 - 2015-09:
    v3:   Move vga_switcheroo calls to a wrapper around drm_get_edid()
          which drivers can call on muxed machines. This avoids other
          drivers having to go through the vga_switcheroo motions even
          though they are never used on a muxed platform
          (Thierry Reding, Daniel Vetter, Alex Deucher)

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=88861
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=61115
Tested-by: Pierre Moreau <pierre.morrow@free.fr>
    [MBP  5,3 2009  nvidia MCP79 + G96        pre-retina  15"]
Tested-by: William Brown <william@blackhats.net.au>
    [MBP  8,2 2011  intel SNB + amd turks     pre-retina  15"]
Tested-by: Lukas Wunner <lukas@wunner.de>
    [MBP  9,1 2012  intel IVB + nvidia GK107  pre-retina  15"]
Cc: Seth Forshee <seth.forshee@canonical.com>
Cc: Dave Airlie <airlied@gmail.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/drm/drm_edid.c | 26 ++++++++++++++++++++++++++
 include/drm/drm_crtc.h     |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c214f12..1e8f660 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -32,6 +32,7 @@
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/vga_switcheroo.h>
 #include <drm/drmP.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_displayid.h>
@@ -1389,6 +1390,31 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_get_edid);
 
 /**
+ * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
+ * @connector: connector we're probing
+ * @adapter: I2C adapter to use for DDC
+ *
+ * Wrapper around drm_get_edid() for laptops with dual GPUs using one set of
+ * outputs. The wrapper adds the requisite vga_switcheroo calls to temporarily
+ * switch DDC to the GPU which is retrieving EDID.
+ *
+ * Return: Pointer to valid EDID or %NULL if we couldn't find any.
+ */
+struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
+				     struct i2c_adapter *adapter)
+{
+	struct pci_dev *pdev = connector->dev->pdev;
+	struct edid *edid;
+
+	vga_switcheroo_lock_ddc(pdev);
+	edid = drm_get_edid(connector, adapter);
+	vga_switcheroo_unlock_ddc(pdev);
+
+	return edid;
+}
+EXPORT_SYMBOL(drm_get_edid_switcheroo);
+
+/**
  * drm_edid_duplicate - duplicate an EDID and the extensions
  * @edid: EDID to duplicate
  *
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 3b040b3..65df8e7 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -2278,6 +2278,8 @@ extern void drm_property_destroy_user_blobs(struct drm_device *dev,
 extern bool drm_probe_ddc(struct i2c_adapter *adapter);
 extern struct edid *drm_get_edid(struct drm_connector *connector,
 				 struct i2c_adapter *adapter);
+extern struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
+					    struct i2c_adapter *adapter);
 extern struct edid *drm_edid_duplicate(const struct edid *edid);
 extern int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
 extern void drm_mode_config_init(struct drm_device *dev);
-- 
1.8.5.2 (Apple Git-48)
