From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: intel_int0002_vgpio: Use device_init_wakeup
Date: Fri, 23 Aug 2019 19:48:15 +0200
Message-ID: <20190823174815.27861-2-hdegoede@redhat.com>
References: <20190823174815.27861-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823174815.27861-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use device_init_wakeup and pm_wakeup_hard_event instead of directly
calling pm_system_wakeup(). This is the preferred way to do this and
this will allow the user to disable wakeup through INT0002 events
through sysfs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index 9ea1a2a19f86..f9fee682a8a2 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -122,7 +122,7 @@ static irqreturn_t int0002_irq(int irq, void *data)
 	generic_handle_irq(irq_find_mapping(chip->irq.domain,
 					    GPE0A_PME_B0_VIRT_GPIO_PIN));
 
-	pm_system_wakeup();
+	pm_wakeup_hard_event(chip->parent);
 
 	return IRQ_HANDLED;
 }
@@ -217,6 +217,13 @@ static int int0002_probe(struct platform_device *pdev)
 
 	gpiochip_set_chained_irqchip(chip, irq_chip, irq, NULL);
 
+	device_init_wakeup(dev, true);
+	return 0;
+}
+
+static int int0002_remove(struct platform_device *pdev)
+{
+	device_init_wakeup(&pdev->dev, false);
 	return 0;
 }
 
@@ -232,6 +239,7 @@ static struct platform_driver int0002_driver = {
 		.acpi_match_table	= int0002_acpi_ids,
 	},
 	.probe	= int0002_probe,
+	.remove	= int0002_remove,
 };
 
 module_platform_driver(int0002_driver);
-- 
2.22.0
