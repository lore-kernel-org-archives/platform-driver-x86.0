From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/5] platform/x86: intel_scu_ipc: Rearrange init sequence
Date: Wed,  5 Apr 2017 19:05:25 +0300
Message-ID: <20170405160528.9678-2-andriy.shevchenko@linux.intel.com>
References: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Device pointer is used as a flag that everything is prepared.
Nevertheless the assignment happened quite before and there is a window
when a caller can get weird results or even crashes since not all fields
are initialized yet.

Rearrange initialization sequence in ->probe() to prepare everything
before use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index d789fe1baf17..8a34c1e7536f 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -582,7 +582,6 @@ static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!pdata)
 		return -ENODEV;
 
-	scu->dev = &pdev->dev;
 	scu->irq_mode = pdata->irq_mode;
 
 	err = pcim_enable_device(pdev);
@@ -595,17 +594,20 @@ static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	init_completion(&scu->cmd_complete);
 
-	err = devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_scu_ipc",
-			       scu);
-	if (err)
-		return err;
-
 	scu->ipc_base = pcim_iomap_table(pdev)[0];
 
 	scu->i2c_base = ioremap_nocache(pdata->i2c_base, pdata->i2c_len);
 	if (!scu->i2c_base)
 		return -ENOMEM;
 
+	err = devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_scu_ipc",
+			       scu);
+	if (err)
+		return err;
+
+	/* Assign device at last */
+	scu->dev = &pdev->dev;
+
 	intel_scu_devices_create();
 
 	pci_set_drvdata(pdev, scu);
-- 
2.11.0
