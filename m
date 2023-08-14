Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E50C04A94
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbjHNUfR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbjHNUew (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:34:52 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7A810F7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izdGFLN+HwfZe6AGnrFCkABnKpB+bfMh1xl4Dc4gP7GNoxFeTmFEj9hNzUJHokE6s/E23cjLf9R4dtTag8+9seq1UW8J5nOs2l20afiQGMy/eppKhXT5JM9TI5m5m14RaQHB8Idzkxu4LWXcv6rj9JS5XeTKJYuiPLjl39aek+Sbu7wH4Dl7Pn7HgaOwyMkPO9RGcL2a4wlspKa/gq7DKkDI8Ws5ACZXoUCnTIo9UnzROdP5qVNgAaeoCevQZ1o39aNrtrbDnJrXY39y435x4JhZDNbfTQjrUKdZJ9CxfOaafEb3CPj9ZwtpyZ+OEJXI/SJn9iYY67hEbeM/1CiVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3o7zjrxWmcBcgOJbtoazQjgaf0vR/PH1EprPS7AjO0=;
 b=bMP1XIWRNuIKNAhdJVbQASxXh4J9UGHKDiPNg6pgwKQrun4gTpBizsnWZ3EnzRUV71AtC5o1sYPV5eNZTFYHr+bWCAzusI6i2kl8RjO7zatfCxO81Waxxnv99xYrXd09UYTFcJIhkYKyJdJ5sGvYxdSRdZYxeTIo4wkRzhabsUTSCJHj5WPeRPaH24hkIdrS5HxbBGCb4d3xY3LmvM1dz3M8khywANR6A/sDfD/621BnUZjaAB8kHIxXSKyY7FsUyN3VKSepR0JOLAAZc9pHyvPefw04sEXbOWogy+gtYk4rgEp0QaeQaw5/Hac4iEoeQ19v009kHLf3HcrySEjgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3o7zjrxWmcBcgOJbtoazQjgaf0vR/PH1EprPS7AjO0=;
 b=TnYbv9BRs6er130qVwz0th4UFdF2Om1X3H6mjKUUdOaKz+9+UsYts88fvPs/1CU5LAhtBD98bfx2dK7MWfScg+wv1B8R2RJ7jMFZoRBh42bLEBtNy9TVCuK3kz+jAKTL/vlmReheF5huIbEycIfmKTg57wPoBBaqqFx+BkvYS+ZDmnphC79K58W0fX9Q/DaEYAIZP8V4hJsE4uwrhvpD0H8jLFD2eIpTokrBgTMW4lPXj1WR26ZG+Gq9cx5wiYsvr1UGJd2+sonMuc5jFuOAlNJj9RwIRPqv+uYkG1nbCPnA3L7z8gAJ0DXy/6EV+DVqDF7L4OIdkcrmKpDYhmhTaA==
Received: from MW4PR03CA0334.namprd03.prod.outlook.com (2603:10b6:303:dc::9)
 by DM8PR12MB5464.namprd12.prod.outlook.com (2603:10b6:8:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:34:49 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::18) by MW4PR03CA0334.outlook.office365.com
 (2603:10b6:303:dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:34:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:34:35 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:34:33 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 02/16] platform: mellanox: Add field upgrade capability register
Date:   Mon, 14 Aug 2023 20:33:52 +0000
Message-ID: <20230814203406.12399-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DM8PR12MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfef072-9898-4885-ed65-08db9d05e7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YoWjvc0oydFuTJBgvgwBli5DEZxtiDgOYEVzzzhDVdMd1QjZMgSnZ4KPG+M7Fstz48EW7BvfNmO1lZhpAnYspPH1qoKoMrDgVej+9jT68JRTUhdsX+Ki6sj+UFJjPKfAdUd+XLTAYWedkuiirRqFh4y903WjiXPY+PiFnTeoeIPYMzjqoxqUwBvxKF3V+DOrNQxsYgDTPs7Q/wlSkISrF8l7rmzGmjvPjdgTgCNBlY0S8Qdwbo02Sgy6z7wGOP2xjHzxUQY1fK9Fbigc1/fcro57eQcu4LvbhE1G/Ov/xz2eQda0U/gvjrQJaObYdwXCPejUyh3hN+KUryNplhjG+TUaMyDhYGqRX+dH8XTfuohtkTeRRifiv9D8mGMVt2zdxgT6q9aDdyYW3G0Jxk3QIfaM2GgvcYfJ2RO1Sw/TqpYrPHfu4fdVt0iNK25JfGa0kwlH/LIsod7c8QzHFlrPmoKuWHu4AQiMIRaCL+Kx1mrtcRPinfxzH5LDyKgQ1eTn9urtqKwynYKHOvGcRZgxVUBp6FbTB1OS29f0LYnZSjy3e1CtHTC1vjdBaaNK+FP5kxT/VHDC3kPHxMjEcO8nUSPUWDoaGVbLEa3RFmNQ/MdXKshbrUD+zHPV8zmV5S+dKko1NFcph2lXQlINEjAdqITj2jVNWm+rsTPIVova02fWdWAWW+uvasrS9LB6lXl+VK3EIeiTTY//yUV1jnRIw6+43fIu+6+DUY7e9L/pzhkWZ9qRBwRfEYemW3dB8OMS
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(82310400008)(1800799006)(186006)(40470700004)(36840700001)(46966006)(40480700001)(54906003)(6666004)(40460700003)(478600001)(7636003)(356005)(82740400003)(2906002)(5660300002)(36756003)(86362001)(6916009)(4326008)(70206006)(70586007)(41300700001)(8676002)(8936002)(316002)(16526019)(336012)(107886003)(26005)(1076003)(36860700001)(426003)(83380400001)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:34:49.4029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfef072-9898-4885-ed65-08db9d05e7fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5464
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

