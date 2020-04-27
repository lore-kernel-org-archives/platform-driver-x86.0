From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 3/8] iio: light: cm32181: Handle ACPI instantiating a cm32181 client on the SMBus ARA
Date: Mon, 27 Apr 2020 17:50:32 +0200
Message-ID: <20200427155037.218390-3-hdegoede@redhat.com>
References: <20200427155037.218390-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200427155037.218390-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Some ACPI systems list 2 I2C resources for the CM3218 sensor. On these
systems the first I2cSerialBus ACPI-resource points to the SMBus Alert
Response Address (ARA, 0x0c) and the second I2cSerialBus ACPI-resource
points to the actual CM3218 sensor address.

From the ACPI/x86 side devices with more then 1 I2cSerialBus ACPI-resourc=
e
are handled by the drivers/platform/x86/i2c-multi-instantiate.c code.
This code will instantiate "cm32181" i2c_client-s for both resources.

Add a check to cm32181_probe() for the client's address being the ARA
address, and in that case fail the probe with -ENODEV.

On these ACPI systems the sensor may have a SMBus Alert asserted at boot,
if this is the case the sensor will not respond to any i2c_transfers on
its actual address until we read from the ARA register to clear the Alert=
.

Therefor we must (try to) read a byte from the client with the ARA
register, before returning -ENODEV, so that we clear the Alert and when
we get called again for the client instantiated for the second
I2cSerialBus ACPI-resource the sensor will respond to our i2c-transfers.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2
- s/i2c_client-s/I2C clients/ in added comment
---
 drivers/iio/light/cm32181.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index fd371b36c7b3..4c26a4a8a070 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -51,6 +51,8 @@
 #define CM32181_CALIBSCALE_RESOLUTION	1000
 #define MLUX_PER_LUX			1000
=20
+#define SMBUS_ALERT_RESPONSE_ADDRESS	0x0c
+
 static const u8 cm32181_reg[CM32181_CONF_REG_NUM] =3D {
 	CM32181_REG_ADDR_CMD,
 };
@@ -333,6 +335,20 @@ static int cm32181_probe(struct i2c_client *client,
 	struct iio_dev *indio_dev;
 	int ret;
=20
+	/*
+	 * Some ACPI systems list 2 I2C resources for the CM3218 sensor, the
+	 * SMBus Alert Response Address (ARA, 0x0c) and the actual I2C address.
+	 * drivers/platform/x86/i2c-multi-instantiate.c instantiates "cm32181"
+	 * I2C clients for both resources, ignore the ARA client.
+	 * On these systems the sensor may have a SMBus Alert asserted at boot,
+	 * in that case the ARA must be read to clear the Alert otherwise the
+	 * sensor will not respond on its actual I2C address.
+	 */
+	if (client->addr =3D=3D SMBUS_ALERT_RESPONSE_ADDRESS) {
+		i2c_smbus_read_byte(client);
+		return -ENODEV;
+	}
+
 	indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*cm32181));
 	if (!indio_dev) {
 		dev_err(&client->dev, "devm_iio_device_alloc failed\n");
--=20
2.26.0
