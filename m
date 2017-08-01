From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v1 3/6] platform/x86: intel_pmc_ipc: Use MFD framework to create dependent devices
Date: Tue,  1 Aug 2017 11:13:51 -0700
Message-ID: <0699a0a5114ae563e6d51ab9352de591779452a4.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Currently, we have lot of repetitive code in dependent device resource
allocation and device creation handling code. This logic can be improved if
we use MFD framework for dependent device creation. This patch adds this
support.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 376 +++++++++++++----------------------
 1 file changed, 141 insertions(+), 235 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index ad0416e..43533ec 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -33,6 +33,7 @@
 #include <linux/suspend.h>
 #include <linux/acpi.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/mfd/core.h>
 
 #include <asm/intel_pmc_ipc.h>
 
@@ -105,8 +106,6 @@
 #define TELEM_SSRAM_SIZE		240
 #define TELEM_PMC_SSRAM_OFFSET		0x1B00
 #define TELEM_PUNIT_SSRAM_OFFSET	0x1A00
-#define TCO_PMC_OFFSET			0x8
-#define TCO_PMC_SIZE			0x4
 
 /* PMC register bit definitions */
 
@@ -115,6 +114,13 @@
 #define PMC_CFG_NO_REBOOT_EN		(1 << 4)
 #define PMC_CFG_NO_REBOOT_DIS		(0 << 4)
 
