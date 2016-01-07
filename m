From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v4 3/5] platform:x86: Add Intel telemetry platform device
Date: Thu,  7 Jan 2016 14:36:56 +0530
Message-ID: <1452157616-10702-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:24384 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751864AbcAGJBM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jan 2016 04:01:12 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com, david.ginat@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Telemetry Device is created by the pmc_ipc driver. Resources
are populated according SSRAM region as indicated by the BIOS tables.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c |   96 ++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index ca69135..092519e 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -70,6 +70,7 @@
 #define PLAT_RESOURCE_GCR_SIZE		0x1000
 #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
 #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
+#define PLAT_RESOURCE_TELEM_SSRAM_INDEX	3
 #define PLAT_RESOURCE_ISP_DATA_INDEX	4
 #define PLAT_RESOURCE_ISP_IFACE_INDEX	5
 #define PLAT_RESOURCE_GTD_DATA_INDEX	6
@@ -88,6 +89,10 @@
 #define TCO_BASE_OFFSET			0x60
 #define TCO_REGS_SIZE			16
 #define PUNIT_DEVICE_NAME		"intel_punit_ipc"
+#define TELEMETRY_DEVICE_NAME		"intel_telemetry"
+#define TELEM_SSRAM_SIZE		240
+#define TELEM_PMC_SSRAM_OFFSET		0x1B00
+#define TELEM_PUNIT_SSRAM_OFFSET	0x1A00
 
 static const int iTCO_version = 3;
 
@@ -110,6 +115,14 @@ static struct intel_pmc_ipc_dev {
 
 	/* punit */
 	struct platform_device *punit_dev;
+
+	/* Telemetry */
+	resource_size_t telem_pmc_ssram_base;
+	resource_size_t telem_punit_ssram_base;
+	int telem_pmc_ssram_size;
+	int telem_punit_ssram_size;
+	u8 telem_res_inval;
+	struct platform_device *telemetry_dev;
 } ipcdev;
 
 static char *ipc_err_sources[] = {
@@ -491,6 +504,18 @@ static struct itco_wdt_platform_data tco_info = {
 	.version = 3,
 };
 
+#define TELEMETRY_RESOURCE_PUNIT_SSRAM	0
+#define TELEMETRY_RESOURCE_PMC_SSRAM	1
+static struct resource telemetry_res[] = {
+	/*Telemetry*/
+	{
+		.flags = IORESOURCE_MEM,
+	},
+	{
+		.flags = IORESOURCE_MEM,
+	},
+};
+
 static int ipc_create_punit_device(void)
 {
 	struct platform_device *pdev;
@@ -574,6 +599,51 @@ err:
 	return ret;
 }
 
+static int ipc_create_telemetry_device(void)
+{
+	struct platform_device *pdev;
+	struct resource *res;
+	int ret;
+
+	pdev = platform_device_alloc(TELEMETRY_DEVICE_NAME, -1);
+	if (!pdev) {
+		dev_err(ipcdev.dev,
+			"Failed to allocate telemetry platform device\n");
+		return -ENOMEM;
+	}
+
+	pdev->dev.parent = ipcdev.dev;
+
+	res = telemetry_res + TELEMETRY_RESOURCE_PUNIT_SSRAM;
+	res->start = ipcdev.telem_punit_ssram_base;
+	res->end = res->start + ipcdev.telem_punit_ssram_size - 1;
+
+	res = telemetry_res + TELEMETRY_RESOURCE_PMC_SSRAM;
+	res->start = ipcdev.telem_pmc_ssram_base;
+	res->end = res->start + ipcdev.telem_pmc_ssram_size - 1;
+
+	ret = platform_device_add_resources(pdev, telemetry_res,
+					    ARRAY_SIZE(telemetry_res));
+	if (ret) {
+		dev_err(ipcdev.dev,
+			"Failed to add telemetry platform resources\n");
+		goto err;
+	}
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		dev_err(ipcdev.dev,
+			"Failed to add telemetry platform device\n");
+		goto err;
+	}
+	ipcdev.telemetry_dev = pdev;
+
+	return 0;
+err:
+	platform_device_put(pdev);
+	return ret;
+}
+
 static int ipc_create_pmc_devices(void)
 {
 	int ret;
@@ -588,6 +658,14 @@ static int ipc_create_pmc_devices(void)
 		dev_err(ipcdev.dev, "Failed to add punit platform device\n");
 		platform_device_unregister(ipcdev.tco_dev);
 	}
+
+	if (!ipcdev.telem_res_inval) {
+		ret = ipc_create_telemetry_device();
+		if (ret)
+			dev_warn(ipcdev.dev,
+				"Failed to add telemetry platform device\n");
+	}
+
 	return ret;
 }
 
@@ -692,6 +770,22 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	ipcdev.gcr_size = PLAT_RESOURCE_GCR_SIZE;
 	dev_info(&pdev->dev, "ipc res: %pR\n", res);
 
+	ipcdev.telem_res_inval = 0;
+	res = platform_get_resource(pdev, IORESOURCE_MEM,
+				    PLAT_RESOURCE_TELEM_SSRAM_INDEX);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get telemetry ssram resource\n");
+		ipcdev.telem_res_inval = 1;
+	} else {
+		ipcdev.telem_punit_ssram_base = res->start +
+						TELEM_PUNIT_SSRAM_OFFSET;
+		ipcdev.telem_punit_ssram_size = TELEM_SSRAM_SIZE;
+		ipcdev.telem_pmc_ssram_base = res->start +
+						TELEM_PMC_SSRAM_OFFSET;
+		ipcdev.telem_pmc_ssram_size = TELEM_SSRAM_SIZE;
+		dev_info(&pdev->dev, "telemetry ssram res: %pR\n", res);
+	}
+
 	return 0;
 }
 
@@ -749,6 +843,7 @@ err_sys:
 err_irq:
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
+	platform_device_unregister(ipcdev.telemetry_dev);
 err_device:
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
@@ -766,6 +861,7 @@ static int ipc_plat_remove(struct platform_device *pdev)
 	free_irq(ipcdev.irq, &ipcdev);
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
+	platform_device_unregister(ipcdev.telemetry_dev);
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_IPC_INDEX);
-- 
1.7.9.5
