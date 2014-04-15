From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2] platform-drivers-x86: intel_pmic_gpio: Fix off-by-one
 valid offset range check
Date: Tue, 15 Apr 2014 10:54:11 +0800
Message-ID: <1397530451.9964.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f171.google.com ([209.85.128.171]:57202 "EHLO
	mail-ve0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbaDOCyR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Apr 2014 22:54:17 -0400
Received: by mail-ve0-f171.google.com with SMTP id jy13so8435531veb.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2014 19:54:16 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Alek Du <alek.du@intel.com>, platform-driver-x86@vger.kernel.org

Only pin 0-7 support input, so the valid offset range should be 0 ~ 7.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
This is v2 of "[PATCH] platform-drivers: x86: Fix off-by-one valid offset range checking"

 drivers/platform/x86/intel_pmic_gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index 2805988..40929e4 100644
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
@@ -130,7 +130,7 @@ static int pmic_gpio_get(struct gpio_chip *chip, unsigned offset)
 	int ret;
 
 	/* we only have 8 GPIO pins we can use as input */
-	if (offset > 8)
+	if (offset >= 8)
 		return -EOPNOTSUPP;
 	ret = intel_scu_ipc_ioread8(GPIO0 + offset, &r);
 	if (ret < 0)
-- 
1.8.3.2
