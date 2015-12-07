From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH V8 1/2] intel_pmc_ipc: update acpi resource structure for Punit
Date: Tue,  8 Dec 2015 00:55:04 +0800
Message-ID: <1449507305-51709-1-git-send-email-qipeng.zha@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:38845 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755084AbbLGIuh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Dec 2015 03:50:37 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org

BIOS restructure exported memory resources for Punit
in acpi table, So update resources for Punit.

Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 142 +++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 28b2a12..c699950 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -65,12 +65,16 @@
 #define IPC_TRIGGER_MODE_IRQ		true
 
 /* exported resources from IFWI */
-#define PLAT_RESOURCE_IPC_INDEX		0
-#define PLAT_RESOURCE_IPC_SIZE		0x1000
-#define PLAT_RESOURCE_GCR_SIZE		0x1000
-#define PLAT_RESOURCE_PUNIT_DATA_INDEX	1
-#define PLAT_RESOURCE_PUNIT_INTER_INDEX	2
-#define PLAT_RESOURCE_ACPI_IO_INDEX	0
+#define PLAT_RES_IPC_INDEX		0
+#define PLAT_RES_IPC_SIZE		0x1000
+#define PLAT_RES_GCR_SIZE		0x1000
+#define PLAT_RES_PUNIT_BIOS_DATA_INDEX	1
+#define PLAT_RES_PUNIT_BIOS_INTER_INDEX	2
+#define PLAT_RES_PUNIT_ISP_DATA_INDEX	4
+#define PLAT_RES_PUNIT_ISP_INTER_INDEX	5
+#define PLAT_RES_PUNIT_GTD_DATA_INDEX	6
+#define PLAT_RES_PUNIT_GTD_INTER_INDEX	7
+#define PLAT_RES_ACPI_IO_INDEX	0
 
 /*
  * BIOS does not create an ACPI device for each PMC function,
@@ -105,10 +109,6 @@ static struct intel_pmc_ipc_dev {
 	int gcr_size;
 
 	/* punit */
-	resource_size_t punit_base;
-	int punit_size;
-	resource_size_t punit_base2;
-	int punit_size2;
 	struct platform_device *punit_dev;
 } ipcdev;
 
@@ -444,9 +444,22 @@ static const struct attribute_group intel_ipc_group = {
 	.attrs = intel_ipc_attrs,
 };
 
