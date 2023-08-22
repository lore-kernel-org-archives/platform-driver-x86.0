Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821E6EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbjHVLqb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbjHVLq3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:46:29 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE69E75
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSzz9gsdfex9xU/rNOj/3c9XGkLBcbq/vIs4yryyoZZC+WYlpytpf5sT1q7IvGyskM7gQbCJ9egUDSz4wIT4H5Pt+A51Fy2Mv3Sb5LOldzOZPZ4dWNxXaob+LD50EPn8Ub5QTywOQ0TbnLwbZJJMbRVnBqBBREpu62ty3M5LU5C5WE3KW3h9cAeOMbUnYNdcGQe0bA5ubXoe/t7UVBDK0r3eW8QS4N40ZchN2zPD2SqGdHKmh9ISgaza9wQemyPVuYRmaLqNnhn9Z2V4zhmccV5T7RsPSRh6hqd6QfTQPvvdXLuL5HM9MubRQfGnUhrEYB/g6/zU4PFnwUMW9QrUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVaDH3l6YCmzGYizfZ3Iu2nzeQXcFo3dN7vfj2hhFQg=;
 b=erWcIl4Fb0LOSX8CrEVNoM/xsQv6uPTcem/r2QNGJHyJYxYLzwqan5+UDVezvm6pQGIiI78ffxkamdkjMY9pV+xGo6VkfnVsHt7bCOP7/skk5O6WAWkYZClbyRNGNOKSybD416/TCBYREvKwoU3g7IAcgdX7zb1Ry5QjWcFYieNX9A4eLORM3TRxnazZ1RLocYOpp1tNboHW1DgZ/XB/JJi9Z7zvXwMvCzfFJsR7UL0+/w5fhkDyVBZJ6tVlrkJANkZel2lx+uZzJcxWUIDThiin4xXky1WRYgpaTeR9FW7SX89E4d6HOyBB9lkbCflGcbi+AU19GToDgG4trXzNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVaDH3l6YCmzGYizfZ3Iu2nzeQXcFo3dN7vfj2hhFQg=;
 b=QiVz4evquYx0fnQAx7AzxTHUgMUuwu6bXbdlwHEBujKX31ODJT3CAFuKHW4ndW7kt8B5BxcJzIZBK01SyJxK4+NoNyuSNET1UpJ7P7DO2LtjS+UCdKrr3OW6DMOe+YArdJF7+kcbhtdRC4uapVQ9kCgnQYrQ2MNn5nh62LEVJFuFvKkeyj/IaWD1pBA++ULF2gIW2XzZIqu12BJU6ztRQ7Ymjf3q2tkK8h7D1KFg3OPnLtAYwlDwTTnnPt9RRNoC/l18Yeuu4CVK3MW5YxzvFYo7T+FINZFjIOXTdvHVl0NfZksZHvvbfk2gscq/A0cEn7D7KjG5xD0Vq0eaaVUTzQ==
Received: from CY5PR10CA0006.namprd10.prod.outlook.com (2603:10b6:930:1c::6)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:38:36 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:1c:cafe::1f) by CY5PR10CA0006.outlook.office365.com
 (2603:10b6:930:1c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:38:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:38:24 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:38:22 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 12/16] platform: mellanox: mlx-platform: Get interrupt line through ACPI
Date:   Tue, 22 Aug 2023 11:34:47 +0000
Message-ID: <20230822113451.13785-13-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e9f6f2-ebf5-4fc9-b52a-08dba30452c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RiuvXAdNZpEL+jZhm2oA0c38bmwmUSQEBMvuRaQbDwHMrcUnMYDxFGGNm5cqzBS6490SxNhRmFG3AhFc85oh1Mrfee6gzM65K3GaR/CEdRR8/wqNckdLKsqdngv50bJ22RGGFtivQtMrxhwxIuGDTNMnsVy3NrBGkxDIrb3Hxfw5dJChAxxi+UKvv3rKmBRiJq6mX+MwA+3FLahhUdUo9owMEElYR9n0CVAPQD5ud5r8jV5OY15tEvQNeKQCyCShlzilFqwkSZuGEnIf1GzISriQXrqdROsenzn6wYX5vnb5T1q0L7cfaMoZ+B8kHYZgorRqSepFQ5DEM+qM5T4IddG1D75rEc2XtMmYzCKuuCEsIBpT2tLQ+yrfBrw0uXq8YUyxA0M4kf5x7i07NQgHnockAkmD9PTr3SRgRLRZPS4q7ezdY4kH6JZsgzXfMpSbse5+gnTGdJNYqA2vVq1alSs47HjXW2NldmYN9qNsUd62coGfJC3AtwcHxx/qcW2GCki8CLG5nm1SnIhuTxE0Z9Dd4OS3icbQPBeXYFSv8lqUtlOrcaqE75Xo6Z1f9tIFZ/vj4pcSPITGy04Dczihc9LeU2WXwgFvHhQDoh+GYtCQuCr6otgPUkYomJ+ird9pruxqfgJqAtFXh2BWDILqVlfQ/fUOJFAU2nr4SyIQHYkdL3Qanxjhpod5Em9SuRQOn4065FiNlVy7iKNRoPOeXHkDOgH98Uv2W0jq7W3yuO6Hn6SD2NK+xJk79d80nUcc
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(83380400001)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:38:36.5521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e9f6f2-ebf5-4fc9-b52a-08dba30452c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for getting system interrupt line from ACPI table.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

