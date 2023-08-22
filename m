Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA94EE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233762AbjHVIRj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbjHVIRf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:17:35 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23491193
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvrUYl4dhmpYUeHHikz+nifw9iwI9nBlUvidCdrNr0cvh68baL6E3LXeiH9EEa3EloYG4q9qaNHHzuUVewEnH6O3wfesA44IMpz3yBvzN7UbM345rbLdsNjj0Z6M9ieaN5qqu8NOuhYxzsil7GFaA4wA1E4rR2dUlopT0oa6trZ4MPJtSl2VeO5fPibzxxADyySDAv3QRT8j9crts7r54Y5QRp2kIVs2ZMyYvjdVw4GC4a/KWAaWXD3f+4wMZmbbKeamuCbbwHQEWZbHuXa3Y1uJBmqPVhTEWr1m8vfptMHxXJcCzSiT8RmeCEIcsg/i4O2D3/4rC4pKlvNUtiTiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DshEXWTk16tr4K/XnMIMrFCUzJG4WwmKG/W2+00d+qc=;
 b=dZlxm3M9uPJwu6KJet6OCJDa+afUkolHQqTEml5+P2kb24pOoKozq8oCo3ypxmO/vTimOatehUe6ay9S9VPn/2mj+5CdhY50+StrQ7LAMXDNYtH9L0NBHHLoJkYxz9UXcR5XIWI31TF122CbWprzs8MwZ55MnpBoQ11sCocNOPYJSrV/81LrndwbigUIfGfS2dGaODoYIHIHx4VlA0ZrDDFP5k3Yscu6+2mD+c4glLAdQ39LfUMRsM0xQeVEVr3JD6pEqX0dLSC9de4bXnqVR6SeNTLbUID06GGneq6NfD6nfMCDCNZmt66HDTv/xi7SindAX5HKDPzq5eM7NcMx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DshEXWTk16tr4K/XnMIMrFCUzJG4WwmKG/W2+00d+qc=;
 b=EX4cjF+W2Gt/aP2wMarSxFv1IGJwTNpmbvHLtUyX6Y4/I4HZVMkgcnTuNFxwcPjINp30mYiB0S7smwV/TgfxscxU18XI2PZ0FiaS+tiJl9Wue33wGMv7IcOMYHyBLUYhr0jdY1Mi9TvSQxvPzqnx7eVxH+go0iF7AB6L1CVMfrySj+NcGm50rruLhVna8ausYreU6xi/KSGzFYwevR0oweK++JZDqTOhe0QonXjnqTvhH5pC5Tc7rShG6ryOPylQ+1IwWkML4d4LKtH0CqG6lbZ8a5uxuNVlZpsZ5ZofXg7CyrMIx79+cfB1s8QaGU0SuA2X+nvzAddyrJWkdHbLZw==
Received: from PH8PR20CA0004.namprd20.prod.outlook.com (2603:10b6:510:23c::12)
 by MW3PR12MB4364.namprd12.prod.outlook.com (2603:10b6:303:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:17:31 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::2a) by PH8PR20CA0004.outlook.office365.com
 (2603:10b6:510:23c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:17:30 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:17:18 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:17:16 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 13/16] platform: mellanox: Add initial support for PCIe based programming logic device
Date:   Tue, 22 Aug 2023 08:13:32 +0000
Message-ID: <20230822081335.64344-14-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|MW3PR12MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efab694-607a-4a0c-9186-08dba2e83ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45/q9rZPNA4b5tWr1pIM1/BdDPi7ZWWjWCvzpx1ggpax7vP/2w14DkOVDgVqWF+SVQkDEA6cQWBPGVa1yF+yU41JOVgpL+uVD/orcyzsRpIiGl+YqGVS4T84Ob0NXOelFU/9ytRB2ypmycYf0FaAuOzS3I4IIx7CkWlZXVMxWZs8mVG52xVl7l0v6vjAhjqcdX93X+kz/dswnbn7+wgzLMYVEGhk2+YsWIbigd0kZwT39tWNoIczb1lR+quxZMILefZF2b0eFSXc73KXo6Wdy2EiIAQgX0aOqfiOsLpQwXYR3N046U1aoJ39VYcV0ArW2R3eVUHO36QZ28TXynoh1GF4s1DAAl7xkw37zuVn0Uftp0SkXGkBM6DwpPkXk1/4bjT5WKVruzhqv3elkQwAAeNvsbHap/kA4HOAWDIBdSiTP7/56iaKtS6jxAiR6qcI1QXIBedW/X6G7yzJhkVn31/iiv2WglILLKdO+lV6qOTHA+0CqofUU8PJ4SOGswCzs5ofkjjb1p10sl1AVvT04pG5qW4Ne4aCp6dzV6rKNyoj4uYlTBLwc91qd0hwchRtYnCAPHMULoebVkdGf0AeBBgFwdkGQOoPJShrosoUEXZClTbCSPUxsmBFUBcf+4onhV5K2DnA5TsOzH2eE3FHNXs1x+0S/pdKOCwypy2oyES614G5zq8KoZAXzGplNiGAkLPkgsy33Z5ZytTMHWIfHSxVl9qnOn0ctVrXW7tDUvVN/n5GVzN27XbZquyI5CCW
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:17:30.6239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efab694-607a-4a0c-9186-08dba2e83ae8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4364
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend driver to support logic implemented by FPGA device connected
through PCIe bus.

