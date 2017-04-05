From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/5] platform/x86: intel_scu_ipc: Platform data is mandatory
Date: Wed,  5 Apr 2017 19:05:24 +0300
Message-ID: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Fail ->probe() if there is no platform data supplied.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index e81daff65f62..d789fe1baf17 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -579,6 +579,8 @@ static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -EBUSY;
 
 	pdata = (struct intel_scu_ipc_pdata_t *)id->driver_data;
+	if (!pdata)
+		return -ENODEV;
 
 	scu->dev = &pdev->dev;
 	scu->irq_mode = pdata->irq_mode;
-- 
2.11.0
