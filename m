Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826511CE6F5
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367152; cv=fail; b=vELT0q1VaJMWKJ9uYFGHt6IWhDMU/V/kzIpI5WvRHtPXzw4NdCxAlsR5TC7rKwelsIMDacILq5Hpps6dDBzuGyGyJ64PJnq82M9m25W/f//W8a20PwUlqgN3XDjfJSlQNkFpKdM1bkHvF7/jPWoRrxNixi0lS98XJYtQDy4Xgw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367152; c=relaxed/simple;
	bh=4dUDWuq9zno2fSubecIwY4Zj417YXfeNifgFbdGmLtI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oaTSpq6w5IQ34hksRvq9eRev238fwu6+zKS4lprSqbCwIhB9ROQjY/F++6viCrYxPZENoPP+LkYrOVueSllmgDyMqzTbsguSf33FGr7P4E32tkS4BgbYmdV67N4BBK6PlMQEZFM/1WO5RiDbhAPqqEdQ/6zFNA+MyxqsETc+HSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3AvWPfN+; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3AvWPfN+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6nHzFZ4Jk8D+gtwPAOtNgnxWxjX/H8GKDFlhEBjGfwiRkuEsuvSNygdKKzegm+DK6erkzwjNEW+t85cpLahWMub72seYlUW62vO7L5CwTlt8WKAz6OHpZ8BOvwB25tXNaps/r8v+oUr8Pij8rIfXkVXJzJ47ebGEeB2Wap6ubvuDgoL1184I6ATPcsygcxn5emIfR6jMztne3CvgMXrCjP2QWL38GnNED/bEhiCIPaqz95wS1OMeOADfjigocLJp4mSS1zQTW3KCl8RxyzCjJwXJZnEWqp5Aj8rIfHhvhyxb8d1VmTMtrJBSSj2utYEtK0EUSFkllhHF5UCkp0vng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6JYZFykt/wEZecREyeVCT87LRiFgmSKn7+piIloYy4=;
 b=KxLr+mgEC5c4rLxXQlSeglomw5aFqSDMDEvLsIXUyDKMcJdhj3uBfUt13lJHLFiqfQNqdYWoWXS6BiIWxNV0R3aU0sJpFZH2JrFYGLxay10j5BAGl2X7zmTdCoEaP8vh8cpKalIUzMXmIUlUSQRnw4XJHJXqpYkaP1RfcIpG84e4GnEtBonu8Nnwdtzf3ZkNG8zC9gSO+/yeujk0sMH66URqsMx1Fb6Jedy2Tv6D9B9mVv59Nv5h5lS1rQys88yIMFW+FGFlSekmh5FeONmIezRsAMEXQ5/oq3sGNCSaLEnHKzR6NRbfWHmSirkc1y7gt6lcUlPjQqPWn6TtSfD+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6JYZFykt/wEZecREyeVCT87LRiFgmSKn7+piIloYy4=;
 b=3AvWPfN+nUd3F/ThmDuUr4SJdN+OomABOcwgzGAy9G7PPl4EP77aaBOLZLh4t+4EVhMe1O/dvOjadRKbKVOmJonmJkIDVg4bEdypIDdq8Gy938Rjt0ky3jvgXu0nmNtpgrni7Cx+PWejxO9LMsXSh22flwtzfOa7VhKhlPrNyF8=
