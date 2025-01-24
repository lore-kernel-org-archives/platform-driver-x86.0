Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1751BD9E5
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739735; cv=fail; b=dTysSHXS7TxHR02JfYqba8og+j6RZW3y7sPa1Bd56eL6C9ufxdrOrPFJfv90GckXR9gFfQhw7eTPfVh18/v0taVRHlCbGnQtOQJPK3dr/wzZfkT/npqDX0P/Iozjud4Od38gx2m2SjOHKbYPwlI8hX1WMYkOi3CBna1feftQ06w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739735; c=relaxed/simple;
	bh=qWxMn58ZcfitDeHvPdIA0GPnuQUkpIQc6MvgWPnw1tk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLwtJCo3NUOeI29QVRgzqIRtdv4E/2JVUWne8jDxxkplWT6uCVuLmOVPMYAlQ59MW7Pu7DKIHzgBCugQPxd5DfnAU7Zzxa8EtUlCiNSnt7vwfVQDZ/S++iPC0zhxnPpSTafKmm6v+hgAaD+eTirgFeWZa6cPMmj8ro3ggR/o1Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F6RRXQ+L; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F6RRXQ+L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrjI3OeeXPNd8+sxMzQZk7ajjMtg0cHQNnFXj0GQd7+OFWBDTOu3Cw48124JIPPfumTImjE7fadmsK8IpUj+bIcCSGdnYeeokf4sY8QR9jxyKqExBmmxdMNG966fH9MgzrlCvF/ucTqtQ24ivoIHRPrx7EZdbu/+OX4dyJ/zfLxk0ozhr+siDmL4aLQI3lcDXJFSvcMMepfL6rvDqwbkEjOnUSPXOgrTgmCeGRdhzMCGs/Q3ENB6G6W06STzUxKW6wbC/wac0p9kJKT+6TW6CXAdm1e8eM03Ntq272DEZUc8h28LrFCphTIyjn1NGitquU3Xf/hz3lfw5OMCIs2KjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TILinPM8oZK3pcR92SuDsC9O4QCv4Kv3cS/glsCtXbw=;
 b=cftea4Mad5/ZNS6t+gtr4hBbm9c0bbog1qZwC+FmjUnR9yJ20BfO/pXn5CWaDrlFnVQo3kcpOG1qtHU3X+//As/o1mcjEKzIN/VQb5hnCU5y98RB3MtVkUXUeT3Iqtht9StdfSTETvjQIw8mVl8fMoZdMF1b5d6mThfMnEVp/+QSH9U7TRkA8GGCcWaZksabW5lQgYrj5iwlGAlCAe4c/ZcHovI1QvGhn0WRCbpcevOl4qktKVe3ZmA+86ThCra6D27ySx/vwdS0dzq4NcBXTU7DsModlY4bqdlrAsnCWZX2elecFI2z7k++J0KRS8Uzy8nymzEWvbc2Ge3k2ZYtGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TILinPM8oZK3pcR92SuDsC9O4QCv4Kv3cS/glsCtXbw=;
 b=F6RRXQ+L9AB0tqduH6/KyXuwaMIRYGYT3bKI6V3b2pPPK02SmsjHErE6cd9jNogePHt710EilNCCfko1QPm0JVjrb3s/Q8zkWAba15oBNTjZH/y8L9roYU5TwV/wsOQM7BEwgjRSG6LB8mMFg3QEycGLKu83PihStcHjhNk1Q+x4pgoVEVE0Mltn2gSmmNBsPvdJot1JJq6HZaD153hF70LZjgP1SRmwtBnVtBirgfl+yLZJojHu7Fhl6DVAc2e49fB3ipSAQyqM5LYnh3vR7VpaAKQ6TkUmuw75bg8ZA6VqVEtsu9ZLziPvSiBV+dBtopT2CWH/C43YkV4TF6i2SQ==
Received: from SJ0PR05CA0146.namprd05.prod.outlook.com (2603:10b6:a03:33d::31)
 by MW6PR12MB8734.namprd12.prod.outlook.com (2603:10b6:303:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 17:28:47 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::b2) by SJ0PR05CA0146.outlook.office365.com
 (2603:10b6:a03:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.12 via Frontend Transport; Fri,
 24 Jan 2025 17:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:28:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:28:35 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:28:33 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 06/12] platform/mellanox: Rename field to improve code readability
