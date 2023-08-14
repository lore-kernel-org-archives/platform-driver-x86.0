Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A51C04E69
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbjHNUgx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjHNUg2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:36:28 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E886810F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyX3WoHXPu0K6uPdiYF40FhaRhpVlBNScPsPtTIMSZjRiZ/ohgKn1/txq09nr9b4BBkeR+lQjoYu8ZAuXyJTfph8l6YYYT6f/FfLqbut9VX5cZRnlC0hduV3AHgCMCuSXwnxt0wIxcWhuh7Me8aXASlcXsM+xu7tqat7HhOEiAHaWqARKl9VUlAb7JcAIHaAZFJGGyw4JkYSDJ1PoioPUkSOk7XNKy8HbMKHY2Q8ZX9h0tQ8guq+FHad07DwqaXoYPHcyXWaSXwOK51kckfgUU8qKuKOjCXVnzGvCxq+pfYG1L9bVGvLiWCVXZ1awav2uVziIIMe+SiR6gfXGX40rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji636jxjL2LkwgTIhU4OAzuVvW3LnruVY/RhpVmeJF0=;
 b=Z/0jMenrv6LidILw0Gvu81QzxIatVko6Oyl8kGO17YAI4NBU3l+GmEmzCgCNmcNJ8D6UWIf2YUVFaxzkqDnbLvBp69Qb9XnSMN7DIKeR88fHxpSUwA0LP1ILJwr6jyAZJ6MQq/ng14LPMUlXApFVd694n/2B4rTPBlayXbl3VTEpWsakkhScqYFvfmYcpcVPYpdZNKJhgwnRr06ge2EsVx7WV0XYFw/aGOilb/o7mBE757wpSBLISYvws+OSHqSyfifo2cd8AjV8rcDDonz0sY5PZLnRhcKzvzUvd17LLnTctT5A4BRLvfzbth4fE4yYsJPbshLpogwTyYizOMbzMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji636jxjL2LkwgTIhU4OAzuVvW3LnruVY/RhpVmeJF0=;
 b=StZFwEAUf2boJhbRJ7km/vimYdiY73vjnqlbXVF5vLNvSspN5az4/TuL9Lbx3n1unB7Bqqn3kVd+EQ4ps5YpoFLEeOAqv5P+lwyB+9EUHV8rgXAATYSf4T7SghswDC6aEkmUrZKzAnr9INdDkfG1FJipepOmFMJczMMuUP/Y1WETLPFrKiOT3VMS6g9bfCgxAufmBwpmUatyP0KjgwEnprdv4w3Eop11BgEWT0qOE22lYwhGGV5x69LvG+AuJvFRDS+2Jl/ga6i/ECbw1Yf4eR3EVRhzC/rsroH/RM7yS9mKnzj7QfC9GW1wnkcX3fiXb0uTRkN64xrm4qdVnxSxZw==
Received: from BYAPR08CA0025.namprd08.prod.outlook.com (2603:10b6:a03:100::38)
 by DM6PR12MB4861.namprd12.prod.outlook.com (2603:10b6:5:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:36:25 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::d8) by BYAPR08CA0025.outlook.office365.com
 (2603:10b6:a03:100::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:36:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:36:12 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:36:10 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 08/16] platform: mellanox: Cosmetic changes
Date:   Mon, 14 Aug 2023 20:33:58 +0000
Message-ID: <20230814203406.12399-9-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DM6PR12MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc5e85e-4de6-48b0-6c88-08db9d06210d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZcoDT1VGTn8HCtzvym9cJPMVKKCxkjasudMgUmaYm2hcp1S5srkXHxshf9HEkbZrS26he7fdQHcDrif1ea8RcQwwuWuZd1LN1RwHGEzKa/Nn7/qQNFndLCULCQUlDGDHXXJe6lULYFSMtD8KKy+F7ModqHA8/FtOG3J009y1iPSg/yrA9e3AwQnxnjQFYXvDTyzxj8gVeqTVvIVZUKXMzyHMh6WSy1tIF51QfMRgI0LU5RlCyjYJyMJ/oMoUOP2qARXZY3irFgn8FDWyF15coHmDCtVxBy+rcxYJIRbAxDlZlCQsFUUAYkTneEP64qAw7gC3QfXyLDxlVIGwRJldlo6gu7IFFV0ikV034YDUgJdx4SoKx43O3bT4vkoe5LCYl3U4LeMcJDTHlc/XuZOe2HAdq3UbKb7OC7ltXbpq0FxJj7W/ovSAtWCn6ngn3Ea1DSjH4fx4McB6vt6HIziZlBJS5CdLTu4BhK5o61VsIaK0gbhg4lGKa1Hrmhif2YzdY8rjjY5c9ZK0B8IEfUgfUGKvrusZBAb7nntYUaOBUwnR1aug7zkj9D+k1fnZTR8rIb7sM6+zjFAp55sRfMb31LyCSqQnJfsOaeWY7BMevql1YSneg3yvrXgvN5xK0mfBdQE1ISZd3EpxhokWE0DBbXKvTxPeZcvsDq8Dq3nXnDqTwECsMF5+AYpIL+FIuVv+bqz67vKMQURXznV/+6hxiAmNa6Z2Imn//L3ZkiB05otC/JWTb0G7QGnxsG1e5zA
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(82310400008)(451199021)(186006)(1800799006)(36840700001)(40470700004)(46966006)(36756003)(5660300002)(86362001)(2906002)(40460700003)(40480700001)(83380400001)(36860700001)(6916009)(4326008)(316002)(54906003)(70206006)(70586007)(41300700001)(426003)(26005)(16526019)(1076003)(107886003)(2616005)(336012)(47076005)(8936002)(8676002)(6666004)(356005)(82740400003)(7636003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:36:25.2012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc5e85e-4de6-48b0-6c88-08db9d06210d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4861
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix routines and labels names by s/topolgy/topology.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v0->v2:
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

