Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C22EE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbjHVIOY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbjHVIOL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:14:11 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAAA19C
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNerq0UJIHy6lvo9gbckggO32Ur/+k21cvmDLuwvntqG6LvYvn7uRGFF9JhEW6WatfA3BgkExiTy8JAXy6WwNwTMLt5Usg3K7eqATL5POTdLrb8w+9s44S7hEklH5i66PQkxoXjQWXPuX5Y82ZJrbOgHbBVf4MC9mK58i6Uh6zxtD6s4R5ckbSnzyXXR5JCbQUAwasqSWL1w1JqBCzo7WEizdbkkR7mykm+Ud3j2IZcbjaEof2wan79VD8ARScJCI6wEh3mLJbxrLOHtaGsFjpeoMgy9UGv6pJPd/fzKOwj9N0LGNQMnkZxhOQGy7w3vWQERpF/vge0Cp4SakuKP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPek/w+qNoYF1pEJtXSb7pmfguD08PdEQsM9mbykCaE=;
 b=oGEr+1d22ivG3EoV940Qjra3XRQqdzzH5HObA+4Bd+4I+h3ovQjCNrE4kkoTU2shgQQ6qn0+3F/EmZjrqAQoJczJPbXRiR5gUj1oNjStCAgP0yrUrrZpoKOyOYyJLoohAR+g2HUKLne+rDWEjFZFu2IW/MPI5pfV/evGKYW20RlHnb9pGoHoG96osIDgA+re7ydNkkJmteD5ppLc7f0P/aHmh/6UocsfyIOdRK2+4sqOHV6Azlfi2P+SLjh4O5K+TrXMoU1+IlLdtMcgcDS6iSM9/PXKAs6N8Hk5War0dgLm64paIOQ3Hlo5PUreRWPNhfpAAOXZ6f2CF1iEleXzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPek/w+qNoYF1pEJtXSb7pmfguD08PdEQsM9mbykCaE=;
 b=b7nj0ISMDp+TSPdOtjJaExR+3Dx9SPStCSnB2rLcXNE4a784ljcMtZybKR18nlONfWBrhLnCjUGPwWfwgTzNAgwN0XQjRYcm6wRYJdWKdKEQiBpVpCUCzzNX55/osCChtHMCs6iLo1KYyCTNAXMaeOF1eNOz8G4BbqhoD6FsaqcW8OxawMuR5BbhnydZ6KCjyU8U1qVgYPHRg7ORw+bhn2hGQbSjudok1J9ZEpQLyvvjWGY84VnSMRDW2ZYDPgZCNAIefB3PLuZoEiqaJ3+5Rr9OLnIDvvo5drbRt0QhXLq7WaRRTVOmonvll4j/2oKKurZIp5ALF86bFqrek6YZlA==
Received: from DS7PR03CA0023.namprd03.prod.outlook.com (2603:10b6:5:3b8::28)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:14:07 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::bf) by DS7PR03CA0023.outlook.office365.com
 (2603:10b6:5:3b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:14:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:14:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:13:59 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:13:57 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 02/16] platform: mellanox: Add field upgrade capability register
Date:   Tue, 22 Aug 2023 08:13:21 +0000
Message-ID: <20230822081335.64344-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: ce580244-430d-429c-8d97-08dba2e7c1c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z4fXDvF70ihlukL44TsLFQlbzwideJs63BffGOclGVSNMWqtyP83+0hh9JnikQlVzw2wadNdLPzLJEIIQry+kPp9uCjDvnd6VSGutzOfaSQjs8r/FwhabWKt5ogJsGoJ7oseDqfJ22cY8AeZm6KUTX5FKt0kjY9aYCcDORC3sdBZ9kxOhffJqUZ8EXDFzUfuwsbc1fXGi4oolHGrzyLOs0/io2EvG1DzZiLc6V5Yjfb92c6FRWTSuMubzHni9d+a0z1+Ll8/c36AgIbNAA2vcK+RW6M7gHECyvB0c8okG0sQtTydqKpURhmSDBWRXPSyQ7M0gbDRqcv+gXrFwHgYfEkpHzO0BmeCw+vPauWu6tnrLowEkeCS5rLbRZ3GUxdCmu6iI6BQS2EWjaKiLq99Vk8tzgV/tbUu2eUJ4Y7C5t6i3w0uC6w9/2kgJ7eO54a3Wdv1vEBYTn5q02qpmbdKz+aK2HausQo3EhBNCXCc7pjyuimktm4DJrG+uyECktL67Z09e9DcP/Jp0Na7H5P24fKHeUmeSkAtecn8CfDoVAsV0adkxuRJJ76n3iaygXJmoOplzOHVGaQP6TQ3pIRPx40zGTaF7On0erMHoENy8VuxmGRV4FYe2qOGZhxADcMdHA7wzLyblrIjKoX5ZhW04XTrsxi0a759mK/0b7ZN6Nsf6V4jTGKTjzPQSPVxwxSoYm9Vxi7VKN+1W62B4qWG/OVV7KipGLIeG73Ut+1yxoL7DWQHdTTORAAIDuS8R6qw
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199024)(82310400011)(186009)(1800799009)(46966006)(40470700004)(36840700001)(2906002)(54906003)(6916009)(4326008)(5660300002)(8936002)(8676002)(316002)(41300700001)(70586007)(70206006)(478600001)(6666004)(1076003)(107886003)(16526019)(26005)(336012)(426003)(2616005)(83380400001)(40460700003)(47076005)(356005)(82740400003)(86362001)(7636003)(40480700001)(36860700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:14:07.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce580244-430d-429c-8d97-08dba2e7c1c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

