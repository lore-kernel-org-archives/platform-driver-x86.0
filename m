Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD34231A45
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757870; cv=fail; b=tGJAPzmF3/Jt2K7q6azg/FBvXtqvJgtlnNzqnWWaUxSx7O3MBlnWIqya2nUbd88d8U7Kxu8xX0HyRollBZu12HNpxJW3vfMx6yTOI2oCpdVa/k4xrJmwTdbQXq450cJL3AEIo5ZP1/sa9oFXPvipcjHHAiAZ9MQVZQF71o6bep0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757870; c=relaxed/simple;
	bh=1UwpzhNQvMCufmER8NgOMZrTt2zm487oYz1f+wtefig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPBZOIw+0V3bLYyYKt+cIpeDQGbkkAQ1DH522LKD4JPPU+eCFFumt85ytXjPEPXMfboj4AJ8bpVngbm8Xr7p2aulVVHy4wDbKw2XZ76HPYaajXYgUhev2Q+uL+TeOyj60yW05k+RSOTa47R4w4OYIG7byZDqZ7xx+D2wFoZ4u/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fwB12JS1; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fwB12JS1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl0YE8vtWOnLBPvmtV4mPxm5C4kV5VnNOjdLtC5rt9NCa8X0cMPwkK4WPJl6VkLLKM2MojeGlSr2IHzqKTWSPEpEF9uRhDwtFG43gUDZGOpVnj4FX6kZbI5rTahQyMRQjYhd5KuRlBticg2nr/OwJ4fKFcJY+sQvTn///XnMcHP4x+h5sBTxBtoY5DC/jrvXTgkhlPN1gCucn5bY7rJrkRyXy8Y4dnjOKJjDl0Cxri3lNZohLF3OlupO7eVEGGMVmmdUvHVU29sO0iSv496241b1j9r0ueZp2Lih9dNC0kgsL4zDK0upVKAuudIai/hLuDs4XQJIq3n1WS4Fk6K2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=dSx/w+QW6eF/3NDvlP/ub0xx1LGRGjea0luGgk/WUcq/Z3iAM+8oNbw7CYbK713w2Rc9Jsii9PeSYLzjc+mZjSBeIjgkirOS+WTz8ziIRkWJ2EjxqjzhSc5TP+CXK8D/8rGrujOGPQ20OU1Y5vn0ZCuHM5c3o0Zg3+1AFgcef1t2XU3T3ukj4ldqUU0VUlLFDscGyyGIo6js2i58xMCSvjb+oSvcqJgZzubVjQh1TOhCs0dkkp3vx7qeFKSxorGhbj7o+Wtfi7iXyLKxvNCM8cDmrWj35ellSJrfRhvzKiIVKqYzVqdN7QkbnvqvGiwof7Q7BT8l+41PBHTnkk5WAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=fwB12JS1mT4mirIpasEVu0W8Mz3rCktlkJSuU12Lhdr+FP1igWUk+Xin26bzdWeD836L10fi5Dg9cm16kwC6cdfi9OYXfXNvVqqt+DjApIZ/jYAzDVSnJ4CqXLZj51jb7aqdgsY8rdiccFm/FLHP6XvuuRv0rO6Q3aTGgAhXXQAk9muAu4P1HJrBRXLBPg2y9C/M1tx0wZeSElCEyUe1Iu/w49x8f38bcYjh25LyQo6cnBDPJ0kL8tPX3tOIP5DSyeEKpJV5ioJGp7mLEYUzs12JwjGM6SadLafKZqoakNLzHIW9xqCD0cgdQFT/dCW5CwGp+/ZdPF13z2MGcQ1dgQ==
Received: from SA1PR03CA0007.namprd03.prod.outlook.com (2603:10b6:806:2d3::16)
 by SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Mon, 13 Jan
 2025 08:44:22 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::14) by SA1PR03CA0007.outlook.office365.com
 (2603:10b6:806:2d3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:44:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:44:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:44:10 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:44:07 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 03/10] platform: mellanox: mlx-platform: Change register name
