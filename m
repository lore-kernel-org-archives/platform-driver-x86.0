Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967014F9F9
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757967; cv=fail; b=VebARyr5RRCkSpnensJu0rHd2jNXLh5hRXKCTrkfgVT3d/OUsfJdWRCX0oeHV/v5xSJ6W6M6FwW6TU2XAuSqP/yiQ3sqysqlI/DBU5Oy5NpR76L4y+7nx6A6JtlwjwuUGZrVq+EuwwHFYeZOEJH2yEl/Xh/NsFbJJD8qaL8ZN2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757967; c=relaxed/simple;
	bh=2u18qFSqcP5zaBMVkRJUBviU5An/MHenJCQxKPdhZOs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0kjZT17xiqQqX1lTYgPdiD/zEjjsiQz+QgC2geuCc4N5zomJl3KC7l9lTsUQqliMM/JU6zA5T+PBKnCWtGmdmHb7ieUsy3DDAhOZOdpU8tb4+OijyQkohzpcXQEYUFW52RDI4iBtw9h4TUm5iil749zZmoZznt4HgGcGqjkeC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I289Y/jj; arc=fail smtp.client-ip=40.107.220.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I289Y/jj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMqw0O2Xopkf+hybNwjtz14TqzDs70i8m7JPaN+Gj5g4j5fD3CgBk1E2CrCQ9nM4cNaMh5bHE7g511Idh2seAXKN+M7iLeG1qXvO65h4oMWs2boI0rhKrybXiKs3UV18woYDF4zIlOgeDqS9vfIjmYZGk8pDj43Z0yzpdE72W8CE5BV1qTYJHwauRQuSq+2TtZfsRcQtMcnZD6FvNcXxMAK8RBwCXTm9SgzkbbEy01BhHTBoYmLx1K9VWUUEokmuLlXKfT3hnp73izN3tOEG3sPNPIOl5Xhp2OZrFCF7/zLg5Qh6ZB6YucDKDgewdfZeqOUd6Ej5bAFTbK3NxNEXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB27EZ7FulJGErm011Ef6M9koA9fOwJmIAeR9T6PMYg=;
 b=rL1C7z41vOBYtlpl8SExW0mztRgc3UCS2fFiyd/gu4gfHRRPn8WJ9V+HQP6iffHZAFLCCUglPXxfA5kJGPE89w1QDSRwoEc0pT/Eyb48pVItN9OL9wnPC5qMHnD6yzPYzGuvy/TT6CP6suMG63m+/Mvv7H/AYkaHzNd4HwEbLyWloJWyc4K+2ZvNYfqHlDsLd9Ifi8aIkqvS0NrMVhDauor1A3GzYROGHLHqAmsonyzRgNphZHe91AnctD8r/FlBHJzAeoDCtbbTMl8xmQhLWKyct4/EdVI7twUFDjZARIbRgSprfMbNClpANJRbNLoAIrfqbWhMwoCG4nG7KtqRrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB27EZ7FulJGErm011Ef6M9koA9fOwJmIAeR9T6PMYg=;
 b=I289Y/jjO604S+mi1hy6PuzCw9OpLuFD8ySBae5bxCshPIM70cot1tD7wARkMW1C3qbPGRg45qniMKqRSATEwPNFwxVA2PGf8+0D6y6ye6K3pMrzT6miBDr9JwaxAImHCI2fHm2wbiudlnaGLk51MBQFS1Icc7UX9MugwiiHqoU4zDlgC+Bn71/z3EjK1+ynmSbHd1Z0x6Nx7cJKNfsiuz6nSnKiLNymL+WnNd82XfldRGiuXQ9zIfCEiX3/Oki5quu/3YeNU6Nlbqeu+WvdRtTSbAtJI1TzIV5XTmv2C8ZaMZvOn3OMi+cxs8E+cYSsSm+0P6b8uuy/rZdJnU7ZAw==
Received: from SA0PR11CA0048.namprd11.prod.outlook.com (2603:10b6:806:d0::23)
 by SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Mon, 13 Jan
 2025 08:45:57 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::d2) by SA0PR11CA0048.outlook.office365.com
 (2603:10b6:806:d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Mon,
 13 Jan 2025 08:45:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:45:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:45:42 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:45:38 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 06/10] platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
