Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FFEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Feb 2022 13:53:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238935AbiBANxb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 08:53:31 -0500
Received: from mail-dm6nam12on2060.outbound.protection.outlook.com ([40.107.243.60]:47960
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230073AbiBANxb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 08:53:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THpVd6DO9/UXKdmwO5dgylFuLEtBejEon6kxNs8ftlazl+86EySGNrwgBGvLy6i3yzTC33O7p7nw8bLvXD1Xmv+olI1NSyohh7rmjkp8qwJdQhO5RO+EhcW5mx+TcSdOZYgh85sOw9QaW81vQNTWGOVNR85fdbz4XUY7PgLxmByTiimtrzhIKCUZnBTdxhnrb5SoAQrg8/41fSR1BpHPDSYv/47Rx0QQBdgskZOhFIsi4YzB6uy/gG4+nheizflK15PlK49lMIS9CHLp0ISRH8iPLvtzp83+7hGBGXQ9mQN6XwLR99rF6XCq5BPnKv2UTt2wmyVyINr1KcHjJdHgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLRRRi4J4l5ecM0lcjdJv4jIJh3HAwe/bwAT0HKOoA4=;
 b=SiVNE+mKX06ClxMxHKOuzMiiIPEYAAOLMAlV41s059RyKmlhREl8Q5DCToQfmVvR0DALoZj73KiF16qrQDQVA/IpqpWDOSrzrDyzLlfsVRoAtMD4WlSqANB/rGQQ5oVXzcDaFv+l7zxT7AhVHh2KjXs3LLurGbhE0zs0bb8oRcf0YuUbW0NLAyFIJ0AUH6Py7agA1zzsmG5dZPzQ7iQhtXiDSCHCJrL7IbWKSJqY4ZRIi5+n50aWdfqbyVb18kEtnUAKNR+NK1dFg6JIxWDj49Txx+7RYmCceiEkEsW/fodMLXeKGTCde2OB3vun2CRqqtcYwSLwA+fHWwGVe9PFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLRRRi4J4l5ecM0lcjdJv4jIJh3HAwe/bwAT0HKOoA4=;
 b=jvSPAHvcD5E/p+011UBvpFpA8aw5Qf+82z9MuC+2nNvil66vHOS13n/knHQ1uVCjuRpMjb7OXrxBJ+4UI8mfq/78llUCC5xE30NPq5aVu/9yAxumZKucaN4FHC5ZfxBm5/UkvKFyJq4pLEr+r9Sc5mVUjOnB/yBzRZpYKSoOD0A=
Received: from DM6PR02CA0070.namprd02.prod.outlook.com (2603:10b6:5:177::47)
 by MWHPR12MB1294.namprd12.prod.outlook.com (2603:10b6:300:10::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Tue, 1 Feb
 2022 13:53:26 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::3a) by DM6PR02CA0070.outlook.office365.com
 (2603:10b6:5:177::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Tue, 1 Feb 2022 13:53:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 13:53:26 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 07:53:21 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>, <Shyam-sundar.S-k@amd.co>,
        Suma Hegde <suma.hegde@amd.com>,
        "Naveen Krishna Chatradhi" <nchatrad@amd.com>
Subject: [PATCH 1/2] platforms/x86: Add AMD system management interface driver
Date:   Tue, 1 Feb 2022 19:23:00 +0530
Message-ID: <20220201135301.158868-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201135301.158868-1-nchatrad@amd.com>
References: <20220201135301.158868-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161cd6b5-cf31-4c6b-0a3d-08d9e58a387b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1294:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB12948854F15DCED304250BE7E8269@MWHPR12MB1294.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +417SjIdnIM/3l6VmR5E9q5MTW1AIpj8bz6CHlTaV5vbQeUNzWIhIZoNsuGZ3S9D2vEo9Fyuqq7fjc4aWYTDeZC3oAU7B+nEqc3W7g1HRKKHsjzxd8DnCI3sBwIkFTPp++MxoAIRcf8EaW1bJs3boq5fFwDbi0aVPBKxrisD61t1z2emP8wkoJ1VRvDODttdM/9AjjNboqhqQQYPoPNlP8XUXTvEdVnYZvI8rpb7LaR6nMrbhT0hh6mj/RIGy5KwsFRBtcyV8IETSGvbYDJ4hJNj7HslW0lfSK0dGql3+DDeyaMCcMV1RmR4qch2g4ycJT6jGnbdUXQ27JB6NG1fGA2VtYyLf/32kaKtSvKbhVLsa6Kua0WiJJzBhxW0guJLftPTKljaY1GEPs5PEOxpK8amWfINqJtEZNmkM8DiVCiyz4QnzEqAbFSe2J9Lq+0ls2bXJcobRCmWqeisWTuPXZkH/CoNpw3r6J34AaE09lH/mK1uxGAvJKPWduyMFAXW9Iug/po67kA40Htgnk/nBsXJsu5RHtwaXpT+mQTNyy8eshbeSmge8FtEtdW9/CxAbrrn779QfV+jGAC+QoFd5SthlBlwhJ5lhY+iQfY/DVvs8EP5tHksN6EST8iqKGTxUFXPwmB47zMJGhf0Gv/KsxRZwjz6bw3bcTQbLgXrnWCRQv0PK1IH/mg/NPfDRmM0MOVIyZITHbILc+hD9qpiAf5Aa2Lu6kDmyEzqbKjSjm1TwFdHnNiezzZsNOg0pbytMql9dXBbBxndwBppBzbz7gDRP0Zan3XL3D3r9FP1fZo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(30864003)(7696005)(2906002)(36860700001)(83380400001)(36756003)(70206006)(16526019)(40460700003)(5660300002)(2616005)(26005)(1076003)(186003)(336012)(426003)(4326008)(6666004)(966005)(82310400004)(47076005)(508600001)(8676002)(81166007)(8936002)(70586007)(356005)(6916009)(316002)(54906003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 13:53:26.4533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 161cd6b5-cf31-4c6b-0a3d-08d9e58a387b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1294
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

Recent Fam19h EPYC server line of processors from AMD support system
management functionality via HSMP (Host System Management Port) interface.

The Host System Management Port (HSMP) is an interface to provide
OS-level software with access to system management functions via a
set of mailbox registers.

More details on the interface can be found in chapter
"7 Host System Management Port (HSMP)" of the following PPR
https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip

This patch adds new amd_hsmp module under the drivers/platforms/x86/
which creates miscdevice with an IOCTL interface to the user space.
/dev/hsmp is for running the hsmp mailbox commands.

Major features support by the interface include monitor and/or control of
a. boostlimit
b. current power, power limit, max power limit
c. c0 residency
d. prochot status
e. clocks
f. ddr bandwidth, utilization
g. data fabric P-state

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 arch/x86/include/asm/amd_hsmp.h               |  16 +
 arch/x86/include/uapi/asm/amd_hsmp.h          |  56 +++
 drivers/platform/x86/Kconfig                  |  13 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/amd_hsmp.c               | 426 ++++++++++++++++++
 6 files changed, 514 insertions(+)
 create mode 100644 arch/x86/include/asm/amd_hsmp.h
 create mode 100644 arch/x86/include/uapi/asm/amd_hsmp.h
 create mode 100644 drivers/platform/x86/amd_hsmp.c

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 687efcf245c1..663e316d320c 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -372,6 +372,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:thomas@winischhofer.net>
 0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
                                                                      <mailto:mathieu.desnoyers@efficios.com>
+0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
+                                                                     <mailto:nchatrad@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
 ====  =====  ======================================================= ================================================================
diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
new file mode 100644
index 000000000000..db2846bb3c37
--- /dev/null
+++ b/arch/x86/include/asm/amd_hsmp.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _ASM_X86_AMD_HSMP_H_
+#define _ASM_X86_AMD_HSMP_H_
+
+#include <uapi/asm/amd_hsmp.h>
+
+#if (defined(CONFIG_AMD_HSMP) || defined(CONFIG_AMD_HSMP_MODULE))
+int hsmp_send_message(struct hsmp_message *msg);
+#else
+int hsmp_send_message(struct hsmp_message *msg)
+{
+	return -ENODEV;
+}
+#endif
+#endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
new file mode 100644
index 000000000000..cd98c061564e
--- /dev/null
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _UAPI_ASM_X86_AMD_HSMP_H_
+#define _UAPI_ASM_X86_AMD_HSMP_H_
+
+#include <linux/types.h>
+
+#pragma pack(4)
+
+#define HSMP_MAX_MSG_LEN 8
+
+/*
+ * HSMP Message types supported
+ */
+enum hsmp_message_ids {
+	HSMP_TEST = 1,
+	HSMP_GET_SMU_VER,
+	HSMP_GET_PROTO_VER,
+	HSMP_GET_SOCKET_POWER,
+	HSMP_SET_SOCKET_POWER_LIMIT,
+	HSMP_GET_SOCKET_POWER_LIMIT,
+	HSMP_GET_SOCKET_POWER_LIMIT_MAX,
+	HSMP_SET_BOOST_LIMIT,
+	HSMP_SET_BOOST_LIMIT_SOCKET,
+	HSMP_GET_BOOST_LIMIT,
+	HSMP_GET_PROC_HOT,
+	HSMP_SET_XGMI_LINK_WIDTH,
+	HSMP_SET_DF_PSTATE,
+	HSMP_AUTO_DF_PSTATE,
+	HSMP_GET_FCLK_MCLK,
+	HSMP_GET_CCLK_THROTTLE_LIMIT,
+	HSMP_GET_C0_PERCENT,
+	HSMP_SET_NBIO_DPM_LEVEL,
+	HSMP_RESERVED,
+	HSMP_GET_DDR_BANDWIDTH,
+	HSMP_GET_TEMP_MONITOR,
+	HSMP_MSG_ID_MAX,
+};
+
+struct hsmp_message {
+	__u32	msg_id;				/* Message ID */
+	__u16	num_args;			/* Number of arguments in message */
+	__u16	response_sz;			/* Number of expected response words */
+	__u32	args[HSMP_MAX_MSG_LEN];		/* Argument(s) */
+	__u32	response[HSMP_MAX_MSG_LEN];	/* Response word(s) */
+	__u16	sock_ind;			/* socket number */
+};
+
+/* Reset to default packing */
+#pragma pack()
+
+/* Define unique ioctl command for hsmp msgs using generic _IOWR */
+#define HSMP_BASE_IOCTL_NR			0xF8
+#define HSMP_IOCTL_CMD				_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
+
+#endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 24deeeb29af2..0906c36ea07b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -210,6 +210,19 @@ config AMD_PMC
 	  If you choose to compile this driver as a module the module will be
 	  called amd-pmc.
 
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
+
 config ADV_SWBUTTON
 	tristate "Advantech ACPI Software Button Driver"
 	depends on ACPI && INPUT
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index c12a9b044fd8..b3a93a5053a3 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
 
 # AMD
 obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
+obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
 
 # Advantech
 obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd_hsmp.c
new file mode 100644
index 000000000000..77057e14fbbd
--- /dev/null
+++ b/drivers/platform/x86/amd_hsmp.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2022, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides a device implementation for HSMP interface
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/amd_hsmp.h>
+#include <asm/amd_nb.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/semaphore.h>
+
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"1.0"
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
+/*
+ * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
+ * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
+ * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
+ */
+#define SMN_HSMP_MSG_ID		0x3B10534
+#define SMN_HSMP_MSG_RESP	0x3B10980
+#define SMN_HSMP_MSG_DATA	0x3B109E0
+
+#define HSMP_INDEX_REG		0xc4
+#define HSMP_DATA_REG		0xc8
+
+static struct semaphore *hsmp_sem;
+
+static struct miscdevice hsmp_device;
+
+/* List of "Configure/SET" msgs */
+static u32 hsmp_set_msgs[] = {
+	HSMP_SET_SOCKET_POWER_LIMIT,
+	HSMP_SET_BOOST_LIMIT,
+	HSMP_SET_BOOST_LIMIT_SOCKET,
+	HSMP_SET_XGMI_LINK_WIDTH,
+	HSMP_SET_DF_PSTATE,
+	HSMP_AUTO_DF_PSTATE,
+	HSMP_SET_NBIO_DPM_LEVEL
+};
+
+/* List of "Monitor/GET" msgs */
+static u32 hsmp_get_msgs[] = {
+	HSMP_TEST,
+	HSMP_GET_SMU_VER,
+	HSMP_GET_PROTO_VER,
+	HSMP_GET_SOCKET_POWER,
+	HSMP_GET_SOCKET_POWER_LIMIT,
+	HSMP_GET_SOCKET_POWER_LIMIT_MAX,
+	HSMP_GET_BOOST_LIMIT,
+	HSMP_GET_PROC_HOT,
+	HSMP_GET_FCLK_MCLK,
+	HSMP_GET_CCLK_THROTTLE_LIMIT,
+	HSMP_GET_C0_PERCENT,
+	HSMP_GET_DDR_BANDWIDTH,
+	HSMP_GET_TEMP_MONITOR
+};
+
+static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
+			 u32 *value, bool write)
+{
+	int ret;
+
+	ret = pci_write_config_dword(root, HSMP_INDEX_REG, address);
+	if (ret)
+		return ret;
+
+	ret = (write ? pci_write_config_dword(root, HSMP_DATA_REG, *value)
+		     : pci_read_config_dword(root, HSMP_DATA_REG, value));
+
+	return ret;
+}
+
+/*
+ * Send a message to the HSMP port via PCI-e config space registers.
+ *
+ * The caller is expected to zero out any unused arguments.
+ * If a response is expected, the number of response words should be greater than 0.
+ *
+ * Returns 0 for success and populates the requested number of arguments.
+ * Returns a negative error code for failure.
+ */
+static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
+{
+	unsigned long timeout, short_sleep;
+	u32 mbox_status;
+	u32 arg_num;
+	int ret;
+
+	/* Clear the status register */
+	mbox_status = HSMP_STATUS_NOT_READY;
+	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
+	if (ret) {
+		pr_err("Error %d clearing mailbox status register\n", ret);
+		return ret;
+	}
+
+	arg_num = 0;
+	/* Write any message arguments */
+	while (arg_num < msg->num_args) {
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (arg_num << 2),
+				    &msg->args[arg_num], HSMP_WR);
+		if (ret) {
+			pr_err("Error %d writing message argument %d\n", ret, arg_num);
+			return ret;
+		}
+		arg_num++;
+	}
+
+	/* Write the message ID which starts the operation */
+	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
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
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
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
+	/* SMU has responded OK. Read response data */
+	arg_num = 0;
+	while (arg_num < msg->response_sz) {
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (arg_num << 2),
+				    &msg->response[arg_num], HSMP_RD);
+		if (ret) {
+			pr_err("Error %d reading response %u for message ID:%u\n",
+			       ret, arg_num, msg->msg_id);
+			break;
+		}
+		arg_num++;
+	}
+
+	return ret;
+}
+
+int hsmp_send_message(struct hsmp_message *msg)
+{
+	struct amd_northbridge *nb;
+	int ret;
+
+	if (!msg)
+		return -EINVAL;
+
+	nb = node_to_amd_nb(msg->sock_ind);
+	if (!nb || !nb->root)
+		return -ENODEV;
+
+	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
+		return -EINVAL;
+
+	if (msg->num_args > HSMP_MAX_MSG_LEN || msg->response_sz > HSMP_MAX_MSG_LEN)
+		return -EINVAL;
+
+	/*
+	 * The time taken by smu operation to complete is between
+	 * 10us to 1ms. Sometime it may take more time.
+	 * In SMP system timeout of 100 millisecs should
+	 * be enough for the previous thread to finish the operation
+	 */
+	ret = down_timeout(&hsmp_sem[msg->sock_ind],
+			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
+	if (ret < 0)
+		return ret;
+
+	ret = __hsmp_send_message(nb->root, msg);
+
+	up(&hsmp_sem[msg->sock_ind]);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hsmp_send_message);
+
+static int hsmp_test(u16 sock_ind)
+{
+	struct hsmp_message msg = { 0 };
+	struct amd_northbridge *nb;
+	int ret = -ENODEV;
+
+	nb = node_to_amd_nb(sock_ind);
+	if (!nb || !nb->root)
+		return ret;
+
+	/*
+	 * Test the hsmp port by performing TEST command. The test message takes
+	 * one argument and returns the value of that argument + 1.
+	 */
+	msg.sock_ind	= sock_ind;
+	msg.response_sz = 1;
+	msg.num_args	= 1;
+	msg.msg_id	= HSMP_TEST;
+	msg.args[0]	= 0xDEADBEEF;
+
+	ret = __hsmp_send_message(nb->root, &msg);
+	if (ret)
+		return ret;
+
+	if (msg.response[0] != (msg.args[0] + 1)) {
+		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
+		       sock_ind, msg.args[0] + 1, msg.response[0]);
+		return -EBADE;
+	}
+
+	return 0;
+}
+
+static int search_msg_list(u32 msgid, u32 *list, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		if (msgid == list[i])
+			return 0;
+	}
+	return -EINVAL;
+}
+
+static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	int __user *arguser = (int  __user *)arg;
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
+		return -EFAULT;
+
+	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
+	case FMODE_WRITE:
+		/* check if the msgid is a set msg */
+		ret = search_msg_list(msg.msg_id, hsmp_set_msgs, ARRAY_SIZE(hsmp_set_msgs));
+		if (ret)
+			return ret;
+
+		return hsmp_send_message(&msg);
+	case FMODE_READ:
+		/* check if the msgid is a get msg */
+		ret = search_msg_list(msg.msg_id, hsmp_get_msgs, ARRAY_SIZE(hsmp_get_msgs));
+		if (ret)
+			return ret;
+		break;
+	case FMODE_READ | FMODE_WRITE:
+		ret = search_msg_list(msg.msg_id, hsmp_set_msgs, ARRAY_SIZE(hsmp_set_msgs));
+		if (!ret)
+			return hsmp_send_message(&msg);
+
+		ret = search_msg_list(msg.msg_id, hsmp_get_msgs, ARRAY_SIZE(hsmp_get_msgs));
+		if (ret)
+			return ret;
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret =  hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
+		return -EFAULT;
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
+	int ret, i;
+
+	hsmp_sem = devm_kzalloc(&pdev->dev,
+				(amd_nb_num() * sizeof(struct semaphore)),
+				GFP_KERNEL);
+	if (!hsmp_sem)
+		return -ENOMEM;
+
+	for (i = 0; i < amd_nb_num(); i++)
+		sema_init(&hsmp_sem[i], 1);
+
+	hsmp_device.name	= "hsmp_cdev";
+	hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+	hsmp_device.fops	= &hsmp_fops;
+	hsmp_device.parent	= &pdev->dev;
+	hsmp_device.nodename	= "hsmp";
+	hsmp_device.mode	= 0644;
+
+	ret = misc_register(&hsmp_device);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int hsmp_pltdrv_remove(struct platform_device *pdev)
+{
+	misc_deregister(&hsmp_device);
+
+	return 0;
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
+static int __init hsmp_plt_init(void)
+{
+	int ret = -ENODEV;
+	u16 num_sockets;
+	int i;
+
+	/*
+	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
+	 * if we have N SMN/DF interfaces that ideally means N sockets
+	 */
+	num_sockets = amd_nb_num();
+	if (num_sockets == 0)
+		return ret;
+
+	/* Test the hsmp interface on each socket */
+	for (i = 0; i < num_sockets; i++) {
+		ret = hsmp_test(i);
+		if (ret)
+			return ret;
+	}
+
+	ret = platform_driver_register(&amd_hsmp_driver);
+	if (ret)
+		return ret;
+
+	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
+	if (!amd_hsmp_platdev) {
+		ret = -ENOMEM;
+		goto drv_unregister;
+	}
+
+	ret = platform_device_add(amd_hsmp_platdev);
+	if (ret) {
+		platform_device_put(amd_hsmp_platdev);
+		goto drv_unregister;
+	}
+
+	return 0;
+
+drv_unregister:
+	platform_driver_unregister(&amd_hsmp_driver);
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
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

