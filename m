Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E6CEE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbjHVIOW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbjHVIOK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:14:10 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C04199
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDyHFs7bZV4kuwr/EHo8y7Vk1JrjqCqhK+XlCgQ2hguHrlaHmJmek42/MjgqnY39KnLgeTf0IE3Srmqqfgrro4UXHYf+zVEqDfAm1W4FSm8xHm7rcyiGYhi0bheVpGe2hRfYFIh3Gu+lXO9dJjbNA2Typbqgi26lgXBQnENAUCTcoJiHKrhZYigKKT8NtyE3DvE8YH1JMosNElkfeiUK3uMb6xjfsCz1SjpIfYQfygf8/WIGlB6WbVfvGofR9agN3uTu/Oz5pO1BFJvgwqnWtsbhu5Pz+TjMtagSEOgu2XZmZFh6pRYFQx0PZoY0gRbU+8u8pjDZS2v8N+W34Kdqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIZeYryx9TDCKKacvg6wm86AGK8SKK5J7KIELI0D4hc=;
 b=Qm5C+LW8wQfIdcXGpYEuKgxAI0Uh+riaJpM9Bz058/j00BW2K9OZO5TCGK36RWhszPKMgLqhF5gMoEsQa7wv+2yXNqmZ6oSibjrk5I5ZOjP7WLLLXbnC3/gCj7WHV291Fn5fCPSxitQpLqO1BmV5AHCfuT4CrVK8BWVuY1G+mFSy5+Ca/P2Vz51J0Zly8RzxXhY9KFxD6wbPKkeQZqs1JfZrb3DhLQvtBlZzJUnlRhv+nOIeL5ZAeteprPfn5i0fyRw957TAI+KZVSWrrJFyXJKYi9FqXPGCC0f3dmeZ+5Rw1oxmYTq+OA0kMxTjhA+rCuYfLdn97U3JTZbYWgPFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIZeYryx9TDCKKacvg6wm86AGK8SKK5J7KIELI0D4hc=;
 b=aC9L+vF07aIYYyq4cawRHsTdXMbX/a0FqUz/YkbGwCVVZDHXzoC0weHlS30m1wlwNWfh/smlPrcvbishbOqCHrsoxiBpJlplFOrz6aj7GsvQwwHVIokV5MVDPVipRbRDcgZnUEFiqqH+DeG1ET9EDB2UO3PsFBQTqoqRp8Lu4uLijZ8S3ZQhIaTQBU9rUCfZVrPWIg/8oyg08YYjsG7noPVO1bk414qwxAEqbKI3xZzWGOZTAt3Hfa3ZdZtmHq/wiNZkkLIMyPLEVpyBu8wKI/sIkF8cK1+MbDNGfT1bLQdifjB/0JL7Y0dNwhsZr/d/UT1YODkSITMuNPtUAJTKAw==
Received: from CYXPR03CA0047.namprd03.prod.outlook.com (2603:10b6:930:d2::8)
 by IA0PR12MB8974.namprd12.prod.outlook.com (2603:10b6:208:488::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:14:06 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::61) by CYXPR03CA0047.outlook.office365.com
 (2603:10b6:930:d2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:14:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:13:56 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:13:54 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 01/16] platform: mellanox: Add new attributes
Date:   Tue, 22 Aug 2023 08:13:20 +0000
Message-ID: <20230822081335.64344-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|IA0PR12MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c4a82d-a72d-4160-8382-08dba2e7c105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2AD3HqfJ1/nQpTSg2PIe3YQxoVI5XGppbFwz7iXGJOh9tEqfcEmPzbWDWuDDHnfmGP1DS+j15K5s/oZQxKzXks7pPb6tgyH29b+g29r3A/eDzQHpsibXwgrMznC03EYeSO5isbq4ScQ87x4MWfyubepk+LrYGavgdXOOLz/aKn91coWCXZlDJmuFaaq54LA+KycmVqgl8D+0di886Hbl/QNoQFxqtXnhm0VELF8ywSLoXPzgKErBB6xipBDG4RVEtCJe/y84lin/0oQIkZ6niMIr1I9JjI0ca1Xa6b+G9hbNQw0TIkrOTwDld6tp8jlWjAXruMF9Vqr+aUGCsY0AWXaKsNW69EQjOUhNWrpPNZ5t1WJxqvIph4QN7a9Zj5iK6SQongay/r2guhsq/nixF95GXnRQJMr/9Zr1YtU2XZFGDzO8TAhlJ4jn7yUxKzuUWB+cVA6arPMtCvKafrPBgaI48sa5hHzfGbj5h2+WRlP2IgDt5UWiHF0hLrc2AjfaVfjZyVUXY+x3/uw1oIgilb8jRAMm/AzGOPU64srBYaSsJLYJRmmt8/z4PJVvvCk52wVIORIDnaVfabg80NUwbA5z2pIQelzgM+WWJk+C6Gx9ux055WWQ0vSlPtI77GMQz6OZ1j3P1oxhAB9IsG16h5i0S2G+mBE1bjkULfNGQFD5DqX4yIE2JJPMlVcb+ZQuwpf5hAeOkKx9EtK1jA9Z5EESeJ5ufqda/VHCrrW885Vvs+8QDq4QVR7HszehKnQM
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:14:06.1472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c4a82d-a72d-4160-8382-08dba2e7c105
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8974
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new attribute:
"lid_open" - to indicate system intrusion detection.
"reset_long_pwr_pb" - to indicate that system has been reset due to
long press of power button.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 7d33977d9c60..26748c285ddc 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3792,6 +3792,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(1),
 		.mode = 0444,
 	},
+	{
+		.label = "lid_open",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
 	{
 		.label = "clk_brd1_boot_fail",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
@@ -4431,6 +4437,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_chassis_blade_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(6),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_long_pwr_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
 	{
 		.label = "pwr_cycle",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
-- 
2.20.1

