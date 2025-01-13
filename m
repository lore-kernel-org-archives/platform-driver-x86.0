Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C42343CF
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757861; cv=fail; b=n1uVr18SUgmvSWufZ1TNyXDUn13yog6S1aaLZPZEgFwTkkVTN+gnsG7cM3nlOeMGhSbHM/U+Ec2piJfrXPc+sBJwTK7PGA2A7u7k8RXziqdVBh57RJVEHcmai+p646wCcPrzpA79TJZMsGmUyVLoACZM08cmZ1X3UE7Z0qySxQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757861; c=relaxed/simple;
	bh=eWSbmUsnWUXm4nEj1mn7jGnY45RMMSai8bR78TLUSew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COZgOrCoBx90K7Bg3MMLttUAIhn9wrKbpm3JQZcz9NDuhvkmCuHS0/Qj4PhpQeWUBZv0uK363BaSVEDttHTfVfnaO/hhntvwg267uCmXMLPIAEpRezzR+NYIPHkFx85VRxG5pPrF0AcgVpN5sx2iTnkf/NN8R1J3l28kDVdJB9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t3EVKAIJ; arc=fail smtp.client-ip=40.107.212.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t3EVKAIJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYnrPRqG+lIqHpx4eNh1SLpYPQ3Ui/T+qJQrh0R6BLfcmZkQySEy1jhqv0AhepFOZwQDOPL0QAAWEZSf4/Jc8Onv8G78gfmAlhftUdY28xh+Xy/7YPUWz7osc5Upfrxny7IaSZk6Qg1NrVM0Yq4+Bq4XRnxAzDgJ3Ll52aDIQ3O3456AHf/WHoSrl7v6Tyrwnq5mb1LsXfNTvzlxxbcjzR3+mpPmqxtTHXSH7e34iNEPkPUAyBqJ8JDc4+OiyAPCXB7MGj/nne4iJ6Pz0ra7JsUkQg/7q7EMBg+ue9AF++8wHYF8YNPuXnuzYsM1/RohghT+Jg8KnbzmqrzbXp1szQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=unLsSjgr6RAZXjmvowrsugKmS6YuaahDUT5KWgpjH9N074MJlwp9Gf3+1+61E0zMwFYrtie5iuvA+zaUS2uJPoqBNZc238egS2nLRxWD5H9YacdFNk62xwHAiwxjrkRtVwpa7lAWyrdL36nfXNvCgXv3AEILt4SXYw9LjLl65sRhoHGZZpYRVuA5r6Hxeu6MtkGj2EZrJazEL2jwfMhvb+BVqEDX0/3gqpExXqbpknpi04Sd+92QQEJdx9LvRfs3MG9dXzvApGZs2ZtcbBE8k5TAeKS7SGvZHfmA841Tk3+E/nbUWamRt99d93eQMncvIT5i8yV7sM9MWbhyQj5hEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=t3EVKAIJcTqBgXu6y1+gNdpkvc+sELAuhXcVgDwnALwxAIvOxz0kcQEpKEHnMlORCOXsciGBBXeUkcN2wMrT9zbKI3FmHNYFUYAkjjvhwvNryUGptzJDNCS19o9zN5rXWZdkbhazwHHyeMm2dHVmmRtpWT5ehtZEdIjbR4R7uIriuq3OylCD9ye+lNSBSK6B/CgntBYoabUJzdiI+UZQ/Phj02plukDgYGwDGeo8O7OCGkgPRK6lwF+Kx9d4Xb90Z7v4mbrqCmHFw74KnkCN+H0QyVKpBQDzybzxvjg43Xjg7OV/VH2sZO+bIFR9XOg6oCsIhu0Usna1ZW5M92d3hg==
Received: from SN7PR04CA0023.namprd04.prod.outlook.com (2603:10b6:806:f2::28)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:44:15 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::4f) by SN7PR04CA0023.outlook.office365.com
 (2603:10b6:806:f2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:44:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:44:02 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:43:59 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 01/10] mellanox: Relocate mlx-platform driver
