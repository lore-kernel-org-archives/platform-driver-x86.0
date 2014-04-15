From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] platform-drivers: x86: Fix off-by-one valid offset range
 checking
Date: Tue, 15 Apr 2014 09:08:24 +0800
Message-ID: <1397524104.11920.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:44451 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbaDOBI3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Apr 2014 21:08:29 -0400
Received: by mail-vc0-f172.google.com with SMTP id la4so8561568vcb.31
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2014 18:08:28 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Alek Du <alek.du@intel.com>, platform-driver-x86@vger.kernel.org

Only pin 0-7 support input, so the valid offset range should be 0 ~ 7.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/platform/x86/intel_pmic_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index 2805988..281cfcb 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -91,7 +91,7 @@ static void pmic_program_irqtype(int gpio, int type)
 
 static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	if (offset > 8) {
+	if (offset >= 8) {
 		pr_err("only pin 0-7 support input\n");
 		return -1;/* we only have 8 GPIO can use as input */
 	}
-- 
1.8.3.2
