Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AAF1AAA10
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014417; cv=fail; b=ZQwVzn33M4seKRxARfgPHOX5HEX1a6PY9HMJwtyThtEr/xQ53eQnJ/idrcVm/zCixhCMOhp2Dd4/nPUYjJ5XZQJiEL6AIYYipht9qiJivAoJIA9CQqyKX/TzQp0XRBOcCBcNnrZ2pdJpWl1aopR12LHtqnC0eCAPgm7NkxltqHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014417; c=relaxed/simple;
	bh=67Kzs4hbM6GH/F1cHitOcDbje/kTVRrKd1hP6rgPzBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pRagp4nqloKa22D4nXuK7Oh4SoPdHjQmp487NdcwcqTRBTnUqqd+UaO6qyOPBWK1Ro2E+fS0ok8CykZ9XmNYDXYGpkrYewhVftEaOD2M8TTb+c9CUDjmKdH2etYvYi5bmUNXMTaoYigoZ1aRs84gR3Qx524EhCd74NrISFUAugE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YTbYNxe6; arc=fail smtp.client-ip=40.107.237.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YTbYNxe6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kh7pEEwdtUeCNP0POyt0KIKMwIAKJ8SY1bJedZAZYonzqxzbfVt7mbNcjkNUhrKj17ClsTnT504PlhwH8MTv+sfhqz+FAx/bOT+x2o1E16FqLYqetxUfttyEY8sOtofx/DCGk+a8zL6D8qi0IbHQa8r3T735t+sIReiU5mhxuZzbYE6rau0dg+bkKrOBASlFhrEN1mcitbauC4z0XYyrKVVn6A29ZtwQbdBLh8g9DZgnWYWSmPNQbgKM9b1ypccd9rYFsakJhqIVQ6Iz41x8Nvp4Poy51yJGYpru7bvw/J4dImtFWY/P3pFrV7pf0gFfnNI/Rvj68Hvc1no2N0oVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=TVPlmHT5rZRh+ZAi38P8xCm2CPejtwz+SXPA17uWMc1Vq5iccyEZEAy6Oj4H+i63zQn8eYEr3UslbE0SoZnZiIbD2qElEiIOsK0LEvDfIrLr0BW9Tqh28pzpWr08O/je9KHfG4n0U/Es4bHKz9TSOI+6HbYFAz0Sx0de+q5tJPtciUe0dK8WhJfcgGncsW5rdFWP4TGtcpXUsWRJ5mdU7ap1N6NG1m+gIy14THNd13xpHhajXo4wBVVPDNqlcnux9PL4Hz7x1IiFdQGFd6OVbdwhtw2a7XmPQQ5Pz5GfRnTNq7R4t0aP6VOrFeC7vsvB9gnBKTSDFbEJGTpxIm2+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=YTbYNxe6IvDprYhIZIOQFD4mIrJ3IXHj1cLRCe/NaDb6GVDEaTMakLczkWKY82kF1sbuMNfptxf4LvYOYRZ0jsOmEs2EGeGMR0/uDCtYCnqF2q+Kez55jUgmOIPigB6gVM4tPE+Ynm/2iCuVd+ZXb/hlIs9apQOsSh8b/+zZhQklNG4yGWotBg4XknMy44MOPZcVc+2CxOJe6Ak55WsPwnVpP7GQ8XHiqK9VQQSiyx+HARa3GGr7ommJqi5qJPKQHj+6tWlMWaqyG4yl/wfdJI7RyiDfCOv/ePntbT0FTUZOQIb+vfeUnFbVcKe7oW35icmwNYjEAJNP3LFyaXqc6g==
Received: from BL1P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::21)
 by DS7PR12MB8275.namprd12.prod.outlook.com (2603:10b6:8:ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:00:10 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::93) by BL1P221CA0030.outlook.office365.com
 (2603:10b6:208:2c5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 08:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 08:00:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 15 Jan
 2025 23:59:59 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 15 Jan 2025 23:59:57 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 04/10] platform_data/mlxreg: Add capability bit and mask fields
