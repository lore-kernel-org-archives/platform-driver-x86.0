Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96D20E015
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516759; cv=fail; b=Pw+kLks8T+CidXORLUfQLrDUKQpBxeQEDyp1/WshW5XFm9vMHtC4bC7JRc0M4pQWVtJC2lc7OggDO4/VRERZ04D0JbM03HrNZxm4XRFFPzSsv/oUWe47QEEGbsoxUGt8HrpKQlIadCB2KexTsLdN9oKy1VqdG+AnP5Fpvhvz3D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516759; c=relaxed/simple;
	bh=LxeDpcj54E/3ZI9gN/4kLEtgf3AvTnMd3yaio12AFGc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4pe+mczzTNUWPmOYX9oPluB/9Y64E9OWkd058HJa8h+FXECBw5+DGDEwsB1lRTPFkTmWeflhbfwJBu3YArgqT8qPaCa19lQTzA8Ia9Ql+wOlEdR2seFIQ7ivNwqdf0SwRXHowAjctAC6eu4ZT0F2fRGV8wv1syZACkK6LALU+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H1Qnx2MP; arc=fail smtp.client-ip=40.107.96.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H1Qnx2MP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBgyNp37rpHIyWBtZCxiSioePI6ExsF7uG/UYPp3fZ1gncL5cBaFx6SgFoPOKqeMhR1GIwPeQD5zWwGPg2fgUl6rUxh7PDC6np9NIdpwxa6w4Sz8dId6LlK/YHvGHTPuqs8XCVWw/ywOMpVtzK40meiCocRJd+DTRTmRc24OFXXPWuqnksXD/3XnQb2sfBs/u9fop2rsvILZAltcwfWiDKYIznrDzG0qpw6XYNPGmrRls0UmHqnD6vdq/HXbHjKgE+0PSeOJbqLWzdtgi7qUgmYglOYnRKGjxuJM6G1YL2rY7TqlIlhXAz6YLSbGtNYzBKo9wB0DcIFzhbSB/O251g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKUUP9+HkY9mWHgmzNxoos9uwI4fWPzVTyYkBC8NYQw=;
 b=jln1pP0CxeCZL+Zmq0a3gL0UBLbqU7h9aCOHCit4hI943fi1L/SPJhkj6DR9usjnkg8WLXYXUWx0y77ipNRBDSQjDnTc/+V8WcyPeWG7gTvQm7tk9ezAzTohcx3UdlDgvS1eAlM4DOMiQ35ebSNa7HBdwnhmLSUrBOg6usCX6aUFzTUZ4vc5LsENZ6QcGJd6xgABbzY3IFiHYoOhLQy6B1GvxVi95Px6lt+LPRJtO/vH9ykU0PhwRKkeEvp5f6zC+z5WtRIBEE4qENiu/qV1PcVNKGMh6p/FHZ7kj0asaNciAM7uQ8FbOjusUyjK6yZASdheUNE1lVNLIPRlSqZu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKUUP9+HkY9mWHgmzNxoos9uwI4fWPzVTyYkBC8NYQw=;
 b=H1Qnx2MPz7Hm6USZMdNfLIliIKIB8YtLPlKK0Kx3DwwZ86CQZ8c2HkmYLBcD24BWf9b05w5mgEl2branBgB0B5Vj7Ez7R8yMFtULzCT/d9lPpSXgxBXxrepQTOT0nDfmRMcwoVMyG2389pnRE8exXFMifWJAJa33HJMdYP8sVROoFNfSQt/+4bim3YRw4LwLRmRygUkO1BreOlvd2/ZBjbuTCD9Tc1fJaD5PpWjpNVUKIDfkJ6KJqd4ZCZcLVw0CyENBfXsMqXiufOSU+IzUNSdyobCs1AqGC0ouDVNJV1iWgujHhzgCNPWbTkRlghpHclRjVEwbIDkhtmGWN2y3Zw==
Received: from SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26)
 by DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Fri, 10 Jan 2025 13:45:52 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::32) by SJ0PR03CA0051.outlook.office365.com
 (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 13:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:45:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:45:42 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:45:40 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 01/11] mellanox: Relocate mlx-platform driver
