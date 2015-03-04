From: Joseph Salisbury <joseph.salisbury@canonical.com>
Subject: [PATCH 1/2] toshiba_acpi: Add Satellite L845 to alternative keymap.
Date: Wed,  4 Mar 2015 16:52:33 -0500
Message-ID: <f550a80e50ed5296cb8bc9b6a536c68c05dc66c6.1425502427.git.joseph.salisbury@canonical.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

BugLink: http://bugs.launchpad.net/bugs/1428302

The Toshiba Satellite L845 is required in the alternate keymap for all
keys to properly function.  Specifically the KEY_WLAN mapped as 0x158.
Without being in the alternate keymap, the L845 will report 'Unknown key 158'.

Signed-off-by: Joseph Salisbury <joseph.salisbury@canonical.com>
Reported-and-tested-by: zcappa@gmail.com
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/toshiba_acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index dbcb7a8..333aaca 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -263,6 +263,12 @@ static const struct dmi_system_id toshiba_alt_keymap_dmi[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "TECRA A50-A"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Satellite-L845"),
+		},
+	},
 	{}
 };
 
-- 
2.1.0
