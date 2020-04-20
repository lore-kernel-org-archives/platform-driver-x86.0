From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: surface3_power: i2c_acpi_new_device() returns a PTR_ERR
Date: Tue, 21 Apr 2020 00:04:21 +0200
Message-ID: <20200420220421.171298-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

i2c_acpi_new_device() never returns NULL, it either returns an i2c_client
or a PTR_ERR. Adjust the mshw0011_probe() error handling to take this
into account.

Note the goto out_err will cause i2c_unregister_device() to get called
even though the i2c_acpi_new_device() fails, this is ok as it accepts
a NULL pointer argument (and treats it as a no-op).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/surface3_power.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86=
/surface3_power.c
index 946ac2dc08ae..32e6e86e27dd 100644
--- a/drivers/platform/x86/surface3_power.c
+++ b/drivers/platform/x86/surface3_power.c
@@ -522,8 +522,10 @@ static int mshw0011_probe(struct i2c_client *client)
 	strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
=20
 	bat0 =3D i2c_acpi_new_device(dev, 1, &board_info);
-	if (!bat0)
-		return -ENOMEM;
+	if (IS_ERR(bat0)) {
+		error =3D PTR_ERR(bat0);
+		goto out_err;
+	}
=20
 	data->bat0 =3D bat0;
 	i2c_set_clientdata(bat0, data);
--=20
2.26.0
