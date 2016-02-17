From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH 2/2] intel_pmc_ipc: avoid pending IPC1 command during legacy suspend
Date: Thu, 18 Feb 2016 02:03:38 +0800
Message-ID: <1455732218-27283-2-git-send-email-qipeng.zha@intel.com>
References: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:56386 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933325AbcBQJ6k (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 04:58:40 -0500
In-Reply-To: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, qipeng.zha@intel.com, Ananth Krishna R <ananth.krishna.r@intel.com>, Bharath K Veera <bharath.k.veera@intel.com>

During legacy suspend flow, IPC1 commands are being requested
from opregion driver. But the PMC_IPC1 command will timeout as example:

[  281.444600] ipc_debug##: ipc_send_command: cmd=0x201ff,
[  281.444648] wbuf[0]=0x4ea6
[  281.444668] wbuf[1]=0x0
[  281.444674] wbuf[2]=0x0
[  281.444676] wbuf[3]=0x0
[  284.446467] pmc-ipc-plat INT34D2:00: IPC timed out, TS=0x4, CMD=0x200ff

This is because before the opregion driver could send IPC1 commands,
the PMC_IPC irq is already suspended. Which makes the IPC command to
timeout.

Solution: register pmc_ipc irq as IRQF_NO_SUSPEND

Signed-off-by: Ananth Krishna R <ananth.krishna.r@intel.com>
Signed-off-by: Bharath K Veera <bharath.k.veera@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index abdf67c..140aa77 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -731,7 +731,8 @@ static int ipc_plat_probe(struct platform_device *pdev)
 		goto err_device;
 	}
 
-	if (request_irq(ipcdev.irq, ioc, 0, "intel_pmc_ipc", &ipcdev)) {
+	if (request_irq(ipcdev.irq, ioc, IRQF_NO_SUSPEND,
+			"intel_pmc_ipc", &ipcdev)) {
 		dev_err(&pdev->dev, "Failed to request irq\n");
 		ret = -EBUSY;
 		goto err_irq;
-- 
1.8.3.2
