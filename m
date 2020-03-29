From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 5.6 regression fix 2/2] platform/x86: intel_int0002_vgpio: Use acpi_s2idle_register_wake_callback
Date: Mon, 30 Mar 2020 00:34:19 +0200
Message-ID: <20200329223419.122796-3-hdegoede@redhat.com>
References: <20200329223419.122796-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200329223419.122796-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "5 . 4+" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

The Power Management Events (PMEs) the INT0002 driver listens for get
signalled by the Power Management Controller (PMC) using the same IRQ
as used for the ACPI SCI.

Since commit fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from
waking up the system") the SCI triggering without there being a wakeup
cause recognized by the ACPI sleep code will no longer wakeup the system.

This breaks PMEs / wakeups signalled to the INT0002 driver, the system
never leaves the s2idle_loop() now.

Use acpi_s2idle_register_wake_callback to register a function which
checks the GPE0a_STS register for a PME and trigger a wakeup when a
PME has been signalled.

With this new mechanism the pm_wakeup_hard_event() call is no longer
necessary, so remove it and also remove the matching device_init_wakeup()
calls.

Fixes: fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from waking=
 up the system")
Cc: 5.4+ <stable@vger.kernel.org> # 5.4+
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platfor=
m/x86/intel_int0002_vgpio.c
index f14e2c5f9da5..3c70694188fe 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -122,11 +122,17 @@ static irqreturn_t int0002_irq(int irq, void *data)
 	generic_handle_irq(irq_find_mapping(chip->irq.domain,
 					    GPE0A_PME_B0_VIRT_GPIO_PIN));
=20
-	pm_wakeup_hard_event(chip->parent);
-
 	return IRQ_HANDLED;
 }
=20
+static bool int0002_check_wake(void *data)
+{
+	u32 gpe_sts_reg;
+
+	gpe_sts_reg =3D inl(GPE0A_STS_PORT);
+	return (gpe_sts_reg & GPE0A_PME_B0_STS_BIT);
+}
+
 static struct irq_chip int0002_byt_irqchip =3D {
 	.name			=3D DRV_NAME,
 	.irq_ack		=3D int0002_irq_ack,
@@ -220,13 +226,13 @@ static int int0002_probe(struct platform_device *pd=
ev)
 		return ret;
 	}
=20
-	device_init_wakeup(dev, true);
+	acpi_s2idle_register_wake_callback(irq, int0002_check_wake, NULL);
 	return 0;
 }
=20
 static int int0002_remove(struct platform_device *pdev)
 {
-	device_init_wakeup(&pdev->dev, false);
+	acpi_s2idle_unregister_wake_callback(int0002_check_wake, NULL);
 	return 0;
 }
=20
--=20
2.26.0
