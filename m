From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v5 10/12] drm/i915: Defer probe if gmux is present but
 its driver isn't
Date: Sun, 14 Feb 2016 13:10:08 +0100
Message-ID: <20160214121008.GA16847@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
 <f56ee6a0600a3e1bb5bed4d0db4ed9ade7445c47.1452525860.git.lukas@wunner.de>
 <20160209090401.GA11240@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:48704 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269AbcBNMJp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Feb 2016 07:09:45 -0500
Content-Disposition: inline
In-Reply-To: <20160209090401.GA11240@phenom.ffwll.local>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>

Hi,

On Tue, Feb 09, 2016 at 10:04:01AM +0100, Daniel Vetter wrote:
> On Mon, Jan 11, 2016 at 08:09:20PM +0100, Lukas Wunner wrote:
[...]
> > @@ -967,6 +970,15 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >     if (PCI_FUNC(pdev->devfn))
> >             return -ENODEV;
> >  
> > +   /*
> > +    * apple-gmux is needed on dual GPU MacBook Pro
> > +    * to probe the panel if we're the inactive GPU.
> > +    */
> > +   if (IS_ENABLED(CONFIG_VGA_ARB) && IS_ENABLED(CONFIG_VGA_SWITCHEROO) &&
> > +       apple_gmux_present() && pdev != vga_default_device() &&
> > +       !vga_switcheroo_handler_flags())
> > +           return -EPROBE_DEFER;
> 
> I pulled in all patches to drm-misc, but this here is imo ugly and needs
> to be polished a bit. What about adding a vga_switcheroo_ready() function
> which contains this check (and might in the future contain even more
> checks)? Then i915/radeon/nouveau would just have a simple
> 
> 	if (!vga_switcheroo_ready())
> 		return -EPROBE_DEFER;
> 
> and instead of duplicating the same comment 3 times we could have it once
> in one place. Plus some neat kerneldoc for this new helper to describe how
> it's supposed to be used. Plus better encapsulation of concepts.
> 
> Can you pls follow up with a patch/series to do that?

You're right, this is indeed much better. It also allows me to drop the
IS_ENABLED(CONFIG_VGA_ARB) and IS_ENABLED(CONFIG_VGA_SWITCHEROO) checks.

A patch follows below after the scissors.

The name vga_switcheroo_ready() was already taken by a static function
in vga_switcheroo.c, so I've named it vga_switcheroo_client_probe_defer().
If anyone has a suggestion for a better name I'll be happy to amend the
patch.

I've switched all three drivers to the new helper within the same patch
but will gladly spin this out into one patch per driver if preferred.

Thank you!

Lukas

-- >8 --
Subject: [PATCH] vga_switcheroo: Allow clients to determine whether to defer
 probing

So far we've got one condition when DRM drivers need to defer probing
on a dual GPU system and it's coded separately into each of the relevant
drivers. As suggested by Daniel Vetter, deduplicate that code in the
drivers and move it to a new vga_switcheroo helper. This yields better
encapsulation of concepts and lets us add further checks in a central
place. (The existing check pertains to pre-retina MacBook Pros and an
additional check is expected to be needed for retinas.)

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/drm/i915/i915_drv.c       | 10 +---------
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 +---------
 drivers/gpu/drm/radeon/radeon_drv.c   | 10 +---------
 drivers/gpu/vga/vga_switcheroo.c      | 28 ++++++++++++++++++++++++++++
 include/linux/vga_switcheroo.h        |  2 ++
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 44912ec..80cfd73 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -35,11 +35,9 @@
 #include "i915_trace.h"
 #include "intel_drv.h"
 
-#include <linux/apple-gmux.h>
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
-#include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 #include <drm/drm_crtc_helper.h>
 
@@ -972,13 +970,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (PCI_FUNC(pdev->devfn))
 		return -ENODEV;
 
