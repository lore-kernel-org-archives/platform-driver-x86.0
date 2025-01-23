Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641B154C07
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659356; cv=fail; b=GzUHF0vdFtcruHFIUUSLSisBH+VkPupCZUrpPZGc8bZDxi6aQOqk+aXzljMO+cugiXAT5wCM1IYgLcnmFeaP3Lo/XSihDHTBaWlSiCLlXSWWOnJB1m3ru+0nAr7dIwq/fz4QlUFm4Laqo/V52n3EDrG+EIjjw2Yji18dPrXa6uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659356; c=relaxed/simple;
	bh=1UwpzhNQvMCufmER8NgOMZrTt2zm487oYz1f+wtefig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jInf/F/nDZiCuCmCZPzRfoEOzfYvJ4oMG7nTbzjW5T3U8XkWWYl4SIvnpPYRuS7mIXpSbWT8PP51rWuOFqIJJgH1bXSqbLd0mKAL0c1EkEvJ2bgfgZ7MbsziNrgwQoQenXhL11hyxqMdbecDyeoawExHhIQ48dgmImNtGD7hCcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pmlCKcoI; arc=fail smtp.client-ip=40.107.236.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pmlCKcoI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrkF7tAAHpCZOPV0v0jUv1oeTlrK1pqPtJCLKw/+0vqwXWhIomcyQYPwVLaIYPlAhrw/fcHz89fV4PlnUzWuoTW5Qta7xc1Wxc9L7Wib9CfFYxmnJR4DanVwIIrNRd4atHKj373Km3cLUBp3SN7GIPG86e+OeGm0CPZ/J0aVchqKrKKJt6pyFDQVRW+kbzyrXtncmXHExkDsfY8wNRS8LtNx/m0gzkM2jf1lXGofYqzqaC/IrnmmZ6NhlZhUUZCoJAOKxx+RqUzLfj/gsM9tGKG9zU+FH2YSrvdgqVSF6TLa58Qzn+579381deKInqvt7ppUz6RGEYh9A/pVk1gDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=NT5vMd68O6odGLwdSzjCZb2ZCwFRQLyPYN+8YvYKxJHT60bL1r3RuLkShZkZ31ntcY34FNWT0WDGrAsCGutUG8xquWw9CfM5Lwm/ogkhQWrcAkrIAIuSxxVXL2DCBOdLraQSViCYdc9H5oYpE94c1zyASxp0fa3oWTxp/1Cs6pSQGIDq/Vpgaxu1o0nV9PTsLGa0CjktHrQEUi1/uoz0oZ2gG8cW1AEQGCXFdl6yhuu1i8rD6mzTdCudXXK5793Hm6M37mW7k3xqrsBSND+Osw0b484zHUw2McOyj3pqNaHVlCnRQWNpAIUx9yIvlVeG/2HPt65E8RBG7jJVc4A3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=pmlCKcoIla0/7fAutZ/Oa6PcMIwFVosrgDDaWQdcZSpRr2zpD/MQYHZ2Wa1Hp1zedGgxfMwi0NC6u1/qlSbgUBX4HU0AjbMv7g40FXn6ZjQOEHcFtHxNCGm7/v5hv54/nQ4NbsKQV7RELwl158YqYf1PbcYYsBQuLOTpz2Pl+fu6xyH7E2FwOXgrekm+4cCH2yvWq+hTE25BDXOZVE5TN/VMzrAYNyB8D6BzlcMva1SX40S4q32ySOgXwhIfuN1Y3I4aPsfs6ApdO7i4ymk2q4QJpK8OISaVcWfLIR5PFuH54Wn0ANnpeOcwptHW5HoyJGRDftI/wSQ5Qdu836ClHQ==
Received: from BL1PR13CA0333.namprd13.prod.outlook.com (2603:10b6:208:2c6::8)
 by PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 19:09:08 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2c6:cafe::7a) by BL1PR13CA0333.outlook.office365.com
 (2603:10b6:208:2c6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.10 via Frontend Transport; Thu,
 23 Jan 2025 19:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:09:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:08:50 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:08:47 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 03/12] platform: mellanox: mlx-platform: Change register name
