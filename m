From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v2 1/6] platform/x86: intel_pmc_ipc: Use devm_* calls in driver probe function
Date: Sat,  2 Sep 2017 18:24:44 -0700
Message-ID: <1504401889-113524-2-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: souvik.k.chakravarty@intel.com, x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, lee.jones@linaro.org, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

This patch cleans up unnecessary free/alloc calls in ipc_plat_probe(),
ipc_pci_probe() and ipc_plat_get_res() functions by using devm_*
calls.

This patch also adds proper error handling for failure cases in
ipc_pci_probe() function.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 87 ++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 49 deletions(-)

Changes since v1:
 * Merged devm_* related changes into a single function.
 * Instead of removing free_irq, use devm_free_irq function.


diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index bb792a5..7f86594 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -489,42 +489,53 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = pci_enable_device(pdev);
 	if (ret)
-		return ret;
+		goto release_device;
 
 	ret = pci_request_regions(pdev, "intel_pmc_ipc");
 	if (ret)
-		return ret;
+		goto disable_device;
 
 	pci_resource = pci_resource_start(pdev, 0);
 	len = pci_resource_len(pdev, 0);
 	if (!pci_resource || !len) {
 		dev_err(&pdev->dev, "Failed to get resource\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_pci_resources;
 	}
 
 	init_completion(&ipcdev.cmd_complete);
 
-	if (request_irq(pdev->irq, ioc, 0, "intel_pmc_ipc", &ipcdev)) {
+	if (devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_pmc_ipc",
+				&ipcdev)) {
 		dev_err(&pdev->dev, "Failed to request irq\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto free_pci_resources;
 	}
 
-	ipcdev.ipc_base = ioremap_nocache(pci_resource, len);
+	ipcdev.ipc_base = devm_ioremap_nocache(&pdev->dev, pci_resource, len);
 	if (!ipcdev.ipc_base) {
 		dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
-		free_irq(pdev->irq, &ipcdev);
 		ret = -ENOMEM;
+		goto free_pci_resources;
 	}
 
+	return 0;
+
+free_pci_resources:
+	pci_release_regions(pdev);
+disable_device:
+	pci_disable_device(pdev);
+release_device:
+	pci_dev_put(pdev);
+
 	return ret;
 }
 
 static void ipc_pci_remove(struct pci_dev *pdev)
 {
-	free_irq(pdev->irq, &ipcdev);
+	devm_free_irq(&pdev->dev, pdev->irq, &ipcdev);
 	pci_release_regions(pdev);
 	pci_dev_put(pdev);
-	iounmap(ipcdev.ipc_base);
 	ipcdev.dev = NULL;
 }
 
@@ -849,18 +860,16 @@ static int ipc_plat_get_res(struct platform_device *pdev)
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
@@ -917,7 +926,6 @@ MODULE_DEVICE_TABLE(acpi, ipc_acpi_ids);
 
 static int ipc_plat_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	int ret;
 
 	ipcdev.dev = &pdev->dev;
@@ -939,61 +947,42 @@ static int ipc_plat_probe(struct platform_device *pdev)
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
+	devm_free_irq(&pdev->dev, ipcdev.irq, &ipcdev);
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
