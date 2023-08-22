Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769A4EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjHVLkL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjHVLkL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:40:11 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90418CCA
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu6DSuElzxu6Maf5zVQ8XAp5WxAoNxUyyklR+g9/T59YocBHxHTgf/3TovZd5L08Ot5zofAxAOHQJU1fZ7KmczO/u5POZGWiMJHikzO6bReM3CNofz+YNnI4P37ld4eGttSWzzpzw4i0ndIhvzKNdk/JNeCQtzwW0ocLg6MkUufrN+eRLK+J8+mqc4zHfwT62DCRsNDVTgVVb8RYlzXX1w9jdwE1hE3lQJNGMKNrbt/wUZY2OaOA1REJnivPUz7Uk4dOwoeBwP1vubGcYDGwBgaGt5OCbotS/GvuRcUutaYU/rgnJkAWOgUdL/3aNTATjSmrAK+D6TpCzRiUgDjmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ntpxKUPN2YmVfyhSpjAI84egtDdXhK0u3SMrGBdcAM=;
 b=AWKQzpIozQaJyjNcIxRSsyiTI3Ol9B3y2jE44h+wuYNio9Rcu5iBHTR0Lgx92bUIa+DwHaXBiVYIDkBFHV8B/yCWl1ATBlSq80dW/v9sqTwzgu4wjaA+MdkqEviqXrvYbnrNtbn28XcJlppcprVnqbQNsKtzS11wAWnhQMujjw98eJ2hH3m/oDAfk05kZi4srED8O1uRlwIH8j9gtL1UTtXDf62nPGOoq/1er4OQMydvOvek/A/i6UUDbTpM7uyPV8fMzrfGfP5cf7uLGeRrCruy6aiXFiaKYx1WHSY3WjtLxIDvfBf74JHQvj+pwh0lmzV2VDHjbOlPp3itjUgpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ntpxKUPN2YmVfyhSpjAI84egtDdXhK0u3SMrGBdcAM=;
 b=kETl5vVSYILKWFl8aPMcFeRCYiJ9R7QbKaDkW2XbTj9/XkRDrdplIbe/op3RN6ClW96sbgKajlIge/4c7ivWtMTjCaPBu0qzp+Uibc4z6YDtR7fel5dPyRDHapPiAkw23i9ibsT/RFOBagRxXEESp5HcOaudA5fD/craWaCUOUZ/XvpndOWIMJF2u9HbqP8235o4dBJHi0v+nLJbBv4/fxgvUrgW9rM4IeYw2EvCT8NIrDGxUb3pxszNuZhDx6k5p/6gJg1Bus8ExjA5T+dl0v8JDNDdNhmvz+iaXqAHPEfx8hgsDlC2r2b6nnCQAvTnzaj75HAr92VqpONFsSb/qA==
Received: from SA1P222CA0103.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::7)
 by DM4PR12MB5312.namprd12.prod.outlook.com (2603:10b6:5:39d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:38:36 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:3c5:cafe::19) by SA1P222CA0103.outlook.office365.com
 (2603:10b6:806:3c5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 11:38:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:38:21 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:38:19 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 11/16] platform: mellanox: mlx-platform: Introduce ACPI init flow
Date:   Tue, 22 Aug 2023 11:34:46 +0000
Message-ID: <20230822113451.13785-12-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DM4PR12MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 758f0daa-88c9-4492-2f8a-08dba30452b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Itvs7YL0ZTKgBL9besHEfBTDCAHU/tm1ywHxbMoH6NZHqHh9gLanug9b/VOFC+z6gn6Syk/j0sp9X1UiN7AOknUwsHdRljsj7uHD2lVWBnzMtmVNZf6sQ4SyTIYFgHbkUFxbb8Bx+ujzt0MYPUPIkvrvK6uxtpGg4SD8Vxnm5UFRG+pTTs1B14W1DCnYX64SlqqPXBNSqHRwwb0mirX4jKyi6lDopsw54hAjzu8MI5/G3j3JpTbXsurcFv7x/XxujtpjwvyhGJXGjakHojbe+P5j9Rcw8xUNr9xiYLJvjPWlmpPsaDCnsC2EyCnhjnOLFONfun4yzTI/2LIGNKFNmxjWXq68Oh9np7Ws80BQARgYsAHYgN4Op0o2QYB2aB06bk/UCMTAnl+gqACD/AA8tQu1QA2+he3ieYDlhSlM2MptFjxQnLJQT6j8mqnCcCVgDHOZ2KLmRIBEzZvXrf5ZfQNbrslzjs2eeJ9kiS8+IQqtq57D8zFJCe7L3Y7u6yCP9LBcd1fwEAjLQd70/b29WT6RE1NAz6Cy1ibaDyEqHrna6zNl3TUF+JgTeFjVz6cqCbksW6slaTJugjibygE9BOmE1cRwe9F9xXkTJoFye00J6a6UhI8vuOVMxlUyZKSSZw3f+GoqNfFB3xCNeLUqOVWDoFZBceyzXPAxuOn0H8iGSIDW7CsyYWVDDGtTorQRLOcxcGXXeJ78Wy7OjFxmGCzh0nkXI51i6lAN81I22Yx+btNrKK1UFVWWkIxRKFPt
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(36860700001)(86362001)(47076005)(8676002)(4326008)(2616005)(8936002)(107886003)(70206006)(316002)(54906003)(6916009)(70586007)(82740400003)(478600001)(356005)(6666004)(36756003)(41300700001)(40460700003)(1076003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:38:36.4347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 758f0daa-88c9-4492-2f8a-08dba30452b1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5312
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce support for ACPI initialization flow - add ACPI match hook.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v1->v2:
- Comments pointed out by Ilpo:
  - Squash few lines from the next patch to this one to have less
    churn in next.
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 73f887614e04..feedfba0acf3 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6396,9 +6396,14 @@ static int mlxplat_probe(struct platform_device *pdev)
 {
 	unsigned int hotplug_resources_size = 0;
 	struct resource *hotplug_resources = NULL;
+	struct acpi_device *acpi_dev;
 	struct mlxplat_priv *priv;
 	int i, err;
 
+	acpi_dev = ACPI_COMPANION(&pdev->dev);
+	if (acpi_dev)
+		mlxplat_dev = pdev;
+
 	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
 	if (err)
 		return err;
@@ -6476,9 +6481,16 @@ static int mlxplat_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct acpi_device_id mlxplat_acpi_table[] = {
+	{ "MLNXBF49", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mlxplat_acpi_table);
+
 static struct platform_driver mlxplat_driver = {
 	.driver		= {
 		.name	= "mlxplat",
+		.acpi_match_table = ACPI_PTR(mlxplat_acpi_table),
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe		= mlxplat_probe,
-- 
2.20.1