Received: from BL1PR13CA0380.namprd13.prod.outlook.com (2603:10b6:208:2c0::25)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 12:39:05 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::bf) by BL1PR13CA0380.outlook.office365.com
 (2603:10b6:208:2c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12 via Frontend
 Transport; Tue, 3 Sep 2024 12:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:39:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:39:02 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 08/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI and plat drivers
Date: Tue, 3 Sep 2024 12:38:28 +0000
Message-ID: <20240903123830.2717196-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903123830.2717196-1-suma.hegde@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b5e53c-7afb-4e1c-1a95-08dccc15659b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?at9z11ptMpHKrrQMOzGh0IESGV+GzwrH1yWMRuv0ZannLCxvgNRLBeqvfSb9?=
 =?us-ascii?Q?8gTfEqp1IfH8je5E2Qev6MouecQm5WIzRLAcJGhYjpDcDD7MptNU8uVu2ucw?=
 =?us-ascii?Q?EUTlJ6sWLfvGarQxn2/C+z60LYiY7oCx75RvC0Q7h6xQ8RiM1hAS/RJw1vpE?=
 =?us-ascii?Q?ISq9JxXyh3HC5jynmMr0pAglTAqgb4aP0BB3KVuE1+hRHdXAFigumH1/V+51?=
 =?us-ascii?Q?TKNLiY2mN3aOk/4FhKbL2Oi9zfg9LB4Mi+q18R2MjdVrr4/Eb86ZBuA+VUWG?=
 =?us-ascii?Q?+KypO9xFJYOPQjfI2BWE1ki4Ohgi/ZzQZ3gLlq7bTypYc+h6ErnaIVMyI4cc?=
 =?us-ascii?Q?RMhlSAoqOZil88xAqg8Vh/MVaDxVKEoDShtKDdGsos2r/IU2nv+mYMNAaH7c?=
 =?us-ascii?Q?+ShsNk487B8UmbIYmS1uoqsmlvc77DoBEiwx61QfF/rSMZpHuqmj40Meo0wH?=
 =?us-ascii?Q?msAfiK/1NAx+PX8Fp1aoBRU2unmxlqHr1KQeKijo9MbxSZqM2ajC/MFj/9eS?=
 =?us-ascii?Q?oS71GS8+O+QUkYBYnxST0vherwedGHUBWelFjAobDGwLSbEm0pIqjt7GaVcO?=
 =?us-ascii?Q?ah7Qt1ghj8Ef2DC8Lsl34JIrRTMDJilMPX4ZWNDYO9Wlb1MyuEzAdFkVbwV6?=
 =?us-ascii?Q?Oc17E4XBtsX/SASdz3DTvfpnJlldifELaQACKtizsjJkqlTi71FS2RxKXZlQ?=
 =?us-ascii?Q?ZXmTLp27OEI6efxddfef5u0n42p9s6m5334Bkki3JfaE+osCUtH6CJf6p2ec?=
 =?us-ascii?Q?l1V9ZJe1Rb1LD7Becq7mYm41FaWRT9BaZbNnInXYH5VmhQ6yJCrTX40W+96x?=
 =?us-ascii?Q?T+pl9Bg5rVOtB9pu2muJzA/QDTq8sgIll0zh1hEC4KGQu9573qvUTvyoAzEV?=
 =?us-ascii?Q?Nj1aKyDmiTV8MC7oMj0PyqQdgi99fTtpaGq3RS5LRXohDw5xl+F/XWhQSlVk?=
 =?us-ascii?Q?6USomKziev4x0lfEIxtMX6/vkNoUh39BuwUzv7ZT0gwU543Si/n+jUrlxnp0?=
 =?us-ascii?Q?y0v2bhxIlqj0kip8sf2OV8wQqDgub98tyta6BaUCtolwCutd4ab7Tdn7oGvt?=
 =?us-ascii?Q?F8sNDZRRXVI5urLYGWgojnLlWuWtVWC3q+2B1uAVLTMKN8X13503tyxjnl7S?=
 =?us-ascii?Q?utGw3Of+isrvsmvldBCkvE/od0rP3ImkSyBsUqEFxQxuLrgcsKynrTdiq6/a?=
 =?us-ascii?Q?6a0zs0nUPlcSCQHX5BFE+Ko8WpF3hY3xj7iI0zH2mgLz/W5tUGKopreUmiGD?=
 =?us-ascii?Q?1upfXLoPhUzgV2SET5Te4sMZgunaaYvjfcCcUkpUPEriAmPFlGs5rhD7fWnq?=
 =?us-ascii?Q?ZmEyuDO1rKeLJ+E64lWCi7GN+IgB1XwuQEOhqT88OWCRTjHnRWsugg5b+j7m?=
 =?us-ascii?Q?SrFsxKwafM524tRcTwtn5f4ETEn90mLuAomsFk/eZruvMi7EKZ4akgC/F7Oa?=
 =?us-ascii?Q?b5RUUjZ2/n7yfsrifMseaLeQPYgYoIcX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:39:04.9873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b5e53c-7afb-4e1c-1a95-08dccc15659b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992

Separate the probes for HSMP ACPI and platform device drivers.

Provide a Kconfig option to choose between
ACPI or the platform device based driver.
The common code which is the core part of the HSMP driver
maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
these two driver configs.

Also add "|| COMPILE_TEST" clause in Kconfig to get build coverage
for HSMP.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v6:
1. Keep the SPDX license line same as original hsmp.c file.
2. Reflow the paragraph in amd_hsmp.rst.

Changes since v5:
1. Update documentation to reduce line length, update SPDK line and update the wordings.
2. Change module license from GPL v2 to GPL and update SPDX license line in plat.c and acpi.c.
3. Update Kconfig with amd_hsmp.rst document name.

Changes since v4:
1. Update commit description.
2. Move common code from plat.c and acpi.c to hsmp.c and name it as hsmp_misc_register()
   and hsmp_misc_deregister().
3. Reduce line size in documentation.
4. Remove check_acpi_support() related code.

Changes since v3:
1. Added documentation for ACPI object.
2. Kconfig is updated.
3. Added COMPILE_TEST clause in Kconfig.

Changes since v2:
Following files are modified to add new symbol
 - drivers/platform/x86/amd/hsmp/Kconfig, 
 - drivers/platform/x86/amd/hsmp/Makefile
 - drivers/platform/x86/amd/Makefile
AMD_HSMP is used as common symbol and new AMD_HSMP_PLAT symbol is added

Changes since v1:
Rename "plat_dev" to "hsmp_pdev"

 Documentation/arch/x86/amd_hsmp.rst    |  66 +++++++-
 arch/x86/include/asm/amd_hsmp.h        |   2 +-
 drivers/platform/x86/amd/Makefile      |   2 +-
 drivers/platform/x86/amd/hsmp/Kconfig  |  37 ++++-
 drivers/platform/x86/amd/hsmp/Makefile |   6 +-
 drivers/platform/x86/amd/hsmp/acpi.c   |  82 +++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c   | 212 ++-----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c   | 144 ++++++++++++++++-
 9 files changed, 341 insertions(+), 218 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 1e499ecf5f4e..e4b4bbeed643 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -4,8 +4,9 @@
 AMD HSMP interface
 ============================================
 
-Newer Fam19h EPYC server line of processors from AMD support system
-management functionality via HSMP (Host System Management Port).
+Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf),
+Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD support
+system management functionality via HSMP (Host System Management Port).
 
 The Host System Management Port (HSMP) is an interface to provide
 OS-level software with access to system management functions via a
