Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7820FA8B
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227309; cv=fail; b=apN7hIDMmP8KHcJbG0REiSYeHefcFYjz1ecvT+MY7Z8/HX8Wbh4zOx8WtJ1/espusdRS8pJe7l4zeGZBQaO5ipGqmhbz9raJf7MRy/x81IXsUYyxDzr392j/Lx8JkyydL/Vv1EXT60mRrEiSktuIV9D2V0JpDYmvXyiLgDDKeN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227309; c=relaxed/simple;
	bh=HE+4oaaWJy4GcP9usaosZdntpMbNooFLsTWne/pfPTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eqq39jSaLbU/Cl3cQa5zHxzX3SQ5t2GGqAIdYMKdnFMicQMPUBdEqyAFMJKHPVV9s0ypqrY76ree6bBUXzQKoARoOVnaYAUC5RywmQiqr88ZJnUiExDJ2p4hwDBaPk3j+q9jJnb8p39n2Mwb1fYgGmDLy+rVv9iUJQeTZx2ocQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fgHD0CA/; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fgHD0CA/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MefoutI0Fq1GFVu4uduY2C7O3rPBI0Q5uFW9ZMPS9n30oo72LIP5AeM6FGjRBE5NU7f2RpM0Yrg+bywYhVxAyxabYL7slkSYtyoRAClHec8X7zU5uFHuPqXG054UQC7jC5iDliQYAI8VXb8iEkzYhTwyXaK2kfPNeDNJtBNmZTwEJsV872E/zPasHDi/IJL+rOeAoiCTki2HlAH0M1jjeIMCd7KGtA8iKeqC9HENK6ttFmHeeG2TtkEWrJ9rkS33XWvHOOOcT+OCMCS6ccLa7Zfen4BD7/ztHLZvapnc314y/arMWzCwy/3OsTAm2PDv5NoJsmEFA5v2USQFMHl8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBWNdhq8IExEiUNJXuSKSKv0SV1vHO9aFAO0/IZQJVg=;
 b=fA6jB60DznuBnKeG5LO0PbyIi1XqSTLCbdk0wtGv5xdETkK/xv9Bwomomyl3JBJTc/yTQ9N+bGpeE1YHtvtgcYtYEoNW+nyqsZUZSPsS49uTBTbTyA7I7b1DYjn/kj06I1+Fppzf/d3gLrc5R86ZFFWGx9SSKuRq2rLK46+Kci5S2cPPXs+YWUbr2Bt9x2hFBk6fDvaCeAjNb1LSgX3WyC+Zew6xkFEoMxE4k4fVfoCa32fJKA6t+JjX2wLJC15qZqE1nVmXjRwGDZVgGxFDMRyxI6Y9zPE60yifttWtogQH5Yxumv2Id9rfTWlpqHOnddOdk76PfGAH0SVgBpoJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBWNdhq8IExEiUNJXuSKSKv0SV1vHO9aFAO0/IZQJVg=;
 b=fgHD0CA/XzHv2W2YOZMOCgluy8VdUIbfYLf9wRFJrc/f4Db83Yaw3gT601EdmdTBc7/s4ajSVoW2mRGEHdR1iggMy47Nn6zc9Ic9PplF5hmDX0vd8UfIAUQTEzmMOBupgkGpdCMkOTk8bIEtSbFFULC5qDGa31xxn4YMMEEA8cuzc/lkAIwBkonG+Ssv7LG107DEfiIuT/oV9t/WEukREY6GNLZidn9f3tIL7Xr3hBLcrzZuwR6GwAgXUKGnt5QGH8Mdc3nm5jshpOO9bg/5H6GTzU+Qj12DcZ+py765JUEEnSYHS8qnEUy6WkrLgoS2Cikmodg3EypgQZ1DV1qPOA==
Received: from BN0PR04CA0210.namprd04.prod.outlook.com (2603:10b6:408:e9::35)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:21:39 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::aa) by BN0PR04CA0210.outlook.office365.com
 (2603:10b6:408:e9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 09:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 09:21:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 02:21:22 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:21:19 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v9 1/6] platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
