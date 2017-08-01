From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v1 2/6] platform/x86: intel_pmc_ipc: Use devm_* calls in driver probe
Date: Tue,  1 Aug 2017 11:13:50 -0700
Message-ID: <5147288461b861d1b956e1adc3f1d61192086c34.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:62188 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751049AbdHASOQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 14:14:16 -0400
In-Reply-To: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

This patch cleans up unnecessary free/alloc calls in this driver
by using devm_* calls.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 68 +++++++++++-------------------------
 1 file changed, 21 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 7b65237..ad0416e 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -505,23 +505,22 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	init_completion(&ipcdev.cmd_complete);
 
-	if (request_irq(pdev->irq, ioc, 0, "intel_pmc_ipc", &ipcdev)) {
+	if (devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_pmc_ipc",
+				&ipcdev)) {
 		dev_err(&pdev->dev, "Failed to request irq\n");
 		ret = -EBUSY;
 		goto free_pci_resources;
 	}
 
-	ipcdev.ipc_base = ioremap_nocache(pci_resource, len);
+	ipcdev.ipc_base = devm_ioremap_nocache(&pdev->dev, pci_resource, len);
 	if (!ipcdev.ipc_base) {
 		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
 		ret = -ENOMEM;
-		goto free_irq;
+		goto free_pci_resources;
 	}
 
 	return 0;
 
-free_irq:
-	free_irq(pdev->irq, &ipcdev);
 free_pci_resources:
 	pci_release_regions(pdev);
 disable_device:
@@ -534,10 +533,8 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 static void ipc_pci_remove(struct pci_dev *pdev)
 {
-	free_irq(pdev->irq, &ipcdev);
 	pci_release_regions(pdev);
 	pci_dev_put(pdev);
-	iounmap(ipcdev.ipc_base);
 	ipcdev.dev = NULL;
 }
 
@@ -862,18 +859,16 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to get ipc resource\n");
 		return -ENXIO;
 	}
-	size = PLAT_RESOURCE_IPC_SIZE + PLAT_RESOURCE_GCR_SIZE;
-
-	if (!request_mem_region(res->start, size, pdev->name)) {
-		dev_err(&pdev->dev, "Failed to request ipc resource\n");
-		return -EBUSY;
-	}
-	addr = ioremap_nocache(res->start, size);
-	if (!addr) {
-		dev_err(&pdev->dev, "I/O memory remapping failed\n");
-		release_mem_region(res->start, size);
-		return -ENOMEM;
+	res->end = (res->start + PLAT_RESOURCE_IPC_SIZE +
+		    PLAT_RESOURCE_GCR_SIZE - 1);
+
+	addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(addr)) {
+		dev_err(&pdev->dev,
+			"PMC I/O memory remapping failed\n");
+		return PTR_ERR(addr);
 	}
+
 	ipcdev.ipc_base = addr;
 
 	ipcdev.gcr_mem_base = addr + PLAT_RESOURCE_GCR_OFFSET;
@@ -930,7 +925,6 @@ MODULE_DEVICE_TABLE(acpi, ipc_acpi_ids);
 
 static int ipc_plat_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	int ret;
 
 	ipcdev.dev = &pdev->dev;
@@ -952,61 +946,41 @@ static int ipc_plat_probe(struct platform_device *pdev)
 	ret = ipc_create_pmc_devices();
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to create pmc devices\n");
-		goto err_device;
+		return ret;
 	}
 
-	if (request_irq(ipcdev.irq, ioc, IRQF_NO_SUSPEND,
-			"intel_pmc_ipc", &ipcdev)) {
+	if (devm_request_irq(&pdev->dev, ipcdev.irq, ioc, IRQF_NO_SUSPEND,
+			     "intel_pmc_ipc", &ipcdev)) {
 		dev_err(&pdev->dev, "Failed to request irq\n");
 		ret = -EBUSY;
-		goto err_irq;
+		goto unregister_devices;
 	}
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &intel_ipc_group);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
 			ret);
-		goto err_sys;
+		goto unregister_devices;
 	}
 
 	ipcdev.has_gcr_regs = true;
 
 	return 0;
-err_sys:
-	free_irq(ipcdev.irq, &ipcdev);
-err_irq:
+
+unregister_devices:
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
 	platform_device_unregister(ipcdev.telemetry_dev);
-err_device:
-	iounmap(ipcdev.ipc_base);
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_IPC_INDEX);
-	if (res) {
-		release_mem_region(res->start,
-				   PLAT_RESOURCE_IPC_SIZE +
-				   PLAT_RESOURCE_GCR_SIZE);
-	}
+
 	return ret;
 }
 
 static int ipc_plat_remove(struct platform_device *pdev)
 {
-	struct resource *res;
-
 	sysfs_remove_group(&pdev->dev.kobj, &intel_ipc_group);
-	free_irq(ipcdev.irq, &ipcdev);
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
 	platform_device_unregister(ipcdev.telemetry_dev);
-	iounmap(ipcdev.ipc_base);
-	res = platform_get_resource(pdev, IORESOURCE_MEM,
-				    PLAT_RESOURCE_IPC_INDEX);
-	if (res) {
-		release_mem_region(res->start,
-				   PLAT_RESOURCE_IPC_SIZE +
-				   PLAT_RESOURCE_GCR_SIZE);
-	}
 	ipcdev.dev = NULL;
 	return 0;
 }
-- 
2.7.4