@@ -16,14 +17,24 @@ More details on the interface can be found in chapter
 Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
 
 
-HSMP interface is supported on EPYC server CPU models only.
+HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
 
 
 HSMP device
 ============================================
 
-amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
-/dev/hsmp to let user space programs run hsmp mailbox commands.
+amd_hsmp driver under drivers/platforms/x86/amd/hsmp/ has separate driver files
+for ACPI object based probing and platform device based probing. These two
+drivers are mutually exclusive drivers with compile time Kconfig options to
+choose between them. Both the drivers create the miscdevice /dev/hsmp to let
+user space programs run hsmp mailbox commands.
+
+The ACPI object format supported by the driver is defined below.
+
+Kconfig option CONFIG_AMD_HSMP compiles plat.c + hsmp.c
+for platform device based probing.
+Kconfig option CONFIG_AMD_HSMP_ACPI compiles acpi.c + hsmp.c
+for ACPI object based probing.
 
 $ ls -al /dev/hsmp
 crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
@@ -59,6 +70,51 @@ Note: lseek() is not supported as entire metrics table is read.
 Metrics table definitions will be documented as part of Public PPR.
 The same is defined in the amd_hsmp.h header.
 
+ACPI device object format
+=========================
+The ACPI object format expected from the amd_hsmp driver
+for socket with ID00 is given below.
+
+Device(HSMP)
+		{
+			Name(_HID, "AMDI0097")
+			Name(_UID, "ID00")
+			Name(HSE0, 0x00000001)
+			Name(RBF0, ResourceTemplate()
+			{
+				Memory32Fixed(ReadWrite, 0xxxxxxx, 0x00100000)
+			})
+			Method(_CRS, 0, NotSerialized)
+			{
+				Return(RBF0)
+			}
+			Method(_STA, 0, NotSerialized)
+			{
+				If(LEqual(HSE0, One))
+				{
+					Return(0x0F)
+				}
+				Else
+				{
+					Return(Zero)
+				}
+			}
+			Name(_DSD, Package(2)
+			{
+				Buffer(0x10)
+				{
+					0x9D, 0x61, 0x4D, 0xB7, 0x07, 0x57, 0xBD, 0x48,
+					0xA6, 0x9F, 0x4E, 0xA2, 0x87, 0x1F, 0xC2, 0xF6
+				},
+				Package(3)
+				{
+					Package(2) {"MsgIdOffset", 0x00010934},
+					Package(2) {"MsgRspOffset", 0x00010980},
+					Package(2) {"MsgArgOffset", 0x000109E0}
+				}
+			})
+		}
+
 
 An example
 ==========
diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
index 03c2ce3edaf5..ada14e55f9f4 100644
--- a/arch/x86/include/asm/amd_hsmp.h
+++ b/arch/x86/include/asm/amd_hsmp.h
@@ -5,7 +5,7 @@
 
 #include <uapi/asm/amd_hsmp.h>
 
-#if IS_ENABLED(CONFIG_AMD_HSMP)
+#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
 int hsmp_send_message(struct hsmp_message *msg);
 #else
 static inline int hsmp_send_message(struct hsmp_message *msg)
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index 96ec24c8701b..f0b2fe81c685 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -5,6 +5,6 @@
 #
 
 obj-$(CONFIG_AMD_PMC)		+= pmc/
-obj-y				+= hsmp/
+obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
index b55d4ed9bceb..b10ff91e9f5a 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -4,14 +4,45 @@
 #
 
 config AMD_HSMP
-	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64 && ACPI
+	tristate
+
+menu "AMD HSMP Driver"
+	depends on AMD_NB || COMPILE_TEST
+
+config AMD_HSMP_ACPI
+	tristate "AMD HSMP ACPI device driver"
+	depends on ACPI
+	select AMD_HSMP
 	help
+	  Host System Management Port (HSMP) interface is a mailbox interface
+	  between the x86 core and the System Management Unit (SMU) firmware.
 	  The driver provides a way for user space tools to monitor and manage
-	  system management functionality on EPYC server CPUs from AMD.
+	  system management functionality on EPYC and MI300A server CPUs
+	  from AMD.
+
+	  This option supports ACPI based probing.
+	  You may enable this, if your platform BIOS provides an ACPI object
+	  as described in amd_hsmp.rst document.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_hsmp.
 
+config AMD_HSMP_PLAT
+	tristate "AMD HSMP platform device driver"
+	depends on AMD_HSMP_ACPI=n
+	select AMD_HSMP
+	help
 	  Host System Management Port (HSMP) interface is a mailbox interface
 	  between the x86 core and the System Management Unit (SMU) firmware.
+	  The driver provides a way for user space tools to monitor and manage
+	  system management functionality on EPYC and MI300A server CPUs
+	  from AMD.
+
+	  This option supports platform device based probing.
+	  You may enable this, if your platform BIOS does not provide
+	  HSMP ACPI object.
 
 	  If you choose to compile this driver as a module the module will be
 	  called amd_hsmp.
+
+endmenu
diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index 0cc92865c0a2..18d9a0d1e8c5 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -4,5 +4,7 @@
 # AMD HSMP Driver
 #
 
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o plat.o acpi.o
+obj-$(CONFIG_AMD_HSMP)			+= amd_hsmp.o
+amd_hsmp-objs				:= hsmp.o
+amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)	+= plat.o
+amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)	+= acpi.o
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 6f8e7962266a..766617e6adc7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -9,11 +9,15 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/amd_nb.h>
+
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
 
