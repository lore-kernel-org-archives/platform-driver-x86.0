From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 04/11] iio: light: cm32181: Add support for the CM3218
Date: Mon,  4 May 2020 14:55:44 +0200
Message-ID: <20200504125551.434647-4-hdegoede@redhat.com>
References: <20200504125551.434647-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200504125551.434647-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Add support for the CM3218 which is an older version of the
CM32181.

This is based on a newer version of cm32181.c, with a copyright of:

 * Copyright (C) 2014 Capella Microsystems Inc.
 * Author: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
 *
 * This program is free software; you can redistribute it and/or modify i=
t
 * under the terms of the GNU General Public License version 2, as publis=
hed
 * by the Free Software Foundation.

Which is floating around on the net in various places, but the changes
from this newer version never made it upstream.

This was tested on an Asus T100TA and an Asus T100CHI, which both come
with the CM3218 variant of the light sensor.

Reviewed-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v4:
- Add a cm32181_chip_info structure and use that to store the various
  sensor-model specific values
---
 drivers/iio/light/cm32181.c | 67 ++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index e7dc3276d800..92b9ce91fe0a 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -55,17 +55,45 @@ static const u8 cm32181_reg[CM32181_CONF_REG_NUM] =3D=
 {
 	CM32181_REG_ADDR_CMD,
 };
=20
-static const int als_it_bits[] =3D {12, 8, 0, 1, 2, 3};
-static const int als_it_value[] =3D {25000, 50000, 100000, 200000, 40000=
0,
-	800000};
+struct cm32181_chip_info {
+	const char *name;
+	const int *als_it_bits;
+	const int *als_it_values;
+	int num_als_it;
+};
=20
 struct cm32181_chip {
 	struct i2c_client *client;
+	const struct cm32181_chip_info *info;
 	struct mutex lock;
 	u16 conf_regs[CM32181_CONF_REG_NUM];
 	int calibscale;
 };
=20
+/* CM3218 Family */
+static const int cm3218_als_it_bits[] =3D { 0, 1, 2, 3 };
+static const int cm3218_als_it_values[] =3D { 100000, 200000, 400000, 80=
0000 };
+
+const struct cm32181_chip_info cm3218_chip_info =3D {
+	.name =3D "cm3218",
+	.als_it_bits =3D cm3218_als_it_bits,
+	.als_it_values =3D cm3218_als_it_values,
+	.num_als_it =3D ARRAY_SIZE(cm3218_als_it_bits),
+};
+
+/* CM32181 Family */
+static const int cm32181_als_it_bits[] =3D { 12, 8, 0, 1, 2, 3 };
+static const int cm32181_als_it_values[] =3D {
+	25000, 50000, 100000, 200000, 400000, 800000
+};
+
+const struct cm32181_chip_info cm32181_chip_info =3D {
+	.name =3D "cm32181",
+	.als_it_bits =3D cm32181_als_it_bits,
+	.als_it_values =3D cm32181_als_it_values,
+	.num_als_it =3D ARRAY_SIZE(cm32181_als_it_bits),
+};
+
 /**
  * cm32181_reg_init() - Initialize CM32181 registers
  * @cm32181:	pointer of struct cm32181.
@@ -85,8 +113,17 @@ static int cm32181_reg_init(struct cm32181_chip *cm32=
181)
 		return ret;
=20
 	/* check device ID */
-	if ((ret & 0xFF) !=3D 0x81)
+	switch (ret & 0xFF) {
+	case 0x18: /* CM3218 */
+		cm32181->info =3D &cm3218_chip_info;
+		break;
+	case 0x81: /* CM32181 */
+	case 0x82: /* CM32182, fully compat. with CM32181 */
+		cm32181->info =3D &cm32181_chip_info;
+		break;
+	default:
 		return -ENODEV;
+	}
=20
 	/* Default Values */
 	cm32181->conf_regs[CM32181_REG_ADDR_CMD] =3D
@@ -121,9 +158,9 @@ static int cm32181_read_als_it(struct cm32181_chip *c=
m32181, int *val2)
 	als_it =3D cm32181->conf_regs[CM32181_REG_ADDR_CMD];
 	als_it &=3D CM32181_CMD_ALS_IT_MASK;
 	als_it >>=3D CM32181_CMD_ALS_IT_SHIFT;
-	for (i =3D 0; i < ARRAY_SIZE(als_it_bits); i++) {
-		if (als_it =3D=3D als_it_bits[i]) {
-			*val2 =3D als_it_value[i];
+	for (i =3D 0; i < cm32181->info->num_als_it; i++) {
+		if (als_it =3D=3D cm32181->info->als_it_bits[i]) {
+			*val2 =3D cm32181->info->als_it_values[i];
 			return IIO_VAL_INT_PLUS_MICRO;
 		}
 	}
@@ -146,14 +183,14 @@ static int cm32181_write_als_it(struct cm32181_chip=
 *cm32181, int val)
 	u16 als_it;
 	int ret, i, n;
=20
-	n =3D ARRAY_SIZE(als_it_value);
+	n =3D cm32181->info->num_als_it;
 	for (i =3D 0; i < n; i++)
-		if (val <=3D als_it_value[i])
+		if (val <=3D cm32181->info->als_it_values[i])
 			break;
 	if (i >=3D n)
 		i =3D n - 1;
=20
-	als_it =3D als_it_bits[i];
+	als_it =3D cm32181->info->als_it_bits[i];
 	als_it <<=3D CM32181_CMD_ALS_IT_SHIFT;
=20
 	mutex_lock(&cm32181->lock);
@@ -265,11 +302,13 @@ static int cm32181_write_raw(struct iio_dev *indio_=
dev,
 static ssize_t cm32181_get_it_available(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
+	struct cm32181_chip *cm32181 =3D iio_priv(dev_to_iio_dev(dev));
 	int i, n, len;
=20
-	n =3D ARRAY_SIZE(als_it_value);
+	n =3D cm32181->info->num_als_it;
 	for (i =3D 0, len =3D 0; i < n; i++)
-		len +=3D sprintf(buf + len, "0.%06u ", als_it_value[i]);
+		len +=3D sprintf(buf + len, "0.%06u ",
+			       cm32181->info->als_it_values[i]);
 	return len + sprintf(buf + len, "\n");
 }
=20
@@ -322,7 +361,6 @@ static int cm32181_probe(struct i2c_client *client)
 	indio_dev->channels =3D cm32181_channels;
 	indio_dev->num_channels =3D ARRAY_SIZE(cm32181_channels);
 	indio_dev->info =3D &cm32181_info;
-	indio_dev->name =3D "cm32181";
 	indio_dev->modes =3D INDIO_DIRECT_MODE;
=20
 	ret =3D cm32181_reg_init(cm32181);
@@ -333,6 +371,8 @@ static int cm32181_probe(struct i2c_client *client)
 		return ret;
 	}
=20
+	indio_dev->name =3D cm32181->info->name;
+
 	ret =3D devm_iio_device_register(&client->dev, indio_dev);
 	if (ret) {
 		dev_err(&client->dev,
@@ -345,6 +385,7 @@ static int cm32181_probe(struct i2c_client *client)
 }
=20
 static const struct of_device_id cm32181_of_match[] =3D {
+	{ .compatible =3D "capella,cm3218" },
 	{ .compatible =3D "capella,cm32181" },
 	{ }
 };
--=20
2.26.0
