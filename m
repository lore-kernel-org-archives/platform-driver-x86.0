From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 02/11] iio: light: cm32181: Add support for ACPI enumeration
Date: Tue, 28 Apr 2020 19:29:14 +0200
Message-ID: <20200428172923.567806-2-hdegoede@redhat.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200428172923.567806-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add support for ACPI enumeration, this has been tested on a HP
HP Pavilion x2 Detachable 10 (Bay Trail model).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- This is a new patch in v3 of this patch-set
---
 drivers/iio/light/cm32181.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index cc57190a24cb..5ca8bbf6667c 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -343,9 +343,18 @@ static const struct of_device_id cm32181_of_match[] =
=3D {
 };
 MODULE_DEVICE_TABLE(of, cm32181_of_match);
=20
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cm32181_acpi_match[] =3D {
+	{ "CPLM3218", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cm32181_acpi_match);
+#endif
+
 static struct i2c_driver cm32181_driver =3D {
 	.driver =3D {
 		.name	=3D "cm32181",
+		.acpi_match_table =3D ACPI_PTR(cm32181_acpi_match),
 		.of_match_table =3D of_match_ptr(cm32181_of_match),
 	},
 	.probe_new	=3D cm32181_probe,
--=20
2.26.0
