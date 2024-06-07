Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F6919413D
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jun 2024 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767280; cv=fail; b=GQ/kwztSpqi6Rty4efTk6rCHeUUq4VIcnViaNtKpWQxgJpjO/nfL4Jq3TVWnqYQuQsviZnO80878GYkibh0EtLGEHJa94PMvmLDgFo6LHmFTDrh07xltzvB3LjMzTrvB4hgcte1vDhfFz0wWHbtYO61KDMhGmh66P0OHFoZDgVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767280; c=relaxed/simple;
	bh=5KoCdeLgtxrY0U1Lb8icVp789XKo7m0nnDAHtbTYGpE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dT64UyN+PBSLwwHgoidqCjOSRv7C17nS3R7kXz+lG6FNOxBZ3cLyuw/sdNN7gqkdHfGq2BCrz+F/eDUOVhg4REfcuD7jVDaUWc35sVK7IfG1hcAwPi4A6yq5WFU1zJ0eZqx9aYGB19eu/+k/9IPhkqU8jJQ2rD4O5t+Gt0wukp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zBfFBe6W; arc=fail smtp.client-ip=40.107.100.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zBfFBe6W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COdvymvo5+UkAlqpoVK7X+Ib9pK1SjYHTLAFNMfqf+UyeeO0BSFdLGYKohBdmJuc/Ba/DHyC1Z7IJN2NXD3+AYZUQopawOlas39Yg9DBRDikbnHeDxs53kvBRVnJktacC3E+jfderuVJZsv2voLVIegQPI2NU38D/FNT2fmzP5qDbDYrHAJTqHOD8JWbiABc/gQTcgf9lgxOVXbCUIPQmCT7xzBjG5IN6BLL6TJGsIaS0XATFUHWuHDa6RZJFoOInLyIM0SaNzg5dJuWDQzYCzbb5t0EFf0UbJAR1+ILNd73f0cdbvocXjDH1Rvox9Wjjny8Af4Z8rBzRxKaCThFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTMmDgxldq6X0D/CUfD2xF9gc3/gq0dGX73fMxda3nc=;
 b=lLIv7mIVuteE6WNpCtHSpe3QGd1/+tMSGUucgMxTTCGhHLbWDqwt2x6XZvlPeCTqGkf3gFQUy3tRS2rH7yQ8+vxMHaTOGq4pwy0ev+fRL+/vOCur9rj7pI7w9cgm9eZvKuLpIFeiXrWmSEMS4t12pjePhA0udZtimowQS3OYUDnb8OVeclI+oKaK3FiiVPmdsg+rt/KW3hRcYrl4OHPzHaq1xdVPlCwLZHD44qkiaKAsttudEuNEcTorp2aaAInSMG8quGaB5/MqPyDX62aazku/wMR2BcBtySDRGnHZcAzHRluvH5GAB4gIF9lgfcuerMy08GJ0Dnluhsek7xOHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTMmDgxldq6X0D/CUfD2xF9gc3/gq0dGX73fMxda3nc=;
 b=zBfFBe6WseT5CID9kidtMUfIykEH9t9JXRdGMOaJgFLREbft/m0IfhUA/siuyhV0Y5SIwSBS7DyxYkuos82Q3Aayc0glXLH/0p3ll4mcoeJP7hVB8Dgw+dKD9GkBFqz2/mjjm0tXjOnngWqM+ekILrZ7VKU/O+IFb/YXimy5ci0=
Received: from DM6PR03CA0095.namprd03.prod.outlook.com (2603:10b6:5:333::28)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Fri, 7 Jun
 2024 13:34:31 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:333:cafe::6) by DM6PR03CA0095.outlook.office365.com
 (2603:10b6:5:333::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 13:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 13:34:31 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 08:34:28 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/hsmp: Split ACPI and non-ACPI code
Date: Fri, 7 Jun 2024 13:34:05 +0000
Message-ID: <20240607133405.1211929-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607133405.1211929-1-suma.hegde@amd.com>
References: <20240607133405.1211929-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 3697e248-f118-4f3c-ca05-08dc86f68fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zpN2VDlv70wUzPKvmpQGVNqqOnXABelIg9sZmUeIBnmCaHp+rSovvQsaACIa?=
 =?us-ascii?Q?UFVtVyZDuKY0mmLMoruawCgxffUgvFfEYzMz15jOMJ9XGbkbWhh6dVaPVMgc?=
 =?us-ascii?Q?Ffd3lQcC6d3+Fy/XmU2mSkkGNS58dtbZI0rsUZGtuyy3HcfmZKjCyph/oA0B?=
 =?us-ascii?Q?2ruhLl69sNi2ydJ/js1E2m2bLrHsH5TqYtG8a17RzkxSMIAnqAEt57jgxY1v?=
 =?us-ascii?Q?JCAn1YxxqiIBAiJvpPtYcPx0mnOHioeujEGxH9yN/8aW4Jr9WDPXMd/oFUtD?=
 =?us-ascii?Q?qFdYnujiiQIZd52eJ10Ha+0Ot/umUNp0dqhhkSFJCW7dhETAxVrOHzrgDhWN?=
 =?us-ascii?Q?6s7mSqjrJNrl3oZeQ/1V1TkzGXDYR5/jFXGpSO1MovMjSJ1chlLTVnq9BTpb?=
 =?us-ascii?Q?cggBuEwEHEStEW0oxNvjxU0WL6dmRbhoBdvonuvyerhQbuZh+Qt9edlRt8Vv?=
 =?us-ascii?Q?Ki/21AamxWdE0snIoP8cVADA+XTN+FaHQ4nPxLAMdnCcg/mx6MYkd4Z4aq0r?=
 =?us-ascii?Q?xfHUb01gApTRrE93HBEe5u0q9Aiwydq4RFRBTozivsRjAb7Sek1OV8tYFtoE?=
 =?us-ascii?Q?ONHe2vuEQViQvKGTpLm1C5rpheHPfZuTuXN0gVkVbmbXcHR7McEk3ACF9ewd?=
 =?us-ascii?Q?Miv7cmIJsvXq0CTWnY7uQO1DWiFDlNJWMsE7FdzguS4aW+HRBM9+3LLOg1gw?=
 =?us-ascii?Q?px1QGxoITYtotG1LpcaG72n8Qy8EkfEcSqeQQRn4aZktU/qw6xrDnt/cfptm?=
 =?us-ascii?Q?depmTN3aME+B5y4+d1Q7/jzLQoK+uevL2mcBdH3m5vGd4ZRqgXrcmd9TVc0n?=
 =?us-ascii?Q?vCThUOOxzEygMMg0Rshoef7sqH2vKCs3w2c388qpiZorJn1/MZL+TpX1OvTV?=
 =?us-ascii?Q?nDdaSs1w+O7mGEH6tx0NA/bjNNtfFHcfwzjzwnVUW58jFNlATTQc+qdVw506?=
 =?us-ascii?Q?O2P26cz16VAgv/BPZcxahc7em+gE7BpzWJk6dBfmDW+0hqpOz8o0zTLA7N5v?=
 =?us-ascii?Q?9TbP/GkhmenPP254uTMPmSD5ZHE0hCPtBgvPCCNvmTe5M4l2NhYLajSisE7w?=
 =?us-ascii?Q?oP9cw6C/WcPnzSalPciyFlP3C73jduSJxq/iVXTnQpCpWsWTTEyG0w9CpAyZ?=
 =?us-ascii?Q?OLdQ2tiRc9NN/KJ/bkrRjjTlbTLjQ4g0+E0lWvmLBbuYx5kB1rZKns51MnuQ?=
 =?us-ascii?Q?zi4noH6V1/7OkBQfUp8XWvp6eQEsBC8UW+eLBRG6b7aM7GjMXewVkxXcaLDr?=
 =?us-ascii?Q?iZMZJA0Pu8KK/doxfJ45Xz5nuAdPQ7ITLIvtIzYYqNwgi/Ez3mRpAiBGgHNr?=
 =?us-ascii?Q?wXk4f+Mg0rV/ecsmLR4Tm27VHwOROASvy4J348FzmeThYP75yLAJ1zFSQXaB?=
 =?us-ascii?Q?g9ocb9h3xVY8hVOmPZflL+XlHUlrQZPmsHJ2mIGTVWxsIFjmoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:34:31.0068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3697e248-f118-4f3c-ca05-08dc86f68fb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943

Separate the probes for ACPI and non-ACPI supported platforms.
Provide a Kconfig option to select either the
ACPI or the non-ACPI (platform device based driver).

This change is done to
 - Keep the probes clean of the if else ladder
 - Use dev_groups in platform driver structure, instead of using
   devm_device_add_group()
   + use is_visible() to enable the sysfs entries

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst    |  60 +-
 MAINTAINERS                            |   2 +-
 arch/x86/include/asm/amd_hsmp.h        |   2 +-
 drivers/platform/x86/amd/Makefile      |   2 +-
 drivers/platform/x86/amd/hsmp/Kconfig  |  22 +-
 drivers/platform/x86/amd/hsmp/Makefile |   9 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 301 ++++++++
 drivers/platform/x86/amd/hsmp/core.c   | 284 +++++++
 drivers/platform/x86/amd/hsmp/hsmp.c   | 988 -------------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |  66 ++
 drivers/platform/x86/amd/hsmp/plat.c   | 392 ++++++++++
 11 files changed, 1129 insertions(+), 999 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/acpi.c
 create mode 100644 drivers/platform/x86/amd/hsmp/core.c
 delete mode 100644 drivers/platform/x86/amd/hsmp/hsmp.c
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
 create mode 100644 drivers/platform/x86/amd/hsmp/plat.c

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 1e499ecf5f4e..431fb6b6ea57 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -4,8 +4,8 @@
 AMD HSMP interface
 ============================================
 
-Newer Fam19h EPYC server line of processors from AMD support system
-management functionality via HSMP (Host System Management Port).
+Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf), Fam1Ah(model 0x00-0x1f) EPYC server line of processors
+from AMD support system management functionality via HSMP (Host System Management Port).
 
 The Host System Management Port (HSMP) is an interface to provide
 OS-level software with access to system management functions via a