Date: Mon, 21 Apr 2025 12:20:46 +0300
Message-ID: <20250421092051.7687-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250421092051.7687-1-vadimp@nvidia.com>
References: <20250421092051.7687-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 38707bff-7ed2-494b-d8a7-08dd80b5ec11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnFiSS9FR3J1QlJEdHZlL3ZOWWovbmlobHo5T0lkYkFLcHFjN3RRcTV0NnBx?=
 =?utf-8?B?a21GOTU3NTBRYU45ZFJTNlZwMUVHUFd1WjRYaDROdHRhVGF0SHNkWkRnejFC?=
 =?utf-8?B?U3RMOUVORklXQkZkWncwSWtHZms1QWxkd3ZrVlMzT1N6MUErMUh1QTJreUd0?=
 =?utf-8?B?T0owM1BCNVM2U3pkT0hGdTJTSWgxVGlZSlRucmFwYkpmdDIxeTlaZ1RXMmR5?=
 =?utf-8?B?bGZpTmhkRXdEbE9EaFdUQ3dDT0hmVVNYYU9kalYxSkY2UUJwcnlqYXZ2TjIz?=
 =?utf-8?B?SnQxbERoNWttVzNpK2gxNHFBTEZ6R3lBU0JpRlhhaWFtTHlmNVJSc2tDV2JB?=
 =?utf-8?B?T3Z3MWZWMllTRjJubGpxNURPSFN0OFFPdHJ5bmppaThXL2ZiSWJBNDBlcmY4?=
 =?utf-8?B?QTArY0pCWklTRVZXZk11YjlMMnE5SkROdHI0QzAyVExlOVk5Yzl0QTk2bzhO?=
 =?utf-8?B?R1lodlR5UTBtN05aNjlqdmVjc2FZMWVZMWpTRytXUWordGp3elZkSmZvVDRH?=
 =?utf-8?B?NnJUVUtmcmw4dW1PcmZ2VExLK0ZNMzBNOTJxcERSWkFiTk5qNkM2NVFyS3Iy?=
 =?utf-8?B?eDNIczJ3Mm82TUxsN0k3U1RPd0ozWVlYNGpxR3ZWUEtTdHBlWEEreGZvKzYv?=
 =?utf-8?B?bUFPV0VTMnpoNWVSd3hmaEhxQjFXZlNkUzhJUiswWHBtTFZiN2FlejgxU0FK?=
 =?utf-8?B?ZGlQbkJYOXRiRDBMRUdXTERXSlMySXdHbzMzekhZOHdMU21vSEc4VEI3anFh?=
 =?utf-8?B?b1hkWDZ1VDdPY29RWVlDN0JsZ1pWbHNiVXE5Ti9jRUZ3VC9zanRiU1N1eFZI?=
 =?utf-8?B?Yk9LSTdvem8xU2NDUnBVWUZseTE0WlFLTFh2K0ZxallnSjZNeTA1RjhZWXEx?=
 =?utf-8?B?V3Q2blhWZG9xeEFXQjVVWnF0QXhvVDVzSG92Y2oyTlluaDk1NktqTlc5b1FF?=
 =?utf-8?B?TlpHalhWbmhIQ1U3K0VtZ2tlVW1lRk0zbW8yTEY2MWcvQlVXc0tGQmhDektU?=
 =?utf-8?B?YnZYWEVvWGFJaFZGL2l1RWNRNjJva2YvOGZnVG9mUSttUEV5SUN0TzhkZjRE?=
 =?utf-8?B?dWt3NjdScS8wUTRzNUZNeFZBSlVWa3lBaFNJN2lLK21NSTZqa1NlMElQdURx?=
 =?utf-8?B?OVZ4emhRNDB4bEhmVkI4dEdsdVJqNzExNVdsQmd2S2VRRkloODVueG45UzFS?=
 =?utf-8?B?UHdBVko3S1NtUEZyRHd6Uk5VT1NVMUwwTkt6clpQelZGSkdvOWtIUmJFS3Qx?=
 =?utf-8?B?VUVqN0s3b3FUMnp0N3pPZktkckVxTHdNL2JMck4rRVpTVU5LQnU5NmpXMnNK?=
 =?utf-8?B?TFhoSWlwNUhLcVcwcUJiQ3AvUElnUFJ5cFoyaU1HaHJmendpdHZqcFdXRmtu?=
 =?utf-8?B?U0lIYWR4VDNpandWMGxtc2hSb1FaVUVlR1o1N0lOYmlaM1piRk44Qk41cHFk?=
 =?utf-8?B?MTIwR0FnMkd4NmlBaEo3K2Y0TWtTckhVNzVoUlVvZDRrZXdraTJ1N1EzZloz?=
 =?utf-8?B?d05XMHEzU0h1eGFzK0RUNllWcmVDVHpmVUNrU21xM0I0Q2p5UUpwNFlRckhn?=
 =?utf-8?B?amxCZ0pKd052YTNHNk1nT3pFZGo3SkJxYngvVjJnRXRCaTZlZ1JHU0FyYkQr?=
 =?utf-8?B?MURnTzY1UmVIV2c4VmNQbFVNbzNsdEJzMWJVdmVmeGtsN3BJaW1jUDZxcDhM?=
 =?utf-8?B?NjQ5NmNpSW44cWRzNlcxOE1mc2YvbWtqbjUzd3ZDb0dPdEgwMFVFbENHMW5Q?=
 =?utf-8?B?eW1uWDh5dW1aV0JnMjhodjRHRGdXVUJCK3lkdys3MHp6OWRveDZWWVVhWjlG?=
 =?utf-8?B?Y05XSmdVUzJtU0F3L3VXQ1VQdkdlRDhaTUNQQ0ZQcE5yc3BqNFllLytFL3R1?=
 =?utf-8?B?WDNVMFJTM3JOVjRyTmtreHdTNjZTbmFTbXJJYWlFSW1HZUdRZXRPeWN2dnpT?=
 =?utf-8?B?bVBkZSt3aW45Z3VoTWFKbTBGQVN4WGlkVFFVSytXdEVxbUlITVlIU2Z3Z0RJ?=
 =?utf-8?B?b01SWk1nUEdUSGh4d0RFZ0dSdXo0QnZQdjFueUJsMlhwemRJbWJPTFhBd05D?=
 =?utf-8?Q?j/Me5y?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:21:39.2518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38707bff-7ed2-494b-d8a7-08dd80b5ec11
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103

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

