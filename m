Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517343;
	b=MIHOMLbHdQMutSG1XHvU5Juk/TynPvp4Bd6FSjSYC4iU8O7q2ms0vD/lzONLzexX+3c0
	 YGNQ5LZZt0iCCwLFAqQIobmHRXoNsuy90BTim6P1dJWNdXXESAnfJMiRFQosxmTbwuoxH
	 VQ+hRpE/vxT9vdGwJ5VEDOYpqiEni4Mdy+RtLX8YWpVnocP0KaK0l5DDaVq/JJPp+DXGx
	 ZKpbuElmw0qht+D2AMpL9FJm8O+VdSVamwIGFofDYqePYRstMOFaIR61/aEl605AIG7ty
	 AK3+mZZMnxHQJvp60QvO9wbLgN9nkFi9vG5G96pN9YpkUjoAfURXUzfuFBic69b47/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517343;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8d3a+p9WTeDJugwFJBTigdsBrdrPivhONCXyKa3PLJo=;
	b=acCRt2P+LSUnUoJfPzlPixeTqqKR7BEqkLSimYEf+A7sAn0prgT+HMFv9km3QlTwm9Qq
	 GP99HX8YDaMgK+ZnPtFBXvlH2OI8NFDQVgDH1GMfmEdk8v7g9vFQEYxDLt3tLa/2IOtj8
	 k1G74g16aRUOdK42YoAk89nU2RBSnSC6TKtumhKWsniYRphZrChIzc7HiB5rXN4puafVT
	 rto7mIGFTGNJMhZa+MyV/6jYLOw8nPdZ8T1oLMCdAKQksVMDGQ1tyyCYsVef9VCqGNrE/
	 vpfmqeiNszY7+4SFE/p9yMBz889fOvnWvGpRCt5D2LLWxmLuUQuz7+Z9/kBGssHqZ8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AX2BgRyF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.62
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2A606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 17:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C2A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AX2BgRyF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPViaUU8lW6/ajSuLnecc7bJoLPmPC2fVnKtWNn2D2gF6Fkth94fBMMOvuJ9oEg2GGUCacw3x9lrP37qKlY8Pmy4RkXAzQOFNQ3gNmEs1lhVu7DxEA2elaHORcZVPCvgEMz+9KYOHGNnKwzMCzCiW/qt7I1frrYwJq89UyEzsve5wy8phj6L3h+z417xU5rPVa+HxPZVus8uIyWmbmb+NEzy0+BbIWfEyVIJDLIDEQ3jkl81E6pPlP1CeCWj6LOFj6KPwpghc5bZgqQYlh8E63X/4DE47lOF599bQ87yyWF4uU6qQRZWMVZK4YJGbpSG9Lq9ZonYZeSPn8xEyL747g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d3a+p9WTeDJugwFJBTigdsBrdrPivhONCXyKa3PLJo=;
 b=LneSv4BSBbnykuGSFWNAyDTVh/lbsQEhYO03bAnk3//EuCWMSFduNlh28jcY/I1Jq2kEUXHYAAqitwl7fkY0qWaK4pq57FxwOHxQlnAuB9kAkKJ05ye7wRyt58rRsxgzclMvSmYSExL/DZdBPM6/bympb/jAL0MHFe7goDmcZi4XmI9UEhVINXr1aJs9N+KFC0AFnW8e75mj1GrqVxByVbb/YJ93i3th0eevKktNUijEUdAZqvozNrqe7FknpjGJrY4xWCTCNqilul7d5SA43wAKVnkY0s/QmJquWVB/Hxm0w6JFBrhrJI7RAbNdOh6cMigHioYyKLG7DtqyYzAY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8d3a+p9WTeDJugwFJBTigdsBrdrPivhONCXyKa3PLJo=;
 b=AX2BgRyFEC3G4I5walyts+luZNgMvsyiv8Ik8eDOKalFK9sfIzm1YsoN+/4BhMs8KgFwv6qjDsNWha17d92yFTt9I1K+7FBKjDFCe4wLTm/EthAJUvntQIVpO2ST+DRdXiOIliKY+8UjlseeuNK0jw4ifLOBp8y0GU7SLRIJ1qKVXGPbxJKFFX0010yGUGEF/IU0hqSO6S6fQJOdvXAkmTe/EnV2qwbKJyglx0iCVygngZ/tEAK+qCKMFyB5IPu40eEM2MaNT+0e5iRfHKmqa5tYdLFIHS+BmOENKaHfowRM1sK1vt/xlRKkq9Ind61HYO1+xT7++occfH25+3r4dg==
Received: from BLAPR05CA0040.namprd05.prod.outlook.com (2603:10b6:208:335::21)
 by MW4PR12MB6826.namprd12.prod.outlook.com (2603:10b6:303:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 17:28:52 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:208:335:cafe::10) by BLAPR05CA0040.outlook.office365.com
 (2603:10b6:208:335::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.14 via Frontend Transport; Tue,
 20 Oct 2026 17:28:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 17:28:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 10:28:23 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 10:28:21 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v3 1/3] platform/mellanox: nvsw-core: Add core driver for Nvidia switches
