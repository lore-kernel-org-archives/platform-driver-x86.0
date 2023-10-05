Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1EDE92703
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjJEOXr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjJEOWG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 10:22:06 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C19683DE
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 00:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MONqkwb66k+XncA3gz9lB410gcsh2Ev4RFgRjjHJqbMtAmytAN29SucbqE41r55uE5s4sJGnt8NbPUAyVUXnFASrnRZUJtAp+BQxtsD3/a0HCPVEfz+FyM+U2Ogj2FvpU4V6Yvm3VaLoGm2R45l0QzJvhp2zLScd24Z6wFCcQBxkISyT28z8AH78uXx2ZyibHgemrY74d7A9CdLLEWGqoV6fWfdVdAHOiRC4Qcmw9kThLTDwQPSygOSIK2yACBqbQiDfIEvT1f9KIs2I+JJ8sxxyOJ0y6Eck5ro54TI5W+J+JU21KZTQUFY0jxiK7yyWjiB50hMMYqK7GymbhhVhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aJiJYmGTyz03pUuPjbhsbhbJe8H1KZ3QPBqD08/hRM=;
 b=fva/9kWYtbEkv2Kw/sNLR1nNqKbyVTx3+/CKtgP4Ly47VPgZ18JYyMuVO/JAoF9uTOzoRqP+gdi2Wr0ARlDDhRYDLOXIgl13bXc/Y3cYLoRk1WnGY9irZL8N0sFxr/VKzN2mnF8G7AN1MMg+dHyJ6YWf8YNDtSJdD464LxG6f2H/6hsdgwYk0y0qvSZ785Z6TXhFveVmXTM4yFnKx6Bgb1w0Z7jgoGkMioSCGDy23GgWC/17ExbL6/eO9X6LUWwLl2FLIMpqwZ6vyWkwYwkaH9NWOGwUiBp62ZNtk8WaNfTkqbMZEmMmwPHjqr94hjoW6GsUNhoZRiVMmgJEQo3kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aJiJYmGTyz03pUuPjbhsbhbJe8H1KZ3QPBqD08/hRM=;
 b=DbBoKiOIPLgl0Cl3r0ouzLgtgfBj/gT1HyVw24hb/CJBLxDJBCp8ydU2YfCHfS6qHgqXy7odIIhZPzXEQudUUCVDnRHixtfV6hQ8YUZZKNl7LVODt2LClfJ62WToCN++RmL8k8qPvkKQfMRuOSEYvbUolDRZRK365RfdhiwhjKN/4XqT1dihupjvoqsx6OBBrQPI+tTQAXxaokipYVkYck0sLlmY58+gcU72G3uXrDpU6Q9D23u4IwVUnEm15h7XK3tXGiCWBUi8Vzy+kZ74YctKIiEDWcgFKgGIXwoMNQjw94gMuN256i81EairjTlPVtQ2wgLAwP+kBUzsY5zGXw==
