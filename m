Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D96C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Feb 2022 13:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiBPNeP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 08:34:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiBPNeO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 08:34:14 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13ABC228C99
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 05:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtuX3yYaykyXiW8NRI/KH9acXdZuHJ4Yb3NlVNhKVoE3Svbu64n/34O2NsNq2h+CxlaSY6nHOVqC5NHl0ySmoS1WDgq3HW5MxU0gR8hLJoBOPDxcPsChleKzh337BrlMvivWyZN53ayVEVTyJ08sfCMUxHUoK8LnDghbhsoiBmCpVzBulO8mx7ttK0dn7ULaho0Xo0+6iUcztBYD1Uq7pM1edpSQid9aUeYZVAGAcQpmsNak5Gx4b+d74ANTtKZ18nnZFr2wcSPRrUygwVaBXC0F4C05QC5D5MNvrxr8tjMsY/yRZzCUjst02Li9N8tbNxb+kjaJo/6dH9Q6Y97cGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0ZYiwlnE52os7la+4Y0DUTmcxfi6/6jpI+W3SC3vDI=;
 b=Lj1b5FvxTtnc18lKoY8IzC9bc51oM2D56Y/CRN5h/c+dLZNOQBPZ3EN9uTidwxZwioW8p17axTDOWxEreoPIi6cYtDIIEI0KypGHA1SBE0ZrAr7nRweSxPvptyyZC3LLclSN1k6/z11WhaEH2a/nHxubxG3uWLIz9utC8/08qFjvH4NWsp0fZI0gyLdOKM67lK6nFh+zPjYBBZAoFCJWTTgZn5VGaYacmVoplC3uA0spLBbewxHu0wxZKmjAcbMtX64s47Cm1AB12z6pMbR+C8upBzw5+50pa7cWFMq4rPifc8wvxMID+vL6aD+6Uy6UlNFzRRx1Z9uKk+L+1PAc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0ZYiwlnE52os7la+4Y0DUTmcxfi6/6jpI+W3SC3vDI=;
 b=LXqtxiq2a+OKiVVSnFKKdeDgVnL2nsNHl142gfrWCU0wGEP8OIwEfRwHUen91d5lUIcui1gv2fQF6kyL54mzFLKkT6+6mdQ5qUI8ITInA8XMCiIGzG/l+GGgzVKeKIOOGVHOvhjmwrDVQvGxsrO4Ld4NDY6oTbNuJD8+tiUQ6kM=
Received: from DM6PR02CA0131.namprd02.prod.outlook.com (2603:10b6:5:1b4::33)
 by DM5PR12MB2358.namprd12.prod.outlook.com (2603:10b6:4:b3::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 13:33:59 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::31) by DM6PR02CA0131.outlook.office365.com
 (2603:10b6:5:1b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 13:33:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 13:33:58 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 07:33:55 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>, <nathan.fontenot@amd.com>,
        <song@kernel.org>, Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 1/2] platforms/x86: Add AMD system management interface
