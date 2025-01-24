Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8961CDA2D
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739748; cv=fail; b=QWIHiD0DERsUhWVWmDF9rsE8YYlaLsR0f63H+HUl4GMqCFssMB/r3AMYg47IhRq69HIoiVff2Iu/BO5wzMkGKdjWBw35h87eSJXfFRwBsO099Bh2vEgRoZdcSuMEO9muRlhdl8yfI/h7PZtRwZkbdOKsZos56OhBgHcHVXLjlB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739748; c=relaxed/simple;
	bh=+DhowTmBJf99g3u2qr1qz3Ee/3GnqQmb9FIxO1Sl8m4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qu3P6SM4IZrycPKXchriBLIAIlgO3jIY08H4FtRRzn27O7EhtT+cwtWVm06LvLimuvCd1hl3DndNO1R24RihkSzIn2BYMQYIJrcPw/4L/KiXUKzCnkBsm1b4Bno1/f7luHjgj82DbmwtZr5zoQEAVmW0OGIR2jYZArfEgcSSL4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pn36ybaJ; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pn36ybaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9vohSgL3UIW8kAYyoK3BfEp1UprEZHRYlrVzXaMJ+XxWIbHPuRxiM6gndlKD2mbGfETuFoUc9a0tQktadRLJdEHbAZRuGHywtr7AzhAnF8pNAG1fVtnCPtsjoL6qN62R4fJnjgP+wF++FhVvSB8Zr7HSGSpz7Dq1NPl94yGp5x7iYfVuUfMI0YSs2kugVBiYAyB5JoESf3CcH8pUMsxP9fG3/dmsBxixukMmmXY84MoI1ZH9VkXXAGOHdmJKcABUd7SVflGTww+DxYvKkAiUQuhfAOlT+fNlIzUhfPqPIhB6kDDA6wLYNTYWQ47w68CSHgBZVFnlYY9JG/1cMILIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lI9cWPeKYcVepFBbJR1bktLzQ5+kQB+wmwwjpP+M7sw=;
 b=OyWrl6IdLwR+u4unIMYklxPYFFrjaegP5F4dJzdXvSiXJZdYG8A9AbjZ3aAX9SaM3Dhzn+T5eQkRJYw+OEXAcU4ptpOkvwOtD9+OKXMOu8d9Ts+11DDPJrKpxrOoRml3IXab+hoUiK+NAPJFYaflWX45tadvFnAn2dblZ6QLmxHYpn2tLBCXABc4p/pcj9dDHO5AuRf3GI+JNIJ5q+iy8qrrLIFKRQeqQpyyrHCL0SFavpZstiLU6G1SouwhDiGHy90uvk/bfk+NOMKdhVrcj5MLhWn0323CMf1006cdaJ8UlEkr5Hw70N4g6z5lltasiP+aA1RCllDYCObVSF/AWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI9cWPeKYcVepFBbJR1bktLzQ5+kQB+wmwwjpP+M7sw=;
 b=pn36ybaJ1zdW1YxLuEicHx750xpD+WrEpISTzOwTJb4XDYfXb/Y+YNHIp3Oivhpt/pTigIJ3LPRU0iY6rryHM0d1cUw9GWQt/FmCZjgxKoF83kmDblb35JEiAWsryA7/im8kPuiBoMTr58VChHP8mp465bw5jGQNBpc1ib9GQfFg8OUcwn416H4juTUl6ke/5k56HnVuE81Yr43MRGXv3KOQUQ0t97rgvzwysMVSQafapHC3e8CNHNxUpASDKqynhPXg0taR5tKXxDNQyOZYITqLxjW4ehIp/nDsuKD9nMiVNfxTLVSCma6ZyHdBQoGmEeRr5zfNuYvawTyoiarlfA==
Received: from BYAPR08CA0053.namprd08.prod.outlook.com (2603:10b6:a03:117::30)
 by SA1PR12MB6848.namprd12.prod.outlook.com (2603:10b6:806:25f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 17:29:03 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::99) by BYAPR08CA0053.outlook.office365.com
 (2603:10b6:a03:117::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.17 via Frontend Transport; Fri,
 24 Jan 2025 17:29:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:29:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:28:48 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:28:46 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 09/12] platform: mellanox: Cosmetic changes to improve code style
