Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685BCC41513
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbjHNJDm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236147AbjHNJDJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:03:09 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::602])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD34199E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCPjbU/UcaNSzcJIAqmJyTXRZwB6r6+XeVg95Sp17QsYrE5eCuUakTI5x4uRQ0o8NPiWotrdLvbBj7rK79MIPjF8UHVlDauKsUYsgttzTb2r0DluH+0ddR+L5tEbVnYcMoD8pgfihP8PC0LGpew86uzeRALCRA3pKbbGbCP3w/sCNR6vkFj++zO8Rqo1kd8p3dItWw0uXL2sMBvuYaTikxHOigTO1Ew4diM/h32lsTeVl/tjudO6p3ji/qAptFm/7lV7WRTbonj9fHrWz7uDzjfthrbBok/LPXsnG/Y0AGfmyxY1lO2oBH86D7XfIjnZNQnEmZ924+x/ZAuD/ca/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk6OFUz+T9evPk//wvLYS7BbFza/pvWfb39Mi5hAS1k=;
 b=bjqfRR/OGLPwK9mU3sFdnX86k1pEzq6GayfFht6miwRXWa/smMT2yDW9lXagdLR4N6oOA4dWFR8ZQQE2xfCnOR8ShmoY4X5Md0Yji41EflimghhD5GY1USvtxvNUhdsg8ulLqa4ANV35EtXT2LJZbMOMbncJ1YK2myK9IDkVpDnduTVu+C69A7hTFwihe2Gg1a7pUOrJ3580qYnbdjeRdg4/JLU0vM1M7pNt64r/RUeb8JIOMy0d/0h8Mmisy24MGou62nrED4ZRFmOoahpG0vt7qv527MEr5rfZRiS+gjEMEMXCC3ghy4nZ65gdMMyVBhTf6qirA/oDCYUeX4V7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk6OFUz+T9evPk//wvLYS7BbFza/pvWfb39Mi5hAS1k=;
 b=Ph24P7N1gA7M5pYEgEbIYPIIwEFOJsYjNkb8rHYR98Zgq2S4xTD1zsjhBLiTBvvbu/rfm8XvAac3v3KoU7HRnccdVX6ZXdmHWiDG3kOxc6WXkFvNeFxXWr32H3IJHehmQ/1LVWpj72OnyB3Frcy7ePRURYzM9qOXHGkFxiNjaLb70L9aribL3cQE2ZxNnHeGThQjG+LkOsm5y/jkzOVlPUu0WjaV1hOjqTDWEa+Y4x4RJPHnX+cyAhUb1Gi7m9RIre6/S9JjlmiMN2xWdrFhJVOwBD+g97rtfMRqh5PsOsfHtWWh9f+RUhSToA7cTxScCjv5k7eYqM67SxuKMxEZdg==
Received: from MW4PR04CA0362.namprd04.prod.outlook.com (2603:10b6:303:81::7)
 by PH7PR12MB8105.namprd12.prod.outlook.com (2603:10b6:510:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Mon, 14 Aug
 2023 09:02:58 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::74) by MW4PR04CA0362.outlook.office365.com
 (2603:10b6:303:81::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:02:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:02:43 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:02:42 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 12/16] platform: mellanox: mlx-platform: Get interrupt line through ACPI
