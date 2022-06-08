Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9747C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 07:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbiFHHcc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 03:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354853AbiFHGTu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 02:19:50 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::613])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA265AEE0
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 23:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URriBAlO/iF/JWpviM36HUcZk3boUHllSH248PvdzgRRUFg/AS4IBUrYhxGD/gHUCXGYRtMDeDydY4ONLLsytsCeTLmWruuckG76YGtBUnLhh9pwY9Km1FjAfUDL+XvgH3+sW+X/YV86WpOCpV+z7Sk05M/QK+P1dPc5IhYPn1AespzQcLUxONRnYyScpU2nWryjLF32o6ymI55G/hj/M9BfE48Nf+fVcxihCjwftdI3ZkwskpAMxCxYVulNsTXOC0VDIv/lEIhHe3hPksBo6XbLchfKrcmTLTc9rWZ5r5xeEEs36paWPO+fhBtjpLvUKbKXSwpIqouaDleFhIpRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znyoguS+xdNKH7mq7H5ewM+1wY7E+q6v6fQFrV5Dbyk=;
 b=DUkDHLcRISBaZAfuX/ftBxMpgN6ddy12Ld2JHQXKXIlQC4dUUnIALoQUXSz012tjxKL0R97lTY66gactmwaF0hgCBQi66AzqMqSjy07MVRSzc7SS8k9356CUSB2OV5YKWAd996eINJ1MEC9w1oj4X2kCoBFL5wGr0SEA9LUc19T86GOxwVGUFH5Kzw+8qphZl4t+DyuHsAoq+5IvievDYZF4G2CB+E2b5x5FSxt0Wqdi0MZEmJ6iV5yJVA+IOWEdJdxaQRWFD3KYovNrZzjOahZB75IoHLn2yKHuIxlyF//faa9Pp/Y+P4NHFxTU6y/2ibNVeEPn1erTIgBNOfCT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znyoguS+xdNKH7mq7H5ewM+1wY7E+q6v6fQFrV5Dbyk=;
 b=1sbaP4n3pckmIDFwz+OEbv07r9VsTNlZIHlbK9nk+PVe4Pbm/ZT44aQHwv04rprVAoIGtE/lTOXitrvIpWuZExhnMV+vVpcEcEWSHV9qPhHzc9ZMf4KOoJXPqPEms+n3HyE+pmpMn4oFjYEvIRmQr/4vp2v/Z62xQWZFtCEHKe4=
