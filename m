From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v5 12/12] drm/radeon: Defer probe if gmux is present but its
 driver isn't
Date: Mon, 11 Jan 2016 20:09:20 +0100
Message-ID: <552da6d85a82092146af7b0693595fa2a9ea376b.1452525860.git.lukas@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:52626 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758737AbcAKTMS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:12:18 -0500
In-Reply-To: <cover.1452525860.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>

gmux is a microcontroller built into dual GPU MacBook Pros.
On pre-retina MBPs, if we're the inactive GPU, we need apple-gmux
to temporarily switch DDC so that we can probe the panel's EDID.

The checks for CONFIG_VGA_ARB and CONFIG_VGA_SWITCHEROO are necessary
because if either of them is disabled but gmux is present, the driver
would never load, even if we're the active GPU. (vga_default_device()
would evaluate to NULL and vga_switcheroo_handler_flags() would
evaluate to 0.)

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=61115
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index e266ffc..cad2555 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -34,9 +34,11 @@
 #include "radeon_drv.h"
 
 #include <drm/drm_pciids.h>
+#include <linux/apple-gmux.h>
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 #include <drm/drm_gem.h>
 
@@ -319,6 +321,15 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 {
 	int ret;
 
+	/*
+	 * apple-gmux is needed on dual GPU MacBook Pro
+	 * to probe the panel if we're the inactive GPU.
+	 */
+	if (IS_ENABLED(CONFIG_VGA_ARB) && IS_ENABLED(CONFIG_VGA_SWITCHEROO) &&
+	    apple_gmux_present() && pdev != vga_default_device() &&
+	    !vga_switcheroo_handler_flags())
+		return -EPROBE_DEFER;
+
 	/* Get rid of things like offb */
 	ret = radeon_kick_out_firmware_fb(pdev);
 	if (ret)
-- 
1.8.5.2 (Apple Git-48)
