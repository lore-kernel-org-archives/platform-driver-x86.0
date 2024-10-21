Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F11E6DD4
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509313; cv=fail; b=pxD82v9lgVu3vAHbGFAgI+bzZSfnmsadNftHJRmOc2HAHMYQzKoD0qOQXAqPDqTHQFrcK4xXraXeFmsAuz3LBufUPIGR/FjZKLj0IlJDVwXqDAoDniASf32hMdwFCKolhZEnqvRH9HCsQutrzC4uc6KG8GRUlltD6kwu4sfp8FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509313; c=relaxed/simple;
	bh=HFufW/Ale6gSx5L03huu+KIo3f3MIlMsQrnnrxoW1yA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p8YF3uHpllnOsbg26lJ0xDB1x35f/6jrQNyhS6JCXLByrCuyZkeD5ikjDLAWklju1Pker/pDFV6DIdBSFSBWM/fN2+aDG/p2GTNeLPsdNP8dGNu05x9cCVJUwqAYON2lwAuj86xey+1IFyHnAHeyhn8WxePyr10EoC0/iWvlvqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K0444CF2; arc=fail smtp.client-ip=40.107.93.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K0444CF2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq3I+o5uS7Iur2A3cPj8QWTxOWzK2H02esBd+hAQgeJPZF3deuHXhD7MtFDQDYNnjGDs+uRkn/ZvWGIS3EOzDuCY+mixT2i6agP0nZu9lSrD71HFY/0SbMtd+FZfnVNwo5KiDWgbHPmUvKf4oUtT5N97FslYltTU7APN+TPLThLkBYayZzT0pAiXgYcspTVDCMF3YgjoQbESYDm2dAiT/BcKjG2n2h7qpFnvPcK8rFFqVdJQqj2r6iTwOsl2UwDKTwmUu+WgzKuE19CoybGp+KVx+ybv+2XjrU7sN/z+PcH6xj9bfEGI/r1BoNQ7A/3MiCKiQuxcdD2L1MoFkD9JUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0sWNzd29tpF+b1A0NLQzX3y6TzLQX3b7wkOq5JkMX8=;
 b=WcoKQsCGBva5duVxuCtTUgbKjabFqa6RVlG31M36ypFoyUlWNLqLMXudPtSkxiC57Cp8ZV6EBJ9izCR3/L1oP0M0Pfmrhapyp+/ym1oTdibZjHJPgX1cXH1oxFA+peYI5lYRfyelmzFgSRzAm/SSlgXooD9gFDZNK/IV/SrivDBSPrrbMoUske0I0jcaqpv3p3bOsKtLoWUqws8abQdv0ViAJK+ZpGKGSy5puGUrU3k/vGxH8V+RXfpu/482JH0CWyAS6Wy9kqPjjpg/1C7NdcqZ086Dl70I1/56U+YnmMNvuPSFn1OI4mLfkrLAcPt+mA0RkhQ5+TdWdbDfD1nDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0sWNzd29tpF+b1A0NLQzX3y6TzLQX3b7wkOq5JkMX8=;
 b=K0444CF2/XFGEor23/qkTO0V/6HXh7e7rdYCa9V0lKfpC9wbtVs4BPNt2bFX9h2UVKFbmNzJ85VLDoHhB++NS16vm5eGpFkfjwBeKV2lFauljfkf2K6ectAI+i2pCV8vPGOIR1XCO3nBDUl74f1bplSS8NUGUZa66WfTMqiyTMA=
Received: from BN9PR03CA0461.namprd03.prod.outlook.com (2603:10b6:408:139::16)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 11:15:04 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::30) by BN9PR03CA0461.outlook.office365.com
 (2603:10b6:408:139::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Mon, 21 Oct 2024 11:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:15:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:15:02 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 08/11] platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers
