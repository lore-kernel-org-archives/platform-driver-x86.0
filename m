From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 08/11] iio: light: cm32181: Use units of 1/100000th for calibscale and lux_per_bit
Date: Tue, 28 Apr 2020 19:29:20 +0200
Message-ID: <20200428172923.567806-8-hdegoede@redhat.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200428172923.567806-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Use units of 1/100000th for calibscale and lux_per_bit. The similar
cm3232 driver already uses 1/100000th as unit for calibscale.

This allows for higher-accuracy and makes it easier to add support
for getting device-specific calibscale and lux_per_bit values from
a device's ACPI tables, as the values in the ACPI tables also use
1/100000th units.

This units change means that our intermediate values in cm32181_get_lux()
may get quite big, change the type of the lux variable to a u64 to
deal with this.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/light/cm32181.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index bcea669d20cb..1ad7d4582d1c 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -45,11 +45,11 @@
 #define CM32181_CMD_ALS_SM_MASK		(0x03 << CM32181_CMD_ALS_SM_SHIFT)
 #define CM32181_CMD_ALS_SM_DEFAULT	(0x01 << CM32181_CMD_ALS_SM_SHIFT)
=20
-#define CM32181_MLUX_PER_BIT		5	/* ALS_SM=3D01 IT=3D800ms */
-#define CM32181_MLUX_PER_BIT_BASE_IT	800000	/* Based on IT=3D800ms */
-#define	CM32181_CALIBSCALE_DEFAULT	1000
-#define CM32181_CALIBSCALE_RESOLUTION	1000
-#define MLUX_PER_LUX			1000
+#define CM32181_LUX_PER_BIT		500	/* ALS_SM=3D01 IT=3D800ms */
+#define CM32181_LUX_PER_BIT_RESOLUTION	100000
+#define CM32181_LUX_PER_BIT_BASE_IT	800000	/* Based on IT=3D800ms */
+#define CM32181_CALIBSCALE_DEFAULT	100000
+#define CM32181_CALIBSCALE_RESOLUTION	100000
=20
 #define SMBUS_ALERT_RESPONSE_ADDRESS	0x0c
=20
@@ -204,15 +204,15 @@ static int cm32181_get_lux(struct cm32181_chip *cm3=
2181)
 	struct i2c_client *client =3D cm32181->client;
 	int ret;
 	int als_it;
-	unsigned long lux;
+	u64 lux;
=20
 	ret =3D cm32181_read_als_it(cm32181, &als_it);
 	if (ret < 0)
 		return -EINVAL;
=20
-	lux =3D CM32181_MLUX_PER_BIT;
-	lux *=3D CM32181_MLUX_PER_BIT_BASE_IT;
-	lux /=3D als_it;
+	lux =3D CM32181_LUX_PER_BIT;
+	lux *=3D CM32181_LUX_PER_BIT_BASE_IT;
+	lux =3D div_u64(lux, als_it);
=20
 	ret =3D i2c_smbus_read_word_data(client, CM32181_REG_ADDR_ALS);
 	if (ret < 0)
@@ -220,8 +220,8 @@ static int cm32181_get_lux(struct cm32181_chip *cm321=
81)
=20
 	lux *=3D ret;
 	lux *=3D cm32181->calibscale;
-	lux /=3D CM32181_CALIBSCALE_RESOLUTION;
-	lux /=3D MLUX_PER_LUX;
+	lux =3D div_u64(lux, CM32181_CALIBSCALE_RESOLUTION);
+	lux =3D div_u64(lux, CM32181_LUX_PER_BIT_RESOLUTION);
=20
 	if (lux > 0xFFFF)
 		lux =3D 0xFFFF;
--=20
2.26.0