Received: from BN1PR14CA0014.namprd14.prod.outlook.com (2603:10b6:408:e3::19)
 by DM5PR12MB1689.namprd12.prod.outlook.com (2603:10b6:4:3::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.15; Wed, 8 Jun 2022 06:18:27 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::d3) by BN1PR14CA0014.outlook.office365.com
 (2603:10b6:408:e3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Wed, 8 Jun 2022 06:18:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Wed, 8 Jun 2022 06:18:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 8 Jun
 2022 01:17:18 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>
Subject: [PATCH] platform/x86: Move AMD platform drivers to separate  directory
Date:   Wed, 8 Jun 2022 11:47:03 +0530
Message-ID: <20220608061703.2664926-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc93617-7925-4306-def0-08da4916b329
X-MS-TrafficTypeDiagnostic: DM5PR12MB1689:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1689B8EEF46D839D2F3083509AA49@DM5PR12MB1689.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uC0dWARvlmK8PUjwt9/TaVwKu7J1+3FE1YoEvjjUcGEhnM/j/CMz80tuOnDjFFPDnVWYunjf0xCANWvsATfE0BKcO/boCTAXuPe3zLH16Wu7i9kRXDagYfF6zgR7i9H1YxLhjouVwmmfpXCjk2ys026Z+9LSxVDc6tU+Yco8eeHik+hoRwn4N/KpDomejFtTrSIBeBq3FggamlrA6ccwXRGVXZGCaJ7Bnk/b4LNYzS9h2URjLHgM6j8AoYFqZlr3ZxSuq13+fiXgazU5QTRr0mYnqxtsqtZ5oQTRkQZ4V+tlJc0DxWKpbTQnNEmq9YkTiVSxvoFV241h1JQfwuzYgF53LbgXz3+/hIga9Pib0b7ZCOnmNAwelAcx8AvP4/Qnt/To1fJGqo6+tzWfN5WFXZ/vMBYcqB1dCdS+qiWxXozX4sAyOM7OJdXyIs1uYNxeZha841uvojzWeooqL0wl2gdTQNDKmbpr2ZAuXvuc/4dj1dS9ux9pVyL760Bis688oMtQuqS8/NwrPrcQpimj2qGc/E130fQHUJztTcOAyUwoZqaAId1xLl7Hj3ZkIQRVZiXP/sTCd0bhRoHMH9j7uP+j1oTbS57ltjNhDTOjy+6O9TfknDl+NvyoQ/Pu+rXfCtIgc77tfup9hJRmNzjZN97eMqvZFG6gJqcTz8dPQhTswhknigFLHP+CLUxPw+WaH4Z3x4YhJ8M5gK1kF9UIbQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(1076003)(110136005)(54906003)(426003)(508600001)(47076005)(40460700003)(6666004)(7696005)(2906002)(83380400001)(5660300002)(316002)(36756003)(70586007)(70206006)(82310400005)(2616005)(26005)(86362001)(4326008)(8676002)(81166007)(16526019)(186003)(356005)(36860700001)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 06:18:26.9539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc93617-7925-4306-def0-08da4916b329
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1689
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently, AMD supported platform drivers are grouped under generic "x86"
folder structure. Move the current drivers (amd-pmc and amd_hsmp) to a
separate directory. This would also mean the newer driver submissions to
pdx86 subsystem in the future will also land in AMD specific directory.

Reviewed-by: Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
Tested-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS                               |  4 +--
 drivers/platform/x86/Kconfig              | 27 +-------------------
 drivers/platform/x86/Makefile             |  3 +--
 drivers/platform/x86/amd/Kconfig          | 31 +++++++++++++++++++++++
 drivers/platform/x86/amd/Makefile         |  9 +++++++
 drivers/platform/x86/{ => amd}/amd-pmc.c  |  0
 drivers/platform/x86/{ => amd}/amd_hsmp.c |  0
 7 files changed, 44 insertions(+), 30 deletions(-)
 create mode 100644 drivers/platform/x86/amd/Kconfig
 create mode 100644 drivers/platform/x86/amd/Makefile
 rename drivers/platform/x86/{ => amd}/amd-pmc.c (100%)
 rename drivers/platform/x86/{ => amd}/amd_hsmp.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..81c6cd8082b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -996,7 +996,7 @@ AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/amd-pmc.*
+F:	drivers/platform/x86/amd/amd-pmc.*
 
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
@@ -1006,7 +1006,7 @@ S:	Maintained
 F:	Documentation/x86/amd_hsmp.rst
 F:	arch/x86/include/asm/amd_hsmp.h
 F:	arch/x86/include/uapi/asm/amd_hsmp.h
-F:	drivers/platform/x86/amd_hsmp.c
+F:	drivers/platform/x86/amd/amd_hsmp.c
 
 AMD POWERPLAY AND SWSMU
 M:	Evan Quan <evan.quan@amd.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f08ad85683cb..b1879980ce2e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -196,32 +196,7 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
-config AMD_PMC
-	tristate "AMD SoC PMC driver"
-	depends on ACPI && PCI && RTC_CLASS
-	help
-	  The driver provides support for AMD Power Management Controller
-	  primarily responsible for S2Idle transactions that are driven from
-	  a platform firmware running on SMU. This driver also provides a debug
-	  mechanism to investigate the S2Idle transactions and failures.
-
-	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
-
-	  If you choose to compile this driver as a module the module will be
-	  called amd-pmc.
-
-config AMD_HSMP
-	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64
-	help
-	  The driver provides a way for user space tools to monitor and manage
-	  system management functionality on EPYC server CPUs from AMD.
-
-	  Host System Management Port (HSMP) interface is a mailbox interface
-	  between the x86 core and the System Management Unit (SMU) firmware.
-
-	  If you choose to compile this driver as a module the module will be
-	  called amd_hsmp.
+source "drivers/platform/x86/amd/Kconfig"
 
 config ADV_SWBUTTON
 	tristate "Advantech ACPI Software Button Driver"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 4a59f47a46e2..48abfe50aaf5 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -23,8 +23,7 @@ obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
 
 # AMD
-obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+obj-y				+= amd/
 
 # Advantech
 obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
new file mode 100644
index 000000000000..c0d0a3c5170c
--- /dev/null
+++ b/drivers/platform/x86/amd/Kconfig
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD x86 Platform Specific Drivers
+#
+
+config AMD_PMC
+	tristate "AMD SoC PMC driver"
+	depends on ACPI && PCI && RTC_CLASS
+	help
+	  The driver provides support for AMD Power Management Controller
+	  primarily responsible for S2Idle transactions that are driven from
+	  a platform firmware running on SMU. This driver also provides a debug
+	  mechanism to investigate the S2Idle transactions and failures.
+
+	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd-pmc.
+
+config AMD_HSMP
+	tristate "AMD HSMP Driver"
+	depends on AMD_NB && X86_64
+	help
+	  The driver provides a way for user space tools to monitor and manage
+	  system management functionality on EPYC server CPUs from AMD.
+
+	  Host System Management Port (HSMP) interface is a mailbox interface
+	  between the x86 core and the System Management Unit (SMU) firmware.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_hsmp.
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
new file mode 100644
index 000000000000..6115b0a7d138
--- /dev/null
+++ b/drivers/platform/x86/amd/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for drivers/platform/x86/amd
+# AMD x86 Platform-Specific Drivers
+#
+
+obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
+obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+
diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd/amd-pmc.c
similarity index 100%
rename from drivers/platform/x86/amd-pmc.c
rename to drivers/platform/x86/amd/amd-pmc.c
diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd/amd_hsmp.c
similarity index 100%
rename from drivers/platform/x86/amd_hsmp.c
rename to drivers/platform/x86/amd/amd_hsmp.c
-- 
2.25.1

