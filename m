Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DB0C41513
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbjHNUic (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjHNUiD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:38:03 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163A7AA
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPf/tu6buzlSESCj6HSOUXYJ8DwAX1jzgXxbDazPrTdotwcWouiqcKhoXGCKubLExn+xMRNP5jsiUukucZ+mupxRFs8ZOBDSbwBcva8/WAshsp/H1VwxT2h+MdRM20cuxgF423k7O5/K+0DcQlDeVDIQANfsFIZLl5SrqmjJ05n185J65txJgZpjXg1kMHhNPbmQF9dTvKgqVuVnItPPKYJUT0tKJxZ5i9MpAxy28zDMyt2h0/QRqoFRM3HF8SwtfvSs2qepGk924RDyBQs0QvK9zGHATAlYKZzCrmQWO/OnixrOlGgdbWwVa5YkX3s8GjjmbM1v8RfhAlRHNE83Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiyUzbLRS5ZQJYCHQ3tEhHF6vg02O5Ti/TKo1T3+m6w=;
 b=fiKdeMNr9gxNwNII1izh44AkPnf87PqIuITI3xkR5BTCKn/XfP0sI4oXQs9AIbW9rNjwJoupuWFsCOqKHhGQ7uxq68n1VVRj1ypTfph2bZCZYfSKGmM9eQoHA4CSwVl6OGJcDCYfqESgS/tX+R1nPU7Gr/fwsBRu5mCAnnGDleNPOGqHq/LRjGVVoqzIQ4GELBXsKV7pR2mL+WFwI6vOuDSaGEnG4bc7FLWvpsMbPjRWohr+3g+HyNdyXWBXSaNJ7OMtL/Yr6fPPgZHDu8gKLnCX0eMdDx078qba6AL7D1CMwDZOOtmfWIx6a44SIO1DITk5ctIbbi3cXMNXR+zn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiyUzbLRS5ZQJYCHQ3tEhHF6vg02O5Ti/TKo1T3+m6w=;
 b=co047Kg1R3bHYBmrXUW9AI+h0Ydh1PSRZZn4UYcqBUcmEw3EYYBKUoY2+4sAN1MT3Aifi/+BHXb13SfShmFx5BW0lWpAJE28BxNY9p7oEpgCp5YwEdd+ZgqMEzrfEu7KL4bGvFnNcWpxcH4Z/uOSSSAB3JgpIdqS3QmqCcqyQaUZKvmGOUvkXXDcKTbf5Fm/4rYiz30GRFKH22QSW65dofhzfMLWlWOnpHzcKtNDTh4vjlaflCobTpVP+PF1grE0SqLBRaqIEWnQzinVAtLNnD3xztffPzNcKrKJzWMw8j+vucEbEOePQgk6tdEkB1frlQNiVFoOQFnKWD34+ZJxQg==
Received: from BY5PR13CA0007.namprd13.prod.outlook.com (2603:10b6:a03:180::20)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:38:00 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::d6) by BY5PR13CA0007.outlook.office365.com
 (2603:10b6:a03:180::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.12 via Frontend
 Transport; Mon, 14 Aug 2023 20:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:37:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:37:46 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:37:44 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 13/16] platform: mellanox: Add initial support for PCIe based programming logic device
Date:   Mon, 14 Aug 2023 20:34:03 +0000
Message-ID: <20230814203406.12399-14-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814203406.12399-1-vadimp@nvidia.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 57553883-3b1f-4ece-3849-08db9d06594b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VK5yE0RwuNQSIWH1FbFheVPSe/419VeT04ylqw+rB6InlCI9EvuU/MONEDD48tC+eXWDkhYwZ0PMMVs7sKhlGDJiN/JLtr5pyxEakwA9nZxfbNgqKqcYJbYLsEbDJZ39SK47kkq87377DNqN1CjTX7eETvec7wjbQSrBvMxp1ycNA5Z/mBqkHZmbKNzcMTEhNZOQkV+n09VPljAicAgmF4Qk8PtrwKTUA6D64qlUs9AidzPApnZ0u7LxmDAUunLLoP/z5K1r1WBAvnvBr29Gqz90b9J1Akfr6gtE4rul4UeZxeJD8Tfpub/Ta3kxHTD2p7mSIbY3N1R7UDFHgvQ/ENO0owRVY2Vf6tSkOlE8lBmfJLuUiDFSTFirPNd+0dZysq2+/5x2gLFGPav/ELtZnpCTAzBvYChHztaTwMnZ2hVQsjQYStlqAkK8K6+01V+OY9lxFEWVD8z4I6tM811GEya+IGiJkqfuz+SN6dReHuvpVblN3lO6pqrCRzajSDj3IMpMiKoIZm/BKTB/X/QwJFyT2Y7DZ4BNlmDrm2LbsC8hzN4UrO0A9CJtv8+2JMzNBe0WoX+z66yd5WIsiD76evrWtnyu+OYptE+o2wQ8R4UOcW4QraaNJvajnZjSI5TTJ8qawP4Wm7oV3kIHyG5f4i+/869HuA/xBDEATRfU4EHQySi3wD/kQvU9hRk0msZmOV8dHw7tKJrFe6e+3t5pZzVKQ1ABXZEyAk2KdfZdvu35fekdNayqZLJOetqyhByC
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(82310400008)(186006)(1800799006)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(82740400003)(356005)(7636003)(36756003)(86362001)(40460700003)(6666004)(478600001)(2906002)(1076003)(2616005)(107886003)(26005)(70206006)(426003)(336012)(83380400001)(16526019)(316002)(54906003)(41300700001)(70586007)(6916009)(5660300002)(8676002)(8936002)(4326008)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:37:59.5429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57553883-3b1f-4ece-3849-08db9d06594b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E3.namprd02.prod.outlook.com
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

