From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 2/6] Platform: x86: chromeos_laptop - Add a more general add_i2c_device
Date: Thu, 21 Feb 2013 12:14:56 -0800
Message-ID: <1361477700-26342-3-git-send-email-bleung@chromium.org>
References: <1361477700-26342-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1361477700-26342-1-git-send-email-bleung@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: olofj@chromium.org, miletus@chromium.org, Benson Leung <bleung@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

This will allow us to assign devices to buses by the type enum.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/chromeos_laptop.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
index d223592..d585548 100644
--- a/drivers/platform/x86/chromeos_laptop.c
+++ b/drivers/platform/x86/chromeos_laptop.c
@@ -148,16 +148,24 @@ static int __init find_i2c_adapter_num(enum i2c_adapter_type type)
  * info->addr.
  * Returns NULL if no device found.
  */
-static struct i2c_client __init *add_smbus_device(const char *name,
-						  struct i2c_board_info *info)
+static __init struct i2c_client *add_i2c_device(const char *name,
+						enum i2c_adapter_type type,
+						struct i2c_board_info *info)
 {
 	const unsigned short addr_list[] = { info->addr, I2C_CLIENT_END };
 	return __add_probed_i2c_device(name,
-				       find_i2c_adapter_num(I2C_ADAPTER_SMBUS),
+				       find_i2c_adapter_num(type),
 				       info,
 				       addr_list);
 }
 
+
+static struct i2c_client __init *add_smbus_device(const char *name,
+						  struct i2c_board_info *info)
+{
+	return add_i2c_device(name, I2C_ADAPTER_SMBUS, info);
+}
+
 static int __init setup_cyapa_smbus_tp(const struct dmi_system_id *id)
 {
 	/* add cyapa touchpad on smbus */
-- 
1.8.1.3
