Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81510C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbjHNJIK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236061AbjHNJID (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:08:03 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1C835A3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e70kPMMDAD2DnmXom/i1uTUrIz2bkZl3CcUjuKjN7JFtW2b0f1JoSL+XxAjyKAdxHXTU2nIWzbd5q1gPqwZG8wdyEQmmuhlNFm5mOB/NMNaYKRpAi2ZvGbYUrapy555S9KUhR5w9YlQiYWFxjYAIhIzK8oCSic9weufOUXP3yYZMqc0C7Lo95wbIoNPZIsXFeJBgzvveSxC4iQ5phaTzsJuZdq2xCvulEmMY2/OMTmdx3VHqpdXFVBWg50HUaMPB7WlLIm0fiz+iHaw4n1MgvhCxumK6OTCIcHco4PxWW6Y3aKoQg8CNokjD0oxD57Br7gXjOqpxfCtycJx5Ixjtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3o7zjrxWmcBcgOJbtoazQjgaf0vR/PH1EprPS7AjO0=;
 b=MwhimDvskEMU6bqhJWqzS4Gv1TWKJhwCrygvzrgGB4g60RSM7crVEynVBrSTtfHMCMW0UNrOL19HEjn2gPR3O/z6oVKMaMMYyJ+JDU297+kSTF39Pf2RrivycP7i4qtiATUCYLNmEgdgK8nuJ9jYLrJP/VwlsC+UpDphRTeC5UyYJ6xPS2kPIEdMXmxtvCkHnEbPUKfJSl4a7OU4LpW3By8thCtmmoEkZAm45zzYTSFv6O5karO9HyBuOSmozlhasR4JiwhlSZeFFifqyioQ9M9kR38eOswys+u1P2LvAEaYpflIUUA6R8KCc3A2zXZw/+H49VjgdOoBpPLXangS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3o7zjrxWmcBcgOJbtoazQjgaf0vR/PH1EprPS7AjO0=;
 b=OcyaPyC3NeygYTUoSw8PfIGe3mgGSwSh3FA/qxg0gt4+xdY6NIaceXvyicwjoPyrotmE1qxXHiyUcg6ToaFFD8fN8lJe9TKsWMhsN28i1+KBzhFyqh6pYDBR3lUl0ibjyW5qTIN89yIaj1CHPZOYbXGe91CODDk7Y6kAxwxgrcrj91veNyVu0iRXwCTRTTkdQA+h2e3ivtsd34NS2qsIxkfruiIlqwyETzeEJGqbtplE5c0sDUzVNUpmbvHiuQLdSb/A3TN7kW9l05D1UA8R+0hn1Tf6PTOX8gwvez+vTRlJXqqm+h9Nmtuwl6VXKKlSPxL3aF/c+xhIOEeCeW0+lw==
Received: from CY5PR18CA0014.namprd18.prod.outlook.com (2603:10b6:930:5::13)
 by DM6PR12MB4973.namprd12.prod.outlook.com (2603:10b6:5:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 08:59:51 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:930:5:cafe::55) by CY5PR18CA0014.outlook.office365.com
 (2603:10b6:930:5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 08:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 08:59:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 01:59:36 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 01:59:35 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 02/16] platform: mellanox: Add field upgrade capability register
Date:   Mon, 14 Aug 2023 08:58:56 +0000
Message-ID: <20230814085910.56069-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|DM6PR12MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bace4c-5c4d-4f47-e68d-08db9ca4d1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llB+pZuLYCmJODofcxCzeuZc7dC90e28285z7+g0YMisG6cL0guXz8zCtug3CGShlsyFhhwr3dmft/ciX0AShEtGT72fjP9lB9aMWakMT/EVyUuGMqRdYoSkrnCqtA7317oaeOoIJOajD45cdLChwocPgq8YAXhmvtQQ5Epjz7yFCfL5i2TgBKo20L9swnC0s9keTJDIpVZFbkzmMd3j5Rc/VEGxoAkKZWiq0f6TyDIxjhjd9juyHaH/ck1PH6QJi7rElmvPNRAm4F+rD9dgLol8kNAsvt1cX2FwOqtPt/CJnjwu0UHIMqy0SwZtyfZIXg1RWFsejXL5ytQzqejscINLMltuIIK9spVxdk9ks3c0lPc4bAnN1CcKJY5ftye0yCkjQGYiO9C9K36VT/I/558QPs8P7AmReYoPdZyCLAocjfwAVeUm2zLVtAfYp0uPmQvtsWGDSW9bkMIji+gp7Q1ApgH/OQnDZl3Eq0zjSivQlKj5XdTbTRyv8qFyCDmH+u6bEvLGjk5XcvsDzDmXxh2ifBs0rAQ5lNZa+nkz188J4nxnTJhxW1hC4Rx2vbrPxw6kxt7GUH2uyAXLFjZvGzdjm0ONK0stoR+/rBdU64aFI9HO1Ow5v6nNJ3BUIrOPKn8FJ5owfnMl3HKVKHh0Hrknd7ss5Xi7GrAIgIl+wny+pB980eL8yJJfAd+S/H6D7/rkOiOiLNzE+5zbE+zaP8YmWU67kBrfb6Ol842cjlnycwnubVOMOPrtwM15C36S
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400008)(451199021)(186006)(1800799006)(36840700001)(40470700004)(46966006)(36756003)(5660300002)(2906002)(86362001)(40460700003)(40480700001)(83380400001)(36860700001)(6916009)(4326008)(316002)(70586007)(54906003)(70206006)(41300700001)(426003)(16526019)(1076003)(26005)(107886003)(2616005)(336012)(47076005)(8936002)(8676002)(6666004)(356005)(82740400003)(7636003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 08:59:50.8055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bace4c-5c4d-4f47-e68d-08db9ca4d1ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4973
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new register to indicate the method of FPGA/CPLD field upgrade
supported on the specific system.
Currently two masks are available:
b00 - field upgrade through LPC gateway (new method introduced to
      accelerate field upgrade process).
b11 - field upgrade through CPU GPIO pins (old method).

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 26748c285ddc..647a10252c2f 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -62,6 +62,7 @@
 #define MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET	0x37
 #define MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET	0x3a
 #define MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET	0x3b
+#define MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET	0x3c
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET	0x40
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET	0x41
 #define MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET	0x42
@@ -236,6 +237,7 @@
 #define MLXPLAT_CPLD_VOLTREG_UPD_MASK	GENMASK(5, 4)
 #define MLXPLAT_CPLD_GWP_MASK		GENMASK(0, 0)
 #define MLXPLAT_CPLD_EROT_MASK		GENMASK(1, 0)
+#define MLXPLAT_CPLD_FU_CAP_MASK	GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_BUTTON_MASK	BIT(0)
 #define MLXPLAT_CPLD_LATCH_RST_MASK	BIT(6)
 #define MLXPLAT_CPLD_THERMAL1_PDB_MASK	BIT(3)
@@ -3680,6 +3682,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(6),
 		.mode = 0200,
 	},
+	{
+		.label = "jtag_cap",
+		.reg = MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET,
+		.mask = MLXPLAT_CPLD_FU_CAP_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
 	{
 		.label = "jtag_enable",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
@@ -4935,6 +4944,7 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET:
@@ -5046,6 +5056,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET:
@@ -5203,6 +5214,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET:
-- 
2.20.1

