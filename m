From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/8] iio: light: cm32181: Use units of 1/100000th for calibscale and lux_per_bit
Date: Sun, 26 Apr 2020 13:02:53 +0200
Message-ID: <20200426110256.218186-5-hdegoede@redhat.com>
References: <20200426110256.218186-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200426110256.218186-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/iio/light/cm32181.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index e31c1005b03d..4fdf2f4a23ab 100644
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
@@ -208,15 +208,15 @@ static int cm32181_get_lux(struct cm32181_chip *cm3=
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
@@ -224,8 +224,8 @@ static int cm32181_get_lux(struct cm32181_chip *cm321=
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