Driver provides support for the platform management and monitoring
of DPU components. It includes support for: health events, resets and
boot progress indications logic, implemented by FPGA device.

Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v8->v9
Comments pointed out by Ilpo:
- Reflow last paragraph in commit text.
- Fix Kconfig file: s/swicth/switch/.
- Add missed space in comment.
- Remove redundant check of data->hpdev.client pointer for NULL.
- Drop in remove flow redundant cleaning of 'data->hpdev.client' and
  'data->hpdev.adapter' pointers.
v6->v7
Changes added by Vadim:
- Fix few registers setting.
v5->v6
Comments pointed out by Ilpo:
- Fix structure title to conform to kerneldoc formatting.
- Remove unnecessary comments.
v4->v5
Comments pointed out by Ilpo:
- Add empty line in mlxreg_dpu_config_init().
- Include 'dev_printk.h' from dev_err().
- Remove unnecessary comments from mlxreg_dpu_config_exit().
- Put defer probing test in mlxreg_dpu_probe() before allocation.
- Remove unnecessary comments from mlxreg_dpu_probe().

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
 drivers/platform/mellanox/mlxreg-dpu.c | 611 +++++++++++++++++++++++++
 3 files changed, 624 insertions(+)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index aa760f064a17..7204b10388ca 100644
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
+	  If you have a Nvidia smart switch system, say Y or M here.
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
index 000000000000..277e4b8cc5cb
--- /dev/null
+++ b/drivers/platform/mellanox/mlxreg-dpu.c
@@ -0,0 +1,611 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nvidia Data Processor Unit platform driver
+ *
+ * Copyright (C) 2025 Nvidia Technologies Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/dev_printk.h>
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
+		.bit = GENMASK(3, 0),
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
+		.reg = MLXREG_DPU_REG_GP1_OFFSET,
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
+		.inversed = 0,
+	},
+	{
+		.data = mlxreg_dpu_health_events_items_data,
+		.aggr_mask = MLXREG_DPU_HEALTH_AGGR_MASK,
+		.reg = MLXREG_DPU_REG_HEALTH_OFFSET,
+		.mask = MLXREG_DPU_HEALTH_MASK,
+		.count = ARRAY_SIZE(mlxreg_dpu_health_events_items_data),
+		.health = false,
+		.inversed = 0,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxreg_dpu_default_hotplug_data = {
+	.items = mlxreg_dpu_hotplug_items,
+	.count = ARRAY_SIZE(mlxreg_dpu_hotplug_items),
+	.cell = MLXREG_DPU_REG_AGGRCO_OFFSET,
+	.mask = MLXREG_DPU_AGGR_MASK,
+};
+
+/**
+ * struct mlxreg_dpu - device private data
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
+						       mlxreg_dpu->hotplug_data->count *
+						       sizeof(*mlxreg_dpu->hotplug_data->items),
+						       GFP_KERNEL);
+	if (!mlxreg_dpu->hotplug_data->items)
+		return -ENOMEM;
+
+	item = mlxreg_dpu->hotplug_data->items;
+	for (i = 0; i < hotplug_data->count; i++, item++) {
+		item->data = devm_kmemdup(dev, hotplug_data->items[i].data,
+					  hotplug_data->items[i].count * sizeof(*item->data),
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
+
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
+	platform_device_unregister(mlxreg_dpu->hotplug);
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
+	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
+	if (!data->hpdev.adapter)
+		return -EPROBE_DEFER;
+
+	mlxreg_dpu = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_dpu), GFP_KERNEL);
+	if (!mlxreg_dpu)
+		return -ENOMEM;
+
+	/* Create device at the top of DPU I2C tree. */
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
+	err = mlxreg_dpu_config_init(mlxreg_dpu, regmap, data, data->hpdev.brdinfo->irq);
+	if (err)
+		goto mlxreg_dpu_config_init_fail;
+
+	return err;
+
+mlxreg_dpu_config_init_fail:
+regcache_sync_fail:
+devm_regmap_init_i2c_fail:
+	i2c_unregister_device(data->hpdev.client);
+i2c_new_device_fail:
+	i2c_put_adapter(data->hpdev.adapter);
+	return err;
+}
+
+static void mlxreg_dpu_remove(struct platform_device *pdev)
+{
+	struct mlxreg_core_data *data = dev_get_platdata(&pdev->dev);
+	struct mlxreg_dpu *mlxreg_dpu = platform_get_drvdata(pdev);
+
+	mlxreg_dpu_config_exit(mlxreg_dpu);
+	i2c_unregister_device(data->hpdev.client);
+	i2c_put_adapter(data->hpdev.adapter);
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

