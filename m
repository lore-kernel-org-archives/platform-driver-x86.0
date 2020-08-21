From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 7/9] resolve hotkey double trigger bug
Date: Sat, 22 Aug 2020 02:14:31 +0800
Message-ID: <20200821181433.17653-8-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Sometimes double ACPI events are triggered for brightness, vol and mute hotkeys. This
patch fixes it.


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 3b0294ee9d3e..6779099a3ec9 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -13,6 +13,7 @@
  *
  * ChangeLog:
  *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *			resolve hotkey double trigger
  *			add write support to mute
  *			fix sticky_key init bug
  *			fix naming of platform files for consistency with other
@@ -597,9 +598,11 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 					result & 0xf, 0x80, false);
 	}
 
-	if (!sparse_keymap_report_event(hotk_input_dev,
-					result & 0xf, result & 0x80, false))
-		pr_err("Unknown hotkey event: 0x%04llx\n", result);
+	if ((result & 0xf) == 0x7 || (result & 0xf) == 0x9 || (result & 0xf) == 0xa) {
+		if (!sparse_keymap_report_event(hotk_input_dev,
+						result & 0xf, result & 0x80, false))
+			pr_err("Unknown hotkey event: 0x%04llx\n", result);
+	}
 }
 
 static void acpi_pcc_hotkey_notify(struct acpi_device *device, u32 event)
-- 
2.17.5
