Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69026C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 19:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiFHTcz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 15:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbiFHTcy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 15:32:54 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E481E73E9
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 12:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh13GUQf6MeJwzcKOHJKxouSyr0Z/eFAgIeLf5ugBaaTv202PeLN+/XBYGYhYtqo8tlelX2iGvMuhQhvn0SwkwUCUUHePwvdIDN7TQ4DKumJXG52I9JEpNfMOQG+qDJ92n61Z8G/T6l2eJz312zlwkgOgNkO4RH0D5/cfBzXxiNGu8UIUgLEQ+8a34W3drF36qKHUB1MG/XW7kacfFyxCTe7pGpJNuI0KCXXvPNLGEMLUX2Y0LZglYImaWkVq4uVgduYocDlPT8jgwXBQa+GT3KjqPxjL9C6oXQMXqAaTIWBbwb9SO5yEod8qTv86+jpDcKQhjbr+KRaCLla/SuIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce40U2Jm82l1LlROE9JxYhqrOh6c93wyBVpP3HHCfLk=;
 b=S19/F1WpLvQtp7Be9ieIu1yWTYrD0UwN/BfL9kjYK8kmhsm4moVz3wSQFglEz9o9N+Jf/JnO2bwGPVZFU1CqTtwDLI/i122Ct9cCH1za0p5zYo+wDO5CQbvaHPrPRo5CNwe1Frq4fdTkDTG+l/Fz/xUnkQtIATI5HJ5ZmmS0ZlFp8L9G8usiWH5u+Z7aPwsUzZsSwQrGNhXjjt/91GepMdpeqY/vgWzvDkbKtkdneS9oZCKj7nrlzV3+D7M9G7ByGny606lbcsfI0yFal08eQZO8n5l9XmiWiVM2j3gqJK+d5Q4SL7MlQ0vZyG4tLI/gbubFcJyIf3oDU9fpxVT5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce40U2Jm82l1LlROE9JxYhqrOh6c93wyBVpP3HHCfLk=;
 b=GYG6hvvMMnjsgg0GdH048EJOWAbLnhCNRRqxxuY38y+cjzfMNcSB8fsYtT2XeV98bZ1bRlvb90WBwV87PyoLzvEEj8FheOVBTdZeXa8614UH4XMkb5h2VQ672DmG8Atp3VPj/i4aLhiQoxcxGePaHKdiK0k4jadSwrI6tNMdl5o=
Received: from MW4PR04CA0271.namprd04.prod.outlook.com (2603:10b6:303:89::6)
 by BL1PR12MB5111.namprd12.prod.outlook.com (2603:10b6:208:31b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 19:32:49 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::ac) by MW4PR04CA0271.outlook.office365.com
 (2603:10b6:303:89::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Wed, 8 Jun 2022 19:32:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Wed, 8 Jun 2022 19:32:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 8 Jun
 2022 14:32:43 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
        <andy.shevchenko@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>
Subject: [PATCH v3] platform/x86: Move AMD platform drivers to separate  directory
Date:   Thu, 9 Jun 2022 01:02:12 +0530
Message-ID: <20220608193212.2827257-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86dc756f-fa81-41b1-3343-08da4985ab96
X-MS-TrafficTypeDiagnostic: BL1PR12MB5111:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5111627C8F6536DE8F2CDB8A9AA49@BL1PR12MB5111.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8IQSeEm0Xe8vakzDoKKCIUxcyVCbp3XAEoG3zHcpj8IcNOHSOGK2RuMJsJiCVliQ2YNshR4yo2btMAkCA0ziBkGsTkgO7s1wl6Hrt8FbMEaRK6vbCsf7/G41NigErbSl2OT6XZ0o+Oxm0WkXkivgSwhKEoA7hL/a67AN0vo6HB0B44ttWODh01qek3Cx/tPkX9dNHr961a9mugREW4AEoZ7UHIMU/kBsqS0MSxgIC+uJRsY2BYUWg6AX+1cuvtfdJVChHQtPlZTCawWChdmHIr6htSpv3fpQowoed/g0xk/sAtes5tIdNsmC/KGaNM8mbnRcgIFZONgGZ2Nbu0Q3/sZCO5lYDROPCXOv58n79Pq7cK21gdIVdZaQDRxgdnJ12QtMpawMdnnLSnTuJTX3gbDE3omFIxQQKMUmZZaFtuRm3KxW1T+It6bN/AyxKIuSAhpmPNQX80HvdGP3XLCZV0r0YZQfj+QNczmoNL7guXlDlDv7j77CI2mekXidq5e62PC7+dvI4kE/pu25+e1JwS72/Il//SfYDB42/fn7a5Vk9T1YyPaTgRVA3IXETkKtxD7gt0lYr8pA3jnFMaa5JMGN99x457nSGL2M/NqTkGyuM20NaeBKiiMIo7n79Qz5uPmfb7jLUBk+bBkG/BkcHWFjmSZPADWuhF5LQZsyFC550QBjRUoOAAuhrW37j5Myvx1rM3sQ7srMXb8jR3tLA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(47076005)(5660300002)(36860700001)(316002)(70206006)(36756003)(4326008)(70586007)(54906003)(110136005)(508600001)(8676002)(8936002)(186003)(6666004)(2906002)(336012)(2616005)(83380400001)(1076003)(7696005)(16526019)(82310400005)(40460700003)(356005)(81166007)(26005)(426003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 19:32:48.2697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dc756f-fa81-41b1-3343-08da4985ab96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5111
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
v3:
 - Address collision problem when module with same name is used.

v2:
 - drop "amd" prefix from the file names

 MAINTAINERS                                   |  4 +--
 drivers/platform/x86/Kconfig                  | 27 +---------------
 drivers/platform/x86/Makefile                 |  3 +-
 drivers/platform/x86/amd/Kconfig              | 31 +++++++++++++++++++
 drivers/platform/x86/amd/Makefile             | 11 +++++++
 .../platform/x86/{amd_hsmp.c => amd/hsmp.c}   |  0
 drivers/platform/x86/{amd-pmc.c => amd/pmc.c} |  0
 7 files changed, 46 insertions(+), 30 deletions(-)
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
index 000000000000..a36688653203
--- /dev/null
+++ b/drivers/platform/x86/amd/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for drivers/platform/x86/amd
+# AMD x86 Platform-Specific Drivers
+#
+
+amd-pmc-y			:= pmc.o
+obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
+amd_hsmp-y			:= hsmp.o
+obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
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

