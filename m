From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 4/6] platform/x86: intel_pmc_core: Change driver to a module
Date: Thu, 11 Jan 2018 16:40:34 +0530
Message-ID: <1515669036-3465-5-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Allow the driver to be a module since builtin_pci_driver funtionality is no
longer needed.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/Kconfig          |  2 +-
 drivers/platform/x86/intel_pmc_core.c | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2c745e8ccad6..683a875f3b6c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -949,7 +949,7 @@ config INTEL_IMR
 	  If you are running on a Galileo/Quark say Y here.
 
 config INTEL_PMC_CORE
-	bool "Intel PMC Core driver"
+	tristate "Intel PMC Core driver"
 	depends on PCI
 	---help---
 	  The Intel Platform Controller Hub for Intel Core SoCs provides access
diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 00748472a55e..44353034718a 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -21,8 +21,8 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/init.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/uaccess.h>
 
@@ -124,6 +124,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 					(kernel_ulong_t)&spt_reg_map },
 	{ 0, },
 };
+MODULE_DEVICE_TABLE(pci, pmc_pci_ids);
 
 static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
 {
@@ -520,10 +521,20 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	return 0;
 }
 
+static void pmc_core_remove(struct pci_dev *dev)
+{
+	pmc_core_dbgfs_unregister(&pmc);
+	mutex_destroy(&pmc.lock);
+}
+
 static struct pci_driver intel_pmc_core_driver = {
 	.name = "intel_pmc_core",
 	.id_table = pmc_pci_ids,
 	.probe = pmc_core_probe,
+	.remove = pmc_core_remove,
 };
 
-builtin_pci_driver(intel_pmc_core_driver);
+module_pci_driver(intel_pmc_core_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel PMC Core Driver");
-- 
2.7.4
