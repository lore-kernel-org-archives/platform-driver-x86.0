From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v5 01/12] vga_switcheroo: Add handler flags infrastructure
Date: Mon, 11 Jan 2016 20:09:20 +0100
Message-ID: <2b0d93ed6e511ca09e95e45e0b35627f330fabce.1452525860.git.lukas@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:35247 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934275AbcAKTJo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:09:44 -0500
In-Reply-To: <cover.1452525860.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Darren Hart <dvhart@infradead.org>

Allow handlers to declare their capabilities and allow clients to
obtain that information. So far we have these use cases:

* If the handler is able to switch DDC separately, clients need to
  probe EDID with drm_get_edid_switcheroo(). We should allow them
  to detect a capable handler to ensure this function only gets
  called when needed.

* Likewise if the handler is unable to switch AUX separately, the active
  client needs to communicate link training parameters to the inactive
  client, which may then skip the AUX handshake and set up its output
  with these pre-calibrated values (DisplayPort specification v1.1a,
  section 2.5.3.3). Clients need a way to recognize such a situation.

The flags for the radeon_atpx_handler and amdgpu_atpx_handler are
initially set to 0, this can later on be amended with
  handler_flags |= VGA_SWITCHEROO_CAN_SWITCH_DDC;
when a ->switch_ddc callback is added.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=88861
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=61115
Tested-by: Lukas Wunner <lukas@wunner.de>
    [MBP  9,1 2012  intel IVB + nvidia GK107  pre-retina  15"]
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/DocBook/gpu.tmpl                   |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_acpi.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_atpx_handler.c     |  3 ++-
 drivers/gpu/vga/vga_switcheroo.c                 | 22 ++++++++++++++++++-
 drivers/platform/x86/apple-gmux.c                |  2 +-
 include/linux/vga_switcheroo.h                   | 28 ++++++++++++++++++++++--
 7 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/gpu.tmpl
index 9e95aa1..88e7c39 100644
--- a/Documentation/DocBook/gpu.tmpl
+++ b/Documentation/DocBook/gpu.tmpl
@@ -3648,6 +3648,7 @@ int num_ioctls;</synopsis>
     </sect1>
     <sect1>
       <title>Public constants</title>
+!Finclude/linux/vga_switcheroo.h vga_switcheroo_handler_flags_t
 !Finclude/linux/vga_switcheroo.h vga_switcheroo_client_id
 !Finclude/linux/vga_switcheroo.h vga_switcheroo_state
     </sect1>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
index 3c89586..fa948dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
@@ -552,13 +552,14 @@ static bool amdgpu_atpx_detect(void)
 void amdgpu_register_atpx_handler(void)
 {
 	bool r;
+	enum vga_switcheroo_handler_flags_t handler_flags = 0;
 
 	/* detect if we have any ATPX + 2 VGA in the system */
 	r = amdgpu_atpx_detect();
 	if (!r)
 		return;
 
-	vga_switcheroo_register_handler(&amdgpu_atpx_handler);
+	vga_switcheroo_register_handler(&amdgpu_atpx_handler, handler_flags);
 }
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index d5e6938..cdf5227 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -314,7 +314,7 @@ void nouveau_register_dsm_handler(void)
 	if (!r)
 		return;
 
-	vga_switcheroo_register_handler(&nouveau_dsm_handler);
+	vga_switcheroo_register_handler(&nouveau_dsm_handler, 0);
 }
 
 /* Must be called for Optimus models before the card can be turned off */
diff --git a/drivers/gpu/drm/radeon/radeon_atpx_handler.c b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
index c4b4f29..56482e3 100644
--- a/drivers/gpu/drm/radeon/radeon_atpx_handler.c
+++ b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
@@ -551,13 +551,14 @@ static bool radeon_atpx_detect(void)
 void radeon_register_atpx_handler(void)
 {
 	bool r;
+	enum vga_switcheroo_handler_flags_t handler_flags = 0;
 
 	/* detect if we have any ATPX + 2 VGA in the system */
 	r = radeon_atpx_detect();
 	if (!r)
 		return;
 
-	vga_switcheroo_register_handler(&radeon_atpx_handler);
+	vga_switcheroo_register_handler(&radeon_atpx_handler, handler_flags);
 }
 
 /**
diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index d64d905..81da941 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -125,6 +125,7 @@ static DEFINE_MUTEX(vgasr_mutex);
  * 	(counting only vga clients, not audio clients)
  * @clients: list of registered clients
  * @handler: registered handler
+ * @handler_flags: flags of registered handler
  *
  * vga_switcheroo private data. Currently only one vga_switcheroo instance
  * per system is supported.
@@ -141,6 +142,7 @@ struct vgasr_priv {
 	struct list_head clients;
 
 	const struct vga_switcheroo_handler *handler;
+	enum vga_switcheroo_handler_flags_t handler_flags;
 };
 
 #define ID_BIT_AUDIO		0x100
@@ -189,13 +191,15 @@ static void vga_switcheroo_enable(void)
 /**
  * vga_switcheroo_register_handler() - register handler
  * @handler: handler callbacks
+ * @handler_flags: handler flags
  *
  * Register handler. Enable vga_switcheroo if two vga clients have already
  * registered.
  *
  * Return: 0 on success, -EINVAL if a handler was already registered.
  */