@@ -16,14 +16,21 @@ More details on the interface can be found in chapter
 Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
 
 
-HSMP interface is supported on EPYC server CPU models only.
+HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
 
 
 HSMP device
 ============================================
 
-amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
-/dev/hsmp to let user space programs run hsmp mailbox commands.
+amd_hsmp driver under the drivers/platforms/x86/hsmp/ is now split into separate driver files
+with mutually exclusive compile time Kconfig options to choose between ACPI object based probing
+or as a platform device which continues to create the miscdevice /dev/hsmp to let user
+space programs run hsmp mailbox commands.
+
+The ACPI object format supported by the driver is defined below.
+
+Kconfig option CONFIG_AMD_HSMP compiles plat.c + core.c for platform probing.
+Kconfig option CONFIG_AMD_HSMP_ACPI compiles acpi.c + core.c for ACPI probing.
 
 $ ls -al /dev/hsmp
 crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
@@ -59,6 +66,49 @@ Note: lseek() is not supported as entire metrics table is read.
 Metrics table definitions will be documented as part of Public PPR.
 The same is defined in the amd_hsmp.h header.
 
+ACPI device object format
+=========================
+The ACPI object format expected from the amd_hsmp driver
+for socket with ID00 is given below.
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
 
 An example
 ==========
diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..a7d79d1f7ec1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1037,7 +1037,7 @@ S:	Maintained
 F:	Documentation/arch/x86/amd_hsmp.rst
 F:	arch/x86/include/asm/amd_hsmp.h
 F:	arch/x86/include/uapi/asm/amd_hsmp.h
-F:	drivers/platform/x86/amd/hsmp.c
+F:	drivers/platform/x86/amd/hsmp/
 
 AMD IOMMU (AMD-VI)
 M:	Joerg Roedel <joro@8bytes.org>
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
index f0b2fe81c685..96ec24c8701b 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -5,6 +5,6 @@
 #
 
 obj-$(CONFIG_AMD_PMC)		+= pmc/
-obj-$(CONFIG_AMD_HSMP)		+= hsmp/
+obj-y				+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
index b55d4ed9bceb..2e54615a09a6 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -3,9 +3,27 @@
 # AMD HSMP Driver
 #
 
+menu "AMD Host System Management Port driver"
+	depends on AMD_NB
+
+config AMD_HSMP_ACPI
+	tristate "AMD HSMP ACPI driver"
+	depends on ACPI
+	help
+	  The driver provides a way for user space tools to monitor and manage
+	  system management functionality on EPYC server CPUs from AMD.
+
+	  Host System Management Port (HSMP) interface is a mailbox interface
+	  between the x86 core and the System Management Unit (SMU) firmware.
+
+	  This driver supports ACPI based probing.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_hsmp.
+
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64 && ACPI
+	depends on !(AMD_HSMP_ACPI || AMD_HSMP_ACPI=m)
 	help
 	  The driver provides a way for user space tools to monitor and manage
 	  system management functionality on EPYC server CPUs from AMD.
@@ -15,3 +33,5 @@ config AMD_HSMP
 
 	  If you choose to compile this driver as a module the module will be
 	  called amd_hsmp.
+
+endmenu
diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index fda64906a5e8..a2c63de8c93c 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -3,6 +3,11 @@
 # Makefile for drivers/platform/x86/amd/hsmp
 # AMD HSMP Driver
 #
