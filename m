Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022CAE9270A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbjJEOZ4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbjJEOYH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 10:24:07 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C5783E1
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 00:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdAMqHmQ0xz7QuKaEVgxMMnHcow9XUjSRgXU9im19ynF3NcrmgklfJYS6pXdH1pDmLSozEQUS7kAtDeQbIsQveWN/sWc+fsQzajSfHJU9T+LtKacWoV058KOdqU+xluGVRJU6NrXdkDDRK5pHBOeVTFlEpPs5FVyx32SjWhWhZ2S6HJGJZQxNXR2eVqi8dNpE06fmgrzjUPlstxUVZTUYwAm33Dp4HAkSsSuQ9uRGFc8dvsmNUpJVVO081Sbc3tIpqXge37MdUOoPFkAfIBUY0nL2I3igsex1ZGDamFD2JCrJEahJFlGZuIWFBhM6zQiA9tIt5i8rEYotVPIveNeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzoLDu1qfsADlACrTl6Z/ExfFXiOx/ScBRk5uFF1Q4o=;
 b=Semni/llJIn9s4/OIDslGflfwUvFxqeIPYhkvNqsxZ9dP6NxhnKoJZidweDc+xNWBwKFr6eR+OaCQdfG1q0wtV2qu94sCLoKNlB9alGS+tE6ejETDcC9oDAQ2D1fSlAU8IVigVNtK8rfJte1e9EEOV5WyhOV0rEhwI0UCRVX9LCl9gmB0tFeUEsG3AILN5ZYnWPDYWy2XBE12Gaxnp189dpeE4MjxNmq9+GeQsjiovXvmO9XQxbhWn+0OOlLhfX4S9p+Cnc8kVLFJ/BQyMc9/BLSQt98X66SVQHRA2u9POn/bKqXQyBkNcIn2pOCsSCtGKbXo+imlujtHu9H44qX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzoLDu1qfsADlACrTl6Z/ExfFXiOx/ScBRk5uFF1Q4o=;
 b=QKqnE+9d5JM5PW5w6MboN/RqthQQO7YZFd5nGLPQsh+uABfAXie15mkHMr0YaHL2xaOM2jId4NFZstidVr0G7Szyk4uLt5m9Z5YnCLEdc/dGIv0H8/jG8H4CXgvQ+zIo0/q7ZpBDrjg+FKdBA/0afniQUCFnuqEobdttEHJwr07oz3SzCXiTfDGJur9eaKOyToSCBsSKStvKhljMUIpvhXGSY196R2UpHNFTIclRrGo1tV7b4JzUUjO8ERXEFd9s0yWfi9zCDfO4fw7S+DmTX9ikurd4okP4qIlUKMJOEaM2ccOGFoSkJWTkQ1/mGUxnVW3mt/Arg8NPV36HqMjwKA==
