Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E88E9370C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 13:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjJEN4C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 09:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244040AbjJENu7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 09:50:59 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::604])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054E483DF
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 00:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIyfN3w+vxrooBCsEbVB/YJX6nNVACw/yCbGk/PTiFMJ0xbaQ+VAbeELikRukV5ccLmqMNQe/TsOWUycgWZJ5WKSeAZlwinRZxV1h2XyXjqT4s/P8TAbQen8Oh4fkNrkFVf4t+Z6324dyuDoLt8VnxyqdT6dfVNi+jj0gS/gckjqUWE/0cKXa4toJDvWB9Q5Cmv3Eeq60f6C5rcMNHkILQtWW99HMhkB0q8B4YZW+QiIjqcaSi/80j4z7xWtHdG575Sk87biPCHIWUacY1mMyQ84Skxq9hGKSa01j/5EOvkD/BbmEF9poAKw1/YMcLTHOlcoO4wnXRz8cOnd8R5UNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tod4HBy3gYhfo7gdRswQ+ygZSS106o4wAJ8obdh3+wQ=;
 b=Em+NEV58Bqy797gh5kTkNFrb3ZkTviSCzY16KU/PuxB0L/wK2UTCLgzpApSoWL1lSp1/yN4p3yBVDXAPZ0b6Wd+VMHQqsHN8rPFUmpto82cXAsSM0H2mrE8zNfgRzC0zWeOae/9xh4JALQeMlKXiW5vdIslliKKoHIh87JE6bKe+Jb3vPpWBEbFVdCI0ohHfFO6jeNE20eeQm6LcFvpFgN+0aYC0nYDWtvoXQmcX9E410mI0GFFG/WVv7LHyQTr6bCqsPIuCwM0pTNrW/Szn/mTE4wB0yMmpxOxfSO/7lXU1v3OLTEt/TUFe8acb2CVzDuh037SZVE+AfvBWyITHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tod4HBy3gYhfo7gdRswQ+ygZSS106o4wAJ8obdh3+wQ=;
 b=Cbok2TaVczhkas4lkz9NL4U7eZaChNU82qCrv2DUYmtzwmcdFwsDHzxkdmuFI/tcLt6C8N/fGpkVospOeVJDt6lXBXfQhBiScEY4Q2lTltSlBHlxacgjzEbk9jGi/y67Go5n8s5L4TRgbM76BRKD7WDTmqG7Q8qkVHe5x/JnOLePWsC7EgWZBzvsUPuEerU6XxeSoafeoyFXCV+6Kq0UAknoCB9njxE9WcANAXZWf/JdFgAcdW5G1lXmLWSLOtG0XKU0D3FGzRIRKhCFNCOANFpdqz1cQf9q/R6L7OgXClNF0RanGhb1eh8QLCbC/m2py4rpA7FOmnAN5HEOyaLI+g==
Received: from SJ0PR03CA0133.namprd03.prod.outlook.com (2603:10b6:a03:33c::18)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 07:57:04 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::1c) by SJ0PR03CA0133.outlook.office365.com
 (2603:10b6:a03:33c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Thu, 5 Oct 2023 07:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 07:57:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 5 Oct 2023
 00:56:44 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail202.nvidia.com (10.129.68.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 5 Oct 2023 00:56:42 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC:     <christophe.jaillet@wanadoo.fr>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 2/3] platform: mellanox: Fix misspelling error in routine name
Date:   Thu, 5 Oct 2023 07:56:15 +0000
Message-ID: <20231005075616.42777-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3e2d21-3cdf-429d-1ffd-08dbc578a979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mZTKOdd2qBmYsjVPBrHZIjzmNHIkMOrvkFgQbNIjszHUryQlMcPwc60INyxNb3+rl/XdWU4Tn/qv+yNoiF9O/YPhY6m1IqRk9t9jx7wcisVdxYdkb575Act+imSNaTRAWAk43CDPjc4lusHGtArRkqXnd7IRSqOWH70CFQD4iz5S5m7RP68FHNOtOhXYCsuvEJHpw08AO48vMkMY0kfzmAYAvT4zKFcNSeaVGpJeVwvbcAysYVbgt0NgVE5uYdL8pbUARfxwbhe/MsSzZGXJN2LS0MV8yZuZFwyau4VRToCDat+WPxedJsvCBB2SuT9JnbWyWRvONo1aCOHVTT2KZamWjJU2lRGmZu3MN3FZp1qFXQ0Zg0p2GC6oF7unRkPWSWMOU4t+/ParKwyBDAXuxCC2A47Op4eps1diIiN+KugysXawKi0ggtgpza459O2hzIE9q57fP0mxErU0X27wpzp4XI/tQy+BYYuAJ6fnjIxfBUBMMwEV502x1nWTqFhRKaIlXeZY7pZQvy4ZuEoDTMqfFpES03gtZXxsk/Ncx7CihhlwrxIJy8+xir3gGU5Si7dLC939aI/T3Z08k+enjdmW1RwPA2/CLK1FtQdVjuMaLbSV28cnaOS4QHHXzR0CTGbj5MrMedy64yZaA63XZqWyWrXGQkGs6HSoygQD0lZs2hMXp7SYt6qk/mEsIh9jQVkb9ClXPEUyL4kMH8H+jhbOVowdAaXIXIpaROgBr4DE+/o6B/WZh+JW3A9w0Wz
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(46966006)(40470700004)(41300700001)(1076003)(107886003)(110136005)(70586007)(6666004)(2616005)(70206006)(316002)(54906003)(8676002)(4326008)(16526019)(8936002)(5660300002)(26005)(336012)(478600001)(426003)(40460700003)(2906002)(83380400001)(47076005)(82740400003)(7636003)(356005)(36860700001)(36756003)(40480700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 07:57:03.1685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3e2d21-3cdf-429d-1ffd-08dbc578a979
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Change mlxplat_i2c_main_complition_notify() to
mlxplat_i2c_main_completion_notify().

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index a2ffe4157df1..5b4e57c37f2c 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -368,7 +368,7 @@ struct mlxplat_priv {
 };
 
 static struct platform_device *mlxplat_dev;
-static int mlxplat_i2c_main_complition_notify(void *handle, int id);
+static int mlxplat_i2c_main_completion_notify(void *handle, int id);
 static void __iomem *i2c_bridge_addr, *jtag_bridge_addr;
 
 /* Regions for LPC I2C controller and LPC base register space */
@@ -384,7 +384,7 @@ static const struct resource mlxplat_lpc_resources[] = {
 
 /* Platform systems default i2c data */
 static struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_i2c_default_data = {
-	.completion_notify = mlxplat_i2c_main_complition_notify,
+	.completion_notify = mlxplat_i2c_main_completion_notify,
 };
 
 /* Platform i2c next generation systems data */
@@ -409,7 +409,7 @@ static struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_i2c_ng_data = {
 	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET,
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_I2C,
-	.completion_notify = mlxplat_i2c_main_complition_notify,
+	.completion_notify = mlxplat_i2c_main_completion_notify,
 };
 
 /* Platform default channels */
@@ -6471,7 +6471,7 @@ static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
 	}
 }
 
-static int mlxplat_i2c_main_complition_notify(void *handle, int id)
+static int mlxplat_i2c_main_completion_notify(void *handle, int id)
 {
 	struct mlxplat_priv *priv = handle;
 
-- 
2.20.1

