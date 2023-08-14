Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CFDC001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbjHNJDn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236131AbjHNJDJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:03:09 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FADD198E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oglqq/7yLOyRpqSgxgPZ/EXMzcqlezH0PRGLHXuBVkcF54oRcOzOjt1IOIgYWewfMU+sEG9bb3KVCJNa/R5otdMX5wAlsBNc7RXuwmX59iA9NiX1bj391C1BwqY9N8y4onM/5yuBuyNBEHNBJRMn8v4Q7YXRR8uTJZ35/sx0f44ccFjan4NT//BLZ3ZPwyI57/TFb45iIjweu28E38vRrHJigqkEdqJsQxr0M+T1HvK90D2qB6oOAip6LfOl/L0VChL2frITJ1FPw53p+Vuk07qGUpVHfSHP1Pu2VzI5mk+/6gguyWGVLcZ1gWzj31LI490jYnGlrDRYNVC6DgtwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1FZlkbuWcrFHpkVk9McmATdEq3ZfcbZX69wNL/IY9o=;
 b=buRwjy1elJw8lHsxb8nuttt8YrO316d6HrbYdaSrPh9OANnVlz+0WTrF6S+WrTsnP0mCofIKFWmVIZG2ZsqwwFRHaiEcgmCg/opNDAiqD1XV1bhhvty2wdRKxXlKSbHqQTdzntWUoZ/oiDnJgL6Mj/IDPBF3Hb6Fcup+5scLweYrBqVwAbN5DduRePebvM3BPYXlqFEo4T3qt90sibJX0dE/fVHnjAowELpRxsjy97gqjkCv65yDtSSRwGtWW0FJVQvWFY8YW6GDtqWxKtA882onLK+e5ZdoH4ld0CVOfyb8Id5WLrzhLaSgdGd6hr2Nug2ca7T6EtEArlgb6+B3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1FZlkbuWcrFHpkVk9McmATdEq3ZfcbZX69wNL/IY9o=;
 b=t/q6G+oDD+DQVXf45olvqHvolntEsZP6H5KAG53cA89bXzn/OYNstivTnG4P8sGEDbZ+nlOkZ2WCymsmluNtnoBE0X15oaKbyfmersi6ye4Z4yO98so377mI/SbBnZLekpYStsimZS/4KUYJ8UtxHF9Em43RiCO2m4U7KjrQPEF+WENmyv6bJjilreC6XRoys+V3ksZtjjRY3Pn8EbPe2iBQiFMFW6uRU+5mwLfcHXz/69LABu5cNGO9sREjonvxkkM3Nl878bKI5mB6YPDlqO5hcG671CuaUNAOmplyE2qP/Y7CS1R3SoLqMA/s07N+SeRzAUwWEtIwh7jIJfhAWw==
Received: from MW4PR04CA0364.namprd04.prod.outlook.com (2603:10b6:303:81::9)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:02:55 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::65) by MW4PR04CA0364.outlook.office365.com
 (2603:10b6:303:81::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:02:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:02:40 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:02:39 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 11/16] platform: mellanox: mlx-platform: Introduce ACPI init flow
Date:   Mon, 14 Aug 2023 08:59:05 +0000
Message-ID: <20230814085910.56069-12-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e973428-9bec-4b7e-15d0-08db9ca53f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3brB7fkRP8BjahPRGO/BBpyOsLfKIrbaF3DtZSMno7tqetthTzsiS14msiNh3CeLjPqVbtSE0wn3ggwXvhWGV7kY1ZAXH+h4g4Cka9zDYeXqhF5s7yiE0SnEOoj/EcoeBTaIwDUngnIJerYhxKZaYf5aY6L1VKS5SQ8ZWKXMSup77B2DgYgHdZu74IsFxFvE+pKgIp2KRfK2HbAjHTgnE11ZIRsEURdhaIZ9YYTgUtXU+HwZAK2oFNWF+HKz2/nCWsH/6niFsio8/fpqNnvEVNDfkFdb/t8cwyt0d8g3gvDlWckChTuR2TJTOXZNqU2IrMuRtQC9Vk2osIlx19nNa5C21b108S008DFkBf4gLM0DvCEY5TTW2GHxZ0ld76W5150Yy7lCviHoUGd/HpSzRqOJX6M7b5/YlwhQ3Ohm8ZKvnsngcGJ8ycQY0u+cFww2VaIMmaoVqp12cp8fh4GxNRQMjVoHIO1LpqGuSQVk79marbszPZMSGLFc1JhjX4FMGnTp7J9bSPu2ll5xtxFVSr93NtKty8NjXhguJDwd9cFf+O+6dXI36hlhGc9VIKA4e7m6gaVtMFvjXz0BYiTR02St3CVeIVtaLa4oHypKI5XxyWc5uKt+fo5A0LQmYqJKcGNRr6hqmanJ+qUDLzK9Y5lefPBldxjMOa2PAUlJA0sdeKhO2rJtpiJUPOr35Jq2Sku2ovvBkso55fcruFba0jFFlGIKV4WFiLXG8x12Whf4zmdLuO382D4XW128HDL7
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400008)(1800799006)(186006)(451199021)(36840700001)(46966006)(40470700004)(26005)(16526019)(336012)(2616005)(2906002)(1076003)(107886003)(426003)(36860700001)(47076005)(70206006)(6916009)(316002)(4326008)(5660300002)(70586007)(8676002)(6666004)(41300700001)(478600001)(8936002)(54906003)(36756003)(40460700003)(40480700001)(86362001)(82740400003)(7636003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:02:55.0097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e973428-9bec-4b7e-15d0-08db9ca53f72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce support for ACPI initialization flow - add ACPI match hook.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 68bfa446738e..e2226c218a54 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6398,6 +6398,9 @@ static int mlxplat_probe(struct platform_device *pdev)
 	struct mlxplat_priv *priv;
 	int i, err;
 
+	if (ACPI_COMPANION(&pdev->dev))
+		mlxplat_dev = pdev;
+
 	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
 	if (err)
 		return err;
@@ -6475,9 +6478,16 @@ static int mlxplat_remove(struct platform_device *pdev)
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

