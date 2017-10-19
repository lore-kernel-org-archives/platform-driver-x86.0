From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: silead_dmi: Fix GP-electronic T701 entry
Date: Thu, 19 Oct 2017 09:44:14 +0200
Message-ID: <20171019074414.16335-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The GP-electronic T701 has its LCD panel mounted upside-down, initially
my plan was to fix this by transparently rotating the image in the i915
driver (my "drm/i915: Deal with upside-down mounted LCD" patch), but
that approach has been rejected instead the kernel will now export
a "panel orientation" property on the drm-connector for the panel and
let userspace deal with it.

But userspace expects the touchscreen coordinates to match the panel
coordinates *before* applying any rotation, so now that we no longer hide
the upside-down-ness of the LCD panel from userspace the coordinates being
generated are wrong and we need to apply a rotation of 180 degrees to the
coordinates to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/silead_dmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
index a0f80f971081..ac304f2318cc 100644
--- a/drivers/platform/x86/silead_dmi.c
+++ b/drivers/platform/x86/silead_dmi.c
@@ -85,6 +85,8 @@ static const struct silead_ts_dmi_data surftab_wintron70_st70416_6_data = {
 static const struct property_entry gp_electronic_t701_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name",
 			      "gsl1680-gp-electronic-t701.fw"),
 	{ }
-- 
2.14.2
