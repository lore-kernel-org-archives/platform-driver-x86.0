Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A490418C012
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438421; cv=fail; b=tiFbA9MCc1rXiy/DwExPWG76QTED5vCTgjjsaslooj/KTkwb888qiPyo85kIwWHNMXD3QXhhgyueTGMoHiTRUlJdi3hzHkmNZQ5OHGsiI64dMSVf3iiy1OoC6agWb3LFq16bZY7I5xmiW3Mkg+PPfpHcCsSmuwd3YzEJb5X9OVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438421; c=relaxed/simple;
	bh=XUDem1CkTAA9no8JGItQIFmTfrf3f5IR7YfSqRtQz1w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ea8ks/jH1J5Xpi3sLVE3SXV7VR6q3Rq7IW6VhyxUoiQ+xzp/QNhpKq/jVRpu0cC2jNl5jaLGQNOlIlD1I4EIov5T6K6XQqGlFWkTbJPM0d6DSTOhnXELETMFtE8QwxFlA45hw9zisGNlVagjZK6fonFDOQ/nJQZSueIYSE0E870=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5cRQic8X; arc=fail smtp.client-ip=40.107.243.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5cRQic8X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V26gxDkn3B7YrUZTOExyTXfxJKLfe8nmkskaVfGQyUZy31TWFsm3UFP8gGyKJsKkdMoCrpqkBoQuFmBks1TpAUJ8G7cf7Z6ruEkyqLWh067IjeqAqVXtXgjxgKDSDmBh5wgmHwA/1gejM/MA0KU/uaFEyM+9z3l7lDM/HLkGyyPnIiE6HxR9IRzhhXN/lY8F/gkHuAAM23JJBmj48c6/1Q8btOj3+KuxceDqZFzlAz6FIbTSfRU+R72TgYH+Le/yJG0eX0Wyqn9X9Vau9qL2Osy7F6BfE56zElQQd+koOHWoG7lmRXnSTLumRdV0O9lW8X7q9jaWWfS17u5n+LURLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bobpo8zJTFHepaqkIfoLqyr2A18P+qDCb0vS5xk6eIk=;
 b=xRJJM57dHmkfX8nr9g6C/39N9ZrjGWPyjJqYh2Sw2prP4DfrOaWe4wwd4BPiB1tFpPo8BVAYCW97mGF7KwKNgvsSanWtFY8kA+NdjOH4PpU7/wh602R85ui90eT6CQT9nQWgQp53I8kzl1wHLxePkTm14gN2S8rVUOvModEH9Y22TNxuGIaSWGZ3MS0z5cpz4f6+MK7STYaMCw5uC0hVqNqYD6l9bZ8ubhsafrPjLb4yhnhr9nZE/2VR/ZEN/yhE7ZSdQvT/BjsldaykRm1Fo5Md5dCF1FT6s8/92/rt2J2Gx1jF3V5gUhEHoagwoyaq5zohsE0l6sx3Fa7rmFjauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bobpo8zJTFHepaqkIfoLqyr2A18P+qDCb0vS5xk6eIk=;
 b=5cRQic8XWpXSMoaIl7vozshWzaz6UoB+NjjVXHYoaB1CUHWsHMmP/kfJMBINQ6YwwxvUXxtIFVHyFGgEY6/Muf7WRv+QzoIl9x9+yW9EWU+gTJcUydIB7i4H/I2yOQifHH1WE/wRxp3rrP7DC7lbhlt6qObNrtKBYc0Jk8t2nmc=
Received: from SN7PR18CA0007.namprd18.prod.outlook.com (2603:10b6:806:f3::27)
 by LV2PR12MB5725.namprd12.prod.outlook.com (2603:10b6:408:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 12:00:12 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::d9) by SN7PR18CA0007.outlook.office365.com
 (2603:10b6:806:f3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Fri, 27 Sep 2024 12:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:12 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 07:00:09 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 08/11] platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers
