Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517338;
	b=17xw4edKJi41gjLnJFLri6P5zw4GxfOnm13q0sNP3w46w9XRWc594zvzLSY0Cc5Q78nt
	 kMmihj/zzd+CfM450Gb1Dhk5Mclfk6auqsE8KaE4H5F8vhAWXa+98JGUcAgk+avGL5luT
	 kQ6JuBMxLbaXjkAKnG4DplIcsYBgRNeZz3KwHaGjVwCtqgDpHmSNTGDOnROkaV75nS3ur
	 vxap+g+ExoTGMpRc8vatmsRvSLXpSnauWZvdTxKyMQWHtGXgb8WliWe1Dgw+4DUQ7Eest
	 1U07MDkL/fmaB64KZDc/awI7NN5/Xp1/Jdrz61GcVpysQAMpB+F5vjaylMy1aq73sqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517338;
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
	bh=vJRkntpiIgqjHXemTmqHX4HtAlOT12Ftjb0EbK4fOeI=;
	b=4KZh13H8vM/zSGxQe+NPQ7UmDXvedAH1d3p06YUykDBH8oBwwlYhm3ELpEW2SQVsHN64
	 vTxqQRTjmuYNsUpteyej0oTBojHq3s5o37feIgveP5KtC59//chcf96JPzFMHev4g0ZtY
	 sbf2PPGJxDGupMuQfdtwtz3XGqcjsBm8MnDPimrC6jhNHXMHcwXzk55cG7xe0/0SeQkIe
	 SrWszz0gR5odK/5/Hxu/Lj+UFKOGyDqohQDIWG8yebOXTBcYIPZN4H73MgAGrRWdJLhev
	 hTiC4Wn0Oh3L/GSrKoC8pTuhFsU0Kz7/k/BZak5LyIwFp3U+aEdLDdQKGRkxOk9Lqew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Z/rvHbxB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.37
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D2606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 17:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 774D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z/rvHbxB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7wH7CLkrkiP3NYePx2qXakMLla+R/XvaFUJaREjpRtRPvjd78ZMbXsSBlXYZ0PeetI705X3tu36t2MIsXgcexWfhkSjTlQVau+jHqbeIAVioGRN6qUk8j5Tyj/ouxJwvTUKXoI5uqAbC9brgAAnMQpNFMrPiNGggrHpxQ8AnuiT8sVC1QGIFN5eei6FI6bV1OXye7HWLwBcwkgUNATxL2N+U0wTwaJn90IrICE0ZTmrJ7jmIu3lzujXjTNd8guTKgfZuUnm8KRcopT9vKnv5aCz9ovOsHxah0KR1VlGOUfZFRTZj4E2OKer6FTq7i+1NAurh/D6occey2gdsFRPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJRkntpiIgqjHXemTmqHX4HtAlOT12Ftjb0EbK4fOeI=;
 b=QOtQ7SxCPBEMpLMvhSrcfQvA2NgKj4v6HR7VqDsMHDX2MsENkOhmg6jj+pCIK1CCjkWZpxgb2gEjMoa/BqUCM5nEkFVyqIPUxllDK+a8kM+/BFWoGAzAYeUE6Sqh1P/D7AMxMjgfYdwFbMj2DuZoUAMMOMAHN7NiJBlYUDFPMK9M0Pvj2mOxILDRQ5/VFfvg0wHG0o8aJriHy0UW3VsVHa3a4UXa8PHEkGhvCDVEFHzLvk9Ju2j7jIIAeSAMOSTzwMGEOZTnmFLbGIBtg+Prf6IsnCZyN5m/wSOSh/k0/KPYZWK/AdYYSOJvei5ENirWfgXBM+4eTvsKkXpjJvAMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJRkntpiIgqjHXemTmqHX4HtAlOT12Ftjb0EbK4fOeI=;
 b=Z/rvHbxBorNUbfy2e+56gPZCj3UVYN76s35l4E5vG6j3UVkkYg6JaDQVckqcgKWJrW5QgbSOBSGzTsUbZYRX8KNcvRGxM4XWEBrRWEScWjSNJC1He14pHinetNBvmyPSGNygl9EZn3zkOhvDlWA5pymFIp/oA5olJHIAsXMIhVrMoEcaZcfEbml9SNGUTUFX0OnbeapP6G4fBLXw1aFiRHLwgLTek68BTtqNmuA1UPxU47LuboROijvnchgM1qgaoCvk7DxiVhpemghUc7SJgY7pfMhyj5ogDd8NiAGdc4vEy503pAK1ztT/iphScedmyvbOOGxZ23QEZgaqnw6ZKQ==
