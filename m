From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: i2c-multi-instantiate: Add flag for passing fwnode
Date: Sun, 26 Apr 2020 12:47:12 +0200
Message-ID: <20200426104713.216896-2-hdegoede@redhat.com>
References: <20200426104713.216896-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200426104713.216896-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In some cases the driver for the i2c_client-s which i2c-multi-instantiate
instantiates may need access some fields / methods from to the ACPI fwnod=
e
for which i2c_clients are being instantiated.

An example of this are CPLM3218 ACPI device-s. These contain CPM0 and
CPM1 packages with various information (e.g. register init values) which
the driver needs.

Passing the fwnode through the i2c_board_info struct also gives the
i2c-core access to it, and if we do not pass an IRQ then the i2c-core
will use the fwnode to get an IRQ, see i2c_acpi_get_irq().

This is a problem when there is only an IRQ for 1 of the clients describe=
d
in the ACPI device we are instantiating clients for. If we unconditionall=
y
pass the fwnode, then i2c_acpi_get_irq() will assign the same IRQ to all
clients instantiated, leading to kernel-oopses like this (BSG1160 device)=
:

[   27.340557] genirq: Flags mismatch irq 76. 00002001 (bmc150_magn_event=
) vs. 00000001 (bmc150_accel_event)
[   27.340567] Call Trace:
...

So we cannot simply always pass the fwnode. This commit adds a PASS_FWNOD=
E
flag, which can be used to pass the fwnode in cases where we do not have
the IRQ problem and the driver for the instantiated client(s) needs acces=
s
to the fwnode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platf=
orm/x86/i2c-multi-instantiate.c
index 6acc8457866e..dcafb1a29d17 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -20,6 +20,8 @@
 #define IRQ_RESOURCE_GPIO	1
 #define IRQ_RESOURCE_APIC	2
=20
+#define PASS_FWNODE		BIT(2)
+
 struct i2c_inst_data {
 	const char *type;
 	unsigned int flags;
@@ -93,6 +95,10 @@ static int i2c_multi_inst_probe(struct platform_device=
 *pdev)
 		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
 			 inst_data[i].type, i);
 		board_info.dev_name =3D name;
+
+		if (inst_data[i].flags & PASS_FWNODE)
+			board_info.fwnode =3D dev->fwnode;
+
 		switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
 		case IRQ_RESOURCE_GPIO:
 			ret =3D acpi_dev_gpio_irq_get(adev, inst_data[i].irq_idx);
--=20
2.26.0
