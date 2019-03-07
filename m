From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: disable bluetooth for some machines
Date: Thu,  7 Mar 2019 17:37:16 +0800
Message-ID: <20190307093716.3439-1-jiaxun.yang@flygoat.com>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Sender: stable-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br
Cc: dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: platform-driver-x86.vger.kernel.org

Some AMD based ThinkPads have a firmware bug that calling
"GBDC" will cause bluetooth on Intel wireless cards blocked.

Probe these models by DMI match and disable bluetooth subdriver
if specified Intel wireless card exist.

Cc: stable <stable@vger.kernel.org> # 4.14+
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 73 +++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 726341f2b638..2e24ee42a3c6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -79,7 +79,7 @@
 #include <linux/jiffies.h>
 #include <linux/workqueue.h>
 #include <linux/acpi.h>
-#include <linux/pci_ids.h>
+#include <linux/pci.h>
 #include <linux/power_supply.h>
 #include <sound/core.h>
 #include <sound/control.h>
@@ -4501,11 +4501,80 @@ static void bluetooth_exit(void)
 	bluetooth_shutdown();
 }
 
+static const struct dmi_system_id bt_fwbug_list[] __initconst = {
+	{
+		.ident = "ThinkPad E485",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20KU"),
+		},
+	},
+	{
+		.ident = "ThinkPad E585",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20KV"),
+		},
+	},
+	{
+		.ident = "ThinkPad A285 - 20MW",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20MW"),
+		},
+	},
+	{
+		.ident = "ThinkPad A285 - 20MX",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20MX"),
+		},
+	},
+	{
+		.ident = "ThinkPad A485 - 20MU",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20MU"),
+		},
+	},
+	{
+		.ident = "ThinkPad A485 - 20MV",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20MV"),
+		},
+	},
+	{}
+};
+
+static const struct pci_device_id fwbug_cards_ids[] __initconst = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x2526) },
+	{}
+};
+
+
+static int __init have_bt_fwbug(void)
+{
+	/*
+	 * Some AMD based ThinkPads have a firmware bug that calling
+	 * "GBDC" will cause bluetooth on Intel wireless cards blocked
+	 */
+	if (dmi_check_system(bt_fwbug_list) && pci_dev_present(fwbug_cards_ids)) {
+		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
+			FW_BUG "disable bluetooth subdriver for Intel cards\n");
+		return 1;
+	} else
+		return 0;
+}
+
 static int __init bluetooth_init(struct ibm_init_struct *iibm)
 {
 	int res;
 	int status = 0;
 
+
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
 			"initializing bluetooth subdriver\n");
 
@@ -4513,7 +4582,7 @@ static int __init bluetooth_init(struct ibm_init_struct *iibm)
 
 	/* bluetooth not supported on 570, 600e/x, 770e, 770x, A21e, A2xm/p,
 	   G4x, R30, R31, R40e, R50e, T20-22, X20-21 */
-	tp_features.bluetooth = hkey_handle &&
+	tp_features.bluetooth = !have_bt_fwbug() && hkey_handle &&
 	    acpi_evalf(hkey_handle, &status, "GBDC", "qd");
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
-- 
2.20.1
