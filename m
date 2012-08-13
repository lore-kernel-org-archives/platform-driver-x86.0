From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH 1/2] gmux: Add generic write32 function
Date: Mon, 13 Aug 2012 16:20:31 -0400
Message-ID: <1344889232-3907-1-git-send-email-mjg@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Seth Forshee <seth.forshee@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

Move the special-cased backlight update function to a generic gmux_write32
function.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
Cc: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |  3 +++
 drivers/platform/x86/apple-gmux.c      | 23 +++++++++++++----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index a0a3fe3..818b93c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -6473,6 +6473,9 @@ nouveau_run_vbios_init(struct drm_device *dev)
 		}
 	}
 
+	if (!bios->execute)
+		nouveau_gpio_reset(dev);
+
 	return ret;
 }
 
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 905fa01..43721c1 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -75,6 +75,18 @@ static inline u32 gmux_read32(struct apple_gmux_data *gmux_data, int port)
 	return inl(gmux_data->iostart + port);
 }
 
+static inline u32 gmux_write32(struct apple_gmux_data *gmux_data, int port,
+			       u32 val)
+{
+	int i;
+	u8 tmpval;
+
+	for (i = 0; i < 4; i++) {
+		tmpval = (val >> (i * 8)) & 0xff;
+		outb(tmpval, port + i);
+	}
+}
+
 static int gmux_get_brightness(struct backlight_device *bd)
 {
 	struct apple_gmux_data *gmux_data = bl_get_data(bd);
@@ -90,16 +102,7 @@ static int gmux_update_status(struct backlight_device *bd)
 	if (bd->props.state & BL_CORE_SUSPENDED)
 		return 0;
 
-	/*
-	 * Older gmux versions require writing out lower bytes first then
-	 * setting the upper byte to 0 to flush the values. Newer versions
-	 * accept a single u32 write, but the old method also works, so we
-	 * just use the old method for all gmux versions.
-	 */
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS, brightness);
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 1, brightness >> 8);
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 2, brightness >> 16);
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 3, 0);
+	gmux_write32(gmux_data, GMUX_PORT_BRIGHTNES, brightness);
 
 	return 0;
 }
-- 
1.7.11.2