Received: from BN9PR03CA0965.namprd03.prod.outlook.com (2603:10b6:408:109::10)
 by CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 17:28:52 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:109:cafe::8b) by BN9PR03CA0965.outlook.office365.com
 (2603:10b6:408:109::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Tue,
 20 Oct 2026 17:28:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 17:28:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 10:28:27 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 10:28:25 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v3 2/3] platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
Date: Tue, 20 Oct 2026 20:27:55 +0300
Message-ID: <20261020172756.4160946-3-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|CY8PR12MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c93c2ae-2f8e-48c3-5da3-08df2ecf9bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	pQf2TwQkxihiPr4+798iw6V+pe7zlo1L6uVLw0Yx+hlzVP5MMGu+gMf7zn2cEQUrjeCftvd5z3kFEa2KvjAbcc21Yqu7nf1zlDewnZSi739RWGbHDcK5A4BsOR9n4ruyPhHlOXCDhO95Gz9qTUf4PnZ3V93ZOEZUhau2x5QUGQUcZCb3Aw1Lbih1q6nfQdZwPtw2g9WaFgJaslENsl0Wgqd1SbAC0ceIi3xgq7EIFYSBW2FJsWh+7dZP3IcfsXD5mElYdmiSxIG+/dWTBZUlEChCwOY29OANI1We5l/3w7Pxc838lIqOMhrwVVYwQh93O+//YbwJtDq5PHD0YkO/LihIV/ujRRRmlYcfIZ+tzeea/80QmFA2su00oN8ISpFB4E6jWjkwfdeiU7W1v3OZbKYPpcbTsCjd3cx4Qcx/Jykkc7JSLZwDz6BMoQ9xhakn0JO4hrLT+AwngAAFGr5AiIXLHwIbDJxx7E0TCYy320CbNIek7ofLUIaZtvOpstWzgsnOXmq2Ti3XrFKIuec4vsUo++hqdMUvL89rFuZx7CcWBDJpsURgpTD02oDmkGQWUADLA/DzLWwtW6dCkSRd5NUzMTwnmAtBCTcaiag21Z6AS6wP1wP59e4fkI4Bt+6A9WkgYzX5vFjgOS6FTzedaVeMEY9SMziLNAWatIOQfmcdZa01ry4ZpW5VQYjHzA19qoLSAFh/mGYHt2k11QrZPQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KsEFQMXUKZZt+yLyfbMUZsou1B9OuEmEcKCxhEDBYGggIDjUBs/BemOA5+PUkHHmIGAttjCBFkkKMdMcDSEbS3DFAEv3fvBjx/MOVLtPzbIyftO6kD4dDMglqv3ix++idBrVMY7ykgOrqgqa3RbmAmCqPly6aFc9TiCgWcoWN6tYaSBVK1k6BUU7rmWIoptr8PTnw4WYO0xZ1eUSEdC2+b2LTXwLG6BEgkLSPE/GUkB1IlOF3HrJhWcRgkjAI1z8l1L61KB09MZcbrIje50tWNpfSGelswgJhg9YPxgyaQ5/LUY/ji9FPjvAEqR5WWNnsCbzCHq2oxhpNm5guEnCOnPgdOtOto0qV7LYssuRXIK3Qrn8KdFdH/Gy3XCHNfnQPjamLkNBFEL37NopMloW9GCeKU8clZhILRHrF6WoJ4pqgiCKm2FGFp0QnoE///12
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 17:28:51.5927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c93c2ae-2f8e-48c3-5da3-08df2ecf9bd9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339

