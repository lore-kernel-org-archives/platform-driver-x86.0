Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E913CEE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjHVIPy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbjHVIPx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:15:53 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83DA12C
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8FCO+caSTy1YBZHXq9JtQVjO2h5t0ooNpw52qqsjwZ90W17kql1GIxnh6wrL8ipOO3hwSKobN/3JZ61Q6AtLGhaOrL8XLzaJBdSSWV1IEXNiZUNLtdRZvcrPmYUB5LAiPVTX04DECR+R7AzHfjMrdWU6hcppmhMfWSnx4cEN3EMO63Fl+5FbcF6HZ8h51580Bc7jRPNkov4ZjS6CRgEON4ORdWYf/hm70uAv0stqEXwuiFYGlmkrjNZ9MlQ992fiFHpW1KFV7wNew7U6OcdcXO2j0pVGVMllFzIqMArEwcHbwJgnw0gbMvhg80t5nxTGgCbYBQYjJdk/8h/NukbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Owwl2VJqecHKjgR/LGsMJW9EO1lVXpmQaSTds+JS5Bk=;
 b=ZX6pDBa19nNMSSz7M3ox37ZW3qP8hgM/zunjqysCMEs+XfKsYoNVtBdowKE0jVLSDFGXiq+6dEXLFSOi1e41tocNiUlaIbrdVy2ssxskw0k+9LY/dHLBWG7z7MlGUmtOh7GSD/sW23puIjOpm++C9ckiwRYVs0D+g7tbRv3cjIeTeXN4slWhOgPR84OumHCB64YTv/BC8zEyVLuImKc1N/Lw2ZQDGsK03L1JrWVuOzJ22XaZW2PQEIMfPjY5LpXOztEObq6lslUva7VSybp5MkmPJ+Ve8Du+2GOiEj5Ak9gJnVVFrDEA74wZaW5ng8xzgCEcwkMPw1XTIL+GsJKDDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Owwl2VJqecHKjgR/LGsMJW9EO1lVXpmQaSTds+JS5Bk=;
 b=in+g7aBTNYsimBfFbmnX8ib4yMSMPgIVlW1B8Kb2Ksf7uzLoLIGYZr8XFohFlsVzOBrR3AmR0YqZDyYFaG31rK4Qq6FI4srzEaN2nC0RxmzimkevcnW1suhnpFooZagizArArUi4zZptYSqpwbFZ5erIYmmzZ/KltvHPffqpwIWmR0XXkWzE1QpKw7/1/oR4VQIp3reMPYsdkcOQAvBuoY7U5zIVUK4z3N+6PcKxYbcbqvYur58owJtuf5j/YLOTexAIIrDW7yJuH+V4JpucImftS8cBNcvKwVsk/iyTq71+zer9o7Qv8u/7zu8dFMh9WwzKSEr4NSeyxs/s5SwiBA==
Received: from SN7PR18CA0023.namprd18.prod.outlook.com (2603:10b6:806:f3::16)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:15:49 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::17) by SN7PR18CA0023.outlook.office365.com
 (2603:10b6:806:f3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Tue, 22 Aug 2023 08:15:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:15:49 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:15:39 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:15:37 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 08/16] platform: mellanox: Cosmetic changes
Date:   Tue, 22 Aug 2023 08:13:27 +0000
Message-ID: <20230822081335.64344-9-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: dc663402-9c5d-4904-0d77-08dba2e7fe92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2O3u8St9Vex/KOkzEgWZvuDTo33jgZi6+PQFeNRtMzMjjJ1ZUc0FTwdYoxcfezlDReX/Y6SeYf8GlXbfe4DuOA+qkxt8bx4t+DEsqRuHKkbESOjCwM2GiOJg6/6s74a1I7QVbHST6O0Vfqm9RIttb9VpSdSKDggJm0pIyfr8JDY6WUkSzzoERHPIRNij3DT6mMSk8r93PuRdjD7QTbpRtpokNARYdBLhlE59BTzxIZXhAJ02COa3HHTVYgE60pv+2IIvaacefIwOHMcP836viOg1gVSJGzbxi3ZSA5xEw62ls3X2yUo3d4lP5tTTVfX8rsdSWnzYQyPo9ZNaQHjinc6HX/GIYRdN1/xmFDLgxN9rEx01NaqQTXswynwjo8Ohf1U1UVbGsfm+ScLAcRgLL0IGdckfqpmLRNZWPo35L7hCFYiHXMLpkFHI16XBMSK0y/DRXngl/NwWUKpr9tOq43XS/iJ5xYQJCUgefGp52wsa88QwyDeD2s02Ao8/Bd07aqvh7av8sAcujxLPbrAvdpCQ+COJXY6Cqs+dxM9octb8kDr0Oifunhy7pTW6JbfjFF2Q8+f3Xmvx3QSRXmcj9uqmGKzQLT7nUbdsv4zmMz650diJVGfV2M3Q9IdZlhweXiTce1VL9F4EAA1mFdwTsA4sk/hZ8AH6gAVF/BZc8VdTX2hbBO7ADkPxe+NskuOkvKF/vqBQQ32ixxqsXSFrjj2SMKXk0AXrFEGFhvlSO9X0UmFf2RmiBAA2wyADVNfg
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:15:49.3936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc663402-9c5d-4904-0d77-08dba2e7fe92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix routines and labels names by s/topolgy/topology.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

