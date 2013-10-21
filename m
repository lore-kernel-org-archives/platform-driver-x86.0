From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 6/6] Platform: x86: chromeos_laptop - Add Acer C720
Date: Sun, 20 Oct 2013 20:58:29 -0700
Message-ID: <1382327909-6140-7-git-send-email-bleung@chromium.org>
References: <1382327909-6140-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382327909-6140-1-git-send-email-bleung@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, adurbin@chromium.org, dlaurie@chromium.org, olofj@chromium.org, enselic@gmail.com
Cc: bleung@chromium.org
List-Id: platform-driver-x86.vger.kernel.org

Add the Acer C720 entries for trackpad and light sensor.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/chromeos_laptop.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
index a9ab335..6e2e7fd 100644
--- a/drivers/platform/x86/chromeos_laptop.c
+++ b/drivers/platform/x86/chromeos_laptop.c
@@ -385,6 +385,15 @@ static struct chromeos_laptop hp_chromebook_14 = {
 	},
 };
 
+static struct chromeos_laptop acer_c720 = {
+	.i2c_peripherals = {
+		/* Light Sensor. */
+		{ .add = setup_isl29018_als, I2C_ADAPTER_I2C1 },
+		/* Touchpad. */
+		{ .add = setup_cyapa_tp, I2C_ADAPTER_I2C0 },
+	},
+};
+
 static struct chromeos_laptop acer_c7_chromebook = {
 	.i2c_peripherals = {
 		/* Touchpad. */
@@ -449,6 +458,13 @@ static struct dmi_system_id chromeos_laptop_dmi_table[] __initdata = {
 		_CBDD(hp_chromebook_14),
 	},
 	{
+		.ident = "Acer C720",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Peppy"),
+		},
+		_CBDD(acer_c720),
+	},
+	{
 		.ident = "Acer C7 Chromebook",
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Parrot"),
-- 
1.8.3.2