Date: Thu, 23 Jan 2025 21:08:07 +0200
Message-ID: <20250123190818.3834-4-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|PH7PR12MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffef0c6-fbd9-476f-45be-08dd3be16945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hw8OAKMB1fkcyqkeA7z2nMchKG9fVUVsm4CvvmhxNLqTcQXrxV/8pf/dDGR/?=
 =?us-ascii?Q?ZzKUnUw0qvr5hurianIj/NL2wO9m9iiXeorZhxyK9cniuJik/SuCOBjsvJGE?=
 =?us-ascii?Q?mYMyYJEcHMT2ijjJSX6YSqcjAfRHClPlK/SwddVctxaGw1YiLO489Ef/RMXw?=
 =?us-ascii?Q?KtjrF2mE3XNLWe2U6q6L4sN7qQC0mr7k5dlwADokw1FDxkbKs/hX0vyAzJui?=
 =?us-ascii?Q?EMF2RbuZj/ahDjI5grSiY81PauwSLXfXQsv5Yyst5Y0eQkyHlN856rGstiFr?=
 =?us-ascii?Q?JnU7+3uMHok39WOJfRHQsrNncN2xhlbH8IOgAovrB8BVumw9zBDEjtHbStFd?=
 =?us-ascii?Q?Q6qWGpQPqmjHLeoJk71cHsd+sQGMaty55SVCaGPXlP7/iaBzks5Mhw+OQdU/?=
 =?us-ascii?Q?ztsS6veE1kRyhghqZTGeypEpQmRqjYhzQJaPlSMSc5kFQ7HkWF0PssW4Ds/l?=
 =?us-ascii?Q?GU4BdH+fCZvQMxvIyw6vXyWhnUwn7/H/c5LTy3ePEvDlcqxYVTUL5b4fW0Ws?=
 =?us-ascii?Q?U9NwSaGhv4bJJljz5e6n36KpGENTK2nt+JuM5nHRor9BR47XnZx1YWXi5s+N?=
 =?us-ascii?Q?klcFvbH/OtAay63U2cgId4gIgAgb6lrX2RbVKgo9JBSLNLRfL1uz5b+FUtsv?=
 =?us-ascii?Q?VJ5Vg/ZzYQb4gXF2LxWjMKsvgjUZPtqgDS463vhgeZv8kGrRJjXFuWRyVU1s?=
 =?us-ascii?Q?i4qjBxzVH+7tNUyULPZpH8NARwTkx09XP6sH87xurDFUqpwX8jzldF6uvw3y?=
 =?us-ascii?Q?HuvJzrCRPTEcUCWtDwXTkPa0IeV7E8CSEoN6e7znH6+5sIIZSWCaNeYbymOI?=
 =?us-ascii?Q?3TXeCiMM/aSF/wndSnkIjQW5TvFqeB3A4PuSxPncqZHMwZTVDhy6lwywCxPj?=
 =?us-ascii?Q?mKi2F1HmcFNbkcWluEmygBBwdVCnCtICagvDw4nxNAT0aYliwao1KXAi0Wm7?=
 =?us-ascii?Q?f6tblC3daCkF8i+TwxuR6n8u6zXfk6PB7xNUZltUZfXFkwG6tSRQDDeb3CZp?=
 =?us-ascii?Q?fu85kQbVTSrCNgLLbWzGqciZkkabc5kangmNeuNehWEV1B8u0jAVhhYp6yKz?=
 =?us-ascii?Q?GYphudKkL5sUQwGOxMYV+UzfGtKa/vpBVkkItNXem9+wfIsN3dTdWBoAUrky?=
 =?us-ascii?Q?sejFvMCJxEGRifGE6gvkTxOjaYdgFwbpL48mBHGSrg9MGA3oObqHNfxghOOo?=
 =?us-ascii?Q?ebyASpyEZtlLK+kWdMDKlXVP4yDTYlZNsSD6KJWNesqraZJ42IfrIKpAmOUB?=
 =?us-ascii?Q?Q5LphKdZc65xcZsRHy02KjCZmw0oDalTRpMkq/OMbpuRsgFPE0g1GZneCNfq?=
 =?us-ascii?Q?UiTeAkVi0LkoPibmlpYvUaTR7K85GvxdUUZdX6vThdCxFDavotSWfFzoQbC4?=
 =?us-ascii?Q?h5g6dALSxeNk3SVzGocGyCPGSSoxC/o20xHkm/9Wibwu6Jqyf1E0uaecn+go?=
 =?us-ascii?Q?HeWNfDtD4AK0bj9ZvseyWUSXqmcCS1oEkulRsaQveRT4G1YFhgLKtsdJycre?=
 =?us-ascii?Q?gR0YU9UOdUFCUas=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:09:07.4900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffef0c6-fbd9-476f-45be-08dd3be16945
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596

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

