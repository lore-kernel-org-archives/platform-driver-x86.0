Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094173451
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014512; cv=fail; b=nAtCS176DDpJDmu1fEed5pmQbWstvn04arpGM+isj+MGoaifuKJmQbJjkMzVEa/vYHURaxKNlCV5wsgNqM3CzP652FpVj0GxvqM/NEJTaOyRwm7w6iTzuHHr+YjmekB0pc8BAbok0IhbipdtJwGLCqfnn8FtAOQDNR9QE9hXnng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014512; c=relaxed/simple;
	bh=e/PgfWMxxB8/TLl6iRw7D9mgukY1ywszz/u/NKnJZbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2qeb7klykPhvL450TeJcrbzgxGW3OTYWdgmHn5wphwYwIum4IlchM6YR73612qd4aHdXWRiIciplCZkdBzHTQg6q/hIXW/VaIrvEEMp1assBBYQFEx4/Dn4gCBhTJApQd1fhCCzp3BXNZVR40tntxihBLr1YiOjeZ5eYeFm0TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iFwDW1Zb; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iFwDW1Zb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh80DpB42g2TaWkPNAdebx4Xpi9IvZAgNDM1DK1MlrY7Gg+wy/n2OlfKI3DiicgO8s0dC8Klu3sfvy9E2Uoln9cPNjDyoJeuh1lDcydAO8T8jKR54Kk8ZmoKn2NBDS8HDuJXdeRWK3HJB7zp831w+jP26S/LeNXNBaOV1nvj44HHCbSDF121Nc6Yr/fXzVo2UuYfz/ccbjnybJWBAXU6qc9egcaSPRLKIu3YfF4lTAmyHVn1rhorPNJzwLBKR8S9e12E6JjcqlGoEGcVnn7fvWDjF0E1Uhn05IPF3XONnnjJ21yOH3yXeUdX1cqEjt+KHabdWapNUb228BcVDv1taw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xM8bwCqtpLKh6NMT2BOvqiaIwVTCNejpIfkqY22mVk=;
 b=MxjgcfvBPBbK6fX5an1VIF1OvGvivQk8+t4FmYJMcSJLLDRSxz0VlW4JIL82KlM28O2Tk/awLby4FCiE0e8TTgWwsBXzoRDtSyAuE5gu/LA1dlNDs52gxLDr2taCxafn64AsuPySY4QGgaCwmXDTXEKArcCBpg4MAsdY2qAvDVvscil6ULl9/TOikRo353W6KdenYqzbKneyVbmPf498HjIddzF9uObbTiqENt/yQbW2MXU23lys/vxI+p/pOT73iDN8oUXglGoCjFNE0Qujys20uygue3nUKEZ/AhorIMMsQe10qA8VKY5O5z9ZcVg+s1RAvNbEUmfHgbuniaJ1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xM8bwCqtpLKh6NMT2BOvqiaIwVTCNejpIfkqY22mVk=;
 b=iFwDW1ZbjRJ32Be3D4DDMvTwSmZNqXg6odSzYvl6krEtJrIU359OYP7VcxYUNllporQeqyEzoP6BXQsHOJ19jrTERR+xHbVqPWQlPOdJdAxMSJpo5HSrOuK8pDQdKKU/9FRe6H9oK6co7KmYmlzJ0YDvC/s0bwL9pijJzNQ2TErn2YzcvYUhWEgHyFhNAsc6OdkI0xYj+1PfII4FkV5Nkb+qc0YkAV34af/uWBmua67YaP1Cqxe5d8yD84H1P4OAaUQNYwgCMZ6pJe+tel2b4FTFdgeq5RZ9fFjXt3zQ5djJZJq2p1BCCroGJIU5spmVccp7DeSHj2eq6xO7pJI6FQ==
Received: from CH0PR13CA0051.namprd13.prod.outlook.com (2603:10b6:610:b2::26)
 by CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:01:43 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:b2:cafe::32) by CH0PR13CA0051.outlook.office365.com
 (2603:10b6:610:b2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 08:01:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 08:01:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 00:01:30 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 16 Jan 2025 00:01:28 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 06/10] platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
