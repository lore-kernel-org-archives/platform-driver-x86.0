From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] Platform: OLPC: add SPI MODULE_DEVICE_TABLE
Date: Tue, 23 Jul 2019 11:20:22 +0200
Message-ID: <20190723092022.1758072-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: platform-driver-x86.vger.kernel.org

The SPI bus creates a device with the modalias of "xo1.75-ec". This
fixes XO-1.75 EC driver autoloading

Fixes: 0c3d931b3ab9 ("Platform: OLPC: Add XO-1.75 EC driver")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/platform/olpc/olpc-xo175-ec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olp=
c/olpc-xo175-ec.c
index aee8975bea90d..8ec9092af0bed 100644
--- a/drivers/platform/olpc/olpc-xo175-ec.c
+++ b/drivers/platform/olpc/olpc-xo175-ec.c
@@ -749,6 +749,12 @@ static const struct of_device_id olpc_xo175_ec_of_ma=
tch[] =3D {
 };
 MODULE_DEVICE_TABLE(of, olpc_xo175_ec_of_match);
=20
+static const struct spi_device_id olpc_xo175_ec_id_table[] =3D {
+	{ "xo1.75-ec", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, olpc_xo175_ec_id_table);
+
 static struct spi_driver olpc_xo175_ec_spi_driver =3D {
 	.driver =3D {
 		.name	=3D "olpc-xo175-ec",
--=20
2.21.0
