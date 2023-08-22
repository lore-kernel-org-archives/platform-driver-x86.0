Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E1BEE49A8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjHVIRZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbjHVIRY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:17:24 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7161810E
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TssNprlbov2bfUQc8bYByg18BIeC8J5CzYyRPQpJWtnByRyaosllPyoLV3TCXcf9xxHww00T7X3IpW6gI8XEyuXodQFVpfOlhJyW4dsfctleBwP8VZN3eQy3dpxkI3hRy7GAsqv55gYNmcB1NMopnwevIGgRdBPPkyYRKCaUiElzo0gJB6bHMe1nCoiyO8IDBp4n7oxHSAbAPCX9+vA4K0Fxav2mBhBd7clCl6xQcsjq6PrPmKzLy3vQv62ey/yr0VWEDmaRWanEAlEyZWsMMMgzEMort04MfYcAiDfBQbaku8AUQ74DTdh/AIsyPjKXIrW7tWa8BZq7OS9iZ4cXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0pTie1WPeJf0lSX5yfdg5lCqSwBmNseWpocTJVxQUw=;
 b=RV3lXQZ4P0v2/z2jEEkmzqn9LCoRfxRlZ80psrxP+f8ca9wdRxQ2/B3sbc070H60rRJuY3869zPeEP5Rzd3AUtyITR4oavm1RJtz6go8u00n3wT5Z6m0+UCTY1YyAckgP3Na2+OZXYgdib9+O1MhxfZS3XRNzBUvwvWXqXHeZdUKFiKx05FK7P5xbcwE4KS097fvo7LsamSmByU/a/7JE69JqkUWzRZpjQzUcRpy9HETPDdbKipmofN2tieoHtNw674cKOFbA1gA/PkBSBwvjGTn4JLmrnOV1j67quyzLnUes/zI9VH1JCHUsrkOs3jeB0HPOy1PO8PYGFo/ZYiA/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0pTie1WPeJf0lSX5yfdg5lCqSwBmNseWpocTJVxQUw=;
 b=Mh1UcCrPdIGwD0nkJAn3cUBzjEn8ETpLWQWpkI3imZR9DijwlRBWjo82UiqW8RLv+ryvvuah7K25DsRlxQ5tW9/CAGxYa4BkB32VfUsNduwg0NwgFGg2U+mNzz7HkqihNkSCjWegrk/FGysIkLLDnkyIksKJSyAMqAtbJZfZmSmUzqPSUqkppstskmC2sHDh1kLIf651Zxkj2np7AgbhXwNehcsCBjqCmrCVVkFqeZfse/Unp/bJA1tYN9PHiSUW4AGde48ker0FVivDJUhLmqBN8BhXFMrFoavEvErx8YJDHG8FuNl+8I96Wd7b5C/iZAq6h97prdyBTo1zOSdL/w==
Received: from PH7PR10CA0015.namprd10.prod.outlook.com (2603:10b6:510:23d::17)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:17:20 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::9f) by PH7PR10CA0015.outlook.office365.com
 (2603:10b6:510:23d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:17:20 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:17:09 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:17:06 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 11/16] platform: mellanox: mlx-platform: Introduce ACPI init flow
Date:   Tue, 22 Aug 2023 08:13:30 +0000
Message-ID: <20230822081335.64344-12-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee6e1ff-cd44-4b17-0c97-08dba2e834a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSKvNw1gWZsNn5EjDaEZyKQJWzZIb2tkGpsqZFRLCNi9i83EtigwX94CpCkcX/W7sirQtEqjkxuRL2eRwd6ToAfzXGzzS70zhDfpJa7hzjW8GNKhDyh8BTiQk1haUsg08l92+TBFVHRfbZUlIQ/3GHecfyEZ279d2oz59ElzN3lg5zUEofnav68OshvKcHGEx0catey0LaY/aIfwuUQU1diJVBINqVrQS2vo0cinyzOCyzgjMUq33b6VdTPkq2YqFVc5Qyb+KkjxShooYNiDidYSwLZzgNwMKpVGKOS0RBrp5Ale+oNu/PEcoRLkzluLPA1Fbl+LhpQn9ZBG0ZzdOzCoZ7Izl+Xw62/+yBhfBLAw2pEkXn4/RvOCRmdwkyKe8EKeI+I8e4JGC3Ejc+0u9BCwv77cnLkJnpQ0adywz7MnlrT12FSgQ/ftNrOBaBspTGRSRMtQKH/NO7Ik4cNqOwmkFhaL9PvOTkqS6KC0BKE/hX0GnqwMdx+R7Tbm1dram4s5H5DAI84fuHEzLyTG5v4sm6FX8laGIwNhpo072IRqtvpP3pbgzmkrxUp8Hk4LWfrSH94SXYzn0nAwIksgY+4ryKcA0k9Maiyi9HNGV5S9aQWMb7kB8Dc/hTOhjg6hzbFncaidILCGKg5bhhHFf33G6GLoXmiVGn/eg60VsLVvoIcIpDJdOSRpn9hyOnJ7cGTneg3mK1nXtMj4lfUvbbbGHH7GcACvsktoFQaYM45P3LJY+BIjMj+2gi9pusyi
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(70586007)(70206006)(6916009)(316002)(8676002)(8936002)(2616005)(107886003)(4326008)(1076003)(41300700001)(36756003)(40460700003)(7636003)(356005)(82740400003)(478600001)(6666004)(40480700001)(2906002)(86362001)(36860700001)(47076005)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:17:20.0667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee6e1ff-cd44-4b17-0c97-08dba2e834a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce support for ACPI initialization flow - add ACPI match hook.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

