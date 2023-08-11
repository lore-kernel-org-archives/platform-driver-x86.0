Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4FEC04A6A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Aug 2023 11:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbjHKLYz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Aug 2023 07:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbjHKLYz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Aug 2023 07:24:55 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0C8100
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Aug 2023 04:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajfOorNuppjyHo8HgVxWNwYtEHRz/3Oz+GUYgdYe08CnszQokIbPpUkc07RBiZNqwpjh69D5oXJs100q1HOl3m4IZlIoBrHatjO0fI75wacU4MVbcI4utRKhrTZb7vB4JWnGm2r/ahSLc5QI4tqqGiwoV5AlUrr45RBvwCcjIwQo26/IA4ybEPrPo94i6qwU9mN7hErKQcHltpKUXeEOiu10WlFOGAbAHt4mkJmGJUceZMXq39sfP2Sve6Y28GM90EV0bUhmWEwo+ozRDDUKC7l0irSLy0cBabTc7NPYsT4lgMJqZVd4YH791HyIaNWjq3yeOTqFI1HrYAp4rfMJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vtaGoDTPee8MHviIWZi/G70SDOSIQ9OsI1wUMCE860=;
 b=Winm8XUqY7CAuWMEM389eCql0IVQ1VJ9fJh0SF3Iv+qdCiDjeWFXWqp84izOBg0xlj1GP5ZOw5cqQEiufe23uvmxcBMCKJ3aXSrJGO0Che+dAWPeEceWy4ZasJfBOS+IfYk++vvqYAka+irzp0OU4RB/ZnC9bszdGAC7UMwhiQgtTzzDtdgRKtEFIvoeZ0JetlT/LwORAJzdEWFpX/0cCKDzhBDIoi4mkeUDSJOrWeQXvzQdUQWNWFN/B1LXjsxJ+oNlDbIqo8Zn0R5ev6UGMBKht/QRpRV3EF8/qDldPGemRfuB3PDR00T4qEl6RtVbGdHe3gkTEYz1IYCrqLEhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vtaGoDTPee8MHviIWZi/G70SDOSIQ9OsI1wUMCE860=;
 b=kZ8gAZUGQ2N3euXWRDUSfNzVhefM5wryufKulJToIGc6Pmpo6ZeJ5KRvHAsEyJ1xwAT0dI6evs0DCo22+WIAiVVROtOsqexsXJ9ZUeo7Xg9shIw+YjLnNAseMjpCxyEhUjFwnP4PijLIjp50XKdaptiYseIJdwUl8Cw9O8cOSHA=
Received: from BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14) by
 IA0PR12MB8863.namprd12.prod.outlook.com (2603:10b6:208:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 11:22:11 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::91) by BYAPR01CA0037.outlook.office365.com
 (2603:10b6:a03:94::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25 via Frontend
 Transport; Fri, 11 Aug 2023 11:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 11 Aug 2023 11:22:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 06:22:04 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/4] platform/x86/amd/pmc: Move PMC driver to separate directory
