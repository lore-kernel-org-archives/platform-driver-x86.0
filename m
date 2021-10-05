Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D9FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 20:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91DAE61502
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 20:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhJEU1F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Oct 2021 16:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20999 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229805AbhJEU1F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Oct 2021 16:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633465514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k4RpTCn3gGG5wted5jUnblh5Mc/NF5t9RZMDwlGEgDQ=;
        b=bsDvB/N1PI8t51pHLQpc5S+r1ME/uw7dBT35UAv/bxoQvskiBdYvc3pJXmzkujLz800jqw
        W20DtbN8kX0NsFH7Bfu5MQ+ur++C9sizUGFPF3B+g4QcsWnNcdI+fv38pTRFJ6ul+vkT8f
        5DlcfBeKfPBWBZPtJjy01CDNJJ5XqUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-CPuSR7geMdGD7g3lLW1brQ-1; Tue, 05 Oct 2021 16:25:11 -0400
X-MC-Unique: CPuSR7geMdGD7g3lLW1brQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664C21966320;
        Tue,  5 Oct 2021 20:25:08 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.128])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8EEB360C05;
        Tue,  5 Oct 2021 20:24:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 09/10] drm/i915: Add intel_modeset_probe_defer() helper
Date:   Tue,  5 Oct 2021 22:23:21 +0200
Message-Id: <20211005202322.700909-10-hdegoede@redhat.com>
In-Reply-To: <20211005202322.700909-1-hdegoede@redhat.com>
References: <20211005202322.700909-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The upcoming privacy-screen support adds another check for
deferring probe till some other drivers have bound first.

Factor out the current vga_switcheroo_client_probe_defer() check
into an intel_modeset_probe_defer() helper, so that further
probe-deferral checks can be added there.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  1 +
 drivers/gpu/drm/i915/i915_pci.c              |  9 ++-------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4f0badb11bbb..86dbe366a907 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -32,6 +32,7 @@
 #include <linux/module.h>
 #include <linux/dma-resv.h>
 #include <linux/slab.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -12766,6 +12767,18 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
 	intel_bios_driver_remove(i915);
 }
 
+bool intel_modeset_probe_defer(struct pci_dev *pdev)
+{
+	/*
+	 * apple-gmux is needed on dual GPU MacBook Pro
+	 * to probe the panel if we're the inactive GPU.
+	 */
+	if (vga_switcheroo_client_probe_defer(pdev))
+		return true;
+
+	return false;
+}
+
 void intel_display_driver_register(struct drm_i915_private *i915)
 {
 	if (!HAS_DISPLAY(i915))
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 3028072c2cf3..d3d34acb6c08 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -633,6 +633,7 @@ void intel_display_driver_register(struct drm_i915_private *i915);
 void intel_display_driver_unregister(struct drm_i915_private *i915);
 
 /* modesetting */
+bool intel_modeset_probe_defer(struct pci_dev *pdev);
 void intel_modeset_init_hw(struct drm_i915_private *i915);
 int intel_modeset_init_noirq(struct drm_i915_private *i915);
 int intel_modeset_init_nogem(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 169837de395d..8fc45d8119b6 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -22,8 +22,6 @@
  *
  */
 
-#include <linux/vga_switcheroo.h>
-
 #include <drm/drm_drv.h>
 #include <drm/i915_pciids.h>
 
@@ -1189,11 +1187,8 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (PCI_FUNC(pdev->devfn))
 		return -ENODEV;
 
-	/*
-	 * apple-gmux is needed on dual GPU MacBook Pro
-	 * to probe the panel if we're the inactive GPU.
-	 */
-	if (vga_switcheroo_client_probe_defer(pdev))
+	/* Detect if we need to wait for other drivers early on */
+	if (intel_modeset_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
 	err = i915_driver_probe(pdev, ent);
-- 
2.31.1