-int vga_switcheroo_register_handler(const struct vga_switcheroo_handler *handler)
+int vga_switcheroo_register_handler(const struct vga_switcheroo_handler *handler,
+				    enum vga_switcheroo_handler_flags_t handler_flags)
 {
 	mutex_lock(&vgasr_mutex);
 	if (vgasr_priv.handler) {
@@ -204,6 +208,7 @@ int vga_switcheroo_register_handler(const struct vga_switcheroo_handler *handler
 	}
 
 	vgasr_priv.handler = handler;
+	vgasr_priv.handler_flags = handler_flags;
 	if (vga_switcheroo_ready()) {
 		pr_info("enabled\n");
 		vga_switcheroo_enable();
@@ -221,6 +226,7 @@ EXPORT_SYMBOL(vga_switcheroo_register_handler);
 void vga_switcheroo_unregister_handler(void)
 {
 	mutex_lock(&vgasr_mutex);
+	vgasr_priv.handler_flags = 0;
 	vgasr_priv.handler = NULL;
 	if (vgasr_priv.active) {
 		pr_info("disabled\n");
@@ -231,6 +237,20 @@ void vga_switcheroo_unregister_handler(void)
 }
 EXPORT_SYMBOL(vga_switcheroo_unregister_handler);
 
+/**
+ * vga_switcheroo_handler_flags() - obtain handler flags
+ *
+ * Helper for clients to obtain the handler flags bitmask.
+ *
+ * Return: Handler flags. A value of 0 means that no handler is registered
+ * or that the handler has no special capabilities.
+ */
+enum vga_switcheroo_handler_flags_t vga_switcheroo_handler_flags(void)
+{
+	return vgasr_priv.handler_flags;
+}
+EXPORT_SYMBOL(vga_switcheroo_handler_flags);
+
 static int register_client(struct pci_dev *pdev,
 			   const struct vga_switcheroo_client_ops *ops,
 			   enum vga_switcheroo_client_id id, bool active,
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index f236250..c401d49 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -705,7 +705,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	init_completion(&gmux_data->powerchange_done);
 	gmux_enable_interrupts(gmux_data);
 
-	if (vga_switcheroo_register_handler(&gmux_handler)) {
+	if (vga_switcheroo_register_handler(&gmux_handler, 0)) {
 		ret = -ENODEV;
 		goto err_register_handler;
 	}
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index 69e1d4a1..a745f4f0 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -36,6 +36,26 @@
 struct pci_dev;
 
 /**
+ * enum vga_switcheroo_handler_flags_t - handler flags bitmask
+ * @VGA_SWITCHEROO_CAN_SWITCH_DDC: whether the handler is able to switch the
+ * 	DDC lines separately. This signals to clients that they should call
+ * 	drm_get_edid_switcheroo() to probe the EDID
+ * @VGA_SWITCHEROO_NEEDS_EDP_CONFIG: whether the handler is unable to switch
+ * 	the AUX channel separately. This signals to clients that the active
+ * 	GPU needs to train the link and communicate the link parameters to the
+ * 	inactive GPU (mediated by vga_switcheroo). The inactive GPU may then
+ * 	skip the AUX handshake and set up its output with these pre-calibrated
+ * 	values (DisplayPort specification v1.1a, section 2.5.3.3)
+ *
+ * Handler flags bitmask. Used by handlers to declare their capabilities upon
+ * registering with vga_switcheroo.
+ */
+enum vga_switcheroo_handler_flags_t {
+	VGA_SWITCHEROO_CAN_SWITCH_DDC	= (1 << 0),
+	VGA_SWITCHEROO_NEEDS_EDP_CONFIG	= (1 << 1),
+};
+
+/**
  * enum vga_switcheroo_state - client power state
  * @VGA_SWITCHEROO_OFF: off
  * @VGA_SWITCHEROO_ON: on
@@ -132,8 +152,10 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
 void vga_switcheroo_client_fb_set(struct pci_dev *dev,
 				  struct fb_info *info);
 
-int vga_switcheroo_register_handler(const struct vga_switcheroo_handler *handler);
+int vga_switcheroo_register_handler(const struct vga_switcheroo_handler *handler,
+				    enum vga_switcheroo_handler_flags_t handler_flags);
 void vga_switcheroo_unregister_handler(void);
+enum vga_switcheroo_handler_flags_t vga_switcheroo_handler_flags(void);
 
 int vga_switcheroo_process_delayed_switch(void);
 
@@ -150,11 +172,13 @@ static inline void vga_switcheroo_unregister_client(struct pci_dev *dev) {}
 static inline int vga_switcheroo_register_client(struct pci_dev *dev,
 		const struct vga_switcheroo_client_ops *ops, bool driver_power_control) { return 0; }
 static inline void vga_switcheroo_client_fb_set(struct pci_dev *dev, struct fb_info *info) {}
-static inline int vga_switcheroo_register_handler(const struct vga_switcheroo_handler *handler) { return 0; }
+static inline int vga_switcheroo_register_handler(const struct vga_switcheroo_handler *handler,
+		enum vga_switcheroo_handler_flags_t handler_flags) { return 0; }
 static inline int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
 	const struct vga_switcheroo_client_ops *ops,
 	enum vga_switcheroo_client_id id) { return 0; }
 static inline void vga_switcheroo_unregister_handler(void) {}
+static inline enum vga_switcheroo_handler_flags_t vga_switcheroo_handler_flags(void) { return 0; }
 static inline int vga_switcheroo_process_delayed_switch(void) { return 0; }
 static inline enum vga_switcheroo_state vga_switcheroo_get_client_state(struct pci_dev *dev) { return VGA_SWITCHEROO_ON; }
 
-- 
1.8.5.2 (Apple Git-48)