-#define PUNIT_RESOURCE_INTER		1
-static struct resource punit_res[] = {
-	/* Punit */
+static struct resource punit_res_array[] = {
+	/* Punit BIOS */
+	{
+		.flags = IORESOURCE_MEM,
+	},
+	{
+		.flags = IORESOURCE_MEM,
+	},
+	/* Punit ISP */
+	{
+		.flags = IORESOURCE_MEM,
+	},
+	{
+		.flags = IORESOURCE_MEM,
+	},
+	/* Punit GTD */
 	{
 		.flags = IORESOURCE_MEM,
 	},
@@ -481,7 +494,6 @@ static struct itco_wdt_platform_data tco_info = {
 static int ipc_create_punit_device(void)
 {
 	struct platform_device *pdev;
-	struct resource *res;
 	int ret;
 
 	pdev = platform_device_alloc(PUNIT_DEVICE_NAME, -1);
@@ -491,17 +503,8 @@ static int ipc_create_punit_device(void)
 	}
 
 	pdev->dev.parent = ipcdev.dev;
-
-	res = punit_res;
-	res->start = ipcdev.punit_base;
-	res->end = res->start + ipcdev.punit_size - 1;
-
-	res = punit_res + PUNIT_RESOURCE_INTER;
-	res->start = ipcdev.punit_base2;
-	res->end = res->start + ipcdev.punit_size2 - 1;
-
-	ret = platform_device_add_resources(pdev, punit_res,
-					    ARRAY_SIZE(punit_res));
+	ret = platform_device_add_resources(pdev, punit_res_array,
+					    ARRAY_SIZE(punit_res_array));
 	if (ret) {
 		dev_err(ipcdev.dev, "Failed to add platform punit resources\n");
 		goto err;
@@ -590,12 +593,12 @@ static int ipc_create_pmc_devices(void)
 
 static int ipc_plat_get_res(struct platform_device *pdev)
 {
-	struct resource *res;
+	struct resource *res, *punit_res;
 	void __iomem *addr;
 	int size;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO,
-				    PLAT_RESOURCE_ACPI_IO_INDEX);
+				    PLAT_RES_ACPI_IO_INDEX);
 	if (!res) {
 		dev_err(&pdev->dev, "Failed to get io resource\n");
 		return -ENXIO;
@@ -606,37 +609,84 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	dev_info(&pdev->dev, "io res: %llx %x\n",
 		 (long long)res->start, (int)resource_size(res));
 
+	punit_res = punit_res_array;
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_PUNIT_DATA_INDEX);
+				    PLAT_RES_PUNIT_BIOS_DATA_INDEX);
 	if (!res) {
-		dev_err(&pdev->dev, "Failed to get punit resource\n");
+		dev_err(&pdev->dev, "Failed to get res of punit BIOS data\n");
 		return -ENXIO;
 	}
-	size = resource_size(res);
-	ipcdev.punit_base = res->start;
-	ipcdev.punit_size = size;
-	dev_info(&pdev->dev, "punit data res: %llx %x\n",
+	punit_res->start = res->start;
+	punit_res->end = res->start + resource_size(res) - 1;
+	dev_info(&pdev->dev, "punit BIOS data res: %llx %x\n",
 		 (long long)res->start, (int)resource_size(res));
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_PUNIT_INTER_INDEX);
+				    PLAT_RES_PUNIT_BIOS_INTER_INDEX);
 	if (!res) {
-		dev_err(&pdev->dev, "Failed to get punit inter resource\n");
+		dev_err(&pdev->dev, "Failed to get res of punit BIOS inter\n");
 		return -ENXIO;
 	}
-	size = resource_size(res);
-	ipcdev.punit_base2 = res->start;
-	ipcdev.punit_size2 = size;
-	dev_info(&pdev->dev, "punit interface res: %llx %x\n",
+	punit_res++;
+	punit_res->start = res->start;
+	punit_res->end = res->start + resource_size(res) - 1;
+	dev_info(&pdev->dev, "punit BIOS interface res: %llx %x\n",
+		 (long long)res->start, (int)resource_size(res));
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM,
+				    PLAT_RES_PUNIT_ISP_DATA_INDEX);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get res of punit ISP data\n");
+		return -ENXIO;
+	}
+	punit_res++;
+	punit_res->start = res->start;
+	punit_res->end = res->start + resource_size(res) - 1;
+	dev_info(&pdev->dev, "punit ISP data res: %llx %x\n",
 		 (long long)res->start, (int)resource_size(res));
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_IPC_INDEX);
+				    PLAT_RES_PUNIT_ISP_INTER_INDEX);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get res of punit ISP inter\n");
+		return -ENXIO;
+	}
+	punit_res++;
+	punit_res->start = res->start;
+	punit_res->end = res->start + resource_size(res) - 1;
+	dev_info(&pdev->dev, "punit ISP interface res: %llx %x\n",
+		 (long long)res->start, (int)resource_size(res));
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM,
+				    PLAT_RES_PUNIT_GTD_DATA_INDEX);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get res of punit GTD data\n");
+		return -ENXIO;
+	}
+	punit_res++;
+	punit_res->start = res->start;
+	punit_res->end = res->start + resource_size(res) - 1;
+	dev_info(&pdev->dev, "punit GTD data res: %llx %x\n",
+		 (long long)res->start, (int)resource_size(res));
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM,
+				    PLAT_RES_PUNIT_GTD_INTER_INDEX);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get res of punit GTD inter\n");
+		return -ENXIO;
+	}
+	punit_res++;
+	punit_res->start = res->start;
+	punit_res->end = res->start + resource_size(res) - 1;
+	dev_info(&pdev->dev, "punit GTD interface res: %llx %x\n",
+		 (long long)res->start, (int)resource_size(res));
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, PLAT_RES_IPC_INDEX);
 	if (!res) {
 		dev_err(&pdev->dev, "Failed to get ipc resource\n");
 		return -ENXIO;
 	}
-	size = PLAT_RESOURCE_IPC_SIZE;
+	size = PLAT_RES_IPC_SIZE;
 	if (!request_mem_region(res->start, size, pdev->name)) {
 		dev_err(&pdev->dev, "Failed to request ipc resource\n");
 		return -EBUSY;
@@ -650,7 +700,7 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	ipcdev.ipc_base = addr;
 
 	ipcdev.gcr_base = res->start + size;
-	ipcdev.gcr_size = PLAT_RESOURCE_GCR_SIZE;
+	ipcdev.gcr_size = PLAT_RES_GCR_SIZE;
 	dev_info(&pdev->dev, "ipc res: %llx %x\n",
 		 (long long)res->start, (int)resource_size(res));
 
@@ -714,9 +764,9 @@ err_irq:
 err_device:
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_IPC_INDEX);
+				    PLAT_RES_IPC_INDEX);
 	if (res)
-		release_mem_region(res->start, PLAT_RESOURCE_IPC_SIZE);
+		release_mem_region(res->start, PLAT_RES_IPC_SIZE);
 	return ret;
 }
 
@@ -730,9 +780,9 @@ static int ipc_plat_remove(struct platform_device *pdev)
 	platform_device_unregister(ipcdev.punit_dev);
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_IPC_INDEX);
+				    PLAT_RES_IPC_INDEX);
 	if (res)
-		release_mem_region(res->start, PLAT_RESOURCE_IPC_SIZE);
+		release_mem_region(res->start, PLAT_RES_IPC_SIZE);
 	ipcdev.dev = NULL;
 	return 0;
 }
-- 
1.8.3.2
