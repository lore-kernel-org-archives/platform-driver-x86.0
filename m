From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/5] intel_scu_ipc: protect dev member assignment on ->remove()
Date: Mon, 12 Oct 2015 14:19:48 +0300
Message-ID: <1444648788-74265-6-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1444648788-74265-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:59220 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751858AbbJLLT5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Oct 2015 07:19:57 -0400
In-Reply-To: <1444648788-74265-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Protect the dev member assignment in ->remove() since user may potentially call
unbind from a sysfs even if the driver is built-in. The latter might be racy
with ongoing SCU communication.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 9de2029..f94b730 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -625,7 +625,10 @@ static void ipc_remove(struct pci_dev *pdev)
 {
 	struct intel_scu_ipc_dev *scu = pci_get_drvdata(pdev);
 
+	mutex_lock(&ipclock);
 	scu->dev = NULL;
+	mutex_unlock(&ipclock);
+
 	iounmap(scu->i2c_base);
 	intel_scu_devices_destroy();
 }
-- 
2.5.3