+enum {
+	PMC_IPC_PUNIT_MFD_BLOCK,
+	PMC_IPC_WATCHDOG_MFD_BLOCK,
+	PMC_IPC_TELEMETRY_MFD_BLOCK,
+	PMC_IPC_MAX_MFD_BLOCK
+};
+
 static struct intel_pmc_ipc_dev {
 	struct device *dev;
 	void __iomem *ipc_base;
@@ -123,25 +129,12 @@ static struct intel_pmc_ipc_dev {
 	int cmd;
 	struct completion cmd_complete;
 
-	/* The following PMC BARs share the same ACPI device with the IPC */
-	resource_size_t acpi_io_base;
-	int acpi_io_size;
-	struct platform_device *tco_dev;
-
 	/* gcr */
 	void __iomem *gcr_mem_base;
 	bool has_gcr_regs;
 
-	/* punit */
-	struct platform_device *punit_dev;
-
 	/* Telemetry */
-	resource_size_t telem_pmc_ssram_base;
-	resource_size_t telem_punit_ssram_base;
-	int telem_pmc_ssram_size;
-	int telem_punit_ssram_size;
 	u8 telem_res_inval;
-	struct platform_device *telemetry_dev;
 } ipcdev;
 
 static char *ipc_err_sources[] = {
@@ -613,7 +606,7 @@ static const struct attribute_group intel_ipc_group = {
 	.attrs = intel_ipc_attrs,
 };
 
-static struct resource punit_res_array[] = {
+static struct resource punit_ipc_resources[] = {
 	/* Punit BIOS */
 	{
 		.flags = IORESOURCE_MEM,
@@ -637,10 +630,7 @@ static struct resource punit_res_array[] = {
 	},
 };
 
-#define TCO_RESOURCE_ACPI_IO		0
-#define TCO_RESOURCE_SMI_EN_IO		1
-#define TCO_RESOURCE_GCR_MEM		2
-static struct resource tco_res[] = {
+static struct resource watchdog_ipc_resources[] = {
 	/* ACPI - TCO */
 	{
 		.flags = IORESOURCE_IO,
@@ -658,9 +648,7 @@ static struct itco_wdt_platform_data tco_info = {
 	.update_no_reboot_bit = update_no_reboot_bit,
 };
 
-#define TELEMETRY_RESOURCE_PUNIT_SSRAM	0
-#define TELEMETRY_RESOURCE_PMC_SSRAM	1
-static struct resource telemetry_res[] = {
+static struct resource telemetry_ipc_resources[] = {
 	/*Telemetry*/
 	{
 		.flags = IORESOURCE_MEM,
@@ -670,224 +658,152 @@ static struct resource telemetry_res[] = {
 	},
 };
 
-static int ipc_create_punit_device(void)
-{
-	struct platform_device *pdev;
-	const struct platform_device_info pdevinfo = {
-		.parent = ipcdev.dev,
-		.name = PUNIT_DEVICE_NAME,
-		.id = -1,
-		.res = punit_res_array,
-		.num_res = ARRAY_SIZE(punit_res_array),
-		};
-
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	ipcdev.punit_dev = pdev;
-
-	return 0;
-}
-
-static int ipc_create_tco_device(void)
-{
-	struct platform_device *pdev;
-	struct resource *res;
-	const struct platform_device_info pdevinfo = {
-		.parent = ipcdev.dev,
-		.name = TCO_DEVICE_NAME,
-		.id = -1,
-		.res = tco_res,
-		.num_res = ARRAY_SIZE(tco_res),
-		.data = &tco_info,
-		.size_data = sizeof(tco_info),
-		};
-
-	res = tco_res + TCO_RESOURCE_ACPI_IO;
-	res->start = ipcdev.acpi_io_base + TCO_BASE_OFFSET;
-	res->end = res->start + TCO_REGS_SIZE - 1;
-
-	res = tco_res + TCO_RESOURCE_SMI_EN_IO;
-	res->start = ipcdev.acpi_io_base + SMI_EN_OFFSET;
-	res->end = res->start + SMI_EN_SIZE - 1;
-
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	ipcdev.tco_dev = pdev;
-
-	return 0;
-}
-
-static int ipc_create_telemetry_device(void)
-{
-	struct platform_device *pdev;
-	struct resource *res;
-	const struct platform_device_info pdevinfo = {
-		.parent = ipcdev.dev,
-		.name = TELEMETRY_DEVICE_NAME,
-		.id = -1,
-		.res = telemetry_res,
-		.num_res = ARRAY_SIZE(telemetry_res),
-		};
-
-	res = telemetry_res + TELEMETRY_RESOURCE_PUNIT_SSRAM;
-	res->start = ipcdev.telem_punit_ssram_base;
-	res->end = res->start + ipcdev.telem_punit_ssram_size - 1;
-
-	res = telemetry_res + TELEMETRY_RESOURCE_PMC_SSRAM;
-	res->start = ipcdev.telem_pmc_ssram_base;
-	res->end = res->start + ipcdev.telem_pmc_ssram_size - 1;
-
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	ipcdev.telemetry_dev = pdev;
-
-	return 0;
-}
-
-static int ipc_create_pmc_devices(void)
+static int ipc_create_pmc_devices(struct platform_device *pdev)
 {
-	int ret;
-
-	/* If we have ACPI based watchdog use that instead */
+	u8 n = 0;
+	struct mfd_cell *pmc_mfd_cells;
+
+	pmc_mfd_cells = devm_kzalloc(&pdev->dev,
+			(sizeof(*pmc_mfd_cells) * PMC_IPC_MAX_MFD_BLOCK),
+			GFP_KERNEL);
+	if (!pmc_mfd_cells)
+		return -ENOMEM;
+
+	/* Create PUNIT IPC MFD cell */
+	pmc_mfd_cells[n].name = PUNIT_DEVICE_NAME;
+	pmc_mfd_cells[n].id = -1;
+	pmc_mfd_cells[n].num_resources = ARRAY_SIZE(punit_ipc_resources);
+	pmc_mfd_cells[n].resources = punit_ipc_resources;
+	pmc_mfd_cells[n].ignore_resource_conflicts = 1;
+	n++;
+
+	/* If we have ACPI based watchdog use that instead, othewise create
+	 * a MFD cell for iTCO watchdog*/
 	if (!acpi_has_watchdog()) {
-		ret = ipc_create_tco_device();
-		if (ret) {
-			dev_err(ipcdev.dev, "Failed to add tco platform device\n");
-			return ret;
-		}
-	}
-
-	ret = ipc_create_punit_device();
-	if (ret) {
-		dev_err(ipcdev.dev, "Failed to add punit platform device\n");
-		platform_device_unregister(ipcdev.tco_dev);
+		pmc_mfd_cells[n].name = TCO_DEVICE_NAME;
+		pmc_mfd_cells[n].id = -1;
+		pmc_mfd_cells[n].platform_data = &tco_info;
+		pmc_mfd_cells[n].pdata_size = sizeof(tco_info);
+		pmc_mfd_cells[n].num_resources =
+			ARRAY_SIZE(watchdog_ipc_resources);
+		pmc_mfd_cells[n].resources = watchdog_ipc_resources;
+		pmc_mfd_cells[n].ignore_resource_conflicts = 1;
+		n++;
 	}
 
 	if (!ipcdev.telem_res_inval) {
-		ret = ipc_create_telemetry_device();
-		if (ret)
-			dev_warn(ipcdev.dev,
-				"Failed to add telemetry platform device\n");
+		pmc_mfd_cells[n].name = TELEMETRY_DEVICE_NAME;
+		pmc_mfd_cells[n].id = -1;
+		pmc_mfd_cells[n].num_resources =
+			ARRAY_SIZE(telemetry_ipc_resources);
+		pmc_mfd_cells[n].resources = telemetry_ipc_resources;
+		pmc_mfd_cells[n].ignore_resource_conflicts = 1;
+		n++;
 	}
 
-	return ret;
+	return devm_mfd_add_devices(&pdev->dev, -1, pmc_mfd_cells, n, NULL,
+				    0, NULL);
 }
 
 static int ipc_plat_get_res(struct platform_device *pdev)
 {
-	struct resource *res, *punit_res;
+	struct resource *res;
 	void __iomem *addr;
-	int size;
+	int mindex, pindex = 0;
 
+	/* Get iTCO watchdog resources */
 	res = platform_get_resource(pdev, IORESOURCE_IO,
 				    PLAT_RESOURCE_ACPI_IO_INDEX);
 	if (!res) {
 		dev_err(&pdev->dev, "Failed to get io resource\n");
 		return -ENXIO;
 	}
-	size = resource_size(res);
-	ipcdev.acpi_io_base = res->start;
-	ipcdev.acpi_io_size = size;
-	dev_info(&pdev->dev, "io res: %pR\n", res);
-
-	punit_res = punit_res_array;
-	/* This is index 0 to cover BIOS data register */
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_BIOS_DATA_INDEX);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get res of punit BIOS data\n");
-		return -ENXIO;
-	}
-	*punit_res = *res;
-	dev_info(&pdev->dev, "punit BIOS data res: %pR\n", res);
-
-	/* This is index 1 to cover BIOS interface register */
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_BIOS_IFACE_INDEX);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get res of punit BIOS iface\n");
-		return -ENXIO;
-	}
-	*++punit_res = *res;
-	dev_info(&pdev->dev, "punit BIOS interface res: %pR\n", res);
-
-	/* This is index 2 to cover ISP data register, optional */
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_ISP_DATA_INDEX);
-	++punit_res;
-	if (res) {
-		*punit_res = *res;
-		dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
-	}
 
-	/* This is index 3 to cover ISP interface register, optional */
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_ISP_IFACE_INDEX);
-	++punit_res;
-	if (res) {
-		*punit_res = *res;
-		dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res);
-	}
-
-	/* This is index 4 to cover GTD data register, optional */
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_GTD_DATA_INDEX);
-	++punit_res;
-	if (res) {
-		*punit_res = *res;
-		dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
-	}
-
-	/* This is index 5 to cover GTD interface register, optional */
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_GTD_IFACE_INDEX);
-	++punit_res;
-	if (res) {
-		*punit_res = *res;
-		dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res);
-	}
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_IPC_INDEX);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get ipc resource\n");
-		return -ENXIO;
-	}
-	res->end = (res->start + PLAT_RESOURCE_IPC_SIZE +
-		    PLAT_RESOURCE_GCR_SIZE - 1);
-
-	addr = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(addr)) {
-		dev_err(&pdev->dev,
-			"PMC I/O memory remapping failed\n");
-		return PTR_ERR(addr);
-	}
-
-	ipcdev.ipc_base = addr;
-
-	ipcdev.gcr_mem_base = addr + PLAT_RESOURCE_GCR_OFFSET;
-	dev_info(&pdev->dev, "ipc res: %pR\n", res);
-
-	ipcdev.telem_res_inval = 0;
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_TELEM_SSRAM_INDEX);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get telemetry ssram resource\n");
-		ipcdev.telem_res_inval = 1;
-	} else {
-		ipcdev.telem_punit_ssram_base = res->start +
-						TELEM_PUNIT_SSRAM_OFFSET;
-		ipcdev.telem_punit_ssram_size = TELEM_SSRAM_SIZE;
-		ipcdev.telem_pmc_ssram_base = res->start +
-						TELEM_PMC_SSRAM_OFFSET;
-		ipcdev.telem_pmc_ssram_size = TELEM_SSRAM_SIZE;
-		dev_info(&pdev->dev, "telemetry ssram res: %pR\n", res);
+	watchdog_ipc_resources[0].start = res->start + TCO_BASE_OFFSET;
+	watchdog_ipc_resources[0].end = res->start +
+		TCO_BASE_OFFSET + TCO_REGS_SIZE - 1;
+	watchdog_ipc_resources[1].start = res->start + SMI_EN_OFFSET;
+	watchdog_ipc_resources[1].end = res->start +
+		SMI_EN_OFFSET + SMI_EN_SIZE - 1;
+
+	dev_info(&pdev->dev, "watchdog res 0: %pR\n",
+			&watchdog_ipc_resources[0]);
+	dev_info(&pdev->dev, "watchdog res 1: %pR\n",
+			&watchdog_ipc_resources[1]);
+
+	for (mindex = 0; mindex <= PLAT_RESOURCE_GTD_IFACE_INDEX; mindex++) {
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, mindex);
+
+		switch (mindex) {
+		/* Get PUNIT resources */
+		case PLAT_RESOURCE_BIOS_DATA_INDEX:
+		case PLAT_RESOURCE_BIOS_IFACE_INDEX:
+			/* BIOS resources are required, so return error if not
+			 * available */
+			if (!res) {
+				dev_err(&pdev->dev,
+					"Failed to get punit mem resource %d\n",
+					pindex);
+				return -ENXIO;
+			}
+		case PLAT_RESOURCE_ISP_DATA_INDEX:
+		case PLAT_RESOURCE_ISP_IFACE_INDEX:
+		case PLAT_RESOURCE_GTD_DATA_INDEX:
+		case PLAT_RESOURCE_GTD_IFACE_INDEX:
+			/* if not valid resource, skip the rest of steps */
+			if (!res) {
+				pindex++;
+				continue;
+			}
+			memcpy(&punit_ipc_resources[pindex], res,
+					sizeof(*res));
+			dev_info(&pdev->dev, "PUNIT memory res: %pR\n",
+					&punit_ipc_resources[pindex]);
+			pindex++;
+			break;
+		/* Get Telemetry resources */
+		case PLAT_RESOURCE_TELEM_SSRAM_INDEX:
+			if (!res) {
+				dev_warn(&pdev->dev,
+					"Failed to get telemtry sram res\n");
+				ipcdev.telem_res_inval = 1;
+				continue;
+			}
+			telemetry_ipc_resources[0].start = res->start +
+				TELEM_PUNIT_SSRAM_OFFSET;
+			telemetry_ipc_resources[0].end = res->start +
+				TELEM_PUNIT_SSRAM_OFFSET + TELEM_SSRAM_SIZE - 1;
+			telemetry_ipc_resources[1].start = res->start +
+				TELEM_PMC_SSRAM_OFFSET;
+			telemetry_ipc_resources[1].end = res->start +
+				TELEM_PMC_SSRAM_OFFSET + TELEM_SSRAM_SIZE - 1;
+
+			dev_info(&pdev->dev, "telemetry punit ssram res: %pR\n",
+					&telemetry_ipc_resources[0]);
+			dev_info(&pdev->dev, "telemetry pmc ssram res: %pR\n",
+					&telemetry_ipc_resources[1]);
+			break;
+		/* Get IPC resources */
+		case PLAT_RESOURCE_IPC_INDEX:
+			if (!res) {
+				dev_err(&pdev->dev,
+					"Failed to get IPC resources\n");
+				return -ENXIO;
+			}
+			res->end = (res->start + PLAT_RESOURCE_IPC_SIZE +
+				    PLAT_RESOURCE_GCR_SIZE - 1);
+			addr = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(addr)) {
+				dev_err(&pdev->dev,
+					"PMC I/O memory remapping failed\n");
+				return PTR_ERR(addr);
+			}
+			ipcdev.ipc_base = addr;
+			ipcdev.gcr_mem_base = addr + PLAT_RESOURCE_GCR_OFFSET;
+			dev_info(&pdev->dev, "PMC IPC resource %pR\n", res);
+			break;
+		};
 	}
 
 	return 0;
