From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 11/11] platform/x86: mlx-platform: Extend FAN platform data description
Date: Tue, 14 Jul 2020 15:02:03 +0300
Message-ID: <20200714120203.10352-12-vadimp@mellanox.com>
References: <20200714120203.10352-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714120203.10352-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Extend FAN platform data with register presence field.
Add register present entry per rotor (tachometer) description tuple.
The purpose is to allow indication of FAN presence.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 034736cec9a6..90bc7969b199 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1840,6 +1840,8 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(0),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+
 	},
 	{
 		.label = "tacho2",
@@ -1847,6 +1849,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(1),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho3",
@@ -1854,6 +1857,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(2),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho4",
@@ -1861,6 +1865,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(3),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho5",
@@ -1868,6 +1873,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(4),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho6",
@@ -1875,6 +1881,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(5),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho7",
@@ -1882,6 +1889,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(6),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho8",
@@ -1889,6 +1897,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
 		.bit = BIT(7),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho9",
@@ -1896,6 +1905,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET,
 		.bit = BIT(0),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho10",
@@ -1903,6 +1913,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET,
 		.bit = BIT(1),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho11",
@@ -1910,6 +1921,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET,
 		.bit = BIT(2),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "tacho12",
@@ -1917,6 +1929,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.mask = GENMASK(7, 0),
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET,
 		.bit = BIT(3),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
 	{
 		.label = "conf",
-- 
2.11.0
