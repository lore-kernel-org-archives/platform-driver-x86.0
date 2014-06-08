From: Axel Lin <axel.lin@ingics.com>
Subject: [RESEND][PATCH v2] platform-drivers-x86: intel_pmic_gpio: Fix
 off-by-one valid offset range check
Date: Sun, 08 Jun 2014 20:54:05 +0800
Message-ID: <1402232045.7195.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35284 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751907AbaFHMyL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 8 Jun 2014 08:54:11 -0400
Received: by mail-ob0-f179.google.com with SMTP id nu7so2161652obb.38
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Jun 2014 05:54:10 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Alek Du <alek.du@intel.com>, platform-driver-x86@vger.kernel.org

Only pin 0-7 support input, so the valid offset range should be 0 ~ 7.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Acked-by: Alek Du <alek.du@intel.com>
---
Hi Matthew,
This patch was sent on http://www.spinics.net/lists/platform-driver-x86/msg05259.html.
Seems this patch is not applied yet. So here is a resend.
Axel
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
