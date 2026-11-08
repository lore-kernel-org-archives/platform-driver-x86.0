Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132575;
	b=fT8VErhqsOjQXXXQ+dTyK303phsw8qMSofBcz7cOdDT3IC9uxMX87nAQD/PcEI+EzcGp
	 PYr5M/SERVxYtZfagjgPHlfdog+fE8ci2DZhe+6rvPnQ6dU/TolmquAvrTPR7yDNyZ8z7
	 zwKD7GGdjCDcAgj/epyDJTXHM5C8pH7qk5ODQkm/GL6N9gDM1Am6VFamrv9VlatVNryST
	 q0Qmjnr+Asln992qtrFXRLhKGKuRnDGnfuiPgW/Qe4TJ5C+bOV5lIClu3YBW7S8N6T1Un
	 o3ntCJgDgyPOm4YDs9Ta4CRr74OUy3CWM8TCyQX11eR0KFt6HSKh73vneRlwOVRuMZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132575;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1uwiNKMbvhBAXcecmGoFjqOAK5Qba8ZnTWBcEvlHDAs=;
	b=hre51RktPjYQQm2QuY+lAmQpgiWoZvhrXSdcIkmLnD9jkbYApdWLmzTRcfpmTRo3F87F
	 2ENTRSHPcJATnMnNjutNVUQ1B9gGeboSHuWl93HXBhByt7Xf9dMHSUwkAEmEIZAAWfhlT
	 kn62i6RsuGByQNNHH7+de8KKdHHi6Z0Uxnt5NeiZh290j6pPk85BfsIbIJpPEmu6QMGpw
	 iCtroR3tjznp0P/IflQ6+YxFt4agLKaEEeyNIOJK7l+Gu/CWHTxmHPlXNPr/Erdi3tNih
	 YuMaBd1vjBD6gbgHoQ5Q4iQ8O51yWolHRJwJQqWA4KWsDqmucw7nlbZh6mLsmYc6PYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IGdFcVa0;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCA606A31C;
	Sun,  8 Nov 2026 10:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDCA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IGdFcVa0
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 0cb6624c-966a-4a95-a126-0519d608ab05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794132570;
	bh=S6Y/LwG+wCmImnTNaesKgeOzR3fz30WpQYzLROThjVQ=;
	h=From:To:Cc:Subject:Date:From;
	b=IGdFcVa0bidLQ3V6WX5gz1QLex4rCqOuR9A/6rS4Mi5BcStBYv7sEXYtNC+u17+ck
	 4Y2GdUVRw/GmC7SkGlLWLZh9k3q4LbQUZWc/m5/QzC/hmCx7/Tln68oUBv/GkqdMMd
	 Wn5PdWnZLBCVT4SutpfwE2sM7CRIzY++Dar86UWTONIj4ZlNldiBzsCGZ9e5Bcy3yG
	 0U1Lcu5IGK/AGZ1jghZciN8xbJAAvqtPYH3ZutsiDOQOUE0GBcZhlN2owqiF9677hn
	 W2fMkh8yPpLwR/7EBZPI1U7nv0sd/RBtZEuxmE3aUGJw+bxMlD68GhTgyr1sGhM5Hc
	 9AoFEUZS/IHPw==
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH] drm/i915/backlight: restore the gmux brightness on dual GPU T2 MacBook Pros
Date: Sun,  8 Nov 2026 11:09:26 +0100
Message-ID: <20261108100926.28950-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When i915 drives the panel of a dual GPU T2 MacBook Pro, the panel comes
back at 80% brightness after every screen lock, login and resume, while
the gmux backlight device still reports the level userspace set.

gmux resets its brightness register to 0xcccc of 0xffff when i915 powers
the panel off and applies that value when the panel comes back on.

This cannot be handled in apple-gmux. gmux raises no interrupt when the
panel is powered off or on. Only the GPU driver knows when the panel is
back.