@@ -21,6 +25,10 @@
 
 #include "hsmp.h"
 
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"2.3"
+#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
+
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
 #define MSG_ARGOFF_STR		"MsgArgOffset"
@@ -200,7 +208,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	sock->sock_ind		= sock_ind;
 	sock->dev		= dev;
 	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
-	hsmp_pdev.is_acpi_device	= true;
 
 	sema_init(&sock->hsmp_sem, 1);
 
@@ -213,7 +220,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-int hsmp_create_acpi_sysfs_if(struct device *dev)
+static int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
 	struct attribute_group *attr_grp;
 	u16 sock_ind;
@@ -236,7 +243,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-int init_acpi(struct device *dev)
+static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
@@ -270,3 +277,72 @@ int init_acpi(struct device *dev)
 
 	return ret;
 }
+
+static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
+	{ACPI_HSMP_DEVICE_HID, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
+
+static int hsmp_acpi_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.num_sockets = amd_nb_num();
+		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+			return -ENODEV;
+
+		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+					      sizeof(*hsmp_pdev.sock),
+					      GFP_KERNEL);
+		if (!hsmp_pdev.sock)
+			return -ENOMEM;
+	}
+
+	ret = init_acpi(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		return ret;
+	}
+
+	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+
+	if (!hsmp_pdev.is_probed) {
+		ret = hsmp_misc_register(&pdev->dev);
+		if (ret)
+			return ret;
+		hsmp_pdev.is_probed = true;
+	}
+
+	return 0;
+}
+
+static void hsmp_acpi_remove(struct platform_device *pdev)
+{
+	/*
+	 * We register only one misc_device even on multi-socket system.
+	 * So, deregister should happen only once.
+	 */
+	if (hsmp_pdev.is_probed) {
+		hsmp_misc_deregister();
+		hsmp_pdev.is_probed = false;
+	}
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_acpi_probe,
+	.remove_new	= hsmp_acpi_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
+	},
+};
+
+module_platform_driver(amd_hsmp_driver);
+
+MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 78945750d590..5e0c9c36f435 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -15,17 +15,11 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
 #include "hsmp.h"
 
-#define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
-
 /* HSMP Status / Error codes */
 #define HSMP_STATUS_NOT_READY	0x00
 #define HSMP_STATUS_OK		0x01
@@ -228,7 +222,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	return ret;
 }
 
-static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
@@ -284,12 +278,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-static const struct file_operations hsmp_fops = {
-	.owner		= THIS_MODULE,
-	.unlocked_ioctl	= hsmp_ioctl,
-	.compat_ioctl	= hsmp_ioctl,
-};
-
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
 			     loff_t off, size_t count)
@@ -414,193 +402,25 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 	return ret;
 }
 
-static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
-	{ACPI_HSMP_DEVICE_HID, 0},
-	{}
-};
-MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
-
-static bool check_acpi_support(struct device *dev)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-
-	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
-		return true;
-
-	return false;
-}
-
-static int hsmp_pltdrv_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	/*
-	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
-	 * each socket, so the per socket probing, but the memory allocated for
-	 * sockets should be contiguous to access it as an array,
-	 * Hence allocate memory for all the sockets at once instead of allocating
-	 * on each probe.
-	 */
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
-					      sizeof(*hsmp_pdev.sock),
-					      GFP_KERNEL);
-		if (!hsmp_pdev.sock)
-			return -ENOMEM;
-	}
-	if (check_acpi_support(&pdev->dev)) {
-		ret = init_acpi(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-			return ret;
-		}
-		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-		if (ret)
-			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-	} else {
-		ret = init_platform_device(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-			return ret;
-		}
-		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-		if (ret)
-			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-	}
-
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
-		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
-		hsmp_pdev.mdev.fops	= &hsmp_fops;
-		hsmp_pdev.mdev.parent	= &pdev->dev;
-		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
-		hsmp_pdev.mdev.mode	= 0644;
-
-		ret = misc_register(&hsmp_pdev.mdev);
-		if (ret)
-			return ret;
-
-		hsmp_pdev.is_probed = true;
-	}
-
-	return 0;
-
-}
-
-static void hsmp_pltdrv_remove(struct platform_device *pdev)
-{
-	/*
-	 * We register only one misc_device even on multi socket system.
-	 * So, deregister should happen only once.
-	 */
-	if (hsmp_pdev.is_probed) {
-		misc_deregister(&hsmp_pdev.mdev);
-		hsmp_pdev.is_probed = false;
-	}
-}
-
-static struct platform_driver amd_hsmp_driver = {
-	.probe		= hsmp_pltdrv_probe,
-	.remove_new	= hsmp_pltdrv_remove,
-	.driver		= {
-		.name	= DRIVER_NAME,
-		.acpi_match_table = amd_hsmp_acpi_ids,
-	},
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
 };
 
