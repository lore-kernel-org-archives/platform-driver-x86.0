Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29B54F81
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Apr 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744449579; cv=fail; b=VipcGchGFILqms6ATEQJ1kqzK5QhGfecX0OGsRjwRRvoy/pMLCVo5knx04x9txcPdHhShamyT6Z8NWqcdIV1TsG3IDUFPoDI0xa7PoqdY9R6sRHGRzgOp6wKGVLxb3i2kg2wS8veteBXxbE3hGdebMDGPbM7Wl3HE/PJw/PIRq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744449579; c=relaxed/simple;
	bh=t010WsyCUavli02ss67soSTdkorditYXSxkSfC1ctTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuXnyf8UszzKTP/Fj7MUJHJrbrO+EuauOJrVq4S5asUNTbB2+K3uxO/0sH4uyn4oxvZSjWCjgmI+7I/N7LLA5JhNaemR06bStbQu5sNNkw+DZNKKJYciiFzxoGYedy5bOJEINWRfSJKlL6TXT48keCysVTtUOAqdTGQm0IWUAWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sjcxCucC; arc=fail smtp.client-ip=40.107.243.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sjcxCucC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2QAjh/VLXuHIcxRlC1T6zooccaYLx+vuhPSIrdikg9oZJpuRTSNY2InWuWrPIp1NJaHfIQZT16pi90hsSP9elkj4AbrsheNNJa3tFAQiSLKNwXVVD4YjgFBwWKwZEc9PuV1KpUo2XCd7p8p56ELfuQg1Xm6KlP6fxeOMXWF4TsvG8aYqBKN+BBpdnJNhyhgfnRBmsl75FLc4pqxKl2WacZTFA5Exf4akTaQ2ItXSJvt9CSU+AS6whlxKLns+nIGpU5a9I80gHRPRcGph90G4xH2nBz2/uEucl05zAGccH+0U2wVNOqQqXk3+bKKuXWw5wmgVeXuGaAjZAOl84m6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08TKOROQVUEI24UFcvoeCPq7wNj8ZJIjKOs7/IxuDeU=;
 b=jEL+EO8OymApD45QYcQz0droBsIyOqStKYWxlPLjZgO/arBebRHDMtAg+KJ5mIwDcWmGhktVCqjUBYOhoNEqHgqjjoYVSZ/1xDtxa0V1klS2HtF5F7oSnXQoQQtX1ZQYy1KLtP1y4OkfUu+jvq8xyvN51nbr/S2YjXPcavz7Ce3GadwKL5N5c9y+LMMTYW22gajWitdAC3NTz6Zl/GMLla9KjdMdFwX80f8oKVE2Jzxd6VNZq8MKLD7KNRLPynKmMLg+ceZP1KEdqQ8rWPTHG1FoYdt1mlYERUg9R1+I5Dlh2kLDhIjAZOZ1fiZUp+g/IAKna9261HhIajivYiEDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08TKOROQVUEI24UFcvoeCPq7wNj8ZJIjKOs7/IxuDeU=;
 b=sjcxCucCrUk9bvErWoKDVOgS8V4Mg27hV2JewaKau6o6eQZHHj+kBOaTcQ//Mf99A7iF7wRLt7dJDspwhnSmkW4WQOaKcWEnuFjQrrvt6P4Lo0+lsWw3/bBtv5vuqBJGRxmTHaKVsptSmWNXJFf4I3Cak1z4djjP/b1d90jVgSHXC+eBFQR6a0pHzNTVSBjmF1Tp3t1FndOfDAplL9hpydppSpCgMDHOFmOAwVsHuZAP/AE/ar/N7aANEMaE5Tu8TwCE2WEx1KZVLTAhHkBHfUGWH6OAAi+FDrbyQu1EPRKO/ST5IG4cXJR36cAclnne2OFxsoTl2+Mx4+/r7PFMQw==
Received: from BYAPR06CA0015.namprd06.prod.outlook.com (2603:10b6:a03:d4::28)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Sat, 12 Apr
 2025 09:19:34 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::ed) by BYAPR06CA0015.outlook.office365.com
 (2603:10b6:a03:d4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Sat,
 12 Apr 2025 09:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 12 Apr 2025 09:19:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 12 Apr
 2025 02:19:26 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 02:19:23 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v8 4/7] platform: mellanox: Cosmetic changes to improve code style
