From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 6/8] iio: light: cm32181: Make lux_per_bit and lux_per_bit_base_it runtime settings
Date: Mon, 27 Apr 2020 17:50:35 +0200
Message-ID: <20200427155037.218390-6-hdegoede@redhat.com>
References: <20200427155037.218390-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200427155037.218390-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Make lux_per_bit and lux_per_bit_base_it settings stored in struct
cm32181_chip instead of a hardcoded (defined) values.

This is a preparation patch for reading some ACPI tables which specify
a device specific lux_per_bit value.

Reviewed-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/iio/light/cm32181.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index ebdbc7f865f3..92f99cbb5cc1 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -69,6 +69,8 @@ struct cm32181_chip {
 	u16 conf_regs[CM32181_CONF_REG_NUM];
 	unsigned long init_regs_bitmap;
 	int calibscale;
+	int lux_per_bit;
+	int lux_per_bit_base_it;
 	int num_als_it;
 	const int *als_it_bits;
 	const int *als_it_values;
@@ -116,6 +118,8 @@ static int cm32181_reg_init(struct cm32181_chip *cm32=
181)
 			CM32181_CMD_ALS_IT_DEFAULT | CM32181_CMD_ALS_SM_DEFAULT;
 	cm32181->init_regs_bitmap =3D BIT(CM32181_REG_ADDR_CMD);
 	cm32181->calibscale =3D CM32181_CALIBSCALE_DEFAULT;
+	cm32181->lux_per_bit =3D CM32181_LUX_PER_BIT;
+	cm32181->lux_per_bit_base_it =3D CM32181_LUX_PER_BIT_BASE_IT;
=20
 	/* Initialize registers*/
 	for_each_set_bit(i, &cm32181->init_regs_bitmap, CM32181_CONF_REG_NUM) {
@@ -212,8 +216,8 @@ static int cm32181_get_lux(struct cm32181_chip *cm321=
81)
 	if (ret < 0)
 		return -EINVAL;
=20
-	lux =3D CM32181_LUX_PER_BIT;
-	lux *=3D CM32181_LUX_PER_BIT_BASE_IT;
+	lux =3D cm32181->lux_per_bit;
+	lux *=3D cm32181->lux_per_bit_base_it;
 	lux =3D div_u64(lux, als_it);
=20
 	ret =3D i2c_smbus_read_word_data(client, CM32181_REG_ADDR_ALS);
--=20
2.26.0