Date:   Mon, 14 Aug 2023 08:59:06 +0000
Message-ID: <20230814085910.56069-13-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|PH7PR12MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f075ca-4d71-434e-ef23-08db9ca5412f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXJeZriIqzPwpxaAvgtp9/Icl1UpTtLMRYQKL5l38LeIC/pOCP40haGyki8bFNJGodOYlx7Fi4/6cPnma8v+jVHmRGZ9E3gLKTL7VTaqr8/HHA5mC3/EEbP+b6aeE22cM1RtEBdZc5KWcduNVgGcZjImDNe9MRGPSTOERy/UpWN/ESx8Ab2ibTgHSQMH9XNp0vR5xp2gagD6tX0/Va8umvEb/rLwT7i4r9zHAHpVpPaX0Hd5hvmPJO1R1/KBX+ZC6PchaulLxX6dyUnNd6mJ3cF/wXQjc6wbILjNEQlYfZ63qSE7EZppj5nwK8zpscD+cn82Q75On/w8+r1BWDiqRVHln/TGRlo969IwWJPs41bjkB9digXh7k6MrZFj2BAFjwx/Ka+dZbtTZEPcVnyYi5f/c+E5q/YjDJlbtQx4e0vXL4SGtQSMkR3WM/nAub1dGHZRzirNMzM2W6g7RYf3O9LXsaIMay0NQ35yoASmFzTXGgq10C1YS00RT4iwUQmqNuCahIxe2ahpoK8zx2em1eekeotrnulc1L/ZedQAjn5JNnL+Pe3ARsd+mn910DQZfA6jpn5j+i+GZkVRMhaEReFCSfvL0QPgDYpjVWja/Lb+yFLt9TU4l+qBcqmIApADj7fMaNIUrVM4RXhSZHpp/keOmqnk1Fxi2OgPYR9tv5kCHZjH+VRW2vSbeH4jPYR7l9PRokLZ/OaifHtSwauJm3zAEuks7eJy4aCFHrghSMwTLaneZLs3gYtkynHhnUol
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(186006)(82310400008)(1800799006)(36840700001)(46966006)(40470700004)(1076003)(2616005)(107886003)(6666004)(36860700001)(36756003)(47076005)(86362001)(40480700001)(356005)(7636003)(82740400003)(16526019)(83380400001)(336012)(26005)(316002)(426003)(40460700003)(54906003)(41300700001)(6916009)(8676002)(4326008)(8936002)(70586007)(70206006)(5660300002)(2906002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:02:57.9316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f075ca-4d71-434e-ef23-08db9ca5412f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8105
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for getting system interrupt line from ACPI table.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index e2226c218a54..a70b86e60721 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -342,6 +342,7 @@
  * @hotplug_resources: system hotplug resources
  * @hotplug_resources_size: size of system hotplug resources
  * @hi2c_main_init_status: init status of I2C main bus
+ * @irq_fpga: FPGA IRQ number
  */
 struct mlxplat_priv {
 	struct platform_device *pdev_i2c;
@@ -355,6 +356,7 @@ struct mlxplat_priv {
 	struct resource *hotplug_resources;
 	unsigned int hotplug_resources_size;
 	u8 i2c_main_init_status;
+	int irq_fpga;
 };
 
 static struct platform_device *mlxplat_dev;
@@ -6187,6 +6189,8 @@ static int mlxplat_post_init(struct mlxplat_priv *priv)
 	/* Add hotplug driver */
 	if (mlxplat_hotplug) {
 		mlxplat_hotplug->regmap = priv->regmap;
+		if (priv->irq_fpga)
+			mlxplat_hotplug->irq = priv->irq_fpga;
 		priv->pdev_hotplug =
 		platform_device_register_resndata(&mlxplat_dev->dev,
 						  "mlxreg-hotplug", PLATFORM_DEVID_NONE,
@@ -6395,11 +6399,17 @@ static int mlxplat_probe(struct platform_device *pdev)
 {
 	unsigned int hotplug_resources_size = 0;
 	struct resource *hotplug_resources = NULL;
+	struct acpi_device *acpi_dev;
 	struct mlxplat_priv *priv;
-	int i, err;
+	int irq_fpga = 0, i, err;
 
-	if (ACPI_COMPANION(&pdev->dev))
+	acpi_dev = ACPI_COMPANION(&pdev->dev);
+	if (acpi_dev) {
+		irq_fpga = acpi_dev_gpio_irq_get(acpi_dev, 0);
+		if (irq_fpga < 0)
+			return -ENODEV;
 		mlxplat_dev = pdev;
+	}
 
 	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
 	if (err)
@@ -6414,6 +6424,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 	platform_set_drvdata(mlxplat_dev, priv);
 	priv->hotplug_resources = hotplug_resources;
 	priv->hotplug_resources_size = hotplug_resources_size;
+	priv->irq_fpga = irq_fpga;
 
 	if (!mlxplat_regmap_config)
 		mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config;
-- 
2.20.1

