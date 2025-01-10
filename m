Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4577204F76
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516764; cv=fail; b=RATIlcKgX7pMCUaLJHNDse3rTtemzQ24FLID/OClQ/x4x971QcsfJPIU3gKelu4abNWV60UePSiprJV+aQrAiewl8T9VcaTtZAPyqNwKJiUEen7NgfSP0v8xpJ60VmZM/c2uB72sH/6ocTSlaNrZ3ONT6Z3O6O/aCvG8N+VVOLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516764; c=relaxed/simple;
	bh=UuJnDbB/n6GvhnW5BHAC4PYKeOG+W8HHclWvBklolh4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0GxIjzQJPW0g/UKMAdTlf3XeRlSj56qWkVecCht/y2lKGnbbk1wDmRr5l7Wj89ejrtRfdHe9EKa3dKbspFX6In372AJXnj8lBk2BHHeyg5TM4KJRp14iOcNVgfnqfowJpM0wt50cwM1ce52tbT6SaslH3XbkIfvzWvLHMXSbr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KBM/iFxJ; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KBM/iFxJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyAEv0meYFRDxGrJF3EgtciCbsDLZ468jTRxXcHwogPonEgvCB6zJKoy6kCn7/HoBF8FFfPCGjnBB92ksftbPNF0Z1S8LHs7ZA2gGgtWQXf4Lx20JI4EeIR9lbynmQuFXWp9sRTlV2yfq1wgYQiHKzGEufat/OUJDYv08IcK6ndfWp43muCCDVKuC+vzvdlyqXieDO2vdCFlCI/w8ronPqHSdxFsgtJmXR2b0VmJgas89NSdGmeIP0ltyRWJwSJCF8nRRNemzPBgXCBJ4zPyw4ELLGloFFBqwoT963IpH3PTA/E1x3z7JmIxGF/RiWPoGSzgRdm3DSkfF2Q+Q3VfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7l1d69sEDtZGLn/J/QkBa/WfnkymqVhK7Apc3Gj4YU=;
 b=unHLeQlWUqfIWTdXxXkq3mRIv6dplKy8AvMbV4OOPAJlxeVXsFvwPhzVaQSGA1U7Jiv451i2TGbEOqZCtRhy8oir1YnI3uPuhdCVWvMn6E0gdYMg+NEkbf9GzpyUMk8Pc4xZ9dPhTBFkqpGxuYmnTZ+1zct+qJzig321kmZBDrotSpEcsLbX7r94pMky29eo2Z02Fah19TxF2RmA6H1Geqd9Yp9/RL7pteDTTIA6VfviqVLv8izW121izMd5dF10pu/sf4PDnEaWie3BUF80hRb8uswLUlJTq7kloqO/+IhF0C9l+pnQr1sih3TkUbOudgS12MZAan/mq3O8JvBtPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7l1d69sEDtZGLn/J/QkBa/WfnkymqVhK7Apc3Gj4YU=;
 b=KBM/iFxJWYhD2e2tv5tYpHzLQeZGSTelE9rVswTD42bGLgd3pN5VMb3VdZPr1qivnp/mO5LAtdgiLAMberD0JfG7nxj98r7/bWOA4rQ1wPFvd5d/X990S1In6D0hOV5Qq9MrUPvIb8b0+6m4vIDE3htwYHPojlkh/6Z3lqNJpXquIENH6cGnJma6pSlXhZKlqutSdStORbTCUAzpw8/xH1duPh2K2Hn/EYtkeZR99UHvasI8qcu3c+9z3FmthjATX0n69Gwr3pCyAtpwRRPrDCyw/4ldvsfIHK+JYj4NhlHfnxil4T8s7DbFZd03GlGWQkaDCcaFZMCBP0s7WtP2rw==
Received: from MW3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:303:2b::32)
 by SN7PR12MB7450.namprd12.prod.outlook.com (2603:10b6:806:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 13:46:00 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::dd) by MW3PR05CA0027.outlook.office365.com
 (2603:10b6:303:2b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.7 via Frontend Transport; Fri,
 10 Jan 2025 13:46:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:45:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:45:48 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:45:47 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 03/11] platform: mellanox: mlx-platform: Change register name
