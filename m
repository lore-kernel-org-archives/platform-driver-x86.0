Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0061F12ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265709; cv=fail; b=TZrVmL85FYSnxDnVy3wqNlnjTgen9GWjnqZxh10i3Ns95HSA849RFyR0mXCTvzuYedKf85Z2uawGUSH0N5SMWOGqKeiaJtwGQAe+lI3Fgvej5o2ISrVRnMULx1r+gVXrkMysxd9y0xSSFftUO0Yo3cpbYJ04J3WKwbhIugKA9r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265709; c=relaxed/simple;
	bh=VexmID5bMOP7v/aWpPky6YYiT7rj9aVPpQNc5KwHpH8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rixSlndHi5VsGNUdUH4UDLAb6vh1SNo9XjM9tgVOLWI3ScQbelftkk53ZKPvczGZDFCPlToP7P/QbGCEKpNQXmW+AvRmBgvlztRhnDYgqzEIlwkZj5QMXsLiyZxOVZtP5CoMc0hhoeNHqia/YcrhHScNm4A2sFhOl7soRMzHffQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WVzhZxUj; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WVzhZxUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzwfhXA22vwQ8BL88H32dEuX/TBNRmOb/wiYGsiBJECAqt9IKkPLDwE8DaqZOF33nQc/h2TkHrvv8OsZK8f3Um8UveBac52wUScLjETCxWBxzJ/Rv9uOOiN9AqKpAqcVs269iMG59Hm25adhGwGzT3CiQJegpf77uCwORw9+ob4hzxdXHDo01LIpuw7kceI9eTq4NIpqgrArjDof0l8pItZy0V9KwqHJESsFtYi5mrPx0vE9Zqo7GaNcWFnTXKh8vgvihBID3+vqci8ZXAu/PfLMrIVYSBO1k8rFsnVDOSzi3Z9rASoAY2zpD34kTMZ1XwIOOs/QUnKxpVdI6kqRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSX4lo/HgrerSYWzvMv9lOZjy3KZCALiL5yiAkFFkcI=;
 b=caR0Cup3VninpDwUJQpxTn1tz+9DllhcWUM9CDbrwSJW8LcIlEU7JVwp5fM08UkovAJE2B4IUB9deABysGki41gjeJGRbgC4wuAOh8PW+q4G7Cgy8YD9Y03an5Pwb9PoZvH6aRJzY83TPRHdH4pEUzPvy1i79hU4RUAQck+CMS92edObEAa1hJqgn1fHNhgjJqF2kq0rOnWHT8jf4aoEanEVb0KmKr5nAPnk4DEcSut+KHKWdJst5606MzMpuy/QbUIFKoLQ8PFxxddq3+Aj1lQSMkSPlYvFCVVS98crwKSSdS7LO8pWpJ55+zhDYSn5odUOnRNJeaRAWJ77zToz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSX4lo/HgrerSYWzvMv9lOZjy3KZCALiL5yiAkFFkcI=;
 b=WVzhZxUj1kz43XmvL+VO8EVg3o21LjEq3YGqD3NyL+h2uzfIM/0zVsDhnaWaMmOCV43PyaRlZXtgDGToqOKcyarytfMo+zWXNYKUg9Yg2u44L8XldcEYIxo/XUpsK5B5r5EHIWj6PQf7MIsSiOyeOVIs0h29h0Nx4JS4Lh8bdA6iH7HpjF/IVjIXIXoUEAoHt3iGYNAXV7h7uZlMaur4bqYmCoy3JefwMk5LMY7SFNeq/EOdD7ovFh6/TnT6q5AqAFT+y4ep4WKN3mib9x9WmY3Kkafm56E9C+JTMrNKHS/93ERrINqceoHXEdhcqrnn7XLQaccGvWscBvGVaCQVCg==
Received: from SN4PR0501CA0054.namprd05.prod.outlook.com
 (2603:10b6:803:41::31) by DS0PR12MB8443.namprd12.prod.outlook.com
 (2603:10b6:8:126::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 09:21:45 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::81) by SN4PR0501CA0054.outlook.office365.com
 (2603:10b6:803:41::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.11 via Frontend Transport; Tue,
 11 Feb 2025 09:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:21:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:21:31 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:21:29 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 6/9] platform: mellanox: Cosmetic changes to improve code style
