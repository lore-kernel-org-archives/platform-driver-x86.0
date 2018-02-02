From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 1/4] platform/x86: mlx-platform: Use defines for bus assignment
Date: Fri,  2 Feb 2018 08:45:45 +0000
Message-ID: <1517561148-38587-2-git-send-email-vadimp@mellanox.com>
References: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48912 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751129AbeBBGt3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Feb 2018 01:49:29 -0500
In-Reply-To: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

Add defines the bus Ids, used for hotplug devices topology in order to
improve code readability. Defines added for FAN and power units.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index dfecba4..a1ae93d 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -89,6 +89,13 @@
 /* Number of LPC attached MUX platform devices */
 #define MLXPLAT_CPLD_LPC_MUX_DEVS		2
 
+/* Hotplug devices adapter numbers */
+#define MLXPLAT_CPLD_PSU_DEFAULT_NR		10
+#define MLXPLAT_CPLD_FAN1_DEFAULT_NR		11
+#define MLXPLAT_CPLD_FAN2_DEFAULT_NR		12
+#define MLXPLAT_CPLD_FAN3_DEFAULT_NR		13
+#define MLXPLAT_CPLD_FAN4_DEFAULT_NR		14
+
 /* mlxplat_priv - platform private data
  * @pdev_i2c - i2c controller platform device
  * @pdev_mux - array of mux platform devices
@@ -190,14 +197,14 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_psu_items_data[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = BIT(0),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_psu[0],
-		.hpdev.nr = 10,
+		.hpdev.nr = MLXPLAT_CPLD_PSU_DEFAULT_NR,
 	},
 	{
 		.label = "psu2",
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = BIT(1),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_psu[1],
-		.hpdev.nr = 10,
+		.hpdev.nr = MLXPLAT_CPLD_PSU_DEFAULT_NR,
 	},
 };
 
@@ -207,14 +214,14 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_items_data[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = BIT(0),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[0],
-		.hpdev.nr = 10,
+		.hpdev.nr = MLXPLAT_CPLD_PSU_DEFAULT_NR,
 	},
 	{
 		.label = "pwr2",
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = BIT(1),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[1],
-		.hpdev.nr = 10,
+		.hpdev.nr = MLXPLAT_CPLD_PSU_DEFAULT_NR,
 	},
 };
 
@@ -224,28 +231,28 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_items_data[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = BIT(0),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_fan[0],
-		.hpdev.nr = 11,
+		.hpdev.nr = MLXPLAT_CPLD_FAN1_DEFAULT_NR,
 	},
 	{
 		.label = "fan2",
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = BIT(1),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_fan[1],
-		.hpdev.nr = 12,
+		.hpdev.nr = MLXPLAT_CPLD_FAN2_DEFAULT_NR,
 	},
 	{
 		.label = "fan3",
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = BIT(2),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_fan[2],
-		.hpdev.nr = 13,
+		.hpdev.nr = MLXPLAT_CPLD_FAN3_DEFAULT_NR,
 	},
 	{
 		.label = "fan4",
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = BIT(3),
 		.hpdev.brdinfo = &mlxplat_mlxcpld_fan[3],
-		.hpdev.nr = 14,
+		.hpdev.nr = MLXPLAT_CPLD_FAN4_DEFAULT_NR,
 	},
 };
 
-- 
2.1.4
