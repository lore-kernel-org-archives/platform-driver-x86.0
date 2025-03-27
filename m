Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B56D1A00D1
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093682; cv=fail; b=HZI8SsuAaeNbcaXy5OJWFKCmHtB7oTCSzL08vBxEXKTEczQSg2TcQhXUxlJ0SX1LkOyXTBIp48wUv4ux6+vUT4sXhkeA/CSdOHTjrLt8KWPSfhu7Uq95vGvgiibj2nkyV/4HOGSpjALegJhKndPliJRR4QzC0wWULnYyMsMZl60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093682; c=relaxed/simple;
	bh=t010WsyCUavli02ss67soSTdkorditYXSxkSfC1ctTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NboFTdW444yJe7u6oi684HFdqLHh/eQqDHEurTQiQCy6MTwKFeexI2UR/PcQc/r1lthpv8DStxGJA7PnDeBejAOOuzwZbXkpVp1qJp00jNRf3E0vwOAfekqf+LqFQODSPR8PMBbw5WLEjRg8bcda+djQFe4U1+SHZe2yTLdSQT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=klLFCpte; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="klLFCpte"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2u7acRtlHm6CqF/rmZRSkQgJOfzBLhNLVs3NJp5Stpht8IgzUxGj/FJ4niqWmh2doUGkN/aUNTFxZtgsb4Sv8SQ6Kmmqch5JBAk4+yRwKICkq2Vj9Z+ROcxQt7kHvtK/Rjwk0UtXFpO2vlf/5hNZX3LVBm126tEC/EucSnZgz0mzfDAUgWrfKI8jdIK9VUx5tpQky61GwfW0uNHa9VGA9IeK2iKNPekTgXdz5Oxc1GRlXkdoparxQEUkf+RbhJSfpJDUfIKUnr0zYvOwajdmO+HypFcNU/bdW3lNP/SDVqo+OkKH+raOKSaL628rMSqAHG9Bmm2wJh9Bo8uk12W1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08TKOROQVUEI24UFcvoeCPq7wNj8ZJIjKOs7/IxuDeU=;
 b=ga679+iJFVNCxi1npRFf0n24sjTm7RXLh4Ka73O44/qEwvi7mdZ66BmdVuDFY/G6iVimQDz0fdMCYS3KK/Xz9pvgDfKdZXkFHEI5d3O40iTyYYYjdunyydaWmuPU6tCn7GUz/Wcto6fi633XxkGt+sMr/WO+dHAojDXnTGYnDPTWU2qp/vI8+fFwpnUfii2ENV0JUdXak1QHIEpTV5eCtYp+NzSTtnvrkHUUAGRo6ruiyDOdhrAkp4lVxGjQrMtAlTFN2HYDqJ5iCvL/pjdA6RTLJAbLc4Kld3kr9+pbi86CbXaUVy4uEpgtdNfxspYMWJ56Ve3gU5gl7WdwKWeN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08TKOROQVUEI24UFcvoeCPq7wNj8ZJIjKOs7/IxuDeU=;
 b=klLFCpte8MPJ1jjV9ujNzXcOw0TQX0JHLq1mNHcpcrUStjGErBk5Q35qgSWt0ZepCdf8Ylw6dIzikeGjq6PM58Frp5SJtAQFaZhm43/v8rcAlCSywUkbjhoijP4PoUiVla3cN6HkW5K6JVb7yFhHQXHlAhYtK7sZkEAJLxLcUpyHi4O86FpBpSDDazC1+axn9ODp84QXAQR9mswDzzFCtI93LN8NUfaBuLcj2xSLk8brZwgIG5I/419t1uG+r8qDCF0tLJAEzLqL0FO8JUUGi//7qnRXWn0Wa1qg05eY4e8zWj+hCX3XwSI2zuO9G/1JiIhCsfdgdZ6MoYf4zfNJQA==
Received: from SA1PR03CA0010.namprd03.prod.outlook.com (2603:10b6:806:2d3::26)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:41:13 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::1a) by SA1PR03CA0010.outlook.office365.com
 (2603:10b6:806:2d3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 16:41:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 16:41:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Mar
 2025 09:41:03 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:41:00 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v7 5/8] platform: mellanox: Cosmetic changes to improve code style
