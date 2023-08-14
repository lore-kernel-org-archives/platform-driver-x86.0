Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE99C41513
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbjHNJCJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235624AbjHNJBv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:01:51 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D0519AF
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+X4R1wL1MeU2jn6Z+tdzflXsu1PM7hLZTCH17kNeU3UW41t58+4/vxtOCdt+9or/sRfGskcvgkLwbNLChJzeacCOHHxe6b5ubbGu7t/TTkAXFlgJRRHQUYgoaZ2aDAUT8qmPymr4Uk1afQgLB6t0ydUX79fDw+TRB3xBYHdeRy6vo+lGQ3LJT4yj6jkW2L7My05E2c8Aed0BgW9NxcSoyVops/yEcZ7iPhzs+EXlOzxOw0YJXMr0+ASdSMxKJsaz4k9HYF0cw75VQDQBWg9TfV7QIDctZva2TZet/gcY+LoYcchJwgXUGaesexTDQU91+2xgG59Z7tiLFa7e8GWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9cZVsqR2P19xhaS7gvIHYkQr5W0sHo1gV444Bhz8hA=;
 b=Sw6sYtNa6dkrDsfPztZkeukB6izjxIsb4jXWvxAKpWq7qL9f1n89Gr/4i0QugTIHowQ+gZkDXLghv2Z+G42LAZ8GLca1M+pxWGq72dFwHBI/Ja3A5ONmZ0y52m8LbkJdX9ZSfq19ucZdJ3cMVfIGMGigSKOjc0A4bK+z4KnTYVi4J4iaTPoOhDslC7KP0rPTKPKqX2SHXb5sce3+G5kVnfn+svWAHirSO5xKWCqJmp+183N6H9CtRSYL0x1jk1iMbqtPa8SoWWUKiOnffjaZCNS1TTOlsy0eITEFl4MTVqWEsFJw28JjTt7HCn06jdKg7GbAkTRor22V/xfVNffI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9cZVsqR2P19xhaS7gvIHYkQr5W0sHo1gV444Bhz8hA=;
 b=rGKjgtKVgaL7KI+0H3tgDw4f48pBtYseOjtvuXnUv3pB76bW9OZm16soJuaUpKw/ZOdYebrj53600lT/tFHZ0ekGEUuTBGqG+bA4gNsOKyUED1QTu0upweyfFoufaEQh87upyM9Ap5+VhJSkN4UY3YCZDb0x3dHptSbWvytCnANorn4d54E8V6qaKyDQ8VrRhRWEOZhv9EcquWX3SvCkiOcGCBwVH0w7hi33ommMdmSjz8LbMuzecwgUHKCQ489/2Al+JAfYvGwYNaKg9teO+JYCYFMmkEeiUZGwBqsnzZTrttSN39zE9SDh/eQP6hEfqgnN7WnqNtZmeIFjI5Dayg==
Received: from DM6PR02CA0144.namprd02.prod.outlook.com (2603:10b6:5:332::11)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 09:01:26 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::71) by DM6PR02CA0144.outlook.office365.com
 (2603:10b6:5:332::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:01:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:01:13 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:01:12 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 08/16] platform: mellanox: Cosmetic changes