Date: Mon, 13 Jan 2025 10:43:23 +0200
Message-ID: <20250113084337.24763-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c943cf-fb42-4fd8-2f40-08dd33ae759f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|30052699003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WElTc0FkSTJxOHdjU042dndCNTJiTmJXK3gzd0w0MzRnT0tiV2tCOHNZaFFq?=
 =?utf-8?B?ay9oYlozR0p5MEtidm41amtKcE1La0xGR3dBMk1leW9IbGRpNmFBVm5IcEpU?=
 =?utf-8?B?QW1KN29BZ0F0cndtVHQ3MUZyS2xBUzdKeUphMW5XRGRERmZsYS9hcmZ0WWhR?=
 =?utf-8?B?TjNEK1FJQjI5T244cEYzSUFoSC9ZbG9SaXQ2MWNxd0MwSFc3Ukh3ZzZLL0Rr?=
 =?utf-8?B?S3U4TStSdjMzZFExdFE4SzRyUitsODRhU3JBNTkyL3c5UEd3MWoxaDc1VmNK?=
 =?utf-8?B?SGNYK01WRUFkZURReWlxVGc5bDRUbXBBeTRZVHZsS2twLzF0ampJUm9ReVUr?=
 =?utf-8?B?Q2xtUUNkdTJPQ2c5YWpJd0dLNG9uM083Zy93SmEzcWJaZEpQTUFaUWtINUFs?=
 =?utf-8?B?Zk0vMXdIWkxTNFU4SG54MWdiTDNSNjZ2YVg5Q2ZZR09yZ0RYdCs1N016bnZv?=
 =?utf-8?B?QVcydmxtSmM5WGgwVDdqTEpTL2tRSmVnZ3NrbFBJaDdXSVFWcW5EajQ0UVE5?=
 =?utf-8?B?b0RXVTVZcWUxb3E5VEN0UG5Zd3pnaVpVUWRlMGJ2Z1FtWEhWWnNKM1VyZnVX?=
 =?utf-8?B?cU1RbjBqYWNWdXcySkJ0cDZ6blZvVDMvSXI3VkMzY1pyZGRJeFRHZHVkOEE4?=
 =?utf-8?B?Zm9hTGhiWFY3VXdSMDJ4SHNUNldDQUhCS3hGT3hPKy92WE1sTmJ2VUlrS2hN?=
 =?utf-8?B?U1FCUjE0bUNXSmRPNGNkTnpCUnU4bkJUcnFNQUozdzlid080Ukl6SCttWHVk?=
 =?utf-8?B?TUsrZy9Ha2tKdGtidTJkcjc3bHJHa3N0aDZYMnNCZ2Y3Qms1eUo1OXBBcEI1?=
 =?utf-8?B?YU9mbXVrWlNvK2NYNy85ZmllUjJGKzQyUDNsZnNRMUltNjdCdkVkak40QlRM?=
 =?utf-8?B?dGEvUSt5U3hFbjZrVGJPMGtyMWxZWmQyOFVFZ084WXkxZWwvODFXTnFGanEz?=
 =?utf-8?B?NThWaDBmazdsL3lNcG1tYlRBN01RZEdROVVySFYvcVNmdVhLOE43ZkFtenFO?=
 =?utf-8?B?R1p6ZW9ybWZmSVVKZTgxVjNiNnRzSjIrL0dWNVJIcExxaUZxVXNwT0VoTWdJ?=
 =?utf-8?B?MC9IOHQxWUk4NGRTRmRxeGk2SzUremZma0RzQlFnMWwwQ1d6bGZtTE01OVMz?=
 =?utf-8?B?N0lFQ3NQcTYwL2pqTGF4T1ZHL29DWHVSU0FZU0dSdnNxTkQ1aWV4NTF2MVU4?=
 =?utf-8?B?Mk1LajF4M0doVFVoUnArRURLZnZhdlZqZHNBWlFkR2plUzY5ajVQZjV5cVBu?=
 =?utf-8?B?cis2Uml0U012NXdiaXEraGdBN29ibUJZY2FUUGlJcFVVcWdBU1ZiaVlxOU9t?=
 =?utf-8?B?dHpnT0NvUWZNbWxBNUJPbXl1ZGtQb0JQUXhOaDZUMktBdkhvclpwUENIM1ZC?=
 =?utf-8?B?bGN6emxXTy9KeVlyQTVtUzBjcFdTclRDdExkclhjTDVGTzFpTENvOWh3WHc3?=
 =?utf-8?B?UGtXK0JVOHZtOTM5UmowVmFVR3VXYTRWZDhzcmV6MHpTdVE0aTRnUU9ybmZa?=
 =?utf-8?B?cHBKU0hobGc4Rkt2Ync0eEFScXFkcVEzdEhyR2pGRERiRWY5TFRsT1NkMFpS?=
 =?utf-8?B?V05LVWhwWktJY0Zsa01NaDB3ZjZlakJtRndIOHRuWXRLNmdXS1J4MmszdDlp?=
 =?utf-8?B?YS9xK2pHTHpNSzI4azdITGhaSlRWYmJZZy9jUVFtMlBNM0dzNFZ0bjVxdHZq?=
 =?utf-8?B?MWRxY0diT3oweGh2Qk1XMWlOS3pFUEF3TVRxR0NaNWxOczcxWDBkSFcwbW15?=
 =?utf-8?B?VEJBcHFvMWQvQWY2WDkzbFJXSCtrVDZoNDU0YXhqc1k1MGFnL1lOS0ZrQXVC?=
 =?utf-8?B?S0l5Z0srb3JDbVNPaDdIblJkWDA2N2VtY0hSVElBd0JOVlZ6N0hGU0xUVlhh?=
 =?utf-8?B?ZmxzR0ZsVUU5bmkyaTVQTVZXK1ZXanR6dEFHd2d1cDVHZTVUQ2hZMlg5Wm9l?=
 =?utf-8?B?TVN2QlhzWjJxQ2s0TExYRFBrbTRRa3NVMWkyYUtIZzdkV2VhVHhDOURPbGJa?=
 =?utf-8?Q?TkfowsoDQ18KyvQvXcNX9E5RZ9mvas=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(30052699003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:44:14.5608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c943cf-fb42-4fd8-2f40-08dd33ae759f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731

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