Date: Tue, 11 Feb 2025 11:19:09 +0200
Message-ID: <20250211091912.36787-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: af009fb1-18ab-48a6-0eb1-08dd4a7d80f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LMkzfBWX4TIryYxG+kACQubOrN/UxeS2uDPWSMCIUuOTh4h2D0h0SMAmtdG6?=
 =?us-ascii?Q?UITBsTJA4ASuNSTu46iAYkYK0OWPjYjLH6olcdoOldIFBw1IOiZTG8UTlCAI?=
 =?us-ascii?Q?vpfhHYsben6AwiE68Wyjjr8ig2/WnN+Z2NdeinBs3uBo9WUmWdXmmebgv3Ud?=
 =?us-ascii?Q?/7COxZzFkdHTKVs1xZNx5d+enLqq88VTbJra4B5E4YdolgHGrUxf57+Lwsw5?=
 =?us-ascii?Q?kFStsWXUtHETSEHNIDpwLib1Lk3UM+AK9Al0WdFH2xSnLcR+8P8DCTrg08UE?=
 =?us-ascii?Q?6z60UVX92z/S6kcVPEWrFWCfcynIuYSo8L0ny9g5J+LrdAhNbC2VejeGu7EP?=
 =?us-ascii?Q?TDzMeNodvz7FvbDwigT6arqza30Fjqw14uaR2awI4wG3d8GnShl1MPSUHfaU?=
 =?us-ascii?Q?RLF5xfuUZO7xWLoimw6tb1s6z9tFtFxkFRirkf+OaHHEB8lpxC7lkAHIZy0R?=
 =?us-ascii?Q?CnUVm7DMNDXIJz6iOt66+IoDQRaIice8T8MZXjhmBKuK4JcBRLuqbidpprz1?=
 =?us-ascii?Q?F9Dcu9zQSo3ey3h4uQurTx3xfyuzo4wRizChkK0TtcfEwhA5alBBedhS3UbR?=
 =?us-ascii?Q?qdOaTS4rGW7DQqj+pW7Wix7qaNvT5Nu8cAIp4X0S3mUbgCpRzYcuRpBWuu6w?=
 =?us-ascii?Q?2WW+lkoQJixNXGaEw9wIXOjHO5RnGYd42CVmXpck+puD4os/NacpMo0IveZB?=
 =?us-ascii?Q?LjF6oKyvst/FqjBCDWVWCfJR0Z+CPN7wlU7sg3s46DwC9kyBL9D5DL4FsisL?=
 =?us-ascii?Q?yDTrzxjYvhRTRKz6DbKSWX0EyQk4KWFxJ0O94QFq7f/qXdiQL7wZBl0WYdFJ?=
 =?us-ascii?Q?Fd1oS5xJJlZWKOfQaYb1SaaRkjzUmWLPZFCfhLtok29CRNDjrCNSqR1XrhIZ?=
 =?us-ascii?Q?HWSeln7M6Z4+j1sIcNjBKSNmwwne9ade3gClvG2sCoMiqtrXibtfkUouypJ6?=
 =?us-ascii?Q?B9tVScR7YTd5byW1fjkKctUlrizbc4z39Y6/C2PdPUu6Mpx7p9txWg/c3bHU?=
 =?us-ascii?Q?sUAfJ9cRjkf1TWVIO0SU/VaB9O2SyQLbQ02xn/TKbykp6IgD8FEouGlf5n8z?=
 =?us-ascii?Q?X+v04osev00nzHE44pnKCVt32/IBj9lDTujicsUYVVcDZUKApLIzlgXFOVnW?=
 =?us-ascii?Q?J1krtN6p4TtLkrxfuluHvauTrMcrd6fnr7evIAgcP/7V9Uc76BKs5XAkmElq?=
 =?us-ascii?Q?s/7DdJ9DUUyDQ62ZY6cDJwkXOBS/JE8p9FifjW43BRcMllbHLP9ZB0AJdme6?=
 =?us-ascii?Q?vsbDJrdPzTXfQfMkfWqfRlQHvUbM464TxwBRwbEVwZtw7AfWUQEqPpXOolHK?=
 =?us-ascii?Q?OnMyRze7GU+dolg2xfSNMnYCn0fYQmsIj8HQ/x7GcR5j8CSRiX6qP6NcG6UJ?=
 =?us-ascii?Q?TiAeEWkQ+MYZ+w66tXmMKp5mcj1E6rJXeY6n4/SdtU4CeuDKaxPzgEVSF16R?=
 =?us-ascii?Q?sg4GmZDYDDXGbbU7BOWxni6/tqmDQOoTE0Z1DcNdISBU9POtfE+l86Yvsb+D?=
 =?us-ascii?Q?d9E0bKWp9M3iTa4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:21:44.9655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af009fb1-18ab-48a6-0eb1-08dd4a7d80f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443

Replace in 'for' loop - /i >= 0 ; i--/i >= 0 ;i--/.
Replace in 'while' loop - /(--i >= 0)/(i--)/.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v5->v6
Comments pointed out by Ilpo:
- Fix 'while' loop in erro flow.
---
 drivers/platform/mellanox/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index dc1dd704f8a9..bb50db717baf 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7849,7 +7849,7 @@ static int mlxplat_platdevs_init(struct mlxplat_priv *priv)
 	while (i--)
 		platform_device_unregister(priv->pdev_dpu[i]);
 fail_platform_wd_register:
-	while (--i >= 0)
+	while (i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 fail_platform_fan_register:
 	if (mlxplat_regs_io)
@@ -7870,7 +7870,7 @@ static void mlxplat_platdevs_exit(struct mlxplat_priv *priv)
 
 	for (i = MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_dpu[i]);
-	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
+	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
 		platform_device_unregister(priv->pdev_fan);
@@ -7915,7 +7915,7 @@ static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
 	return mlxplat_i2c_mux_complition_notify(priv, NULL, NULL);
 
 fail_platform_mux_register:
-	while (--i >= 0)
+	while (i--)
 		platform_device_unregister(priv->pdev_mux[i]);
 	return err;
 }
@@ -7924,7 +7924,7 @@ static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
 {
 	int i;
 
-	for (i = mlxplat_mux_num - 1; i >= 0 ; i--) {
+	for (i = mlxplat_mux_num - 1; i >= 0; i--) {
 		if (priv->pdev_mux[i])
 			platform_device_unregister(priv->pdev_mux[i]);
 	}
-- 
2.44.0