Date: Fri, 10 Jan 2025 15:44:59 +0200
Message-ID: <20250110134515.8164-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 455209ff-3ca6-4c9d-226a-08dd317d1901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EAsmtkEBFftqo8OtZfFTK0UonPZPXNjKWsTqhL+CJw0GHhfeI77r+Xt1yVN4?=
 =?us-ascii?Q?bEWlRFwDabSxWtXOw+2Uuw/gQ0Ldo/6K7A/bYFCF4ySg0ykDG6sEVXyq7MFj?=
 =?us-ascii?Q?E0PBUgScrqoZc0PqdnIt8RQhYt4qfdV+4Pa6egVxy/BzEV2axMR2zCCVHbzr?=
 =?us-ascii?Q?0Kailn1Fdngmv1TE3a6g+QSQwElklFqY3GYxwR9pBR1X0fJkx5srYesDbFc4?=
 =?us-ascii?Q?vjQsAZkAIjmTQSKJnhz9fgaomOPjIsizWYgugNgnQWh/d97TkoYHxfs7YZFA?=
 =?us-ascii?Q?lXX3bxTgqS69W1L2w2B2Jj3ShXAS5iqvNzGW9uv2HPPAHkE0oPFbQ54kbzJN?=
 =?us-ascii?Q?9ZURbQaiKtVRgcPlVpb3anteu1PzWIaI4xm0HuGkbtGpgN71cquNtAymXEz4?=
 =?us-ascii?Q?gEyDnQm12C5jQoxVoo9Dvwy+WmreqClJWNDV+oOpjPUQ70XVWP9IwNUjzf/U?=
 =?us-ascii?Q?udcOi2OGtS1hg0M7YemlRDAlWM+twL9XUdKTsTdX4BP5cy2GwwWWRuYPLRWf?=
 =?us-ascii?Q?+34DbrQhR0u5N1E2/j5MnV7C/vcbSSdHWFkehHv0+UBf6mzQZ9NmKREblu5T?=
 =?us-ascii?Q?yiH3SOhy2zQn60mxw8Rs2Bk7/MaaZ8f9M065eu62q+Jrg2zFXUUsOeVRnQe+?=
 =?us-ascii?Q?LxrPRPmodKZ0sqTqLIvzKXHviy8udBEO0KRYkyViFmkfHqXUAhhr66KyvV8J?=
 =?us-ascii?Q?8IhdPebfhsBo89aTpdYYx8n8O8DDvsH8Q/j8yMbP+XPqpSL1co9VbD4KSrMn?=
 =?us-ascii?Q?gdf08clYgaEawdSe4CbVI3b4/kalKlM0pAFrIqr0/CPLkOWllUY39aCKlLkh?=
 =?us-ascii?Q?zFnDtvnid2gIkjXB33PSjLJ53rsSH+zzQUyBxd4+onb8zJSiBZ8a2k0ruq2Z?=
 =?us-ascii?Q?lAxKCLaU0XOR16//ZUtoLzWgsm4I91APH+ls52MZEmOZLNvIgXXnsF4aZmp7?=
 =?us-ascii?Q?8YxsBUZcpdPn+0df8k7Mn5cdEY2A6wiN2SIrSl8WF8g6kghTnW0lmJfinn94?=
 =?us-ascii?Q?8Lye8N9M3btNGqUqdw0cBMwZG/5OjfWcrE0pZwOxCKUoK/WqQozEpvAyuu6J?=
 =?us-ascii?Q?0bw/1PiqDvGcOILscE4qkSJ7IdcaPVeHmp3u0jIi0IqSMuQkW52uchALsufZ?=
 =?us-ascii?Q?wusO5Exip87zSf0H8f0YRtwnYmkOrpyKVadiczNVv83qF8A9s+h8V1RHIkq3?=
 =?us-ascii?Q?L/t+KSy31bCT9Y2Z84L3GxzJgKnKBUNVNNupm/FJ/iPa/0ng3xR5XVJeZXH2?=
 =?us-ascii?Q?bANrymsxVawxvmIL9s53yde9hwjt8nMty16p44arCzxEDLG/JDLYRa7hQ2Jb?=
 =?us-ascii?Q?jIhgy/HuXS5AgkJ9irI4DF4HpSxhaAEdfTFakfYr2ISJ+CzpPPg7MrUj6xmS?=
 =?us-ascii?Q?qBNYlxVMd5x3N0bhCG5tshp0uNMJwwhjjhqKh8aZjEl1IUQEvv/lneWJDbwK?=
 =?us-ascii?Q?/+Ts4zP3k1+gCvGXpYv2GPyLXa9VBTK3OlTDEGy0Bhd/UH7fxkY31g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:45:51.5562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 455209ff-3ca6-4c9d-226a-08dd317d1901
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938

Move 'mlx-platform' driver 'x86' to 'mellanox' folder.

Motivation to allow running it on systems with ARM architecture.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/Kconfig                 | 13 +++++++++++++
 drivers/platform/mellanox/Makefile                |  1 +
 drivers/platform/{x86 => mellanox}/mlx-platform.c |  0
 drivers/platform/x86/Kconfig                      | 13 -------------
 drivers/platform/x86/Makefile                     |  1 -
 5 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/platform/{x86 => mellanox}/mlx-platform.c (100%)

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
index 0258dd879d64..fab35030fe37 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1012,19 +1012,6 @@ config SERIAL_MULTI_INSTANTIATE
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

