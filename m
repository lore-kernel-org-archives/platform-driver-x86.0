Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013054.outbound.protection.outlook.com [40.93.196.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A638425D
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318372; cv=fail; b=Goa2Ffc5GEOFnrIF6yTAOBgGZyvDSxPtLt+l3lMpr9S41S1mm8BW7+nkt6Q3Kddsw+uLfHHhUr+zd+sB9YyKEfW54L7pNcAl0auV3qh5xzYC6xS+dYUJTMQxlGh3q7pvZ6m5/xt8ZTyQ9Z8Z3ojSzThdPjfSlunm6AaeC0W5aVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318372; c=relaxed/simple;
	bh=VQH+dyXdFjU6BTi7nMgASISQNQOvQ0K4U4qPUhUFWPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ml9qT0AE0k/rpzkNP5/ExotxBwEOLTaZpUhEdXNGJ4A1xkEoGM1RG7II0beNYXwODs+H5KA+xAxCIO6Gk4cayBTIogQmzdtQG4I3UOVXsD42aGs2hGAXha5U1imYqUhdnyL1uQgzv9jl4WDnCAKNbD8YiZUyDjTHXNWcjuMOdSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z439wSfM; arc=fail smtp.client-ip=40.93.196.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z439wSfM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrOCIkjw+Bkw/S1EF4d41MHWr3UunB1LgBIHgzWHmiOcTsF5gnA4Wsv7g8D1iM/FUxRSx+XWnnNMgc6fG2nnWtvZHPhlPVpU5n4qXIThx5+adUfjbX+i17K6YIMhPESSNhLOuj0z4VJgJvFi/pb/aF5saKgXAjPu4kod9ZMIBIL/x6njeLZTy8sBwUSgI1Mqow2ZpzRS85g76K9KhOvjqpxZK0Iw+7N2HCHVS1juoGyBcvbOOfL8DBzch9vCuqPOXsoVJJMTDSzVeRvxNfz+0DdbLFiDhYFb00k0TYGoZxO5abwJjqcyvJ9QydrtXRt/D+22Q1Yj+VyKMC2ycbY5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLhe00upE23BahLA1IcuCDmFJ3mMXhU5R5AWKo/0Jow=;
 b=XPVpYIOTkHP1vsUQy5jb2se7RAwTfh/7xNW+kwBbJi1BpNXnELLTCnScO60caDTt9IgjhFHlid0oLuNhtaaJarOlETSJYYU6OJvMl2UiAjaBPVo9YbI+uFXFws9sZB4weiSKX0odD0Z4QPCTcsXpr4ohweiMVZkgC0+3y+LGAoQbLFyPYCUB0aczUF6vd09gnXPBXlfskuCPRng/iVnTgAXQ5bLSiGzW82bkCEVUH7GZJDEqtqsCsHXVoNwbWBkfmwOeruxyvurFREbGWaiZ663L+4s15BBLrdln7H+nTMAnlVQPbTVEBUv5Mp0Uxeaf5gQTeqdU+CsAdX2FqHxFRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLhe00upE23BahLA1IcuCDmFJ3mMXhU5R5AWKo/0Jow=;
 b=Z439wSfMAA6JbOTslZ/HiYSI2/8K9kXsTCFM8dSgtjUyA7L1Ji1JlCiGD0qA3lj3P7qdOInKDGCL0xf95RlvlDDPmMEpGzQUJvYvPh0MISGu2OqRa7z8fDNCTePtGIUHv0u7S5gLoZZrJZwi0szwogpU+NvFGbiAnslhxN/wCHAUDRQCohqltgGocHaQwJhlTCM8Z83YKHWa8uMrTQjC0OOByHrJzzVol95jdVdVGQIe0CiznAPmc/f9X1xhsxzfL2FtxE+f0D1tETeIWj+pqtSleo8bVm0tqV5+TQ5de1bPXIG2aVb1ZoPvclERwagZkLiZ1jeHWg6YeUrlhHrDPA==
Received: from BN9PR03CA0482.namprd03.prod.outlook.com (2603:10b6:408:130::7)
 by PH0PR12MB7958.namprd12.prod.outlook.com (2603:10b6:510:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sun, 18 Oct
 2026 10:12:31 +0000
Received: from BN2PEPF0000A802.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::3e) by BN9PR03CA0482.outlook.office365.com
 (2603:10b6:408:130::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun,
 18 Oct 2026 10:12:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A802.mail.protection.outlook.com (10.167.245.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 18 Oct 2026 10:12:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 18 Oct
 2026 03:12:18 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 03:12:15 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v2 1/3] platform/mellanox: nvsw-core: Add core driver for Nvidia switches
Date: Sun, 18 Oct 2026 13:11:54 +0300
Message-ID: <20261018101156.699575-2-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261018101156.699575-1-fradensky@nvidia.com>
References: <20261018101156.699575-1-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A802:EE_|PH0PR12MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9cd25a-f0f2-4116-1b7e-08df2d0051bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	1ZePwVvh42/1DRWSkvart/+H/capbVk/kynetrBN+5jYOT7Bsf50DzxaiXlozQJDoIXN66J+xPX885/OI0TxHyWZD3CBOdOablh4LQ+gRX1fUkFnnpRrHwht2eAzJ3lkMk/r8wyTV1S/fBWMe0O7gU0/bmmXTd+Lcr8THLWbkqKR1a0hxrFb+fAgOTyH3X1CrYKEX8hbfqqyShOZHYkmIpWeUDI396RBkvLuUzCafHMns09HTM5H+y5ATHatc8C9nkD9AIs0R4By2Hv/XfKNJSn/2yJEW+JT8qJGFSedrbiOcqDJr4TLIzUNnl0US7QRA/0k1O3kvo4EvdrkgISa14YrurGRA3KNkIrXZggogctNgGrMC4YY/u4hy9sLHkW4Zu7acJaWs9pBBLgCLjiiu/xvMU/WGkijlHjwB6uhsCEoW9wK5dXQZTJR395XqmCPwIfNR/GiD0uH12cJ5/W5TsW06n+HakIGXB+jp086zt6OvqRE1nuwfYTb0/Q4AHyeIrASb8r+FUFHQszAv5d0sXf9vJmuve1KXuxZQ5Tt5++f694gTR7yc1KMdNgK+kvqRE4POkZng0vyf20BbvUJbrjk3mdEOgHybNKB0qc3inE8k1dAgweUz7kTFH3cAQnlesPaDA3N1Jh9E6OdBz+vF91KJOqJrmpNJfzR6TLj/iZPl96sfRTHvpyesWRaNhVOUU7Jiz/rFrLYGRMhs4CwLA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7Kh4/Gs11nvAKiFJneTXFnYlro5rOkpU3BCwrcFjjkY9FNywMH7m6FH4RaAn0bnUhAI9Pzfd3DBBH6KjQ3BHKIFCe/NHwy7J6swgu9DfdX2QZedN6m3eTQv0miCow2L6fc3zaE/DgejfS9u0tL6BtnnqSB8v0AFaYeFBwhUA4g3/puxLJDsST809QPRqvkkuF62RexX/Hfsij/yeQh4+jgb0rgd4ohVW5N8w6OZCo69SH6YFsrbAlJVtmoJ4921WP1qyjrwi8MpyUNd5HNz2Tiyn9LXrRW9BDbpB2vnqZq1S/fffT2SqutT4kv9gDsHZuROYo4QKfMWJk5XO0TN91e/guwtYJ80+ZlFkEzLaegTLyRj/bi8rupgHwogDkOKzXkRI58GfJ2gJHXHKdZvbRchVENFFel2pa5eWOgk4RCvw1IacL9+LX2MV63uv/PAu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 10:12:30.2848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9cd25a-f0f2-4116-1b7e-08df2d0051bf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7958

The Nvidia switch systems expose system control and monitoring through
CPLD/FPGA devices. The register layout and the set of mlxreg-* devices
built on top of it are common across switch generations, while the
description of which devices exist on a given board is not.

Add nvsw-core, which implements the shared part: creation of the
register map for the I2C attached CPLD/FPGA, the I2C mux topology, and
the registration of the mlxreg-io, mlxreg-hotplug, mlxreg-fan,
leds-mlxreg and mlx-wdt platform devices from a board supplied
description.

Board drivers provide a struct nvsw_core describing their hardware and
call nvsw_core_init() and nvsw_core_exit(). Both symbols are exported
in the NVSW namespace, so consumers declare the dependency explicitly
and the core adds nothing to the global symbol table.

The core is selected by the board drivers rather than being directly
selectable, since it is not useful on its own.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2
Comments pointed out by Ilpo:
- Add the direct includes for the macros this file uses instead of
  relying on them arriving transitively: linux/array_size.h,
  linux/bits.h, linux/dev_printk.h, linux/err.h, linux/export.h and
  linux/types.h.
- Return platform_device_register_resndata() and
  devm_regmap_init_i2c() into a local, so a struct nvsw_core field is
  only ever assigned a valid pointer and never an ERR_PTR.
- Drop the NULL assignments from the error paths and from
  nvsw_core_platform_exit(), and make the rollback in
  nvsw_core_platform_init() positional.
Additional fixes added by Felix:
- Sort the include block.

 drivers/platform/mellanox/Kconfig     |   9 +
 drivers/platform/mellanox/Makefile    |   1 +
 drivers/platform/mellanox/nvsw-core.c | 686 ++++++++++++++++++++++++++
 drivers/platform/mellanox/nvsw.h      | 297 +++++++++++
 4 files changed, 993 insertions(+)
 create mode 100644 drivers/platform/mellanox/nvsw-core.c
 create mode 100644 drivers/platform/mellanox/nvsw.h

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index e3afbe62c7f6..383906a77b6c 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -105,6 +105,15 @@ config MLXBF_PMC
 	  to performance monitoring counters within various blocks in the
 	  Mellanox BlueField SoC via a sysfs interface.
 
+config NVSW_CORE
+	tristate
+	select REGMAP_I2C
+	help
+	  Shared register map setup and platform device creation for the Nvidia
+	  switch CPLD/FPGA drivers. This symbol has no prompt of its own and is
+	  selected by the drivers that need it, which are built as separate
+	  modules against it.
+
 config NVSW_SN2201
 	tristate "Nvidia SN2201 platform driver support"
 	depends on HWMON && I2C
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
index e86723b44c2e..22e40759dd49 100644
--- a/drivers/platform/mellanox/Makefile
+++ b/drivers/platform/mellanox/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_MLXREG_DPU)	+= mlxreg-dpu.o
 obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
 obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
 obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
+obj-$(CONFIG_NVSW_CORE) += nvsw-core.o
 obj-$(CONFIG_NVSW_SN2201) += nvsw-sn2201.o
diff --git a/drivers/platform/mellanox/nvsw-core.c b/drivers/platform/mellanox/nvsw-core.c
new file mode 100644
index 000000000000..623b44df7688
--- /dev/null
+++ b/drivers/platform/mellanox/nvsw-core.c
@@ -0,0 +1,686 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Nvidia switch platform driver
+ *
+ * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include "nvsw.h"
+
+static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NVSW_REG_CPLD1_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD2_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD3_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD4_DBG_LED_OFFSET:
+	case NVSW_REG_PG1_EVENT_OFFSET:
+	case NVSW_REG_PG1_MASK_OFFSET:
+	case NVSW_REG_PG2_EVENT_OFFSET:
+	case NVSW_REG_PG2_MASK_OFFSET:
+	case NVSW_REG_PG3_EVENT_OFFSET:
+	case NVSW_REG_PG3_MASK_OFFSET:
+	case NVSW_REG_PG4_EVENT_OFFSET:
+	case NVSW_REG_PG4_MASK_OFFSET:
+	case NVSW_REG_RESET_GP1_OFFSET:
+	case NVSW_REG_FIELD_UPGRADE:
+	case NVSW_REG_GP0_OFFSET:
+	case NVSW_REG_GP1_OFFSET:
+	case NVSW_REG_GP7_OFFSET:
+	case NVSW_REG_UART_BAUD_OFFSET:
+	case NVSW_REG_PWM_CONTROL_OFFSET:
+	case NVSW_REG_RESET_GP2_OFFSET:
+	case NVSW_REG_GP4_OFFSET:
+	case NVSW_REG_GP5_OFFSET:
+	case NVSW_REG_GP6_OFFSET:
+	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED5_OFFSET:
+	case NVSW_REG_LED6_OFFSET:
+	case NVSW_REG_LED7_OFFSET:
+	case NVSW_REG_AGGRCO_MASK_OFFSET:
+	case NVSW_REG_HEALTH_EVENT_OFFSET:
+	case NVSW_REG_HEALTH_MASK_OFFSET:
+	case NVSW_REG_AGGR_MASK_OFFSET:
+	case NVSW_REG_FU_CAP_OFFSET:
+	case NVSW_REG_BRD4_EVENT_OFFSET:
+	case NVSW_REG_BRD4_MASK_OFFSET:
+	case NVSW_REG_AGGRLO_MASK_OFFSET:
+	case NVSW_REG_BRD1_EVENT_OFFSET:
+	case NVSW_REG_BRD1_MASK_OFFSET:
+	case NVSW_REG_BRD2_EVENT_OFFSET:
+	case NVSW_REG_BRD2_MASK_OFFSET:
+	case NVSW_REG_ASIC1_EVENT_OFFSET:
+	case NVSW_REG_ASIC1_MASK_OFFSET:
+	case NVSW_REG_ASIC2_EVENT_OFFSET:
+	case NVSW_REG_ASIC2_MASK_OFFSET:
+	case NVSW_REG_ASIC3_EVENT_OFFSET:
+	case NVSW_REG_ASIC3_MASK_OFFSET:
+	case NVSW_REG_ASIC4_EVENT_OFFSET:
+	case NVSW_REG_ASIC4_MASK_OFFSET:
+	case NVSW_REG_VR1_ALERT_EVENT_OFFSET:
+	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
+	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
+	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
+	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
+	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_FAN_EVENT_OFFSET:
+	case NVSW_REG_FAN_MASK_OFFSET:
+	case NVSW_REG_PWRB_EVENT_OFFSET:
+	case NVSW_REG_PWRB_MASK_OFFSET:
+	case NVSW_REG_EROT_EVENT_OFFSET:
+	case NVSW_REG_EROT_MASK_OFFSET:
+	case NVSW_REG_EROT_ERR_EVENT_OFFSET:
+	case NVSW_REG_EROT_ERR_MASK_OFFSET:
+	case NVSW_REG_FRU1_EVENT_OFFSET:
+	case NVSW_REG_FRU1_MASK_OFFSET:
+	case NVSW_REG_LEAK_EVENT_OFFSET:
+	case NVSW_REG_LEAK_MASK_OFFSET:
+	case NVSW_REG_SPI_CHNL_SELECT:
+	case NVSW_REG_WD2_TMR_OFFSET:
+	case NVSW_REG_WD2_TLEFT_OFFSET:
+	case NVSW_REG_WD2_ACT_OFFSET:
+	case NVSW_REG_WD3_TMR_OFFSET:
+	case NVSW_REG_WD3_TLEFT_OFFSET:
+	case NVSW_REG_WD3_ACT_OFFSET:
+	case NVSW_REG_PWM1_OFFSET:
+	case NVSW_REG_MUX0_OFFSET:
+	case NVSW_REG_MUX1_OFFSET:
+	case NVSW_REG_MUX2_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NVSW_REG_CPLD1_VER_OFFSET:
+	case NVSW_REG_CPLD1_PN_OFFSET:
+	case NVSW_REG_CPLD1_PN1_OFFSET:
+	case NVSW_REG_CPLD2_VER_OFFSET:
+	case NVSW_REG_CPLD2_PN_OFFSET:
+	case NVSW_REG_CPLD2_PN1_OFFSET:
+	case NVSW_REG_CPLD3_VER_OFFSET:
+	case NVSW_REG_CPLD3_PN_OFFSET:
+	case NVSW_REG_CPLD3_PN1_OFFSET:
+	case NVSW_REG_CPLD4_VER_OFFSET:
+	case NVSW_REG_CPLD4_PN_OFFSET:
+	case NVSW_REG_CPLD4_PN1_OFFSET:
+	case NVSW_REG_CPLD1_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD2_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD3_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD4_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD7_VER_OFFSET:
+	case NVSW_REG_PG1_OFFSET:
+	case NVSW_REG_PG1_EVENT_OFFSET:
+	case NVSW_REG_PG1_MASK_OFFSET:
+	case NVSW_REG_PG2_OFFSET:
+	case NVSW_REG_PG2_EVENT_OFFSET:
+	case NVSW_REG_PG2_MASK_OFFSET:
+	case NVSW_REG_PG3_OFFSET:
+	case NVSW_REG_PG3_EVENT_OFFSET:
+	case NVSW_REG_PG3_MASK_OFFSET:
+	case NVSW_REG_PG4_OFFSET:
+	case NVSW_REG_PG4_EVENT_OFFSET:
+	case NVSW_REG_PG4_MASK_OFFSET:
+	case NVSW_REG_CPLD6_VER_OFFSET:
+	case NVSW_REG_CPLD6_PN_OFFSET:
+	case NVSW_REG_CPLD6_PN1_OFFSET:
+	case NVSW_REG_CPLD9_VER_OFFSET:
+	case NVSW_REG_CPLD10_PN_OFFSET:
+	case NVSW_REG_CPLD10_PN1_OFFSET:
+	case NVSW_REG_RESET_GP1_OFFSET:
+	case NVSW_REG_FIELD_UPGRADE:
+	case NVSW_REG_SAFE_BIOS_OFFSET:
+	case NVSW_REG_RESET_CAUSE_OFFSET:
+	case NVSW_REG_RESET_CAUSE1_OFFSET:
+	case NVSW_REG_RESET_CAUSE2_OFFSET:
+	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED5_OFFSET:
+	case NVSW_REG_LED6_OFFSET:
+	case NVSW_REG_LED7_OFFSET:
+	case NVSW_REG_CPLD7_PN_OFFSET:
+	case NVSW_REG_CPLD7_PN1_OFFSET:
+	case NVSW_REG_RESET_GP2_OFFSET:
+	case NVSW_REG_GP0_RO_OFFSET:
+	case NVSW_REG_GP1_RO_OFFSET:
+	case NVSW_REG_GP2_RO_OFFSET:
+	case NVSW_REG_GP4_RO_OFFSET:
+	case NVSW_REG_GP5_RO_OFFSET:
+	case NVSW_REG_GPCOM0_OFFSET:
+	case NVSW_REG_GP0_OFFSET:
+	case NVSW_REG_GP1_OFFSET:
+	case NVSW_REG_GP7_OFFSET:
+	case NVSW_REG_UART_BAUD_OFFSET:
+	case NVSW_REG_PWM_CONTROL_OFFSET:
+	case NVSW_REG_GP4_OFFSET:
+	case NVSW_REG_GP5_OFFSET:
+	case NVSW_REG_GP6_OFFSET:
+	case NVSW_REG_AGGRCO_OFFSET:
+	case NVSW_REG_AGGRCO_MASK_OFFSET:
+	case NVSW_REG_HEALTH_OFFSET:
+	case NVSW_REG_HEALTH_EVENT_OFFSET:
+	case NVSW_REG_HEALTH_MASK_OFFSET:
+	case NVSW_REG_AGGR_OFFSET:
+	case NVSW_REG_AGGR_MASK_OFFSET:
+	case NVSW_REG_FU_CAP_OFFSET:
+	case NVSW_REG_BRD4_OFFSET:
+	case NVSW_REG_BRD4_EVENT_OFFSET:
+	case NVSW_REG_BRD4_MASK_OFFSET:
+	case NVSW_REG_AGGRLO_OFFSET:
+	case NVSW_REG_AGGRLO_MASK_OFFSET:
+	case NVSW_REG_BRD1_OFFSET:
+	case NVSW_REG_BRD1_EVENT_OFFSET:
+	case NVSW_REG_BRD1_MASK_OFFSET:
+	case NVSW_REG_BRD2_OFFSET:
+	case NVSW_REG_BRD2_EVENT_OFFSET:
+	case NVSW_REG_BRD2_MASK_OFFSET:
+	case NVSW_REG_ASIC1_HEALTH_OFFSET:
+	case NVSW_REG_ASIC1_EVENT_OFFSET:
+	case NVSW_REG_ASIC1_MASK_OFFSET:
+	case NVSW_REG_ASIC2_HEALTH_OFFSET:
+	case NVSW_REG_ASIC2_EVENT_OFFSET:
+	case NVSW_REG_ASIC2_MASK_OFFSET:
+	case NVSW_REG_ASIC3_HEALTH_OFFSET:
+	case NVSW_REG_ASIC3_EVENT_OFFSET:
+	case NVSW_REG_ASIC3_MASK_OFFSET:
+	case NVSW_REG_ASIC4_HEALTH_OFFSET:
+	case NVSW_REG_ASIC4_EVENT_OFFSET:
+	case NVSW_REG_ASIC4_MASK_OFFSET:
+	case NVSW_REG_VR1_ALERT_OFFSET:
+	case NVSW_REG_VR1_ALERT_EVENT_OFFSET:
+	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
+	case NVSW_REG_VR2_ALERT_OFFSET:
+	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
+	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
+	case NVSW_REG_PS_DC_OK_OFFSET:
+	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
+	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_CPLD8_PN_OFFSET:
+	case NVSW_REG_CPLD8_PN1_OFFSET:
+	case NVSW_REG_CPLD8_VER_OFFSET:
+	case NVSW_REG_FAN_OFFSET:
+	case NVSW_REG_FAN_EVENT_OFFSET:
+	case NVSW_REG_FAN_MASK_OFFSET:
+	case NVSW_REG_CPLD5_VER_OFFSET:
+	case NVSW_REG_CPLD5_PN_OFFSET:
+	case NVSW_REG_CPLD5_PN1_OFFSET:
+	case NVSW_REG_EROT_OFFSET:
+	case NVSW_REG_EROT_EVENT_OFFSET:
+	case NVSW_REG_EROT_MASK_OFFSET:
+	case NVSW_REG_EROT_ERR_OFFSET:
+	case NVSW_REG_EROT_ERR_EVENT_OFFSET:
+	case NVSW_REG_EROT_ERR_MASK_OFFSET:
+	case NVSW_REG_PWRB_OFFSET:
+	case NVSW_REG_PWRB_EVENT_OFFSET:
+	case NVSW_REG_PWRB_MASK_OFFSET:
+	case NVSW_REG_FRU1_OFFSET:
+	case NVSW_REG_FRU1_EVENT_OFFSET:
+	case NVSW_REG_FRU1_MASK_OFFSET:
+	case NVSW_REG_LEAK_OFFSET:
+	case NVSW_REG_LEAK_EVENT_OFFSET:
+	case NVSW_REG_LEAK_MASK_OFFSET:
+	case NVSW_REG_CPLD1_MVER_OFFSET:
+	case NVSW_REG_CPLD2_MVER_OFFSET:
+	case NVSW_REG_CPLD3_MVER_OFFSET:
+	case NVSW_REG_CPLD4_MVER_OFFSET:
+	case NVSW_REG_PWM1_OFFSET:
+	case NVSW_REG_TACHO1_OFFSET:
+	case NVSW_REG_TACHO2_OFFSET:
+	case NVSW_REG_TACHO3_OFFSET:
+	case NVSW_REG_TACHO4_OFFSET:
+	case NVSW_REG_TACHO5_OFFSET:
+	case NVSW_REG_TACHO6_OFFSET:
+	case NVSW_REG_TACHO7_OFFSET:
+	case NVSW_REG_TACHO8_OFFSET:
+	case NVSW_REG_TACHO9_OFFSET:
+	case NVSW_REG_TACHO10_OFFSET:
+	case NVSW_REG_TACHO11_OFFSET:
+	case NVSW_REG_TACHO12_OFFSET:
+	case NVSW_REG_FAN_CAP1_OFFSET:
+	case NVSW_REG_FAN_DRW_CAP_OFFSET:
+	case NVSW_REG_TACHO_SPEED_OFFSET:
+	case NVSW_REG_CONFIG1_OFFSET:
+	case NVSW_REG_CONFIG2_OFFSET:
+	case NVSW_REG_CONFIG3_OFFSET:
+	case NVSW_REG_SPI_CHNL_SELECT:
+	case NVSW_REG_CPLD5_MVER_OFFSET:
+	case NVSW_REG_CPLD9_PN_OFFSET:
+	case NVSW_REG_CPLD9_PN1_OFFSET:
+	case NVSW_REG_CPLD10_VER_OFFSET:
+	case NVSW_REG_WD2_TMR_OFFSET:
+	case NVSW_REG_WD2_TLEFT_OFFSET:
+	case NVSW_REG_WD2_ACT_OFFSET:
+	case NVSW_REG_WD3_TMR_OFFSET:
+	case NVSW_REG_WD3_TLEFT_OFFSET:
+	case NVSW_REG_WD3_ACT_OFFSET:
+	case NVSW_REG_CPLD7_MVER_OFFSET:
+	case NVSW_REG_CPLD8_MVER_OFFSET:
+	case NVSW_REG_CPLD9_MVER_OFFSET:
+	case NVSW_REG_CPLD10_MVER_OFFSET:
+	case NVSW_REG_CPLD6_MVER_OFFSET:
+	case NVSW_REG_MUX0_OFFSET:
+	case NVSW_REG_MUX1_OFFSET:
+	case NVSW_REG_MUX2_OFFSET:
+	case NVSW_REG_UFM_VERSION_OFFSET:
+	case NVSW_REG_SYS_CPBLTY0:
+		return true;
+	}
+	return false;
+}
+
+static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NVSW_REG_CPLD1_VER_OFFSET:
+	case NVSW_REG_CPLD1_PN_OFFSET:
+	case NVSW_REG_CPLD1_PN1_OFFSET:
+	case NVSW_REG_CPLD2_VER_OFFSET:
+	case NVSW_REG_CPLD2_PN_OFFSET:
+	case NVSW_REG_CPLD2_PN1_OFFSET:
+	case NVSW_REG_CPLD3_VER_OFFSET:
+	case NVSW_REG_CPLD3_PN_OFFSET:
+	case NVSW_REG_CPLD3_PN1_OFFSET:
+	case NVSW_REG_CPLD4_VER_OFFSET:
+	case NVSW_REG_CPLD4_PN_OFFSET:
+	case NVSW_REG_CPLD4_PN1_OFFSET:
+	case NVSW_REG_CPLD1_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD2_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD3_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD4_DBG_LED_OFFSET:
+	case NVSW_REG_CPLD7_VER_OFFSET:
+	case NVSW_REG_PG1_OFFSET:
+	case NVSW_REG_PG1_EVENT_OFFSET:
+	case NVSW_REG_PG1_MASK_OFFSET:
+	case NVSW_REG_PG2_OFFSET:
+	case NVSW_REG_PG2_EVENT_OFFSET:
+	case NVSW_REG_PG2_MASK_OFFSET:
+	case NVSW_REG_PG3_OFFSET:
+	case NVSW_REG_PG3_EVENT_OFFSET:
+	case NVSW_REG_PG3_MASK_OFFSET:
+	case NVSW_REG_PG4_OFFSET:
+	case NVSW_REG_PG4_EVENT_OFFSET:
+	case NVSW_REG_PG4_MASK_OFFSET:
+	case NVSW_REG_CPLD6_VER_OFFSET:
+	case NVSW_REG_CPLD6_PN_OFFSET:
+	case NVSW_REG_CPLD6_PN1_OFFSET:
+	case NVSW_REG_CPLD9_VER_OFFSET:
+	case NVSW_REG_CPLD10_PN_OFFSET:
+	case NVSW_REG_CPLD10_PN1_OFFSET:
+	case NVSW_REG_RESET_GP1_OFFSET:
+	case NVSW_REG_FIELD_UPGRADE:
+	case NVSW_REG_SAFE_BIOS_OFFSET:
+	case NVSW_REG_RESET_CAUSE_OFFSET:
+	case NVSW_REG_RESET_CAUSE1_OFFSET:
+	case NVSW_REG_RESET_CAUSE2_OFFSET:
+	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED5_OFFSET:
+	case NVSW_REG_LED6_OFFSET:
+	case NVSW_REG_LED7_OFFSET:
+	case NVSW_REG_CPLD7_PN_OFFSET:
+	case NVSW_REG_CPLD7_PN1_OFFSET:
+	case NVSW_REG_RESET_GP2_OFFSET:
+	case NVSW_REG_GP0_RO_OFFSET:
+	case NVSW_REG_GP1_RO_OFFSET:
+	case NVSW_REG_GP2_RO_OFFSET:
+	case NVSW_REG_GPCOM0_OFFSET:
+	case NVSW_REG_GP0_OFFSET:
+	case NVSW_REG_GP1_OFFSET:
+	case NVSW_REG_GP7_OFFSET:
+	case NVSW_REG_UART_BAUD_OFFSET:
+	case NVSW_REG_PWM_CONTROL_OFFSET:
+	case NVSW_REG_GP4_OFFSET:
+	case NVSW_REG_GP5_OFFSET:
+	case NVSW_REG_GP6_OFFSET:
+	case NVSW_REG_AGGRCO_OFFSET:
+	case NVSW_REG_AGGRCO_MASK_OFFSET:
+	case NVSW_REG_HEALTH_OFFSET:
+	case NVSW_REG_HEALTH_EVENT_OFFSET:
+	case NVSW_REG_HEALTH_MASK_OFFSET:
+	case NVSW_REG_AGGR_OFFSET:
+	case NVSW_REG_AGGR_MASK_OFFSET:
+	case NVSW_REG_FU_CAP_OFFSET:
+	case NVSW_REG_BRD4_OFFSET:
+	case NVSW_REG_BRD4_EVENT_OFFSET:
+	case NVSW_REG_BRD4_MASK_OFFSET:
+	case NVSW_REG_AGGRLO_OFFSET:
+	case NVSW_REG_AGGRLO_MASK_OFFSET:
+	case NVSW_REG_BRD1_OFFSET:
+	case NVSW_REG_BRD1_EVENT_OFFSET:
+	case NVSW_REG_BRD1_MASK_OFFSET:
+	case NVSW_REG_BRD2_OFFSET:
+	case NVSW_REG_BRD2_EVENT_OFFSET:
+	case NVSW_REG_BRD2_MASK_OFFSET:
+	case NVSW_REG_ASIC1_HEALTH_OFFSET:
+	case NVSW_REG_ASIC1_EVENT_OFFSET:
+	case NVSW_REG_ASIC1_MASK_OFFSET:
+	case NVSW_REG_ASIC2_HEALTH_OFFSET:
+	case NVSW_REG_ASIC2_EVENT_OFFSET:
+	case NVSW_REG_ASIC2_MASK_OFFSET:
+	case NVSW_REG_ASIC3_HEALTH_OFFSET:
+	case NVSW_REG_ASIC3_EVENT_OFFSET:
+	case NVSW_REG_ASIC3_MASK_OFFSET:
+	case NVSW_REG_ASIC4_HEALTH_OFFSET:
+	case NVSW_REG_ASIC4_EVENT_OFFSET:
+	case NVSW_REG_ASIC4_MASK_OFFSET:
+	case NVSW_REG_VR1_ALERT_OFFSET:
+	case NVSW_REG_VR1_ALERT_EVENT_OFFSET:
+	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
+	case NVSW_REG_VR2_ALERT_OFFSET:
+	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
+	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
+	case NVSW_REG_PS_DC_OK_OFFSET:
+	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
+	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_CPLD8_PN_OFFSET:
+	case NVSW_REG_CPLD8_PN1_OFFSET:
+	case NVSW_REG_CPLD8_VER_OFFSET:
+	case NVSW_REG_FAN_OFFSET:
+	case NVSW_REG_FAN_EVENT_OFFSET:
+	case NVSW_REG_FAN_MASK_OFFSET:
+	case NVSW_REG_CPLD5_VER_OFFSET:
+	case NVSW_REG_CPLD5_PN_OFFSET:
+	case NVSW_REG_CPLD5_PN1_OFFSET:
+	case NVSW_REG_EROT_OFFSET:
+	case NVSW_REG_EROT_EVENT_OFFSET:
+	case NVSW_REG_EROT_MASK_OFFSET:
+	case NVSW_REG_EROT_ERR_OFFSET:
+	case NVSW_REG_EROT_ERR_EVENT_OFFSET:
+	case NVSW_REG_EROT_ERR_MASK_OFFSET:
+	case NVSW_REG_PWRB_OFFSET:
+	case NVSW_REG_PWRB_EVENT_OFFSET:
+	case NVSW_REG_PWRB_MASK_OFFSET:
+	case NVSW_REG_FRU1_OFFSET:
+	case NVSW_REG_FRU1_EVENT_OFFSET:
+	case NVSW_REG_FRU1_MASK_OFFSET:
+	case NVSW_REG_LEAK_OFFSET:
+	case NVSW_REG_LEAK_EVENT_OFFSET:
+	case NVSW_REG_LEAK_MASK_OFFSET:
+	case NVSW_REG_GP4_RO_OFFSET:
+	case NVSW_REG_GP5_RO_OFFSET:
+	case NVSW_REG_CPLD1_MVER_OFFSET:
+	case NVSW_REG_CPLD2_MVER_OFFSET:
+	case NVSW_REG_CPLD3_MVER_OFFSET:
+	case NVSW_REG_CPLD4_MVER_OFFSET:
+	case NVSW_REG_PWM1_OFFSET:
+	case NVSW_REG_TACHO1_OFFSET:
+	case NVSW_REG_TACHO2_OFFSET:
+	case NVSW_REG_TACHO3_OFFSET:
+	case NVSW_REG_TACHO4_OFFSET:
+	case NVSW_REG_TACHO5_OFFSET:
+	case NVSW_REG_TACHO6_OFFSET:
+	case NVSW_REG_TACHO7_OFFSET:
+	case NVSW_REG_TACHO8_OFFSET:
+	case NVSW_REG_TACHO9_OFFSET:
+	case NVSW_REG_TACHO10_OFFSET:
+	case NVSW_REG_TACHO11_OFFSET:
+	case NVSW_REG_TACHO12_OFFSET:
+	case NVSW_REG_FAN_CAP1_OFFSET:
+	case NVSW_REG_FAN_DRW_CAP_OFFSET:
+	case NVSW_REG_TACHO_SPEED_OFFSET:
+	case NVSW_REG_CONFIG1_OFFSET:
+	case NVSW_REG_CONFIG2_OFFSET:
+	case NVSW_REG_CONFIG3_OFFSET:
+	case NVSW_REG_SPI_CHNL_SELECT:
+	case NVSW_REG_CPLD5_MVER_OFFSET:
+	case NVSW_REG_CPLD9_PN_OFFSET:
+	case NVSW_REG_CPLD9_PN1_OFFSET:
+	case NVSW_REG_CPLD10_VER_OFFSET:
+	case NVSW_REG_WD2_TMR_OFFSET:
+	case NVSW_REG_WD2_TLEFT_OFFSET:
+	case NVSW_REG_WD2_ACT_OFFSET:
+	case NVSW_REG_CPLD7_MVER_OFFSET:
+	case NVSW_REG_CPLD8_MVER_OFFSET:
+	case NVSW_REG_CPLD9_MVER_OFFSET:
+	case NVSW_REG_CPLD10_MVER_OFFSET:
+	case NVSW_REG_CPLD6_MVER_OFFSET:
+	case NVSW_REG_WD3_TMR_OFFSET:
+	case NVSW_REG_WD3_TLEFT_OFFSET:
+	case NVSW_REG_WD3_ACT_OFFSET:
+	case NVSW_REG_MUX0_OFFSET:
+	case NVSW_REG_MUX1_OFFSET:
+	case NVSW_REG_MUX2_OFFSET:
+	case NVSW_REG_UFM_VERSION_OFFSET:
+	case NVSW_REG_SYS_CPBLTY0:
+		return true;
+	}
+	return false;
+}
+
+/* Configuration for the register map of a device with 2 bytes address space. */
+static const struct reg_default nvsw_core_reg_def[] = {
+	{ NVSW_REG_AGGRCO_MASK_OFFSET, GENMASK(1, 0)},
+	{ NVSW_REG_PWM_CONTROL_OFFSET, 0x00 },
+};
+
+static const struct regmap_config nvsw_regmap_i2c_conf = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = NVSW_REG_MAX,
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = nvsw_core_reg_def,
+	.num_reg_defaults = ARRAY_SIZE(nvsw_core_reg_def),
+	.writeable_reg = nvsw_writeable_reg,
+	.readable_reg = nvsw_readable_reg,
+	.volatile_reg = nvsw_volatile_reg,
+};
+
+static int nvsw_core_platform_init(struct nvsw_core *nvsw_core)
+{
+	struct platform_device *pdev;
+	int i, err;
+
+	/* Add registers io access driver. */
+	if (nvsw_core->regio_data) {
+		nvsw_core->regio_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-io",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->regio_data,
+							 sizeof(*nvsw_core->regio_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlxreg-io driver\n");
+			return PTR_ERR(pdev);
+		}
+		nvsw_core->regio = pdev;
+	}
+
+	/* Add FAN driver. */
+	if (nvsw_core->fan_data) {
+		nvsw_core->fan_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-fan",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->fan_data,
+							 sizeof(*nvsw_core->fan_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlxreg-fan driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_regio;
+		}
+		nvsw_core->fan = pdev;
+	}
+
+	/* Add LED driver. */
+	if (nvsw_core->led_data) {
+		nvsw_core->led_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "leds-mlxreg",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->led_data,
+							 sizeof(*nvsw_core->led_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register leds-mlxreg driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_fan;
+		}
+		nvsw_core->led = pdev;
+	}
+
+	/* Add hotplug driver. Hotplug events are reported through the interrupt
+	 * of the I2C device the register map is attached to.
+	 */
+	if (nvsw_core->hotplug_data) {
+		if (!nvsw_core->client || !nvsw_core->client->irq) {
+			dev_err(nvsw_core->dev,
+				"Hotplug requires an I2C device with an interrupt\n");
+			err = -EINVAL;
+			goto err_unregister_led;
+		}
+		nvsw_core->hotplug_data->irq = nvsw_core->client->irq;
+		nvsw_core->hotplug_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-hotplug",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->hotplug_data,
+							 sizeof(*nvsw_core->hotplug_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlxreg-hotplug driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_led;
+		}
+		nvsw_core->hotplug = pdev;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(nvsw_core->wd_data); i++) {
+		if (!nvsw_core->wd_data[i])
+			continue;
+
+		nvsw_core->wd_data[i]->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlx-wdt", i,
+							 NULL, 0, nvsw_core->wd_data[i],
+							 sizeof(*nvsw_core->wd_data[i]));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlx-wdt driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_wd;
+		}
+		nvsw_core->wd[i] = pdev;
+	}
+
+	return 0;
+
+	/* The devices below are optional, so the pointers of those a board
+	 * does not describe stay NULL, which platform_device_unregister()
+	 * accepts.
+	 */
+err_unregister_wd:
+	while (i--)
+		platform_device_unregister(nvsw_core->wd[i]);
+	platform_device_unregister(nvsw_core->hotplug);
+err_unregister_led:
+	platform_device_unregister(nvsw_core->led);
+err_unregister_fan:
+	platform_device_unregister(nvsw_core->fan);
+err_unregister_regio:
+	platform_device_unregister(nvsw_core->regio);
+
+	return err;
+}
+
+static void nvsw_core_platform_exit(struct nvsw_core *nvsw_core)
+{
+	int i;
+
+	for (i = ARRAY_SIZE(nvsw_core->wd) - 1; i >= 0; i--)
+		platform_device_unregister(nvsw_core->wd[i]);
+	platform_device_unregister(nvsw_core->hotplug);
+	platform_device_unregister(nvsw_core->led);
+	platform_device_unregister(nvsw_core->fan);
+	platform_device_unregister(nvsw_core->regio);
+}
+
+static int nvsw_core_mux_topology_init(struct nvsw_core *nvsw_core)
+{
+	if (!nvsw_core->mux_init)
+		return 0;
+
+	return nvsw_core->mux_init(nvsw_core);
+}
+
+static void nvsw_core_mux_topology_exit(struct nvsw_core *nvsw_core)
+{
+	if (nvsw_core->mux_exit)
+		nvsw_core->mux_exit(nvsw_core);
+}
+
+static int nvsw_core_regmap_init(struct nvsw_core *nvsw_core)
+{
+	struct regmap *regmap;
+	int err;
+
+	if (!nvsw_core->client)
+		return -EINVAL;
+
+	regmap = devm_regmap_init_i2c(nvsw_core->client, &nvsw_regmap_i2c_conf);
+	if (IS_ERR(regmap)) {
+		dev_err(nvsw_core->dev, "Failed to create regmap\n");
+		return PTR_ERR(regmap);
+	}
+	nvsw_core->regmap = regmap;
+
+	/* Sync registers with hardware. */
+	regcache_mark_dirty(nvsw_core->regmap);
+	err = regcache_sync(nvsw_core->regmap);
+	if (err) {
+		dev_err(nvsw_core->dev, "Failed to sync regmap\n");
+		return err;
+	}
+
+	/* Set registers default values. */
+	if (nvsw_core->set_reg_default) {
+		err = nvsw_core->set_reg_default(nvsw_core->regmap);
+		if (err) {
+			dev_err(nvsw_core->dev, "Failed to set default regmap\n");
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+int nvsw_core_init(struct nvsw_core *nvsw_core)
+{
+	int err;
+
+	err = nvsw_core_regmap_init(nvsw_core);
+	if (err)
+		return err;
+
+	err = nvsw_core_mux_topology_init(nvsw_core);
+	if (err)
+		goto nvsw_core_mux_topology_init_fail;
+
+	err = nvsw_core_platform_init(nvsw_core);
+	if (err)
+		goto nvsw_core_platform_init_fail;
+
+	return 0;
+nvsw_core_platform_init_fail:
+	nvsw_core_mux_topology_exit(nvsw_core);
+nvsw_core_mux_topology_init_fail:
+	return err;
+}
+EXPORT_SYMBOL_NS_GPL(nvsw_core_init, "NVSW");
+
+void nvsw_core_exit(struct nvsw_core *nvsw_core)
+{
+	nvsw_core_platform_exit(nvsw_core);
+	nvsw_core_mux_topology_exit(nvsw_core);
+	if (nvsw_core->set_reg_default)
+		nvsw_core->set_reg_default(nvsw_core->regmap);
+}
+EXPORT_SYMBOL_NS_GPL(nvsw_core_exit, "NVSW");
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
+MODULE_DESCRIPTION("Nvidia platform core driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/platform/mellanox/nvsw.h b/drivers/platform/mellanox/nvsw.h
new file mode 100644
index 000000000000..88b16d0a36d4
--- /dev/null
+++ b/drivers/platform/mellanox/nvsw.h
@@ -0,0 +1,297 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+ *
+ * Nvidia switch platform driver
+ *
+ * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
+ */
+
+#ifndef __NVSW_H__
+#define __NVSW_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct device;
+struct i2c_client;
+struct mlxreg_core_hotplug_platform_data;
+struct mlxreg_core_platform_data;
+struct platform_device;
+struct regmap;
+
+/* I2C bus IO offsets */
+#define NVSW_REG_CPLD1_VER_OFFSET	0x2500
+#define NVSW_REG_CPLD2_VER_OFFSET	0x2501
+#define NVSW_REG_CPLD3_VER_OFFSET	0x2502
+#define NVSW_REG_CPLD4_VER_OFFSET	0x2503
+#define NVSW_REG_CPLD1_PN_OFFSET	0x2504
+#define NVSW_REG_CPLD1_PN1_OFFSET	0x2505
+#define NVSW_REG_CPLD2_PN_OFFSET	0x2506
+#define NVSW_REG_CPLD2_PN1_OFFSET	0x2507
+#define NVSW_REG_CPLD3_PN_OFFSET	0x2508
+#define NVSW_REG_CPLD3_PN1_OFFSET	0x2509
+#define NVSW_REG_CPLD4_PN_OFFSET	0x250a
+#define NVSW_REG_CPLD4_PN1_OFFSET	0x250b
+#define NVSW_REG_CPLD1_DBG_LED_OFFSET	0x250c
+#define NVSW_REG_CPLD2_DBG_LED_OFFSET	0x250d
+#define NVSW_REG_CPLD3_DBG_LED_OFFSET	0x250e
+#define NVSW_REG_CPLD4_DBG_LED_OFFSET	0x250f
+#define NVSW_REG_CPLD7_VER_OFFSET	0x2510
+#define NVSW_REG_PG1_OFFSET		0x2511
+#define NVSW_REG_PG1_EVENT_OFFSET	0x2512
+#define NVSW_REG_PG1_MASK_OFFSET	0x2513
+#define NVSW_REG_PG2_OFFSET		0x2514
+#define NVSW_REG_PG2_EVENT_OFFSET	0x2515
+#define NVSW_REG_PG2_MASK_OFFSET	0x2516
+#define NVSW_REG_RESET_GP1_OFFSET	0x2517
+#define NVSW_REG_RESET_GP2_OFFSET	0x2519
+#define NVSW_REG_RESET_CAUSE_OFFSET	0x251d
+#define NVSW_REG_RESET_CAUSE1_OFFSET	0x251e
+#define NVSW_REG_RESET_CAUSE2_OFFSET	0x251f
+#define NVSW_REG_LED1_OFFSET		0x2520
+#define NVSW_REG_LED5_OFFSET		0x2524
+#define NVSW_REG_LED6_OFFSET		0x2525
+#define NVSW_REG_LED7_OFFSET		0x2526
+#define NVSW_REG_CPLD7_PN_OFFSET	0x2528
+#define NVSW_REG_CPLD7_PN1_OFFSET	0x2529
+#define NVSW_REG_GP0_RO_OFFSET		0x252a
+#define NVSW_REG_GP2_RO_OFFSET		0x252b
+#define NVSW_REG_GP1_RO_OFFSET		0x252c
+#define NVSW_REG_GPCOM0_OFFSET		0x252d
+#define NVSW_REG_GP0_OFFSET		0x252e
+#define NVSW_REG_GP7_OFFSET		0x252f
+#define NVSW_REG_GP1_OFFSET		0x2530
+#define NVSW_REG_UART_BAUD_OFFSET	0x2531
+#define NVSW_REG_GP4_OFFSET		0x2532
+#define NVSW_REG_GP5_RO_OFFSET		0x2533
+#define NVSW_REG_FIELD_UPGRADE		0x2534
+#define NVSW_REG_SAFE_BIOS_OFFSET	0x2535
+#define NVSW_REG_PWM_CONTROL_OFFSET	0x2537
+#define NVSW_REG_GP5_OFFSET		0x2538
+#define NVSW_REG_GP6_OFFSET		0x2539
+#define NVSW_REG_AGGR_OFFSET		0x253a
+#define NVSW_REG_AGGR_MASK_OFFSET	0x253b
+#define NVSW_REG_FU_CAP_OFFSET		0x253c
+#define NVSW_REG_BRD4_OFFSET		0x253d
+#define NVSW_REG_BRD4_EVENT_OFFSET	0x253e
+#define NVSW_REG_BRD4_MASK_OFFSET	0x253f
+#define NVSW_REG_AGGRLO_OFFSET		0x2540
+#define NVSW_REG_AGGRLO_MASK_OFFSET	0x2541
+#define NVSW_REG_AGGRCO_OFFSET		0x2542
+#define NVSW_REG_AGGRCO_MASK_OFFSET	0x2543
+#define NVSW_REG_BRD1_OFFSET		0x2547
+#define NVSW_REG_BRD1_EVENT_OFFSET	0x2548
+#define NVSW_REG_BRD1_MASK_OFFSET	0x2549
+#define NVSW_REG_BRD2_OFFSET		0x254a
+#define NVSW_REG_BRD2_EVENT_OFFSET	0x254b
+#define NVSW_REG_BRD2_MASK_OFFSET	0x254c
+#define NVSW_REG_HEALTH_OFFSET		0x254d
+#define NVSW_REG_HEALTH_EVENT_OFFSET	0x254e
+#define NVSW_REG_HEALTH_MASK_OFFSET	0x254f
+#define NVSW_REG_ASIC1_HEALTH_OFFSET	0x2550
+#define NVSW_REG_ASIC1_EVENT_OFFSET	0x2551
+#define NVSW_REG_ASIC1_MASK_OFFSET	0x2552
+#define NVSW_REG_ASIC2_HEALTH_OFFSET	0x2553
+#define NVSW_REG_ASIC2_EVENT_OFFSET	0x2554
+#define NVSW_REG_ASIC2_MASK_OFFSET	0x2555
+#define NVSW_REG_VR1_ALERT_OFFSET	0x2558
+#define NVSW_REG_VR1_ALERT_EVENT_OFFSET	0x2559
+#define NVSW_REG_VR1_ALERT_MASK_OFFSET	0x255a
+#define NVSW_REG_VR2_ALERT_OFFSET	0x255e
+#define NVSW_REG_VR2_ALERT_EVENT_OFFSET	0x255f
+#define NVSW_REG_VR2_ALERT_MASK_OFFSET	0x2560
+#define NVSW_REG_PS_DC_OK_OFFSET	0x2567
+#define NVSW_REG_PS_DC_OK_EVENT_OFFSET	0x2568
+#define NVSW_REG_PS_DC_OK_MASK_OFFSET	0x2569
+#define NVSW_REG_CPLD8_PN_OFFSET	0x2573
+#define NVSW_REG_CPLD8_PN1_OFFSET	0x2574
+#define NVSW_REG_PG3_OFFSET		0x2576
+#define NVSW_REG_PG3_EVENT_OFFSET	0x2577
+#define NVSW_REG_PG3_MASK_OFFSET	0x2578
+#define NVSW_REG_PG4_OFFSET		0x2579
+#define NVSW_REG_PG4_EVENT_OFFSET	0x257a
+#define NVSW_REG_PG4_MASK_OFFSET	0x257b
+#define NVSW_REG_CPLD6_VER_OFFSET	0x257c
+#define NVSW_REG_CPLD6_PN_OFFSET	0x257d
+#define NVSW_REG_CPLD6_PN1_OFFSET	0x257e
+#define NVSW_REG_CPLD10_PN_OFFSET	0x2580
+#define NVSW_REG_CPLD10_PN1_OFFSET	0x2581
+#define NVSW_REG_ASIC3_HEALTH_OFFSET	0x2582
+#define NVSW_REG_ASIC3_EVENT_OFFSET	0x2583
+#define NVSW_REG_ASIC3_MASK_OFFSET	0x2584
+#define NVSW_REG_ASIC4_HEALTH_OFFSET	0x2585
+#define NVSW_REG_ASIC4_EVENT_OFFSET	0x2586
+#define NVSW_REG_ASIC4_MASK_OFFSET	0x2587
+#define NVSW_REG_FAN_OFFSET		0x2588
+#define NVSW_REG_FAN_EVENT_OFFSET	0x2589
+#define NVSW_REG_FAN_MASK_OFFSET	0x258a
+#define NVSW_REG_CPLD5_VER_OFFSET	0x258e
+#define NVSW_REG_CPLD5_PN_OFFSET	0x258f
+#define NVSW_REG_CPLD5_PN1_OFFSET	0x2590
+#define NVSW_REG_EROT_OFFSET		0x2591
+#define NVSW_REG_EROT_EVENT_OFFSET	0x2592
+#define NVSW_REG_EROT_MASK_OFFSET	0x2593
+#define NVSW_REG_EROT_ERR_OFFSET	0x2594
+#define NVSW_REG_EROT_ERR_EVENT_OFFSET	0x2595
+#define NVSW_REG_EROT_ERR_MASK_OFFSET	0x2596
+#define NVSW_REG_PWRB_OFFSET		0x2597
+#define NVSW_REG_PWRB_EVENT_OFFSET	0x2598
+#define NVSW_REG_PWRB_MASK_OFFSET	0x2599
+#define NVSW_REG_FRU1_OFFSET		0x25ac
+#define NVSW_REG_FRU1_EVENT_OFFSET	0x25ad
+#define NVSW_REG_FRU1_MASK_OFFSET	0x25ae
+#define NVSW_REG_LEAK_OFFSET		0x25af
+#define NVSW_REG_LEAK_EVENT_OFFSET	0x25b0
+#define NVSW_REG_LEAK_MASK_OFFSET	0x25b1
+#define NVSW_REG_CURRENT_TEMP_RO	0x25c0
+#define NVSW_REG_SWITCH_IC_QTY		0x25c1
+#define NVSW_REG_GP4_RO_OFFSET		0x25c2
+#define NVSW_REG_SPI_CHNL_SELECT	0x25c3
+#define NVSW_REG_CPLD5_MVER_OFFSET	0x25c4
+#define NVSW_REG_CPLD8_VER_OFFSET	0x25c8
+#define NVSW_REG_CPLD9_VER_OFFSET	0x25c9
+#define NVSW_REG_CPLD10_VER_OFFSET	0x25ca
+#define NVSW_REG_CPLD9_PN_OFFSET	0x25cb
+#define NVSW_REG_CPLD9_PN1_OFFSET	0x25cc
+#define NVSW_REG_WD2_TMR_OFFSET		0x25cd
+#define NVSW_REG_WD2_TLEFT_OFFSET	0x25ce
+#define NVSW_REG_WD2_ACT_OFFSET		0x25cf
+#define NVSW_REG_WD3_TMR_OFFSET		0x25d1
+#define NVSW_REG_WD3_TLEFT_OFFSET	0x25d2
+#define NVSW_REG_WD3_ACT_OFFSET		0x25d3
+#define NVSW_REG_CPLD7_MVER_OFFSET	0x25d5
+#define NVSW_REG_CPLD8_MVER_OFFSET	0x25d6
+#define NVSW_REG_CPLD9_MVER_OFFSET	0x25d7
+#define NVSW_REG_CPLD10_MVER_OFFSET	0x25d8
+#define NVSW_REG_CPLD6_MVER_OFFSET	0x25d9
+#define NVSW_REG_MUX0_OFFSET		0x25da
+#define NVSW_REG_MUX1_OFFSET		0x25db
+#define NVSW_REG_MUX2_OFFSET		0x25dc
+#define NVSW_REG_CPLD1_MVER_OFFSET	0x25de
+#define NVSW_REG_CPLD2_MVER_OFFSET	0x25df
+#define NVSW_REG_CPLD3_MVER_OFFSET	0x25e0
+#define NVSW_REG_CPLD4_MVER_OFFSET	0x25e1
+#define NVSW_REG_UFM_VERSION_OFFSET	0x25e2
+#define NVSW_REG_PWM1_OFFSET		0x25e3
+#define NVSW_REG_TACHO1_OFFSET		0x25e4
+#define NVSW_REG_TACHO2_OFFSET		0x25e5
+#define NVSW_REG_TACHO3_OFFSET		0x25e6
+#define NVSW_REG_TACHO4_OFFSET		0x25e7
+#define NVSW_REG_TACHO5_OFFSET		0x25e8
+#define NVSW_REG_TACHO6_OFFSET		0x25e9
+#define NVSW_REG_TACHO7_OFFSET		0x25eb
+#define NVSW_REG_TACHO8_OFFSET		0x25ec
+#define NVSW_REG_TACHO9_OFFSET		0x25ed
+#define NVSW_REG_TACHO10_OFFSET		0x25ee
+#define NVSW_REG_TACHO11_OFFSET		0x25ef
+#define NVSW_REG_TACHO12_OFFSET		0x25f0
+#define NVSW_REG_FAN_CAP1_OFFSET	0x25f5
+#define NVSW_REG_FAN_DRW_CAP_OFFSET	0x25f7
+#define NVSW_REG_TACHO_SPEED_OFFSET	0x25f8
+#define NVSW_REG_SYS_CPBLTY0		0x25f9
+#define NVSW_REG_CONFIG1_OFFSET		0x25fb
+#define NVSW_REG_CONFIG2_OFFSET		0x25fc
+#define NVSW_REG_CONFIG3_OFFSET		0x25fd
+#define NVSW_REG_MIN			0x2500
+#define NVSW_REG_MAX			0x26ff
+
+#define NVSW_AGGR_MASK_COMEX		BIT(0)
+#define NVSW_LOW_AGGR_MASK_I2C		BIT(6)
+#define NVSW_AGGR_MASK			BIT(2)
+#define NVSW_LOW_AGGR_MASK_LOW		0xe0
+#define NVSW_REG_FRU1_MASK		GENMASK(3, 0)
+#define NVSW_LEAK_MASK			GENMASK(5, 0)
+#define NVSW_SSD_I2C_ALERT_MASK		BIT(0)
+#define NVSW_WD_EXP_MASK		BIT(1)
+#define NVSW_5V_USB_MASK		BIT(2)
+#define NVSW_PCB_TEMP1_MASK		BIT(3)
+#define NVSW_PCB_TEMP2_MASK		BIT(4)
+#define NVSW_SGMII_MASK			BIT(5)
+#define NVSW_SDD_PG_MASK		BIT(6)
+#define NVSW_LEAK_AGGR_MASK		BIT(7)
+#define NVSW_EROT_MASK			GENMASK(2, 0)
+#define NVSW_FAN_NG_MASK		GENMASK(6, 0)
+#define NVSW_ASIC_MASK			GENMASK(1, 0)
+#define NVSW_ASIC2_MASK			GENMASK(3, 2)
+#define NVSW_ASIC3_MASK			GENMASK(5, 4)
+#define NVSW_ASIC4_MASK			GENMASK(7, 6)
+#define NVSW_ASICS_MASK			GENMASK(7, 0)
+#define NVSW_LOW_AGGR_MASK_ASIC1	BIT(0)
+#define NVSW_LOW_AGGR_MASK_ASIC2	BIT(1)
+#define NVSW_LOW_AGGR_MASK_ASIC3	BIT(2)
+#define NVSW_PWR_BUTTON_MASK		BIT(0)
+#define NVSW_AMB_TEMP_SENSE_MASK	BIT(1)
+#define NVSW_GRACEFUL_POWER_OFF_MASK	BIT(2)
+#define NVSW_CPU_POWER_OFF_READY_MASK	BIT(3)
+#define NVSW_CPU_RESET_MASK		BIT(4)
+#define NVSW_APML_SMB_ALERT_MASK	BIT(5)
+#define NVSW_CPU_UNEXP_POWER_OFF_MASK	BIT(6)
+#define NVSW_UID_PUSH_BUTTON_MASK	BIT(7)
+#define NVSW_RTC_MASK			BIT(0)
+#define NVSW_HOT_SWAP_ALERT_MASK	BIT(1)
+#define NVSW_LED_LO_NIBBLE_MASK		GENMASK(7, 4)
+#define NVSW_LED_HI_NIBBLE_MASK		GENMASK(3, 0)
+#define NVSW_UART_SEL_MASK		GENMASK(7, 6)
+#define NVSW_UART_BAUD_MASK		GENMASK(3, 0)
+#define NVSW_BIOS_STATUS_MASK		GENMASK(3, 1)
+#define NVSW_REG_RESET_MASK		BIT(1)
+#define NVSW_MASTER_MASK		BIT(5)
+#define NVSW_FU_CAP_MASK		GENMASK(1, 0)
+#define NVSW_WD_RESET_ACT_MASK		GENMASK(7, 1)
+#define NVSW_WD_FAN_ACT_MASK		(GENMASK(7, 0) & ~BIT(4))
+#define NVSW_WD_TYPE2_TO_MASK		0
+#define NVSW_WD3_DFLT_TIMEOUT		600
+#define NVSW_I2C_CAP_BIT		0x04
+#define NVSW_I2C_CAP_MASK		GENMASK(5, NVSW_I2C_CAP_BIT)
+#define NVSW_I2C_TRAN_END_L		BIT(5)
+
+#define NVSW_NR_NONE			-1
+#define NVSW_MUX_MAX			2
+#define NVSW_WD_MAX			2
+
+/**
+ * struct nvsw_core - device private data
+ * @dev: device;
+ * @client: I2C client device;
+ * @regmap: device register map;
+ * @regio_data: register access platform data;
+ * @regio: register access device;
+ * @hotplug_data: hotplug platform data;
+ * @hotplug: hotplug device;
+ * @led: led device;
+ * @led_data: led platform data;
+ * @fan: fan device;
+ * @fan_data: fan platform data;
+ * @wd: watchdog devices;
+ * @wd_data: watchdog platform data;
+ * @set_reg_default: set default registers callback;
+ * @mux_init: mux initialization callback;
+ * @mux_exit: mux de-initialization callback;
+ * @mux: mux devices;
+ * @mux_num: number of mux devices;
+ */
+struct nvsw_core {
+	struct device *dev;
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct mlxreg_core_platform_data *regio_data;
+	struct platform_device *regio;
+	struct mlxreg_core_hotplug_platform_data *hotplug_data;
+	struct platform_device *hotplug;
+	struct platform_device *led;
+	struct mlxreg_core_platform_data *led_data;
+	struct platform_device *fan;
+	struct mlxreg_core_platform_data *fan_data;
+	struct platform_device *wd[NVSW_WD_MAX];
+	struct mlxreg_core_platform_data *wd_data[NVSW_WD_MAX];
+	int (*set_reg_default)(struct regmap *regmap);
+	int (*mux_init)(struct nvsw_core *nvsw_core);
+	void (*mux_exit)(struct nvsw_core *nvsw_core);
+	struct platform_device *mux[NVSW_MUX_MAX];
+	u32 mux_num;
+};
+
+/* Platform core init/exit functions. */
+int nvsw_core_init(struct nvsw_core *nvsw_core);
+void nvsw_core_exit(struct nvsw_core *nvsw_core);
+
+#endif /* !defined(__NVSW_H__) */

-- 
2.34.1