The motivation two support new generation of Nvidia COME module
equipped with Lattice LFD2NX-40 FPGA device.

In order to support new Nvidia COME module FPGA device driver
initialization flow is modified. In case FPGA device is detected,
system resources are to be mapped to this device, otherwise system
resources are to be mapped same as it has been done before for Lattice
LPC based CPLD.

FPGA device is associated with three PCIe devices:
- PCIe-LPC bridge for main register space access.
- PCIe-I2C bridge for I2C controller access.
- PCIe-JTAG bridge for JTAG access.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
- Comments pointed out by Ilpo:
  - Suggested to use common label name in
    mlxplat_pci_fpga_device_init() to avoid labels duplication.
- Vadim: I would prefer to follow the convention we are keeping
  in the driver to have consistent code.
---
 drivers/platform/x86/mlx-platform.c | 134 +++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 3eccb6628ccc..44f107965832 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -12,6 +12,7 @@
 #include <linux/i2c-mux.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/i2c-mux-reg.h>
 #include <linux/platform_data/mlxreg.h>
@@ -331,6 +332,12 @@
 #define MLXPLAT_I2C_MAIN_BUS_NOTIFIED		0x01
 #define MLXPLAT_I2C_MAIN_BUS_HANDLE_CREATED	0x02
 
+/* Lattice FPGA PCI configuration */
+#define PCI_VENDOR_ID_LATTICE			0x1204
+#define PCI_DEVICE_ID_LATTICE_I2C_BRIDGE	0x9c2f
+#define PCI_DEVICE_ID_LATTICE_JTAG_BRIDGE	0x9c30
+#define PCI_DEVICE_ID_LATTICE_LPC_BRIDGE	0x9c32
+
 /* mlxplat_priv - platform private data
  * @pdev_i2c - i2c controller platform device
  * @pdev_mux - array of mux platform devices
@@ -362,6 +369,7 @@ struct mlxplat_priv {
 
 static struct platform_device *mlxplat_dev;
 static int mlxplat_i2c_main_complition_notify(void *handle, int id);
+static void __iomem *i2c_bridge_addr, *jtag_bridge_addr;
 
 /* Regions for LPC I2C controller and LPC base register space */
 static const struct resource mlxplat_lpc_resources[] = {
@@ -5544,6 +5552,9 @@ static struct mlxreg_core_platform_data *mlxplat_fan;
 static struct mlxreg_core_platform_data
 	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
 static const struct regmap_config *mlxplat_regmap_config;
+static struct pci_dev *lpc_bridge;
+static struct pci_dev *i2c_bridge;
+static struct pci_dev *jtag_bridge;
 
 /* Platform default reset function */
 static int mlxplat_reboot_notifier(struct notifier_block *nb, unsigned long action, void *unused)
@@ -6172,15 +6183,131 @@ static void mlxplat_lpc_cpld_device_exit(void)
 {
 }
 
+static int
+mlxplat_pci_fpga_device_init(unsigned int device, const char *res_name, struct pci_dev **pci_bridge,
+			     void __iomem **pci_bridge_addr)
+{
+	void __iomem *pci_mem_addr;
+	struct pci_dev *pci_dev;
+	int err;
+
+	pci_dev = pci_get_device(PCI_VENDOR_ID_LATTICE, device, NULL);
+	if (!pci_dev)
+		return -ENODEV;
+
+	err = pci_enable_device(pci_dev);
+	if (err) {
+		dev_err(&pci_dev->dev, "pci_enable_device failed with error %d\n", err);
+		goto fail_pci_enable_device;
+	}
+
+	err = pci_request_region(pci_dev, 0, res_name);
+	if (err) {
+		dev_err(&pci_dev->dev, "pci_request_regions failed with error %d\n", err);
+		goto fail_pci_request_regions;
+	}
+
+	err = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(64));
+	if (err) {
+		err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
+		if (err) {
+			dev_err(&pci_dev->dev, "dma_set_mask failed with error %d\n", err);
+			goto fail_pci_set_dma_mask;
+		}
+	}
+
+	pci_set_master(pci_dev);
+
+	pci_mem_addr = devm_ioremap(&pci_dev->dev, pci_resource_start(pci_dev, 0),
+				    pci_resource_len(pci_dev, 0));
+	if (!pci_mem_addr) {
+		dev_err(&mlxplat_dev->dev, "ioremap failed\n");
+		err = -EIO;
+		goto fail_ioremap;
+	}
+
+	*pci_bridge = pci_dev;
+	*pci_bridge_addr = pci_mem_addr;
+
+	return 0;
+
+fail_ioremap:
+fail_pci_set_dma_mask:
+	pci_release_regions(pci_dev);
+fail_pci_request_regions:
+	pci_disable_device(pci_dev);
+fail_pci_enable_device:
+	return err;
+}
+
+static void
+mlxplat_pci_fpga_device_exit(struct pci_dev *pci_bridge,
+			     void __iomem *pci_bridge_addr)
+{
+	iounmap(pci_bridge_addr);
+	pci_release_regions(pci_bridge);
+	pci_disable_device(pci_bridge);
+}
+
+static int
+mlxplat_pci_fpga_devices_init(struct resource **hotplug_resources,
+			      unsigned int *hotplug_resources_size)
+{
+	int err;
+
+	err = mlxplat_pci_fpga_device_init(PCI_DEVICE_ID_LATTICE_LPC_BRIDGE,
+					   "mlxplat_lpc_bridge", &lpc_bridge,
+					   &mlxplat_mlxcpld_regmap_ctx.base);
+	if (err)
+		goto mlxplat_pci_fpga_device_init_lpc_fail;
+
+	err = mlxplat_pci_fpga_device_init(PCI_DEVICE_ID_LATTICE_I2C_BRIDGE,
+					   "mlxplat_i2c_bridge", &i2c_bridge,
+					    &i2c_bridge_addr);
+	if (err)
+		goto mlxplat_pci_fpga_device_init_i2c_fail;
+
+	err = mlxplat_pci_fpga_device_init(PCI_DEVICE_ID_LATTICE_JTAG_BRIDGE,
+					   "mlxplat_jtag_bridge", &jtag_bridge,
+					    &jtag_bridge_addr);
+	if (err)
+		goto mlxplat_pci_fpga_device_init_jtag_fail;
+
+	return 0;
+
+mlxplat_pci_fpga_device_init_jtag_fail:
+	mlxplat_pci_fpga_device_exit(i2c_bridge, i2c_bridge_addr);
+mlxplat_pci_fpga_device_init_i2c_fail:
+	mlxplat_pci_fpga_device_exit(lpc_bridge, mlxplat_mlxcpld_regmap_ctx.base);
+mlxplat_pci_fpga_device_init_lpc_fail:
+	return err;
+}
+
+static void mlxplat_pci_fpga_devices_exit(void)
+{
+	mlxplat_pci_fpga_device_exit(jtag_bridge, jtag_bridge_addr);
+	mlxplat_pci_fpga_device_exit(i2c_bridge, i2c_bridge_addr);
+	mlxplat_pci_fpga_device_exit(lpc_bridge, mlxplat_mlxcpld_regmap_ctx.base);
+}
+
 static int
 mlxplat_pre_init(struct resource **hotplug_resources, unsigned int *hotplug_resources_size)
 {
-	return mlxplat_lpc_cpld_device_init(hotplug_resources, hotplug_resources_size);
+	int err;
+
+	err = mlxplat_pci_fpga_devices_init(hotplug_resources, hotplug_resources_size);
+	if (err == -ENODEV)
+		return mlxplat_lpc_cpld_device_init(hotplug_resources, hotplug_resources_size);
+
+	return err;
 }
 
 static void mlxplat_post_exit(void)
 {
-	mlxplat_lpc_cpld_device_exit();
+	if (lpc_bridge)
+		mlxplat_pci_fpga_devices_exit();
+	else
+		mlxplat_lpc_cpld_device_exit();
 }
 
 static int mlxplat_post_init(struct mlxplat_priv *priv)
@@ -6366,6 +6493,9 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
 	mlxplat_i2c->regmap = priv->regmap;
 	mlxplat_i2c->handle = priv;
 
+	/* Set mapped base address of I2C-LPC bridge over PCIe */
+	if (lpc_bridge)
+		mlxplat_i2c->addr = i2c_bridge_addr;
 	priv->pdev_i2c = platform_device_register_resndata(&mlxplat_dev->dev, "i2c_mlxcpld",
 							   nr, priv->hotplug_resources,
 							   priv->hotplug_resources_size,
-- 
2.20.1

