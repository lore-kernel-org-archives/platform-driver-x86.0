Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2608EE49A4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:36:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbjHVLgo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbjHVLgn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:36:43 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA0EE55
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKt6n7YnPuG9ZrodUgcIJ9LUfgk+AzMNjCbJETms/4S3QFMDnth0wCzTjzjmYEYjrm1ULBKbx/gOB5sqD72f7G9flEkgwGdQboXM8WounY4fHd1Vo3xP+xaU+XeRM2vU60QMubjF4ZBWUnU8WcVTHrnBTnVrPMRIXhfVublbqQ75p3bsnO8gHoHjtnUz/yMBQrvSa05+bTRzlaLJehoyg75eYMHORhXSDSWVy/8xXU5faxryTOwHwo4tjXDFEr0wrzxLZGmsdMg+bYrgwvre1vskOD1bcDTkdhqhBx9oeBDewpHfluOXjPocyUBYL9v01VD0MFZIczRHCk5aIqgZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYJcvvO5z7mtS4Aj+peji7SInmO4y4qh9GiO0d0Kqw8=;
 b=QOzmTqdH6jlQbqNYgs8+jM2+OKNbAVxXZ0WglnuGxAI/flLN1pKGWid4C7XTBqKz0MHF23NGBx6LInzZ75N1BE3W08LSQ5ygvPA8w01VnYBvDJHp24xWuoZp8v9fr69MDX+h0yYvoI2EshWdQmGI9YCIj/nQ0uv1ZAEQSj4OepMj6rCBKP5le3Ku6ekxPnC0KPOyMKCArhrkSHJprkiIVb1c3Eyq6Xh6AMu01oLA2Mr7unX7Wn3zSFHi9d7ty0L5U9oeI5gMQx8eKROLxDL98mCfq9WgdyiLkxezIQnRZz0tRoi/LgZ6K2gnyQeJqhDvnzLqvvBlCPG/ILzw/TOCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYJcvvO5z7mtS4Aj+peji7SInmO4y4qh9GiO0d0Kqw8=;
 b=e1clBn+gRNWmDmHTJtMZ+L1TO4SISSGjsXlD8pyatVMBIRfaJ1g7uL6NtFfOrRYS9xiKxt2X1Nfu6txcpRXdtcQmzHuhTtDd1AGlc+ViuYiClXzgNFyu63bwRHca3VsTdMfPmjiN1rfbipKyRxFDdsU77UTAe7Vm8g7NSdguN2gVVp9gMqJtgl1FWdEMUHYh89bNgqO3taI+35FrQDlui+Od1LTVF3hv95/G2zRUzf+30EAStzH+uwgUXNg/zccl+PlunAC1vKilvANqvtmAhnHbZNde4G8I9YLpLaKMPkhVmFxm7Ru6Za1W0Tz9WRR5ccZEmZCX8gw88gdo+Jy+Bg==
Received: from DM6PR03CA0023.namprd03.prod.outlook.com (2603:10b6:5:40::36) by
 CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 11:35:30 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::9) by DM6PR03CA0023.outlook.office365.com
 (2603:10b6:5:40::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:35:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:35:17 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:35:16 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 02/16] platform: mellanox: Add field upgrade capability register
Date:   Tue, 22 Aug 2023 11:34:37 +0000
Message-ID: <20230822113451.13785-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: 501adca0-c2ef-45e8-2aae-08dba303e3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9qHfpA8ErHFIXtWukfirXfs6qBVJNOE+g8WH7zeGei/cVKMR/KgBiVNACZgozAQpHd/ExpZva2EmDgxAY0MImwMjWJkL9/wo2v/2ZdrUaNGLzhN1l9Lpd8Krpd26ILZiyXUTo6SCF++HBzI0gE5i/6pFdCvHYhr5dLvaXfAKsIJuaBYYpH2VyT6zqU7E3qK+0nNAxzdolvI/jQXadV+Dx82wWsu8yRgZ0NHweNYxtgsnfUA+YlqsUJ+CyGyc0cq39jlVqdkh3ELAeWQ0bBnOVhxIdvFCilexYiMUorJZgkn7hJfrEEFFrfvg6R0DSTYl+yyMWsbF/8tH/UmlC5ze0sUK4iwopbyRFQ66WECmC7A8O00HLMVaeOI/Ox/P4TmijbW0x+BGL34PEEbRPyly7cakfAm5nsdeAfLRUOSzRKhZFbH4qQh07IzX/EBhj1CT7Ti8iWq+9UfFRiWVf7dU2xucSVsQlmjhdYHlSCHmTcT0FTSf8eJr8GCj6LauOTuAgCT5hmc3s1EyJDTMLFz5Zdr49+t1XsE3Z9BM0elQ6cvSVa8CzMjR0bp2aOnLYfs63oOnAesoHPmlQOpME70XCNZfuIs//FrpSSAUPVhbrqKidYGH8kCNOhccQYaXNsNsVyz3OXkeoB2yW3gL57WK49MjUVvSViS1M27SpJ1EDLw+AqZVc0VQIi/0hO0rClnQXEi937rME7/v48o25e4p1ldTlhDhZJ6Ft5s/bo8V3OZgehnGcwyron64V8I6eHv
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(83380400001)(66574015)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:35:30.1903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501adca0-c2ef-45e8-2aae-08dba303e3ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