Date: Thu, 16 Jan 2025 09:59:10 +0200
Message-ID: <20250116075919.34270-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cee2357-7c4c-430a-a969-08dd3603ccce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eN9l9Il9UhMJakq/UlN+IWXmO7o+CYlbxH4RJb0EDPP6wvd4GXaMNKHMXuHE?=
 =?us-ascii?Q?VNzWBZm3HKWcepsa+XczEwUbyzfJWyFxmpldWz81LNb3hZPRg+93y8tJReJN?=
 =?us-ascii?Q?tFN/E4G+B3ne+YWMN18RsHPBW8RXYBZaTNQmHd2x0b0Fnhnag9RQvPAixxKG?=
 =?us-ascii?Q?nXg5L4I4i2VcFee6URIQXUmuxFyACksh3Mi3XOjV+aaJk9/wwq7SalZ5xtDG?=
 =?us-ascii?Q?xZd48nf3qx7O3CIFl+41FeZ33Y4IhLM5TXAtcpgtj268xuyedCQCM9fjorBC?=
 =?us-ascii?Q?yolkBeEJKDr6whw2XVm7TPD+6C2KZfIc2PPvQdHMYM/WPzwYgoM1JtdCg06I?=
 =?us-ascii?Q?55hf9vQFmD4lSYZYKXpZ9bmfOPfkWdnnPLX9HYQy9yBx1jRZsyfiKfnFP6qQ?=
 =?us-ascii?Q?fZi3JOTkUROdAXxONq9L/aJncMqx8XJOn9iGOrDkCybI4KFvpl9cA+LIaWhR?=
 =?us-ascii?Q?W/Ts0Kdbstiqh7eGW7n2DLT7g4Q3p7bxjNVfjZAkgxqOlA1mHTE/INP8tcaw?=
 =?us-ascii?Q?Z+EpnaUsT0xxiHcPuoVTyFH/Qg2xL7SMWLBoTJsjY9b/N/Q3HbJ8mYCKDrXQ?=
 =?us-ascii?Q?pwDodYbSJ4BUJb48u5Vc0e30R6n3WLpDw4pQluVB6ffqc5nGyMRkFLfSrYzA?=
 =?us-ascii?Q?0EZmCApvfOna7kE1jL48AeNKmBL5WAi7LJsn6n9UdV5tV5Ed0kBOMawLbhXM?=
 =?us-ascii?Q?fPAACSY3OJjVmF04ZW8Qv8NP4/yeMx65oQtpJJtx68u53PjI7FmXntych8im?=
 =?us-ascii?Q?w1KZ3Z+qwSwlULTtDPxMqhlhJTnQ6r4/6pIDP59VYfVM9qnPsSyxPPlYUguR?=
 =?us-ascii?Q?Y9aC1aKUlM2bY+3sErKUGA0bnTZzlbCBhSqDJ2Ko7oiC5dDOnB0bf9GFMNx2?=
 =?us-ascii?Q?XiZyrnSQ+GrxKnndtxElMFDAgtcAJrowI75YanjFMOxBoq3rtBdwMuv/IrRa?=
 =?us-ascii?Q?QIm4MW4usrmH9XGI6IOnmLN4zrO7N3KGMlUsSxLQvcw2RVtbeZnNMt/iEcON?=
 =?us-ascii?Q?W6dwYi8UhmrlE6Zcdmvy2BQuEeVlzrsKUs9M0sRjdQ8SKfzo2MLpCRcTIVDK?=
 =?us-ascii?Q?em0UYbN0395gGEntS9bQ/57dMoT2Yi+CGL6k2dPVGQLp22pALU7wOTbyWdW0?=
 =?us-ascii?Q?WlBlydrePF0wrR/OsPSA9wkw/D2xbtb0mSGVdlBhdhKArXIQpqx6YY3nzBE1?=
 =?us-ascii?Q?IvGqeYXp9T9fgyhLokRSAyGmDThS/g3glDP8rTEdjc6ZpuYRozn28Qxhiwbw?=
 =?us-ascii?Q?+4E3PCT/FEyfL/ZvaJYn9pGAJwmNfECch3RpU2IiBawamywXW5ewafKUj6Dp?=
 =?us-ascii?Q?21iqQkVJb0hgJM+3laFFLZg5XwFjYtd46B65WGXmd/uAmcEz7XK93mMK3HTS?=
 =?us-ascii?Q?nhsFdmyAEGQCrzY2ukCN4dTZ0Acuf0enA6MkwoiZ/CoJpU6LbD20iz9Lkjl5?=
 =?us-ascii?Q?AVypkZb0+4skhi2BxpSPAqHRp/IlsGYeVqY6QTOVIs4RstU5hSEbRBCKWKnJ?=
 =?us-ascii?Q?ySwaaSvEVSNssq8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:00:10.3344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cee2357-7c4c-430a-a969-08dd3603ccce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

Some 'capability' registers can be shared between different resources.
Add new fields 'capability_bit' and 'capability_mask' to structs
'mlxreg_core_data' and 'mlxreg_core_item' for getting only relevant
capability bits.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 0b9f81a6f753..d9f679752226 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -118,6 +118,8 @@ struct mlxreg_hotplug_device {
  * @mask: attribute access mask;
  * @bit: attribute effective bit;
  * @capability: attribute capability register;
+ * @capability_bit: started bit in attribute capability register;
+ * @capability_mask: mask in attribute capability register;
  * @reg_prsnt: attribute presence register;
  * @reg_sync: attribute synch register;
  * @reg_pwr: attribute power register;
@@ -138,6 +140,8 @@ struct mlxreg_core_data {
 	u32 mask;
 	u32 bit;
 	u32 capability;
+	u32 capability_bit;
+	u32 capability_mask;
 	u32 reg_prsnt;
 	u32 reg_sync;
 	u32 reg_pwr;
@@ -162,6 +166,8 @@ struct mlxreg_core_data {
  * @reg: group interrupt status register;
  * @mask: group interrupt mask;
  * @capability: group capability register;
+ * @capability_bit: started bit in attribute capability register;
+ * @capability_mask: mask in attribute capability register;
  * @cache: last status value for elements fro the same group;
  * @count: number of available elements in the group;
  * @ind: element's index inside the group;
@@ -175,6 +181,8 @@ struct mlxreg_core_item {
 	u32 reg;
 	u32 mask;
 	u32 capability;
+	u32 capability_bit;
+	u32 capability_mask;
 	u32 cache;
 	u8 count;
 	u8 ind;
-- 
2.44.0

