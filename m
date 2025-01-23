Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8730189F20
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659457; cv=fail; b=FAYsqDm4/yR1vBpReve+gunBGt+1eTyCYMJllk5NxV1y3Sc5TpzjAyr/kWSDpkC3pU3Fvny7vcl5pSksngHAnnzwGCc2Wzxsn+yjyaduNg1Fq9i9mNNDfFB+hcnsPIHQL/UFwf/2V8ebXrFv5VgTAa/Ag3lSOnzin79kSSUOW1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659457; c=relaxed/simple;
	bh=KBDrPrIPmqfeqF/zwWFS4h4eUYc6ITAhfw4cTd53GyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QK/vqaRm5da1Z428E8Wq+vQDZujel6Gblnfw+mId/8gfNcZJKbgDVNOjXQPMWvZdx9RMFaJFBBIY4Yp/3S9EEzxN0nMNIfYa2jo5RCdifzzehLmyrtCBwWddu3GsPIx6K0isQN7lVxmoAMvVy/3tOMlzMRsX2cOTbwN8ECD5V8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EWWoTQq4; arc=fail smtp.client-ip=40.107.212.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EWWoTQq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gq7WfHB7scvsemymumuDXP1SE7uszOD+oF0jQzIGHYXhJMm04OuWVHLpSEuRSB2Fl1XaUh8yF52/BqxUhZ9DYHMfGBL/35UFu+zWXLWR8SSAOm+wJvhxUnf954ly3WlCeyYamezWPKGEK0XVYrJ3XTDOiNKdoysTvaWs4nWezxWuNTs41SKE6LBncBGxnkMzxLqJdipSCQyS5I4wEgzrv+SA7zkH2Y9DevvkRU0NDumQJ/SEXh1v9tOssUDbm4FMqmp1xCmWf2I0eQGWCFvqyAkEqKl3MGCDVSWXgLQ2ESjov/UDNxlzT5fzQ8CRk8Z6HwGBu5xG2HfYDsS3zI2RqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7JGvlGFkdOLnD7cQ+q8/z92/jjzslW0IwHSrQsEp94=;
 b=sqpD/HsnmNK6BNrIfZ0td+cehii73R0OSwErrpmh2zDXA8lfQ8dQwnYc0yXSmDhFi/mK7TBNEkMHrBYcQSeFLNjaxp6EvZGgRFRFqDRCfMaCiJrPOgL0UgSFb+xB3dt6aosKCn7XWtofapUhd4GBAv4hZr+rzZzTaaSnFCZn8pSEkQHlOwRAe3gImqvmpH/4ZhvG2htLsgpqWujKL7p66ErDmCnTOkv9L2NV1GluPKwSlYPtBsu7J/Ua3rZ5ZVG4jW5azAoDRNCaJIu01VTkHD0BCh5rk3uoXfVgBKe3O9ks7iDNxdTmGsk69EZxsb8ML09itvNaxkSuyraSQ5M/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7JGvlGFkdOLnD7cQ+q8/z92/jjzslW0IwHSrQsEp94=;
 b=EWWoTQq4l7bJzz/4Gq9B46PUl04gZPQ4RGndaT5nfvrpUBElvJ3cZYTHfzl3Y3eVMETgEQCvJgjXEGc2K+y8mk0qT65gAjUwkH9iq/YHvfma48m4qWexvzwEjU8ALcbmTrb4ONFB0YEnm3WlCPoj6+7M4MWPoepJxHD1WLT1avTKlRNRDnrCYib2SgZQxYQvkU3tFZs/8GIURnhkNQ+GVklf3XRZYqPZ5zIjEgyGT8q1LACkzywcIgZcZ0B5n1q6nUSjt5iKHPmm00L7COKlRK8m0p9qpdNpJIE9xKa0VdfKS7j7GngwU+xFNOZa1RJG2FzbVZ1CXvS9jJxnb8elaQ==
Received: from CH0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:610:e7::14)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 19:10:46 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::76) by CH0PR03CA0219.outlook.office365.com
 (2603:10b6:610:e7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 23 Jan 2025 19:10:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 19:10:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:10:26 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:10:23 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 07/12] platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