Date: Mon, 13 Jan 2025 10:43:28 +0200
Message-ID: <20250113084337.24763-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|SN7PR12MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: ab108c0c-c2c3-44aa-c625-08dd33aeb291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVBXVklBSjVkd3lrdFFtYWgzeFFzVTlKbURueFUvMkFkcjcyRlAvd3U4QTN4?=
 =?utf-8?B?eUFqT1pDS1ZyWDVMeElWUFRzaHB1TFY1TDRNZXkxSkRoaGNxVzZTOXdjYjhu?=
 =?utf-8?B?R0VTWHdFbHRxVW9qNkt0YmU3djFaalFZV25oSG44dHhDUW9XbEU2bGUwdG5w?=
 =?utf-8?B?SnBhU0k1LytlSndqYzVEUG5Xa3puNjVBdzNuTFp2WS9hY1FFbDZjOXVCSzhp?=
 =?utf-8?B?UTNDNXdhN3JPYldnSGd1cVJHaUZkR2d1UERHQTYrdm9ENE94ajZDcE1zSFlr?=
 =?utf-8?B?MjBlVHlWZ2lLTkV3SXoyOVlrdnNZeWlQQm0vSXNGQ3BZSjV0WnpmeFh2cGtP?=
 =?utf-8?B?Z1htdFZFelJidzJpTTd5eTRlNnAwWXVCUVJ1QzdMRUh0SWNZbFdJYnhBZDRI?=
 =?utf-8?B?Vnp6WDhEODVmVE9EVGwxQlprNjgxYXkzT0RMbmZybmdMeGlhaWFCa0VtcVE4?=
 =?utf-8?B?VGsxZUFnRVNnc2l5ZkdlTVIvR1NwT0pVWFpnR05VL05POG1sNk9qMDVHb2Z6?=
 =?utf-8?B?emN4dm00QU1iYi9zUTRBK3hOS1c2bzJ6ZllsK2hUbHBoZmovQUFtQ2lqTk5l?=
 =?utf-8?B?L01QR2wxRDFxNmFYR09BcU5YTFQwZ3dtTTJ1NmxpZDZNNVR4eERlMXFJaEZE?=
 =?utf-8?B?NThuVHpDdjhXQjhoUzZjYS8weE1yK082U3VlVGlva0hEbm80R0ZVc1JOK2ZY?=
 =?utf-8?B?ZzNhd3JCd2VrTi8yTklDL2k5cGZtNy85cmpXbGEwYlZjb0FXaGg0SzR6eVJu?=
 =?utf-8?B?WTB4eDBVcDdEc0NlQU0rM0c3U1ZZQ1cwL3A1alVaTXV1QXBLaVJYWUNiUjdu?=
 =?utf-8?B?dWJxbVNrZGRWVzY2dVhsWVFYenhrcktzWGlqcUZMS2Y0bHdUV2gxbGpGMjI3?=
 =?utf-8?B?WnJKVzBsN3lTT0RXcmZxUjhMUnJJT2tWU0JHOWJuc1F4elM2N3pzRUY4RjNM?=
 =?utf-8?B?bDZQWGhHeDQ3R2RFM0h4MmFZSjExUnh4eTZNaVlyZkhNS2ZzZ1RIbjMzLzlI?=
 =?utf-8?B?NjNsWUE1K1FXZ3dYUm9nby9vL29JSlJKMlBLN3ovOXhBbFhCV3dnUFMvRmpi?=
 =?utf-8?B?YnVDMmpOL1NFV1g2c3hrdExMNmRLdDFWMWNEVHlaYVdTcDRBd2pTSHZRTDcr?=
 =?utf-8?B?cE8rSXZMc05vOVRZVG9DbUdvckJLcUNnemRqZzVVR3hTYytQeUQ0enNwQnJG?=
 =?utf-8?B?cWVWMnlHb1VKdm9GTDRhRFo3SEJSQnZ2RnlVZTlCVGMydmxrVTU3REp4UG1r?=
 =?utf-8?B?VFpQOUR1WFVCenlJaDJRb0hucWl3NXdydEh3RTZvSFRFbS9Pd21iREVtRVhD?=
 =?utf-8?B?S2gxSS96T2RPa0pJdU0xUzlMTUhkMUxHaGlDU2hRN0U5Y0JiMTNoRUFrNlVJ?=
 =?utf-8?B?SkorWjFWdDB0UlAyL053N2d1UEtlOHJ6aUhuenJpdmpxcmtTbWt0UGNxUWI4?=
 =?utf-8?B?cEhEaW85eWE3RVJ4NVVNLzVhSzdwbFQwd0phNm5UWkpGYXJJT2FqMlZDUEhj?=
 =?utf-8?B?UkRCb1RIWGYrQVh3VTRFRHFrbngvbFB5bHNTOHp0RVl0NGNmaDQwMlp5NkF0?=
 =?utf-8?B?bXczN1lXZmVRUFc5bTN6UUYxcTRPRklGdmc5WFhvSkMrbDZidkpNY3RScnhE?=
 =?utf-8?B?S2FSNFlMRExkM0lvS1VmQ1R0V29VZTdGbWIrT1VPajR5cG43MUxZbDdIOXBm?=
 =?utf-8?B?Z3NRS042ejZaZ0VpcDRwdlR1STNIeE0wSFhyODRoOS9zTkNhQ2dkZm9nTWcx?=
 =?utf-8?B?cW9TMDZldkl0N2U3cVFzekVkRHhjR0dPdGxSNDlJRXdHVmh0Vnl1YzdyNGZ6?=
 =?utf-8?B?UHJlbGptZUVXRVRUaDZqdUZxSDgybEcyeVIyU2JVcDRnWTVneGxtS3p0Y0Ir?=
 =?utf-8?B?bVBnSnp1WklBNTNSc2VQaTJySURjdENOeS9TWXpxS3JKNUlxaXN0RTVEZkRm?=
 =?utf-8?B?NmxJVWVHV3p6dmxFU05wT3A4MEdDQkhaSDVBWlBEMGxIQ1hUYjFsNmJsTndZ?=
 =?utf-8?Q?uMY6Yro1a/wfyndNWgnzMw3P+G3wSo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:45:56.8296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab108c0c-c2c3-44aa-c625-08dd33aeb291
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180

