Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228F0EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbjHNJDo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbjHNJDM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:03:12 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AAD10FE
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIBL84t4XrrMVnQLlMrvS2KuV1UrECRLXnG9p4x2WCFirUG+k9sfvuH5JCz8U56wamghsxPz4bqimsnd0SpcHCYIKGtk8kOKPdiaAMJwzWZg1JQeqi/6/lcZm3fPfbO/ob6au/pmo7AJKdxAy9+rQl2b8c//T2xyXhJgakhdNC5Ak7Il2gRlm4/GAADdJHVPM+fduvseSlN7AMBuguNpptgmB5l2vAjlIsBwr66g/StAUyb6WSdbsj7yVr3neBDsVHi4lDSjr2zohbuY5JmM2MQ62Kgia3KWGxh4lX6pXzyWsq0qTNn4qnnTk7WWbvnKneauUzSB6VcL3araiwOJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feaiOH5/j+dRihcLFMdKP+tDk3dBKrf4I77a80EZdtk=;
 b=elkCqGsHu9mF1Eq1A6wQNZKRGVVA57oHV5kZLvWFTMzWRUEeMz2d56DfQyf434hwNcoJeapKmppUnJR1Oj5Js2d+l2eu7P850oXLPT0dZubdf5rUg9e93tAe40CHjhI1WqCKAiwpFRO0576C/FDHlpSz7E9gR70eNsJ8bjJ5PPgwj0vMapk6IxysxCyYmfBl7wgfXhjm9fO97YuOiiFBzsHRYnh40eF0SmPp0CF4B8CiN91SgljIINb+yoSwkQhsECcdLkvKJ70wRhGHwzU8sXeh4wVd2kAWLdDFyn+qf1G5uTQTj1OMPJFLnLtIHymGPh1ZE4nqlu8NoGw0VIpvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feaiOH5/j+dRihcLFMdKP+tDk3dBKrf4I77a80EZdtk=;
 b=VkNIjMQJl+f/CFqHmnooYhZG4adbRW5t3nJtE/mmvu4J8SOyktlEaBeIaHPQ4wAV+3TFa1sENkzZk+P1AhJ9/TjUz5RSmWrMJRHpFcDM4y5pHcU816+O5VRbCTZQ1cZn1/tPPCV/EJr4jV+HEqlt6cAlo6Xfk4hl0WFqBlbYTldfLDWUZL0ELaIXqoxxtTqdGHoPWL/w6kAbC/rkTi0OYZs34f406UO3RrEt4Xn9AoCzwHJDsbLneXmGYLoNF+XjSDCu5i/oNFJMeEQeU5SS1cTetOM91imZSfTveRxOinMELjCSTDq2y0XaGe8X2KL7Kp7WIoj8sIRsul3GFv1BqQ==
Received: from BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48) by
 LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:03:03 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a02:80:cafe::50) by BYAPR01CA0035.outlook.office365.com
 (2603:10b6:a02:80::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:03:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:03:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:02:46 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:02:45 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 13/16] platform: mellanox: Add initial support for PCIe based programming logic device
Date:   Mon, 14 Aug 2023 08:59:07 +0000
Message-ID: <20230814085910.56069-14-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814085910.56069-1-vadimp@nvidia.com>
References: <20230814085910.56069-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afd42fb-6e87-4202-3672-08db9ca543fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38imAJzNdG/Q12b3qhikQhm/dMe8Qy9NekLjDRmjISVt4z49UgeWCJa8DZfQwAAZfK0X9L/ydH4jm7L6vbnGyE+3MRdnU2RQKz1wxduVTGyLJhLm1avwoJsJkW0/Cf6BVmHH1Mb8zwIYbKQu8DkvBNRvFTcNNJPBIhvXWTLl6aWZKkSG4fy0WWNyzP5WRgcfzAG8Rs6tcT1fo/pC7xMRkel85kFLly5Rp0jRXmdFbGa9Fzy/7vtLmayE70Y5Og0mkTCvmiJSBmzcIwxxjFwOI0jflZxr198hR+/waD+FYdtViMjy5jlgJZgne2/nJO1neXTasC1SdIHo+NA5Su2E0BP4NppZZpaBTQ9wvWbAOjC7SBBAoDACpSwYCYuEJVZ1chkcDSXEXdp9YVtVHgW9NQno/gbcLUrTIBnYJl7EHmkyiv1wW72JRbgeNxcNtHy/oZxGdPrZZUtqu/nKUJsH3S0pYYC1xqMPGIs1rgWWKNHYyu+1SgogjRtAeIuZG/U/wcH+c6NX2K9gVM8sAJpQ+8kLtFgsMQWLH/J7f/ZkIsst563/Zw9WXNdPJXXqFnrWffg4tCnldNwPXW9sQ0cxyM9j3URTEBb2+oEXVNVpZNDMEhP4ZVdt5+fV9McMGCBbAFBZTWuYPHhrbQuziPgw9K1F4hS3iIKNkOcjWKAJmV4oRDg9xoVhbWwlR0UMrQQqOOmmCJJTshfNl7BPPjQcn34KXjPHbN5XJTCTUvNLKGIUFrj+8BDOF/hUuKC32Iu5
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(82310400008)(186006)(1800799006)(36840700001)(40470700004)(46966006)(40460700003)(6666004)(70206006)(70586007)(478600001)(47076005)(83380400001)(36860700001)(16526019)(36756003)(86362001)(2906002)(40480700001)(426003)(1076003)(26005)(107886003)(336012)(2616005)(82740400003)(356005)(7636003)(316002)(4326008)(8676002)(6916009)(54906003)(5660300002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:03:02.6127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afd42fb-6e87-4202-3672-08db9ca543fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266
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
 drivers/platform/x86/mlx-platform.c | 134 +++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index a70b86e60721..d60f7470e208 100644
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
@@ -330,6 +331,12 @@
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
@@ -361,6 +368,7 @@ struct mlxplat_priv {
 
 static struct platform_device *mlxplat_dev;
 static int mlxplat_i2c_main_complition_notify(void *handle, int id);
+static void __iomem *i2c_bridge_addr, *jtag_bridge_addr;
 
 /* Regions for LPC I2C controller and LPC base register space */
 static const struct resource mlxplat_lpc_resources[] = {
@@ -5543,6 +5551,9 @@ static struct mlxreg_core_platform_data *mlxplat_fan;
 static struct mlxreg_core_platform_data
 	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
 static const struct regmap_config *mlxplat_regmap_config;
+static struct pci_dev *lpc_bridge;
+static struct pci_dev *i2c_bridge;
+static struct pci_dev *jtag_bridge;
 
 /* Platform default reset function */
 static int mlxplat_reboot_notifier(struct notifier_block *nb, unsigned long action, void *unused)
@@ -6171,15 +6182,131 @@ static void mlxplat_lpc_cpld_device_exit(void)
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
@@ -6365,6 +6492,9 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
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