Date: Thu, 23 Jan 2025 21:08:11 +0200
Message-ID: <20250123190818.3834-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250123190818.3834-1-vadimp@nvidia.com>
References: <20250123190818.3834-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7960948b-6f58-4b29-ef04-08dd3be1a3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXRJaHlXeThoOFBPekZPWlhSOXE3Rmp1TW1HVnhKOHBFU0tGVmJzSm5Oc0Rt?=
 =?utf-8?B?Qzl5QzR3bit6elo4WFBRTDdmWnk0SXhaQU5Gemw5emQ1dTI1SnVkNHR5V2k4?=
 =?utf-8?B?cWorUXhLaEZzMFd6N1d6ZmFuMWhRN3lyd2VqbHFMY3pGdzBsQzBlYW5LcXVF?=
 =?utf-8?B?QjlZUkVmZ29Wbkx4bFVVRDhMcTBRZndQNTE2VXlIVzhsWWYwU1doNEc4RXZE?=
 =?utf-8?B?NWJMcXA3WVo5QmdVM3o3UTJjNjVEUDdZNkc4YjdMb0ZjbzdjanUvb045b2pn?=
 =?utf-8?B?RFh4Y3ExOTNuK2pvRXc1Ky9LM2Q0cWJMTWlIdks0RWNDT1B6ZmphUE9WNGFB?=
 =?utf-8?B?MmI4VWpnYXZmYW1YSXdJa1BYcHVFL0hhY3kvL0ZnRTV5bUZGMUNLYVJPTUFt?=
 =?utf-8?B?QWZYbjR2WWRCMVZpK1Ara1NhcXRMVFIzdTA2U0ZVY2FCRGhRSEh0QjB2ZnZL?=
 =?utf-8?B?N0VKbjNlejExNE1QUWs5anNlVFkzYWhDSkMrY3B6MFRpZUhaRWZ4ajZ6dEdX?=
 =?utf-8?B?SkdlVjlkYlZvcitnZUVvZUhqSWxQclRBK0d1cVUyQnI2Nng3NVM5YmpzR3hx?=
 =?utf-8?B?dG0wY3pCMU9NTFQ0cmVvUFJRd3VLSFN6cEd2eUM4NVZHRzBlR2RRZWNCZEtK?=
 =?utf-8?B?OXJwNCsway81MjFwUUtkUjc4MnZROVpFakJDMUNZZDRXUENKNFhvL1JXVFNk?=
 =?utf-8?B?UUMrVklubC9DdkRkRkNkVlVMQTFOS05nYU4rdUxGUWJHTkxsVTB1SVloVXdS?=
 =?utf-8?B?bHNBc2hVT3JwTEs1QUdpL3RmZGhsZEhjQm1vWW9zNE14TzJoaDRReHQ5bmFw?=
 =?utf-8?B?RDd4S3R0NGVYOXA2OFNuNks3S2FDVER3a3B0OEFhdUJLdE5MYVhIZDRSL2pG?=
 =?utf-8?B?eUpUaXp1ZFhFZlh3QWRqa0ZUTEkvU0JGWjVkSUp2cHd6a1JubjhsR3FPYUxo?=
 =?utf-8?B?M0FWUjV2TktIaXYrRkFjTE1RV2p5cHdoc015dUFDL1RCd2E5cW9hSGlYbHRN?=
 =?utf-8?B?TmxlbHY1TlFHcmNxU2txQUZOenh4VnJiaEgzMjQ3U00yOWpuNmZrWlRaTWFz?=
 =?utf-8?B?a3BCQlAzdHdTand4ZEdPR08zT0ltTjFJWkZnUTdwd0VjTDhkYzNCV29xMita?=
 =?utf-8?B?b1BrUEdsQVVzZHV0Q3RxS0VFbVdHa3JJYldxa2RBbDdVVmJFVDhRaUxneXhY?=
 =?utf-8?B?MWVZRDFHUjdhSG81cjZBdXFoK2pyTVdqb0Y4ZGZOVTNvN1k0RndhbTduTTlu?=
 =?utf-8?B?NUVUOFl1b3lwQ0FWcHdHTVlXTkkyMjR5d3VDVElVN09WTmpLRElzN1pFM0M4?=
 =?utf-8?B?K294SjVtMHhJaVVPVjRuNEwwWHF6Wm5xcjRvU1RYYW1RSExWUFozcTJHSlNz?=
 =?utf-8?B?QmZUQTBzVnJnZGxtN0twT2E0S2lLSXhkYlA5dmtob2RsMTJuZk1HeXU1NG02?=
 =?utf-8?B?c2xlOVRtbTIxZ2dWM2J5R3lMMyszYWhiZ1VYTy9PWXVFTHNVc0RjVTFqcDZt?=
 =?utf-8?B?RnRVVWxkMW8vaXJTMTJlcEpaaXdra2dOcmtIcVRPb0t0TElQaUZ0dnJaUWdi?=
 =?utf-8?B?Uys5WnNKamRFK2JXeTF3c3dXemRPMWo0SWhxVG9QYXdyUkdGS2xYQ3o0OVVr?=
 =?utf-8?B?QXduYzVaMUM2M0FqbFREU0h0L1pienE5MXEzSUVWN09YT3Z5ZXVkN296YXNS?=
 =?utf-8?B?dGwvc2lwc1AwSzBiOTlwT1Z6MjRHNGVPRllXeTRTNVJRdmFzRHV2Wng1NWdK?=
 =?utf-8?B?VmxhZWlKNmd4STN4NHJoT1ZPUDRNZlVnNzZDbzdzZ1RvdFoxdVQxN3lVK0c0?=
 =?utf-8?B?a3Z5bnkwWTFoTFpoREJJWkVNUHc3eFNVMlpnb2w3UEV6V0xucWI2UGNtTU9r?=
 =?utf-8?B?VUlweXhNbWNFRnphcUN1ZURrYlNkNk9yOWRYenRNSkl2RXl4cDFnM3U3eWJu?=
 =?utf-8?B?NnJ5Ti8wbGl6bU9TbWI0TG04M0lYRXNlOWxMSElnMjNjUHlEUnF0SXowdXJN?=
 =?utf-8?Q?uQoc5xdFuiYiw4pbde5HldnKlxsPsA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:10:45.8810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7960948b-6f58-4b29-ef04-08dd3be1a3ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400

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
v3->v4
Comments pointed out by Ilpo:
- Fix method of duplication data.
- Rename 'count' to 'item_count'.