amdgpu needs no such restore. When it drives the panel, the gmux
brightness register and the panel's DPCD brightness stay unchanged across
a screen lock.

Add a DMI quirk for these models and write the cached level back through
the gmux backlight device after enabling the backlight. The device is
looked up by name so i915 does not depend on apple-gmux.

Tested on the MacBookPro15,1 and MacBookPro16,1.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../gpu/drm/i915/display/intel_backlight.c    | 31 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.c   | 37 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
 3 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index b128896cb..fddd2292e 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -793,6 +793,35 @@ static void __intel_backlight_enable(const struct intel_crtc_state *crtc_state,
 		panel->backlight.device->props.power = BACKLIGHT_POWER_ON;
 }
 
+#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+/*
+ * The gmux of dual GPU T2 MacBook Pros falls back to its default brightness
+ * whenever the panel is powered off and raises no interrupt for it. Its
+ * backlight device still holds the level userspace set, so apply that level
+ * again once the panel is back on.
+ */
+static void intel_backlight_restore_gmux(struct intel_display *display)
+{
+	struct backlight_device *bd;
+
+	if (!intel_has_quirk(display, QUIRK_GMUX_RESETS_BRIGHTNESS))
+		return;
+
+	bd = backlight_device_get_by_name("gmux_backlight");
+	if (!bd)
+		return;
+
+	drm_dbg_kms(display->drm, "restoring gmux brightness %d\n",
+		    bd->props.brightness);
+	backlight_update_status(bd);
+	put_device(&bd->dev);
+}
+#else
+static void intel_backlight_restore_gmux(struct intel_display *display)
+{
+}
+#endif
+
 void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state)
 {
@@ -811,6 +840,8 @@ void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
 	__intel_backlight_enable(crtc_state, conn_state);
 
 	mutex_unlock(&display->backlight.lock);
+
+	intel_backlight_restore_gmux(display);
 }
 
 #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a40d..739e030cf 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -100,6 +100,13 @@ static void quirk_disable_psr2(struct intel_display *display)
 	drm_info(display->drm, "PSR2 support not currently available for this setup, applying disable PSR2 quirk\n");
 }
 
+/* The gmux of dual GPU T2 MacBook Pros resets the brightness on panel power off */
+static void quirk_gmux_resets_brightness(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_GMUX_RESETS_BRIGHTNESS);
+	drm_info(display->drm, "Applying gmux brightness restore quirk\n");
+}
+
 static void quirk_enable_dpcd_backlight(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
@@ -196,6 +203,36 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 		},
 		.hook = quirk_no_pps_backlight_power_hook,
 	},
+	{
+		.dmi_id_list = &(const struct dmi_system_id[]) {
+			{
+				.ident = "MacBookPro15,1",
+				.matches = {DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+					    DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBookPro15,1"),
+				},
+			},
+			{
+				.ident = "MacBookPro15,3",
+				.matches = {DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+					    DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBookPro15,3"),
+				},
+			},
+			{
+				.ident = "MacBookPro16,1",
+				.matches = {DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+					    DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBookPro16,1"),
+				},
+			},
+			{
+				.ident = "MacBookPro16,4",
+				.matches = {DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+					    DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBookPro16,4"),
+				},
+			},
+			{ }
+		},
+		.hook = quirk_gmux_resets_brightness,
+	},
 };
 
 static struct intel_quirk intel_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 4996419ae..7498583c1 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -24,6 +24,7 @@ enum intel_quirk_id {
 	QUIRK_DISABLE_EDP_PANEL_REPLAY,
 	QUIRK_DISABLE_PSR2,
 	QUIRK_ENABLE_DPCD_BACKLIGHT,
+	QUIRK_GMUX_RESETS_BRIGHTNESS,
 };
 
 void intel_init_quirks(struct intel_display *display);

base-commit: 7b42cc130bec053d6989b849785c553f27b752ce