Date:   Fri, 11 Aug 2023 16:51:13 +0530
Message-ID: <20230811112116.2279419-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|IA0PR12MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cb90eb-3040-46fa-21e2-08db9a5d345d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJyVldyIIaN8IB+Ye0O65mYjFCPdmmCjL8QqD8R0dky7wz76C6wDWyjHjje3MMTyFSBEpXLfMlybtZGkxxy5UJdKlFYivmXacAsBVIBYK5IiBHynHTtw8mBiWllErG1d779OonHWRQMAIVb5Zn7j+s5/S/3LmekaKSGv9ZA+lK+jyPExaJx5CUNN+LXcYEi8m/xaoE4MyrH+yfEcqoVzQn1G+G9cIItACSZD3YOdcrm4MxEgZyaPuc5HLdg2M+b9B+CyU08FZDwoiwbwp6xbwYcz9gvIbA0Th+QpHzOdUdU2z6sN7zfAgnSARQyeeLO+kXJh9EqTqqx16raNOvJsE7oP80hx/DyBNsutE/fJFUFw8+v3IQil7uUTESflkfaMvoH2+vALW28dWLwlnuj9HYVNCHm9bd5xlnqgfcVezlDWEpjfmiY+E3ZkgG3GYCbs2HTPinKiVsPDMNSMdHMP+wcOAocF+WwrvHYjHE1/wrTN5tUJafcU5SD5My5mmmhDg5W2SSglAfMv3K2EhxdwDYStqu30uiCGd5RZN0RjM5QmlIG/lqqtc/lk5SelKoDksTpTdDDRVm7Snm0ENjLkpz9XwNu8FuJErgKbIcHyeOM4DbnbzS6PtWV7wASgN/zjLLkikz6sYBmP99KIwptmZojtyU/WFNYIYjDwIasNpHqocIKBBHdQ4aBMdcadeRENAzEL6UVHPJD/g6LyAWIY/YJzmy2FNDyYKZgCXKOs/bJ6rArVog61tq89SmP7tpoUfSyyCzPTM0Qcu6yWP9fTzQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(1800799006)(186006)(82310400008)(40470700004)(46966006)(36840700001)(426003)(83380400001)(40480700001)(2616005)(40460700003)(110136005)(54906003)(478600001)(86362001)(2906002)(36860700001)(82740400003)(356005)(6666004)(7696005)(81166007)(8936002)(41300700001)(5660300002)(8676002)(70586007)(70206006)(316002)(4326008)(336012)(47076005)(26005)(16526019)(36756003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 11:22:10.2805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cb90eb-3040-46fa-21e2-08db9a5d345d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8863
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

With latest commits having PMC code spread across multiple files, it would
be easier to maintain them in a separate directory under amd/pmc.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS                                   |  2 +-
 drivers/platform/x86/amd/Kconfig              | 16 +---------------
 drivers/platform/x86/amd/Makefile             |  3 +--
 drivers/platform/x86/amd/pmc/Kconfig          | 19 +++++++++++++++++++
 drivers/platform/x86/amd/pmc/Makefile         |  8 ++++++++
 .../platform/x86/amd/{ => pmc}/pmc-quirks.c   |  0
 drivers/platform/x86/amd/{ => pmc}/pmc.c      |  0
 drivers/platform/x86/amd/{ => pmc}/pmc.h      |  0
 8 files changed, 30 insertions(+), 18 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmc/Makefile
 rename drivers/platform/x86/amd/{ => pmc}/pmc-quirks.c (100%)
 rename drivers/platform/x86/amd/{ => pmc}/pmc.c (100%)
 rename drivers/platform/x86/amd/{ => pmc}/pmc.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f966f05fb0d..366d4b4c9c8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1006,7 +1006,7 @@ AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/amd/pmc.c
+F:	drivers/platform/x86/amd/pmc/
 
 AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index d9685aef0887..55f3a2fc6aec 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -4,21 +4,7 @@
 #
 
 source "drivers/platform/x86/amd/pmf/Kconfig"
-
-config AMD_PMC
-	tristate "AMD SoC PMC driver"
-	depends on ACPI && PCI && RTC_CLASS && AMD_NB
-	select SERIO
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
+source "drivers/platform/x86/amd/pmc/Kconfig"
 
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index 65732f0a3913..f04932b7a7d1 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -4,8 +4,7 @@
 # AMD x86 Platform-Specific Drivers
 #
 
-amd-pmc-y			:= pmc.o pmc-quirks.o
-obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
+obj-$(CONFIG_AMD_PMC)		+= pmc/
 amd_hsmp-y			:= hsmp.o
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
 obj-$(CONFIG_AMD_PMF)		+= pmf/
diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
new file mode 100644
index 000000000000..8db9e82de00b
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD PMC Driver
+#
+
+config AMD_PMC
+	tristate "AMD SoC PMC driver"
+	depends on ACPI && PCI && RTC_CLASS && AMD_NB
+	select SERIO
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
diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
new file mode 100644
index 000000000000..4aaa29d351c9
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/amd/pmc
+# AMD Power Management Controller Driver
+#
+
+amd-pmc-objs := pmc.o pmc-quirks.o
+obj-$(CONFIG_AMD_PMC) += amd-pmc.o
diff --git a/drivers/platform/x86/amd/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
similarity index 100%
rename from drivers/platform/x86/amd/pmc-quirks.c
rename to drivers/platform/x86/amd/pmc/pmc-quirks.c
diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
similarity index 100%
rename from drivers/platform/x86/amd/pmc.c
rename to drivers/platform/x86/amd/pmc/pmc.c
diff --git a/drivers/platform/x86/amd/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
similarity index 100%
rename from drivers/platform/x86/amd/pmc.h
rename to drivers/platform/x86/amd/pmc/pmc.h
-- 
2.25.1

