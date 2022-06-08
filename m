Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22186C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 18:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbiFHSVF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 14:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiFHSVC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 14:21:02 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5377C2DEE
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 11:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McL9vcFQNLrsZXW8PO4EJY3cDwBzJ9Y0kiVdI0Ts+dhD726LV4hvumEeNlF3I8Q+fHwaW5r8osSGxmpWJQe8jTKQ6HNZZa7MJ1C8OgyaHZFQqrfxvjsRpWlS7mfMjqDHDf5yyem54W9UddyGU/PYtmNJMTutt3ivErAPNdmIOC7P/d7e+UdkqoMEnuGiYlVpVn1SwE2nP2R9AT+x4FEIKVDdqaK5I27V2J3Vq4gO/IbYD/YKDcXoqF+D2nKpXkAkINVIOq6oHn+nxHv7AzCsyzu71hVqRRInybJHBqtF45aS5KTzhdG8aIcnCEfQCTBLTb/39fcj6SaycbLptJPPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PV6djU5VloCg3V4yu5Vl6Lq3FN45w7FIGMl3vFzBYGM=;
 b=gUnYUsq0D0pip2EWBshKRySjQka48xdOschhIufGZe+i5qlCFWS5yPniSZxWhqIR6b1Tvas7NOzEOYtnmBThZIckqqflp+3FRY9idr0g4BugNMVWbw9OKLkszscBFWV9e8ZBiixJlg0d4TZ4d/EXb+LMeTDWQthSECvPM3hWs63a10mRM0tIw0pbfXnJS21G7S1UnuypRu18MthwV1xuXQLJT5HgGc9d/Uw5JmFmMkKZdf9YFS0FydK9bCUpx6C2Jp+g9F+5jJQ+FQjTmpwZcoKOdK3U9IRzTHOWKqHgOeE5FSCZ3y2P0Upe/Mi0X4IzRL6LfKy0/2Q4oP5Ec/K1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PV6djU5VloCg3V4yu5Vl6Lq3FN45w7FIGMl3vFzBYGM=;
 b=fGpIFcwrKUD50614w8C7RMa4AMoOgnkrIx2NyMSx8cSmFQrI+EP/wf9AcHgr7yAwRi1eCaVsVQaBiiQp3OHnE8cSvaa5v84J+ZSdOV6P79bsN/tRW6zgFClpTNDJ+b5a/e4bmlB5QEAwNzDkBsWLtqBmLywVG+e1IsG95/6vcnc=
Received: from MW4PR04CA0379.namprd04.prod.outlook.com (2603:10b6:303:81::24)
 by PH0PR12MB5499.namprd12.prod.outlook.com (2603:10b6:510:d5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 18:20:57 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::c) by MW4PR04CA0379.outlook.office365.com
 (2603:10b6:303:81::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Wed, 8 Jun 2022 18:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Wed, 8 Jun 2022 18:20:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 8 Jun
 2022 13:20:54 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>
Subject: [PATCH v2] platform/x86: Move AMD platform drivers to separate  directory
Date:   Wed, 8 Jun 2022 23:50:19 +0530
Message-ID: <20220608182019.2810125-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d0f32e-edb1-49d1-5bac-08da497ba208
X-MS-TrafficTypeDiagnostic: PH0PR12MB5499:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5499229A134F4811CD4C8C0C9AA49@PH0PR12MB5499.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bzqBQtQ/7hWOr7PoPHQ9Po3anmT7xZsjTZ9EYh8s9pwSoG7TCzseCGJ/FC3pc9L+lTolO4YM4F8V7Q9GXT44PT97BgW9/jk3IOThzuDXbW5PlI+0J9ZpH4XyMMZf0Uu4NGBlotLtHFuhydjRaC8z/sfokUba13RnP2OWIOpo35doyVt9A9GHUSOkYHzUDXGHHa5+zxZEng9xNe5ZmefKR4nRqQr5QXVAp5fi79hNdKki+xPtJhNsJyH87IKTCW5fe2ack35FX9npoa9c3CA5LdTvgcRM9sMCRZWfXSFqQTa8ieu0/HoZAmY8JHiHs80h831rwk1+1sXA02TxT6F2vIYvrDk6rE3+VNnBxs2sE1GMPPGO3qYFVcwSqVHbFnj6EvKFXoyY9L8X1xLqE6nHX3j3cv1W508ze1hLXwqYaKRVpKtUY6cAz0n+bdfM3dYWvMVXIRsQ56UEwUt76Cx39mJIdzLvNzaF84LasreYNZkQp7YnlRZJuflwC/W5F8i6Yw5l1DWGmNQUG9HgutTfS4seC41R+XiwCcEruRPM5uIgPw0YkMR5c9Z0Znl/BB0OSz3dCvb/atcEch0SV5ABgDiGV7CFbwG/RQ25EvrNO+K246TY8oqIbNW2SPQV+4AtRV6oCvWFinCgJmYy6z5MhzrdFsKDEJJ6hoHYyIzAQ5bA7PfxloA2j+oMXNL/a7Dusq252yL9Wp5I1jQmjnnqHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(356005)(186003)(1076003)(316002)(81166007)(26005)(336012)(8936002)(83380400001)(54906003)(426003)(110136005)(8676002)(5660300002)(2906002)(16526019)(36756003)(70206006)(70586007)(40460700003)(7696005)(47076005)(86362001)(4326008)(36860700001)(6666004)(2616005)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 18:20:57.1795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d0f32e-edb1-49d1-5bac-08da497ba208
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5499
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
v2:
  - drop "amd" prefix from the file names

 MAINTAINERS                                   |  4 +--
 drivers/platform/x86/Kconfig                  | 27 +---------------
 drivers/platform/x86/Makefile                 |  3 +-
 drivers/platform/x86/amd/Kconfig              | 31 +++++++++++++++++++
 drivers/platform/x86/amd/Makefile             |  9 ++++++
 .../platform/x86/{amd_hsmp.c => amd/hsmp.c}   |  0
 drivers/platform/x86/{amd-pmc.c => amd/pmc.c} |  0
 7 files changed, 44 insertions(+), 30 deletions(-)
 create mode 100644 drivers/platform/x86/amd/Kconfig
 create mode 100644 drivers/platform/x86/amd/Makefile
 rename drivers/platform/x86/{amd_hsmp.c => amd/hsmp.c} (100%)
 rename drivers/platform/x86/{amd-pmc.c => amd/pmc.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..2a34deb24594 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -996,7 +996,7 @@ AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/amd-pmc.*
+F:	drivers/platform/x86/amd/pmc.c
 
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
@@ -1006,7 +1006,7 @@ S:	Maintained
 F:	Documentation/x86/amd_hsmp.rst
 F:	arch/x86/include/asm/amd_hsmp.h
 F:	arch/x86/include/uapi/asm/amd_hsmp.h
-F:	drivers/platform/x86/amd_hsmp.c
+F:	drivers/platform/x86/amd/hsmp.c
 
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
index 000000000000..de1604993309
--- /dev/null
+++ b/drivers/platform/x86/amd/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for drivers/platform/x86/amd
+# AMD x86 Platform-Specific Drivers
+#
+
+obj-$(CONFIG_AMD_PMC)		+= pmc.o
+obj-$(CONFIG_AMD_HSMP)		+= hsmp.o
+
diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd/hsmp.c
similarity index 100%
rename from drivers/platform/x86/amd_hsmp.c
rename to drivers/platform/x86/amd/hsmp.c
diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd/pmc.c
similarity index 100%
rename from drivers/platform/x86/amd-pmc.c
rename to drivers/platform/x86/amd/pmc.c
-- 
2.25.1