The driver allows system control and monitoring of Nvidia liquid
cooled Ethernet switches based on the SPC6 ASIC through CPLD/FPGA
devices from the host CPU.

This control includes:
- Various resets handling through sysfs attributes.
- Reset cause reports through sysfs attributes.
- Mux attributes for hw components selection.
- General purpose registers attributes.
- LED control.
- Watchdog control.

These systems carry no power supplies or fan drawers of their own, so
the board description covers coolant leakage detection and power
distribution board status instead of power supply and fan control.

The driver describes the SPC6 hardware and leaves the register map and
platform device creation to nvsw-core.

The per SKU part of that description is held in struct
nvsw_host_spc6_cfg and is selected through the driver_data of the
matching DMI entry, so that the board data is chosen by the SKU that
was matched rather than by inspecting DMI again, and further SKUs are
added by describing them rather than by extending the match callback.

Document the register access attributes which are not yet covered by
Documentation/ABI/stable/sysfs-driver-mlxreg-io.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---

v2->v3
Additional fixes added by Felix:
- Describe jtag_enable as the single bit it is. It was given a two
  bit mask, but only the lower bit is defined in the CPLD register
  map, so values 2 and 3 were accepted and wrote a reserved bit.
- Drop the shutdown_unlock attribute. It was described over bit 5 of
  the general purpose register, which the CPLD register map lists as
  reserved. Thermal shutdown unlock is handled by the BMC on SPC6, so
  the attribute is removed rather than moved.

Issues reported by the sashiko.dev review:
- Fix the shift for asic2_health, asic3_health and asic4_health. The
  four health fields share ASIC_HEALTH_INT_Stat_REG1, two bits each,
  but all four entries carried .bit = 1, so only asic_health was
  right-aligned. The other three reported their field still shifted
  up, giving 0, 8 or 12 for asic2_health instead of the documented 0,
  2 or 3, and likewise for asic3_health and asic4_health. Set .bit to
  the one-based position of each mask's least significant bit.
- Make pdb1_pwr_status..pdb4_pwr_status read only. They were exposed
  with mode 0644 over NVSW_REG_PS_DC_OK_OFFSET, which is not listed in
  nvsw_writeable_reg(), so any write returned -EIO. The ABI
  documentation is updated to match the description, which only
  defines read semantics.

v1->v2
Comments pointed out by Ilpo:
- Add the direct includes for the macros this file uses instead of
  relying on them arriving transitively: linux/array_size.h,
  linux/bits.h, linux/dev_printk.h and linux/err.h.
- Register into a local in nvsw_host_spc6_mux_topology_init() and in
  the probe path, publishing the pointer only once it is known good,
  so the NULL assignments that were hiding an ERR_PTR are gone. The
  only ones left are on nvsw_host_mux_i2c_client and
  nvsw_host_mux_i2c_adapter, which are module scope and so outlive a
  failed probe.
- Drop the per-entry pointer tests from
  nvsw_host_spc6_mux_topology_exit(), since init now rolls back fully
  on failure.
