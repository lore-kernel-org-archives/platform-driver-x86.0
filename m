From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: intel_mid_powerbtn: Use SCU IPC directly
Date: Wed,  8 Feb 2017 19:03:19 +0200
Message-ID: <20170208170319.24052-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:37677 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751906AbdBHRDf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2017 12:03:35 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On older Intel MID platforms is using SCU IPC library beneath MSIC
calls.

To make access unified between old and new platforms use SCU IPC library
directly. It's safe since serialization is done in the library.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 38844f765345..871cfa682519 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -64,7 +64,7 @@ static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
 	int ret;
 	u8 pbstat;
 
-	ret = intel_msic_reg_read(ddata->pbstat_addr, &pbstat);
+	ret = intel_scu_ipc_ioread8(ddata->pbstat_addr, &pbstat);
 	if (ret)
 		return ret;
 
@@ -76,7 +76,7 @@ static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
 
 static int mid_irq_ack(struct mid_pb_ddata *ddata)
 {
-	return intel_msic_reg_update(ddata->mirqlvl1_addr, 0, MSIC_PWRBTNM);
+	return intel_scu_ipc_update_register(ddata->mirqlvl1_addr, 0, MSIC_PWRBTNM);
 }
 
 static int mrfld_setup(struct mid_pb_ddata *ddata)
-- 
2.11.0
