From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 09/11] iio: light: cm32181: Make lux_per_bit and lux_per_bit_base_it runtime settings
Date: Tue, 28 Apr 2020 19:29:21 +0200
Message-ID: <20200428172923.567806-9-hdegoede@redhat.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200428172923.567806-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Make lux_per_bit and lux_per_bit_base_it settings stored in struct
cm32181_chip instead of a hardcoded (defined) values.

This is a preparation patch for reading some ACPI tables which specify
a device specific lux_per_bit value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/light/cm32181.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index 1ad7d4582d1c..cae2264e4336 100644
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
@@ -114,6 +116,8 @@ static int cm32181_reg_init(struct cm32181_chip *cm32=
181)
 			CM32181_CMD_ALS_IT_DEFAULT | CM32181_CMD_ALS_SM_DEFAULT;
 	cm32181->init_regs_bitmap =3D BIT(CM32181_REG_ADDR_CMD);
 	cm32181->calibscale =3D CM32181_CALIBSCALE_DEFAULT;
+	cm32181->lux_per_bit =3D CM32181_LUX_PER_BIT;
+	cm32181->lux_per_bit_base_it =3D CM32181_LUX_PER_BIT_BASE_IT;
=20
 	/* Initialize registers*/
 	for_each_set_bit(i, &cm32181->init_regs_bitmap, CM32181_CONF_REG_NUM) {
@@ -210,8 +214,8 @@ static int cm32181_get_lux(struct cm32181_chip *cm321=
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