-
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o
+obj-$(CONFIG_AMD_HSMP_ACPI)	+= amd_hsmp.o
+ifneq ($(CONFIG_AMD_HSMP), )
+amd_hsmp-objs = core.o plat.o
+endif
+ifneq ($(CONFIG_AMD_HSMP_ACPI), )
+amd_hsmp-objs = core.o acpi.o
+endif
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
new file mode 100644
index 000000000000..b2e366730759
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides ACPI object based probe and parsing for HSMP interface
+ */
+
+#include "hsmp.h"
+
+#define ACPI_HSMP_DEVICE_HID    "AMDI0097"
+
+#define DRIVER_NAME             "amd_hsmp"
+#define DRIVER_VERSION          "2.3"
+
+/* These are the strings specified in ACPI table */
+#define MSG_IDOFF_STR           "MsgIdOffset"
+#define MSG_ARGOFF_STR          "MsgArgOffset"
+#define MSG_RESPOFF_STR         "MsgRspOffset"
+
+/* This is the UUID used for HSMP */
+static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
+						0xa6, 0x9f, 0x4e, 0xa2,
+						0x87, 0x1f, 0xc2, 0xf6);
+
+static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
+{
+	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
+		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
+
+	return false;
+}
+
+static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
+{
+	struct hsmp_socket *sock = data;
+	struct resource r;
+
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		if (!acpi_dev_resource_memory(res, &r))
+			return AE_ERROR;
+		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
+			return AE_ERROR;
+		sock->mbinfo.base_addr = r.start;
+		sock->mbinfo.size = resource_size(&r);
+		break;
+	case ACPI_RESOURCE_TYPE_END_TAG:
+		break;
+	default:
+		return AE_ERROR;
+	}
+
+	return AE_OK;
+}
+
+static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
+{
+	acpi_status status;
+
+	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
+				     hsmp_resource, sock);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
+			acpi_format_exception(status));
+		return -EINVAL;
+	}
+	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
+		return -EINVAL;
+
+	/* The mapped region should be un cached */
+	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
+					       sock->mbinfo.size);
+	if (!sock->virt_base_addr) {
+		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
+{
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *guid, *mailbox_package;
+	union acpi_object *dsd;
+	acpi_status status;
+	int ret = 0;
+	int j;
+
+	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
+					    &buf, ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
+			acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	dsd = buf.pointer;
+
+	/* HSMP _DSD property should contain 2 objects.
+	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
+	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
+	 *    This mailbox object contains 3 more acpi objects of type
+	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
+	 *    these packages inturn contain 2 acpi objects of type
+	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
+	 */
+	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	guid = &dsd->package.elements[0];
+	mailbox_package = &dsd->package.elements[1];
+	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
+		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	for (j = 0; j < mailbox_package->package.count; j++) {
+		union acpi_object *msgobj, *msgstr, *msgint;
+
+		msgobj	= &mailbox_package->package.elements[j];
+		msgstr	= &msgobj->package.elements[0];
+		msgint	= &msgobj->package.elements[1];
+
+		/* package should have 1 string and 1 integer object */
+		if (msgobj->type != ACPI_TYPE_PACKAGE ||
+		    msgstr->type != ACPI_TYPE_STRING ||
+		    msgint->type != ACPI_TYPE_INTEGER) {
+			ret = -EINVAL;
+			goto free_buf;
+		}
+
+		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
+			     msgstr->string.length)) {
+			sock->mbinfo.msg_id_off = msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_resp_off =  msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_arg_off = msgint->integer.value;
+		} else {
+			ret = -ENOENT;
+			goto free_buf;
+		}
+	}
+
+	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
+	    !sock->mbinfo.msg_arg_off)
+		ret = -EINVAL;
+
+free_buf:
+	ACPI_FREE(buf.pointer);
+	return ret;
+}
+
+static int hsmp_get_uid(struct device *dev, u16 *sock_ind)
+{
+	char *uid;
+
+	/*
+	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
+	 * read it and strip the "ID" part of it and convert the remaining
+	 * bytes to integer.
+	 */
+	uid = acpi_device_uid(ACPI_COMPANION(dev));
+
+	return kstrtou16(uid + 2, 10, sock_ind);
+}
+
+static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			      u32 *value, bool write)
+{
+	if (write)
+		iowrite32(*value, sock->virt_base_addr + offset);
+	else
+		*value = ioread32(sock->virt_base_addr + offset);
+
+	return 0;
+}
+
+static int init_acpi(struct device *dev)
+{
+	struct hsmp_socket *sock;
+	u16 sock_ind;
+	int ret;
+
+	ret = hsmp_get_uid(dev, &sock_ind);
+	if (ret)
+		return ret;
+	if (sock_ind >= plat_dev.num_sockets)
+		return -EINVAL;
+	sock_ind = array_index_nospec(sock_ind, plat_dev.num_sockets);
+
+	sock = &plat_dev.sock[sock_ind];
+
+	sock->sock_ind		= sock_ind;
+	sock->dev		= dev;
+	sock->amd_hsmp_rdwr = amd_hsmp_acpi_rdwr;
+	sema_init(&sock->hsmp_sem, 1);
+
+	/* Read MP1 base address from CRS method */
+	ret = hsmp_read_acpi_crs(sock);
+	if (ret)
+		return ret;
+
+	/* Read mailbox offsets from DSD table */
+	return hsmp_read_acpi_dsd(sock);
+}
+
+static int check_acpi_support(struct device *dev, const struct acpi_device_id *amd_hsmp_acpi_ids)
+{
+	struct acpi_device *adev;
+
+	adev = ACPI_COMPANION(dev);
+	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
+		return 0;
+
+	return -ENODEV;
+}
+
+static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
+	{ACPI_HSMP_DEVICE_HID, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
+
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
+};
+
+static int hsmp_pltdrv_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!plat_dev.sock) {
+		plat_dev.num_sockets = amd_nb_num();
+		if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
+			return -ENODEV;
+
+		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
+					     sizeof(*plat_dev.sock),
+					     GFP_KERNEL);
+		if (!plat_dev.sock)
+			return -ENOMEM;
+		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
+		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+		plat_dev.hsmp_device.fops	= &hsmp_fops;
+		plat_dev.hsmp_device.parent	= &pdev->dev;
+		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
+		plat_dev.hsmp_device.mode	= 0644;
+
+		ret = misc_register(&plat_dev.hsmp_device);
+		if (ret)
+			return ret;
+	}
+
+	ret = check_acpi_support(&pdev->dev, amd_hsmp_acpi_ids);
+	if (ret) {
+		dev_err(&pdev->dev, "Not ACPI device?\n");
+		return ret;
+	}
+
+	ret = init_acpi(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void hsmp_pltdrv_remove(struct platform_device *pdev)
+{
+	if (plat_dev.removed)
+		return;
+	misc_deregister(&plat_dev.hsmp_device);
+	plat_dev.removed = true;
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_pltdrv_probe,
+	.remove_new	= hsmp_pltdrv_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
+	},
+};
+
+module_platform_driver(amd_hsmp_driver);
+
+MODULE_DESCRIPTION("AMD HSMP ACPI Interface Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/core.c b/drivers/platform/x86/amd/hsmp/core.c
new file mode 100644
index 000000000000..60b8d27a1f38
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/core.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides a device implementation for HSMP interface
+ */
+
+#include "hsmp.h"
+
+/* HSMP Status / Error codes */
+#define HSMP_STATUS_NOT_READY	0x00
+#define HSMP_STATUS_OK		0x01
+#define HSMP_ERR_INVALID_MSG	0xFE
+#define HSMP_ERR_INVALID_INPUT	0xFF
+
+/* Timeout in millsec */
+#define HSMP_MSG_TIMEOUT	100
+#define HSMP_SHORT_SLEEP	1
+
+#define HSMP_WR			true
+#define HSMP_RD			false
+
+struct hsmp_plat_device plat_dev;
+
+/*
+ * Send a message to the HSMP port via PCI-e config space registers
+ * or by writing to MMIO space.
+ *
+ * The caller is expected to zero out any unused arguments.
+ * If a response is expected, the number of response words should be greater than 0.
+ *
+ * Returns 0 for success and populates the requested number of arguments.
+ * Returns a negative error code for failure.
+ */
+static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg)
+{
+	struct hsmp_mbaddr_info *mbinfo;
+	unsigned long timeout, short_sleep;
+	u32 mbox_status;
+	u32 index;
+	int ret;
+
+	mbinfo = &sock->mbinfo;
+
+	/* Clear the status register */
+	mbox_status = HSMP_STATUS_NOT_READY;
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
+	if (ret) {
+		pr_err("Error %d clearing mailbox status register\n", ret);
+		return ret;
+	}
+
+	index = 0;
+	/* Write any message arguments */
+	while (index < msg->num_args) {
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+				    &msg->args[index], HSMP_WR);
+		if (ret) {
+			pr_err("Error %d writing message argument %d\n", ret, index);
+			return ret;
+		}
+		index++;
+	}
+
+	/* Write the message ID which starts the operation */
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
+	if (ret) {
+		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
+		return ret;
+	}
+
+	/*
+	 * Depending on when the trigger write completes relative to the SMU
+	 * firmware 1 ms cycle, the operation may take from tens of us to 1 ms
+	 * to complete. Some operations may take more. Therefore we will try
+	 * a few short duration sleeps and switch to long sleeps if we don't
+	 * succeed quickly.
+	 */
+	short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
+	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
+
+	while (time_before(jiffies, timeout)) {
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
+		if (ret) {
+			pr_err("Error %d reading mailbox status\n", ret);
+			return ret;
+		}
+
+		if (mbox_status != HSMP_STATUS_NOT_READY)
+			break;
+		if (time_before(jiffies, short_sleep))
+			usleep_range(50, 100);
+		else
+			usleep_range(1000, 2000);
+	}
+
+	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
+		return -ETIMEDOUT;
+	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
+		return -ENOMSG;
+	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
+		return -EINVAL;
+	} else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
+		pr_err("Message ID %u unknown failure (status = 0x%X)\n",
+		       msg->msg_id, mbox_status);
+		return -EIO;
+	}
+
+	/*
+	 * SMU has responded OK. Read response data.
+	 * SMU reads the input arguments from eight 32 bit registers starting
+	 * from SMN_HSMP_MSG_DATA and writes the response data to the same
+	 * SMN_HSMP_MSG_DATA address.
+	 * We copy the response data if any, back to the args[].
+	 */
+	index = 0;
+	while (index < msg->response_sz) {
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+				    &msg->args[index], HSMP_RD);
+		if (ret) {
+			pr_err("Error %d reading response %u for message ID:%u\n",
+			       ret, index, msg->msg_id);
+			break;
+		}
+		index++;
+	}
+
+	return ret;
+}
+
+static int validate_message(struct hsmp_message *msg)
+{
+	/* msg_id against valid range of message IDs */
+	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
+		return -ENOMSG;
+
+	/* msg_id is a reserved message ID */
+	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
+		return -ENOMSG;
+
+	/* num_args and response_sz against the HSMP spec */
+	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
+	    msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
+		return -EINVAL;
+
+	return 0;
+}
+
+int hsmp_send_message(struct hsmp_message *msg)
+{
+	struct hsmp_socket *sock;
+	int ret;
+
+	if (!msg)
+		return -EINVAL;
+	ret = validate_message(msg);
+	if (ret)
+		return ret;
+
+	if (!plat_dev.sock || msg->sock_ind >= plat_dev.num_sockets)
+		return -ENODEV;
+	sock = &plat_dev.sock[msg->sock_ind];
+
+	/*
+	 * The time taken by smu operation to complete is between
+	 * 10us to 1ms. Sometime it may take more time.
+	 * In SMP system timeout of 100 millisecs should
+	 * be enough for the previous thread to finish the operation
+	 */
+	ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
+	if (ret < 0)
+		return ret;
+
+	ret = __hsmp_send_message(sock, msg);
+
+	up(&sock->hsmp_sem);
+
+	return ret;
+}
+EXPORT_SYMBOL(hsmp_send_message);
+
+int hsmp_test(u16 sock_ind, u32 value)
+{
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	/*
+	 * Test the hsmp port by performing TEST command. The test message
+	 * takes one argument and returns the value of that argument + 1.
+	 */
+	msg.msg_id	= HSMP_TEST;
+	msg.num_args	= 1;
+	msg.response_sz	= 1;
+	msg.args[0]	= value;
+	msg.sock_ind	= sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Check the response value */
+	if (msg.args[0] != (value + 1)) {
+		dev_err(plat_dev.sock[sock_ind].dev,
+			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
+			sock_ind, (value + 1), msg.args[0]);
+		return -EBADE;
+	}
+
+	return ret;
+}
+
+int hsmp_cache_proto_ver(u16 sock_ind)
+{
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	msg.msg_id	= HSMP_GET_PROTO_VER;
+	msg.sock_ind	= sock_ind;
+	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
+
+	ret = hsmp_send_message(&msg);
+	if (!ret)
+		plat_dev.proto_ver = msg.args[0];
+
+	return ret;
+}
+
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	int __user *arguser = (int  __user *)arg;
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
+		return -EFAULT;
+
+	/*
+	 * Check msg_id is within the range of supported msg ids
+	 * i.e within the array bounds of hsmp_msg_desc_table
+	 */
+	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
+		return -ENOMSG;
+
+	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
+	case FMODE_WRITE:
+		/*
+		 * Device is opened in O_WRONLY mode
+		 * Execute only set/configure commands
+		 */
+		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
+			return -EINVAL;
+		break;
+	case FMODE_READ:
+		/*
+		 * Device is opened in O_RDONLY mode
+		 * Execute only get/monitor commands
+		 */
+		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
+			return -EINVAL;
+		break;
+	case FMODE_READ | FMODE_WRITE:
+		/*
+		 * Device is opened in O_RDWR mode
+		 * Execute both get/monitor and set/configure commands
+		 */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
+		/* Copy results back to user for get/monitor commands */
+		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
+			return -EFAULT;
+	}
+
+	return 0;
+}
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
deleted file mode 100644
index 8fcf38eed7f0..000000000000
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ /dev/null
@@ -1,988 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * AMD HSMP Platform Driver
- * Copyright (c) 2022, AMD.
- * All Rights Reserved.
- *
- * This file provides a device implementation for HSMP interface
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <asm/amd_hsmp.h>
-#include <asm/amd_nb.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/miscdevice.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h>
-#include <linux/semaphore.h>
-#include <linux/acpi.h>
-
-#define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
-
-/* HSMP Status / Error codes */
-#define HSMP_STATUS_NOT_READY	0x00
-#define HSMP_STATUS_OK		0x01
-#define HSMP_ERR_INVALID_MSG	0xFE
-#define HSMP_ERR_INVALID_INPUT	0xFF
-
-/* Timeout in millsec */
-#define HSMP_MSG_TIMEOUT	100
-#define HSMP_SHORT_SLEEP	1
-
-#define HSMP_WR			true
-#define HSMP_RD			false
-
-/*
- * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
- * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
- * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
- */
-#define SMN_HSMP_BASE		0x3B00000
-#define SMN_HSMP_MSG_ID		0x0010534
-#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
-#define SMN_HSMP_MSG_RESP	0x0010980
-#define SMN_HSMP_MSG_DATA	0x00109E0
-
-#define HSMP_INDEX_REG		0xc4
-#define HSMP_DATA_REG		0xc8
-
-#define HSMP_CDEV_NAME		"hsmp_cdev"
-#define HSMP_DEVNODE_NAME	"hsmp"
-#define HSMP_METRICS_TABLE_NAME	"metrics_bin"
-
-#define HSMP_ATTR_GRP_NAME_SIZE	10
-
-/* These are the strings specified in ACPI table */
-#define MSG_IDOFF_STR		"MsgIdOffset"
-#define MSG_ARGOFF_STR		"MsgArgOffset"
-#define MSG_RESPOFF_STR		"MsgRspOffset"
-
-#define MAX_AMD_SOCKETS 8
-
-struct hsmp_mbaddr_info {
-	u32 base_addr;
-	u32 msg_id_off;
-	u32 msg_resp_off;
-	u32 msg_arg_off;
-	u32 size;
-};
-
-struct hsmp_socket {
-	struct bin_attribute hsmp_attr;
-	struct hsmp_mbaddr_info mbinfo;
-	void __iomem *metric_tbl_addr;
-	void __iomem *virt_base_addr;
-	struct semaphore hsmp_sem;
-	char name[HSMP_ATTR_GRP_NAME_SIZE];
-	struct pci_dev *root;
-	struct device *dev;
-	u16 sock_ind;
-};
-
-struct hsmp_plat_device {
-	struct miscdevice hsmp_device;
-	struct hsmp_socket *sock;
-	u32 proto_ver;
-	u16 num_sockets;
-	bool is_acpi_device;
-	bool is_probed;
-};
-
-static struct hsmp_plat_device plat_dev;
-
-static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-			     u32 *value, bool write)
-{
-	int ret;
-
-	if (!sock->root)
-		return -ENODEV;
-
-	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
-				     sock->mbinfo.base_addr + offset);
-	if (ret)
-		return ret;
-
-	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
-		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
-
-	return ret;
-}
-
-static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			       u32 *value, bool write)
-{
-	if (write)
-		iowrite32(*value, sock->virt_base_addr + offset);
-	else
-		*value = ioread32(sock->virt_base_addr + offset);
-}
-
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
-			 u32 *value, bool write)
-{
-	if (plat_dev.is_acpi_device)
-		amd_hsmp_acpi_rdwr(sock, offset, value, write);
-	else
-		return amd_hsmp_pci_rdwr(sock, offset, value, write);
-
-	return 0;
-}
-
-/*
- * Send a message to the HSMP port via PCI-e config space registers
- * or by writing to MMIO space.
- *
- * The caller is expected to zero out any unused arguments.
- * If a response is expected, the number of response words should be greater than 0.
- *
- * Returns 0 for success and populates the requested number of arguments.
- * Returns a negative error code for failure.
- */
-static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg)
-{
-	struct hsmp_mbaddr_info *mbinfo;
-	unsigned long timeout, short_sleep;
-	u32 mbox_status;
-	u32 index;
-	int ret;
-
-	mbinfo = &sock->mbinfo;
-
-	/* Clear the status register */
-	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
-	if (ret) {
-		pr_err("Error %d clearing mailbox status register\n", ret);
-		return ret;
-	}
-
-	index = 0;
-	/* Write any message arguments */
-	while (index < msg->num_args) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_WR);
-		if (ret) {
-			pr_err("Error %d writing message argument %d\n", ret, index);
-			return ret;
-		}
-		index++;
-	}
-
-	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
-	if (ret) {
-		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
-		return ret;
-	}
-
-	/*
-	 * Depending on when the trigger write completes relative to the SMU
-	 * firmware 1 ms cycle, the operation may take from tens of us to 1 ms
-	 * to complete. Some operations may take more. Therefore we will try
-	 * a few short duration sleeps and switch to long sleeps if we don't
-	 * succeed quickly.
-	 */
-	short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
-	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
-
-	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
-		if (ret) {
-			pr_err("Error %d reading mailbox status\n", ret);
-			return ret;
-		}
-
-		if (mbox_status != HSMP_STATUS_NOT_READY)
-			break;
-		if (time_before(jiffies, short_sleep))
-			usleep_range(50, 100);
-		else
-			usleep_range(1000, 2000);
-	}
-
-	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
-		return -ETIMEDOUT;
-	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
-		return -ENOMSG;
-	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
-		return -EINVAL;
-	} else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
-		pr_err("Message ID %u unknown failure (status = 0x%X)\n",
-		       msg->msg_id, mbox_status);
-		return -EIO;
-	}
-
-	/*
-	 * SMU has responded OK. Read response data.
-	 * SMU reads the input arguments from eight 32 bit registers starting
-	 * from SMN_HSMP_MSG_DATA and writes the response data to the same
-	 * SMN_HSMP_MSG_DATA address.
-	 * We copy the response data if any, back to the args[].
-	 */
-	index = 0;
-	while (index < msg->response_sz) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_RD);
-		if (ret) {
-			pr_err("Error %d reading response %u for message ID:%u\n",
-			       ret, index, msg->msg_id);
-			break;
-		}
-		index++;
-	}
-
-	return ret;
-}
-
-static int validate_message(struct hsmp_message *msg)
-{
-	/* msg_id against valid range of message IDs */
-	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
-		return -ENOMSG;
-
-	/* msg_id is a reserved message ID */
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
-		return -ENOMSG;
-
-	/* num_args and response_sz against the HSMP spec */
-	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
-	    msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
-		return -EINVAL;
-
-	return 0;
-}
-
-int hsmp_send_message(struct hsmp_message *msg)
-{
-	struct hsmp_socket *sock;
-	int ret;
-
-	if (!msg)
-		return -EINVAL;
-	ret = validate_message(msg);
-	if (ret)
-		return ret;
-
-	if (!plat_dev.sock || msg->sock_ind >= plat_dev.num_sockets)
-		return -ENODEV;
-	sock = &plat_dev.sock[msg->sock_ind];
-
-	/*
-	 * The time taken by smu operation to complete is between
-	 * 10us to 1ms. Sometime it may take more time.
-	 * In SMP system timeout of 100 millisecs should
-	 * be enough for the previous thread to finish the operation
-	 */
-	ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
-	if (ret < 0)
-		return ret;
-
-	ret = __hsmp_send_message(sock, msg);
-
-	up(&sock->hsmp_sem);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(hsmp_send_message);
-
-static int hsmp_test(u16 sock_ind, u32 value)
-{
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	/*
-	 * Test the hsmp port by performing TEST command. The test message
-	 * takes one argument and returns the value of that argument + 1.
-	 */
-	msg.msg_id	= HSMP_TEST;
-	msg.num_args	= 1;
-	msg.response_sz	= 1;
-	msg.args[0]	= value;
-	msg.sock_ind	= sock_ind;
-
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-
-	/* Check the response value */
-	if (msg.args[0] != (value + 1)) {
-		dev_err(plat_dev.sock[sock_ind].dev,
-			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
-			sock_ind, (value + 1), msg.args[0]);
-		return -EBADE;
-	}
-
-	return ret;
-}
-
-static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
-{
-	int __user *arguser = (int  __user *)arg;
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
-		return -EFAULT;
-
-	/*
-	 * Check msg_id is within the range of supported msg ids
-	 * i.e within the array bounds of hsmp_msg_desc_table
-	 */
-	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
-		return -ENOMSG;
-
-	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
-	case FMODE_WRITE:
-		/*
-		 * Device is opened in O_WRONLY mode
-		 * Execute only set/configure commands
-		 */
-		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
-			return -EINVAL;
-		break;
-	case FMODE_READ:
-		/*
-		 * Device is opened in O_RDONLY mode
-		 * Execute only get/monitor commands
-		 */
-		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
-			return -EINVAL;
-		break;
-	case FMODE_READ | FMODE_WRITE:
-		/*
-		 * Device is opened in O_RDWR mode
-		 * Execute both get/monitor and set/configure commands
-		 */
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-
-	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
-		/* Copy results back to user for get/monitor commands */
-		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
-			return -EFAULT;
-	}
-
-	return 0;
-}
-
-static const struct file_operations hsmp_fops = {
-	.owner		= THIS_MODULE,
-	.unlocked_ioctl	= hsmp_ioctl,
-	.compat_ioctl	= hsmp_ioctl,
-};
-
-/* This is the UUID used for HSMP */
-static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
-						0xa6, 0x9f, 0x4e, 0xa2,
-						0x87, 0x1f, 0xc2, 0xf6);
-
-static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
-{
-	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
-		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
-
-	return false;
-}
-
-static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
-{
-	char *uid;
-
-	/*
-	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
-	 * read it and strip the "ID" part of it and convert the remaining
-	 * bytes to integer.
-	 */
-	uid = acpi_device_uid(ACPI_COMPANION(dev));
-
-	return kstrtou16(uid + 2, 10, sock_ind);
-}
-
-static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
-{
-	struct hsmp_socket *sock = data;
-	struct resource r;
-
-	switch (res->type) {
-	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
-		if (!acpi_dev_resource_memory(res, &r))
-			return AE_ERROR;
-		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
-			return AE_ERROR;
-		sock->mbinfo.base_addr = r.start;
-		sock->mbinfo.size = resource_size(&r);
-		break;
-	case ACPI_RESOURCE_TYPE_END_TAG:
-		break;
-	default:
-		return AE_ERROR;
-	}
-
-	return AE_OK;
-}
-
-static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
-{
-	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *guid, *mailbox_package;
-	union acpi_object *dsd;
-	acpi_status status;
-	int ret = 0;
-	int j;
-
-	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
-					    &buf, ACPI_TYPE_PACKAGE);
-	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
-			acpi_format_exception(status));
-		return -ENODEV;
-	}
-
-	dsd = buf.pointer;
-
-	/* HSMP _DSD property should contain 2 objects.
-	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
-	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
-	 *    This mailbox object contains 3 more acpi objects of type
-	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
-	 *    these packages inturn contain 2 acpi objects of type
-	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
-	 */
-	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
-		ret = -EINVAL;
-		goto free_buf;
-	}
-
-	guid = &dsd->package.elements[0];
-	mailbox_package = &dsd->package.elements[1];
-	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
-		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
-		ret = -EINVAL;
-		goto free_buf;
-	}
-
-	for (j = 0; j < mailbox_package->package.count; j++) {
-		union acpi_object *msgobj, *msgstr, *msgint;
-
-		msgobj	= &mailbox_package->package.elements[j];
-		msgstr	= &msgobj->package.elements[0];
-		msgint	= &msgobj->package.elements[1];
-
-		/* package should have 1 string and 1 integer object */
-		if (msgobj->type != ACPI_TYPE_PACKAGE ||
-		    msgstr->type != ACPI_TYPE_STRING ||
-		    msgint->type != ACPI_TYPE_INTEGER) {
-			ret = -EINVAL;
-			goto free_buf;
-		}
-
-		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
-			     msgstr->string.length)) {
-			sock->mbinfo.msg_id_off = msgint->integer.value;
-		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
-				    msgstr->string.length)) {
-			sock->mbinfo.msg_resp_off =  msgint->integer.value;
-		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
-				    msgstr->string.length)) {
-			sock->mbinfo.msg_arg_off = msgint->integer.value;
-		} else {
-			ret = -ENOENT;
-			goto free_buf;
-		}
-	}
-
-	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
-	    !sock->mbinfo.msg_arg_off)
-		ret = -EINVAL;
-
-free_buf:
-	ACPI_FREE(buf.pointer);
-	return ret;
-}
-
-static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
-{
-	acpi_status status;
-
-	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
-				     hsmp_resource, sock);
-	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
-			acpi_format_exception(status));
-		return -EINVAL;
-	}
-	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
-		return -EINVAL;
-
-	/* The mapped region should be un cached */
-	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
-					       sock->mbinfo.size);
-	if (!sock->virt_base_addr) {
-		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-/* Parse the ACPI table to read the data */
-static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
-{
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
-	int ret;
-
-	sock->sock_ind		= sock_ind;
-	sock->dev		= dev;
-	plat_dev.is_acpi_device	= true;
-
-	sema_init(&sock->hsmp_sem, 1);
-
-	/* Read MP1 base address from CRS method */
-	ret = hsmp_read_acpi_crs(sock);
-	if (ret)
-		return ret;
-
-	/* Read mailbox offsets from DSD table */
-	return hsmp_read_acpi_dsd(sock);
-}
-
-static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-				    struct bin_attribute *bin_attr, char *buf,
-				    loff_t off, size_t count)
-{
-	struct hsmp_socket *sock = bin_attr->private;
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	if (!sock)
-		return -EINVAL;
-
-	/* Do not support lseek(), reads entire metric table */
-	if (count < bin_attr->size) {
-		dev_err(sock->dev, "Wrong buffer size\n");
-		return -EINVAL;
-	}
-
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
-	msg.sock_ind	= sock->sock_ind;
-
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
-
-	return bin_attr->size;
-}
-
-static int hsmp_get_tbl_dram_base(u16 sock_ind)
-{
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
-	struct hsmp_message msg = { 0 };
-	phys_addr_t dram_addr;
-	int ret;
-
-	msg.sock_ind	= sock_ind;
-	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
-	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
-
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-
-	/*
-	 * calculate the metric table DRAM address from lower and upper 32 bits
-	 * sent from SMU and ioremap it to virtual address.
-	 */
-	dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
-	if (!dram_addr) {
-		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
-		return -ENOMEM;
-	}
-	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
-					     sizeof(struct hsmp_metric_table));
-	if (!sock->metric_tbl_addr) {
-		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
-		return -ENOMEM;
-	}
-	return 0;
-}
-
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
-{
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-	else
-		return 0;
-}
-
-static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
-{
-	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
-
-	sysfs_bin_attr_init(hattr);
-	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
-	hattr->attr.mode	= 0444;
-	hattr->read		= hsmp_metric_tbl_read;
-	hattr->size		= sizeof(struct hsmp_metric_table);
-	hattr->private		= &plat_dev.sock[sock_ind];
-	hattrs[0]		= hattr;
-
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
-		return hsmp_get_tbl_dram_base(sock_ind);
-	else
-		return 0;
-}
-
-/* One bin sysfs for metrics table */
-#define NUM_HSMP_ATTRS		1
-
-static int hsmp_create_attr_list(struct attribute_group *attr_grp,
-				 struct device *dev, u16 sock_ind)
-{
-	struct bin_attribute **hsmp_bin_attrs;
-
-	/* Null terminated list of attributes */
-	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
-				      sizeof(*hsmp_bin_attrs),
-				      GFP_KERNEL);
-	if (!hsmp_bin_attrs)
-		return -ENOMEM;
-
-	attr_grp->bin_attrs = hsmp_bin_attrs;
-
-	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
-}
-
-static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
-{
-	const struct attribute_group **hsmp_attr_grps;
-	struct attribute_group *attr_grp;
-	u16 i;
-
-	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
-				      sizeof(*hsmp_attr_grps),
-				      GFP_KERNEL);
-	if (!hsmp_attr_grps)
-		return -ENOMEM;
-
-	/* Create a sysfs directory for each socket */
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
-					GFP_KERNEL);
-		if (!attr_grp)
-			return -ENOMEM;
-
-		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= plat_dev.sock[i].name;
-		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
-		hsmp_attr_grps[i]		= attr_grp;
-
-		hsmp_create_attr_list(attr_grp, dev, i);
-	}
-
-	return device_add_groups(dev, hsmp_attr_grps);
-}
-
-static int hsmp_create_acpi_sysfs_if(struct device *dev)
-{
-	struct attribute_group *attr_grp;
-	u16 sock_ind;
-	int ret;
-
-	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
-	if (!attr_grp)
-		return -ENOMEM;
-
-	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
-
-	ret = hsmp_get_uid(dev, &sock_ind);
-	if (ret)
-		return ret;
-
-	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
-	if (ret)
-		return ret;
-
-	return devm_device_add_group(dev, attr_grp);
-}
-
-static int hsmp_cache_proto_ver(u16 sock_ind)
-{
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	msg.msg_id	= HSMP_GET_PROTO_VER;
-	msg.sock_ind	= sock_ind;
-	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
-
-	ret = hsmp_send_message(&msg);
-	if (!ret)
-		plat_dev.proto_ver = msg.args[0];
-
-	return ret;
-}
-
-static inline bool is_f1a_m0h(void)
-{
-	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
-		return true;
-
-	return false;
-}
-
-static int init_platform_device(struct device *dev)
-{
-	struct hsmp_socket *sock;
-	int ret, i;
-
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		if (!node_to_amd_nb(i))
-			return -ENODEV;
-		sock = &plat_dev.sock[i];
-		sock->root			= node_to_amd_nb(i)->root;
-		sock->sock_ind			= i;
-		sock->dev			= dev;
-		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
-
-		/*
-		 * This is a transitional change from non-ACPI to ACPI, only
-		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
-		 */
-		if (is_f1a_m0h())
-			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
-		else
-			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
-
-		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
-		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
-		sema_init(&sock->hsmp_sem, 1);
-
-		/* Test the hsmp interface on each socket */
-		ret = hsmp_test(i, 0xDEADBEEF);
-		if (ret) {
-			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
-	{ACPI_HSMP_DEVICE_HID, 0},
-	{}
-};
-MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
-
-static int hsmp_pltdrv_probe(struct platform_device *pdev)
-{
-	struct acpi_device *adev;
-	u16 sock_ind = 0;
-	int ret;
-
-	/*
-	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
-	 * each socket, so the per socket probing, but the memory allocated for
-	 * sockets should be contiguous to access it as an array,
-	 * Hence allocate memory for all the sockets at once instead of allocating
-	 * on each probe.
-	 */
-	if (!plat_dev.is_probed) {
-		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
-					     sizeof(*plat_dev.sock),
-					     GFP_KERNEL);
-		if (!plat_dev.sock)
-			return -ENOMEM;
-	}
-	adev = ACPI_COMPANION(&pdev->dev);
-	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
-		ret = hsmp_get_uid(&pdev->dev, &sock_ind);
-		if (ret)
-			return ret;
-		if (sock_ind >= plat_dev.num_sockets)
-			return -EINVAL;
-		ret = hsmp_parse_acpi_table(&pdev->dev, sock_ind);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to parse ACPI table\n");
-			return ret;
-		}
-		/* Test the hsmp interface */
-		ret = hsmp_test(sock_ind, 0xDEADBEEF);
-		if (ret) {
-			dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
-			return ret;
-		}
-	} else {
-		ret = init_platform_device(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-			return ret;
-		}
-	}
-
-	ret = hsmp_cache_proto_ver(sock_ind);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
-		return ret;
-	}
-
-	if (plat_dev.is_acpi_device)
-		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-	else
-		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
-	if (!plat_dev.is_probed) {
-		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-		plat_dev.hsmp_device.fops	= &hsmp_fops;
-		plat_dev.hsmp_device.parent	= &pdev->dev;
-		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
-		plat_dev.hsmp_device.mode	= 0644;
-
-		ret = misc_register(&plat_dev.hsmp_device);
-		if (ret)
-			return ret;
-
-		plat_dev.is_probed = true;
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
-	if (plat_dev.is_probed) {
-		misc_deregister(&plat_dev.hsmp_device);
-		plat_dev.is_probed = false;
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
-};
-
-static struct platform_device *amd_hsmp_platdev;
-
-static int hsmp_plat_dev_register(void)
-{
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
-}
-
-/*
- * This check is only needed for backward compatibility of previous platforms.
- * All new platforms are expected to support ACPI based probing.
- */
-static bool legacy_hsmp_support(void)
-{
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
-	plat_dev.num_sockets = amd_nb_num();
-	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
-		return ret;
-
-	ret = platform_driver_register(&amd_hsmp_driver);
-	if (ret)
-		return ret;
-
-	if (!plat_dev.is_acpi_device) {
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
new file mode 100644
index 000000000000..65458e0b9b62
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides a header implementation for HSMP interface
+ */
+
+#ifndef _HSMP_H
+#define _HSMP_H
+
+#include <asm/amd_nb.h>
+#include <asm/amd_hsmp.h>
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/miscdevice.h>
+#include <linux/nospec.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/semaphore.h>
+
+#define HSMP_ATTR_GRP_NAME_SIZE 10
+
+#define HSMP_CDEV_NAME          "hsmp_cdev"
+#define HSMP_DEVNODE_NAME       "hsmp"
+#define HSMP_METRICS_TABLE_NAME "metrics_bin"
+
+#define MAX_AMD_SOCKETS 8
+
+struct hsmp_mbaddr_info {
+	u32 base_addr;
+	u32 msg_id_off;
+	u32 msg_resp_off;
+	u32 msg_arg_off;
+	u32 size;
+};
+
+struct hsmp_socket {
+	struct bin_attribute hsmp_attr;
+	struct hsmp_mbaddr_info mbinfo;
+	void __iomem *metric_tbl_addr;
+	void __iomem *virt_base_addr;
+	struct semaphore hsmp_sem;
+	char name[HSMP_ATTR_GRP_NAME_SIZE];
+	struct pci_dev *root;
+	struct device *dev;
+	u16 sock_ind;
+	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
+};
+
+struct hsmp_plat_device {
+	struct miscdevice hsmp_device;
+	struct hsmp_socket *sock;
+	u32 proto_ver;
+	u16 num_sockets;
+	bool removed;
+};
+
+extern struct hsmp_plat_device plat_dev;
+int hsmp_cache_proto_ver(u16 sock_ind);
+int hsmp_test(u16 sock_ind, u32 value);
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
+#endif
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
new file mode 100644
index 000000000000..74b1bdcc03ea
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides platform device implementation for HSMP interface.
+ */
+
+#include "hsmp.h"
+
+/*
+ * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
+ * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
+ * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
+ */
+#define DRIVER_NAME             "amd_hsmp"
+#define DRIVER_VERSION          "2.3"
+
+#define SMN_HSMP_BASE		0x3B00000
+#define SMN_HSMP_MSG_ID		0x0010534
+#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
+#define SMN_HSMP_MSG_RESP	0x0010980
+#define SMN_HSMP_MSG_DATA	0x00109E0
+
+#define HSMP_INDEX_REG		0xc4
+#define HSMP_DATA_REG		0xc8
+
+static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+			     u32 *value, bool write)
+{
+	int ret;
+
+	if (!sock->root)
+		return -ENODEV;
+
+	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
+				     sock->mbinfo.base_addr + offset);
+	if (ret)
+		return ret;
+
+	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
+		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
+
+	return ret;
+}
+
+static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+				    struct bin_attribute *bin_attr, char *buf,
+				    loff_t off, size_t count)
+{
+	struct hsmp_message msg = { 0 };
+	struct hsmp_socket *sock;
+	u8 sock_ind;
+	int ret;
+
+	ret = kstrtou8(bin_attr->private, 10, &sock_ind);
+	if (ret)
+		return ret;
+
+	if (sock_ind >= plat_dev.num_sockets)
+		return -EINVAL;
+
+	sock_ind = array_index_nospec(sock_ind, plat_dev.num_sockets);
+
+	sock = &plat_dev.sock[sock_ind];
+	if (!sock)
+		return -EINVAL;
+
+	/* Do not support lseek(), reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(sock->dev, "Wrong buffer size\n");
+		return -EINVAL;
+	}
+
+	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.sock_ind	= sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
+}
+
+static int hsmp_get_tbl_dram_base(u16 sock_ind)
+{
+	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_message msg = { 0 };
+	phys_addr_t dram_addr;
+	int ret;
+
+	msg.sock_ind	= sock_ind;
+	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
+	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/*
+	 * calculate the metric table DRAM address from lower and upper 32 bits
+	 * sent from SMU and ioremap it to virtual address.
+	 */
+	dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
+	if (!dram_addr) {
+		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
+		return -ENOMEM;
+	}
+	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
+					     sizeof(struct hsmp_metric_table));
+	if (!sock->metric_tbl_addr) {
+		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
+{
+	u8 sock_ind;
+	int ret;
+
+	ret = kstrtou8(battr->private, 10, &sock_ind);
+	if (ret)
+		return ret;
+
+	if (id == 0 && sock_ind >= plat_dev.num_sockets)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+	else
+		return 0;
+}
+
+/*
+ * AMD supports maximum of 8 sockets in a system.
+ * Static array of 8 + 1(for NULL) elements is created below
+ * to create sysfs groups for sockets.
+ * is_bin_visible function is used to show / hide the necessary groups.
+ */
+#define HSMP_BIN_ATTR(index, _list) \
+static struct bin_attribute attr##index = { \
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444}, \
+	.private = #index, \
+	.read = hsmp_metric_tbl_read, \
+	.size = sizeof(struct hsmp_metric_table), \
+}; \
+static struct bin_attribute _list[] = { \
+	&attr##index, \
+	NULL \
+}
+
+HSMP_BIN_ATTR(0, *sock0_attr_list);
+HSMP_BIN_ATTR(1, *sock1_attr_list);
+HSMP_BIN_ATTR(2, *sock2_attr_list);
+HSMP_BIN_ATTR(3, *sock3_attr_list);
+HSMP_BIN_ATTR(4, *sock4_attr_list);
+HSMP_BIN_ATTR(5, *sock5_attr_list);
+HSMP_BIN_ATTR(6, *sock6_attr_list);
+HSMP_BIN_ATTR(7, *sock7_attr_list);
+
+#define HSMP_BIN_ATTR_GRP(index, _list, _name) \
+static struct attribute_group sock##index##_attr_grp = { \
+	.bin_attrs = _list, \
+	.is_bin_visible = hsmp_is_sock_attr_visible, \
+	.name = #_name, \
+}
+
+HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
+HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
+HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
+HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
+HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
+HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
+HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
+HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
+
+static const struct attribute_group *hsmp_groups[] = {
+	&sock0_attr_grp,
+	&sock1_attr_grp,
+	&sock2_attr_grp,
+	&sock3_attr_grp,
+	&sock4_attr_grp,
+	&sock5_attr_grp,
+	&sock6_attr_grp,
+	&sock7_attr_grp,
+	NULL
+};
+
+static inline bool is_f1a_m0h(void)
+{
+	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
+		return true;
+
+	return false;
+}
+
+static int init_platform_device(struct device *dev)
+{
+	struct hsmp_socket *sock;
+	int ret, i;
+
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		if (!node_to_amd_nb(i))
+			return -ENODEV;
+		sock = &plat_dev.sock[i];
+		sock->root			= node_to_amd_nb(i)->root;
+		sock->sock_ind			= i;
+		sock->dev			= dev;
+		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr = amd_hsmp_pci_rdwr;
+
+		/*
+		 * This is a transitional change from non-ACPI to ACPI, only
+		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
+		 */
+		if (is_f1a_m0h())
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
+		else
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+
+		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
+		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
+		sema_init(&sock->hsmp_sem, 1);
+
+		/* Test the hsmp interface on each socket */
+		ret = hsmp_test(i, 0xDEADBEEF);
+		if (ret) {
+			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
+			return ret;
+		}
+
+		ret = hsmp_cache_proto_ver(i);
+		if (ret) {
+			dev_err(dev, "Failed to read HSMP protocol version\n");
+			return ret;
+		}
+
+		if (plat_dev.proto_ver == HSMP_PROTO_VER6) {
+			ret = hsmp_get_tbl_dram_base(i);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
+};
+
+static int hsmp_pltdrv_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
+				     sizeof(*plat_dev.sock),
+				     GFP_KERNEL);
+	if (!plat_dev.sock)
+		return -ENOMEM;
+
+	ret = init_platform_device(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		return ret;
+	}
+
+	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
+	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+	plat_dev.hsmp_device.fops	= &hsmp_fops;
+	plat_dev.hsmp_device.parent	= &pdev->dev;
+	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
+	plat_dev.hsmp_device.mode	= 0644;
+
+	return misc_register(&plat_dev.hsmp_device);
+}
+
+static void hsmp_pltdrv_remove(struct platform_device *pdev)
+{
+	misc_deregister(&plat_dev.hsmp_device);
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_pltdrv_probe,
+	.remove_new	= hsmp_pltdrv_remove,
+	.driver		= {
+		.dev_groups = hsmp_groups,
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
+	plat_dev.num_sockets = amd_nb_num();
+	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
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
+MODULE_DESCRIPTION("AMD HSMP Platform Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL");
-- 
2.25.1