Date:   Wed, 16 Feb 2022 19:03:35 +0530
Message-ID: <20220216133336.108810-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97f3ca67-8287-46f8-0945-08d9f150fca7
X-MS-TrafficTypeDiagnostic: DM5PR12MB2358:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2358751ADEB53EDA1D432941E8359@DM5PR12MB2358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEPl0dTEvZKk31WRMgb1GAqsJ3FZ3ZJlC3+CeaCW8q/9uZe5liuzlD1ehVP4CWMagtCuFU0B1D2GkTmALpfUz46vTuwXc9SC1A2c6WE1aiQ7uMEzxG2ZvrIQSL3iRIX8RVPZTPibojNJ5FJ8EZzi0JaNHjfIfWIawKpKcw0V4RpO02yp53/LKn2Ohbm7zARl8lVVIBIwvJOWV4DyleIQxpuhg7HtQcyf4fXMQRijS3zaTfo4Fcr3+1xWdXtSVCzVJinws96OH04pYiijNg5KS1pWECaQAzdHHn0/2j8eiRzgrwEo4b//r6G6dslzAimA4z25FvlFiPaqZ7u346nxcP2SmWtVRIHjDr+UCZs4ugGRFoIkeANB5LH7eTpPy4Ah1W1JQQXOKEkYc86e3LrsglHJnAcQHWNc+LtdT15wssb/VzNkueeu4h8IB6oIoe5a4o5/QFLM/qnOAy/h6BRxm/vUdqoTAjiO7Z6q6Y+9ywdTJVeOAZek/9ozQBne4inrB8BQxzzaozGqHRaqmURPpHNywtj/ubOcfKPBeq6Lc7Idj7e1zZYYQ5sM0rjyJoJb9r3sogzYeBn4yb6sBZrhc3OTiXV1SQCHoyoVxchRsYqBnWeHZ3tJmr7d3Td2CIgeZjsEEV91yO+DHYCX9nT1pM+QZTVpq6mnuV0T8UEN9P5Gvxk7Tc4aEJAlvfekUUjCZH9qKxsGoOPUFJAJQdGR9tSFArpq438ZqBJe4HZ6f60OqnhC23MqcvX3xHwcngPTdzmyXVsRGDhO3rkWaTKBIdju2mXbE4lYqnHMTmTHC0o=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(6666004)(30864003)(7696005)(8936002)(8676002)(36860700001)(40460700003)(5660300002)(83380400001)(47076005)(82310400004)(54906003)(508600001)(4326008)(426003)(6916009)(356005)(36756003)(966005)(26005)(336012)(316002)(2616005)(81166007)(70586007)(70206006)(16526019)(186003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:33:58.6712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f3ca67-8287-46f8-0945-08d9f150fca7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2358
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

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
Changes since v4:
1. Add description of the messages in the header
2. use one set of buf[] array for both arguments and response data
3. renamed struct msg_desc_table to hsmp_msg_desc_table
4. Correct the names in MAINTAINER to first name last name basis

Changes since v3:
remove change ids
Changes since v2:
1. Updated MAINTAINERS page
2. Added message description table with num_args, response_sz and type fields.
   This will be useful for user space applications and the driver
   to validate the inputs.
3. removed the model check and added a statement in the documentation.

Changes since v1:
1. Add supported model check
   . This interface is supported only on server line of CPUs.
2. Handle Reserved messages
3. Add brief descriptions of the Messages
4. Add Carlos Bilbao's reviewed-by


 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  10 +
 arch/x86/include/asm/amd_hsmp.h               |  16 +
 arch/x86/include/uapi/asm/amd_hsmp.h          | 202 +++++++++
 drivers/platform/x86/Kconfig                  |  13 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/amd_hsmp.c               | 426 ++++++++++++++++++
 7 files changed, 670 insertions(+)
 create mode 100644 arch/x86/include/asm/amd_hsmp.h
 create mode 100644 arch/x86/include/uapi/asm/amd_hsmp.h
 create mode 100644 drivers/platform/x86/amd_hsmp.c

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index e6fce2cbd99e..e55d842380ef 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -375,6 +375,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:thomas@winischhofer.net>
 0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
                                                                      <mailto:mathieu.desnoyers@efficios.com>
+0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
+                                                                     <mailto:nchatrad@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
 ====  =====  ======================================================= ================================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index fca970a46e77..b7d95d5cc650 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -989,6 +989,16 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/amd-pmc.*
 
