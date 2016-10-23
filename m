From: vadimp@mellanox.com
Subject: [patch v1] drivers/platform/x86: select hwmon for Mellanox hotplug driver in Kconfig
Date: Sun, 23 Oct 2016 12:45:27 +0000
Message-ID: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Vadim Pasternak <vadimp@mellanox.com>

Add select HWMON for mlxcpld-hotplug driver config, since it requires
hwmon APIs.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 65d9b04..1853769 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1032,6 +1032,7 @@ config MLX_CPLD_PLATFORM
 	tristate "Mellanox platform hotplug driver support"
 	default n
 	depends on MLX_PLATFORM
+	select HWMON
 	select I2C
 	---help---
 	  This driver handles hot-plug events for the power suppliers, power
-- 
2.1.4
