Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B17C001B0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 08:38:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjHMIiP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 04:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjHMIiO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 04:38:14 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB9D1701
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 01:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htNamaCIx8paGTNc00P4QMMi51oeKnBoDCaF5aKVzNMPIBAciSUMTcj3hy8MbtNLzhAwj1JL0p2AhC2zXDPT+RgLaBLbUYNLtUVYaoBtFh9jgziDC/xB3GakfR0KGLITdFe6aBPmkacOHWqwuJ80xkQr4UDVNPClb7RUMxhWHbvw+0NoxmnRWWhUqedn1qjoUvmYnyoiPwDYLkyLwdCl+2VBnT7LO97dE08ge7LEIE2AmplE7nia4dXImNafdmnGBOhYvHo9Hbc2TNfg5Srjm2R5VT+ffXcOTsbbs4t7vLdi+X59x+DpX69ZpLcHA0LTNbOPDRnedmo3o12Mqxy2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vyT1E9HPdKqbvtwEJHwae/kfaf6N7yUE8spCwR+anY=;
 b=cvvF+SFovufAeursiw8Xjin1+dTfxJS9m6rKvbu3AbNqNYDnWPRxjRWdFAjj3AGSbCmQlUP14gGfBZT+wboMEyq987G241qqq82flggUWG8GRN58ctlfTSBNgSyKhqYmPAFEa6UFerrrC193EzPemvIra5KxRKo61Jxsz7O86e1id52SogLTNg2FYGuU1jiwavzPaAjaUOKxvtHeQma/AC/ktQbDrPw7fojfPVQxPYm/QC+/O7Pt1TM5kyu5rSNFYGDi5F7oR5sEnIjt8BjTHvxVKrTi0Ri+ZTtCJy0PmlklaENxRy7/t4szlraivDu7x4B7oe+yHtJ0WRgpIxTtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vyT1E9HPdKqbvtwEJHwae/kfaf6N7yUE8spCwR+anY=;
 b=MWbRxi/g3eW72mVZGLOshSoKtN2suRGQs4M61prwO0N0bymeeGte+L2xWTvMJX6srP3jH2dV62o5OqIArXMzJNINM8IVjpGx1ku70jEVsg6jykORnMIIuU6Ww6tdwK1n/XTYvzq7K9rLam5nsGaH0QZ6nIZtT3sQb9N7CSA1cDf9xCOH4SvHp9vQsnfhjXudDb0Vd3aVzqJkGRTRFukLSI8aeFYJi1VMM35h6dPaNjRhjf3VHFB3h4cKeLPwC5mQ2zXWG/kxIHtkkgL682OgTLpoj2GEPH9hsWsbRCY0luGuH77k6tr9EtxadgEThmefMV2SCdK9SLR9mzO//rXs3g==
Received: from MW4PR04CA0056.namprd04.prod.outlook.com (2603:10b6:303:6a::31)
 by CY8PR12MB7636.namprd12.prod.outlook.com (2603:10b6:930:9f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Sun, 13 Aug
 2023 08:38:15 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:6a:cafe::8c) by MW4PR04CA0056.outlook.office365.com
 (2603:10b6:303:6a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Sun, 13 Aug 2023 08:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Sun, 13 Aug 2023 08:38:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Sun, 13 Aug 2023
 01:38:03 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Sun, 13 Aug 2023 01:38:01 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 3/4] platform: mellanox: mlx-platform: Modify graceful shutdown callback and power down mask
Date:   Sun, 13 Aug 2023 08:37:34 +0000
Message-ID: <20230813083735.39090-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230813083735.39090-1-vadimp@nvidia.com>
References: <20230813083735.39090-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|CY8PR12MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d798e2-e035-46be-b41f-08db9bd8a2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNpDDkxo0dkIIOa7TJa0V2nC+YLXLERcTtIz8yz6A5XFER5OE1EoPd8Cri4BQLDguidoxdnob6pbXbut8Mmll8IJSjwZ/Gu06NIjSk0cqx8Y04Gu/7Rk8hhJaZg7qR+uKm6IGy7ALe/kq/IzJ8jRAywlbbNoPvx2rc8i/jbZBMy+6Nvr6kGNaSg0a+ezvW4JgHWO+euRolyDBegIYjbet0iy6xMYfNcHT+i6JHQetuCFevS9LnbWRmuh3uARE/G5pXZ1lg1eFcshjA8icQ9qKHvJsgC09dUVTu58YgfUd8qyYHexp2xPxQpsrNxQN62Eq6RshMYak3YBjtCqo+8hdexyjiPiYsgtbCCq/1G1nTeRGkj/hYBFY1Zy52ffRhbUY+zb/LrTZSDm+NZbrSL181D0GfADuPQRmZeqDKkpEAMF6McPTvLzM8DSKRGhyUpwUqF+LBzi3vF7zEMzu+3WlaTEcvvUn4d3ZPSQgejK8thUrWvkxncLBr9sBXfLPXAh7Se15jlBnxa69bE9zTvgOvyTTsEfrS0XcTxE8sd4KZU1/qgTwTbQrfnSlPw1gn6WdPJ42h6A16BTyfVqDv7KBJ6R3hXvXqLHAw5gmyuE3Un0QqZnILpDbsHwMkoqCs7DHKDfjyZh7kGVO45Vpq7h9oOeG4cOlyCIgdA/eF8JmdeqOIXpp+hpTK4YYCREjgpJ7eEojPWYAOxInqo6FLuTLJ0F0fQGUI8WEiPPHP3G5mfR9xI7qS7Ay4D0XMSEQyk6
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(82310400008)(1800799006)(186006)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(82740400003)(356005)(7636003)(36756003)(86362001)(40460700003)(6666004)(478600001)(2906002)(1076003)(107886003)(2616005)(26005)(336012)(426003)(83380400001)(16526019)(316002)(54906003)(41300700001)(70206006)(70586007)(6916009)(5660300002)(8676002)(8936002)(4326008)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2023 08:38:15.1427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d798e2-e035-46be-b41f-08db9bd8a2fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7636
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use kernel_power_off() instead of kernel_halt() to pass through
machine_power_off() -> pm_power_off(), otherwise axillary power does
not go off.

Change "power down" bitmask.

Fixes: dd635e33b5c9 ("platform: mellanox: Introduce support of new Nvidia L1 switch")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 69256af04f05..240bc3174caf 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -222,7 +222,7 @@
 					 MLXPLAT_CPLD_AGGR_MASK_LC_SDWN)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_LOW	0xc1
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2	BIT(2)
-#define MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT	BIT(4)
+#define MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT	GENMASK(5, 4)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_I2C	BIT(6)
 #define MLXPLAT_CPLD_PSU_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_MASK		GENMASK(1, 0)
@@ -2356,7 +2356,7 @@ mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum mlxreg_hotplug_k
 					     u8 action)
 {
 	dev_info(&mlxplat_dev->dev, "System shutdown due to short press of power button");
-	kernel_halt();
+	kernel_power_off();
 	return 0;
 }
 
-- 
2.20.1