-static struct platform_device *amd_hsmp_platdev;
-
-static int hsmp_plat_dev_register(void)
+int hsmp_misc_register(struct device *dev)
 {
-	int ret;
-
-	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
-	if (!amd_hsmp_platdev)
-		return -ENOMEM;
-
-	ret = platform_device_add(amd_hsmp_platdev);
-	if (ret)
-		platform_device_put(amd_hsmp_platdev);
-
-	return ret;
+	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
+	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
+	hsmp_pdev.mdev.fops	= &hsmp_fops;
+	hsmp_pdev.mdev.parent	= dev;
+	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
+	hsmp_pdev.mdev.mode	= 0644;
+
+	return misc_register(&hsmp_pdev.mdev);
 }
 
-/*
- * This check is only needed for backward compatibility of previous platforms.
- * All new platforms are expected to support ACPI based probing.
- */
-static bool legacy_hsmp_support(void)
+void hsmp_misc_deregister(void)
 {
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
-		return false;
-
-	switch (boot_cpu_data.x86) {
-	case 0x19:
-		switch (boot_cpu_data.x86_model) {
-		case 0x00 ... 0x1F:
-		case 0x30 ... 0x3F:
-		case 0x90 ... 0x9F:
-		case 0xA0 ... 0xAF:
-			return true;
-		default:
-			return false;
-		}
-	case 0x1A:
-		switch (boot_cpu_data.x86_model) {
-		case 0x00 ... 0x1F:
-			return true;
-		default:
-			return false;
-		}
-	default:
-		return false;
-	}
-
-	return false;
+	misc_deregister(&hsmp_pdev.mdev);
 }
-
-static int __init hsmp_plt_init(void)
-{
-	int ret = -ENODEV;
-
-	/*
-	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
-	 * if we have N SMN/DF interfaces that ideally means N sockets
-	 */
-	hsmp_pdev.num_sockets = amd_nb_num();
-	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
-		return ret;
-
-	ret = platform_driver_register(&amd_hsmp_driver);
-	if (ret)
-		return ret;
-
-	if (!hsmp_pdev.is_acpi_device) {
-		if (legacy_hsmp_support()) {
-			/* Not ACPI device, but supports HSMP, register a plat_dev */
-			ret = hsmp_plat_dev_register();
-		} else {
-			/* Not ACPI, Does not support HSMP */
-			pr_info("HSMP is not supported on Family:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			ret = -ENODEV;
-		}
-		if (ret)
-			platform_driver_unregister(&amd_hsmp_driver);
-	}
-
-	return ret;
-}
-
-static void __exit hsmp_plt_exit(void)
-{
-	platform_device_unregister(amd_hsmp_platdev);
-	platform_driver_unregister(&amd_hsmp_driver);
-}
-
-device_initcall(hsmp_plt_init);
-module_exit(hsmp_plt_exit);
-
-MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
-MODULE_VERSION(DRIVER_VERSION);
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 9c5b9c263fc1..9ab50bc74676 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -52,7 +52,6 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_acpi_device;
 	bool is_probed;
 };
 
@@ -61,14 +60,13 @@ extern struct hsmp_plat_device hsmp_pdev;
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
 			     loff_t off, size_t count);