Additional fixes added by Felix:
- Sort the include block.

 .../ABI/stable/sysfs-driver-mlxreg-io         | 159 ++++
 drivers/platform/mellanox/Kconfig             |  10 +
 drivers/platform/mellanox/Makefile            |   1 +
 drivers/platform/mellanox/nvsw-host-spc6.c    | 901 ++++++++++++++++++
 4 files changed, 1071 insertions(+)
 create mode 100644 drivers/platform/mellanox/nvsw-host-spc6.c

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index f59461111221..e6128933f343 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -813,3 +813,162 @@ Description:	These files show status of Unified Fabric Manager upgrade.
 		state. 0 - means upgrade is done, 1 - otherwise.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_version_min
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show with which CPLD part numbers, version and minor
+		versions have been burned the 6-th to the 10-th CPLD devices
+		equipped on a system.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic1_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic3_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic4_reset
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files allow to reset the first, the third and the fourth
+		ASIC on a multi-ASIC system. Writing 1 puts the related ASIC
+		into reset state, writing 0 releases it.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic3_health
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic4_health
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show health status of the third and the fourth ASIC
+		on a multi-ASIC system. The possible values are:
+		0 - health failed, 2 - health OK, 3 - ASIC in booting state.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage1
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage2
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage3
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage4
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage5
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the status of the liquid leakage sensors
+		equipped on a liquid cooled system. Value 1 means that a leak
+		has been detected by the related sensor, 0 - otherwise. The
+		number of sensors actually connected depends on the system
+		type.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb1_pwr_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb2_pwr_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb3_pwr_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb4_pwr_status
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the power status of the power distribution
+		boards equipped on a system. Value 1 means that the related
+		board is powered and operational, 0 - otherwise.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/graceful_pwr_off
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file allows to initiate a graceful power off sequence and
+		shows whether such a sequence is in progress. Writing 1 starts
+		the sequence.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_shutdown_req
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file shows a shutdown request raised towards the CPU.
+		Value 1 means that a shutdown of the system has been
+		requested, 0 - otherwise.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_power_off_ready
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file allows the CPU to report that it has completed its
+		shutdown procedures and that the system can be powered down.
+		Writing 1 signals readiness for power off.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_mctp_ready
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file indicates whether the CPU side of the MCTP link
+		towards the Board Management Controller is ready. Value 1
+		means the link is ready, 0 - otherwise.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bmc_to_cpu_ctrl
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file selects the owner of the shared I2C bus between the
+		Board Management Controller and the CPU. Value 0 selects the
+		CPU as the owner, 1 selects the Board Management Controller.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/uart_sel
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file selects which of the system consumers is connected to
+		the shared UART console.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/aux_pwr_cycle
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file allows to power cycle the auxiliary power domain of
+		the system. Writing 1 performs the power cycle.
+
+		The file is write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_aux_pwr_or_reload
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_cpu_thermal
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_main_51v
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_mgmt_pwr
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the system reset cause. Respectively:
+		auxiliary power failure or CPLD field upgrade, CPU thermal
+		shutdown, management board 5.1V rail failure and management
+		board power failure. Value 1 means the related event caused
+		the last reset.
+
+		The files are read only.
diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index 383906a77b6c..650f7f463c9e 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -114,6 +114,16 @@ config NVSW_CORE
 	  selected by the drivers that need it, which are built as separate
 	  modules against it.
 
+config NVSW_HOST_SPC6
+	tristate "Nvidia SPC6 host CPLD/FPGA Hardware Control and Monitoring"
+	depends on DMI && HWMON && I2C
+	select NVSW_CORE
+	help
+	  Say Y here to include support for the FPGA/CPLD logic by host CPU
+	  equipped on Nvidia SPC6 ethernet switches.
+	  This driver can also be built as a module. If so the module
+	  will be called nvsw-host-spc6.
+
 config NVSW_SN2201
 	tristate "Nvidia SN2201 platform driver support"
 	depends on HWMON && I2C
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
index 22e40759dd49..a959d07f1787 100644
--- a/drivers/platform/mellanox/Makefile
+++ b/drivers/platform/mellanox/Makefile
@@ -12,4 +12,5 @@ obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
 obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
 obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
 obj-$(CONFIG_NVSW_CORE) += nvsw-core.o
+obj-$(CONFIG_NVSW_HOST_SPC6) += nvsw-host-spc6.o
 obj-$(CONFIG_NVSW_SN2201) += nvsw-sn2201.o
