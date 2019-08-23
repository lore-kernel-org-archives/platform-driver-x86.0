From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: intel_int0002_vgpio: Fix wakeups not working on Cherry Trail
Date: Fri, 23 Aug 2019 19:48:14 +0200
Message-ID: <20190823174815.27861-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement
irq_set_wake on Bay Trail") removed the irq_set_wake method from the
struct irq_chip used on Cherry Trail, but it did not set
IRQCHIP_SKIP_SET_WAKE causing  kernel/irq/manage.c: set_irq_wake_real()
to return -ENXIO.

This causes the kernel to no longer see PME events reported through the
INT0002 device as wakeup events. Which e.g. breaks wakeup by the (USB)
keyboard on many Cherry Trail 2-in-1 devices.

Cc: stable@vger.kernel.org
Fixes: 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement irq_set_wake on Bay Trail")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index d9542c661ddc..9ea1a2a19f86 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -144,6 +144,7 @@ static struct irq_chip int0002_cht_irqchip = {
 	 * No set_wake, on CHT the IRQ is typically shared with the ACPI SCI
 	 * and we don't want to mess with the ACPI SCI irq settings.
 	 */
+	.flags			= IRQCHIP_SKIP_SET_WAKE,
 };
 
 static const struct x86_cpu_id int0002_cpu_ids[] = {
-- 
2.22.0