Received: from SJ0PR05CA0166.namprd05.prod.outlook.com (2603:10b6:a03:339::21)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 5 Oct
 2023 07:56:57 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::b) by SJ0PR05CA0166.outlook.office365.com
 (2603:10b6:a03:339::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.21 via Frontend
 Transport; Thu, 5 Oct 2023 07:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 07:56:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 5 Oct 2023
 00:56:40 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail202.nvidia.com (10.129.68.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 5 Oct 2023 00:56:38 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC:     <christophe.jaillet@wanadoo.fr>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 1/3] platform: mellanox: Fix a resource leak in an error handling path in probing flow
Date:   Thu, 5 Oct 2023 07:56:14 +0000
Message-ID: <20231005075616.42777-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231005075616.42777-1-vadimp@nvidia.com>
References: <20231005075616.42777-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf6e9d9-8c5e-40e7-9340-08dbc578a5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnZor0UyxRFel3lREe7O3xgeQMG0kFmbQOFzgIvSbpJ4axD45/GLsbk+cH/wDNo7XuF/z+I7a0FKW/vH1IJk8QBluI8poJ4rbN6HnzxCGnYap7Cnxx8Y4i9Qo+Y2dsSsd3xhSIKycYRKKah0QLgLQIyqDztsMuHfrGpqwFKTOkLoHw+QpBv0imKRtxNVlwO/BvQSrvrTbgx1OLMZeRu5ozwQQdBtJ3yz+P3pN0h2s2Y/7qZSt/ySRd4Rxjz5Hup5xB7QMqBMN20C8s0EnH1j82HSqAOPbikLA/FSlsul08ly8EEqgLYAzOti0AtiXEr5LShGqgHHspSZKPST7eQyFyaBA/OgNtHO14l48bL5G6VXGGBkds+uBYOYiWy5IR5+fmxGCNhrQjCgUtwFWq+wbpOHdgvw+ZZoB62ydraUdYpYdrJvW/2LAbdPshoB94B4VLE8kJ88/kiXPhHwVBAZpPvmDrfc9TJ+GGZdnyXU5iEyWtzj0X9gYtAD0rJCGA5CYm748/Qb4HQ4Rh39CYqDbzsiKitShuWdgBXZ7aBq1FIIady7serOq9ZEwGFBeKhXrc4TBHoHi0LdR4W71ct/FJzABSnnOTQujhO4+8dHu6s1iCGvY5Pr2vCR4RBupvNa3EJjqb/EoN8U5FCmkas2qyVccj53tje9O+l5IOkjlHJt9LldQ3IoFGu8BJoLCn9EEljR6O8C50huORs6jIjuRyoVASwaQWmB42V+xhoCxJFx07m6iovM488IGLzZExihxSRuE00AFLSB3U8RqyZMAfEbdzaKhoFbvHSq9fM6iT4=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(41300700001)(26005)(426003)(16526019)(83380400001)(966005)(1076003)(336012)(478600001)(6666004)(36756003)(2616005)(356005)(7636003)(107886003)(82740400003)(316002)(54906003)(110136005)(70206006)(70586007)(36860700001)(47076005)(5660300002)(86362001)(8676002)(8936002)(4326008)(66899024)(40480700001)(40460700003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 07:56:57.2677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf6e9d9-8c5e-40e7-9340-08dbc578a5ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix missed resource deallocation in rollback flows.

Currently if an error occurs after a successful
mlxplat_i2c_main_init(), mlxplat_i2c_main_exit() call is missed in
rollback flow.
Thus, some resources are not de-allocated.

Move mlxplat_pre_exit() call from mlxplat_remove() into
mlxplat_i2c_main_exit().

Call mlxplat_i2c_main_exit() instead of calling mlxplat_pre_exit() in
mlxplat_probe() error handling flow.

Unregister 'priv->pdev_i2c' device in mlxplat_i2c_main_init() cleanup
flow if this device was successfully registered.

Fixes: 158cd8320776 ("platform: mellanox: Split logic in init and exit flow")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/lkml/70165032-796e-6f5c-6748-f514e3b9d08c@linux.intel.com/T/
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 3d96dbf79a72..a2ffe4157df1 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6514,6 +6514,7 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
 	return 0;
 
 fail_mlxplat_i2c_mux_topology_init:
+	platform_device_unregister(priv->pdev_i2c);
 fail_platform_i2c_register:
 fail_mlxplat_mlxcpld_verify_bus_topology:
 	return err;
@@ -6521,6 +6522,7 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
 
 static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
 {
+	mlxplat_pre_exit(priv);
 	mlxplat_i2c_mux_topology_exit(priv);
 	if (priv->pdev_i2c)
 		platform_device_unregister(priv->pdev_i2c);
@@ -6597,7 +6599,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 
 fail_register_reboot_notifier:
 fail_regcache_sync:
-	mlxplat_pre_exit(priv);
+	mlxplat_i2c_main_exit(priv);
 fail_mlxplat_i2c_main_init:
 fail_regmap_write:
 fail_alloc:
@@ -6614,7 +6616,6 @@ static int mlxplat_remove(struct platform_device *pdev)
 		pm_power_off = NULL;
 	if (mlxplat_reboot_nb)
 		unregister_reboot_notifier(mlxplat_reboot_nb);
-	mlxplat_pre_exit(priv);
 	mlxplat_i2c_main_exit(priv);
 	mlxplat_post_exit();
 	return 0;
-- 
2.20.1

