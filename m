Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77813C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjHNUib (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjHNUiA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:38:00 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC2310F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3jMhje5IbfasGZMLWW1dBGCxeJ9JE5pLcVQd3Oe3x/uKi5gj6Z5CnGFv08h2AaYxy3wTWC+gO1W+HTaWuJLcajGeq+JSW8/b38lcznVua0037ZBSZqquamldX9XlFL+/dkFU+2/MAUThoTfewi2Lc1qEJNtpCX2TcskEFsoobYp7rcW9euaW0INWhSDCPcoMmC0dEn7VXL147EPMaz1waOOAHZNCkEWcuBmQkdNlgp1LErEhemnUg4QhgsxNDJZK4GbNoHMR2slJ+WrjKHU2XYwM6ewCHkoUxU0VPlxqohmedOhzjX6XHwHuPRwZyI/hcO1c72jzjs1j+/vF9N2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H697fOHosdF2du9HPqI1Q1eHv9gKyw+7NQTJlNEQceE=;
 b=IOqi0rlJpSrJJh/TL352vGCUPpTa7lWSedrF4+c52yLQTv0+Ja73z6ID2eFpOcmikB1c7i1sJMCSg/Kck9zCJyp+89r0tVmmtscJNTL4/kImtNy3NtyrmE0Cs/QS8/WosX79mOzrub8E41jq85WH5+b5C0fomizE7tqbD0kIcZ8ZAGhtFhaisv4UgnZLSiLfTp1pTYh4r0TFN1EVSedZxZ4KnbzNGdLbA52vbEExvZqcu8UhsrHa/4zmDXEi7CX7jb0Wnt6P86h96GLicZz0QPyvMwOe9C0jxcD7eGx2ReygFbABWlk3Y7sKYiEqF9rLZL/371A5f8tjdMqxBpFbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H697fOHosdF2du9HPqI1Q1eHv9gKyw+7NQTJlNEQceE=;
 b=d2aDV8q1mRnJI356BuUf0MWubW+5cBAGspaCLDIWAFYTE6LxAu3F8kPOgo6RX1EPNNTowWpsFh/B+hOBgZv+cyL59U1ybd3fM+jNOMRPYxg1iYB0vfkUGduT9ZOye9EXAdS2LXZ0VD0IA7+x5708RSLBLwcvP/xM5qCeU7Es8ZIYaUjLCOdEpUrsW0L8bRN/OpcOCb6eb8L+kwdrtL6MyL5Xy89xiEVZYUvuEoCMdQRUWTWFEOYLbqDJWjrO37LxJquq4DIsvrsny9057cRwtF6TPqY0+lUKsjqtoH6LMxbdPCYvSGgufW1fkqF1wWPwOWJhdx687z5C5srizxeXxw==
Received: from MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::27)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:37:57 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::35) by MW4P220CA0022.outlook.office365.com
 (2603:10b6:303:115::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:37:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:37:43 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:37:41 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 12/16] platform: mellanox: mlx-platform: Get interrupt line through ACPI
Date:   Mon, 14 Aug 2023 20:34:02 +0000
Message-ID: <20230814203406.12399-13-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: db9f48b9-9348-4879-bf65-08db9d0657f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s17SHkiv5KwikCL78ousoF1b/6rWsM+FwFWXlic9+a5Sx1SqXcBOtZRVKIPA91plZzaBxo4cJxTOWGylLRLxJTTg2FUfC+yeiG82Xlxr2JqczzPlX/4JIBDwFMZFcKz1sFjc8kIkxuW2YkGvy0Ay9c6IIn5z72eMuNL5UdtvCDcWIY8tS1bnwhlYHWmvAhl+x3u9cDjeetKg6Hql1s6IRPPqkb3vHp+53D0rTB3kqdexN5OBAFFITKVJ/5/1U+GuHUYj8O8pBLO7XN70WHDiDkWqf+K1nmfJlJ5mlFsGd3GwxEDe57aGV4G1bw8ftCHzK6OWO4ZZbotRO8XNmQJ4HvDvOe3x/Xeu3xDHhJIUTC28TlLUWZK+EYWicqHxw9VI/d2InAOsPou2qbHUXkELHTbJuf4eyJ9awNFfUMhS9zCYNTiwS5W2LqQRn+LP1wxLlo7j8eOu0CZO8PqtTTdKQh4woedwaWnYxOFMV2bLOz2xRC/Goz/dMGjYex/XjQ1YAv3j5x3IicDjFM2T3KUyVWA77cBVYQQ95tMBhQx3TRoD1tOYGKF3/1hhVCGEWRB9vLO6N6ZYf7viKq5P7NeYhLeYtVaQ6Xc7D1J9ZssrBIz8x5U1rucKlDnKwDLYHAPf2G8MGjrWgpuWyMN5Uhv73kJCKgX2kT7WTNZ6ieUIirqFn+z0K2iq/FMxf/eE62c444OqdupUj8bw+MSPu1ieDRaz38Wih5gq22zBLyk0U1mLk6ONQYj6s0YNhqFvHpqZ
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(82310400008)(451199021)(1800799006)(186006)(46966006)(40470700004)(36840700001)(40480700001)(54906003)(6666004)(478600001)(40460700003)(7636003)(356005)(82740400003)(2906002)(5660300002)(36756003)(86362001)(4326008)(6916009)(70586007)(70206006)(41300700001)(336012)(8936002)(8676002)(316002)(16526019)(107886003)(1076003)(26005)(36860700001)(83380400001)(47076005)(2616005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:37:57.2451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9f48b9-9348-4879-bf65-08db9d0657f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for getting system interrupt line from ACPI table.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v0->v2:
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

