From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 4/8] iio: light: cm32181: Change reg_init to use a bitmap of which registers to init
Date: Sun, 26 Apr 2020 13:02:52 +0200
Message-ID: <20200426110256.218186-4-hdegoede@redhat.com>
References: <20200426110256.218186-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200426110256.218186-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kevin Tsai <ktsai@capellamicro.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is a preparation patch for reading some ACPI tables which give
init values for multiple registers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/light/cm32181.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index e8be20d3902c..e31c1005b03d 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -26,7 +26,7 @@
 #define CM32181_REG_ADDR_ID		0x07
=20
 /* Number of Configurable Registers */
-#define CM32181_CONF_REG_NUM		0x01
+#define CM32181_CONF_REG_NUM		4
=20
 /* CMD register */
 #define CM32181_CMD_ALS_DISABLE		BIT(0)
@@ -53,10 +53,6 @@
=20
 #define SMBUS_ALERT_RESPONSE_ADDRESS	0x0c
=20
-static const u8 cm32181_reg[CM32181_CONF_REG_NUM] =3D {
-	CM32181_REG_ADDR_CMD,
-};
-
 /* CM3218 Family */
 static const int cm3218_als_it_bits[] =3D { 0, 1, 2, 3 };
 static const int cm3218_als_it_values[] =3D { 100000, 200000, 400000, 80=
0000 };
@@ -71,6 +67,7 @@ struct cm32181_chip {
 	struct i2c_client *client;
 	struct mutex lock;
 	u16 conf_regs[CM32181_CONF_REG_NUM];
+	int init_regs_bitmap;
 	int calibscale;
 	int num_als_it;
 	const int *als_it_bits;
@@ -117,14 +114,17 @@ static int cm32181_reg_init(struct cm32181_chip *cm=
32181)
 	/* Default Values */
 	cm32181->conf_regs[CM32181_REG_ADDR_CMD] =3D
 			CM32181_CMD_ALS_IT_DEFAULT | CM32181_CMD_ALS_SM_DEFAULT;
+	cm32181->init_regs_bitmap =3D BIT(CM32181_REG_ADDR_CMD);
 	cm32181->calibscale =3D CM32181_CALIBSCALE_DEFAULT;
=20
 	/* Initialize registers*/
 	for (i =3D 0; i < CM32181_CONF_REG_NUM; i++) {
-		ret =3D i2c_smbus_write_word_data(client, cm32181_reg[i],
-			cm32181->conf_regs[i]);
-		if (ret < 0)
-			return ret;
+		if (cm32181->init_regs_bitmap & BIT(i)) {
+			ret =3D i2c_smbus_write_word_data(client, i,
+							cm32181->conf_regs[i]);
+			if (ret < 0)
+				return ret;
+		}
 	}
=20
 	return 0;
--=20
2.26.0
