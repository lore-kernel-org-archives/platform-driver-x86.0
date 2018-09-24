From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: intel_int0002_vgpio: Implement irq_set_wake
Date: Mon, 24 Sep 2018 16:37:19 +0200
Message-ID: <20180924143719.22191-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We were relying on the interrupt being shared with the ACPI SCI and the
ACPI core calling irq_set_wake. But that does not always happen on
Bay Trail devices, so we should do it ourselves.

This fixes wake from USB not working on various Bay Trail devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index 987a3b03f225..33c3489f5bc1 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -106,6 +106,21 @@ static void int0002_irq_mask(struct irq_data *data)
 	outl(gpe_en_reg, GPE0A_EN_PORT);
 }
 
+static int int0002_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct platform_device *pdev = to_platform_device(chip->parent);
+	int irq = platform_get_irq(pdev, 0);
+
+	/* Propagate to parent irq */
+	if (on)
+		enable_irq_wake(irq);
+	else
+		disable_irq_wake(irq);
+
+	return 0;
+}
+
 static irqreturn_t int0002_irq(int irq, void *data)
 {
 	struct gpio_chip *chip = data;
@@ -128,6 +143,7 @@ static struct irq_chip int0002_irqchip = {
 	.irq_ack		= int0002_irq_ack,
 	.irq_mask		= int0002_irq_mask,
 	.irq_unmask		= int0002_irq_unmask,
+	.irq_set_wake		= int0002_irq_set_wake,
 };
 
 static int int0002_probe(struct platform_device *pdev)
-- 
2.19.0.rc1
