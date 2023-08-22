Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEF5EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjHVIRc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbjHVIRb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:17:31 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4DF12C
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWzxcX6byXV//ieGC8V03hGzH9JUcBfo0eZ5c2Gpjq3InBxoXphplnpGIgbbYKu1L9YYo+2VcdWLxYithgZeeeKrD5VaCgZAhfzdxHaIeJORFKlmhw28RdGrSH0M0Sp3S1T24mDbeKyteRCzmwUPzPoSeBbeCM61G85lk1j33tqkHbrQB7GCzotKQWAG86Z7NDslkotjb4gqyDIpqsB8etbNnw8YsATYE/C0Ib6lJAAMz3t6mbVurtrucK7E85EXVs0IpTKhQkhSk5jqai9fpojNKwcCsteMEh4O8hjRJqkRvdp5QwKhwNywZaHPvaMIerf2e2omCUZeoIguFOg6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xistev9Izxumc/W/GhwYaxs0jjZdP9ECFVeYZwHFSjg=;
 b=i2QeK/B37R4C9Mz8Q/Gpm3Xx4xwNLXhVcWmehVYY7+uO3rQ902v25h0Gy+5rqVFWJ/JpZ+z8t54xjItueOpeg4tblW5YPC3zkKO0wPNHYUWPUu+OfLL6h+J/XmDUWgxHYJckiLuyTuSVi6FjtPM+M4/w8BRT6NMAEsz/Yh7RNcErhBmtZ0cv1gS2zjckpPBZSuJh7N7LF56LPtRMJavffbXTae8Ph9461t/3/P+9qPXjAFLfT42jeyVzPmKRmA1/JC4b4KbMOLN9VT7diWsF0MU1Sp9/MWsDOl03YWaDDNUWSWPxaaf+MLBGLSplpcQ2CwhIzc/Z9WON104tAfLYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xistev9Izxumc/W/GhwYaxs0jjZdP9ECFVeYZwHFSjg=;
 b=BxsiQPE0Gb5DAdsnKcWBWyVMjDlSVI1LbJWjmUorwOc1gVwOdiAGp5o9NCslj7MOyaFj7SoYSYPBQfhu4jUAaSDOufgfQsFHlaaPpdZvCODMfkWoNsJoa4lKE2lZvXkSb3M17aavaJinq7mgxjhdNNkb7h0n15+1XbCuVvamTnpCPGfXZELguPBz7jFibpWYRT8xB3uFOGxugoQs+YIVX3FGMQ24XUFVu+UcoBlh4ozp+Esx0RBZzGHC075imLxkSRTt9CsiXpe7gHIzYy6iiNj8/vwoCKq2sOPNPS0OA7DFtXFOgopns3J+xbmJW56LoawYFCs60qoWD0Nv8z0+cA==
Received: from PH8PR20CA0019.namprd20.prod.outlook.com (2603:10b6:510:23c::25)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:17:28 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::a) by PH8PR20CA0019.outlook.office365.com
 (2603:10b6:510:23c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:17:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:17:15 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:17:10 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 12/16] platform: mellanox: mlx-platform: Get interrupt line through ACPI