Date: Thu, 27 Mar 2025 18:38:52 +0200
Message-ID: <20250327163855.48294-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250327163855.48294-1-vadimp@nvidia.com>
References: <20250327163855.48294-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b53150-8bbd-4d89-ee16-08dd6d4e2f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ygYoKmFmgeRSHmedvlRGp2rL/JtgBtEpS4xcawMeqPCG0Mf/+CoJnpIaO1yJ?=
 =?us-ascii?Q?yUWvGWn211ULMxC5oC73wdak79wFfTxxzqX4xw7MDUfWelbh12KzC8+YL2n7?=
 =?us-ascii?Q?ipIhFQCXdaUpbagJISOpuCZ9LNUtqHM+Cbc4su+UFfsBydYxTgnkBXVy6UsW?=
 =?us-ascii?Q?++x85euQvcmQbnTI5UZqlM+tddyi2H2FtURBuJPkhTle7gYuW8PshD6HiQEm?=
 =?us-ascii?Q?cggQpdLpVaNS/uUfTGoRciC1BRIIv1mWD64jGIFM/mU9Q3adygFZEM3W8b8K?=
 =?us-ascii?Q?+bP7Ob3FsX2sipeGPvERJOq0ec/YwZMLfXNnUi24PSAeOCu3oIo+DZH4AlvZ?=
 =?us-ascii?Q?sz0oSLdyY6bfXajmtfkbxOAyRS5Efefrz0CupPd9DPrtA0HqJYaPoeQGoX+e?=
 =?us-ascii?Q?gWsdhnnkZpo9Uv1OHci79iaur+Nk+E9yWRNYVeGgjy5YcydMDiT5x60sLa46?=
 =?us-ascii?Q?fLvEeE4AhfJOKiF0+EuQ9Xg7h3RgLMUdYaSG2/hrMDm1gRuRqnwq+Kl829Fx?=
 =?us-ascii?Q?Wwvya8ySM8f0VA0hBuL84qbEiUsUfQLfUvU0MlCZM4CTWZl+Wn+Yc0Fs9baR?=
 =?us-ascii?Q?NOq89cztdS89oyTKW2oSQysm6i85yvow7tXWK+UIFl85ZAjlu+k7AX8fHesO?=
 =?us-ascii?Q?Fa13r+vEnvOZiiGcGgd76WUET98y5NAAqclrk97ZP79ydkf9RYIygdGbVYKa?=
 =?us-ascii?Q?yaU4GFhgD12+cFYGy4tqgAc9x9Q74zF7cr1qLyJbomY7btaAJxSa0Zs5z9Q+?=
 =?us-ascii?Q?RPp72M5Pki5yiGnnsmsw6Jm6N5vYWHgW+g5yHCyhkbfsML4XYHt3rg95kO+X?=
 =?us-ascii?Q?XPJx9eqqW04YgoAUZ/sClQrr9C23XZ6K0ryvhWoz2Xryzb2z7QRbckR2oG2u?=
 =?us-ascii?Q?0zPx59X6j2LZUmW4NrQZ98YTuxY8HMDGqgry3oOHy9wwzc3mWUB4ImY5+k0u?=
 =?us-ascii?Q?TkG19VK0j+3/ssQ29tayYvq7o1x7j810DhezfWn0euvLh6qEbdsIyDL9zBtf?=
 =?us-ascii?Q?Sn3Y1UNLRPuTjWS9lobBLF0dh9P55zGcT5cVPZ+hIyQ+YRpuAsnp4LMSO3T7?=
 =?us-ascii?Q?kO02TOw6qGgLmpZnXrsPKMeZX6F3M/WlPB3j+/dGsvKD2cwXFIZLswdYHyNW?=
 =?us-ascii?Q?1B6kK7u2IzmvHVyhd7NRcolr3aGk33z9JKgxlqlbqciSrXxc8ybotxSh0PC1?=
 =?us-ascii?Q?O22sWye/OjFYPNDu5GXjKyWJdz/VsXjyH9odjwuokEoOM3hbi1GNRi9aI68k?=
 =?us-ascii?Q?vWkxrzqE7FfxyUOXCf5dzNyj4x+xZBbvPCjiC4MEw82JAE9J+njBRFGcNR5A?=
 =?us-ascii?Q?IG+5RNtNvDi1R/ianAMCBFKhT/GH1+hMvvACsVaWrI6AcovRSYlYpnuxZ+/s?=
 =?us-ascii?Q?tv1Ln4fBoHS7H1IeEYai6Kro5wflI3uSHiV4NCLvPzdOKAE9CEGS+HaMXBj0?=
 =?us-ascii?Q?zrqWzcC8s3lYyq7Yiz8eJtTHJlXNZ4Nrn0jOJ1E0vrydc2DhPkGtLTMFy2zm?=
 =?us-ascii?Q?DflzVTmqB11nVjM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:41:12.8762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b53150-8bbd-4d89-ee16-08dd6d4e2f9c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429

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