Date: Thu, 16 Jan 2025 09:59:12 +0200
Message-ID: <20250116075919.34270-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c8c5f4-228b-4125-522b-08dd36040429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3NhUVhRMC8veEdFMTVJWTdKVVhvc2JWVDVOVDZZTnNTejNwbGl6RnZTMVM2?=
 =?utf-8?B?TVdYalAyQmRmT282TENUY3ZEWHZ4bXIxNWR4YkhSZnFZcWp2U2VZYkJzOCts?=
 =?utf-8?B?TVVTZFEzNFZjM0p0WEFkazkxeEFFVFUrSWRJYWdVRTFjeHduMU5HWGlRYURJ?=
 =?utf-8?B?NER2R0ZGdXMxTWZFQ3d5QkExaVVzcnJDaEJ3Y1dwbE5ENkp1c0RhZ2RubU5U?=
 =?utf-8?B?ZFNSSTNHTGhpa2d1MzBpZkUxRFVXYmNWVm9kNkZRTjNGMml2SWtKbVUwb3hw?=
 =?utf-8?B?TGdWZzE0YW9KZ21CR29YcWRkbGxNNHFoZlBhbEYveWI5em5OM01DWlpWcWEw?=
 =?utf-8?B?bTgyT21Zb1AwNHp4dW14S2NjRkFqVSs0d0pnbGVSTjJWbHpKNmdKQTQyL01M?=
 =?utf-8?B?aHdTVS9GNFczWWkvU1ZkQ2NuT3pSelFQR3NjSHBadUdYanQ2dTByRUw5dUgz?=
 =?utf-8?B?RUdEN0RVOGVibG8xcTZiSEFNK2hiUHlqNitQY21idXJ1ZEF0VC9JdHMrTUsy?=
 =?utf-8?B?bUtaSFNWSDN0NW1EYmV4S2NuU215c1pLcUFYNzhvZU1qQk5DSnJDV0ZOUmZN?=
 =?utf-8?B?YWYxMW1kODRKK2xPSURrTG02bmtVbUpXeWRXQU9vbHlwU1JqVE5DRHdmYVo0?=
 =?utf-8?B?WTNjajYyTnZBSkswNStucVhYTFJ3aTJnVXlmZHNObkFjK1R6YkN1UmNQS2Vl?=
 =?utf-8?B?MDh3b2laaEV5ZkpHb2lLRU8yc3JhS1VKUCs3WTlNdWJDeGExOWRZNHZWK1o0?=
 =?utf-8?B?Q3NpWE9MTXc0aG5hMGRBMVFGSnZ0L2pUREthY0VmamFueFNnbmtBbkwwLzNX?=
 =?utf-8?B?YXhIMVJTVmc4aXd6bGYrSFVVWVNUbjVuZWZnV2xLcXJaK2QvbVZHQnVWT2NG?=
 =?utf-8?B?VW5KUHBXc0dHOVhGVWlxeEhsQnAvTjUrTUM2UVZpbktuRmNFdjNxdHY4OGVE?=
 =?utf-8?B?OHZHcUswcklxTU5walYwNlNtaVJOaXZ1bzlqYW5JRWo5dlpBWlpSSXZ0V1Mx?=
 =?utf-8?B?d2VESGpPMjlUK3ZLWVFDaHZ0cXorZFdpOC9hNHkxamQ1RXFRbzRyOGIwKzYx?=
 =?utf-8?B?SkFBN1FvS3doRERweEYzbFpDN2hpc3dyL0xlV0kwZys5VjUxaWIwakE4akJ4?=
 =?utf-8?B?L1hFYW5ZZWNzbkF3bXNPb2JQZXdxVmw2VFdQQmU2NXNER1RBL29hRmlrbnha?=
 =?utf-8?B?UEFDM1FTQVgvaDNWVnViNmlkUGxZSm5LWmZiOUkzTWw2VkZSUms1S3l5OWxW?=
 =?utf-8?B?MVp2aVFmSm8waWFKVVhFOVFQbnBBWVorM2NiYzRBSWdaZE82WlhnYjJDSHcw?=
 =?utf-8?B?Z1NvWG5HM2s1ZmpsWHlTZXFOekt3STRLZGRUNGd6NnBKNjdJSGVOR1VWc1Ns?=
 =?utf-8?B?NTZVUE1JcUl6bmFZbUtvTEVQUXp4UWJ5SVFKR0NzVmxpSkNtS09uSEpIN3pr?=
 =?utf-8?B?bXFVSzBNaGEyZ2RmemI0SjdSL1RIcXZqSkZWb3JuSHFoVWIwaGJzOEpzTmdX?=
 =?utf-8?B?MlM1QUQ0MHVrc2plalFZTTh4WHpYT1MwSXVYc3JDOGRRTkUyVkpjV25vY0lv?=
 =?utf-8?B?QUk2NkFCQ1pvTXVhNTliQktVVkV0ZTJBMUNZMHo3MzhYNzJYUEhBMjV3ZkhI?=
 =?utf-8?B?ejdkZVVCQkFLVXZTeHJYd2ZERS9wK3YyMEdycW1UaWxiOGZJajZlT2tUbk1C?=
 =?utf-8?B?aW1OdXdLWDQ4TXVLMzUrcVdySHVaWTZ2TFRNQVRUNnRIS2hqeXdjZWdVMHd6?=
 =?utf-8?B?dTRKdEhHSURYcE8xdGxLSlRpeFVJQ3lBYXYrMjV5Q21VR2s4QzBKbDNRMHBG?=
 =?utf-8?B?WjYwZFUwd2ZXaWtqZHc2KzROd1IrRDZYWXNFS0M4VGlwRCtFYWNGN0xIRmdr?=
 =?utf-8?B?ZW12VndMRHhoVXdZYU12aTlFMWU0ZncxdlVGSFJVWjF6SGRwenR6QU9rc0tl?=
 =?utf-8?B?cWlNMWFYSHVXbGdFZFJYNGYzbkZSSUhUN0R0NmcxU1RFUmFob0d3eGdKMlg4?=
 =?utf-8?Q?5+5Xih4ZORCCBcnF++yhHSOmdr69lw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:01:43.2501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c8c5f4-228b-4125-522b-08dd36040429
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763

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
Comments pointed out by Ilpo:
- Fix s/pltaform/platform.
- Remove semicolon from structure description.
- In routine mlxreg_dpu_copy_hotplug_data() use 'const struct' for the
  third argument.