-	/*
-	 * apple-gmux is needed on dual GPU MacBook Pro
-	 * to probe the panel if we're the inactive GPU.
-	 */
-	if (IS_ENABLED(CONFIG_VGA_ARB) && IS_ENABLED(CONFIG_VGA_SWITCHEROO) &&
-	    apple_gmux_present() && pdev != vga_default_device() &&
-	    !vga_switcheroo_handler_flags())
+	if (vga_switcheroo_client_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
 	return drm_get_pci_dev(pdev, ent, &driver);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index bb8498c..9141bcd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -22,13 +22,11 @@
  * Authors: Ben Skeggs
  */
 
-#include <linux/apple-gmux.h>
 #include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
-#include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 
 #include "drmP.h"
@@ -314,13 +312,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	bool boot = false;
 	int ret;
 
-	/*
-	 * apple-gmux is needed on dual GPU MacBook Pro
-	 * to probe the panel if we're the inactive GPU.
-	 */
-	if (IS_ENABLED(CONFIG_VGA_ARB) && IS_ENABLED(CONFIG_VGA_SWITCHEROO) &&
-	    apple_gmux_present() && pdev != vga_default_device() &&
-	    !vga_switcheroo_handler_flags())
+	if (vga_switcheroo_client_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
 	/* remove conflicting drivers (vesafb, efifb etc) */
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index cad2555..7be0c38 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -34,11 +34,9 @@
 #include "radeon_drv.h"
 
 #include <drm/drm_pciids.h>
-#include <linux/apple-gmux.h>
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
-#include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 #include <drm/drm_gem.h>
 
@@ -321,13 +319,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 {
 	int ret;
 
-	/*
-	 * apple-gmux is needed on dual GPU MacBook Pro
-	 * to probe the panel if we're the inactive GPU.
-	 */
-	if (IS_ENABLED(CONFIG_VGA_ARB) && IS_ENABLED(CONFIG_VGA_SWITCHEROO) &&
-	    apple_gmux_present() && pdev != vga_default_device() &&
-	    !vga_switcheroo_handler_flags())
+	if (vga_switcheroo_client_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
 	/* Get rid of things like offb */
diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index cbd7c98..a8cebd0 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -30,6 +30,7 @@
 
 #define pr_fmt(fmt) "vga_switcheroo: " fmt
 
+#include <linux/apple-gmux.h>
 #include <linux/console.h>
 #include <linux/debugfs.h>
 #include <linux/fb.h>
@@ -376,6 +377,33 @@ find_active_client(struct list_head *head)
 }
 
 /**
+ * vga_switcheroo_client_probe_defer() - whether to defer probing a given GPU
+ * @pdev: pci device of GPU
+ *
+ * Determine whether any prerequisites are not fulfilled to probe a given GPU.
+ * DRM drivers should invoke this early on in their ->probe callback and return
+ * %-EPROBE_DEFER if it evaluates to %true. The GPU need not be registered with
+ * vga_switcheroo_register_client() beforehand.
+ *
+ * Return: %false unless one of the following applies:
+ *
+ * * On pre-retina MacBook Pros, the apple-gmux driver is needed to temporarily
+ *   switch DDC to the inactive GPU so that it can probe the panel's EDID.
+ *   Therefore return %true if gmux is built into the machine, @pdev is the
+ *   inactive GPU and the apple-gmux driver has not registered its handler
+ *   flags, signifying it has not yet loaded or has not finished initializing.
+ */
+bool vga_switcheroo_client_probe_defer(struct pci_dev *pdev)
+{
+	if (apple_gmux_present() && pdev != vga_default_device() &&
+	    !vgasr_priv.handler_flags)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL(vga_switcheroo_client_probe_defer);
+
+/**
  * vga_switcheroo_get_client_state() - obtain power state of a given client
  * @pdev: client pci device
  *
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index b39a5f3..960bedb 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -165,6 +165,7 @@ int vga_switcheroo_unlock_ddc(struct pci_dev *pdev);
 
 int vga_switcheroo_process_delayed_switch(void);
 
+bool vga_switcheroo_client_probe_defer(struct pci_dev *pdev);
 enum vga_switcheroo_state vga_switcheroo_get_client_state(struct pci_dev *dev);
 
 void vga_switcheroo_set_dynamic_switch(struct pci_dev *pdev, enum vga_switcheroo_state dynamic);
@@ -188,6 +189,7 @@ static inline enum vga_switcheroo_handler_flags_t vga_switcheroo_handler_flags(v
 static inline int vga_switcheroo_lock_ddc(struct pci_dev *pdev) { return -ENODEV; }
 static inline int vga_switcheroo_unlock_ddc(struct pci_dev *pdev) { return -ENODEV; }
 static inline int vga_switcheroo_process_delayed_switch(void) { return 0; }
+static inline bool vga_switcheroo_client_probe_defer(struct pci_dev *pdev) { return false; }
 static inline enum vga_switcheroo_state vga_switcheroo_get_client_state(struct pci_dev *dev) { return VGA_SWITCHEROO_ON; }
 
 static inline void vga_switcheroo_set_dynamic_switch(struct pci_dev *pdev, enum vga_switcheroo_state dynamic) {}
-- 
2.1.0
