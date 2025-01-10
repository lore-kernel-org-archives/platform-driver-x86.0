Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8576520B804
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516852; cv=fail; b=ga02lrbSvIeIsYij196N4iDfj6M2ryDrUOgrWyKacRlYEAtV0DkG6Zvzvy8AjBLlxK4iox8EVIqB3Lk9Yi+Nq88xhLUkjyCoRc6MJPuAA7caMK2niTKa+T9TEheRfbeSRpF3wIxshuT/lat/Fwe2iDslG4gPAtO+QQh2ivlqwe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516852; c=relaxed/simple;
	bh=cEB42iLWycW6pX2qk5PHv3cNmKIvqJoPJGGPAZF7qfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NH209XkJ6WpY7dHwFd46NLGhi4Cx/PZ0B0paBzFXbOV3hbGyiyPY55+w550Zm/ip/2viSZJ4Vu4QoxB5w4XbKL1WM6tBVG3SY6abgDrzjSPBUR3ikNstpXJ8Mc6T2OJJETqQOH8tizKsVs+C0nUvvhvNo5llkxQbNZ3qXC6U6Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m4zxsJ4z; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m4zxsJ4z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPYPelFiY9AR0347iZdlKIwtpj1sejC0ObZcnat8kFiCcb0OjC+ULlueLyoYy0J6N3H5fnCTwbPXa43Ju3mQYAlPwMziTlKPbqXL0uePPWGZ/15pEK+OdkTDxvglGXy0dO9Tk/0YlngJ/wXxJ6fdKchkXxy3ZJQYz+LD+kuWRvYKkeNfQIxrYoChnuflHMvQD2NWvLGuQTvWOxMvM6iejSXJM9vA2Hh2E9cVllPYunbR76ZECG/C21+34rd36Cbps3Ei3ldh0FwuihKtbL0Y9iRBDgo4Pnx04qNvxVNo61ifMI0ppTfSJZojKtvMeaSXYxAfE5hGORXMoC7nZaytEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0ynsjkcuBr8Zlv36Sk/vR73QUO7dGKGCt7aHxSJMfY=;
 b=yyMiIY+6pFtDTcvOiR/2lWAfOvyoIC7EUzRpfCWVqf40ObElchQehf/lHnh+2zpmLJ8MyuPaUvvIiwXzkjYN6okCU9tkv9UQRKijnjSzukIndqGN/dcmj90BcP+cTxb0UPlUGqQeHa50HQ+e1cnKiafXmJ2PE7GBnwwjh+MueZvxoCQXeFbLoqtiMIsVKN3YOeUO8jPqrqlUhHyFDHT/kGTpVJcGhz49Bcr81b1Ai0ODZsMmj+939JMUtYY/m7hHGaeWl/CwFbj33GWHtc1rmjRn63elCwlnLcXZNC0KnM4r0f/YBRTeVNeQ01+rY/puqqPODLFFusQJObqFUZwKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0ynsjkcuBr8Zlv36Sk/vR73QUO7dGKGCt7aHxSJMfY=;
 b=m4zxsJ4zjq/Pg1pY7SkDy8+7KRN1r9dqfI1fyIp/e1FcZ7NzKDcL+iLHNIQpgQuFB1WjGGHkNILoBFGwaYWHitfSAhoLZJjXUf6CA7mAA/nIWB/7lrLipGX5130bMZk+kaYvGT+u8IhbJ76UjJYepnrh2V4AwLF9IGA7nIH/0u3qIolazUmaEitRKR599xYvisRfxgZW4/nENGGDnouyITkWDNUO5xpkHYhAzelCp1eFdXSNQ72ISj4EGkYSAe2P13YHYsDQSxgSzQKN1pGCVCIrbtv/1WgllfVdZPZg5I8mjn1+1mjw8E6YrjyN+D8fXKROh261/S3LfO1p6ViawA==
Received: from SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::13)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 13:47:24 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::96) by SA1P222CA0192.outlook.office365.com
 (2603:10b6:806:3c4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 13:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:47:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:47:19 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:47:17 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 06/11] platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
