From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 05/11] iio: light: cm32181: Clean up the probe function a bit
Date: Tue, 28 Apr 2020 19:29:17 +0200
Message-ID: <20200428172923.567806-5-hdegoede@redhat.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200428172923.567806-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

3 small cleanups to cm32181_probe():

1. Do not log an error when we fail to allocate memory (as a general
rule drivers do not log errors for this as the kernel will already
have complained loudly that it could not alloc the mem).

2. Remove the i2c_set_clientdata() call, we never use i2c_get_clientdata(=
)
or dev_get_drvdata() anywhere.

3. Add a dev helper variable and use it in various places instead of
&client->dev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- This is a new patch in v3 of this patch-set
---
 drivers/iio/light/cm32181.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index 065bc7a11f84..8fe49610fc26 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -326,41 +326,35 @@ static const struct iio_info cm32181_info =3D {
=20
 static int cm32181_probe(struct i2c_client *client)
 {
+	struct device *dev =3D &client->dev;
 	struct cm32181_chip *cm32181;
 	struct iio_dev *indio_dev;
 	int ret;
=20
-	indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*cm32181));
-	if (!indio_dev) {
-		dev_err(&client->dev, "devm_iio_device_alloc failed\n");
+	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*cm32181));
+	if (!indio_dev)
 		return -ENOMEM;
-	}
=20
 	cm32181 =3D iio_priv(indio_dev);
-	i2c_set_clientdata(client, indio_dev);
 	cm32181->client =3D client;
=20
 	mutex_init(&cm32181->lock);
-	indio_dev->dev.parent =3D &client->dev;
+	indio_dev->dev.parent =3D dev;
 	indio_dev->channels =3D cm32181_channels;
 	indio_dev->num_channels =3D ARRAY_SIZE(cm32181_channels);
 	indio_dev->info =3D &cm32181_info;
-	indio_dev->name =3D dev_name(&client->dev);
+	indio_dev->name =3D dev_name(dev);
 	indio_dev->modes =3D INDIO_DIRECT_MODE;
=20
 	ret =3D cm32181_reg_init(cm32181);
 	if (ret) {
-		dev_err(&client->dev,
-			"%s: register init failed\n",
-			__func__);
+		dev_err(dev, "%s: register init failed\n", __func__);
 		return ret;
 	}
=20
-	ret =3D devm_iio_device_register(&client->dev, indio_dev);
+	ret =3D devm_iio_device_register(dev, indio_dev);
 	if (ret) {
-		dev_err(&client->dev,
-			"%s: regist device failed\n",
-			__func__);
+		dev_err(dev, "%s: regist device failed\n", __func__);
 		return ret;
 	}
=20
--=20
2.26.0