Date: Fri, 10 Jan 2025 15:45:01 +0200
Message-ID: <20250110134515.8164-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|SN7PR12MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c1194f-d2d3-413c-46fe-08dd317d1df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WNjddflFzSnQc/uU8Gv+dDQzl+q0JSGdgQJUHkmp0AK7GO0JTeaRXjbouWP0?=
 =?us-ascii?Q?Rbh4XZJ4UCZyrwz8K76+u/xkzG8uE1rXsOB+Nc0fp7C6k/xWN/82hEu/662y?=
 =?us-ascii?Q?W2KUGvGJg2OEXCRcwFkYLM4eA2iEuEhwSI8kzuPF0018AC9BQC2E3A3Laaai?=
 =?us-ascii?Q?+wvjlw7g2F7W7G/cB/20NaLuLRGqkkhBdd9HwK/Ej+/Yc7UJTLJZw0Sor7Iy?=
 =?us-ascii?Q?21t/bw9EahvOycrje/kd9LbInupeT2RyBUPEa4UHxvhDOkF2JuezlSJvCXzC?=
 =?us-ascii?Q?9qk+HHPuE+gWJD9grFdQ5LqYBGiUWdYs3I3qUbax8If5E3vPZDKza/Dxl92v?=
 =?us-ascii?Q?fTfIdqSVjWzxXe68FXRJ/t1ouujcrAwlxJEdGEEKodIifS6Z391ox3qoEiG0?=
 =?us-ascii?Q?sZ1LZW7dwGpEJ5lSMDMjP/lx/GC3DZNw4dTXsD55ICXVn1HseAwD6I4FdT2w?=
 =?us-ascii?Q?IwgU0QdAEX4nz3ZJBsgGkdW/uegTCxRnT9ubiySEyLiGZPFA3cPfrLUGqAum?=
 =?us-ascii?Q?iDbr/46LZ/zDz2ebYlSaJ+WyHlDGle6eLQp0rEBWFiV//uyDSTMyJumPiip9?=
 =?us-ascii?Q?7pd0xPzBGDIjvFGmmguvz2IYcvWsxVL6cMs1xZJP0tz2uaZ2olf5emyOgbwk?=
 =?us-ascii?Q?1/g+/f4uANzWKaOOC+iGTzXPYK52K9JWg6EZ+FpwNYwTlIPZPfj1k5eDQzMK?=
 =?us-ascii?Q?BR9Pu9hmHaibcHaizTktbWpWqXHgkJiRYGI+hGWDg6KrtxYE9pe50nqnjWHp?=
 =?us-ascii?Q?/Uk8Vfy7A47pzt1W0lkp4vgDcMWFD6nIjY+Pi0xFDtClTf2ZMxdk2xS+5STh?=
 =?us-ascii?Q?jPMU5W7wMOznCMRQ8WSnYyXikSa37RSO+M/gikOC90c7OPTA+KqgAF4wUnBJ?=
 =?us-ascii?Q?5NoegyWB1f8oQ933lov8icG7mQY1fK5df3j5o1jypeSoHXO40qJO8VqQwNJ1?=
 =?us-ascii?Q?sf0o2tAluxTTuqZGZY+eGjFxNvfvWkUnw8zkOPHFDR/9bBPljRV6HJX8RH7E?=
 =?us-ascii?Q?QrfnLVvcXujXk+//DP3HO7TozwNiU9su0egTVlTel9WloZXXbErMRq/QFze6?=
 =?us-ascii?Q?r4eexDGGP2bu1mVTtrMTC115opBLyuaBFA4XrWgWLe2tCUtV8+E8kmswHaa3?=
 =?us-ascii?Q?YgyPg8l3S2jHVgsE5VHdegoP1fbk4HqkxK1lE5gCmLnv7m9qKec5XAhO+mdf?=
 =?us-ascii?Q?yuIou8+G9tdm5bKSdn7ITtMgytMuy/nAbiDrnb3CHklCbSdNHny/xNLdvJE7?=
 =?us-ascii?Q?7RW+PUAQT3nPto/4EL5DO7+siOk9LqnIvbrZ90arRTHc+YiXoETfRGtAkrNO?=
 =?us-ascii?Q?eQt9A+asvLaLmqLKKOtQlPaPfrCcCuH9r9jxuXpUin2HN5Bb9gsgM6jXFh00?=
 =?us-ascii?Q?dHCcxmgEHof4dOgKwdlAYICcrxUFf2u49PApXXmT96q1o/8D1/LlP2Lbp5bC?=
 =?us-ascii?Q?1F2py0juIE/5Z7Wzhue83sSd1D+uWyRcxVOcNiZUXkhP0HvUPs5CDdbSTYxB?=
 =?us-ascii?Q?8b3on70wBcMu21A=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:45:59.8384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c1194f-d2d3-413c-46fe-08dd317d1df3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7450

Register 0xd9 was repurposed on new systems. Change its name
to correctly reflect the new functionality.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Felix Radensky <fradensky@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 383dfaf66983..08b0430a2899 100644
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