Date: Fri, 27 Sep 2024 11:59:18 +0000
Message-ID: <20240927115921.10909-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927115921.10909-1-suma.hegde@amd.com>
References: <20240927115921.10909-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|LV2PR12MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7ea531-68df-4429-55bc-08dcdeebf129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZynyU1aKxN3eqlnN0hXMRrB7RIJyUrMGu9TOu5qRKh2hQM7gR4by8V9+ps4O?=
 =?us-ascii?Q?NwEBNEVs26Ytnsg3VquPjvNRT9znXa6lBdW4Z7a94IeFKIsDDQ/AmR2f8oTw?=
 =?us-ascii?Q?vRgSv0KpDT/+NMQ7hnyateRaVy/VXqe1VQVHq/DJ1kyLTp3n4KOuzJ/C7SRv?=
 =?us-ascii?Q?243PETaaysr3em6zpLuQI5M9OYTFF5/2NLamNu9DEt8yu6EUDG/VowtHiHdA?=
 =?us-ascii?Q?dye0Gzy6Mqp5zpXwYGLqADb6E/jUH7cLoe0mjqWZZ//RGIJkYZ9u/tTP7yDw?=
 =?us-ascii?Q?sgQngFhQdq+QASVQO+WKa7nLa768qdSVNXlVH990HNzD3FWNp71iWVyGG4US?=
 =?us-ascii?Q?Mk9iYz/NQrLTUdoXyx85Yp/5KryOgsW86A+kwlmrzzq7njnwBwNbfLBny5i0?=
 =?us-ascii?Q?zQ1/Ew576njvK+J5uNKRS3jLesnFD9Yc13NYq8PUjiA91+80ud9IK8rF0mDZ?=
 =?us-ascii?Q?PsjB3sgm0LM3qmzeudCE/triz69sgn8bQew6gUd5eVav6Zcc8xg6eo2XwBP5?=
 =?us-ascii?Q?HU5X5XbuPGJGjU71ql3lZexWYde2gS6N6hiOpnR/w1IiWVPzuxQ+wHGtjVEd?=
 =?us-ascii?Q?CyMiNxSQqMisQLdnrZ1g3XN8ugdqi3AHKktOyDVggEwLn9qDMckrSCfQKWMD?=
 =?us-ascii?Q?7hv5ZYBynLPH6hV+6lwczAC5be8UY2GF7OkkhxKbr/NEdAhK1SO8tENWicNh?=
 =?us-ascii?Q?jG0zPTe7zgC4PbvX+Ov5C+S+sCG3VI58XAKqB5cqCg0aBtLnOmURNLdQ13rW?=
 =?us-ascii?Q?ewydzNPN0bo0/nUo0ChV3wujmdfuKc4Y7MBHtbZUGuKHCzq/85DJ1yH/p3ii?=
 =?us-ascii?Q?PO7l2V0Su/Ky5d1TpT5b8u0I7W8cEPUnnr/rxZc6fHkjPH5sjHPDoTNSnd1a?=
 =?us-ascii?Q?E9ihzMjMQXH6boXF5kXGTo9vf+ERW3lN/S5usjPZAQsHQo7Z+nt534Zjaree?=
 =?us-ascii?Q?EOYsazkBfJGNJcAgIDfb/TxZEaRjHxWFUTQOw28gkAJAq2R93J1APBB8fYOr?=
 =?us-ascii?Q?BFzaop1s9lH9glwTvD17wvi2i6OLcPWvF5DfUxkYf+RWPjTPgQm2UKHTsLQf?=
 =?us-ascii?Q?OT2pyxG5bsXhKMOZVvzsTaoVZA/0qFuN0lIW+Jcmpzc68lzrahLXbUbTL0YM?=
 =?us-ascii?Q?uU4lUt0g9yw+SUtrQGrg3BaRS6ECg4OO2z7hILvJGh62AZsBIaxw6ctxqsPa?=
 =?us-ascii?Q?YSGeRAVM8+riXZ5h/1gxYtIC6lS6i15KWDKgV86NrJ4vQKvPiKaSJig9BP3T?=
 =?us-ascii?Q?1t6843nuOaTfJo+C01TqELW/y/2lcZtc4kgP2GBsUs/Rsbyjw9snF6orOIRK?=
 =?us-ascii?Q?Rknq7zRhctsKyS5VCM/VgISthlJ5AU2NT8HNZaFErORog9xuYyQiAnk4JVTe?=
 =?us-ascii?Q?yQWd+vwH0xyeirtV7XsupBw90c/bv5tcvb3+izlRilTVh6L7Kpn/lmlDsxLX?=
 =?us-ascii?Q?V+7NaOmEK0w48Slp2DzMaYzO7Vm2z8QW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:12.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7ea531-68df-4429-55bc-08dcdeebf129
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5725

Separate the probes for HSMP ACPI and platform device drivers.

