Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DEA187553
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659460; cv=fail; b=Fm575XjBaj/FReCRvIDCJEF/cn9HMe3lM4PirS1AXKMTpnOZMUvzUreAAb47ptDhAfaRUDofnwp7MyZVCO834NkULs+LBJFx5APJMc4BQE9ALqk/r2upkkxU4n6pcjBohYxXAw/tamT/EQSnRK/kmqNLCeNIovHUuy80BChQ/D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659460; c=relaxed/simple;
	bh=X/d5Wic//dQNnKNDm+fdptlQUMDu6sUxyy+iGRZBOOU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tidcX+98kfkSv4TyKlciKL9+A6GoQoDLHDs7JDxU2pG0MejzPABrUG5g0Xo/yf9Asn/EWNDptmxeF2Ahr//2tfPX704ZpIZRGSNPlP56s3xqaXemjjnY9Ihz7hquoE+QPS+WLwJiFnDffbl8DTApboUDFMrPu0RZu6whA7GxWLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QkIWJn6w; arc=fail smtp.client-ip=40.107.92.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QkIWJn6w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOMQtjor1xqU9MdKM5FKIgfmizvCKg0PTE4kXNstS0ltL/3utg2m8SnKfBiyTFQUzBxY9sdsJU7zsyJCSyRfgJkwqcOswQ+b3s/FeAOCAUqSPl0/m8i/1BwBUmcWDSPUWHWSJ812FCzyRCx58hLQF5ib3nLT9VvyQNqPK4ysMDHiIZrEhCWpkVVcxGAt3VnV3uv1sH1/p+30U/VAiKvLgHKqfBJMj4dq5fZ53V81U3CZhG2DpqsadGcgoKthEi8OQxU+auVbAcrn9egDu9YskSJbLlgYH4Y4QMXpQgd5CDCy5wrrYS8644JiJG5OmAv0A0ur25fb6CVEDBQl7IgWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1xJ0ORQg+YdEGZlO2uUcuC2z3YEe1woClgH3JDBIZw=;
 b=UQUFiNNv+5kThPqU8+MadMOj0hnh+/TBhZ0MGnnLopxMbkso49jRK84CY9esqxuZADfF25B5xXxKWizEjMX7Q80eHAqsBLtVNfiAyNXG8bwLtu4bmJyLVaqXXaWY6kufVe89l8lR98jE41/D6qxZTvDazd3q0er3C67X35l7JSuK0df6YpU2c2ucX7lvkfHzWzlEYIUonBDoCbJtpIF1lXggOl6udhwBkaUHTmkRcpEUVNmoXlapK9BIZNi5VKduMfOzndpbtRXxmUOxeSgqutyVAGY2+GTS3bY5TLDcRSdAPy8/yf8UNMUMyv/r4DX/TudWDIFoO4fY+qDhGboiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1xJ0ORQg+YdEGZlO2uUcuC2z3YEe1woClgH3JDBIZw=;
 b=QkIWJn6wmFvf8yA/xd9e8VHzJT1Pes6vSac/kIOofLbYqH87JauqiLdY+6ETz7qq3h+tNFKkz78ibcbiOH6WaCD7n72JrJNgG3Me4NJKxsuSI88lY8XtCaDB8qi9XBch7kNTZxr6scfAo22/JOueykokYpzDLf0l0gQM+KW4T3PL3bYJAS4qptAebO1U+DEhWXUmPRDmNZ1+YvL5e4WBueQac1afpoAVs+3vq2VWfeUJw5n6C17YAOmUbNgUk+SrD8FFiFeIWQSEMaCx/O6f0YCDGD4KviFoFrGB6Xo4LMJxP8q+dqyXCelOuBgKpZe2JGDEkwfW2FTdRKCWJSxT3Q==
Received: from BL1PR13CA0171.namprd13.prod.outlook.com (2603:10b6:208:2bd::26)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 19:10:54 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:2bd:cafe::ca) by BL1PR13CA0171.outlook.office365.com
 (2603:10b6:208:2bd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Thu,
 23 Jan 2025 19:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:10:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:10:35 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:10:33 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 09/12] platform: mellanox: Cosmetic changes to improve code style
