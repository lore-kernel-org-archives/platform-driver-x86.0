Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F014EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:14:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbjHVIO2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233735AbjHVIOT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:14:19 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC37CCC
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwy4ODH25axeCtHhgvrRH6WKQV+tAaY0OMkAsObQd6PwH5g0fDS/Nzahi4t7yajX4SgQ7w36ry9na5XfYb2Si0DJTmvryKtIitunI3mwcDCE5JRIrGthxdAYGAFcfGXe0ds6zePPoV2FmJ/Yz20pbbDHp8QjPFHh25DSaIAWAoAfBm8k+9+P5CKX6ApSnsAR6XXRPdP85VxCHDnzwnRvPe2Rd6/C8ncetZx6trk+TCWm+1ztjqB1ESdiaL4LXM1T7CVNgws7jIaJ+A6gVn4Q0VbYADcQKs0Whi3A7MTyEJC2o7hi8HUfFbLXMS7nTkXwbESUpDTaGKjoJD/SXJinbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYcbPxarzm812viRsh5O9v8hBIG2TPrCpgsalrgI0/Q=;
 b=aNnGtmLkumn3512I1NES7Queh+miMoe9u9kKjY74a3dYOhMz2aZZK13cF7Uvut5GYotRjhHuCud6rWQlzLyE/umzs5MCHiD2CcmyL6yy+HwB693ZoxB6UvydY+i+rbyUM3p4IqnCQqvnyk5QwjO/jLbEYLJtsWOsLKY8Z+32OMvhIZeCgrLvVo92+a2NEiW70oSxfb8MhA9EWGFPE6ducemrOM6BSK1jmcOm90SllM52YgW5SOBWRWeXeTGGvaVKErcWLI8AWaI/IR5z6LCiScXnVOkJQ9lTLSsqxg1YjBm0pkvReOPWWZfhp16UH2OgL5N/9MkW4z849Rx9R0ZVcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYcbPxarzm812viRsh5O9v8hBIG2TPrCpgsalrgI0/Q=;
 b=o3gXNeHd/IVe3lMsjXRQ3ui/SeBZTyxKGLt7SO6Vk3Kk7J50QABqU7G/+bOt+6Tc/XRxia1JFYPkfgL67mVFr09Hj7M6PTopMLUz06Gcm6XL9nnZqNI/suuKBUcfu2kr8+5onOIbbV2jlPVFk304K0NBbt1HDnoK3IjiyKFPu799Be5VcAOzX5C22Vy6D8KkWvIc1HXx7fRTQxZQM0x+yOlccwAbvDb83cuXxDvVtAMi8uxQwngWxquXKAbdg4bNkUvAuyTSiugLFq0v8IkPwL9S1JqETKa6HG1FKQ2azk2cOCUybINaMvrBysqngpX2Cp8mQpFiMjoiz24t4GBYjQ==
Received: from SN7PR04CA0151.namprd04.prod.outlook.com (2603:10b6:806:125::6)
 by PH7PR12MB6394.namprd12.prod.outlook.com (2603:10b6:510:1fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:14:08 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::b6) by SN7PR04CA0151.outlook.office365.com
 (2603:10b6:806:125::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:14:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:14:02 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:14:00 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 03/16] platform: mellanox: Modify reset causes description
Date:   Tue, 22 Aug 2023 08:13:22 +0000
Message-ID: <20230822081335.64344-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|PH7PR12MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 10eccb6a-2b2a-4c7e-59e7-08dba2e7c214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3P3f0jlyDav4HfGizmoJ3AlMEzCLDBN9tIMDnC3CFfN4+L73hOVB9HMKEIsyRHaWHjECFkfnKMH2ymWTiEMlUIl/uIn0wUJehDsNd0pbMT6Q9WEK/6w8t9Ns1TGE+TjzLI+AcfH4km0kKxoRuT+sJTPx2RZXUyHQnNqkBQetLg8ruDnSw08dFPcN3AJzSvEbIH0JJd920Mw2QrvPYFMhHIc0tETv4VBC7oYwso/HHTzK1JS6YBfPK7J1WPGSy/kfRXyfA09shUyMI2g9VBuntulMXS5ljvd9Aw1uhWAlzSFDmaKdO1P6rGF6pz6OBrygAJSLBT0+f6iq+A7JqYodKGV6qcCA79Kkfj7PFhTFzQCBe5CJuUqO91joz/muWfG0hJHqL4SQSctkFped0Ctk3k/tAJ8rFrZeIQtyh61aXDwCLLzvtU1QBaSu5BnpHblFIuk49nactlwaOHVFXbqge66y5rw4oudLW+HITPu7R/pS1IgUJ3Upo3X/UO2aU5UFY3uaBQQ1n5ecBzkS5HuLwUrmdqU/wUsR4FGbN413LBo89Sk/3dg3OidZSHN2Qs2EYtYxSBMWqyNeysgIOayRqIKUgCydb+xlPeqMb2C7/QSUvoUHbH9GCtTs5ofIZCl7KUDFOHo3E80etqzcFUsFbK4poGjBAfXMuQErxSPlcBv2aNU7X20bRP2glU5Z9YpqcbuSy0QzArWtLxOcqJiwYZy5x31SupxAy0781QVReSZiwqu1yK/PLYn+VbAALlE7
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:14:07.8753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10eccb6a-2b2a-4c7e-59e7-08dba2e7c214
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6394
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For system of classes VMOD0005, VMOD0010:
- remove "reset_from_comex", since this cause doesn't define specific
  reason.
- add more specific reason "reset_sw_reset", which is set along with
  removed "reset_from_comex".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v1->v2:
- Comments pointed out by Ilpo:
  - Fix misspelling in commit text.
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 647a10252c2f..5b0579752afb 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3556,12 +3556,6 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0444,
 	},
-	{
-		.label = "reset_from_comex",
-		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(4),
-		.mode = 0444,
-	},
 	{
 		.label = "reset_from_asic",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
@@ -3580,6 +3574,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(7),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_sw_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
 	{
 		.label = "reset_comex_pwr_fail",
 		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
-- 
2.20.1