Provide platform support for Nvidia (DPU) Data Processor Unit for the
Smart Switch SN4280.

The Smart Switch equipped with:
- Nvidia COME module based on AMD EPYC™ Embedded 3451 CPU.
- Nvidia Spectrum-3 ASIC.
- Four DPUs, each equipped with Nvidia BF3 ARM based processor and
  with Lattice LFD2NX-40 FPGA device.
- 28xQSFP-DD external ports.
- Two power supplies.
- Four cooling drawers.

Drivers provides support for the platform management and monitoring
of DPU components.
It includes support for health events, resets and boot progress
indications logic, implemented by FPGA device.

Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/Kconfig      |  12 +
 drivers/platform/mellanox/Makefile     |   1 +
 drivers/platform/mellanox/mlxreg-dpu.c | 622 +++++++++++++++++++++++++
 3 files changed, 635 insertions(+)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index aa760f064a17..7da0fc46b1e7 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -27,6 +27,18 @@ config MLX_PLATFORM
 
 	  If you have a Mellanox system, say Y or M here.
 
+config MLXREG_DPU
+	tristate "Nvidia Data Processor Unit platform driver support"
+	select REGMAP_I2C
+	help
+	  This driver provides support for the Nvidia BF3 Data Processor Units,
+	  which are the part of SN4280 Ethernet smart switch systems
+	  providing a high performance switching solution for Enterprise Data
+	  Centers (EDC) for building Ethernet based clusters, High-Performance
+	  Computing (HPC) and embedded environments.
+
+	  If you have a Nvidia smart swicth system, say Y or M here.
+
 config MLXREG_HOTPLUG
 	tristate "Mellanox platform hotplug driver support"
 	depends on HWMON
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
index ba56485cbe8c..e86723b44c2e 100644
--- a/drivers/platform/mellanox/Makefile
+++ b/drivers/platform/mellanox/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
 obj-$(CONFIG_MLXBF_BOOTCTL)	+= mlxbf-bootctl.o
 obj-$(CONFIG_MLXBF_PMC)		+= mlxbf-pmc.o
 obj-$(CONFIG_MLXBF_TMFIFO)	+= mlxbf-tmfifo.o
+obj-$(CONFIG_MLXREG_DPU)	+= mlxreg-dpu.o
 obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
 obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
 obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
