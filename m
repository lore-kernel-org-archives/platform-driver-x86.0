Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1245215CD79
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739648; cv=fail; b=k50IP4GfAElF/VYNgntvkVbkbLnnv7wdqXXddd6qcgimxaxqXUNDYUrvbqyv4U4k3rRg0aCzrkcWQFsxOiofbaD3uV1X8pVcbDFIjNz0JaXQhK03bniSRaOK8wz20CyPvc/iQatm0ePz6WIUvdGCn2MIWA6xL+2hMAXp0X04a/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739648; c=relaxed/simple;
	bh=1UwpzhNQvMCufmER8NgOMZrTt2zm487oYz1f+wtefig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=skXXbSMMWgK2BQ84JJcJLqCnv4jkaFZYWRQSmFZDgVWIUlGDW6Bzgd6K0lrgdJMvZ8LiUKhZ/X6EfTeAfvqyW7+fYwlUF8gixsMCTaC+baDUR9Eyf5k06nvyMKEVcbZLxr0MkF1vgsNIM6yfsKdcG/8BwbMrb/fdktko3m4b85M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d5Z2CN6x; arc=fail smtp.client-ip=40.107.102.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d5Z2CN6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TunmPtQIaHm6GtCnkynEzHBo8IK+u/0mOW+6UaSCLZ3W5+hqbsozpkroxQPcEMxPGMRL3n29E3oSGzky6JVGsXHGjxk7pnydZ0+j3Xx0adrtD/VtjopdpFOBexewmAC68+Xtyl/anavb4pupoZ9iIMudO+ldfEP7D5CLsXkL1aB5g1tZq/wWl0QnIp1+SFRW9pvZmhL9DVomhHlR137rVSvuHQtSdiA5TxxkniqaT1jQ4rbv4mtITB/9dcKGcT+g11Hz6PqYTFHSzNd7hai2+fQP5SnAE+ekybTnObFiUfzc7TexRl+0SfBHWCw76wDMHoTb0k7QVFOlYwI0hrNZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=lqdtg0RiZ/lmIR/8Lw+MYo5D5oGsRxSETV11FxTNzp9kVFkA3tHmvYBR3ICvsGm46bx+e4kR/Rjq7LrSqzU1srEZyvfwDBS6Edyhag3EvVKDKWTntcWeUGO8C795L5mgy/FZ1cBakAFIx0JYBAo9vj9twv1+AzsY8Tp6/ihpgBnfthjrBEERuhFd85F8gTDIE6WFvgkK6RzxYmm9pfWy2Bk4xUSRwpALyZ4NIp80/sfA3L4+osavBSTKILyan2FOtIqIxrbnc/emIKJquh0P77mCcA3BI9rO5A1vnkOZ+rx2xYqGeE0pNhITHKVShnkzlrZd1CxBh9EV3euJWomiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=d5Z2CN6xTS3zYRFwK/zLQPcj60Tew8Vahrzu06I6dBOEWIwwsMby6I2bvcW9x+PoCNpSsqdirQRe4zHr4cM70K8QohwgghhbEFE7Q5VD/c3K4Gw+MPFh7atob97PVLKZbAFLxKi5KSNEwia+rERYCKpD4oyclwgKeenE/JSiuhaj/YZXYNjnBiFKPUPakUU+wlUoPEBs/FLAZd63vHFteRFDWSDGJ/JYDHmodNgqcdCzhfHRniDI8YLM3uVHBiEG5bzZ5jWvX0HM87nosvq7X9Uy6uUa9v4hnT807+Qmw3FThTORohH86mbLS03azIE28fzyhVjJfyym8DGeA9DpWg==
Received: from SJ0PR05CA0147.namprd05.prod.outlook.com (2603:10b6:a03:33d::32)
 by CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 17:27:18 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::5d) by SJ0PR05CA0147.outlook.office365.com
 (2603:10b6:a03:33d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.10 via Frontend Transport; Fri,
 24 Jan 2025 17:27:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:27:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:27:06 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:27:03 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 03/12] platform: mellanox: mlx-platform: Change register name
