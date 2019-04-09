From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] platform/x86: intel_pmc_ipc: Don't map non-used optional resources
Date: Tue,  9 Apr 2019 14:25:14 +0300
Message-ID: <20190409112515.84725-3-andriy.shevchenko@linux.intel.com>
References: <20190409112515.84725-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409112515.84725-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, junxiao.chang@intel.com, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The intel_pmc_ipc driver has a placeholder for all possible resources
that may have been provided by ACPI. Since there are few optional ones,
the driver still uses them and binds to wrong ranges in resource tree:

  # grep intel_punit_ipc /proc/iomem
  00000000-00000000 : intel_punit_ipc
    00000000-00000000 : intel_punit_ipc
      00000000-00000000 : intel_punit_ipc
        00000000-00000000 : intel_punit_ipc

This leads to issues with resource management during inserting and
removing modules, such as intel_pmc_ipc itself, which can't be inserted
anymore after first removal.

Count the actual resources provided and supply only them to the child device.

This is a real fix of the commit 8cc7fb4a6523

  ("intel_pmc_ipc: update acpi resource structure for Punit")

that also fixes a symptoms described in the commit 6cc8cbbc8868

  ("platform/x86: intel_punit_ipc: Fix resource ioremap warning")

that is going to be reverted afterwards.

Reported-by: Junxiao Chang <junxiao.chang@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 9007aa717586..55037ff258f8 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -131,6 +131,7 @@ static struct intel_pmc_ipc_dev {
 
 	/* punit */
 	struct platform_device *punit_dev;
+	unsigned int punit_res_count;
 
 	/* Telemetry */
 	resource_size_t telem_pmc_ssram_base;
@@ -682,7 +683,7 @@ static int ipc_create_punit_device(void)
 		.name = PUNIT_DEVICE_NAME,
 		.id = -1,
 		.res = punit_res_array,
-		.num_res = ARRAY_SIZE(punit_res_array),
+		.num_res = ipcdev.punit_res_count,
 		};
 
 	pdev = platform_device_register_full(&pdevinfo);
@@ -789,7 +790,7 @@ static int ipc_create_pmc_devices(void)
 
 static int ipc_plat_get_res(struct platform_device *pdev)
 {
-	struct resource *res, *punit_res;
+	struct resource *res, *punit_res = punit_res_array;
 	void __iomem *addr;
 	int size;
 
@@ -804,7 +805,8 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	ipcdev.acpi_io_size = size;
 	dev_info(&pdev->dev, "io res: %pR\n", res);
 
-	punit_res = punit_res_array;
+	ipcdev.punit_res_count = 0;
+
 	/* This is index 0 to cover BIOS data register */
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_BIOS_DATA_INDEX);
@@ -812,7 +814,7 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to get res of punit BIOS data\n");
 		return -ENXIO;
 	}
-	*punit_res = *res;
+	punit_res[ipcdev.punit_res_count++] = *res;
 	dev_info(&pdev->dev, "punit BIOS data res: %pR\n", res);
 
 	/* This is index 1 to cover BIOS interface register */
@@ -822,42 +824,38 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to get res of punit BIOS iface\n");
 		return -ENXIO;
 	}
-	*++punit_res = *res;
+	punit_res[ipcdev.punit_res_count++] = *res;
 	dev_info(&pdev->dev, "punit BIOS interface res: %pR\n", res);
 
 	/* This is index 2 to cover ISP data register, optional */
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_ISP_DATA_INDEX);
-	++punit_res;
 	if (res) {
-		*punit_res = *res;
+		punit_res[ipcdev.punit_res_count++] = *res;
 		dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
 	}
 
 	/* This is index 3 to cover ISP interface register, optional */
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_ISP_IFACE_INDEX);
-	++punit_res;
 	if (res) {
-		*punit_res = *res;
+		punit_res[ipcdev.punit_res_count++] = *res;
 		dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res);
 	}
 
 	/* This is index 4 to cover GTD data register, optional */
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_GTD_DATA_INDEX);
-	++punit_res;
 	if (res) {
-		*punit_res = *res;
+		punit_res[ipcdev.punit_res_count++] = *res;
 		dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
 	}
 
 	/* This is index 5 to cover GTD interface register, optional */
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_GTD_IFACE_INDEX);
-	++punit_res;
 	if (res) {
-		*punit_res = *res;
+		punit_res[ipcdev.punit_res_count++] = *res;
 		dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res);
 	}
 
-- 
2.20.1