Date: Sat, 12 Apr 2025 12:18:40 +0300
Message-ID: <20250412091843.33943-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250412091843.33943-1-vadimp@nvidia.com>
References: <20250412091843.33943-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: d706f4c2-06b2-4efe-998c-08dd79a323ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?afxMpY76m8bTDifEUL62ILREGpg+E4FCaZB8grytRlTkw8T7BSWsXdzW2gB/?=
 =?us-ascii?Q?oNr6veONe2tNOukoAVBIelZuQsjwvWcRkxIOsk+l25t9niu8+19v76WWckza?=
 =?us-ascii?Q?Z8EbQaELUfJnoT6I2VIPXc8xGh3V44f+gOMXUyiT08RYp1MOirciNaoSBV3H?=
 =?us-ascii?Q?evCVTfvU8RR3/uY7tvel0kJbRyrxwNNztLKbOBOl4GLI+vPOp7h8fmJVtDKb?=
 =?us-ascii?Q?9IrmK5Rl0mDCGoXaDtBE41tKULx8zO59ETeBr/NSWY7jc9zU/57VmqY/hGO7?=
 =?us-ascii?Q?pzSZzyB+BpAxzUOgUi9wpRFs6v/X0+eE3518AgKLwyI9E7qnTRvjh70G4Pet?=
 =?us-ascii?Q?u+J4FF/hyFhsU2YxxtyQnjNk4UpjdzB8qZXPvSCBlbSeTDIPW7RitO6qJNR5?=
 =?us-ascii?Q?qm5+AArjSoC8Fy15NTHwOFfSBdpBEjSDl/xjLQfIJl//hO/9wy6SXTnK7GxB?=
 =?us-ascii?Q?+KkSdN94WSmgm1+gMifdY/++Qxw7ts4zVmtt/oWULnYVaVbIf9TRlm2WiBLL?=
 =?us-ascii?Q?10AHZJuhPdMlP3/6ZavUaTbtBMma52F+ROEuILOHxqR4icAeZHmzLs8vbOr7?=
 =?us-ascii?Q?0VTvEuVGWCY/6EsjTyu7XuopPa27VzklwKqzT77BCz4wBbsLn2PEleOqF7u4?=
 =?us-ascii?Q?t078fG46IvPrba7Sf5fYfiJXMXR51le0tGkUEywHTiJKhbX25Ka8KMGdjGu5?=
 =?us-ascii?Q?A5MxRxZSh78tf8kiC9ULTxj2sHUha03sGURZ+Ei5CPRu1lSbXv+tJFN8drJR?=
 =?us-ascii?Q?AbgZE9MlfDhuDeFgEGEeYWVdCil0dRiCpy5VlHpjExu4rQkPixJoRssasO2T?=
 =?us-ascii?Q?LVyP26xD/zH+xr/WaYBFdUeeHwm0GwVOPs34qrbPAI6iaHWxc2XUyCeU5h8h?=
 =?us-ascii?Q?8FAlNokL0nysvv14d9leKPJlFNp2YwaBktxuaix1NFshwbhr/m0EiisNZ27s?=
 =?us-ascii?Q?g8QV1/pHx/Lce4/lSRBgapMLg4LepsD9O9wYkxiTPdO42KdjbEuYBLuIfkbx?=
 =?us-ascii?Q?oGKT4IsTGJ/7bmpofeEbQOrW3GHCOeTSpdQH/8NGMGCt2UB2AQs5ypg+Pgom?=
 =?us-ascii?Q?k6OAFYQIF5vThav3wl81gt5NncvzZ5Un4Keg1mkXDkt4FAWcnKach3GPb/up?=
 =?us-ascii?Q?jvxfQJyJg5YhtzOJxl3LbIgL2xVxTMEsxQGcFqbFNe82zqY4NFvEncFFlkI9?=
 =?us-ascii?Q?4+//G4RTHp3FFwoB5F8KgHGZRC7c3a7J9im+1sFsJEK1G0cY4ELpJhMwcnPW?=
 =?us-ascii?Q?uqd3biQsnb+Of+0u2CwYwx1F/lsSxIMWOx2Ae6uBbBBkpA5fxP7CkcooxB0S?=
 =?us-ascii?Q?DVZNiH91PCLvyWg5VG84I0np+9zlfJwT5TzMGQISOrI9vLkl2ryd24VhRZLL?=
 =?us-ascii?Q?SEddONuJTe7Qgg6/+hRXv6TMCUyX5GW/y4wXpod+hbDu4X9r0GZKtKR10N0/?=
 =?us-ascii?Q?8vDkQD91A8ac15+P9bI4yXQGbr4BYEavmR3/PaR1jHAZ9q4gOmKieqCgizWR?=
 =?us-ascii?Q?UYDgLxdn6IAtsNkzI2DdLT14dxzxPFR3DIl0?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:19:34.0307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d706f4c2-06b2-4efe-998c-08dd79a323ab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

Replace in 'for' loop - /i >= 0 ; i--/i >= 0 ;i--/.
Replace in 'while' loop - /(--i >= 0)/(--i)/.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v5->v6
Comments pointed out by Ilpo:
- Fix 'while' loop in erro flow.
---
 drivers/platform/mellanox/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 29d938265676..4c7ff22117a6 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7807,7 +7807,7 @@ static int mlxplat_platdevs_init(struct mlxplat_priv *priv)
 	while (i--)
 		platform_device_unregister(priv->pdev_dpu[i]);
 fail_platform_wd_register:
-	while (--i >= 0)
+	while (i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 fail_platform_fan_register:
 	if (mlxplat_regs_io)
@@ -7828,7 +7828,7 @@ static void mlxplat_platdevs_exit(struct mlxplat_priv *priv)
 
 	for (i = MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_dpu[i]);
-	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
+	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
 		platform_device_unregister(priv->pdev_fan);
@@ -7873,7 +7873,7 @@ static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
 	return mlxplat_i2c_mux_complition_notify(priv, NULL, NULL);
 
 fail_platform_mux_register:
-	while (--i >= 0)
+	while (i--)
 		platform_device_unregister(priv->pdev_mux[i]);
 	return err;
 }
@@ -7882,7 +7882,7 @@ static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
 {
 	int i;
 
-	for (i = mlxplat_mux_num - 1; i >= 0 ; i--) {
+	for (i = mlxplat_mux_num - 1; i >= 0; i--) {
 		if (priv->pdev_mux[i])
 			platform_device_unregister(priv->pdev_mux[i]);
 	}
-- 
2.44.0

