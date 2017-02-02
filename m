From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] platform/x86: intel_mid_powerbtn: Move comment to where it belongs
Date: Thu,  2 Feb 2017 19:54:27 +0200
Message-ID: <20170202175428.183482-3-andriy.shevchenko@linux.intel.com>
References: <20170202175428.183482-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170202175428.183482-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The comments is about initial interrupt acknowledgment only. So, move it
back to where it belongs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 594d503ca6fe..de40c71883f8 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -76,16 +76,6 @@ static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
 
 static int mfld_ack(struct mid_pb_ddata *ddata)
 {
-	/*
-	 * SCU firmware might send power button interrupts to IA core before
-	 * kernel boots and doesn't get EOI from IA core. The first bit of
-	 * MSIC reg 0x21 is kept masked, and SCU firmware doesn't send new
-	 * power interrupt to Android kernel. Unmask the bit when probing
-	 * power button in kernel.
-	 * There is a very narrow race between irq handler and power button
-	 * initialization. The race happens rarely. So we needn't worry
-	 * about it.
-	 */
 	return intel_msic_reg_update(INTEL_MSIC_IRQLVL1MSK, 0, MSIC_PWRBTNM);
 }
 
@@ -202,6 +192,16 @@ static int mid_pb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ddata);
 
+	/*
+	 * SCU firmware might send power button interrupts to IA core before
+	 * kernel boots and doesn't get EOI from IA core. The first bit of
+	 * MSIC reg 0x21 is kept masked, and SCU firmware doesn't send new
+	 * power interrupt to Android kernel. Unmask the bit when probing
+	 * power button in kernel.
+	 * There is a very narrow race between irq handler and power button
+	 * initialization. The race happens rarely. So we needn't worry
+	 * about it.
+	 */
 	error = ddata->ack(ddata);
 	if (error) {
 		dev_err(&pdev->dev,
-- 
2.11.0
