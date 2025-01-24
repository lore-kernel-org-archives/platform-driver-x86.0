Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E4315CD79
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739643; cv=fail; b=ooh6Nu85cMTf/JeK95w8AvfAWVbjvrH2jhXRmpyzBD+UeNCCzM+AUepQA9EyYHDA95P9f/2KgWcY8ZBoUIefydJicqUTjAkg3L0VsRQZd51DP1vKHxEEFPV6lkpEv93qDqqZ2IpcuQ9tHou4OjBsXw1xoJ1K5CPQH34TqinV110=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739643; c=relaxed/simple;
	bh=eWSbmUsnWUXm4nEj1mn7jGnY45RMMSai8bR78TLUSew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMYqq/S9z/+ETVjb/PpLzxnlK6JLZT4ovAzInC49gkdRTmW64fQCwVG1/DqjbE2GOuOrUq9qbkii1+Pg90m6jzFuRa8ecn4JwIrQQIh85g4B0U/YHS1L1QQbn9FlFzK0v0WHSpztQNR6rSo/NC/LilqY/uj2ItOb0G43STw6z9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HeJNQoho; arc=fail smtp.client-ip=40.107.102.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HeJNQoho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBmvkun9sTwoVmssLW2GBVV9pCIetDaGyPjz/kri53+ekduRU3ypi9i7TQL9iIAZ+eGAkSU7Q3COoI8m7lZsQPHB+YymL5xBvewbLU30DzQQSyIVXXPMox2d4SBddPP0GfThLU6+GgTpMnYz70BLVFEdZrGkrg3KZ/B9xulSvClQbUvAMTklAI1X9V/s4/XOuR+tarAhWNlFuuC6P9V8EzRXXB+eUdhc5uDwrcm1jiUoSMsSlPFjrwqqxi6n+q357T7d2vr7ZVB2MaEEklnJNL/uAoCHKI2GSHdCa1oqswxYqNeiy+3R/u6w1B9lnreanaVsZXKh9ZzrJai7HtNk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=goTAwk6Ynb9e7/WtSWFKGg7DJifHmmSUsIU9A06+8AcUWCbD2RxwOSfpn6EoeAbd7Acr1YTS9rtvawW5hIAeW5d6izQ/SECCAKqb8aQcKF2nVUXQw2Fc5VcmhGgi41OdMcjIr8DKoM/6ApCtXpk9Mh9tUGaWzDVcDClQUyjokhc64j8/kqof6pHHL/bbwxEAgzxyjBwogZaReHhR0OKb7Wm2JI/iOXEngaZJrj3OxdPRUaYfEuOhDVxIWG7HXqxisaXy/Zdxkwpg+PlzzXU0sodZ0sjEGATg9t1wYc8HNbq/V8bxFtmgfmaFLgd+5nOQ7cKJxIViW7TvGX5V4M6F0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1VkwW4uLzksdkSRXDmXecCM+z/ASEcZrsg9oTV1EXs=;
 b=HeJNQoho/NZyBNkFVoiLllhjgVQSzm4JVnGWpKTpp5RLeYCnvnhV1Rw/efH3zIAAKWUy7aSvwCTeXBQ+5AnmGET85llpikmVmf+Sshzo+4ipuhJvvzcZ5YR5BdZHoAT0nDI6uItg2dkcGc+8+l5ro4Lmk03AsGYCwTR1z673ZY/y3vOK771yW54DfPteLPMNKJ3IHfOa3wW+Tfg/IwyvSz6Zu0CQ8inTs0e2+4vDH8rDwvhTTfwcwRR9GpSCCKWcv1MGvKIk/4lIVMyZnwgA+YjxmUI5GFOXfDsJbLkQHYqkX4J4kTJQHwNbiivPyyedVZ7qExHIfaa2/KTF6SKLgw==
Received: from CH0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:610:e6::11)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 17:27:15 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::bf) by CH0PR03CA0276.outlook.office365.com
 (2603:10b6:610:e6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 17:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:27:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:26:57 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:26:54 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 01/12] mellanox: Relocate mlx-platform driver
