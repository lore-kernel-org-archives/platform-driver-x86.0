From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 4/4] Platform: x86: chromeos_laptop - Add Taos tsl2583 device
Date: Fri,  1 Feb 2013 14:34:46 -0800
Message-ID: <1359758086-2320-5-git-send-email-bleung@chromium.org>
References: <1359758086-2320-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359758086-2320-1-git-send-email-bleung@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, olofj@chromium.org, olof@lixom.net
List-Id: platform-driver-x86.vger.kernel.org

The Samsung Series 5 Chromebook is equipped with  a Taos tsl2583
light sensor. Instatiate it here.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/chromeos_laptop.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
index 188b7da..95bf94f 100644
--- a/drivers/platform/x86/chromeos_laptop.c
+++ b/drivers/platform/x86/chromeos_laptop.c
@@ -50,6 +50,10 @@ static struct i2c_board_info __initdata isl_als_device = {
 	I2C_BOARD_INFO("isl29018", ISL_ALS_I2C_ADDR),
 };
 
+static struct i2c_board_info __initdata tsl2583_als_device = {
+	I2C_BOARD_INFO("tsl2583", TAOS_ALS_I2C_ADDR),
+};
+
 static struct i2c_board_info __initdata tsl2563_als_device = {
 	I2C_BOARD_INFO("tsl2563", TAOS_ALS_I2C_ADDR),
 };
@@ -164,6 +168,13 @@ static int __init setup_isl29018_als(const struct dmi_system_id *id)
 	return 0;
 }
 
+static int __init setup_tsl2583_als(const struct dmi_system_id *id)
+{
+	/* add tsl2583 light sensor on smbus */
+	als = add_smbus_device(NULL, &tsl2583_als_device);
+	return 0;
+}
+
 static int __init setup_tsl2563_als(const struct dmi_system_id *id)
 {
 	/* add tsl2563 light sensor on smbus */
@@ -196,6 +207,13 @@ static struct dmi_system_id __initdata chromeos_laptop_dmi_table[] = {
 		.callback = setup_cyapa_smbus_tp,
 	},
 	{
+		.ident = "Samsung Series 5 - Light Sensor",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alex"),
+		},
+		.callback = setup_tsl2583_als,
+	},
+	{
 		.ident = "Cr-48 - Light Sensor",
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Mario"),
-- 
1.8.1
