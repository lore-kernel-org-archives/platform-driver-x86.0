From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 01/11] iio: light: cm32181: Switch to new style i2c-driver probe function
Date: Tue, 28 Apr 2020 19:29:13 +0200
Message-ID: <20200428172923.567806-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Switch to the new style i2c-driver probe_new probe function and drop the
unnecessary i2c_device_id table (we do not have any old style board files
using this).

This is a preparation patch for adding ACPI binding support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- This is a new patch in v3 of this patch-set
---
 drivers/iio/light/cm32181.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index 5f4fb5674fa0..cc57190a24cb 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -294,8 +294,7 @@ static const struct iio_info cm32181_info =3D {
 	.attrs			=3D &cm32181_attribute_group,
 };
=20
-static int cm32181_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int cm32181_probe(struct i2c_client *client)
 {
 	struct cm32181_chip *cm32181;
 	struct iio_dev *indio_dev;
@@ -316,7 +315,7 @@ static int cm32181_probe(struct i2c_client *client,
 	indio_dev->channels =3D cm32181_channels;
 	indio_dev->num_channels =3D ARRAY_SIZE(cm32181_channels);
 	indio_dev->info =3D &cm32181_info;
-	indio_dev->name =3D id->name;
+	indio_dev->name =3D dev_name(&client->dev);
 	indio_dev->modes =3D INDIO_DIRECT_MODE;
=20
 	ret =3D cm32181_reg_init(cm32181);
@@ -338,13 +337,6 @@ static int cm32181_probe(struct i2c_client *client,
 	return 0;
 }
=20
-static const struct i2c_device_id cm32181_id[] =3D {
-	{ "cm32181", 0 },
-	{ }
-};
-
-MODULE_DEVICE_TABLE(i2c, cm32181_id);
-
 static const struct of_device_id cm32181_of_match[] =3D {
 	{ .compatible =3D "capella,cm32181" },
 	{ }
@@ -356,8 +348,7 @@ static struct i2c_driver cm32181_driver =3D {
 		.name	=3D "cm32181",
 		.of_match_table =3D of_match_ptr(cm32181_of_match),
 	},
-	.id_table       =3D cm32181_id,
-	.probe		=3D cm32181_probe,
+	.probe_new	=3D cm32181_probe,
 };
=20
 module_i2c_driver(cm32181_driver);
--=20
2.26.0
