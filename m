From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] ACPI / scan: Create platform device for CPLM3218 ACPI nodes
Date: Sun, 26 Apr 2020 12:47:13 +0200
Message-ID: <20200426104713.216896-3-hdegoede@redhat.com>
References: <20200426104713.216896-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200426104713.216896-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Some CPLM3218 ACPI nodes also put the SMBus Alert Response Address (0x0c)
in their ACPI resource table; and they put it there as the first entry,
here is an example from the CPLM3218 device in the DSDT of an Asus T100TA=
:

 Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
 {
     Name (SBUF, ResourceTemplate ()
     {
         I2cSerialBusV2 (0x000C, ControllerInitiated, 0x00061A80,
             AddressingMode7Bit, "\\_SB.I2C3",
             0x00, ResourceConsumer, , Exclusive,
             )
         I2cSerialBusV2 (0x0048, ControllerInitiated, 0x00061A80,
             AddressingMode7Bit, "\\_SB.I2C3",
             0x00, ResourceConsumer, , Exclusive,
             )
         Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
         {
             0x00000033,
         }
     })
     Return (SBUF) /* \_SB_.I2C3.ALSD._CRS.SBUF */
 }

The actual I2C address of the sensor in this case is the 0x48 address
from the second resource-table entry. On some other devices
(e.g. HP X2 Bay Trail models, Acer SW5-012) the CPLM3218 node contains
only 1 I2C resource.

Add the CPLM3218 to the I2C multi instantiate list, so that the
i2c-multi-instantiate.c driver can handle it.

Note in the case where there are 2 I2C resources we simply instatiate
i2c-clients for both and let the cm32181 driver figure out that the
first one is not the one it wants.

Doing things this way is actually desirable because on devices where
there are 2 I2C resources it seems that we first need to do a SMBus
read of the 0x0c address before the sensor will respond to I2C transfers
on its actual address.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/scan.c                          | 1 +
 drivers/platform/x86/i2c-multi-instantiate.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 6d3448895382..937d72fc212c 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1544,6 +1544,7 @@ static bool acpi_device_enumeration_by_parent(struc=
t acpi_device *device)
 	static const struct acpi_device_id i2c_multi_instantiate_ids[] =3D {
 		{"BSG1160", },
 		{"BSG2150", },
+		{"CPLM3218", },
 		{"INT33FE", },
 		{"INT3515", },
 		{}
diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platf=
orm/x86/i2c-multi-instantiate.c
index dcafb1a29d17..e1cdc44e6f57 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -180,6 +180,12 @@ static const struct i2c_inst_data int3515_data[]  =3D=
 {
 	{}
 };
=20
+static const struct i2c_inst_data cplm3218_data[]  =3D {
+	{ "cm32181", PASS_FWNODE },
+	{ "cm32181", PASS_FWNODE },
+	{}
+};
+
 /*
  * Note new device-ids must also be added to i2c_multi_instantiate_ids i=
n
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -187,6 +193,7 @@ static const struct i2c_inst_data int3515_data[]  =3D=
 {
 static const struct acpi_device_id i2c_multi_inst_acpi_ids[] =3D {
 	{ "BSG1160", (unsigned long)bsg1160_data },
 	{ "BSG2150", (unsigned long)bsg2150_data },
+	{ "CPLM3218", (unsigned long)cplm3218_data },
 	{ "INT3515", (unsigned long)int3515_data },
 	{ }
 };
--=20
2.26.0