+AMD HSMP DRIVER
+M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
+R:	Carlos Bilbao <carlos.bilbao@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/x86/amd_hsmp.rst
+F:	arch/x86/include/asm/amd_hsmp.h
+F:	arch/x86/include/uapi/asm/amd_hsmp.h
+F:	drivers/platform/x86/amd_hsmp.c
+
 AMD POWERPLAY AND SWSMU
 M:	Evan Quan <evan.quan@amd.com>
 L:	amd-gfx@lists.freedesktop.org
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
index 000000000000..011916d7817e
--- /dev/null
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -0,0 +1,202 @@
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
+ * HSMP Messages supported
+ */
+enum hsmp_message_ids {
+	HSMP_TEST = 1,			/* 01h Increments input value by 1 */
+	HSMP_GET_SMU_VER,		/* 02h SMU FW version */
+	HSMP_GET_PROTO_VER,		/* 03h HSMP interface version */
+	HSMP_GET_SOCKET_POWER,		/* 04h average package power consumption */
+	HSMP_SET_SOCKET_POWER_LIMIT,	/* 05h Set the socket power limit */
+	HSMP_GET_SOCKET_POWER_LIMIT,	/* 06h Get current socket power limit */
+	HSMP_GET_SOCKET_POWER_LIMIT_MAX,/* 07h Get maximum socket power value */
+	HSMP_SET_BOOST_LIMIT,		/* 08h Set a core maximum frequency limit */
+	HSMP_SET_BOOST_LIMIT_SOCKET,	/* 09h Set socket maximum frequency level */
+	HSMP_GET_BOOST_LIMIT,		/* 0Ah Get current frequency limit */
+	HSMP_GET_PROC_HOT,		/* 0Bh Get PROCHOT status */
+	HSMP_SET_XGMI_LINK_WIDTH,	/* 0Ch Set max and min width of xGMI Link */
+	HSMP_SET_DF_PSTATE,		/* 0Dh Alter APEnable/Disable messages behavior */
+	HSMP_SET_AUTO_DF_PSTATE,	/* 0Eh Enable DF P-State Performance Boost algorithm */
+	HSMP_GET_FCLK_MCLK,		/* 0Fh Get FCLK and MEMCLK for current socket */
+	HSMP_GET_CCLK_THROTTLE_LIMIT,	/* 10h Get CCLK frequency limit in socket */
+	HSMP_GET_C0_PERCENT,		/* 11h Get average C0 residency in socket */
+	HSMP_SET_NBIO_DPM_LEVEL,	/* 12h Set max/min LCLK DPM Level for a given NBIO */
+					/* 13h Reserved */
+	HSMP_GET_DDR_BANDWIDTH = 0x14,	/* 14h Get theoretical maximum and current DDR Bandwidth */
+	HSMP_GET_TEMP_MONITOR,		/* 15h Get per-DIMM temperature and refresh rates */
+	HSMP_MSG_ID_MAX,
+};
+
+struct hsmp_message {
+	__u32	msg_id;			/* Message ID */
+	__u16	num_args;		/* Number of input argument words in message */
+	__u16	response_sz;		/* Number of expected output/response words */
+	__u32	buf[HSMP_MAX_MSG_LEN];	/* argument/response buffer */
+	__u16	sock_ind;		/* socket number */
+};
+
+enum hsmp_msg_type {
+	HSMP_RSVD = -1,
+	HSMP_SET  = 0,
+	HSMP_GET  = 1,
+};
+
+struct hsmp_msg_desc {
+	int num_args;
+	int response_sz;
+	enum hsmp_msg_type type;
+};
+
+/*
+ * User may use these comments as reference, please find the
+ * supported list of messages and message definition in the
+ * HSMP chapter of respective family/model PPR.
+ *
+ * Not supported messages would return -ENOMSG.
+ */
+static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
+	/* RESERVED */
+	{0, 0, HSMP_RSVD},
+
+	/*
+	 * HSMP_TEST, num_args = 1, response_sz = 1
+	 * input:  args[0] = xx
+	 * output: args[0] = xx + 1
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_SMU_VER, num_args = 0, response_sz = 1
+	 * output: args[0] = smu fw ver
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_PROTO_VER, num_args = 0, response_sz = 1
+	 * output: args[0] = proto version
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_SOCKET_POWER, num_args = 0, response_sz = 1
+	 * output: args[0] = socket power in mWatts
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_SET_SOCKET_POWER_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = power limit value in mWatts
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_GET_SOCKET_POWER_LIMIT, num_args = 0, response_sz = 1
+	 * output: args[0] = socket power limit value in mWatts
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_SOCKET_POWER_LIMIT_MAX, num_args = 0, response_sz = 1
+	 * output: args[0] = maximuam socket power limit in mWatts
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_SET_BOOST_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = apic id[31:16] + boost limit value in MHz[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_SET_BOOST_LIMIT_SOCKET, num_args = 1, response_sz = 0
+	 * input: args[0] = boost limit value in MHz
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_GET_BOOST_LIMIT, num_args = 1, response_sz = 1
+	 * input: args[0] = apic id
+	 * output: args[0] = boost limit value in MHz
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_PROC_HOT num_args = 0, response_sz = 1
+	 * output: args[0] = proc hot status
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
+	 * input: args[0] = xgmi link width
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
+	 * input: args[0] = df pstate
+	 */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
+	{0, 0, HSMP_SET},
+
+	/*
+	 * HSMP_GET_FCLK_MCLK, num_args = 0, response_sz = 2
+	 * output: args[0] = fclk in MHz, args[1] = mclk in MHz
+	 */
+	{0, 2, HSMP_GET},
+
+	/*
+	 * HSMP_GET_CCLK_THROTTLE_LIMIT, num_args = 0, response_sz = 1
+	 * output: args[0] = core clock in MHz
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_C0_PERCENT, num_args = 0, response_sz = 1
+	 * output: args[0] = average c0 residency
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_SET_NBIO_DPM_LEVEL, num_args = 1, response_sz = 0
+	 * input: args[0] = nbioid[23:16] + max dpm level[15:8] + min dpm level[7:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/* RESERVED message */
+	{0, 0, HSMP_RSVD},
+
+	/*
+	 * HSMP_GET_DDR_BANDWIDTH, num_args = 0, response_sz = 1
+	 * output: args[0] max bw[31:20] + utilised bw[19:8] + bw in percentage[7:0]
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_TEMP_MONITOR num_args = 0, response_sz = 1
+	 * output: args[0] temperature in degree celcius. [15:8] integer part +
+	 * [7:5] fractional part
+	 */
+	{0, 1, HSMP_GET},
+};
+
+/* Reset to default packing */
+#pragma pack()
+
+/* Define unique ioctl command for hsmp msgs using generic _IOWR */
+#define HSMP_BASE_IOCTL_NR	0xF8
+#define HSMP_IOCTL_CMD		_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
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
index 000000000000..15b94e1d7443
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
+	u32 index;
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
+	index = 0;
+	/* Write any message arguments */
+	while (index < msg->num_args) {
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
+				    &msg->buf[index], HSMP_WR);
+		if (ret) {
+			pr_err("Error %d writing message argument %d\n", ret, index);
+			return ret;
+		}
+		index++;
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
+	/*
+	 * SMU has responded OK. Read response data.
+	 * SMU reads the input arguments from eight 32 bit registers starting
+	 * from SMN_HSMP_MSG_DATA and writes the response data to the same
+	 * SMN_HSMP_MSG_DATA address.
+	 * We copy the response data if any, back to the buf[].
+	 */
+	index = 0;
+	while (index < msg->response_sz) {
+		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
+				    &msg->buf[index], HSMP_RD);
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
+	ret = validate_message(msg);
+	if (ret)
+		return ret;
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
+static int hsmp_test(u16 sock_ind, u32 value)
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
+	 * Test the hsmp port by performing TEST command. The test message
+	 * takes one argument and returns the value of that argument + 1.
+	 */
+	msg.msg_id	= HSMP_TEST;
+	msg.num_args	= 1;
+	msg.response_sz	= 1;
+	msg.buf[0]	= value;
+	msg.sock_ind	= sock_ind;
+
+	ret = __hsmp_send_message(nb->root, &msg);
+	if (ret)
+		return ret;
+
+	/* Check the response value */
+	if (msg.buf[0] != (value + 1)) {
+		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
+		       sock_ind, (value + 1), msg.buf[0]);
+		return -EBADE;
+	}
+
+	return ret;
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
+	ret = validate_message(&msg);
+	if (ret)
+		return ret;
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
+	ret =  hsmp_send_message(&msg);
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
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
+		pr_err("HSMP is not supported on Family:%x model:%x\n",
+		       boot_cpu_data.x86, boot_cpu_data.x86_model);
+		return ret;
+	}
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
+		ret = hsmp_test(i, 0xDEADBEEF);
+		if (ret) {
+			pr_err("HSMP is not supported on Fam:%x model:%x\n",
+			       boot_cpu_data.x86, boot_cpu_data.x86_model);
+			pr_err("Or Is HSMP disabled in BIOS ?\n");
+			return -EOPNOTSUPP;
+		}
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

