Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5A419149F
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659350; cv=fail; b=VUq9QuWVSrLaTiF8lez7MOgOF3IanKUTsRbiRGBBR2av0xHSSV2BRYdMMt+QjHh5mUaNMHTLcVMOOQJtWlBHtGkkO6aXhMjqAQgjAvxPz9dcRzZgRtKLEp5tw0HR3W1E4Zjo1F8Qd9r/XVtDKeg/NvKGG6P9rhpQd1eVd8JabM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659350; c=relaxed/simple;
	bh=eWSbmUsnWUXm4nEj1mn7jGnY45RMMSai8bR78TLUSew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aEMGKfR9gWtW0wLVSRdlAFaPpPkVtaT6aAxO2tXoGHk4TtgvkYu2tUTK0gobtj+5xGKexyhoesHsspNh+RSIepLkNeZ7fnkMIgRZP5gDsSgT9bNVADkgaA3zfxld4gXhmlMhp+J7IfwASQZcpZF45XMtZYWE2XoSrSsmGktedWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZmZ0iaZw; arc=fail smtp.client-ip=40.107.96.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZmZ0iaZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+Bx/07ftUStJEye4fsxrxxj4lKTkPBIc2TrjIhyMqAZA6a0iPHWeCvxfOm/x28YDpnmOfGtGHBC3tT7O0wdHUYXDxbE3PF4dzN/GchriyfFIlzlB3rhSJeS2xC7YlBGtPoQcCUj/BJPSW2TInXVp9U3A/GiX2dctSP5Gn7zsjOpaUK5mI8GNA+Afh8BMFAZlcwvuFZsURDPABC6BhNRnOz0AlVt5/d4lO18fggPlXfSDcxpiA3h3MI1hVOOjYg8VOMx0bEMEMONaN4tJzCpgjHIngJ2h5KNfGmNbWUadlSrhOZIjUs1/1ucBmKSmGTWa9SnWwoCYGssfLrbcOgFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=piN/fvTYLnF0hvVENBbOjtUnEaPaUliLZuAjHc3BawwYkVJD+vgG1XU+4q9vK4pFIOWmqP1aN5crgQ56IW/MCoUptp79KpAj5SJYR0LyF3nBUyblJg2iBypF0n/4ed56G4PxOKWBKFI7SI8BvogbwzVA7Wc1FxGybrIuZl6l+3Mvt//rKTcGCYXvv+YfpY++MFgN+OG/mcJS51rMq/27GZsO5oJNkNuXTpY4NvPy8yAebuclLpP/0PNm3BIOrSaWVsxZW8GQXs4/gLV0uDrGfE75APRTFoGwGtnqWucbtXwXC8/vO3iBJ0AUGTZBdRtTsBusvBOZ19/g7zyV+RukvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=ZmZ0iaZwZD8EziMLXWqTCDBKnz+7DgB+qFpsOzeEXkYNafOP96lEEOPJRSMl0izpaIgkmc16MIE1nfzczx2T4gzpf2a/v1w+0ehB5nun3Qe5x94pT/cFplQmxTokl247pgC22JlSxWjRocYJPZhi+/wWG0ANKlt0lGWEyTffqEiwmHiau3PSdf4RcFPj3Q27gEICPCHULdB/rmpEnZJmIf1avnh+4aXdj6keKt9XQfVTVmXMLpWk78d9C1a/mSKa3PvF75z19UhgWmCBKtMFGOmMksljiA0f4pKiliO1Ylv//tbAJWEk/orziOv0jgPXdk/VQgqGyNi8Fwfiq6pb6A==
Received: from MN0P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::34)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 19:09:01 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:531:cafe::2d) by MN0P222CA0029.outlook.office365.com
 (2603:10b6:208:531::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 23 Jan 2025 19:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:09:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:08:43 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:08:40 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 01/12] mellanox: Relocate mlx-platform driver
