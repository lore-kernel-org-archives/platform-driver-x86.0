From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some machines
Date: Thu,  7 Mar 2019 16:08:20 +0800
Message-ID: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br
Cc: dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: platform-driver-x86.vger.kernel.org

Some AMD based ThinkPads have a firmware bug that calling
"GBDC" will cause bluetooth on Intel wireless cards blocked.

Probe these models by DMI match and disable bluetooth subdriver
if specified Intel wireless card exist.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 70 ++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 726341f2b638..29e835f9368a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -79,6 +79,7 @@
 #include <linux/jiffies.h>
 #include <linux/workqueue.h>
 #include <linux/acpi.h>
+#include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/power_supply.h>
 #include <sound/core.h>
@@ -4501,11 +4502,80 @@ static void bluetooth_exit(void)
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
+static int __init have_bt_fwbug(void)
+{
+	/* Some AMD based ThinkPads have a firmware bug that calling
+	 * "GBDC" will cause bluetooth on Intel wireless cards blocked
+	 */
+	if (dmi_check_system(bt_fwbug_list)) {
+		if (pci_get_device(PCI_VENDOR_ID_INTEL, 0x24F3, NULL) || \
+		    pci_get_device(PCI_VENDOR_ID_INTEL, 0x24FD, NULL) || \
+		    pci_get_device(PCI_VENDOR_ID_INTEL, 0x2526, NULL))
+			return 1;
+		else
+			return 0;
+	} else {
+			return 0;
+	}
+}
+
 static int __init bluetooth_init(struct ibm_init_struct *iibm)
 {
 	int res;
 	int status = 0;
 
+	if (have_bt_fwbug()) {
+		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
+			FW_BUG "disable bluetooth subdriver for Intel cards\n");
+		return 1;
+	}
+
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
 			"initializing bluetooth subdriver\n");
 
-- 
2.20.1