Date: Fri, 24 Jan 2025 19:26:24 +0200
Message-ID: <20250124172632.22437-7-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|MW6PR12MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ea5381-fd9a-4772-bcf9-08dd3c9c8f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LHjcmWtglragJJ0MAtVkI1QcfhdNUdYkRwhv/9+Yw1KY15NwlTi9vxNza2Eg?=
 =?us-ascii?Q?LzpRAQFV0+Mk+hqS5tDO6CNw4TpbrCDGX45XKCRn0sscCYVF6SLuiUZ96a8f?=
 =?us-ascii?Q?5WrnDyw0GBkhnzYOV2S2IlSNVauI+sJLHTbnLUFysalKzCybaVG9Ry0kk3gv?=
 =?us-ascii?Q?BtfV8dx66DWu/lkkQ4q9u1wGAgp+NvvRsWD08+S8bxmBEPN0WGr0uE3LAIFn?=
 =?us-ascii?Q?7/ICHKsRab/yJQjE7WW6h/AxCMob9uKYW23OUvSJ5k09NQw/6nSk2Kc2RMOq?=
 =?us-ascii?Q?oj/BOO1EWVyYtsey+vKXZzxv8pcJihCcvUM9v66LOW6LSNUmAYyFy7FRW6OH?=
 =?us-ascii?Q?msnz788khlybn4p/YjnV2D1WPVDYaKkUwGrazBQgpdYRqi5SsdXbjgWN5xtp?=
 =?us-ascii?Q?3Ja5xuLcho3rKK/p6rbcSYB6OqpF4h6sRFpspBwYsRFPBY7FoYNL44Q3siRA?=
 =?us-ascii?Q?6E/lvgojuSN+a1hYdW5lbGkYR6+WCeW+4mF20Bjp2ezt10MQsJvZUzqVFqng?=
 =?us-ascii?Q?ufAF2yFZPyFsCqaiZx2aXZZDgQnTnbBw40wa6y/LqZnHPRKpTH1H0EVdv1uk?=
 =?us-ascii?Q?btGeZqH6qAmUUn/6LXSMQMMWoBiJ6DGjd8NDi1rLoq6qJJbCU4FakJwSNoG+?=
 =?us-ascii?Q?HDNBHWyQIV8u02s0nKK8Y3J4Ilne7MNiflFEn/jv7ApFuIIHvKS10sxRwkfn?=
 =?us-ascii?Q?n31Z+AM69lOfJkl+f+av4//Ic2wdU+ibriMrotpGJCEG7Od/x2hfMeYKeLMf?=
 =?us-ascii?Q?f4W3/0xxm9kM2VVVOeSN2LnfSZ8A5wT2mE8j4BPB0ztud9DZpmh3LSgj05WI?=
 =?us-ascii?Q?RNM3EBqr4KELb13szW0YDN4coBLvJ+AF6fodVNSazMNDBm+XE5MBeS6QehhI?=
 =?us-ascii?Q?GXy94MDt2hBU4M0Jw0rwYdUaqXTnfVqCOMWr50stRJWtWEBSYkPV+UPrDb26?=
 =?us-ascii?Q?j2aFmFpIY3SsQ3z5GE84x7UucqLmCbEgyJ05l/QtOdWBJVuvOl0HYjVrlZjS?=
 =?us-ascii?Q?zS1tkD6F9tMcN06rkdbejBAgSlMSOqZbWHt7yGf+0ou20Sd5QL6/DmF8KYG9?=
 =?us-ascii?Q?GgQhBwcO4TDOfW0gSA11RswHRklckF6OuTNImOOO4AsxOD4T4t6JmPDRciHU?=
 =?us-ascii?Q?kOttfT39KueMaaq2CDx80IUfbs8NTJM16FdM1RbpICzVXgfIucj5/93qgxDe?=
 =?us-ascii?Q?F98XA/8Fhoujz/Yy/FDZruiHKm9BISo0VDBFhG9jhFTmCZjVuWN1oPSUPTgB?=
 =?us-ascii?Q?a4Y/X+c0FlgJJNJw0X5jJqNvKaWghwea3d4zpooHZ8s3unpZav1vR2794G/o?=
 =?us-ascii?Q?JKXajzuRgyeFjxzjo4H8evJlF4Py6MKGu9XF+XFwE+mfdX7wmIrzX4T1henE?=
 =?us-ascii?Q?VwjNK3Jud+brhiiEJimS9zr8OlR/maIlD0r5aWXEE/gqCM5/QcuQdfkUKWAE?=
 =?us-ascii?Q?eEhVGiDSlMpC6Vl7CY1cDT4COueBUa82uyj+tqVLFZXjWvG7SzWEMqgRP0rj?=
 =?us-ascii?Q?kUoN045urfN1Jeo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:28:46.9166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ea5381-fd9a-4772-bcf9-08dd3c9c8f13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734

