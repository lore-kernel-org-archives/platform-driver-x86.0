From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v5 10/12] drm/i915: Defer probe if gmux is present but
 its driver isn't
Date: Thu, 18 Feb 2016 21:34:31 +0100
Message-ID: <20160218203431.GA19065@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
 <f56ee6a0600a3e1bb5bed4d0db4ed9ade7445c47.1452525860.git.lukas@wunner.de>
 <20160209090401.GA11240@phenom.ffwll.local>
 <20160214121008.GA16847@wunner.de>
 <CAKMK7uGZz=HyDhgJg=y9xb+i=-3zrQ_b8FGH6_Hd7snTyok7zQ@mail.gmail.com>
 <20160216155820.GA17446@wunner.de>
 <20160216160840.GT32705@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:45135 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946859AbcBRUeA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 15:34:00 -0500
Content-Disposition: inline
In-Reply-To: <20160216160840.GT32705@phenom.ffwll.local>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, platform-driver-x86@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>

Hi,

On Tue, Feb 16, 2016 at 05:08:40PM +0100, Daniel Vetter wrote:
> On Tue, Feb 16, 2016 at 04:58:20PM +0100, Lukas Wunner wrote:
> > On Sun, Feb 14, 2016 at 01:46:28PM +0100, Daniel Vetter wrote:
> > > On Sun, Feb 14, 2016 at 1:10 PM, Lukas Wunner <lukas@wunner.de> wrote:
> > > > + * DRM drivers should invoke this early on in their ->probe callback and return
> > > > + * %-EPROBE_DEFER if it evaluates to %true. The GPU need not be registered with
> > > > + * vga_switcheroo_register_client() beforehand.
> > > 
> > > s/need not/must not/ ... is your native language German by any chance?
> > 
> > In principle there's no harm in registering the client first,
> > then checking if probing should be deferred, as long as the
> > client is unregistered before deferring. Thus the language
> > above is intentionally "need not" (muss nicht) rather than
> > "must not" (darf nicht). I didn't want to mandate something
> > that isn't actually required. The above sentence is merely
> > an aid for driver developers who might be confused in which
> > order to call what.
> 
> I'd reject any driver that does this, registering, then checking, then
> unregistering seems extermely unsafe. I'd really stick with mandatory
> language here to make this clear.

Ok, I've made it mandatory in the kerneldoc, updated patch follows below.


> Ok, makes sense. I still think adding the check to the client_register
> function would be good, just as a safety measure.

Hm, the idea of calling vga_switcheroo_client_probe_defer() twice
causes me pain in the stomach. It's surprising for drivers which
just don't need it at the moment (amdgpu and snd_hda_intel) and
it feels like overengineering and pampering driver developers
beyond reasonable measure. Also while the single existing check is
cheap, we might later on add checks that take more time and slow
things down.

Best regards,

Lukas

-- >8 --
Subject: [PATCH] vga_switcheroo: Add helper for deferred probing

So far we've got one condition when DRM drivers need to defer probing
on a dual GPU system and it's coded separately into each of the relevant
drivers. As suggested by Daniel Vetter, deduplicate that code in the
drivers and move it to a new vga_switcheroo helper. This yields better
encapsulation of concepts and lets us add further checks in a central
place. (The existing check pertains to pre-retina MacBook Pros and an
additional check is expected to be needed for retinas.)

v2: This helper could eventually be used by audio clients as well,
    so rephrase kerneldoc to refer to "client" instead of "GPU"
    and move the single existing check in an if block specific
    to PCI_CLASS_DISPLAY_VGA devices. Move documentation on
    that check from kerneldoc to a comment. (Daniel Vetter)

v3: Mandate in kerneldoc that registration of client shall only
    happen after calling this helper. (Daniel Vetter)

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/drm/i915/i915_drv.c       | 10 +---------
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 +---------
 drivers/gpu/drm/radeon/radeon_drv.c   | 10 +---------
 drivers/gpu/vga/vga_switcheroo.c      | 34 ++++++++++++++++++++++++++++++++--
 include/linux/vga_switcheroo.h        |  2 ++
 5 files changed, 37 insertions(+), 29 deletions(-)

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
index cbd7c98..101e14c 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -30,6 +30,7 @@
 
 #define pr_fmt(fmt) "vga_switcheroo: " fmt
 
+#include <linux/apple-gmux.h>
 #include <linux/console.h>
 #include <linux/debugfs.h>
 #include <linux/fb.h>
@@ -308,7 +309,8 @@ static int register_client(struct pci_dev *pdev,
  *
  * Register vga client (GPU). Enable vga_switcheroo if another GPU and a
  * handler have already registered. The power state of the client is assumed
- * to be ON.
+ * to be ON. Beforehand, vga_switcheroo_client_probe_defer() shall be called
+ * to ensure that all prerequisites are met.
  *
  * Return: 0 on success, -ENOMEM on memory allocation error.
  */
@@ -329,7 +331,8 @@ EXPORT_SYMBOL(vga_switcheroo_register_client);
  * @id: client identifier
  *
  * Register audio client (audio device on a GPU). The power state of the
- * client is assumed to be ON.
+ * client is assumed to be ON. Beforehand, vga_switcheroo_client_probe_defer()
+ * shall be called to ensure that all prerequisites are met.
  *
  * Return: 0 on success, -ENOMEM on memory allocation error.
  */
@@ -376,6 +379,33 @@ find_active_client(struct list_head *head)
 }
 
 /**
+ * vga_switcheroo_client_probe_defer() - whether to defer probing a given client
+ * @pdev: client pci device
+ *
+ * Determine whether any prerequisites are not fulfilled to probe a given
+ * client. Drivers shall invoke this early on in their ->probe callback
+ * and return %-EPROBE_DEFER if it evaluates to %true. Thou shalt not
+ * register the client ere thou hast called this.
+ *
+ * Return: %true if probing should be deferred, otherwise %false.
+ */
+bool vga_switcheroo_client_probe_defer(struct pci_dev *pdev)
+{
+	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA) {
+		/*
+		 * apple-gmux is needed on pre-retina MacBook Pro
+		 * to probe the panel if pdev is the inactive GPU.
+		 */
+		if (apple_gmux_present() && pdev != vga_default_device() &&
+		    !vgasr_priv.handler_flags)
+			return true;
+	}
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
1.8.5.2 (Apple Git-48)