diff --git a/drivers/platform/mellanox/mlxreg-dpu.c b/drivers/platform/mellanox/mlxreg-dpu.c
new file mode 100644
index 000000000000..2288595310e3
--- /dev/null
+++ b/drivers/platform/mellanox/mlxreg-dpu.c
@@ -0,0 +1,622 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nvidia Data Processor Unit platform driver
+ *
+ * Copyright (C) 2025 Nvidia Technologies Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_data/mlxcpld.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* I2C bus IO offsets */
+#define MLXREG_DPU_REG_FPGA1_VER_OFFSET			0x2400
+#define MLXREG_DPU_REG_FPGA1_PN_OFFSET			0x2404
+#define MLXREG_DPU_REG_FPGA1_PN1_OFFSET			0x2405
+#define MLXREG_DPU_REG_PG_OFFSET			0x2414
+#define MLXREG_DPU_REG_PG_EVENT_OFFSET			0x2415
+#define MLXREG_DPU_REG_PG_MASK_OFFSET			0x2416
+#define MLXREG_DPU_REG_RESET_GP1_OFFSET			0x2417
+#define MLXREG_DPU_REG_RST_CAUSE1_OFFSET		0x241e
+#define MLXREG_DPU_REG_GP0_RO_OFFSET			0x242b
+#define MLXREG_DPU_REG_GP0_OFFSET			0x242e
+#define MLXREG_DPU_REG_GP1_OFFSET			0x242c
+#define MLXREG_DPU_REG_GP4_OFFSET			0x2438
+#define MLXREG_DPU_REG_AGGRCO_OFFSET			0x2442
+#define MLXREG_DPU_REG_AGGRCO_MASK_OFFSET		0x2443
+#define MLXREG_DPU_REG_HEALTH_OFFSET			0x244d
+#define MLXREG_DPU_REG_HEALTH_EVENT_OFFSET		0x244e
+#define MLXREG_DPU_REG_HEALTH_MASK_OFFSET		0x244f
+#define MLXREG_DPU_REG_FPGA1_MVER_OFFSET		0x24de
+#define MLXREG_DPU_REG_CONFIG3_OFFSET			0x24fd
+#define MLXREG_DPU_REG_MAX				0x3fff
+
+/* Power Good event masks. */
+#define MLXREG_DPU_PG_VDDIO_MASK			BIT(0)
+#define MLXREG_DPU_PG_VDD_CPU_MASK			BIT(1)
+#define MLXREG_DPU_PG_VDD_MASK				BIT(2)
+#define MLXREG_DPU_PG_1V8_MASK				BIT(3)
+#define MLXREG_DPU_PG_COMPARATOR_MASK			BIT(4)
+#define MLXREG_DPU_PG_VDDQ_MASK				BIT(5)
+#define MLXREG_DPU_PG_HVDD_MASK				BIT(6)
+#define MLXREG_DPU_PG_DVDD_MASK				BIT(7)
+#define MLXREG_DPU_PG_MASK				(MLXREG_DPU_PG_DVDD_MASK | \
+							 MLXREG_DPU_PG_HVDD_MASK | \
+							 MLXREG_DPU_PG_VDDQ_MASK | \
+							 MLXREG_DPU_PG_COMPARATOR_MASK | \
+							 MLXREG_DPU_PG_1V8_MASK | \
+							 MLXREG_DPU_PG_VDD_CPU_MASK | \
+							 MLXREG_DPU_PG_VDD_MASK | \
+							 MLXREG_DPU_PG_VDDIO_MASK)
+
+/* Health event masks. */
+#define MLXREG_DPU_HLTH_THERMAL_TRIP_MASK		BIT(0)
+#define MLXREG_DPU_HLTH_UFM_UPGRADE_DONE_MASK		BIT(1)
+#define MLXREG_DPU_HLTH_VDDQ_HOT_ALERT_MASK		BIT(2)
+#define MLXREG_DPU_HLTH_VDD_CPU_HOT_ALERT_MASK		BIT(3)
+#define MLXREG_DPU_HLTH_VDDQ_ALERT_MASK			BIT(4)
+#define MLXREG_DPU_HLTH_VDD_CPU_ALERT_MASK		BIT(5)
+#define MLXREG_DPU_HEALTH_MASK				(MLXREG_DPU_HLTH_UFM_UPGRADE_DONE_MASK | \
+							 MLXREG_DPU_HLTH_VDDQ_HOT_ALERT_MASK | \
+							 MLXREG_DPU_HLTH_VDD_CPU_HOT_ALERT_MASK | \
+							 MLXREG_DPU_HLTH_VDDQ_ALERT_MASK | \
+							 MLXREG_DPU_HLTH_VDD_CPU_ALERT_MASK | \
+							 MLXREG_DPU_HLTH_THERMAL_TRIP_MASK)
+
+/* Hotplug aggregation masks. */
+#define MLXREG_DPU_HEALTH_AGGR_MASK			BIT(0)
+#define MLXREG_DPU_PG_AGGR_MASK				BIT(1)
+#define MLXREG_DPU_AGGR_MASK				(MLXREG_DPU_HEALTH_AGGR_MASK | \
+							 MLXREG_DPU_PG_AGGR_MASK)
+
+/* Voltage regulator firmware update status mask. */
+#define MLXREG_DPU_VOLTREG_UPD_MASK			GENMASK(5, 4)
+
+#define MLXREG_DPU_NR_NONE				(-1)
+
+/*
+ * enum mlxreg_dpu_type - Data Processor Unit types
+ *
+ * @MLXREG_DPU_BF3: DPU equipped with BF3 SoC;
+ */
+enum mlxreg_dpu_type {
+	MLXREG_DPU_BF3 = 0x0050,
+};
+
+/* Default register access data. */
+static struct mlxreg_core_data mlxreg_dpu_io_data[] = {
+	{
+		.label = "fpga1_version",
+		.reg = MLXREG_DPU_REG_FPGA1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "fpga1_pn",
+		.reg = MLXREG_DPU_REG_FPGA1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "fpga1_version_min",
+		.reg = MLXREG_DPU_REG_FPGA1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "perst_rst",
+		.reg = MLXREG_DPU_REG_RESET_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "usbphy_rst",
+		.reg = MLXREG_DPU_REG_RESET_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "phy_rst",
+		.reg = MLXREG_DPU_REG_RESET_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0644,
+	},
+	{
+		.label = "tpm_rst",
+		.reg = MLXREG_DPU_REG_RESET_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "reset_from_main_board",
+		.reg = MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_reload",
+		.reg = MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_pwr_fail",
+		.reg = MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_dpu_thermal",
+		.reg = MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_pwr_off",
+		.reg = MLXREG_DPU_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "dpu_id",
+		.reg = MLXREG_DPU_REG_GP0_RO_OFFSET,
+		.mask = GENMASK(3, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "voltreg_update_status",
+		.reg = MLXREG_DPU_REG_GP0_RO_OFFSET,
+		.mask = MLXREG_DPU_VOLTREG_UPD_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "boot_progress",
+		.reg = MLXREG_DPU_REG_GP0_OFFSET,
+		.mask = GENMASK(3, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "ufm_upgrade",
+		.reg = MLXREG_DPU_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxreg_dpu_default_regs_io_data = {
+		.data = mlxreg_dpu_io_data,
+		.counter = ARRAY_SIZE(mlxreg_dpu_io_data),
+};
+
+/* Default hotplug data. */
+static struct mlxreg_core_data mlxreg_dpu_power_events_items_data[] = {
+	{
+		.label = "pg_vddio",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_VDDIO_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "pg_vdd_cpu",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_VDD_CPU_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "pg_vdd",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_VDD_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "pg_1v8",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_1V8_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "pg_comparator",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_COMPARATOR_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "pg_vddq",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_VDDQ_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "pg_hvdd",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_HVDD_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "pg_dvdd",
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_DVDD_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_data mlxreg_dpu_health_events_items_data[] = {
+	{
+		.label = "thermal_trip",
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HLTH_THERMAL_TRIP_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "ufm_upgrade_done",
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HLTH_UFM_UPGRADE_DONE_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "vddq_hot_alert",
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HLTH_VDDQ_HOT_ALERT_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "vdd_cpu_hot_alert",
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HLTH_VDD_CPU_HOT_ALERT_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "vddq_alert",
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HLTH_VDDQ_ALERT_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+	{
+		.label = "vdd_cpu_alert",
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HLTH_VDD_CPU_ALERT_MASK,
+		.hpdev.nr = MLXREG_DPU_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_item mlxreg_dpu_hotplug_items[] = {
+	{
+		.data = mlxreg_dpu_power_events_items_data,
+		.aggr_mask = MLXREG_DPU_PG_AGGR_MASK,
+		.reg = MLXREG_DPU_REG_PG_OFFSET,
+		.mask = MLXREG_DPU_PG_MASK,
+		.count = ARRAY_SIZE(mlxreg_dpu_power_events_items_data),
+		.health = false,
+		.inversed = 1,
+	},
+	{
+		.data = mlxreg_dpu_health_events_items_data,
+		.aggr_mask = MLXREG_DPU_HEALTH_AGGR_MASK,
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HEALTH_MASK,
+		.count = ARRAY_SIZE(mlxreg_dpu_health_events_items_data),
+		.health = false,
+		.inversed = 1,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxreg_dpu_default_hotplug_data = {
+	.items = mlxreg_dpu_hotplug_items,
+	.counter = ARRAY_SIZE(mlxreg_dpu_hotplug_items),
+	.cell = MLXREG_DPU_REG_AGGRCO_OFFSET,
+	.mask = MLXREG_DPU_AGGR_MASK,
+};
+
+/* mlxreg_dpu - device private data
+ * @dev: platform device;
+ * @data: pltaform core data;
+ * @io_data: register access platform data;
+ * @io_regs: register access device;
+ * @hotplug_data: hotplug platform data;
+ * @hotplug: hotplug device;
+ */
+struct mlxreg_dpu {
+	struct device *dev;
+	struct mlxreg_core_data *data;
+	struct mlxreg_core_platform_data *io_data;
+	struct platform_device *io_regs;
+	struct mlxreg_core_hotplug_platform_data *hotplug_data;
+	struct platform_device *hotplug;
+};
+
+static bool mlxreg_dpu_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXREG_DPU_REG_PG_EVENT_OFFSET:
+	case MLXREG_DPU_REG_PG_MASK_OFFSET:
+	case MLXREG_DPU_REG_RESET_GP1_OFFSET:
+	case MLXREG_DPU_REG_GP0_OFFSET:
+	case MLXREG_DPU_REG_GP1_OFFSET:
+	case MLXREG_DPU_REG_GP4_OFFSET:
+	case MLXREG_DPU_REG_AGGRCO_OFFSET:
+	case MLXREG_DPU_REG_AGGRCO_MASK_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_EVENT_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_MASK_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static bool mlxreg_dpu_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXREG_DPU_REG_FPGA1_VER_OFFSET:
+	case MLXREG_DPU_REG_FPGA1_PN_OFFSET:
+	case MLXREG_DPU_REG_FPGA1_PN1_OFFSET:
+	case MLXREG_DPU_REG_PG_OFFSET:
+	case MLXREG_DPU_REG_PG_EVENT_OFFSET:
+	case MLXREG_DPU_REG_PG_MASK_OFFSET:
+	case MLXREG_DPU_REG_RESET_GP1_OFFSET:
+	case MLXREG_DPU_REG_RST_CAUSE1_OFFSET:
+	case MLXREG_DPU_REG_GP0_RO_OFFSET:
+	case MLXREG_DPU_REG_GP0_OFFSET:
+	case MLXREG_DPU_REG_GP1_OFFSET:
+	case MLXREG_DPU_REG_GP4_OFFSET:
+	case MLXREG_DPU_REG_AGGRCO_OFFSET:
+	case MLXREG_DPU_REG_AGGRCO_MASK_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_EVENT_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_MASK_OFFSET:
+	case MLXREG_DPU_REG_FPGA1_MVER_OFFSET:
+	case MLXREG_DPU_REG_CONFIG3_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static bool mlxreg_dpu_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXREG_DPU_REG_FPGA1_VER_OFFSET:
+	case MLXREG_DPU_REG_FPGA1_PN_OFFSET:
+	case MLXREG_DPU_REG_FPGA1_PN1_OFFSET:
+	case MLXREG_DPU_REG_PG_OFFSET:
+	case MLXREG_DPU_REG_PG_EVENT_OFFSET:
+	case MLXREG_DPU_REG_PG_MASK_OFFSET:
+	case MLXREG_DPU_REG_RESET_GP1_OFFSET:
+	case MLXREG_DPU_REG_RST_CAUSE1_OFFSET:
+	case MLXREG_DPU_REG_GP0_RO_OFFSET:
+	case MLXREG_DPU_REG_GP0_OFFSET:
+	case MLXREG_DPU_REG_GP1_OFFSET:
+	case MLXREG_DPU_REG_GP4_OFFSET:
+	case MLXREG_DPU_REG_AGGRCO_OFFSET:
+	case MLXREG_DPU_REG_AGGRCO_MASK_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_EVENT_OFFSET:
+	case MLXREG_DPU_REG_HEALTH_MASK_OFFSET:
+	case MLXREG_DPU_REG_FPGA1_MVER_OFFSET:
+	case MLXREG_DPU_REG_CONFIG3_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+/* Configuration for the register map of a device with 2 bytes address space. */
+static const struct regmap_config mlxreg_dpu_regmap_conf = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = MLXREG_DPU_REG_MAX,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = mlxreg_dpu_writeable_reg,
+	.readable_reg = mlxreg_dpu_readable_reg,
+	.volatile_reg = mlxreg_dpu_volatile_reg,
+};
+
+static int mlxreg_dpu_copy_hotplug_data(struct device *dev, struct mlxreg_dpu *mlxreg_dpu,
+					struct mlxreg_core_hotplug_platform_data *hotplug_data)
+{
+	struct mlxreg_core_item *item;
+	int i;
+
+	mlxreg_dpu->hotplug_data = devm_kmemdup(dev, hotplug_data,
+						sizeof(*mlxreg_dpu->hotplug_data), GFP_KERNEL);
+	if (!mlxreg_dpu->hotplug_data)
+		return -ENOMEM;
+
+	mlxreg_dpu->hotplug_data->items = devm_kmemdup(dev, hotplug_data->items,
+						       mlxreg_dpu->hotplug_data->counter *
+						       sizeof(*hotplug_data->items),
+						       GFP_KERNEL);
+	if (!mlxreg_dpu->hotplug_data->items)
+		return -ENOMEM;
+
+	item = mlxreg_dpu->hotplug_data->items;
+	for (i = 0; i < mlxreg_dpu->hotplug_data->counter; i++, item++) {
+		item = devm_kmemdup(dev, &hotplug_data->items[i], sizeof(*item), GFP_KERNEL);
+		if (!item)
+			return -ENOMEM;
+		item->data = devm_kmemdup(dev, hotplug_data->items[i].data,
+					  hotplug_data->items[i].count * sizeof(item->data),
+					  GFP_KERNEL);
+		if (!item->data)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int mlxreg_dpu_config_init(struct mlxreg_dpu *mlxreg_dpu, void *regmap,
+				  struct mlxreg_core_data *data, int irq)
+{
+	struct device *dev = &data->hpdev.client->dev;
+	u32 regval;
+	int err;
+
+	/* Validate DPU type. */
+	err = regmap_read(regmap, MLXREG_DPU_REG_CONFIG3_OFFSET, &regval);
+	if (err)
+		return err;
+	switch (regval) {
+	case MLXREG_DPU_BF3:
+		/* Copy platform specific hotplug data. */
+		err = mlxreg_dpu_copy_hotplug_data(dev, mlxreg_dpu,
+						   &mlxreg_dpu_default_hotplug_data);
+		if (err)
+			return err;
+
+		mlxreg_dpu->io_data = &mlxreg_dpu_default_regs_io_data;
+
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	/* Register IO access driver. */
+	if (mlxreg_dpu->io_data) {
+		mlxreg_dpu->io_data->regmap = regmap;
+		mlxreg_dpu->io_regs =
+		platform_device_register_resndata(dev, "mlxreg-io", data->slot, NULL, 0,
+						  mlxreg_dpu->io_data,
+						  sizeof(*mlxreg_dpu->io_data));
+		if (IS_ERR(mlxreg_dpu->io_regs)) {
+			dev_err(dev, "Failed to create regio for client %s at bus %d at addr 0x%02x\n",
+				data->hpdev.brdinfo->type, data->hpdev.nr,
+				data->hpdev.brdinfo->addr);
+			err = PTR_ERR(mlxreg_dpu->io_regs);
+			goto fail_register_io;
+		}
+	}
+
+	/* Register hotplug driver. */
+	if (mlxreg_dpu->hotplug_data && irq) {
+		mlxreg_dpu->hotplug_data->regmap = regmap;
+		mlxreg_dpu->hotplug_data->irq = irq;
+		mlxreg_dpu->hotplug =
+		platform_device_register_resndata(dev, "mlxreg-hotplug", data->slot, NULL, 0,
+						  mlxreg_dpu->hotplug_data,
+						  sizeof(*mlxreg_dpu->hotplug_data));
+		if (IS_ERR(mlxreg_dpu->hotplug)) {
+			err = PTR_ERR(mlxreg_dpu->hotplug);
+			goto fail_register_hotplug;
+		}
+	}
+
+	return 0;
+
+fail_register_hotplug:
+	platform_device_unregister(mlxreg_dpu->io_regs);
+fail_register_io:
+
+	return err;
+}
+
+static void mlxreg_dpu_config_exit(struct mlxreg_dpu *mlxreg_dpu)
+{
+	/* Unregister hotplug driver. */
+	platform_device_unregister(mlxreg_dpu->hotplug);
+	/* Unregister IO access driver. */
+	platform_device_unregister(mlxreg_dpu->io_regs);
+}
+
+static int mlxreg_dpu_probe(struct platform_device *pdev)
+{
+	struct mlxreg_core_data *data;
+	struct mlxreg_dpu *mlxreg_dpu;
+	void *regmap;
+	int err;
+
+	data = dev_get_platdata(&pdev->dev);
+	if (!data || !data->hpdev.brdinfo)
+		return -EINVAL;
+
+	mlxreg_dpu = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_dpu), GFP_KERNEL);
+	if (!mlxreg_dpu)
+		return -ENOMEM;
+
+	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
+	if (!data->hpdev.adapter)
+		return -EPROBE_DEFER;
+
+	/* Create device at the top of DPU I2C tree.*/
+	data->hpdev.client = i2c_new_client_device(data->hpdev.adapter,
+						   data->hpdev.brdinfo);
+	if (IS_ERR(data->hpdev.client)) {
+		dev_err(&pdev->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
+			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
+		err = PTR_ERR(data->hpdev.client);
+		goto i2c_new_device_fail;
+	}
+
+	regmap = devm_regmap_init_i2c(data->hpdev.client,
+				      &mlxreg_dpu_regmap_conf);
+	if (IS_ERR(regmap)) {
+		dev_err(&pdev->dev, "Failed to create regmap for client %s at bus %d at addr 0x%02x\n",
+			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
+		err = PTR_ERR(regmap);
+		goto devm_regmap_init_i2c_fail;
+	}
+
+	/* Sync registers with hardware. */
+	regcache_mark_dirty(regmap);
+	err = regcache_sync(regmap);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
+			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
+		err = PTR_ERR(regmap);
+		goto regcache_sync_fail;
+	}
+
+	mlxreg_dpu->data = data;
+	mlxreg_dpu->dev = &pdev->dev;
+	platform_set_drvdata(pdev, mlxreg_dpu);
+
+	/* Configure DPU. */
+	err = mlxreg_dpu_config_init(mlxreg_dpu, regmap, data, data->hpdev.brdinfo->irq);
+	if (err)
+		goto mlxreg_dpu_config_init_fail;
+
+	return err;
+
+mlxreg_dpu_config_init_fail:
+regcache_sync_fail:
+devm_regmap_init_i2c_fail:
+	if (data->hpdev.client) {
+		i2c_unregister_device(data->hpdev.client);
+		data->hpdev.client = NULL;
+	}
+i2c_new_device_fail:
+	i2c_put_adapter(data->hpdev.adapter);
+	data->hpdev.adapter = NULL;
+	return err;
+}
+
+static void mlxreg_dpu_remove(struct platform_device *pdev)
+{
+	struct mlxreg_core_data *data = dev_get_platdata(&pdev->dev);
+	struct mlxreg_dpu *mlxreg_dpu = platform_get_drvdata(pdev);
+
+	mlxreg_dpu_config_exit(mlxreg_dpu);
+	if (data->hpdev.client) {
+		i2c_unregister_device(data->hpdev.client);
+		data->hpdev.client = NULL;
+		i2c_put_adapter(data->hpdev.adapter);
+		data->hpdev.adapter = NULL;
+	}
+}
+
+static struct platform_driver mlxreg_dpu_driver = {
+	.probe = mlxreg_dpu_probe,
+	.remove = mlxreg_dpu_remove,
+	.driver = {
+		.name = "mlxreg-dpu",
+	},
+};
+
+module_platform_driver(mlxreg_dpu_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
+MODULE_DESCRIPTION("Nvidia Data Processor Unit platform driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:mlxreg-dpu");
-- 
2.44.0