Date: Fri, 24 Jan 2025 19:26:21 +0200
Message-ID: <20250124172632.22437-4-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: e246f598-27a1-4907-591f-08dd3c9c59e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cH5gybohJU2cH3Wj8TiNiGepSqRhyvQOpxwVmY+/5JU9XdK17nF3atIHMw9y?=
 =?us-ascii?Q?F9FewIr9O9BrQl5oKNJmt1sMDBBKXy9E4BjP5MqFUMakzqaEooORUgAPgk1o?=
 =?us-ascii?Q?eY9H45hnjZzQj0fNr988B0XzJUZldbrXbTdey4Ix5NLKaGunf0l8ntS42u63?=
 =?us-ascii?Q?bDx/TArg8YlKNEf5Pf5yMLN0I0YnlFg/I9OjAbQnWAugcKK4aCYVcbhEhKLe?=
 =?us-ascii?Q?ZkUa44b188LYdyXfg33FCK9l+kC2qKkoEacOM6YEjP0BGUuxbeT3/8l71LbY?=
 =?us-ascii?Q?Q/2gd8rD+4dy22c/fhLwIsg3TDyG6j3Y375vachLEIWrVoHgPa7g62a2TzR8?=
 =?us-ascii?Q?PUEaj4yxh6mu8tOxczyNBk1i+aK5kUZIlryjNbwBg56HuCiZeRD+SbBSUtJI?=
 =?us-ascii?Q?8mXue6CVWzLJBjGyONUDPPyzaDCg/giygkZlVKnUICr02yzFOOzT3351c1KN?=
 =?us-ascii?Q?tCaDueZRsuaR4iZFmFpv+XVHIdc3TBBOnQkIAA54HVP7lsHYTgyk/hExb33E?=
 =?us-ascii?Q?h5qR5nIOkqP/DbcJJogMKZKSpI4zTQ24lVwTgrL6HW207IYcBK0vPmNd03JK?=
 =?us-ascii?Q?t4j9evck6WLlAZXcfG5zCtKh6QInKNcPT1PTxqifPbCW4g9MJn1A8ueuFahc?=
 =?us-ascii?Q?wr8JJptXOz0Y14hYV0Lts23jZ+J6veRYzgLwKBWTApUh26JGTeHPyKEijGmK?=
 =?us-ascii?Q?eoqTNT9pbflz2WQAAS/bK9TZkBe2/QJzX4FuuxOY7Qo6v3w2Q8yl+4ZKWikk?=
 =?us-ascii?Q?WGGNmGvQYsFztcglsZF2BtpBWdx0+601ChgQW7AtvxaXibZYkINAwACFWAWC?=
 =?us-ascii?Q?ZKzPe51DCU7nD0NcDxuE0mcboI0iYqxG+ehAkW1ndVl4NQG03HXbOcsqubSC?=
 =?us-ascii?Q?1/fczQ4DCLk6RatLZqEqn7L5Np7fw/4DJIQ7kiGwj7DdhLK8dj1loMe+3Z2w?=
 =?us-ascii?Q?ctAoKaNIgW/aKIYa5il7ug71SM7K9lDpsY7AorAhVBdQCimWtv9KGrzMvNEZ?=
 =?us-ascii?Q?bgYiTUd4GyMmMdXRw08YagXbWy2Gl42mScarAZsKZS3FhpymxTCC7hIh2/un?=
 =?us-ascii?Q?g9A9kCCgpuFK/6sRGNfWfl1YfuwfM+K8CeKkE646QKnLgU7IGmv8W09Y8cte?=
 =?us-ascii?Q?tZxTtHUWrdeFBMds1iGZW6Q0faBqoTPQTmOt2Hr1+mM9LWoFs31wxRl8ZtlS?=
 =?us-ascii?Q?bLl3I6Zi6PBXZLDMztOW26vzQCIbj2vWWiIzKDyJ4JrACWEW0ZzMUk+nxGHY?=
 =?us-ascii?Q?dTbovImmOU6Opjv73Fu0YjQcCDJlxnHWVw+QvtG05ZgvVJZ/qVMXbsxO7ytP?=
 =?us-ascii?Q?D1OYnjPuYu+GXCsMgHvPAeay9T1wn3Oh6QKJudXy9O7YmgGb5pUgOWNYXurz?=
 =?us-ascii?Q?+ilBHcwy0aaAMVsD1uW66yXAgeNPXFqWKQnfEcbc+7pSmwW5YhJS+i44knQI?=
 =?us-ascii?Q?GqN3kTmhzZYStYovzzUeyyz8Y+7d56hG6le6Uv3ps23322HbgESOEu3J1lDG?=
 =?us-ascii?Q?x2+XPCEEpeyKDxg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:27:17.7155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e246f598-27a1-4907-591f-08dd3c9c59e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188

Register 0xd9 was repurposed on new systems. Change its name
to correctly reflect the new functionality.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 8207447aae16..bd3bb06ff8f2 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -145,7 +145,7 @@
 #define MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET	0xd1
 #define MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET	0xd2
 #define MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET	0xd3
-#define MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET	0xd9
+#define MLXPLAT_CPLD_LPC_REG_CPLD6_MVER_OFFSET	0xd9
 #define MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET	0xdb
 #define MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET	0xda
 #define MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET	0xdc
@@ -5050,7 +5050,6 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
-	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
@@ -5186,7 +5185,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
-	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD6_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
@@ -5343,7 +5342,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD2_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
-	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD6_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
-- 
2.44.0