- In mlxreg_dpu_copy_hotplug_data() remove redunadant devm_kmemdup()
  call.
- Fix identifications in mlxreg_dpu_config_init().
- Remove label 'fail_register_io" from error flow.
- One line for devm_regmap_init_i2c() call in mlxreg_dpu_probe().
---
 drivers/platform/mellanox/Kconfig      |  12 +
 drivers/platform/mellanox/Makefile     |   1 +
 drivers/platform/mellanox/mlxreg-dpu.c | 615 +++++++++++++++++++++++++
 3 files changed, 628 insertions(+)
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
index 000000000000..0d4cede4eebe
--- /dev/null
+++ b/drivers/platform/mellanox/mlxreg-dpu.c
@@ -0,0 +1,615 @@
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
+ * @dev: platform device
+ * @data: platform core data
+ * @io_data: register access platform data
+ * @io_regs: register access device
+ * @hotplug_data: hotplug platform data
+ * @hotplug: hotplug device
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
+static int
+mlxreg_dpu_copy_hotplug_data(struct device *dev, struct mlxreg_dpu *mlxreg_dpu,
+			     const struct mlxreg_core_hotplug_platform_data *hotplug_data)
+{
+	struct mlxreg_core_item *item;
+	int i;
+
+	mlxreg_dpu->hotplug_data = devm_kmemdup(dev, hotplug_data,
+						sizeof(*mlxreg_dpu->hotplug_data), GFP_KERNEL);
+	if (!mlxreg_dpu->hotplug_data)
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
+			platform_device_register_resndata(dev, "mlxreg-io",
+							  data->slot, NULL, 0,
+							  mlxreg_dpu->io_data,
+							  sizeof(*mlxreg_dpu->io_data));
+		if (IS_ERR(mlxreg_dpu->io_regs)) {
+			dev_err(dev, "Failed to create regio for client %s at bus %d at addr 0x%02x\n",
+				data->hpdev.brdinfo->type, data->hpdev.nr,
+				data->hpdev.brdinfo->addr);
+			return PTR_ERR(mlxreg_dpu->io_regs);
+		}
+	}
+
+	/* Register hotplug driver. */
+	if (mlxreg_dpu->hotplug_data && irq) {
+		mlxreg_dpu->hotplug_data->regmap = regmap;
+		mlxreg_dpu->hotplug_data->irq = irq;
+		mlxreg_dpu->hotplug =
+			platform_device_register_resndata(dev, "mlxreg-hotplug",
+							  data->slot, NULL, 0,
+							  mlxreg_dpu->hotplug_data,
+							  sizeof(*mlxreg_dpu->hotplug_data));
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
+	regmap = devm_regmap_init_i2c(data->hpdev.client, &mlxreg_dpu_regmap_conf);
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

