From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 1/6] Platform: x86: chromeos_laptop - add i915 gmbuses to adapter names
Date: Thu, 21 Feb 2013 12:14:55 -0800
Message-ID: <1361477700-26342-2-git-send-email-bleung@chromium.org>
References: <1361477700-26342-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1361477700-26342-1-git-send-email-bleung@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: olofj@chromium.org, miletus@chromium.org, Benson Leung <bleung@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

Add the two other i2c buses (vga and panel) from i915.
Chromebook Pixel has input and light sensor devices on these busses.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/chromeos_laptop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
index bc6599c..d223592 100644
--- a/drivers/platform/x86/chromeos_laptop.c
+++ b/drivers/platform/x86/chromeos_laptop.c
@@ -34,11 +34,15 @@ static struct i2c_client *tp;
 
 const char *i2c_adapter_names[] = {
 	"SMBus I801 adapter",
+	"i915 gmbus vga",
+	"i915 gmbus panel",
 };
 
 /* Keep this enum consistent with i2c_adapter_names */
 enum i2c_adapter_type {
 	I2C_ADAPTER_SMBUS = 0,
+	I2C_ADAPTER_VGADDC,
+	I2C_ADAPTER_PANEL,
 };
 
 static struct i2c_board_info __initdata cyapa_device = {
-- 
1.8.1.3