v2->v3
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
 drivers/platform/mellanox/mlxreg-dpu.c | 619 +++++++++++++++++++++++++
 3 files changed, 632 insertions(+)
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
index 000000000000..8fce1de310a3
--- /dev/null
+++ b/drivers/platform/mellanox/mlxreg-dpu.c
@@ -0,0 +1,619 @@
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
+		.item_count = ARRAY_SIZE(mlxreg_dpu_power_events_items_data),
+		.health = false,
+		.inversed = 1,
+	},
+	{
+		.data = mlxreg_dpu_health_events_items_data,
+		.aggr_mask = MLXREG_DPU_HEALTH_AGGR_MASK,
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HEALTH_MASK,
+		.item_count = ARRAY_SIZE(mlxreg_dpu_health_events_items_data),
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
+	mlxreg_dpu->hotplug_data->items = devm_kmemdup(dev, hotplug_data->items,
+						       mlxreg_dpu->hotplug_data->counter *
+						       sizeof(*mlxreg_dpu->hotplug_data->items),
+						       GFP_KERNEL);
+	if (!mlxreg_dpu->hotplug_data->items)
+		return -ENOMEM;
+
+	item = mlxreg_dpu->hotplug_data->items;
+	for (i = 0; i < hotplug_data->counter; i++, item++) {
+		item->data = devm_kmemdup(dev, hotplug_data->items[i].data,
+					  hotplug_data->items[i].item_count * sizeof(*item->data),
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

