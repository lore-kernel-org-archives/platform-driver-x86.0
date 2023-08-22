Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1101EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjHVLsn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235326AbjHVLsm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:48:42 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4876E72
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpz4grliHpaMPE48+Ja0k/0sg44MRhG9UQCSq01W6GQlPMWX/5u9ekm24BBB+K6f5PGrTn7YEotgmGbJWdtntogx7yB3WX2AXq/tCCsGHnNuLJ51wG5H+CFoR1ZevS9Ic8dqpfVsMKDoOkwJaUHX5w1MmZMVYCTtqxZ4ZssDmWNPNWBYxcFOJSHcKapeBEBTWXotXeUVO5NxR7TPCaIwV8psIho9hKfGKs4ZmKveuQlxeERophlUCa9citFNuGh92xsvlNyHfFh0/4SS39EVqDggMu5gnVb/V/puIR7iHR3RU90+ySQw46UGtPCg1rEEHw7e3EOuarI+XJzaLNeX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ty1oAnfeE1ymby9aStHD3LmVLTAPCGrj96L938BHIPc=;
 b=ZRYwzRY/xKxpgGwrv6dov2i/L4FDbjkpSZZjmGU9TnTgLD5dgU0Qj0Zf/jiojpiHvxGIQrIhsC6mFfh0j7qjai0c7gBFkKUcHvfes1sRKfIBoi1QXQdkYZRjPv2Ao4VzjZsXk6ptqKac5VrW5mCYOd7BF60uE4MAFG3tJiD1BW445QFcbvzkmtHIbd7ys/hUxTWSphlOHvKfhwIjEDfcw0l3yptpYLfsXJBQnASKHLkCVTZEP3f8eVLTB09TNdDFINwlUDw4t8r7mBTG93DtCWqyK3Acb9QUvWI8HFfOJB4yMJKErjyJSuTI/OMqWWVarYZEhzArCLwgi5/ARBR4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ty1oAnfeE1ymby9aStHD3LmVLTAPCGrj96L938BHIPc=;
 b=YLKjI3EW3FzJaJHYo4/N8iUA8gaWx42pq8Opbm7TgSuvv5q8MiaxteFtzngRH1zTZR6StaZZnccs7s07iItW9sP6hbOzLVG3yOYnfgLnHSvepG919DVNxFDT+BtKf87iKJfyciL8LAIFRf8KYGb8jkq8O7/K33kfWvKbZZT7OxKSceAb4SRzE6YAJ4Mk7Gf+tPqsYhmnPDNilrpC3jNBpYDxVyEHxwckjF6bHh+8NupBa8p02vdCP+anqsHecS3rgHsoM8BsqlaWbmOpvDS+9S0ES4zatyKbU5mB7HTCbnOjHfCCwzYSkwoPQx0jTJgHcevaUKN8yNxYMhUGtKvNyg==
Received: from SN7PR04CA0021.namprd04.prod.outlook.com (2603:10b6:806:f2::26)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:38:41 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::91) by SN7PR04CA0021.outlook.office365.com
 (2603:10b6:806:f2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 11:38:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:38:27 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:38:26 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 13/16] platform: mellanox: Add initial support for PCIe based programming logic device
Date:   Tue, 22 Aug 2023 11:34:48 +0000
Message-ID: <20230822113451.13785-14-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d2a070-229d-453c-fd84-08dba304559d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gjz5g3tUuq08nZTHysy2/PR9e4Zd2nFPU5wIC8U5dvuMdc7EY4Sdk4zsVUrn8TKvlA3s+v9zol4pPXNrJSg/y+waTjymhUADXI4EjufJN4yE3UotdNNNSQ6GJepfx8MlMk2cMz0gbaeM+xKv6mtzRK8dEhshUIR0GQEoN8Ot04FHIuy528w2qZYa5ZQvpN3aa6pky6pD4+0Hyb8fzC7dEFI+YrD5R+ZSYvJ/NGSDCHo2cP/4FV6dVZsXGjr1/E7tx3cd2AruUaPLMu0BRAU7Ls3tU/Df106hMcVzNCruu5JAsuIfIhrqkjJfUtEbMXJjTpIvfrh7eQAj1znMCBsAG+5V9nR5GTfa3FfsdJ4rvoXaV0XGzEB4AkaBbh2O2bARXGgpUJ3dxAcx/jBqXNYBG0kD20+Ou+xA9COLjy1HLWsqBrWUSbBawb2kJ6e5HLbELR328BDWpqo0Y7QKiqIkD5SGZLcwwgb8qTDSHCW2LZsVusaHHo+LSQK6cXbK1nhhiLd1OXPQv++zZo9LfJPvhLMm5WOzR3RqaNb41irFvZXaeIUo49Q076CDGqj6F9eCuOmC6XDNgUe67yioH8Dn6BleJqCjkj0YxA26q1mUMyKiBw3HPe0VIpcqdXOk0oImfujEeF4V86uUhglzE9syj3ldHn/bvfKsVfgBD3IjAHyuS0Ypc0005Mfar7cINvH0EeO4sSLuQS3z1ga8ykYgUXPrXLCEgnXiLs0l6SalxAxvw0u6jyG4+rensRf/tdM6
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(83380400001)(66574015)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:38:41.3265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d2a070-229d-453c-fd84-08dba304559d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