Date: Mon, 13 Jan 2025 10:43:25 +0200
Message-ID: <20250113084337.24763-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|SN7PR12MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 769b6784-5a71-492f-a2d8-08dd33ae7a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/oaaqnxwyfkob6an4oMIrnb5mgycTpKzhaeasHVAucR60VN/lpGCTNQI+5J6?=
 =?us-ascii?Q?201uD58tKC9PCxPrn66fNf+FQdD3r5sXU9V5TbMJQhA8Mwjzr2k4/12iHsnQ?=
 =?us-ascii?Q?iWgNPGuonoHwTajFib40KMpnIV4wKik/SkDSle7H0ZAzr4QGO/KiqZy4fbx4?=
 =?us-ascii?Q?1Z2BirOpn/ORobk9fsxD1Vm7it+wXQPRSpAGq4xF0i0XAlNXMvEn3keu54mh?=
 =?us-ascii?Q?7zXC9XEEdhxOuuWaMRQ9JixN12CMfRb9liZJXjEaNNt128T278m52l9YUc2y?=
 =?us-ascii?Q?FP5XJN8E6eSGeua2xbkcI8I/58ytp4DlUKrv080Ajn8GCBJ+AqCV6Y7LIKTc?=
 =?us-ascii?Q?rssTxNSUCoBC+oYYdUN3nD3Rg6Jx77NmAgNo1T4PHMCAEoiVfIxGfCI943Yd?=
 =?us-ascii?Q?aWbIT74gTDXrRmdw2bXegbQP/GfX4/1RY1IXCK6I4/peKr+InM0h3qs7QSli?=
 =?us-ascii?Q?zE5ua6dpjuCekm6IPj5Ghsqqb6t+QhUgpmn/EGnzwJAT9l/Y+1Ps47ZPQ2TY?=
 =?us-ascii?Q?agsx0A1UycL7IBtyxNqhhosBJbI93uq43hNvYqdogZT2vYrdsj5vPAeDyufD?=
 =?us-ascii?Q?c5yWf5DypZGbRDfPQzoq8A4VxRvEf5JQ1qxFvGzA/CY2wnjmiBvvgLurNzBk?=
 =?us-ascii?Q?cuyPMBNJ5DzL0mF7S7RY6rmIcx1dID7K7byrJxhyjCE4kbvtqU+Ipq2PzD10?=
 =?us-ascii?Q?OjZtUbrsDx8ViZcyYWpVhLehGyeZ2YZxaYXh6g0ssgS72KzD8aRpTCSr9FRc?=
 =?us-ascii?Q?g3hgmz3nEueHnQ/C73YFlukUbjHumRwhajfG40ZMrgGk1BXZ0Y32PMjiKPGp?=
 =?us-ascii?Q?Sdt1ghV4PY5aMfPaXmxDmUkKaNpcRvpJaI4Lg5uz41wfReYw/WzO9EvgBp/L?=
 =?us-ascii?Q?aWjDSvkd88YPCqMGS96XQwXlmWLquYVCzj+5Zf7qpyQEowwXFHuv9ycCjoWy?=
 =?us-ascii?Q?GlyWiM6ndif2ipznm8LaaUKiTqHgwBwe2uQHdAGO9OnjpUSEMszx0bVEyih8?=
 =?us-ascii?Q?ccrBXLNnOnZfo4MCqQzISFe60oC9xpRwk16Y+8nFBPc17fjP17oVsldokfuy?=
 =?us-ascii?Q?ClRHWphVyUqTlgTpyUqHHahpv7CDWy7Y5LeyZVL5PzPe3XBieGQEZ7Ynqo82?=
 =?us-ascii?Q?SJz/ZsZQOLJmMKydnW08YqVgOah2AEtKaDYJEDuNwgXKw0264LADsjmAdPyR?=
 =?us-ascii?Q?K++w9IWV+8P7Q479fuiUXRb+YUpzm5h1wofKClcdBP59xQ8aqMf6z91uTpiQ?=
 =?us-ascii?Q?01yhbWXTtXHENeOG714cs+NrqJbKNTrUN8tO02PBeBS0hh9qqlMwKGhROEVP?=
 =?us-ascii?Q?4X/FfgRClEsPZXGkHHT5ZT/i78AdUNMaZZcEmbYXom+4HSRgwE3L34bce9Bs?=
 =?us-ascii?Q?Mzze7RilaFZBgtlHAtIjO9Tou4di+KW0RPzir1uJxGU/KUuCaJxz8N6FrgAv?=
 =?us-ascii?Q?JBATsc6JiPtyljOtPSYoO3/165C0a+rc+2P6cqOH2ilgVJnYTj5fTQPfixqB?=
 =?us-ascii?Q?xwN/69I8t3gXCVc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:44:22.6403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 769b6784-5a71-492f-a2d8-08dd33ae7a6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180

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