Date: Fri, 24 Jan 2025 19:26:19 +0200
Message-ID: <20250124172632.22437-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250124172632.22437-1-vadimp@nvidia.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: b90c5d0c-2814-4088-58d2-08dd3c9c5819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU1EMGVnR3JneC9FU29CZzRiam9RanZBVStKUlVNbWdDUWtSRXc2WlJSUnlR?=
 =?utf-8?B?T0xVZEJ4QmppUVJRSEN4ei8zb0dSREdwcnNjMDFoTmV0cDhNNlJ4aTJIVGcw?=
 =?utf-8?B?N0NjeGJ4TVpGTkVjTkd0T293d0FRYmFhc1JFNmVGSytCNHZCejBkRW9vNmFH?=
 =?utf-8?B?bjhidm1lQjNwYTN1aVdCQ2NRUmJTdWVlUmtuOWp3NWZySklsWTFHTmtUT08x?=
 =?utf-8?B?MU8zMXRwcnlyY2xpQnlWM2UydW5lb2dzdUVzMWxldUNsSWZQV1NDYU9PUTEr?=
 =?utf-8?B?V0NkeTE1dzF2SWR1d2MyVGd6V1RPVlNHaDhOaFg0MzlqZnpnajM2TEQ1Uy9q?=
 =?utf-8?B?TVpDTXM0dWpzdzFLQWJISkdySnBZL0FDQVdFSVlGMTZ6djVtQWJkR3RCU2JR?=
 =?utf-8?B?U2ptSTJyd3VYckJTeFpJeGQ1R3pYK01HbjhtQ1hoLzdsbGpQNFpoUWhwSmxY?=
 =?utf-8?B?MGQ2T0xBeit1SnZpVTl3Y0hmNGd6UTkvNkl5a0lZWEVRMDFTUGs4Y0tNeDVU?=
 =?utf-8?B?bGhYV1VrQ0k0aTZGWmc0aDhjZWUrdS9ENnF0WGJaNlVCSTdkc2dtZmNVYkxT?=
 =?utf-8?B?ODdWU2pvdE5XZWFQU2RPbTRKNEZONW1IdmRsM0l6RDNjeWFYeExObkhkZEpt?=
 =?utf-8?B?b29xUTRlWlBnUCtRbnlqN3RMMnhPWTdFRW1BOVB3WUJxNHUyZXVEQm80eTBo?=
 =?utf-8?B?UkNzMThIMTZEL3Q1QXhNTDlsRjhBTDVmMVkxdUNHQjZJTTNJTlVPcEZmeDdH?=
 =?utf-8?B?MDBvTmpZV0dnT24wK0dkSjRlRVVEWGE5blA1bUkycmVMb0ZBOFJ2amFKRHFZ?=
 =?utf-8?B?NzU0eXh5WXQ1VVdMS0owU3lrVU1tWXFPNGsxUWNxaGYra2dZdEpSVGMySEFB?=
 =?utf-8?B?WnZmZEtMMmthUkRPekJNY2VScWp0SmdLSnZVdWdhVThJZHB3VHhkd2RiUFA3?=
 =?utf-8?B?STlzTHlYOEZKT2FGVFVia1FGeDlKdnJMazdXKzNRVUVmRmdJVVZQYzFkRWF0?=
 =?utf-8?B?azRWOE5sbFBWaS9uMXQzK0gybUVFanRUWlBmNUpCbm5OL0VFUHlNUzNKYTYr?=
 =?utf-8?B?QkFjaUhEcGVna0lvWWVKbGpLK1IxZ01yaHU2VkFGYVNYMGJTVWdYL1Z1OUxl?=
 =?utf-8?B?UWNMYmVjdlNOSUZneDZDTGhtamNvTXhGSnUxMmtaWlBCSllXTHg0TndoaXc2?=
 =?utf-8?B?T3l6S2ZnNnFlVzM1dDRiSGFGdnlrK05maCtLNFRZS3pSU1lBK3oreVpTRFQz?=
 =?utf-8?B?bmRHalhkbHlVcTAyc0hnbk5CcGJwcE5rQjBhNk9rWUJrbHdNQnJ0YW4zZnZi?=
 =?utf-8?B?R2loUHkyMk54Q1RFR2ZqKzZWMVNCRFhJd1JEaTB4eUpEYUNsUEdWdkRhbVlm?=
 =?utf-8?B?ZVJmV20yYU1YUHo3Slp1WUwxYzZnaVhKbXR1N3FyQnpleTRZNTA1STh3Y0Q3?=
 =?utf-8?B?ZXRQd29oZm5TQ2NSLytUV09RTlRHbjdaZ3htdkJ6b3hOQWtkZVFML3VxME9B?=
 =?utf-8?B?STdKZjA1T29YU3IwY0pLcmsvZng2dEpmZUpYUkltSmZWTHFqcTU4YnBqV1l0?=
 =?utf-8?B?NG1GVTlRN09UMEo0cXdjWjNnUU1sUnBjeFlYVE1TcngyNXZSWGcwREFJQ2Uz?=
 =?utf-8?B?RHBmYkdXYXQwS05BQmM5VnR5eWY0dG5WNEZ1TGM0cEpMME5Lc0FrbWszT2Qv?=
 =?utf-8?B?alpxbDJuZ01kcnBMWkJzZmJ1T2g0M2VTQ2pvUUozekNLQWQ2dThQNmlJcEJH?=
 =?utf-8?B?dHZTd1dhSU5tRjlNenpubnBlWHNCZFRJSHNzK3lKTzNLcHpUNENqOUp0bFpn?=
 =?utf-8?B?TGZBWDdUYXRvNnMvdkN3U2VINm04ZzdIaXJ4MTJ6M25IcTZGVEt5bUNnWUoz?=
 =?utf-8?B?ZURCQXZoOG1ISW12S3hZeWFVQnlsaEpmYmpidXlUOUo2OFdjUm5oa1NrT3A2?=
 =?utf-8?B?MmVHdGJPbHVnTHZOYXVyNDY1ZFFGV2d6cW5US3BOdVlvVDhtdE1lWXdxeUZI?=
 =?utf-8?Q?EM3jHkSjQgOczHmxw/WqhVnDRgkGMA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:27:14.5536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b90c5d0c-2814-4088-58d2-08dd3c9c5819
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327

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

