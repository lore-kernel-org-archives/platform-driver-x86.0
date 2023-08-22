Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3158BEE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbjHVLjG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbjHVLim (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:38:42 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88AF1724
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITgaCYvo9Qn7/+Xu7X+TfXFnMBrqX/p/c+6+C1Oh1KaJ0SeA5hZlRbsXgiWC6ToTkvsoI5EqKgHjoGsiQV5OyqHGBv5FLLCyE0CAec3NeMeNCV4Exb/5DKHTFIvWoFrnk6MKFA5M7BOm8s2PtgjcHroXaGPNj1udPiDOp0gGTbi5BdTwUX5X6apsDkDY8wI0A+wLTSe7a2p3PwcoGhXLtFfnEcOx3XgKhBsSxddQSGFUkNAQOGYw0O97MUDzFYXEvshbY1TV5ZHUhZ90W84Obwd2lJL1qPGGcF13ILy90En14CaY5Ejr9cyBdU+GnqfaqHTOZGSOkQHkW3JsJrC1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaK3qdqlUi4zqlG7B8wSlmtP84T4L+Rz4DTwscou9Xw=;
 b=DxYGnykFPg4zOMrL72IapfZXTjcxT3CYvWtILW1emK6YN9ci8e7f6DXYjQYaZ3LRVXu+yIh9Nf/tnVna/G5qbVsCN3hp67kEi4XA+XDyvLRZPKUKzfjAEv9A8oANyCNHjdHlj8PaYIYnEMJCjpLh1x6wAzP8rzMb8pkRXIfMXFOyKfaWb8ZFkF1qdy16qOuR9Av6WSmCh/wtJAF/vdiaW5AM+jG6eYXbc7d5rnnwYTU5Tj7WLodmtA715dA6l8YL6DL0ImhX1461/ZIKj5RnKAfkobTlMJWzbZT91hB5f9XEohzPXroJEf7NQWEK56X4KbSOiy4bByaEXj8iqJusLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaK3qdqlUi4zqlG7B8wSlmtP84T4L+Rz4DTwscou9Xw=;
 b=kn5qmBFgriMAmA95Na+J+IPxUItdC3DVvo7T6tXuuJcqDe6DjVskORkScyFnTeL5mVwRim3HwhRsjJPGxucdZ6OkSy1U8dxxza4j/uA3L25fMt1zCk2LB6VZVxPJp+/OCL0jI4vDvuQE+Hihhb22HE2LIwrF5Mm1e7Z42/nLUAbYQfEWIWbNHUvZbBkmdnKnjhhiXMqY8IAyt+FyMSjecLelv+eYo5gZJVMV/4tqe3qgi4XgkumhXLv81m1TV5lblm4G1oEDhCsOFIjb9HpV63CFE75IMyIsyd64wtI3nETuW7TGVTv5TZAIwPGKRGgBh4wuHBxy1V5POgb9Nla8vw==
Received: from SN7PR04CA0084.namprd04.prod.outlook.com (2603:10b6:806:121::29)
 by PH0PR12MB5433.namprd12.prod.outlook.com (2603:10b6:510:e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:37:06 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::b1) by SN7PR04CA0084.outlook.office365.com
 (2603:10b6:806:121::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:37:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:37:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:36:55 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:36:53 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 08/16] platform: mellanox: Cosmetic changes
Date:   Tue, 22 Aug 2023 11:34:43 +0000
Message-ID: <20230822113451.13785-9-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|PH0PR12MB5433:EE_
X-MS-Office365-Filtering-Correlation-Id: ded34081-b06d-4ada-31a3-08dba3041d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EKgFzx0fDDimeAnnbqpQwelISeWCbdiMR+Y6QELI5vjeY9kfH7y8KIlgt/Scqm69LpFQV6/tas0IE06gfvVu/B+lvUY9oeqZ0QlH/GK8y6QDHeUPUQbWF+moTygpyPzCCAPkvknGj7bnuhMITImdidv8AKOuwNJmhRV1388PNOrP3WozKDIo97WahObBRklIElXxCUqXlykNQTQTU/IHnOIvISkpuxrFJmgd2HTQWy7MmjNDtyy/iISlNdM0dDeI74jnGG8zEX4+l7QrThuSTvHtovX9smawL5wuBTksfMwGnUQ+1VmVRnqVxK5wpVhF3I/Q7NWBTOHzhOB0nVAlFgsDGBplNf4uorK1XKL3SRLtLXqYO32sCKN2dN1VxQlu+lqZwz48HuWmX9CdI66TTOf1W12wZDwtBvMd/VYgsBVAu2oJNcSjiiU7exX9xSjpG43SnNH/i2wE9B4miZ3E7wQdRGwHJ9i36hWI7aQFhjc3SKeHIir8aFv0NuavJKoRVj80tpGSe8m1fN3hko+IxBMIwBV4ywh8OrepJ2wyAVPMtknNT198krNcBGnzZRouTrzBOkLJ1k8l0ANfqIvD7HBiETaneb/n0TmJQYorpnbFebKKoDpHsZwf3DHJzmq/JjYZZhXVZdsuwldtDdnLFgcQ8gFGY1prGCADJumT1xWkf8p/4lZJU/NWA6MHS3HLChWJEBzgElgv97VcBoQXqhcQh4WfJT6iFV+ccSyVsWuMskf6/W2XFar5Ewz4Ppl
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(83380400001)(66574015)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:37:06.5405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded34081-b06d-4ada-31a3-08dba3041d21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5433
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix routines and labels names by s/topolgy/topology.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v1->v2:
- Comments pointed out by Ilpo:
  - Fix commit text.
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