Date: Thu, 23 Jan 2025 21:08:05 +0200
Message-ID: <20250123190818.3834-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e15169-b740-4fe4-0307-08dd3be1650d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enVRWmVqM3lGZFZtQTBZSjJscDh5YXVlMkJMNFpQamxpS01sVVhlVGQ5ZitM?=
 =?utf-8?B?Q1drTld4dVJKUXI4aUNRamViVFVqUktUeG9CWVl6Z3hpMXpMTU5qSkVLY0Nt?=
 =?utf-8?B?eHN5Rldib0JtNTd2aEhzNE9ZVDdwd3pPSXlYV2ZlZDFnSnNYVkhvQXBvZmgv?=
 =?utf-8?B?RmtmSWtGZjdTZ0U1bEg0REZwYnVkdXUzTDE4SkNYaGVMYVlVQjk3TmptZDFQ?=
 =?utf-8?B?UGJyU3oyejNHVXhISTZ5YVVsazcvNkhIZ1pjZHpwQnNRanA2VVBRMDk2d29z?=
 =?utf-8?B?UlNmU3Rid0xOV3JpSTFpSjlDM1JialF1aXFlcld0b1BzNUVhYkFjQTR0OHNK?=
 =?utf-8?B?bytmZVFNOTZ1RWVMeThyWllrQTBLT1pCc2lQRHV6bW5NZ0VRTzNsMUZUa0dY?=
 =?utf-8?B?cHNNSWp1eTJ1aHNlTVFZZnFVcTlpZjliRDVHbjBoK01Ud0RTaEhzUEdzU3Za?=
 =?utf-8?B?WDVwWk03TWQwbUkrb1YwY2hsKzVQV3pvekxSMjRHbkU0TCtBMDJia2xEcWk4?=
 =?utf-8?B?LzVzYU9VRWZTUERsWTd5cEdXcXZMSXZDUGN2YnByb2wySWVBUVlsK3E5MzUx?=
 =?utf-8?B?amFqTTlBTFhaSFRFbXdUOGhOM2hGN0I3YXRYeGhBWGlhaVBWYVRxS09GcDVG?=
 =?utf-8?B?WVBqOVdKQ0lheHUzbmdMSjV2bFhtdEZwblBld2tHT29wUklFK2pVb3dUQVAv?=
 =?utf-8?B?eGFCQjV3TWhMdTJkODRJa1o1L0l1RFVIVWM0NTh3a2g4OHU5VEJMeU1ESHpF?=
 =?utf-8?B?YWZ4ZENkOUNyRW5BMVErL0VMWnBhNGlDcE5sZlpoVUpJZGw4MmpocjRoaUFP?=
 =?utf-8?B?OHI0NExZYS9Eb3lLTm9oS1dMWDNWOGVvNENuVTFuZCtFMThEOTlUYWRDOU9P?=
 =?utf-8?B?YncxTnM0RnMzWE5OUHVOM2cwaVg0SHpvQ2pRY0JST2o2R0tHc0FSKzNzS3o5?=
 =?utf-8?B?VnhCR280RXFTUDErTVRkYTByKys5UU9OYzV1SFowZnFad1NkSHcraFpidWdZ?=
 =?utf-8?B?MC9RUnY2VnY3MWVBNzVGdFRtSUdFVFNoV1hBc3ZmR1ZRWGM5TlRMcGgramts?=
 =?utf-8?B?WTlOSEZ2b2hoUW16YU1YQzkyOUR2b0ZISFl4R2dSbWZVR1R6Q0t3VmMzcFh0?=
 =?utf-8?B?R2krdlVoQ2o1dEZKVFhCK1lSWnpvRVZVQ2ZHUlVaVlJzWjhTcEJyNkNTY2c0?=
 =?utf-8?B?eDZjVTloc0wrTkJ4UENNcnk3Zi9PWUlyUEN5NXpaWlh1UmVEUS9LNnE3TW5B?=
 =?utf-8?B?YmhKNis5a2FxSUI0MHJGcTRNUUJVTkZkczh0SHFicFUyaXZXVTVPd3NWZ3dF?=
 =?utf-8?B?RHpkQVZoeXVScXB3c2gza0tPeGRFRXRFYkE3ei94RXU4NUlUNm9EUE9sMU45?=
 =?utf-8?B?VVgyNjI2UWRBLzhjd25YZXhWVmtFZTlrV3JsWGxCcWpNL29ScUdONHhkNFBL?=
 =?utf-8?B?MEQwZEVxWEI5S1JDaHkvWTE1aEpEMlN5OUZ4YmJXSS9TbnZ4MmZlRGNnK21t?=
 =?utf-8?B?THl5bUVNL2dhYXB6R0ZRMkt6a3hQa1AxWHFaZ1U4VitVVmgwWjZaRnBKQjZa?=
 =?utf-8?B?TFRTaFNiVjd6NXdlSnRvK2E3cDJPZ2pzakRLd1lCbmZCS3dwRDRIWU9JOGMv?=
 =?utf-8?B?WFBXcGk5aHRsSytyU202SWNzTHNtVGM5enhxNzNzUm4vRmtJdEI0djBseVJG?=
 =?utf-8?B?YlpkK1g1MTdvaFVXNEpQY1E3Y0RPT1djdWNMV0lCSXczN3VjNHNQNW1ralFF?=
 =?utf-8?B?cE4wUGxjMnJFdGZhSFJQK3BNYzUrOVUvb0VwNzJsK1p6TUtSR09KbE1WZHhv?=
 =?utf-8?B?NXRCblhwdVhyNStyYmp6bG5XV3ZycmFyUllTY0lhcFlYQ053cXNFeEdXODVJ?=
 =?utf-8?B?MnhOaG03d3k0SUkxQ2R6TkdaRlVuazNLYlFVcTNOT2dUTFlCcFg2eDVNY3JL?=
 =?utf-8?B?V1VvSDJIUFFlSDVZcDlQM2dZd0xTei9YMVFIdThUemtkc1E5TGZZMXlQRG80?=
 =?utf-8?Q?/EuuxVDNHSd1gcbHBrE61+W20Xwkaw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:09:00.3479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e15169-b740-4fe4-0307-08dd3be1650d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915

