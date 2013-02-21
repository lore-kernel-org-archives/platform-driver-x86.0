From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 3/6] Platform: x86: chromeos_laptop - Add isl light sensor for Pixel
Date: Thu, 21 Feb 2013 12:14:57 -0800
Message-ID: <1361477700-26342-4-git-send-email-bleung@chromium.org>
References: <1361477700-26342-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1361477700-26342-1-git-send-email-bleung@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: olofj@chromium.org, miletus@chromium.org, Benson Leung <bleung@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

The Chromebook Pixel uses an isl29023 ambient light sensor on the PANEL
GMBus.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/chromeos_laptop.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
index d585548..3e405d7 100644
--- a/drivers/platform/x86/chromeos_laptop.c
+++ b/drivers/platform/x86/chromeos_laptop.c
@@ -180,6 +180,14 @@ static int __init setup_isl29018_als(const struct dmi_system_id *id)
 	return 0;
 }
 
+static int __init setup_isl29023_als(const struct dmi_system_id *id)
+{
+	/* add isl29023 light sensor on Panel GMBus */
+	als = add_i2c_device("lightsensor", I2C_ADAPTER_PANEL,
+			     &isl_als_device);
+	return 0;
+}
+
 static int __init setup_tsl2583_als(const struct dmi_system_id *id)
 {
 	/* add tsl2583 light sensor on smbus */
@@ -212,6 +220,14 @@ static struct dmi_system_id __initdata chromeos_laptop_dmi_table[] = {
 		.callback = setup_isl29018_als,
 	},
 	{
+		.ident = "Chromebook Pixel - Light Sensor",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Link"),
+		},
+		.callback = setup_isl29023_als,
+	},
+	{
 		.ident = "Acer C7 Chromebook - Touchpad",
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Parrot"),
-- 
1.8.1.3