Received: from SJ0PR05CA0183.namprd05.prod.outlook.com (2603:10b6:a03:330::8)
 by SN7PR12MB7911.namprd12.prod.outlook.com (2603:10b6:806:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 07:57:06 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::46) by SJ0PR05CA0183.outlook.office365.com
 (2603:10b6:a03:330::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.21 via Frontend
 Transport; Thu, 5 Oct 2023 07:57:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 07:57:05 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 5 Oct 2023
 00:56:47 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail202.nvidia.com (10.129.68.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 5 Oct 2023 00:56:46 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC:     <christophe.jaillet@wanadoo.fr>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 3/3] platform: mellanox: Rename some init()/exit() functions for consistent naming
Date:   Thu, 5 Oct 2023 07:56:16 +0000
Message-ID: <20231005075616.42777-4-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|SN7PR12MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: c9437e5b-8692-4306-a709-08dbc578ab12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmqE4mkzhbZNlUv1MGVG8xQxw+uhIzr1OIZAVUl9Y29LrVRT3wfalzcN6x187w7BHSeguC8hoXEQfTfw8aSAVT2nzm6LZLaeFUE5oXe9tCb5csFWEaFGHc4PyJjCb9LoQuqTMyfzgtqE9AY6xknN0LJdEfnVU1NdXDp4keyO/6suWzbetdtcCWJVgQ7KoNcMCKQRfeg7mJdOJ+jbMylxE9Mwt4i8+LYAFQjI/aRMqqVsLOU3rSmIvLlQzEvdp1DC+yGsaiJn7cWOKlIP5jv3B9H/MOV+wlexCg8IQU88fn/iqY4+DbGKBDb6XnSe3jK5qpPu/AclNE2GATBXrE3DHzGlEXMctBzBB+qdegQkf74FBU3X0SVJFrQHsAxkzgzpYFkY2H+m9k2DmnS5S4UShVeDwZp5XJH00Gr0Z+jjAxy8Tq87DytAcysUVaCrS4ezqXFgCcOSVWcI51tphJ0ER9cDrcmOTAibB7+Nl4Y2xqkpDgzmBM9ObDj4qjqGfM4FcUVZ+v4Uxr3VxhseNa6DEcb27WcdzeI1P4f36P0x9htLYkPeKuEKYYRwbaoVfMix9f0T4ZclHb0owjK2QWj8aAz32SywVa+8I2XpApG0H6SNOGpRJaGAvJY9IiEeawLvasTUSmKYBimiiw9kTr6h6pat0NqYsdMBNq9VO0a0q7KeMM7lYAlMASlthpVMb8nVsWOb3T5k34JruTz8A7ZOjcJafIrMAjHGcew/BU1zmfYfqgfu4KAyLtzjEuSHnydz
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(6666004)(82740400003)(7636003)(356005)(86362001)(47076005)(36756003)(36860700001)(16526019)(26005)(2616005)(1076003)(107886003)(2906002)(426003)(83380400001)(336012)(40480700001)(8936002)(316002)(54906003)(70206006)(70586007)(110136005)(41300700001)(8676002)(478600001)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 07:57:05.9149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9437e5b-8692-4306-a709-08dbc578ab12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7911
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently some names of init()/exit() pairing function are not
consistent.

Rename pair mlxplat_pre_init()/mlxplat_post_exit() to respectively
mlxplat_logicdev_init()/mlxplat_logicdev_exit().

Rename pair mlxplat_post_init()/mlxplat_pre_exit() to respectively
mlxplat_platdevs_init()/mlxplat_platdevs_exit().

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 5b4e57c37f2c..1bad4c64f36c 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6291,7 +6291,7 @@ static void mlxplat_pci_fpga_devices_exit(void)
 }
 
 static int
-mlxplat_pre_init(struct resource **hotplug_resources, unsigned int *hotplug_resources_size)
+mlxplat_logicdev_init(struct resource **hotplug_resources, unsigned int *hotplug_resources_size)
 {
 	int err;
 
@@ -6302,7 +6302,7 @@ mlxplat_pre_init(struct resource **hotplug_resources, unsigned int *hotplug_reso
 	return err;
 }
 
-static void mlxplat_post_exit(void)
+static void mlxplat_logicdev_exit(void)
 {
 	if (lpc_bridge)
 		mlxplat_pci_fpga_devices_exit();
@@ -6310,7 +6310,7 @@ static void mlxplat_post_exit(void)
 		mlxplat_lpc_cpld_device_exit();
 }
 
-static int mlxplat_post_init(struct mlxplat_priv *priv)
+static int mlxplat_platdevs_init(struct mlxplat_priv *priv)
 {
 	int i = 0, err;
 
@@ -6407,7 +6407,7 @@ static int mlxplat_post_init(struct mlxplat_priv *priv)
 	return err;
 }
 
-static void mlxplat_pre_exit(struct mlxplat_priv *priv)
+static void mlxplat_platdevs_exit(struct mlxplat_priv *priv)
 {
 	int i;
 
@@ -6429,7 +6429,7 @@ mlxplat_i2c_mux_complition_notify(void *handle, struct i2c_adapter *parent,
 {
 	struct mlxplat_priv *priv = handle;
 
-	return mlxplat_post_init(priv);
+	return mlxplat_platdevs_init(priv);
 }
 
 static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
@@ -6522,7 +6522,7 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
 
 static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
 {
-	mlxplat_pre_exit(priv);
+	mlxplat_platdevs_exit(priv);
 	mlxplat_i2c_mux_topology_exit(priv);
 	if (priv->pdev_i2c)
 		platform_device_unregister(priv->pdev_i2c);
@@ -6544,7 +6544,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 		mlxplat_dev = pdev;
 	}
 
-	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
+	err = mlxplat_logicdev_init(&hotplug_resources, &hotplug_resources_size);
 	if (err)
 		return err;
 
@@ -6603,7 +6603,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 fail_mlxplat_i2c_main_init:
 fail_regmap_write:
 fail_alloc:
-	mlxplat_post_exit();
+	mlxplat_logicdev_exit();
 
 	return err;
 }
@@ -6617,7 +6617,7 @@ static int mlxplat_remove(struct platform_device *pdev)
 	if (mlxplat_reboot_nb)
 		unregister_reboot_notifier(mlxplat_reboot_nb);
 	mlxplat_i2c_main_exit(priv);
-	mlxplat_post_exit();
+	mlxplat_logicdev_exit();
 	return 0;
 }
 
-- 
2.20.1