Move 'mlx-platform' driver 'x86' to 'mellanox' folder.

Motivation to allow running it on systems with ARM architecture.

Since drivers/platform/x86/mlx-platform.c is rellocated to folder
drivers/platform/x86/, remove "MELLANOX PLATFORM DRIVER" item.
This driver will be located under "MELLANOX HARDWARE PLATFORM SUPPORT"
item.

Add reference for Documentation/ABI/testing/sysfs-driver-mlxreg-io under
"MELLANOX HARDWARE PLATFORM SUPPORT".

Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 MAINTAINERS                                       |  7 +------
 drivers/platform/mellanox/Kconfig                 | 13 +++++++++++++
 drivers/platform/mellanox/Makefile                |  1 +
 drivers/platform/{x86 => mellanox}/mlx-platform.c |  0
 drivers/platform/x86/Kconfig                      | 13 -------------
 drivers/platform/x86/Makefile                     |  1 -
 6 files changed, 15 insertions(+), 20 deletions(-)
 rename drivers/platform/{x86 => mellanox}/mlx-platform.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6bb4ec0c162a..7d12a8f08f52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14705,6 +14705,7 @@ M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
 M:	Vadim Pasternak <vadimp@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-driver-mlxreg-io
 F:	Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
 F:	drivers/platform/mellanox/
 F:	include/linux/platform_data/mlxreg.h
@@ -14775,12 +14776,6 @@ F:	Documentation/leds/leds-mlxcpld.rst
 F:	drivers/leds/leds-mlxcpld.c
 F:	drivers/leds/leds-mlxreg.c
 
-MELLANOX PLATFORM DRIVER
-M:	Vadim Pasternak <vadimp@nvidia.com>
-L:	platform-driver-x86@vger.kernel.org
-S:	Supported
-F:	drivers/platform/x86/mlx-platform.c
-
 MEMBARRIER SUPPORT
 M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index f7dfa0e785fd..aa760f064a17 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -14,6 +14,19 @@ menuconfig MELLANOX_PLATFORM
 
 if MELLANOX_PLATFORM
 
+config MLX_PLATFORM
+	tristate "Mellanox Technologies platform support"
+	depends on ACPI && I2C && PCI
+	select REGMAP
+	help
+	  This option enables system support for the Mellanox Technologies
+	  platform. The Mellanox systems provide data center networking
+	  solutions based on Virtual Protocol Interconnect (VPI) technology
+	  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
+	  connection.
+
+	  If you have a Mellanox system, say Y or M here.
+
 config MLXREG_HOTPLUG
 	tristate "Mellanox platform hotplug driver support"
 	depends on HWMON
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
index 04703c0416b1..ba56485cbe8c 100644
--- a/drivers/platform/mellanox/Makefile
+++ b/drivers/platform/mellanox/Makefile
@@ -3,6 +3,7 @@
 # Makefile for linux/drivers/platform/mellanox
 # Mellanox Platform-Specific Drivers
 #
+obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
 obj-$(CONFIG_MLXBF_BOOTCTL)	+= mlxbf-bootctl.o
 obj-$(CONFIG_MLXBF_PMC)		+= mlxbf-pmc.o
 obj-$(CONFIG_MLXBF_TMFIFO)	+= mlxbf-tmfifo.o
diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
similarity index 100%
rename from drivers/platform/x86/mlx-platform.c
rename to drivers/platform/mellanox/mlx-platform.c
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3875abba5a79..92a3d5be0e36 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1010,19 +1010,6 @@ config SERIAL_MULTI_INSTANTIATE
 	  To compile this driver as a module, choose M here: the module
 	  will be called serial-multi-instantiate.
 
-config MLX_PLATFORM
-	tristate "Mellanox Technologies platform support"
-	depends on ACPI && I2C && PCI
-	select REGMAP
-	help
-	  This option enables system support for the Mellanox Technologies
-	  platform. The Mellanox systems provide data center networking
-	  solutions based on Virtual Protocol Interconnect (VPI) technology
-	  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
-	  connection.
-
-	  If you have a Mellanox system, say Y or M here.
-
 config TOUCHSCREEN_DMI
 	bool "DMI based touchscreen configuration info"
 	depends on ACPI && DMI && I2C=y && TOUCHSCREEN_SILEAD
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..8849c0a36419 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -122,7 +122,6 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 # Platform drivers
 obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
 obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)	+= serial-multi-instantiate.o
-obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
 obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
 obj-$(CONFIG_X86_ANDROID_TABLETS)	+= x86-android-tablets/
-- 
2.44.0

