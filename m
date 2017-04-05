From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/5] platform/x86: intel_scu_ipc: Remove redundant subarch check
Date: Wed,  5 Apr 2017 19:05:26 +0300
Message-ID: <20170405160528.9678-3-andriy.shevchenko@linux.intel.com>
References: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:40760 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932815AbdDEQFf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 12:05:35 -0400
In-Reply-To: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: x86@kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The driver is bound to the devices based on their PCI IDs.

There is no need to do an additional check.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 8a34c1e7536f..6d626a8878c7 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -566,15 +566,10 @@ static irqreturn_t ioc(int irq, void *dev_id)
  */
 static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	int platform;		/* Platform type */
 	int err;
 	struct intel_scu_ipc_dev *scu = &ipcdev;
 	struct intel_scu_ipc_pdata_t *pdata;
 
-	platform = intel_mid_identify_cpu();
-	if (platform == 0)
-		return -ENODEV;
-
 	if (scu->dev)		/* We support only one SCU */
 		return -EBUSY;
 
-- 
2.11.0
