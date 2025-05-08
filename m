Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17831E4BE
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 20:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736345; cv=fail; b=A3V2shREc2IrcpVDm3xB7g+3fcA4GilqQpXW/I3yG/aWTF1D/dpErUsX470wXlpOUQc13xfctlQwwbZFofxFEz2LeIAS0QjGruP5RcDXJivEANDq7hp+YLBpdH/i0WbM7tLHaUA9exAhtbVhS9u8veXhXbNfbLIqEZAGxf5P9XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736345; c=relaxed/simple;
	bh=sR0XBQs1+6/yXLJShuKNSOoJpGopCDHDrZeRoCiSZ18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EtjB9oqk3XUaozbtmsnlc8qqu0MQsj824b7c9awJY4HYwxLGa9E+iock5vG+NvfSCqH9MzAJjjfw+nW+DesU6WFSPQp6fE1do9572PeVXyPAIpciS9gKpUg7KiFE1ZphdJKqyx+uiaJeay4+DBchnasJy/EJiM4RkIOZSKl7IRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qX+FlMtg; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qX+FlMtg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSeAhNeaeohDitJp80sOCujDHeDw0f9pj5lSjZuyUWYdsRmFRwrpPB7Fj35JfjaNTBnZHl+C+KX8KmXd6OHP01WnakKolXo1TQLgKVLUyxdzN0Q+fS48ZZKBW7ohyoV20ZDjkr7KJSIBFGmjI8YVQJIC+e/2///VFtAO9CYR1KdpWd08m+z13zyqiNBihRIgY6y4Q3cD5KtxSuPsNn2uMRQbsAbT92d7u8l0pDEZNxbNisxIXW8gxEnbTzXY/wJNMobE5D0/OG5xpmca72ZwXNCj0tauyizjrHzw2WwCyjzZ7vZrMa1YPNkVieX7frwStafqxSSyboF3jyF73dfacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWFEB9UlQjt25IntSPFlGx2ow7p1SDQjflYdBFEWpHg=;
 b=kwCcJyIwb8bhp06tgCQmC534SMHqXcUeRYS5vyH1m1I7k8t23DDB/kMqwsalMh2+tzoImulTZP8eQ+CQdRjsGrBKTQmtELe58u1YOXHS/9zxzqS7CahPIOCqUJ4UdvAuxT/Qb23dpGRI4pZzJ7UQ3AlXtQ3q/i8vBdTkpm1j+VosSkLeLinAtqEAx8TeAfttVjTNiaQN2ELVqZGG1xqoW6gPb8x2WtjA84bBfyecnAmnoaeHTTEk5lmeK/QGU1YTEo8YqSKfUaidcre7TLMe5P1S85Ukn0mrQ0UhzpmWacfT/wj7LW8Xo4sV4d+yrTcpw8qbWfZ1MxFcY0ntm7kBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWFEB9UlQjt25IntSPFlGx2ow7p1SDQjflYdBFEWpHg=;
 b=qX+FlMtgK4t624qx4wDBJVRtPklq8TvFPwHNxqn+UtEKEpMacrXoyh4NzLvkvJMNDn/J0FKVdCdLrqa5weGJYLIqU21xQRl68maZseFA9djUfEVIpDGe0uO70O9Yy5EPdNwB/9kW1ZIU4ZnuN5Xb6O2rKobX1ZnYhuuWPYGi1XxuvFc4BZQAjZDiu868kxflLwzzkDEmxGz8j6zFY2U1i4dRk9ZltQMfwKoNbpvEL7x9MDVCsYoUmAu1M1MsMyF4RSj+G6Z24tB+OUk5gKtVfiaW2trG7CQRPGT6nDIbP80dloXT6HYMATAYhKSJERdcBKy857ANMnfBj4+VkkmdhA==
Received: from MW4PR04CA0245.namprd04.prod.outlook.com (2603:10b6:303:88::10)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 20:32:16 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::fb) by MW4PR04CA0245.outlook.office365.com
 (2603:10b6:303:88::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Thu,
 8 May 2025 20:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 20:32:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 13:32:00 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 13:31:58 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <dan.carpenter@linaro.org>,
	<platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 1/1] platform/mellanox: mlxreg-dpu: Fix smatch warnings
