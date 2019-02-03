From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: intel_int0002_vgpio: Only implement irq_set_wake on Bay Trail
Date: Sun,  3 Feb 2019 10:42:33 +0100
Message-ID: <20190203094233.12177-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Maxim Mikityanskiy <maxtram95@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Commit c3b8e884defa ("platform/x86: intel_int0002_vgpio: Implement
irq_set_wake"), was written to fix some wakeup issues on Bay Trail (BYT)
devices.

We've received a bug report that this causes a suspend regression on some
Cherry Trail (CHT) based devices.

To fix the issues this causes on CHT devices, this commit modifies the
irq_set_wake support so that we only implement irq_set_wake on BYT devices,

Fixes: c3b8e884defa ("platform/x86: intel_int0002_vgpio: ... irq_set_wake")
Reported-and-tested-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index 4b8f7305fc8a..78787934b572 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -51,11 +51,14 @@
 #define GPE0A_STS_PORT			0x420
 #define GPE0A_EN_PORT			0x428
 
-#define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
+#define BAYTRAIL			0x01
+#define CHERRYTRAIL			0x02
+
+#define ICPU(model, data) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, data}
 
 static const struct x86_cpu_id int0002_cpu_ids[] = {
-	ICPU(INTEL_FAM6_ATOM_SILVERMONT),	/* Valleyview, Bay Trail  */
-	ICPU(INTEL_FAM6_ATOM_AIRMONT),		/* Braswell, Cherry Trail */
+	ICPU(INTEL_FAM6_ATOM_SILVERMONT, BAYTRAIL), /* Valleyview, Bay Trail  */
+	ICPU(INTEL_FAM6_ATOM_AIRMONT, CHERRYTRAIL), /* Braswell, Cherry Trail */
 	{}
 };
 
@@ -135,7 +138,7 @@ static irqreturn_t int0002_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct irq_chip int0002_irqchip = {
+static struct irq_chip int0002_byt_irqchip = {
 	.name			= DRV_NAME,
 	.irq_ack		= int0002_irq_ack,
 	.irq_mask		= int0002_irq_mask,
@@ -143,10 +146,22 @@ static struct irq_chip int0002_irqchip = {
 	.irq_set_wake		= int0002_irq_set_wake,
 };
 
+static struct irq_chip int0002_cht_irqchip = {
+	.name			= DRV_NAME,
+	.irq_ack		= int0002_irq_ack,
+	.irq_mask		= int0002_irq_mask,
+	.irq_unmask		= int0002_irq_unmask,
+	/*
+	 * No set_wake, on CHT the IRQ is typically shared with the ACPI SCI
+	 * and we don't want to mess with the ACPI SCI irq settings.
+	 */
+};
+
 static int int0002_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct x86_cpu_id *cpu_id;
+	struct irq_chip *irq_chip;
 	struct gpio_chip *chip;
 	int irq, ret;
 
@@ -195,14 +210,19 @@ static int int0002_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = gpiochip_irqchip_add(chip, &int0002_irqchip, 0, handle_edge_irq,
+	if (cpu_id->driver_data == BAYTRAIL)
+		irq_chip = &int0002_byt_irqchip;
+	else
+		irq_chip = &int0002_cht_irqchip;
+
+	ret = gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
 				   IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(dev, "Error adding irqchip: %d\n", ret);
 		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(chip, &int0002_irqchip, irq, NULL);
+	gpiochip_set_chained_irqchip(chip, irq_chip, irq, NULL);
 
 	return 0;
 }
-- 
2.20.1