diff --git a/drivers/platform/mellanox/nvsw-host-spc6.c b/drivers/platform/mellanox/nvsw-host-spc6.c
new file mode 100644
index 000000000000..a87d796004fa
--- /dev/null
+++ b/drivers/platform/mellanox/nvsw-host-spc6.c
@@ -0,0 +1,901 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Nvidia SPC6 host platform driver
+ *
+ * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+#include <linux/module.h>
+#include <linux/platform_data/mlxcpld.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "nvsw.h"
+
+#define NVSW_HOST_DEVICE_NAME	"mlxplat"
+
+/* Bus number of mux parent device */
+#define NVSW_I2C_MUX_PARENT_BUS_NR	2
+
+/* Bus number of the last host I2C bus */
+#define NVSW_I2C_LAST_HOST_BUS_NR	3
+
+/**
+ * struct nvsw_host_spc6_cfg - per SKU board description
+ * @regs_io: register access platform data;
+ * @led: led platform data;
+ */
+struct nvsw_host_spc6_cfg {
+	struct mlxreg_core_platform_data *regs_io;
+	struct mlxreg_core_platform_data *led;
+};
+
+/* Platform mux channels */
+static int nvsw_host_spc6_mux_channels[] = {
+	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
+	18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
+	33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+	48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62,
+	63, 64, 65, 66, 67,
+};
+
+/* Platform mux data */
+static struct mlxcpld_mux_plat_data nvsw_host_spc6_mux_data[] = {
+	{
+		.chan_ids = nvsw_host_spc6_mux_channels,
+		.num_adaps = ARRAY_SIZE(nvsw_host_spc6_mux_channels),
+		.sel_reg_addr = NVSW_REG_MUX1_OFFSET,
+		.reg_size = 2,
+	},
+};
+
+/* Platform mux board info */
+static struct i2c_board_info nvsw_host_spc6_mux_brdinfo = {
+	I2C_BOARD_INFO("i2c-mux-mlxcpld", 0x33),
+};
+
+static struct i2c_adapter *nvsw_host_mux_i2c_adapter;
+static struct i2c_client *nvsw_host_mux_i2c_client;
+static struct mlxcpld_mux_plat_data *nvsw_host_mux_data[NVSW_MUX_MAX];
+static struct i2c_board_info *nvsw_host_mux_brdinfo;
+static struct mlxreg_core_platform_data *nvsw_led_data;
+static struct mlxreg_core_platform_data *nvsw_regs_io_data;
+static struct mlxreg_core_platform_data *nvsw_wd_data[NVSW_WD_MAX];
+static int nvsw_host_mux_num;
+static struct platform_device *nvsw_host_dev;
+
+/* Platform register access data for liquid cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_lc_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = NVSW_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version",
+		.reg = NVSW_REG_CPLD2_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version",
+		.reg = NVSW_REG_CPLD3_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version",
+		.reg = NVSW_REG_CPLD4_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld5_version",
+		.reg = NVSW_REG_CPLD5_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld6_version",
+		.reg = NVSW_REG_CPLD6_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld7_version",
+		.reg = NVSW_REG_CPLD7_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld8_version",
+		.reg = NVSW_REG_CPLD8_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld9_version",
+		.reg = NVSW_REG_CPLD9_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld10_version",
+		.reg = NVSW_REG_CPLD10_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = NVSW_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld2_pn",
+		.reg = NVSW_REG_CPLD2_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld3_pn",
+		.reg = NVSW_REG_CPLD3_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld4_pn",
+		.reg = NVSW_REG_CPLD4_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld5_pn",
+		.reg = NVSW_REG_CPLD5_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld6_pn",
+		.reg = NVSW_REG_CPLD6_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld7_pn",
+		.reg = NVSW_REG_CPLD7_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld8_pn",
+		.reg = NVSW_REG_CPLD8_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld9_pn",
+		.reg = NVSW_REG_CPLD9_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld10_pn",
+		.reg = NVSW_REG_CPLD10_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = NVSW_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version_min",
+		.reg = NVSW_REG_CPLD2_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version_min",
+		.reg = NVSW_REG_CPLD3_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version_min",
+		.reg = NVSW_REG_CPLD4_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld5_version_min",
+		.reg = NVSW_REG_CPLD5_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld6_version_min",
+		.reg = NVSW_REG_CPLD6_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld7_version_min",
+		.reg = NVSW_REG_CPLD7_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld8_version_min",
+		.reg = NVSW_REG_CPLD8_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld9_version_min",
+		.reg = NVSW_REG_CPLD9_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld10_version_min",
+		.reg = NVSW_REG_CPLD10_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "pwr_converter_prog_en",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "graceful_pwr_off",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_mctp_ready",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_shutdown_req",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_power_off_ready",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "aux_pwr_cycle",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0200,
+	},
+	{
+		.label = "bmc_to_cpu_ctrl",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "uart_sel",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = NVSW_UART_SEL_MASK,
+		.bit = 7,
+		.mode = 0644,
+	},
+	{
+		.label = "leakage1",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage2",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage3",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage4",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage5",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "asic_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "asic1_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "asic2_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0644,
+	},
+	{
+		.label = "asic3_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "asic4_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "reset_long_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_short_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_reload",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = NVSW_REG_RESET_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_cpu_thermal",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_pwr_converter_fail",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_main_51v",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_mgmt_pwr",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "jtag_cap",
+		.reg = NVSW_REG_FU_CAP_OFFSET,
+		.mask = NVSW_FU_CAP_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "jtag_enable",
+		.reg = NVSW_REG_FIELD_UPGRADE,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "asic_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "asic2_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC2_MASK,
+		.bit = 3,
+		.mode = 0444,
+	},
+	{
+		.label = "asic3_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC3_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "asic4_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC4_MASK,
+		.bit = 7,
+		.mode = 0444,
+	},
+	{
+		.label = "spi_chnl_select",
+		.reg = NVSW_REG_SPI_CHNL_SELECT,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "pdb1_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "pdb2_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "pdb3_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "pdb4_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_lc_regs_io = {
+	.data = nvsw_host_spc6_lc_regs_io_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_regs_io_data),
+};
+
+/* Platform led data for liquid cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_lc_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "power:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "power:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "uid:blue",
+		.reg = NVSW_REG_LED5_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_lc_led = {
+	.data = nvsw_host_spc6_lc_led_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_led_data),
+};
+
+/* Watchdog platform data */
+static struct mlxreg_core_data nvsw_host_spc6_wd_main_regs[] = {
+	{
+		.label = "action",
+		.reg = NVSW_REG_WD2_ACT_OFFSET,
+		.mask = NVSW_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "timeout",
+		.reg = NVSW_REG_WD2_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+		.health_cntr = NVSW_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = NVSW_REG_WD2_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = NVSW_REG_WD2_ACT_OFFSET,
+		.mask = NVSW_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "reset",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.bit = 6,
+	},
+};
+
+static struct mlxreg_core_data nvsw_host_spc6_wd_aux_regs[] = {
+	{
+		.label = "action",
+		.reg = NVSW_REG_WD3_ACT_OFFSET,
+		.mask = NVSW_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+	{
+		.label = "timeout",
+		.reg = NVSW_REG_WD3_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+		.health_cntr = NVSW_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = NVSW_REG_WD3_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = NVSW_REG_WD3_ACT_OFFSET,
+		.mask = NVSW_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_wd_set[] = {
+	{
+		.data = nvsw_host_spc6_wd_main_regs,
+		.counter = ARRAY_SIZE(nvsw_host_spc6_wd_main_regs),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-main",
+	},
+	{
+		.data = nvsw_host_spc6_wd_aux_regs,
+		.counter = ARRAY_SIZE(nvsw_host_spc6_wd_aux_regs),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-aux",
+	},
+};
+
+/* Mux init/exit callbacks. */
+static int nvsw_host_spc6_mux_topology_init(struct nvsw_core *nvsw_core)
+{
+	struct platform_device *pdev;
+	int i, err;
+
+	/* Create mux infrastructure. */
+	for (i = 0; i < nvsw_core->mux_num; i++) {
+		pdev = platform_device_register_resndata(&nvsw_host_mux_i2c_client->dev,
+							 "i2c-mux-mlxcpld", i, NULL,
+							 0, nvsw_host_mux_data[i],
+							 sizeof(*nvsw_host_mux_data[i]));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to create mux infra\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_mux;
+		}
+		nvsw_core->mux[i] = pdev;
+	}
+
+	return 0;
+
+err_unregister_mux:
+	while (i--)
+		platform_device_unregister(nvsw_core->mux[i]);
+
+	return err;
+}
+
+static void nvsw_host_spc6_mux_topology_exit(struct nvsw_core *nvsw_core)
+{
+	int i;
+
+	for (i = nvsw_core->mux_num - 1; i >= 0; i--)
+		platform_device_unregister(nvsw_core->mux[i]);
+}
+
+/* Liquid cooled systems, without power supplies and fans. */
+static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
+	.regs_io = &nvsw_host_spc6_lc_regs_io,
+	.led = &nvsw_host_spc6_lc_led,
+};
+
+static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *dmi)
+{
+	const struct nvsw_host_spc6_cfg *cfg = dmi->driver_data;
+	int i;
+
+	/* Set system configuration. */
+	nvsw_host_mux_num = ARRAY_SIZE(nvsw_host_spc6_mux_data);
+	for (i = 0; i < nvsw_host_mux_num; i++)
+		nvsw_host_mux_data[i] = &nvsw_host_spc6_mux_data[i];
+	nvsw_host_mux_brdinfo = &nvsw_host_spc6_mux_brdinfo;
+	nvsw_regs_io_data = cfg->regs_io;
+	nvsw_led_data = cfg->led;
+	for (i = 0; i < ARRAY_SIZE(nvsw_host_spc6_wd_set); i++)
+		nvsw_wd_data[i] = &nvsw_host_spc6_wd_set[i];
+
+	return 1;
+}
+
+static const struct dmi_system_id nvsw_host_dmi_table[] __initconst = {
+	{
+		.callback = nvsw_host_dmi_spc6_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0025"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI193"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
+	},
+	{
+		.callback = nvsw_host_dmi_spc6_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI183"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
+	},
+	{
+		.callback = nvsw_host_dmi_spc6_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI187"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
+	},
+	{
+		.callback = nvsw_host_dmi_spc6_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI188"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
+	},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(dmi, nvsw_host_dmi_table);
+
+static int nvsw_host_probe(struct platform_device *pdev)
+{
+	struct i2c_adapter *last_host_adapter;
+	struct nvsw_core *nvsw_core;
+	struct i2c_client *client;
+	int i, err;
+
+	/* Ensure the I2C host driver has finished registering
+	 * all 4 buses (0-3) to prevent the mux from stealing bus 3
+	 */
+	last_host_adapter = i2c_get_adapter(NVSW_I2C_LAST_HOST_BUS_NR);
+	if (!last_host_adapter) {
+		dev_dbg(&pdev->dev,
+			"I2C adapter for bus %d is not ready, deferring probe\n",
+			NVSW_I2C_LAST_HOST_BUS_NR);
+		return -EPROBE_DEFER;
+	}
+	i2c_put_adapter(last_host_adapter);
+
+	/* Get I2C mux parent adapter */
+	nvsw_host_mux_i2c_adapter = i2c_get_adapter(NVSW_I2C_MUX_PARENT_BUS_NR);
+	if (!nvsw_host_mux_i2c_adapter) {
+		dev_err(&pdev->dev,
+			"I2C adapter for bus %d is not available\n",
+			NVSW_I2C_MUX_PARENT_BUS_NR);
+		return -ENODEV;
+	}
+
+	/* Create device at the top of host I2C tree */
+	nvsw_host_mux_brdinfo->platform_data = nvsw_host_mux_data;
+	client = i2c_new_client_device(nvsw_host_mux_i2c_adapter, nvsw_host_mux_brdinfo);
+	if (IS_ERR(client)) {
+		dev_err(&pdev->dev,
+			"Failed to create client %s at bus %d at addr 0x%02x\n",
+			nvsw_host_mux_brdinfo->type, NVSW_I2C_MUX_PARENT_BUS_NR,
+			nvsw_host_mux_brdinfo->addr);
+		err = PTR_ERR(client);
+		goto err_put_adapter;
+	}
+	nvsw_host_mux_i2c_client = client;
+
+	nvsw_core = devm_kzalloc(&pdev->dev, sizeof(*nvsw_core), GFP_KERNEL);
+	if (!nvsw_core) {
+		err = -ENOMEM;
+		goto err_unregister_client;
+	}
+
+	/* Set system configuration. */
+	nvsw_core->dev = &pdev->dev;
+	nvsw_core->client = nvsw_host_mux_i2c_client;
+	nvsw_core->mux_num = nvsw_host_mux_num;
+	for (i = 0; i < ARRAY_SIZE(nvsw_wd_data); i++)
+		nvsw_core->wd_data[i] = nvsw_wd_data[i];
+	nvsw_core->regio_data = nvsw_regs_io_data;
+	nvsw_core->led_data = nvsw_led_data;
+	nvsw_core->mux_init = nvsw_host_spc6_mux_topology_init;
+	nvsw_core->mux_exit = nvsw_host_spc6_mux_topology_exit;
+	platform_set_drvdata(pdev, nvsw_core);
+
+	err = nvsw_core_init(nvsw_core);
+	if (err)
+		goto err_unregister_client;
+
+	return 0;
+
+	/* The two pointers below are module scope, so they are cleared to
+	 * keep them from outliving the objects they refer to.
+	 */
+err_unregister_client:
+	i2c_unregister_device(nvsw_host_mux_i2c_client);
+	nvsw_host_mux_i2c_client = NULL;
+err_put_adapter:
+	i2c_put_adapter(nvsw_host_mux_i2c_adapter);
+	nvsw_host_mux_i2c_adapter = NULL;
+
+	return err;
+}
+
+static void nvsw_host_remove(struct platform_device *pdev)
+{
+	struct nvsw_core *nvsw_core = platform_get_drvdata(pdev);
+
+	nvsw_core_exit(nvsw_core);
+	i2c_unregister_device(nvsw_host_mux_i2c_client);
+	nvsw_host_mux_i2c_client = NULL;
+	i2c_put_adapter(nvsw_host_mux_i2c_adapter);
+	nvsw_host_mux_i2c_adapter = NULL;
+}
+
+static struct platform_driver nvsw_host_driver = {
+	.driver		= {
+		.name	= NVSW_HOST_DEVICE_NAME,
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
+	},
+	.probe		= nvsw_host_probe,
+	.remove		= nvsw_host_remove,
+};
+
+static int __init nvsw_host_init(void)
+{
+	int err;
+
+	if (!dmi_check_system(nvsw_host_dmi_table))
+		return -ENODEV;
+
+	nvsw_host_dev = platform_device_register_simple(NVSW_HOST_DEVICE_NAME,
+							PLATFORM_DEVID_NONE,
+							NULL, 0);
+	if (IS_ERR(nvsw_host_dev))
+		return PTR_ERR(nvsw_host_dev);
+
+	err = platform_driver_register(&nvsw_host_driver);
+	if (err)
+		platform_device_unregister(nvsw_host_dev);
+
+	return err;
+}
+module_init(nvsw_host_init);
+
+static void __exit nvsw_host_exit(void)
+{
+	platform_driver_unregister(&nvsw_host_driver);
+	platform_device_unregister(nvsw_host_dev);
+}
+module_exit(nvsw_host_exit);
+
+MODULE_AUTHOR("Felix Radensky <fradensky@nvidia.com>");
+MODULE_DESCRIPTION("Nvidia platform SPC6 driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS("NVSW");
-- 
2.34.1

