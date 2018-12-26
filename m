From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v8 06/25] x86/thinkpad_acpi: Use arch_nvram_ops methods
 instead of nvram_read_byte() and nvram_write_byte()
Date: Wed, 26 Dec 2018 11:37:59 +1100
Message-ID: <416df0c555a86aee4d0e7e08675abf71f2f5b775.1545784679.git.fthain@telegraphics.com.au>
References: <cover.1545784679.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1545784679.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Make use of arch_nvram_ops in the thinkpad_acpi driver so that the
nvram_* function exports can be removed.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
I've tested this on a ThinkPad T43.
---
 drivers/platform/x86/thinkpad_acpi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index fde08a997557..fbbf7b452e51 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2435,30 +2435,30 @@ static void hotkey_read_nvram(struct tp_nvram_state *n, const u32 m)
 	u8 d;
 
 	if (m & TP_NVRAM_HKEY_GROUP_HK2) {
-		d = nvram_read_byte(TP_NVRAM_ADDR_HK2);
+		d = arch_nvram_ops.read_byte(TP_NVRAM_ADDR_HK2);
 		n->thinkpad_toggle = !!(d & TP_NVRAM_MASK_HKT_THINKPAD);
 		n->zoom_toggle = !!(d & TP_NVRAM_MASK_HKT_ZOOM);
 		n->display_toggle = !!(d & TP_NVRAM_MASK_HKT_DISPLAY);
 		n->hibernate_toggle = !!(d & TP_NVRAM_MASK_HKT_HIBERNATE);
 	}
 	if (m & TP_ACPI_HKEY_KBD_LIGHT_MASK) {
-		d = nvram_read_byte(TP_NVRAM_ADDR_THINKLIGHT);
+		d = arch_nvram_ops.read_byte(TP_NVRAM_ADDR_THINKLIGHT);
 		n->thinklight_toggle = !!(d & TP_NVRAM_MASK_THINKLIGHT);
 	}
 	if (m & TP_ACPI_HKEY_DISPXPAND_MASK) {
-		d = nvram_read_byte(TP_NVRAM_ADDR_VIDEO);
+		d = arch_nvram_ops.read_byte(TP_NVRAM_ADDR_VIDEO);
 		n->displayexp_toggle =
 				!!(d & TP_NVRAM_MASK_HKT_DISPEXPND);
 	}
 	if (m & TP_NVRAM_HKEY_GROUP_BRIGHTNESS) {
-		d = nvram_read_byte(TP_NVRAM_ADDR_BRIGHTNESS);
+		d = arch_nvram_ops.read_byte(TP_NVRAM_ADDR_BRIGHTNESS);
 		n->brightness_level = (d & TP_NVRAM_MASK_LEVEL_BRIGHTNESS)
 				>> TP_NVRAM_POS_LEVEL_BRIGHTNESS;
 		n->brightness_toggle =
 				!!(d & TP_NVRAM_MASK_HKT_BRIGHTNESS);
 	}
 	if (m & TP_NVRAM_HKEY_GROUP_VOLUME) {
-		d = nvram_read_byte(TP_NVRAM_ADDR_MIXER);
+		d = arch_nvram_ops.read_byte(TP_NVRAM_ADDR_MIXER);
 		n->volume_level = (d & TP_NVRAM_MASK_LEVEL_VOLUME)
 				>> TP_NVRAM_POS_LEVEL_VOLUME;
 		n->mute = !!(d & TP_NVRAM_MASK_MUTE);
@@ -6605,7 +6605,7 @@ static unsigned int tpacpi_brightness_nvram_get(void)
 {
 	u8 lnvram;
 
-	lnvram = (nvram_read_byte(TP_NVRAM_ADDR_BRIGHTNESS)
+	lnvram = (arch_nvram_ops.read_byte(TP_NVRAM_ADDR_BRIGHTNESS)
 		  & TP_NVRAM_MASK_LEVEL_BRIGHTNESS)
 		  >> TP_NVRAM_POS_LEVEL_BRIGHTNESS;
 	lnvram &= bright_maxlvl;
@@ -6630,7 +6630,7 @@ static void tpacpi_brightness_checkpoint_nvram(void)
 	if (unlikely(!acpi_ec_read(TP_EC_BACKLIGHT, &lec)))
 		goto unlock;
 	lec &= TP_EC_BACKLIGHT_LVLMSK;
-	b_nvram = nvram_read_byte(TP_NVRAM_ADDR_BRIGHTNESS);
+	b_nvram = arch_nvram_ops.read_byte(TP_NVRAM_ADDR_BRIGHTNESS);
 
 	if (lec != ((b_nvram & TP_NVRAM_MASK_LEVEL_BRIGHTNESS)
 			     >> TP_NVRAM_POS_LEVEL_BRIGHTNESS)) {
@@ -6638,7 +6638,7 @@ static void tpacpi_brightness_checkpoint_nvram(void)
 		b_nvram &= ~(TP_NVRAM_MASK_LEVEL_BRIGHTNESS <<
 				TP_NVRAM_POS_LEVEL_BRIGHTNESS);
 		b_nvram |= lec;
-		nvram_write_byte(b_nvram, TP_NVRAM_ADDR_BRIGHTNESS);
+		arch_nvram_ops.write_byte(b_nvram, TP_NVRAM_ADDR_BRIGHTNESS);
 		dbg_printk(TPACPI_DBG_BRGHT,
 			   "updated NVRAM backlight level to %u (0x%02x)\n",
 			   (unsigned int) lec, (unsigned int) b_nvram);
@@ -7236,13 +7236,13 @@ static void tpacpi_volume_checkpoint_nvram(void)
 	if (unlikely(!acpi_ec_read(TP_EC_AUDIO, &lec)))
 		goto unlock;
 	lec &= ec_mask;
-	b_nvram = nvram_read_byte(TP_NVRAM_ADDR_MIXER);
+	b_nvram = arch_nvram_ops.read_byte(TP_NVRAM_ADDR_MIXER);
 
 	if (lec != (b_nvram & ec_mask)) {
 		/* NVRAM needs update */
 		b_nvram &= ~ec_mask;
 		b_nvram |= lec;
-		nvram_write_byte(b_nvram, TP_NVRAM_ADDR_MIXER);
+		arch_nvram_ops.write_byte(b_nvram, TP_NVRAM_ADDR_MIXER);
 		dbg_printk(TPACPI_DBG_MIXER,
 			   "updated NVRAM mixer status to 0x%02x (0x%02x)\n",
 			   (unsigned int) lec, (unsigned int) b_nvram);
-- 
2.19.2