Provide a Kconfig option to choose between ACPI or the platform device
based driver. The common code which is the core part of the HSMP driver
maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
these two driver configs. This will be built into separate hsmp_common.ko
module and acpi as hsmp_acpi and plat as amd_hsmp respectively.

Also add "|| COMPILE_TEST" clause in Kconfig to get build coverage for
HSMP.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v7:
1. Commit description is updated.
2. Makefile is updated to create 3 modules, hsmp_common, hsmp_acpi, amd_hsmp.
3. hsmp.c is modified to make it as a module and functions used by acpi.c and plat.c
   are made as export symbols (hsmp_test(), hsmp_cache_proto_ver() etc).
4. "depends on AMD_HSMP_ACPI=n" is removed from Kconfig.
5. Documentation is updated to reflect new changes.
6. amd_hsmp.h is modified to remove  IS_ENABLED(CONFIG_AMD_HSMP_ACPI).

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


 Documentation/arch/x86/amd_hsmp.rst    |  67 +++++++-
 drivers/platform/x86/amd/Makefile      |   2 +-
 drivers/platform/x86/amd/hsmp/Kconfig  |  36 +++-
 drivers/platform/x86/amd/hsmp/Makefile |   8 +-
 drivers/platform/x86/amd/hsmp/acpi.c   |  82 ++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c   | 222 ++++---------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c   | 144 +++++++++++++++-
 8 files changed, 354 insertions(+), 215 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 1e499ecf5f4e..abf1fa3230d9 100644
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
@@ -16,14 +17,25 @@ More details on the interface can be found in chapter
 Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
 
 
-HSMP interface is supported on EPYC server CPU models only.
+HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
 
 
 HSMP device
 ============================================
 
-amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
-/dev/hsmp to let user space programs run hsmp mailbox commands.
+amd_hsmp driver under drivers/platforms/x86/amd/hsmp/ has separate driver files
+for ACPI object based probing, platform device based probing and for the common
+code for these two drivers.
+
+Kconfig option CONFIG_AMD_HSMP_PLAT compiles plat.c and creates amd_hsmp.ko.
+Kconfig option CONFIG_AMD_HSMP_ACPI compiles acpi.c and creates hsmp_acpi.ko.
+Selecting any of these two configs automatically selects CONFIG_AMD_HSMP. This
+compiles common code hsmp.c and creates hsmp_common.ko module.
+
+Both the ACPI and plat drivers create the miscdevice /dev/hsmp to let
+user space programs run hsmp mailbox commands.
+
+The ACPI object format supported by the driver is defined below.
 
 $ ls -al /dev/hsmp
 crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
@@ -59,6 +71,51 @@ Note: lseek() is not supported as entire metrics table is read.
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
index b55d4ed9bceb..dc64b5b1165c 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -4,14 +4,44 @@
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
index 0cc92865c0a2..3175d8885e87 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -4,5 +4,9 @@
 # AMD HSMP Driver
 #
 
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o plat.o acpi.o
+obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
+hsmp_common-objs			:= hsmp.o
+obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
+amd_hsmp-objs				:= plat.o
+obj-$(CONFIG_AMD_HSMP_ACPI)		+= hsmp_acpi.o
+hsmp_acpi-objs				:= acpi.o
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
index 78945750d590..4fa0850c7824 100644
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
@@ -39,7 +33,10 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
+#define DRIVER_VERSION		"2.3"
+
 struct hsmp_plat_device hsmp_pdev;
+EXPORT_SYMBOL_GPL(hsmp_pdev);
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -227,8 +224,9 @@ int hsmp_test(u16 sock_ind, u32 value)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(hsmp_test);
 
-static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
@@ -284,12 +282,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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
@@ -317,6 +309,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
 	return bin_attr->size;
 }
+EXPORT_SYMBOL_GPL(hsmp_metric_tbl_read);
 
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
@@ -359,6 +352,7 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	else
 		return 0;
 }
+EXPORT_SYMBOL_GPL(hsmp_is_sock_attr_visible);
 
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
@@ -397,6 +391,7 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
 
 	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
 }
+EXPORT_SYMBOL_GPL(hsmp_create_attr_list);
 
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
@@ -413,194 +408,33 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(hsmp_cache_proto_ver);
 
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
+EXPORT_SYMBOL_GPL(hsmp_misc_register);
 
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
-}
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
+	misc_deregister(&hsmp_pdev.mdev);
 }
+EXPORT_SYMBOL_GPL(hsmp_misc_deregister);
 
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
+MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
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

