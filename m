Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A34EE49AA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbjHVLhB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234809AbjHVLhA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:37:00 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973D3E73
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPTVw/etwisNdw+DVJ1HtVQQNePWGkRJxfwWIfDgqHt5/gk765p0qOUC5bxP0lBhZtTZO9ZaWqRpIexWQT1s+WL0wsehJvkvPmqRF2tyK4sOkOodSEc7+Ry3CJuhKRZEvQCwoJJR5xTqWN4cBENNbaKkMhf8IjaeMmQu67ZZBR1hK1E9Ck4OImYyOc79X+NvLm954soWquxDYPcGNGrIyOSe7jzWV1iMw1fzwSGO0Qr2518BJYOIvp7agZGPr9atmLxCvMPdLuJ4N1PFlnp+87hwaAcLihxm1fMtvaNyYO8B37zrl6awojbUe5WjkWwExo5pHS80lQBoJMdndN2EgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhsmHShZVVLGS2kZ8IAd80RFBg4z6xPoLTucVxd14vQ=;
 b=GYuSnoLuxvrTslPEK+37VnPxDK/PX3d22oD+RyST7RDEM6joVD6/WQUYsGOWbsYEOD1Z+oCh8v5PsexjgG0m+NV3l2p8vr3V9WaUPPVNnLDZb3Kh00vhR+qcSSYcGsGwdDK9OY1rz/2mr7rXBi4burqtOnay82PLTOp24glTp4HuVxCxi3UYNp63nKxqof10m5IJsvtyci3ZMZHfDqH0sl5uAEUpqNlSP6e/VrPr5XhxbLumrtOJP3moMROogditDg1180J31U28h46Mgg+hLvYGDQgXcqsaqMtz6rfLL87U8J11e7e11UOra4m0rLgKbostnv/HUGWz661FcBjjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhsmHShZVVLGS2kZ8IAd80RFBg4z6xPoLTucVxd14vQ=;
 b=WKgG8BP1QORtRLmYnI3JUcib+lJg+x7z7dIfzMYIXCNn2WgMezNRjfHEron/p1HG6+FACTeSwL9Zyxe/63z8RupwWNYvQqkqcB+YDdXL6RV2JTy4A83+SmwVF1x5+nTbrspeBkrdYfgZ+0BZNJauSnhePn20oiVSdcnauGiIpYjrtPyFkt4v8a9m7WVYc9q3dFa1VZfuGPWNiSr/7lYk0Xdg1H9HRvjfuHlx1fGG4UfI+mkaHhZ4oLFMOJJTXraGrtlfxX3urxfYc2NIukkXLCLdSKaBpskPwV0Gr6JhLSsbLL0jM15ey+CUm/y8svZGtunGhCyFCCkVBF14wt0O/g==
Received: from CY8PR11CA0041.namprd11.prod.outlook.com (2603:10b6:930:4a::13)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:35:31 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::15) by CY8PR11CA0041.outlook.office365.com
 (2603:10b6:930:4a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:35:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:35:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:35:20 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:35:19 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 03/16] platform: mellanox: Modify reset causes description
Date:   Tue, 22 Aug 2023 11:34:38 +0000
Message-ID: <20230822113451.13785-4-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5f9831-7abd-4c01-c3f4-08dba303e45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NNmdU7ba+rDGnIgy2DVJI3OGtjhI+u66WY3aDyFbleQYGwapdCSVtoU1IXggC6Oj+XPII5fEK7ZVNBzogXwTO4sjyODVkKfnMY5+mlWtLnbRo0mwqjb3Ur2meVAKi0jo1yNNh7YcdZNMFz4hxLIeuKlqgQ0OhKto79gDOPFlZeoh1SKaUNSK6wQ6HAl1r5gCAOraaG8YjJrkbf26AcJb/tAorHmeAj3mELGT+nqi5j2gGdC2uxty9Rt9MnWn9BkXeEnRuhdOGB/XbiWdWK9I7hhi4c0XUTrOupeUcu9s+XaiKaaCFk/9tXJ15RsRmToPh7OvTTQD5as8HQW5uYmW06cP+jjUl4molAKVV/Q7Viz7yCjPoYQ/vmUpZfff8Xu8TsyoS9czkD8gKE0AkgHxzT8inZNZefMJC6dXGi2aJgVGdznzkdJ2SLu0eP78ghmNMNw9sQy4u49wIGpj0zcdHanPyIkY/x5Eja+IrvTkyhqMwgDbtaITPL7zdcZG/C+h6mks8KXRIMgn+UnyBWDuDletdReIcjaQ3BOA+IrPLBS4BD0zDJkgTbyUGrNvy81/po/O1K0qMtx/0iKuw0vBUKbw72+aLcvfkERzoDzVla49bEqb9NURrzUD2d9QSfMO2Jolgp6a+Vun9ikU8n4JqD9O50pW6n0l0+2XKo8gHFRNQQ/40rqG8teoi0rDOpAhJV6eRb0XC61S6M5iCqTPCYmO8f7vBNoMxRwUdfskmqViIk8AwyNLNONz6fd2jQ2G
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(83380400001)(2906002)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(36860700001)(86362001)(47076005)(8676002)(4326008)(2616005)(8936002)(107886003)(70206006)(316002)(54906003)(6916009)(70586007)(82740400003)(478600001)(356005)(6666004)(36756003)(41300700001)(40460700003)(1076003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:35:31.3830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5f9831-7abd-4c01-c3f4-08dba303e45f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

