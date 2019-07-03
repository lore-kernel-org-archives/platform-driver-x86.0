From: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 21/35] platform/x86/thinkpad: Use kmemdup rather than duplicating its implementation
Date: Thu,  4 Jul 2019 00:30:00 +0800
Message-ID: <20190703163000.315-1-huangfq.daxian@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fuqian Huang <huangfq.daxian@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

 drivers/platform/x86/thinkpad_acpi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7bde4640ef34..d379bdf98a0f 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3647,22 +3647,19 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		goto err_exit;
 
 	/* Set up key map */
-	hotkey_keycode_map = kmalloc(TPACPI_HOTKEY_MAP_SIZE,
-					GFP_KERNEL);
-	if (!hotkey_keycode_map) {
-		pr_err("failed to allocate memory for key map\n");
-		res = -ENOMEM;
-		goto err_exit;
-	}
-
 	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
 					ARRAY_SIZE(tpacpi_keymap_qtable));
 	BUG_ON(keymap_id >= ARRAY_SIZE(tpacpi_keymaps));
 	dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 		   "using keymap number %lu\n", keymap_id);
 
-	memcpy(hotkey_keycode_map, &tpacpi_keymaps[keymap_id],
-		TPACPI_HOTKEY_MAP_SIZE);
+	hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
+			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
+	if (!hotkey_keycode_map) {
+		pr_err("failed to allocate memory for key map\n");
+		res = -ENOMEM;
+		goto err_exit;
+	}
 
 	input_set_capability(tpacpi_inputdev, EV_MSC, MSC_SCAN);
 	tpacpi_inputdev->keycodesize = TPACPI_HOTKEY_MAP_TYPESIZE;
-- 
2.11.0
