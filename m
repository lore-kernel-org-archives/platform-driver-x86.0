Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C53C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 20:49:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A6F561430
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 20:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243704AbhDUUti (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Apr 2021 16:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33881 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242846AbhDUUth (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Apr 2021 16:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619038143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gMMV3JwSXnc0I3O/dM1VJO2u6PDNin9cfeB9qmtkfSU=;
        b=GVDTCoiSAGEjDZKiES9Os5ZvlRIwmtnJ2Dk1ruErvgooaIYOA588Bjx4GYyPNXWTqSNksr
        lYfRRmlCxtTRoNs2Sk85Wp0HMebCkvbFSLkDJ/7ahDjIxkdCfaoep55Zj2TJFj1FiYojrO
        2Ala6iYtkz1AtTEdfPk79tPwTSX0yjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-VYzGdGaYNmehi0sRSKA4sg-1; Wed, 21 Apr 2021 16:48:44 -0400
X-MC-Unique: VYzGdGaYNmehi0sRSKA4sg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E26E87A826;
        Wed, 21 Apr 2021 20:48:42 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-17.ams2.redhat.com [10.36.112.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1E4AD5B69B;
        Wed, 21 Apr 2021 20:48:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 9/9] drm/i915: Add privacy-screen support
Date:   Wed, 21 Apr 2021 22:48:04 +0200
Message-Id: <20210421204804.589962-10-hdegoede@redhat.com>
In-Reply-To: <20210421204804.589962-1-hdegoede@redhat.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for eDP panels with a built-in privacy screen using the
new drm_privacy_screen class.

One thing which stands out here is the addition of these 2 lines to
intel_atomic_commit_tail:

	for_each_new_connector_in_state(&state->base, connector, ...
		drm_connector_update_privacy_screen(connector, state);

It may seem more logical to instead take care of updating the
privacy-screen state by marking the crtc as needing a modeset and then
do this in both the encoder update_pipe (for fast-sets) and enable
(for full modesets) callbacks. But ATM these callbacks only get passed
the new connector_state and these callbacks are all called after
drm_atomic_helper_swap_state() at which point there is no way to get
the old state from the new state.

Without access to the old state, we do not know if the sw_state of
the privacy-screen has changes so we would need to call
drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
since all current known privacy-screen providers use ACPI calls which
are somewhat expensive to make.

Also, as all providers use ACPI calls, rather then poking GPU registers,
there is no need to order this together with other encoder operations.
Since no GPU poking is involved having this as a separate step of the
commit process actually is the logical thing to do.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
 drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a10e26380ef3..b11fcc660446 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10159,6 +10159,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	struct drm_device *dev = state->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
+	struct drm_connector_state *new_connector_state;
+	struct drm_connector *connector;
 	struct intel_crtc *crtc;
 	u64 put_domains[I915_MAX_PIPES] = {};
 	intel_wakeref_t wakeref = 0;
@@ -10256,6 +10258,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 			intel_color_load_luts(new_crtc_state);
 	}
 
+	for_each_new_connector_in_state(&state->base, connector, new_connector_state, i)
+		drm_connector_update_privacy_screen(connector, &state->base);
+
 	/*
 	 * Now that the vblank has passed, we can go ahead and program the
 	 * optimal watermarks on platforms that need two-step watermark
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 52ea09fc5e70..57864782d922 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 
 #include "g4x_dp.h"
@@ -5178,6 +5179,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	struct drm_connector *connector = &intel_connector->base;
 	struct drm_display_mode *fixed_mode = NULL;
 	struct drm_display_mode *downclock_mode = NULL;
+	struct drm_privacy_screen *privacy_screen;
 	bool has_dpcd;
 	enum pipe pipe = INVALID_PIPE;
 	struct edid *edid;
@@ -5268,6 +5270,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 				fixed_mode->hdisplay, fixed_mode->vdisplay);
 	}
 
+	privacy_screen = drm_privacy_screen_get(&dev->pdev->dev, NULL);
+	if (!IS_ERR(privacy_screen)) {
+		drm_connector_attach_privacy_screen_provider(connector,
+							     privacy_screen);
+	} else if (PTR_ERR(privacy_screen) != -ENODEV) {
+		drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
+	}
+
 	return true;
 
 out_vdd_off:
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 7786217638ed..09d52ecc3713 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -26,6 +26,7 @@
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/i915_pciids.h>
 
 #include "display/intel_fbdev.h"
@@ -1067,6 +1068,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct intel_device_info *intel_info =
 		(struct intel_device_info *) ent->driver_data;
+	struct drm_privacy_screen *privacy_screen;
 	int err;
 
 	if (intel_info->require_force_probe &&
@@ -1095,7 +1097,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (vga_switcheroo_client_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	/*
+	 * We do not handle -EPROBE_DEFER further into the probe process, so
+	 * check if we have a laptop-panel privacy-screen for which the driver
+	 * has not loaded yet here.
+	 */
+	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
+	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	err = i915_driver_probe(pdev, ent);
+	drm_privacy_screen_put(privacy_screen);
 	if (err)
 		return err;
 
-- 
2.31.1