Date: Thu, 8 May 2025 23:31:39 +0300
Message-ID: <20250508203139.55171-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 29253fde-9cd6-42ee-3173-08dd8e6f6b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nCsXawxJ42l3MrDaeOeFuLAmobUJuH/GpoqfpG5JItuaQGxo58zhci3qoEJL?=
 =?us-ascii?Q?cBETVfTAAwn8NFDONLVlD6rpqHGYajY/Xh1jOFeSWhOc2l3GnM40sEe1JmXk?=
 =?us-ascii?Q?hzGZT2Prg+0Y3Gs3jEoqah0xaPPhwdkefUsvCK/T8jOZSHdFQEVZRstBLzIu?=
 =?us-ascii?Q?u2Qe1DsM/a62DRraL8hANtIlTyG9pKe+8fyQsX171N6e8IKcBSxwZZYBciUQ?=
 =?us-ascii?Q?iYUbtZnMFD5sOUfL3cCkpuKilO/qXTYxpEPfkau64AviPT+fUoar7OgUoRlb?=
 =?us-ascii?Q?sClaVQVbf4CqtrD6oi/liDodrq4S/LkemhU5tpU+oe44plFQVBChhHFKOLaQ?=
 =?us-ascii?Q?Aan5cpmUjDw8ZpHSxVAZcUBRDeIfeq77/aM+yGa0eS0ckQmT2ITSg+d4yOPG?=
 =?us-ascii?Q?m8GXiydxM99W5YEf8nHk1dpmTdWjSVL32lMFAgk5CuOa8BJf2e9W7IeP3dJ5?=
 =?us-ascii?Q?FX+XCIBSv5tPKILB04h11GRuR84vBHQod0wkBOUiV5vGlBVQWvO4vrkiNCLI?=
 =?us-ascii?Q?Xj9D+nqTHz2OqoOnBi1e82DxKGHpqKiIebg3zLWbJ6uUlnrGsx0ciKaYF+4g?=
 =?us-ascii?Q?mfz+/cgA9vY7olFhsL3V/xjTLBR/W+sB77RCrwCxp/HpfuIv8lnQXTAdypmT?=
 =?us-ascii?Q?7DeVAd/zO2XtyWjTZLvkXxuP4iRuzBm7TFlkkIq1zotQ8Pa5zlxbh+qEsMl2?=
 =?us-ascii?Q?bXAdGTefd7KKSq+06sfH6t7VR2qLcP1sW98T2pRlHb0322pOfaziYERLkYEb?=
 =?us-ascii?Q?w4eGsD3vdY37qTEr64t2suZhD7/m7thXIbYkungnzy8pyyB2XGZ0RfjEP73F?=
 =?us-ascii?Q?bOyoviAPiYdgI6WFhbNMMT4nTUiRkg3byilSTbLoyHyphsbWU4omR2OgbqNa?=
 =?us-ascii?Q?Dqdk8KYzfV1XBQQm96aR0u31YygcLcVBO2+YU+1QaZTk5g66CvpSoNBuE7ka?=
 =?us-ascii?Q?m0CmFGPwB3p48xd8Idzx7Ld0SB0wVMLWKriCDe8GvR6so0qn0XKKzG40FbXi?=
 =?us-ascii?Q?lANHsioRVng4QDpR+jcqoQfo0JcxuNQbThYdbqpfytHLA1tLp0Bnrni2JLpp?=
 =?us-ascii?Q?LSuJs+ly7B1mdwti79mbV//wU+3vjRAujxCVXr9bGDvR6j6uAlEqXBBXxmCG?=
 =?us-ascii?Q?cAAjl45K407aimTQM4EF+4Q4Aa5KYhJk5M3Pxn2lB7VigNiREC/o78mUtOV+?=
 =?us-ascii?Q?/gCScwjO7yxPvf/uvgSW5kHls+6XJlET383hppe36PVZbhVZ16n4OkL629ZO?=
 =?us-ascii?Q?cfM2oantnUKXeDRKlAuX8NWqD6Q3TZLDu05lL5sAPO+aiIOYPFHkz1fKZKXm?=
 =?us-ascii?Q?HqRhFY+RprmbLd0ZuoFbBZ88quJILzSF/MILmzf54sB3KONa23BtQmbiDPYQ?=
 =?us-ascii?Q?uLKvnuOvB7QP4veQJglZmZjwsWUAmO1b7ekfgipLdxTeYTsL0zsChikKzNAO?=
 =?us-ascii?Q?/Xv7B/OHFn5CbKxxVOX3HAhaocBpelgri4SrY3s4s/FGIcPNsBy/RXHLmavh?=
 =?us-ascii?Q?tY9BJTpHL8D2HOWwcRNoPj/2qXi+V+3WRhGR?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 20:32:15.2745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29253fde-9cd6-42ee-3173-08dd8e6f6b97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849

Add missed call to release adapter.
Remove wrong error pointer conversion.

Fixes: 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v0->v2:
Comment pointed out by Ilpo:
- Reuse the existing rollback for error flow.
---
 drivers/platform/mellanox/mlxreg-dpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-dpu.c b/drivers/platform/mellanox/mlxreg-dpu.c
index 277e4b8cc5cb..52260106a9f1 100644
--- a/drivers/platform/mellanox/mlxreg-dpu.c
+++ b/drivers/platform/mellanox/mlxreg-dpu.c
@@ -535,8 +535,10 @@ static int mlxreg_dpu_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 
 	mlxreg_dpu = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_dpu), GFP_KERNEL);
-	if (!mlxreg_dpu)
-		return -ENOMEM;
+	if (!mlxreg_dpu) {
+		err = -ENOMEM;
+		goto alloc_fail;
+	}
 
 	/* Create device at the top of DPU I2C tree. */
 	data->hpdev.client = i2c_new_client_device(data->hpdev.adapter,
@@ -562,7 +564,6 @@ static int mlxreg_dpu_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
 			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
-		err = PTR_ERR(regmap);
 		goto regcache_sync_fail;
 	}
 
@@ -581,6 +582,7 @@ static int mlxreg_dpu_probe(struct platform_device *pdev)
 devm_regmap_init_i2c_fail:
 	i2c_unregister_device(data->hpdev.client);
 i2c_new_device_fail:
+alloc_fail:
 	i2c_put_adapter(data->hpdev.adapter);
 	return err;
 }
-- 
2.44.0