Date: Thu, 23 Jan 2025 21:08:13 +0200
Message-ID: <20250123190818.3834-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250123190818.3834-1-vadimp@nvidia.com>
References: <20250123190818.3834-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6030b6-d73b-4b9e-4771-08dd3be1a860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SQUpSERDxhfHhnkzDFEDkfV8YAHb+sao/xEB2uj/zHzLzm1JrplejZxFNEu3?=
 =?us-ascii?Q?oWue1zAKzXyf/H2UsKMfYAcRws8+RF0bqx3tE2MeWo03ZoYKXPy9hkyucu/g?=
 =?us-ascii?Q?Cjc3fAdJJXSsqNMpLHulIpC1g3qMS0220wNCbYmfHR1NXkYyaUJpokbte7xp?=
 =?us-ascii?Q?MrBbRjdMXfPNTbUeYJFyBX3236/WnGHaYnIcKECCRhL/6w3F2/+qtAbvqTIB?=
 =?us-ascii?Q?vA42KUU4z4SQgyprRmXZO/sjTjogsYeynnRLZ2/xYE1OFASGmHba02cQBkZH?=
 =?us-ascii?Q?LuAIP5flim2+2oMg6FLIXo1w5xrz0M1JQPYrM871lOfsVj0jxyXBgX7svLob?=
 =?us-ascii?Q?N9L9dYtbO75JVGiyr0/NdPrmWw7YiPXSfATpNYB/SGYs+hw11mNMtZTg2Pzs?=
 =?us-ascii?Q?QWk8pk/CRtlOC0mrSadfVvu6qVD5Pd/H1Oo+MRO9P3R8RlloOlr0D0D/h0+6?=
 =?us-ascii?Q?OWjN5TR21IV++n0jemqDTak5Hx5JBqO7ePlUg87KsceMmK/wAHXzAC1CkX6J?=
 =?us-ascii?Q?aY0WSljtfuoFiMk8HZUPhcX4Pa7lvSnlSK/FejLOGj9fayQ1T1ap1m8Mnpya?=
 =?us-ascii?Q?7/D2Qk+lOKFvH3q1ni2APKLjn+Cnb/p7xx1iniOVLAV8ADq/49OljvVB2dD/?=
 =?us-ascii?Q?muu8MyX34uaS+9o2qypb3p2xxPjyVfNCJGP/NweYc7pc902GEbg3Qu0i3v7V?=
 =?us-ascii?Q?irFijc4TmOKB60FBOR8/0j9XU5kfkqTX0ilrGhgS5hgV4mfHNDpbWJLEI9Ow?=
 =?us-ascii?Q?woFLbSGenOea8M/fLYxiDawLZvIMdabdX1flrajz1yIk9ypYM+Fq48IWAk1a?=
 =?us-ascii?Q?awwuKATRe3XYlmO/Z8b7Kh8Sdn5eWMEIZX2IQOn3tWdHUIRLq3l0p2X+JLvU?=
 =?us-ascii?Q?DsIoD0mxAJ5oKbjPYHljzXUgYvBN6QSCZkOI9PkM5N51EhdnjdtAcEzId/uq?=
 =?us-ascii?Q?Sm0+TJ6As8m6Zvfvc2tTHiIQjnjlMbFsbO6YWxC+8zcz4WFiynKPq3Rm5ARl?=
 =?us-ascii?Q?QAqq2o8kuqBlLyVNIPcaZyPfE+YH+4ArHimjr8DW0gTut249nKmus7A1tyzt?=
 =?us-ascii?Q?IAKzJSJSd+Ts9npOd1OD71/0S4aNGhm+IhsC10G78S0W7iY5z5arERL8Y4nq?=
 =?us-ascii?Q?oOgdrxyEMTgClWNpAPTwljTpbj4awxUm0izvDGcm6W4btelNj1ck8L39peGY?=
 =?us-ascii?Q?6SylkSpO6DQ1Q4w+94pUVbrS3XgSDGHHuJ1TYkPCgfmTUGVNgczaql+BYPiK?=
 =?us-ascii?Q?dgr53nCINpJDFkQ/P8pSZ90kC24HZV5+bBsg2vJyHt14HyQyL5eiCfKkATHc?=
 =?us-ascii?Q?e++vqDPyBchuIV9baJtsJGFbvzCmSUO4OAw9TMhrtCcjF1DKIAdH0YTOj8lB?=
 =?us-ascii?Q?jwOZdkisl65DCi5dm53CPvWerBLnNDgNZp4ZTN4VWWvwQuk1rZ6b5EUB1U8h?=
 =?us-ascii?Q?wNV9pZCIgm2diJCYK1KvSMjQ/uNdviNLERe1xyF4tno3Pnmfpo/dBOa6An66?=
 =?us-ascii?Q?h47QV26zlZgfCmc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:10:53.2853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6030b6-d73b-4b9e-4771-08dd3be1a860
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188

Replace in 'for' loop - /i >= 0 ; i--/i >= 0 ;i--/.
Replace in 'while' loop - /(--i >= 0)/(--i)/.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index d249740a3215..dcf251e551a2 100644
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