Date:   Tue, 22 Aug 2023 08:13:31 +0000
Message-ID: <20230822081335.64344-13-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ca304d-56ef-4251-f761-08dba2e838e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dXOC5jr+3LR1bbN8MAphgwB2B3yaRLznWjCCOXy6XHawPuFwlS0df4HfzYY3nrcF2w1WEbae5KkbZ0KR/Xur+WosEH3vtmkbFqCfM6N4jKPgBCoZTngVUETWoERqf0zn/4s8hkdBfpqxFiry2fupTpvhz4+HCka7Rx5C92DjmyfpZwdvkoAorz/8c+B1yByo73b6VJGI/eeefx2XEPjY3v2ECDmCRY16WJnHFAI1+j4h7cBFIkAmSwu6gTWxsiNHmmKN9vwN3hnJKI7CgCwoRRrDwxru2E0jdGIlfwpzgxUQUV3Xl6qGc9KkBEHuKGk4CGPXPH60DTne+j9t9llN/pE3y7ayYAhUi2Ws+0IisWSOqNP8JHYbNZ6+Cspk/Wm2VRD0XNj0Z2zX/YWCU0d/yKuQAnNVCwRwHyrrjG6cRI8hhWZrIX8ZWXy2r4Vtf87j3rlN9dBVYZtmJ0hw7cfGt5nDv52dPJJsUM6g4v8NSN/kovb1VcmvZwl3mINQdWykMD77skByM63wZDsWQDnZg2jh2evqofDO4qbmJER3oN4UaKcQPKRP+yxK36AO4YhhilPkIfRieuu05rLcREcfiR7h+E0rwRu/kyyGAZ5ftK4LKT6ysnXy48IN/oQZ4Cuxj+AZoIAkCloUAIPzL4BGqeS0JcpQ3HoWtdh/Owhr5BZPeQTUX4ksG2TXqWqNEYSb1X4NIzqz0v9o34YYi9OkC9nTfLGo0xK8Hpb1FXN7X/90T07WqqEjj5czVIOFCkb
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:17:27.2645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ca304d-56ef-4251-f761-08dba2e838e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for getting system interrupt line from ACPI table.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v1->v2:
- Comments pointed out by Ilpo:
  - Remove ' acpi_dev ' declaration, move it to the previous patch.
---
 drivers/platform/x86/mlx-platform.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index feedfba0acf3..3eccb6628ccc 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -343,6 +343,7 @@
  * @hotplug_resources: system hotplug resources
  * @hotplug_resources_size: size of system hotplug resources
  * @hi2c_main_init_status: init status of I2C main bus
+ * @irq_fpga: FPGA IRQ number
  */
 struct mlxplat_priv {
 	struct platform_device *pdev_i2c;
@@ -356,6 +357,7 @@ struct mlxplat_priv {
 	struct resource *hotplug_resources;
 	unsigned int hotplug_resources_size;
 	u8 i2c_main_init_status;
+	int irq_fpga;
 };
 
 static struct platform_device *mlxplat_dev;
@@ -6188,6 +6190,8 @@ static int mlxplat_post_init(struct mlxplat_priv *priv)
 	/* Add hotplug driver */
 	if (mlxplat_hotplug) {
 		mlxplat_hotplug->regmap = priv->regmap;
+		if (priv->irq_fpga)
+			mlxplat_hotplug->irq = priv->irq_fpga;
 		priv->pdev_hotplug =
 		platform_device_register_resndata(&mlxplat_dev->dev,
 						  "mlxreg-hotplug", PLATFORM_DEVID_NONE,
@@ -6398,11 +6402,15 @@ static int mlxplat_probe(struct platform_device *pdev)
 	struct resource *hotplug_resources = NULL;
 	struct acpi_device *acpi_dev;
 	struct mlxplat_priv *priv;
-	int i, err;
+	int irq_fpga = 0, i, err;
 
 	acpi_dev = ACPI_COMPANION(&pdev->dev);
-	if (acpi_dev)
+	if (acpi_dev) {
+		irq_fpga = acpi_dev_gpio_irq_get(acpi_dev, 0);
+		if (irq_fpga < 0)
+			return -ENODEV;
 		mlxplat_dev = pdev;
+	}
 
 	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
 	if (err)
@@ -6417,6 +6425,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 	platform_set_drvdata(mlxplat_dev, priv);
 	priv->hotplug_resources = hotplug_resources;
 	priv->hotplug_resources_size = hotplug_resources_size;
+	priv->irq_fpga = irq_fpga;
 
 	if (!mlxplat_regmap_config)
 		mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config;
-- 
2.20.1

