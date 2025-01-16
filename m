Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1C86349
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014409; cv=fail; b=BbQonI1LdTxOPitrDtKGwxTDl81njjE1YXuwR240PtQub6sQyMJK896lPUJGUcb/+j4dXOPFAam0QqxqxueQ6zL2PA8RN8Ue8OSilCtE2QPlYZosJYlnSp8DAkLz1CNrFJ2itBXvt6wsWZvtbOuv8/5SlDohaVLOd3si1p0y4tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014409; c=relaxed/simple;
	bh=eWSbmUsnWUXm4nEj1mn7jGnY45RMMSai8bR78TLUSew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J40wDLMe5EWlws38ZEiNgwSbKMcEztKKdhIkyVzs0PcLD5Qhm9aGM9WSQR95CYoiXI4Y1xxkWCXxeCIV0nEnj4QvBXwveqmEZHACQVL7Bd7kKiooiqfFAoQFXDUeVJ1agcaNIV3/Jog0GL4qYRIcqo9yN3YSsJeyZA0JgiGvhF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HufVBg+E; arc=fail smtp.client-ip=40.107.243.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HufVBg+E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrZksxsxLFxJf1DGMt/Xn3l8iFWwj7AdVNMRvj9qEHU6QLzmVnyKfNXA/U/6kfzuVDHHLcxPlRYs/syNqU7n/wM7bW5Wk2yvt4+9wKvbTqRhZBgryICyazRrQ+/ha+FgAVUniUfV/jTGSy/l2hjPGXrI8NrvCSRU3ZWAKCgNbdL2e/3okjSv/ub/rr0/Q4jTldHOI0jIhxBw+y20WVwip3FIuoU0nQxBIG6iKHYEiSHNz/iKqn6uwEdIBuVbQNAZEQq5/OtrAYYPPupTTXnS/RStkLZnHdLU9fnL9k46ddzJXzu34XN8UjSchjkpP/2TbshzE5HWQoXnTE02kAg4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=dIpsWmhkj4OTmVqQJ1LnjBVYBXsufkaQiRzcrINO8oQhFeWIIVXZizPlgBIELFcUN9KgxK5jG//UZZGqgswI32nfdj9uM6xaQGSKl5IovrhbTrcp3d9TsLuiJxe772CmiOeVAtiltdzLVaDMppglPUmiNjNwC4PuiDbi/ESoQrmpK0CPH8oQBntlEDuJnmE05FLvy4nGu4IVdw/SNKNqx/+gPkSvdWKekuq1Dpnr0PS1LF87volM0j0Zxq6CU1iAiTmiXrNVUjNyyIa3wjg3qRoZoTGJ1aL9t30vqFqEZ1rnY3L9UIAzlYSmOrxHMlfqoSjfbhDU6RHO9y4ixDJAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=HufVBg+EKj7RCWP3hyrVdfk9vjEHsGOPt1XHnQ9Ks1SJb6dyKnnACqizOIfvMm4DPvWWuRn6bfBmifMmYJ7E06lB4eTKNziCcsWqu0Nn9m8me82/cHVUhoBqzgFoQfUjGP8UBnlyrVu6ArnLGqsOhV2k/8yhXPf+t9ujCkY+Eg93NpAXBXgIaBGIGchc0+AuVHnsSIBs9QmHbL9NgoSnQ+BXAEIpJQ4UsGldWHpZuXtBXrUvDT7Rf3eLgd6CQ/OAuH8IgkUqhs2eQXVRx0+4PKXyvKlLzw6qAlJDyufKQtV1afFzmYZy0sEBYYiGtdmSx1GivIkElgmwizbidvsiEA==
Received: from BL1P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::17)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:00:01 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::bc) by BL1P221CA0021.outlook.office365.com
 (2603:10b6:208:2c5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 08:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 08:00:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 15 Jan
 2025 23:59:46 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 15 Jan 2025 23:59:44 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 01/10] mellanox: Relocate mlx-platform driver
