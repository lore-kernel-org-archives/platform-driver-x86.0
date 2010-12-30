From: Feng Tang <feng.tang@intel.com>
Subject: [PATCH] intel_pmic_gpio: modify EOI handling following change of kernel irq subsystem
Date: Thu, 30 Dec 2010 17:32:54 +0800
Message-ID: <1293701574-28378-1-git-send-email-feng.tang@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48055 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750914Ab0L3JeC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Dec 2010 04:34:02 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org
Cc: alan@linux.intel.com, tglx@linutronix.de, Feng Tang <feng.tang@intel.com>, Alek Du <alek.du@intel.com>

Latest kernel has many changes in IRQ subsystem and its interfaces, like adding
"irq_eoi" for struct irq_chip, this patch will make it support both the new
and old interface.

Cc: Alek Du <alek.du@intel.com>
Signed-off-by: Feng Tang <feng.tang@intel.com>
---
 drivers/platform/x86/intel_pmic_gpio.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index e61db9d..4efb2c6 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -244,7 +244,15 @@ static void pmic_irq_handler(unsigned irq, struct irq_desc *desc)
 			generic_handle_irq(pg->irq_base + gpio);
 		}
 	}
-	desc->chip->eoi(irq);
+
+	if (desc->chip->irq_eoi)
+		desc->chip->irq_eoi(irq_get_irq_data(irq));
+#ifndef CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED
+	else if (desc->chip->eoi)
+		desc->chip->eoi(irq);
+#endif
+	else
+		dev_warn(pg->chip.dev, "missing EOI handler for irq %d\n", irq);
 }
 
 static int __devinit platform_pmic_gpio_probe(struct platform_device *pdev)
-- 
1.7.0.4