-int hsmp_create_non_acpi_sysfs_if(struct device *dev);
-int hsmp_create_acpi_sysfs_if(struct device *dev);
 int hsmp_cache_proto_ver(u16 sock_ind);
 umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 				  struct bin_attribute *battr, int id);
 int hsmp_create_attr_list(struct attribute_group *attr_grp,
 			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
-int init_platform_device(struct device *dev);
-int init_acpi(struct device *dev);
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
+void hsmp_misc_deregister(void);
+int hsmp_misc_register(struct device *dev);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e18cf82478a0..e49b53f8c5e3 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -12,11 +12,16 @@
 #include <asm/amd_nb.h>
 
 #include <linux/device.h>
+#include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/sysfs.h>
 
 #include "hsmp.h"
 
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"2.3"
+
 /*
  * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
  * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
@@ -50,7 +55,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
-int hsmp_create_non_acpi_sysfs_if(struct device *dev)
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
+};
+
+static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 {
 	const struct attribute_group **hsmp_attr_grps;
 	struct attribute_group *attr_grp;
@@ -88,7 +99,7 @@ static inline bool is_f1a_m0h(void)
 	return false;
 }
 
-int init_platform_device(struct device *dev)
+static int init_platform_device(struct device *dev)
 {
 	struct hsmp_socket *sock;
 	int ret, i;
@@ -134,3 +145,132 @@ int init_platform_device(struct device *dev)
 
 	return 0;
 }
+
+static int hsmp_pltdrv_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+				      sizeof(*hsmp_pdev.sock),
+				      GFP_KERNEL);
+	if (!hsmp_pdev.sock)
+		return -ENOMEM;
+
+	ret = init_platform_device(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+		return ret;
+	}
+
+	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+
+	return hsmp_misc_register(&pdev->dev);
+}
+
+static void hsmp_pltdrv_remove(struct platform_device *pdev)
+{
+	hsmp_misc_deregister();
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_pltdrv_probe,
+	.remove_new	= hsmp_pltdrv_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+	},
+};
+
+static struct platform_device *amd_hsmp_platdev;
+
+static int hsmp_plat_dev_register(void)
+{
+	int ret;
+
+	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
+	if (!amd_hsmp_platdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(amd_hsmp_platdev);
+	if (ret)
+		platform_device_put(amd_hsmp_platdev);
+
+	return ret;
+}
+
+/*
+ * This check is only needed for backward compatibility of previous platforms.
+ * All new platforms are expected to support ACPI based probing.
+ */
+static bool legacy_hsmp_support(void)
+{
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	switch (boot_cpu_data.x86) {
+	case 0x19:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+		case 0x30 ... 0x3F:
+		case 0x90 ... 0x9F:
+		case 0xA0 ... 0xAF:
+			return true;
+		default:
+			return false;
+		}
+	case 0x1A:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+			return true;
+		default:
+			return false;
+		}
+	default:
+		return false;
+	}
+
+	return false;
+}
+
+static int __init hsmp_plt_init(void)
+{
+	int ret = -ENODEV;
+
+	if (!legacy_hsmp_support()) {
+		pr_info("HSMP is not supported on Family:%x model:%x\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+		return ret;
+	}
+
+	/*
+	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
+	 * if we have N SMN/DF interfaces that ideally means N sockets
+	 */
+	hsmp_pdev.num_sockets = amd_nb_num();
+	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+		return ret;
+
+	ret = platform_driver_register(&amd_hsmp_driver);
+	if (ret)
+		return ret;
+
+	ret = hsmp_plat_dev_register();
+	if (ret)
+		platform_driver_unregister(&amd_hsmp_driver);
+
+	return ret;
+}
+
+static void __exit hsmp_plt_exit(void)
+{
+	platform_device_unregister(amd_hsmp_platdev);
+	platform_driver_unregister(&amd_hsmp_driver);
+}
+
+device_initcall(hsmp_plt_init);
+module_exit(hsmp_plt_exit);
+
+MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL");
-- 
2.25.1

