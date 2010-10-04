From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] intel_pmic_gpio: swap the bits and mask args for
	intel_scu_ipc_update_register
Date: Mon, 04 Oct 2010 16:40:35 +0100
Message-ID: <20101004154020.13482.7855.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:32851 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756067Ab0JDQra (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Oct 2010 12:47:30 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Alek Du <alek.du@intel.com>

The intel_scu_ipc_update_register 2nd paramter should the bits and 3rd
paramter should be the mask.

This typo was introduced during IPC function changing...

Reported-by: Ryan Zhou <ryan.zhou@intel.com>
Signed-off-by: Alek Du <alek.du@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_pmic_gpio.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)


diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index 5cdcff6..c6e2a1d 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -142,16 +142,16 @@ static int pmic_gpio_direction_output(struct gpio_chip *chip,
 
 	if (offset < 8)/* it is GPIO */
 		rc = intel_scu_ipc_update_register(GPIO0 + offset,
-				GPIO_DRV | GPIO_DOU | GPIO_DIR,
-				GPIO_DRV | (value ? GPIO_DOU : 0));
+				GPIO_DRV | (value ? GPIO_DOU : 0),
+				GPIO_DRV | GPIO_DOU | GPIO_DIR);
 	else if (offset < 16)/* it is GPOSW */
 		rc = intel_scu_ipc_update_register(GPOSWCTL0 + offset - 8,
-				GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV,
-				GPOSW_DRV | (value ? GPOSW_DOU : 0));
+				GPOSW_DRV | (value ? GPOSW_DOU : 0),
+				GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV);
 	else if (offset > 15 && offset < 24)/* it is GPO */
 		rc = intel_scu_ipc_update_register(GPO,
-				1 << (offset - 16),
-				value ? 1 << (offset - 16) : 0);
+				value ? 1 << (offset - 16) : 0,
+				1 << (offset - 16));
 	else {
 		printk(KERN_ERR
 			"%s: invalid PMIC GPIO pin %d!\n", __func__, offset);
@@ -179,16 +179,16 @@ static void pmic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	if (offset < 8)/* it is GPIO */
 		intel_scu_ipc_update_register(GPIO0 + offset,
-			GPIO_DRV | GPIO_DOU,
-			GPIO_DRV | (value ? GPIO_DOU : 0));
+			GPIO_DRV | (value ? GPIO_DOU : 0),
+			GPIO_DRV | GPIO_DOU);
 	else if (offset < 16)/* it is GPOSW */
 		intel_scu_ipc_update_register(GPOSWCTL0 + offset - 8,
-			GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV,
-			GPOSW_DRV | (value ? GPOSW_DOU : 0));
+			GPOSW_DRV | (value ? GPOSW_DOU : 0),
+			GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV);
 	else if (offset > 15 && offset < 24) /* it is GPO */
 		intel_scu_ipc_update_register(GPO,
-			1 << (offset - 16),
-			value ? 1 << (offset - 16) : 0);
+			value ? 1 << (offset - 16) : 0,
+			1 << (offset - 16));
 }
 
 static int pmic_irq_type(unsigned irq, unsigned type)