Date: Fri, 24 Jan 2025 19:26:27 +0200
Message-ID: <20250124172632.22437-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250124172632.22437-1-vadimp@nvidia.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SA1PR12MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 739c7ec1-7488-41e1-7c45-08dd3c9c98ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UPIm+Me2yH5hDHXJNaN9qs6BTkvCPH7WyNMu3FoLpPs9hV9y9COPPFxOISAn?=
 =?us-ascii?Q?Ru5isuH0VRDKEtj6Xeg8IB5Ru0podfp4SGAmUCx80Sak2IpVWFcPpjPl/YPM?=
 =?us-ascii?Q?xOnXXAiqWqO8uliR3i6TgA5NU20IpVw/pCO/igbdOMLkl1ZEUjNkgZmpQAq/?=
 =?us-ascii?Q?L+Lu3gg9gwQAeva/Mh4P630k0in9DMFTt7toGxonHYnOXJO0h8/Wr02QD20H?=
 =?us-ascii?Q?XITbl8BwGCl4Ur1Id+Ap0TqPImSAg+8tJQjNd11BzPWwmxyCSQit98RTXE+t?=
 =?us-ascii?Q?X9lW+cf8NZofawEwUa417DsSd0wLjzaCLN9+tDFgnr2694lj9yL3Bx6WoLkc?=
 =?us-ascii?Q?7mL8JvdeRDdcbdtWlnUWpGfjoy7gRv1xTBVtm/AZ7uCostJH5QwUPMe8FHFJ?=
 =?us-ascii?Q?fJcqCOOSw9DMkToayTsoeOBKSE0j4riPUzq+3+PDFxJYAbXso6eMZoTv/SgM?=
 =?us-ascii?Q?12Zp0aK1BUalSOrICnedoHX4yPBdtjEjPzFHIKJ5M+DDQO76gjwKbw6uw0Pd?=
 =?us-ascii?Q?RD7uB5X/r3btn5DrOKtCUnQNE7vmK1cMwlKHS3uHDmY6T2JKoFgg/W1qwXFP?=
 =?us-ascii?Q?qcWXvTEbcFgSwcHd1JN/fKJhTbv9hQldBzDiVla5iJvRs8jCN3n2IDDepVSV?=
 =?us-ascii?Q?1CY/pqdgWc6GFYL8AYPB/Mb+eX1WudHB3RJiQ0gZhfnQ8KeDwxqIPKHLitsL?=
 =?us-ascii?Q?a4+bYSiGlCZSL4XMSs6eS3H6StEsf2TG6zujdduXUIiBoFdCnencUMpTrdoN?=
 =?us-ascii?Q?qNebqqZA1gaXTQv83QNTAIKT/h4OGWNjTMoDF8X/iX1xQpTR3FQOkoior9QF?=
 =?us-ascii?Q?xfh6QgxD3uOU5+1RWAgOrZobOM0A1SivTN5kqHi9aU0DLIL4JXYoafwbt0/g?=
 =?us-ascii?Q?4EEIcSMrlKUvmHfWnaCXDv8PCjUoA3vVBQhlwevFtyaua7WY6T3NgHy2mPtf?=
 =?us-ascii?Q?6PtUjmBqAlmqor3zHbqX3uGCzkc+/CAHUBtmh1riFm9GMG/emqbH0vNE52o0?=
 =?us-ascii?Q?2X+q5PQDyfUhnazNrGLy03PFQPYk6pAbeXIwsbKjAJyDT7aItoY6agtjU1j+?=
 =?us-ascii?Q?mA+poJQDtVpllBn/Jqwm658J7chj3Up7o6pSmL9jCK3a8UjHwH8yN2k64EvQ?=
 =?us-ascii?Q?rvUeYoAVItS7iyyOFL7D1voGHj/1L7y2Itj9tQ+BFtEI33IOhwVqMWzoEtFd?=
 =?us-ascii?Q?6WXrPuObVeMzjf5Mrnjol/jxNvmvbuKNqlOItBU9uqzLoa36jO3cHeGssJCT?=
 =?us-ascii?Q?zXCVnVwIsQx3GpqceTKIlCVuvHsIVFoCbTOqGXgDr0ALzbYWDSfz5tsg86Zg?=
 =?us-ascii?Q?o9RySjTSvZAofeOjtXkXZtMYd0gAxWtf971TSenT+/zdUu2UcbqpvsBGNdWD?=
 =?us-ascii?Q?tEdRzAhqU6GNM6A5evYXp59Gagy2dFBckpogLXsriDM86NXVkRtb6xEa2T1V?=
 =?us-ascii?Q?AShezgLWrKMjMgxQNXv0B+8yrWJPpp06zXV36jrbaPyHjiRU4NQBY33iRe09?=
 =?us-ascii?Q?Yvi7vmuD7QjKjtA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:29:03.0302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 739c7ec1-7488-41e1-7c45-08dd3c9c98ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6848

Replace in 'for' loop - /i >= 0 ; i--/i >= 0 ;i--/.
Replace in 'while' loop - /(--i >= 0)/(--i)/.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 4ed0f05449d5..ee72a53a8b06 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7850,7 +7850,7 @@ static int mlxplat_platdevs_init(struct mlxplat_priv *priv)
 	while (--i)
 		platform_device_unregister(priv->pdev_dpu[i]);
 fail_platform_wd_register:
-	while (--i >= 0)
+	while (--i)
 		platform_device_unregister(priv->pdev_wd[i]);
 fail_platform_fan_register:
 	if (mlxplat_regs_io)
@@ -7871,7 +7871,7 @@ static void mlxplat_platdevs_exit(struct mlxplat_priv *priv)
 
 	for (i = MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_dpu[i]);
-	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
+	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
 		platform_device_unregister(priv->pdev_fan);
@@ -7916,7 +7916,7 @@ static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
 	return mlxplat_i2c_mux_complition_notify(priv, NULL, NULL);
 
 fail_platform_mux_register:
-	while (--i >= 0)
+	while (--i)
 		platform_device_unregister(priv->pdev_mux[i]);
 	return err;
 }
@@ -7925,7 +7925,7 @@ static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
 {
 	int i;
 
-	for (i = mlxplat_mux_num - 1; i >= 0 ; i--) {
+	for (i = mlxplat_mux_num - 1; i >= 0; i--) {
 		if (priv->pdev_mux[i])
 			platform_device_unregister(priv->pdev_mux[i]);
 	}
-- 
2.44.0