Date:   Mon, 14 Aug 2023 08:59:02 +0000
Message-ID: <20230814085910.56069-9-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e4dfd5-5805-43e5-b65c-08db9ca50a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwI3irefXUxDgtE0JCtdaKfFHm6GPmIiY5e78uh5eeM4z2ciUaJIvXWF6OAm+xjflWhRm4MkqUSL9DNufy0olejkyABxe8SPJfD9ahLI48tVgfHJK6WwAnIkn8e+68296/Lp78FxfRhkLqng1Pe7tgTJCBhN7AgpYpWxnSLGIVvNFhRRZh9lq0yE2iZM9n8bE2Gqxx6D3BG7yBV3GOx1E7ncOC6zQlD7QrSm2M6xzP7qzJktsXyqc6bu+kZoJP9aNQBRi6dPLLhnI8bEzwIXN721pp5DZ57ceLaDR6NNZIjiCtnbv4Dxllh9XPr4j2W0ZvtoZolXl70W1wDSiczeSUSSwp1bm5I45MmtJ0wevvknbhQRaygyOqPWDyyfcjJ/ZXE5Tx1fqjzTrk6iwyqiyXFu4RkveUChb4CMWOlqpIReoePyn/YKqhvCSzAGj77o+rJ27IroPMyLU6y3+7dbYeO3q1ayufz9uXwXAVZj8EW5wQYKx8DfxOUh/39ojSPxPgMDxww/v59JaQ67VlsZJqqEn5BTHAlQago593xgEOM+CruzmMgfDZYppj+4xfrOzNNHKbj3ZnlJO/FKh+tc37gfGC3R6q++GpOuWArgqa9nz75+5Th6Bp93u7K83+k9Fsq7nmA2n0kQp7vU37TV3cZI8OL7pqJzArkkE3u/3ZJCxXgIWCmlmPUDEsPDtYs0+5fpdvEdzev7V480Ys1vepU9Rw7GxMUIShBOHxfYLVvuv1/k8jKKm3fBVYJ5NDaf
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(82310400008)(451199021)(186006)(1800799006)(40470700004)(36840700001)(46966006)(40480700001)(54906003)(6666004)(478600001)(40460700003)(7636003)(356005)(82740400003)(5660300002)(2906002)(36756003)(86362001)(6916009)(4326008)(70206006)(70586007)(41300700001)(8936002)(8676002)(316002)(47076005)(107886003)(83380400001)(426003)(336012)(16526019)(2616005)(26005)(1076003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:01:25.8904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e4dfd5-5805-43e5-b65c-08db9ca50a5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix routines and labels names by s/topology/topology.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index a505f619f337..1010064d54e9 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6265,7 +6265,7 @@ mlxplat_i2c_mux_complition_notify(void *handle, struct i2c_adapter *parent,
 	return mlxplat_post_init(priv);
 }
 
-static int mlxplat_i2c_mux_topolgy_init(struct mlxplat_priv *priv)
+static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
 {
 	int i, err;
 
@@ -6294,7 +6294,7 @@ static int mlxplat_i2c_mux_topolgy_init(struct mlxplat_priv *priv)
 	return err;
 }
 
-static void mlxplat_i2c_mux_topolgy_exit(struct mlxplat_priv *priv)
+static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
 {
 	int i;
 
@@ -6308,7 +6308,7 @@ static int mlxplat_i2c_main_complition_notify(void *handle, int id)
 {
 	struct mlxplat_priv *priv = handle;
 
-	return mlxplat_i2c_mux_topolgy_init(priv);
+	return mlxplat_i2c_mux_topology_init(priv);
 }
 
 static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
@@ -6336,14 +6336,14 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
 	}
 
 	if (priv->i2c_main_init_status == MLXPLAT_I2C_MAIN_BUS_NOTIFIED) {
-		err = mlxplat_i2c_mux_topolgy_init(priv);
+		err = mlxplat_i2c_mux_topology_init(priv);
 		if (err)
-			goto fail_mlxplat_i2c_mux_topolgy_init;
+			goto fail_mlxplat_i2c_mux_topology_init;
 	}
 
 	return 0;
 
-fail_mlxplat_i2c_mux_topolgy_init:
+fail_mlxplat_i2c_mux_topology_init:
 fail_platform_i2c_register:
 fail_mlxplat_mlxcpld_verify_bus_topology:
 	return err;
@@ -6351,7 +6351,7 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
 
 static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
 {
-	mlxplat_i2c_mux_topolgy_exit(priv);
+	mlxplat_i2c_mux_topology_exit(priv);
 	if (priv->pdev_i2c)
 		platform_device_unregister(priv->pdev_i2c);
 }
-- 
2.20.1