Date: Tue, 20 Oct 2026 20:27:54 +0300
Message-ID: <20261020172756.4160946-2-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020172756.4160946-1-fradensky@nvidia.com>
References: <20261020172756.4160946-1-fradensky@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|MW4PR12MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c80782-bb6b-4fba-ea74-08df2ecf9b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|56012099006|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Qe3Se7LbCwq905qVYztD//xKx54ic1/r+p5PfkfRTcsQLVqw5ZRO1hY/nxlKhIRinMhfz/b5zBAc/fqel0v5hCHOMDjPhKTGVbhONNSqSHb9n1w10sklqLO6Mwvlp9K3X88MYse9wVlve6lOSKfCRVL8rS/ES1XbhYyenD6ccHNPdvjU9dErSku4L4FZu93unOQiBxdXBRrg/704qdIl5lWcDtL6ZC6FMWojiP5kRLAE4g0++ZCL4Kb+wkEd4yK4kuxC0YmA82KJAg9QK29Krm2Qn0CJhnVihgR3btFFJFpvmfGx8YnfmURWdOToCKD1kB4BThuQlMJCaVjdeijIRIPNhY0JejZuDaupAmwvdmKlqP2KuY7DYP2cdqvJB5cV7koY1gSSvjGwGHem2GruznjTajDjkSjnWROG5irirVleJvMpmFfAcTSzOSOSA8F+1fOS2z80PtHi8N39cNuilpzuQP0/lNF8mOjRqzmZp3LqLSvRyPY8Nf30O22UVcOeITe9zo0OEVvemQ8yvZAjlVAu/eFRSNWIyA+LzKwiuDYOSnLtCmXWN73vTR2EQx4DEnaPANa7Mykh3/pWj8N43ypJU13+P/cMI83O85Tg7Mz1Bx13oTp07jub11HIgHXumazt6QkDc5cHcDho84SpyP8524SPeIBDDiCWuaJZ7TkUhHZKh97Sk1j87K/R2eJxKCnlKyw2hCDFhUOMCIlEGw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VfQ2qT3ru4hwLFV8ZaMeXbA3O7jl47BnXpLIIHOuJB0DZQzloAVEIQtPrjK2fdIhqaRU0zzp0e7cNz1UFzMD4rWIYX8aOnb4ENG5fnLlrtVlht0Vvgn2XQKY0qV9q+MEsPiZF41uLyCD3kDZzCq/FkRlJ8z9LMVohm0O4z/P4Feo13Wn+TzQU+7DZ+enEHhnj3d1F8oKc3FyPjIMHrLHRrGLWr6yej11TfNDid4xZxlov06vmblpp8S2Py1R09ni2KhQoOCnd4xuKjYvjKd9rgXbzJu14nDxQ3YTazgOlUodC9cGooD6ZfjHixnw3Lxtbbd9Rr0de5fPpnW7rHDmP/jA4LStQIw55sE32Id/lYJSPXgrs19LRjec0/A06VmgHBBKq6mTJsciTps4aVaNGFH+Tt2Hao2xyrkF86P5B7hV5rgHh+5lZXrZNvPdLDYP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 17:28:50.8691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c80782-bb6b-4fba-ea74-08df2ecf9b73
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6826

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

v2->v3
Comments pointed out by Ilpo:
- Return directly from nvsw_core_init() when
  nvsw_core_mux_topology_init() fails, instead of jumping to a label
  that only does a return.
Issues reported by the sashiko.dev review:
- Drop nvsw_core_reg_def. The review pointed out that it was unsorted
  and that its entries never reached the hardware. Neither register
  is relevant on SPC6, so the array is removed rather than fixed,
  which leaves .cache_type, .reg_defaults, .num_reg_defaults and the
  regcache_mark_dirty()/regcache_sync() pair with nothing to do.
- As a consequence linux/bits.h is no longer included here. The
  GENMASK in the dropped array was its only user in this file.
Additional fixes added by Felix:
- Drop NVSW_REG_FU_CAP_OFFSET from nvsw_writeable_reg(). The register
  is read only in hardware, and the only attribute described over it,
  jtag_cap, is 0444, so nothing could reach the write path. Found by
  checking every register in nvsw_writeable_reg() against the CPLD
  register map; it is the only mismatch.
- Rename the remaining nvsw_core_platform_init_fail label to
  err_mux_topology_exit, matching the err_* labels used elsewhere in
  the file.

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
 drivers/platform/mellanox/nvsw-core.c | 669 ++++++++++++++++++++++++++
 drivers/platform/mellanox/nvsw.h      | 297 ++++++++++++
 4 files changed, 976 insertions(+)
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
index 000000000000..8283a2af0f02
--- /dev/null
+++ b/drivers/platform/mellanox/nvsw-core.c
@@ -0,0 +1,669 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Nvidia switch platform driver
+ *
+ * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
+ */
+
+#include <linux/array_size.h>
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
+static const struct regmap_config nvsw_regmap_i2c_conf = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = NVSW_REG_MAX,
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
+		return err;
+
+	err = nvsw_core_platform_init(nvsw_core);
+	if (err)
+		goto err_mux_topology_exit;
+
+	return 0;
+
+err_mux_topology_exit:
+	nvsw_core_mux_topology_exit(nvsw_core);
+
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