Rename field 'item' in structure 'mlxreg_core_item' to 'count'.
Rename field 'counter' in 'mlxreg_core_hotplug_platform_data' to count.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v4->v5
Comments pointed out by Ilpo:
- Fix misspelling in submit text.
- Fix structures names to 'count'.
---
 drivers/platform/mellanox/mlx-platform.c   | 26 +++++++++++-----------
 drivers/platform/mellanox/mlxreg-hotplug.c |  8 +++----
 drivers/platform/mellanox/nvsw-sn2201.c    |  2 +-
 include/linux/platform_data/mlxreg.h       |  4 ++--
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index bd3bb06ff8f2..2334b740267c 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -852,7 +852,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_data = {
 	.items = mlxplat_mlxcpld_default_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -892,7 +892,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_wc_data = {
 	.items = mlxplat_mlxcpld_default_wc_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_wc_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_wc_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -902,7 +902,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_wc_data = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_comex_data = {
 	.items = mlxplat_mlxcpld_comex_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_comex_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_comex_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_CARR_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET,
@@ -949,7 +949,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
 	.items = mlxplat_mlxcpld_msn21xx_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1058,7 +1058,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn274x_data = {
 	.items = mlxplat_mlxcpld_msn274x_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1105,7 +1105,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn201x_data = {
 	.items = mlxplat_mlxcpld_msn201x_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1229,7 +1229,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_ng_data = {
 	.items = mlxplat_mlxcpld_default_ng_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1389,7 +1389,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 	.items = mlxplat_mlxcpld_ext_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ext_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1399,7 +1399,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data = {
 	.items = mlxplat_mlxcpld_ng800_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ng800_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_ng800_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2240,7 +2240,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_modular_data = {
 	.items = mlxplat_mlxcpld_modular_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_MODULAR,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2272,7 +2272,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_chassis_blade_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_chassis_blade_data = {
 	.items = mlxplat_mlxcpld_chassis_blade_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2363,7 +2363,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_rack_switch_data = {
 	.items = mlxplat_mlxcpld_rack_switch_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_rack_switch_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_rack_switch_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2518,7 +2518,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
 	.items = mlxplat_mlxcpld_l1_switch_events_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index c525b8754d48..5e143a18c654 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -262,7 +262,7 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 	item = pdata->items;
 
 	/* Go over all kinds of items - psu, pwr, fan. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		if (item->capability) {
 			/*
 			 * Read group capability register to get actual number
@@ -559,7 +559,7 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
 		goto unmask_event;
 
 	/* Handle topology and health configuration changes. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		if (aggr_asserted & item->aggr_mask) {
 			if (item->health)
 				mlxreg_hotplug_health_work_helper(priv, item);
@@ -608,7 +608,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
 
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		/* Clear group presense event. */
 		ret = regmap_write(priv->regmap, item->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
@@ -692,7 +692,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 		     0);
 
 	/* Clear topology configurations. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		data = item->data;
 		/* Mask group presense event. */
 		regmap_write(priv->regmap, data->reg + MLXREG_HOTPLUG_MASK_OFF,
diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index abe7be602f84..451d64c35c23 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -517,7 +517,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data nvsw_sn2201_hotplug = {
 	.items = nvsw_sn2201_items,
-	.counter = ARRAY_SIZE(nvsw_sn2201_items),
+	.count = ARRAY_SIZE(nvsw_sn2201_items),
 	.cell = NVSW_SN2201_SYS_INT_STATUS_OFFSET,
 	.mask = NVSW_SN2201_CPLD_AGGR_MASK_DEF,
 };
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index d9f679752226..20f84cf629af 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -217,7 +217,7 @@ struct mlxreg_core_platform_data {
  * @items: same type components with the hotplug capability;
  * @irq: platform interrupt number;
  * @regmap: register map of parent device;
- * @counter: number of the components with the hotplug capability;
+ * @count: number of the components with the hotplug capability;
  * @cell: location of top aggregation interrupt register;
  * @mask: top aggregation interrupt common mask;
  * @cell_low: location of low aggregation interrupt register;
@@ -232,7 +232,7 @@ struct mlxreg_core_hotplug_platform_data {
 	struct mlxreg_core_item *items;
 	int irq;
 	void *regmap;
-	int counter;
+	int count;
 	u32 cell;
 	u32 mask;
 	u32 cell_low;
-- 
2.44.0