Date: Fri, 10 Jan 2025 15:45:04 +0200
Message-ID: <20250110134515.8164-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ddd937-5527-4080-63ee-08dd317d5049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmZqOHJsSkhZbS9jWWQ3Z3Q1OFVGekUyNUQ2eVg1eXV4MFY1akY4T2NvQVJI?=
 =?utf-8?B?bUoxRmwzVmtiUkNjNUJzekY4QTRYKzJMc0xoM21UYnVHYThrdkdJYjd2T3lP?=
 =?utf-8?B?cmxKN1hVMnBQL0RkRnNlbi9EUU05ZjVFNHZjZDZ2VjF6bVpkREhOUmVWSTAw?=
 =?utf-8?B?ZnN1SjdqdXc4WmpJUXg1TmRmMy9LY0xVL0M3OFdIM0lYQzNRWWF2cDA3OXlD?=
 =?utf-8?B?K1MzOW9BR0dlOWNoU2lqcllFdGFONm1wZGo1aGk3T3FYWnlwd1VOSVRuVC8y?=
 =?utf-8?B?a1RTeDljNnlTK2RmTnh5TUdaUG5RS2xRb1prUVBiV0NHcWpvcTgwUGhQVmw2?=
 =?utf-8?B?N2w5OXkvT091WEZiajBaRmRZQkt2bFBlSFJMTnRHMTN5YkZSL2VENXc0YzV6?=
 =?utf-8?B?UlBTa3ZrRlQxN05ZUTJQN09OTmJqNzdmUkN4a0xhNXFSRU02a2ljUTBWNGUr?=
 =?utf-8?B?RVFITTZRZ2M4MkliaUJhZ3B2NHFIOWNDWjlZZjdnMzFPZ0o4dnMrdG9Ua2k1?=
 =?utf-8?B?VmFHb3hIcFUwaHNlalZwK3lCK0VNMlZTS3NlSXJIWksrOEJXeWhUNWpmL3FZ?=
 =?utf-8?B?SzVVMmR5eTA2ZExOeUtyRThpZXJhZ1BYRGl1QkhGblFvNUZGWUtEalY2MUMv?=
 =?utf-8?B?b3ZueThtOFM4b1ZqR3FUVy9qbWNKNXZVbXJmNnBWU0tjdEMzQUNxY2xNTU9w?=
 =?utf-8?B?bU9SMjRsUDM5MUNJMGNHeFA4c09iWmc4VThZZmljWXRkZ0ZiaU1aSHhIdE9r?=
 =?utf-8?B?UUJXN1VDUGRSaWJqM3BxYlMyemdWVTZZQmVTSkcrREF5MC9GaTJsSTdvbXB6?=
 =?utf-8?B?MnMzcW1SU3FsT1VtRXJnRW9LR1RJd0ErRlkrZS92QlZOT3ZNMTM5dW13ckt0?=
 =?utf-8?B?Nkg1Mm4xVjVjWTZDbEpXN05oWXNYWUppMkxzeWdNdXdVRm1mclEwaXFpM2pM?=
 =?utf-8?B?SEh2Mmw0R0JkUllsb2hsVDVRVW9BUU9hRnlqVGh1WElyMkxxR3NVUnpxVlY0?=
 =?utf-8?B?MFJqTit1OFJIT04xckQrSU9zd2NKbkltaG9vWStTL2lNZTZTMVBQSks4WjZY?=
 =?utf-8?B?QVRPTk12Y1UrSEJsMDZCTlVBb3A3ZERmZDVXNmFydE9YNjRMb2FieEMxaTNQ?=
 =?utf-8?B?dThzdTllVFZMblpxRjJ4aGoycU1vSDcxUFhYNDhMVVFxMitpTXBaRzl0STY5?=
 =?utf-8?B?eEQ4aG9iVEdEMEU0M1FlSTlocVdlTWdvd0tqMHdaQXljaklRcDI3VkNjWHI3?=
 =?utf-8?B?d2JqSmhScWx4eElJWFpLeEluU3REKzBVcDE0anlFdG52YkcwUWFkbklhbEJ0?=
 =?utf-8?B?aFhWb29qZnJvbUxranNTVVVvQjB5RUFxWmU4NFdpUFFhMzJTTTRjVTl1NWg2?=
 =?utf-8?B?QWs4N0JOY0t5OWZWbWR5UCtkdHZhTEtSOUs2VDl4Q25nRHhVSk8zNXNSZWVl?=
 =?utf-8?B?bVdoR1d5dUZ5MHd6YlJNTlZtaUprWExXVWo3cW5NOUVYM3VNQUJvdm8yb2ZG?=
 =?utf-8?B?bGpjSk1JNDFkQW5pRUQ1UVhWd2JaMFJEZUZoWXZVOHdWWWhlK3BISnI4OVNG?=
 =?utf-8?B?cG5FTFJwWDVDS2dnVlJTdGhiY0E1ZE9yN2RkMk8yQWpScmxWT0IrWmkveXVz?=
 =?utf-8?B?bzNhVVFtb0xKYlpVT3MzdFd5b3QwQ3U2RU02T2hwa3ZrbnlmNU5KcjlJcSty?=
 =?utf-8?B?T3B2UDVpeWxodWwvcXpVRFp6Mmxpenp0RU5vVGVzb2NDbnV5dWVGN3dIK3Jw?=
 =?utf-8?B?d0VJSjV3cThzc1Q2VWRwcWcvTFIvNnBQUHFoNTYxZWliLzZ1VHZZbWRSVFhl?=
 =?utf-8?B?bDdiWC9YUHdjUlRzSEFnQ3ZqRU9GVTlJUjlQRk9FRFB2ZHdsUWZjN3d3RW1z?=
 =?utf-8?B?NUxBY0xiRDVtcUNOd3dSQmtSbUp1OVAxQVR2UTF1TWxPd09IUFJMcm1PQlFE?=
 =?utf-8?B?bXdBeERtZ0ROSUU4Q1hIR3dPdW8vcFR2SGVRVVFWcThxc2JqcWEzWklmS2RV?=
 =?utf-8?Q?TLmozlX6lWBQheGUAGUp2TgwcgbvfY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:47:24.2575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ddd937-5527-4080-63ee-08dd317d5049
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445

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

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
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

