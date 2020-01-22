From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 9/9] platform/x86: intel_pmc_ipc: Switch to use driver->dev_groups
Date: Wed, 22 Jan 2020 19:46:19 +0300
Message-ID: <20200122164619.73563-10-mika.westerberg@linux.intel.com>
References: <20200122164619.73563-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200122164619.73563-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The driver core provides support for adding additional attributes for
devices via new ->dev_groups member of struct device_driver. Convert the
driver to use that instead of adding the attributes manually.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 7b180ead064a..2433bf73f1ed 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -539,6 +539,11 @@ static const struct attribute_group intel_ipc_group = {
 	.attrs = intel_ipc_attrs,
 };
 
+static const struct attribute_group *intel_ipc_groups[] = {
+	&intel_ipc_group,
+	NULL
+};
+
 static struct resource punit_res_array[] = {
 	/* Punit BIOS */
 	{
@@ -879,18 +884,10 @@ static int ipc_plat_probe(struct platform_device *pdev)
 		goto err_irq;
 	}
 
-	ret = sysfs_create_group(&pdev->dev.kobj, &intel_ipc_group);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
-			ret);
-		goto err_sys;
-	}
-
 	ipcdev.has_gcr_regs = true;
 
 	return 0;
-err_sys:
-	devm_free_irq(&pdev->dev, ipcdev.irq, &ipcdev);
+
 err_irq:
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
@@ -901,7 +898,6 @@ static int ipc_plat_probe(struct platform_device *pdev)
 
 static int ipc_plat_remove(struct platform_device *pdev)
 {
-	sysfs_remove_group(&pdev->dev.kobj, &intel_ipc_group);
 	devm_free_irq(&pdev->dev, ipcdev.irq, &ipcdev);
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
@@ -916,6 +912,7 @@ static struct platform_driver ipc_plat_driver = {
 	.driver = {
 		.name = "pmc-ipc-plat",
 		.acpi_match_table = ACPI_PTR(ipc_acpi_ids),
+		.dev_groups = intel_ipc_groups,
 	},
 };
 
-- 
2.24.1
