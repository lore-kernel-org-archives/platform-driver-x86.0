From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] intel_scu_ipc: move error check out of the loop
Date: Wed, 21 Jan 2015 21:38:10 +0200
Message-ID: <1421869091-11543-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1421869091-11543-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:65377 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752896AbbAUTkm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Jan 2015 14:40:42 -0500
In-Reply-To: <1421869091-11543-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is small performance optimization of the busy_loop().

While here, use BIT() macro instead of plain integers when check the status.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 8938c31..e6430a3 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -176,21 +176,21 @@ static inline u32 ipc_data_readl(u32 offset) /* Read ipc u32 data */
 /* Wait till scu status is busy */
 static inline int busy_loop(void)
 {
-	u32 status = 0;
-	u32 loop_count = 0;
+	u32 status = ipc_read_status();
+	u32 loop_count = 100000;
 
-	status = ipc_read_status();
-	while (status & 1) {
+	/* break if scu doesn't reset busy bit after huge retry */
+	while ((status & BIT(0)) && --loop_count) {
 		udelay(1); /* scu processing time is in few u secods */
 		status = ipc_read_status();
-		loop_count++;
-		/* break if scu doesn't reset busy bit after huge retry */
-		if (loop_count > 100000) {
-			dev_err(&ipcdev.pdev->dev, "IPC timed out");
-			return -ETIMEDOUT;
-		}
 	}
-	if ((status >> 1) & 1)
+
+	if (status & BIT(0)) {
+		dev_err(&ipcdev.pdev->dev, "IPC timed out");
+		return -ETIMEDOUT;
+	}
+
+	if (status & BIT(1))
 		return -EIO;
 
 	return 0;
@@ -208,8 +208,7 @@ static inline int ipc_wait_for_interrupt(void)
 	}
 
 	status = ipc_read_status();
-
-	if ((status >> 1) & 1)
+	if (status & BIT(1))
 		return -EIO;
 
 	return 0;
-- 
2.1.4