Date: Mon, 21 Oct 2024 11:14:25 +0000
Message-ID: <20241021111428.2676884-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021111428.2676884-1-suma.hegde@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5ceae4-104e-4cba-925b-08dcf1c19d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZWaBmx7hhokYlzJBAdNoTTLYn4EbR2PLqu4zx+DLP7ZRFNjy63mCu+N+kUQu?=
 =?us-ascii?Q?LveRTjc1nNnP+RGBjH8Glf+w0WhDEXfbIN5rRH5vzPtNGtKEo8WiBxOQ3Udp?=
 =?us-ascii?Q?NyxsuM5RP2t6vYXqpV8gecb1yDZrbgxwfXrWnxlesvGEKiaBdHo2+WQTPW+q?=
 =?us-ascii?Q?m/i61LG20KGz/EOlYshmsP46FxQSdwc1lkNAWoGNW81dEACRpf2ldHoCFClK?=
 =?us-ascii?Q?WlRul7+oJ2yE45HR+FvnBlZaVut8ByG8SkzNCexUQUipaGobUAn9WWvr2e+9?=
 =?us-ascii?Q?mYL2lWlK4/sn4Hrn2pCIiLzeYhEv/3rhoDN5uwEQc3PxEUnNEWfUpXrCfw65?=
 =?us-ascii?Q?yyX8gdNq9zE4e1flejkZsu58Cz7+01Rsl21d0Llrr5Em9e3zLILUJgxagwW+?=
 =?us-ascii?Q?Z4nlI8Gjy7BX70FuywnRNlTO8muYUdAdjpxlIRbvFOdKmNgQbD675jPXrOO3?=
 =?us-ascii?Q?G+tgdwY/cZceLbzXgK2Wb7Fz94VqXi6I6hk/9oB+xiCk9j+1wzk9sxMxK17c?=
 =?us-ascii?Q?sutJHuCM8JIlujruv3hErJj20k2vWa22DDGi+kT4exfmghh7ApFT7ylwB2/m?=
 =?us-ascii?Q?twq+4ixhvIAc3jT/XwIdlf//0edYLjCUOTXCCLCaJVrnPJnmRJLE0Nj8Q7B9?=
 =?us-ascii?Q?ZIro5gyvffuvvoATh3L58AooGtCxE2km9uqa/h8RhBdiXSvWW2Spk4lDWrw1?=
 =?us-ascii?Q?C7hgH2CYCp2QLicDLTXrJ5LvkU4gMtMzffPI0L6+czH4+kuR1f2NM8CzAPKl?=
 =?us-ascii?Q?byMFMHsiQ8aH8Zu6mFfshoHEAjLSE0ANoyOnRM/nimDRNYHVvjDYxYqr8bDt?=
 =?us-ascii?Q?hxzMRiph67kjA2qV5pocfrod4XCxBZxXoQC6csDhBeaNiR8RzJX6WwSJyC6k?=
 =?us-ascii?Q?NsQgVI7OSbfGPFKnSyn/pqkTZ1IudDV3yzuIyuDFUJQC4jt+hU/LDIvMaZKG?=
 =?us-ascii?Q?QA/3tPZuQ5IT3z+dXUt28XvFr2e9NHjakXsd2kMz+YK4zok/uHE22tdAJcEO?=
 =?us-ascii?Q?QBNVAUmftBJL+2+eWNYBGy4sQXSm8jioVJQbhj6XGHUuexfGmsgn9wQ6GrZE?=
 =?us-ascii?Q?yq3jSfg4I6PP2YLMJm24MHuY7c7jaPQLq1gUYYqqG7Pv4Fm1bK0d5P6cZQVR?=
 =?us-ascii?Q?NtnNl06McaCffAObsqJZS0kCyFSpxSMnFa6otxF/qqfpJTeXjfHK0qtA0E2I?=
 =?us-ascii?Q?MH4/v2IA1Wl9n1363O+eT7o0wdYubIIS29DG+xf3a8BSG7AnlIW5TzkqwCuL?=
 =?us-ascii?Q?G9EXDbdQQGkOZL1oVyIElFBXlFUL1SPxgkuAvrKkha9dFDbM1yOxqXyG14xX?=
 =?us-ascii?Q?oI1usEP7Hn9BhZivIQjyi3vxXROOPiLIce33pUj8HGzyaO9nePGTLMfDxo/p?=
 =?us-ascii?Q?HDGQvfhIjznbrI2CziSoY2PR/3NnbQfzyF0+ZJQYfYGTwCNE+CMssmG1fSi3?=
 =?us-ascii?Q?zY3Za5lOYEI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:15:04.7043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5ceae4-104e-4cba-925b-08dcf1c19d2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306

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
Changes since v9:
1. Change "remove_new" assignment to "remove" as per 0edb555a65d1.
2. Change "called amd_hsmp" to "called hsmp_acpi" in Kconfig.

Changes since v8:
Removed unused hsmp_fops structure definition.
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021345.okdVjjGy-lkp@intel.com/

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
 drivers/platform/x86/amd/hsmp/plat.c   | 138 ++++++++++++++-
 8 files changed, 348 insertions(+), 215 deletions(-)

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
index b55d4ed9bceb..7d10d4462a45 100644
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
 
+	  If you choose to compile this driver as a module the module will be
+	  called hsmp_acpi.
+
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
index 6f8e7962266a..098c879798e7 100644
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
+	.remove		= hsmp_acpi_remove,
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
index e18cf82478a0..ce6cab23dce8 100644
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
@@ -50,7 +55,7 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
-int hsmp_create_non_acpi_sysfs_if(struct device *dev)
+static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 {
 	const struct attribute_group **hsmp_attr_grps;
 	struct attribute_group *attr_grp;
@@ -88,7 +93,7 @@ static inline bool is_f1a_m0h(void)
 	return false;
 }
 
-int init_platform_device(struct device *dev)
+static int init_platform_device(struct device *dev)
 {
 	struct hsmp_socket *sock;
 	int ret, i;
@@ -134,3 +139,132 @@ int init_platform_device(struct device *dev)
 
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
+	.remove		= hsmp_pltdrv_remove,
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

