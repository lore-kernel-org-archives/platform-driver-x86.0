From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 2/3] platform/x86: mlx-platform: Add support for new  msn201x system type
Date: Fri,  9 Feb 2018 23:59:31 +0000
Message-ID: <1518220772-98492-3-git-send-email-vadimp@mellanox.com>
References: <1518220772-98492-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37850 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753114AbeBIWWX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Feb 2018 17:22:23 -0500
In-Reply-To: <1518220772-98492-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

It adds support for new Mellanox system types of basic half unit size
class msn201x, containing system MSN2010 (18x10GbE plus 4x4x25GbE) half
and its derivatives. This is the Top of the Rack system, equipped with
Mellanox Small Form Factor carrier board and switch board with Mellanox
Spectrum device, which supports Ethernet switching with 32X100G ports line
rate of up to EDR speed.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
v1->v2
  Comments pointed out by Darren:
  - Break the patch into series of patches per system type.
---
 drivers/platform/x86/mlx-platform.c | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 3a13285..e4251cf 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -438,6 +438,44 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn274x_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
+/* Platform hotplug MSN201x system family data */
+static struct mlxreg_core_data mlxplat_mlxcpld_msn201x_pwr_items_data[] = {
+	{
+		.label = "pwr1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "pwr2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(1),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
+	{
+		.data = mlxplat_mlxcpld_msn201x_pwr_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_pwr_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn201x_data = {
+	.items = mlxplat_mlxcpld_msn21xx_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
+};
+
 static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -581,6 +619,20 @@ static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
 	return 1;
 };
 
+static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
+		mlxplat_mux_data[i].values = mlxplat_msn21xx_channels;
+		mlxplat_mux_data[i].n_values =
+				ARRAY_SIZE(mlxplat_msn21xx_channels);
+	}
+	mlxplat_hotplug = &mlxplat_mlxcpld_msn201x_data;
+
+	return 1;
+};
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_msn274x_matched,
@@ -624,6 +676,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "MSN21"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_msn201x_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MSN201"),
+		},
+	},
 	{ }
 };
 
-- 
2.1.4