Date: Thu, 16 Jan 2025 09:59:07 +0200
Message-ID: <20250116075919.34270-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3290ede5-f37a-454a-22bd-08dd3603c776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZThxNlM2cVkyaVNjNStIOUpBUXJENStpdnNzelBpWTZhOGh4eVplU0tNczhv?=
 =?utf-8?B?ZWgrbVo0dXhGOVV5WUpuZVBLMEdjYTN5ZzNxRkJyZEl5VFplTnRTdEphek5H?=
 =?utf-8?B?K3pldkQ0Qm1iMWcyMk1leWdqT3NraWVYd2xhd1ExTndQbnZlUVBzUDhXSDYr?=
 =?utf-8?B?YnZFMWhndW9MYkN1ZjNqcmZCWHIvOHY2Ykxod3JoRjA3T0F0VTBDMXB4V0lM?=
 =?utf-8?B?R2tMaEtsMElZL1J2eHlVNytBRUpXVFRnbmdzODk0Z25zQUQ5ZlRST1A2QmU5?=
 =?utf-8?B?S05RMFF0dXlKS201WUxlU1lSc2hXelVpdUlIbXZHbUNCREN4dkZqWVFVRjVO?=
 =?utf-8?B?allJc2V5UWtUM1U0UFhSamRkZHpPYXF1OWJCcGVxNTdSdlRXTitRM1hBU0lG?=
 =?utf-8?B?SGFDZHJTSzEyOHFLZ3g4TWRMRFRCQjQ1bVBpbGdFM1A3WjFYZzdwT2xxa0pH?=
 =?utf-8?B?SnlsUUVnOWl5TjR5OHJkclFTWFI1Q0lrSC83bWZwSHEyUTZvd29ETUdQZHRG?=
 =?utf-8?B?bzBGZnplZnNEQytRR0IvUEZjZmJ6bklkajJ5RmNJN21LUFFwM3g3TmpqU3NX?=
 =?utf-8?B?amRBLzdVMzJiWmZDR1IvTmxzbWpjMzVFYUdTKzJPMWUyOHlMOHVKWXEvcHdk?=
 =?utf-8?B?MWtKb3VvN21PaHRrYmdsdE8rVDJtNlhFMEhSb3V4akRQdDdDQ0NEZlVUWmEr?=
 =?utf-8?B?Q3JxZVZMYkJhODhSbEJpZ2I2a2p3NmxlZXlIZThQRVJaK1FBWW4wdzZoL1JC?=
 =?utf-8?B?SmF3a3FhWHVudm9ab3hZbVBWaWE3WHVWbE1zVGN2cVU5K3R1aGo2OTcxQzRW?=
 =?utf-8?B?UmJKUm1zaXU4bU1vaThJV1NISFQza09PZkNiTXJScXRoSkQ2Y0ZVM1puSXJI?=
 =?utf-8?B?U0dIcEU5a2c3STJwTVpEM1h1Q1NhNXpweCtVSGc0WmFPeE8wMWNFSWt4YU9k?=
 =?utf-8?B?NFZRTnRLd2FwaWRGS3BTMFZ6VUJ6TTJURGN0ejFDNnFvMWlLMVZ0YVV6cTV4?=
 =?utf-8?B?K2xySFlvanEyb0FTYXVSaExSVWtoN1hkSW9JNnJKNlp1b25LQ2ExQ3Zkb3Ey?=
 =?utf-8?B?bDQ2SDdxVXNrM3Qzajc1VDE2alN4MzlvV1NaQTJlOTFYdktmeFQ2MzNpU1dt?=
 =?utf-8?B?S0RFRDh5RDhjbmlFdEdCbVRsakFZREQyOE9IQVUwLzhtTmdZWXRnRWxQS05z?=
 =?utf-8?B?aUorbm9WUDZOeGlrWVVTbmZxTVovVWdVYi9vL2xIYU5MSWNiY0h5alk0UWFZ?=
 =?utf-8?B?dldlV25rdGlZd3hoTVpOenhuK044TFJSK2FSNmwrcFB6QjRCWC81YitlQ2ZP?=
 =?utf-8?B?YURsakRVZ252Wm5mN2FZeDEvcUZFdzh0U1BMeVJBOHBTT1RjUVlleTFnbHBs?=
 =?utf-8?B?Sk9pZTRCQk5MOFNDd0VLbk1lOThjVFViQk9iaHFLSzRSTk9RSE51MHMxTGtu?=
 =?utf-8?B?NEFFNUx2MHpUazM0elVYeENwUHRKY0JZUnpCeUFnenF1TW83SUNIbGdEZVJ3?=
 =?utf-8?B?MlZKeU9NSTNCR25Bb3J2UGhocVNpbGVRSzNtREpRNUlqTTJXNjM0bU8vLzNu?=
 =?utf-8?B?UDZSMVkwVU9Yd0NYT2o4eGlteU9JNDg4bWFydzlycjNlNkV3eVQ0VVhndkxl?=
 =?utf-8?B?M1k5Rm1MNW9HOU9vK2hGSm5nVTlrRXJoUzVjd3NwNTNSUEVDMnF3NmJuTzhK?=
 =?utf-8?B?cGRJYW1reVc2NHFPTld5Q1k4RWVhRmZSSHRjc3F3YnhTaktrOTE3VVYxY0FI?=
 =?utf-8?B?SXhFZTBwUTZ5NXNDMjgyYjQvall6Q0NObGZSTTdEamtyYkNCR0hsM3E0RVlk?=
 =?utf-8?B?SGtxWDRWd0Y0c1JtR2xDbGhyajRyRFpSNHp6OW92L2lYaXhRL3RDVmdSS1NP?=
 =?utf-8?B?ZHFVTnBrUDFDYlpWaVpZczRldHVHZllQd0pkb3Q2MlYyYVc4ODJQQmNNbS9w?=
 =?utf-8?B?UitmTjlHRUNMVHBmZU9qK3M3dGI0QzEzUDgzbXYwRW1YSEVRZGNtQXZwZ3hp?=
 =?utf-8?Q?QUBUpn9TomwfS+5tKvqWzoi2Y67k24=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:00:01.4125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3290ede5-f37a-454a-22bd-08dd3603c776
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

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