@@ -943,7 +859,7 @@ static int ipc_plat_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = ipc_create_pmc_devices();
+	ret = ipc_create_pmc_devices(pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to create pmc devices\n");
 		return ret;
@@ -952,36 +868,26 @@ static int ipc_plat_probe(struct platform_device *pdev)
 	if (devm_request_irq(&pdev->dev, ipcdev.irq, ioc, IRQF_NO_SUSPEND,
 			     "intel_pmc_ipc", &ipcdev)) {
 		dev_err(&pdev->dev, "Failed to request irq\n");
-		ret = -EBUSY;
-		goto unregister_devices;
+		return -EBUSY;
 	}
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &intel_ipc_group);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
 			ret);
-		goto unregister_devices;
+		return ret;
 	}
 
 	ipcdev.has_gcr_regs = true;
 
 	return 0;
-
-unregister_devices:
-	platform_device_unregister(ipcdev.tco_dev);
-	platform_device_unregister(ipcdev.punit_dev);
-	platform_device_unregister(ipcdev.telemetry_dev);
-
-	return ret;
 }
 
 static int ipc_plat_remove(struct platform_device *pdev)
 {
 	sysfs_remove_group(&pdev->dev.kobj, &intel_ipc_group);
-	platform_device_unregister(ipcdev.tco_dev);
-	platform_device_unregister(ipcdev.punit_dev);
-	platform_device_unregister(ipcdev.telemetry_dev);
 	ipcdev.dev = NULL;
+
 	return 0;
 }
 
-- 
2.7.4
