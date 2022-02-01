Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757A8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Feb 2022 13:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiBANxc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 08:53:32 -0500
Received: from mail-dm6nam12on2051.outbound.protection.outlook.com ([40.107.243.51]:33568
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237385AbiBANxb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 08:53:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ga9nokVQQ3sxBLYoWpE2aI++febuEIUxyxWyHT2uiPAWmF56TNaENgJ7GqHBgaUgswfau83H2KmjVd6/q/MBYp79K75gJ8UYYkZG3YbOOgIOFiQ5brysWnOCjRNQF+i/Oo2ff0dAVxaNNEaI+zmJZxHNRuwZjSJhStuj+Qx0ge602s8jw/WcUTXhFGLUOklkwXNFrs48FOblgihohCmyH6VGGuQvFtKaVkwtVnj/r5gEvKMaQZ6eZClsF7aYje5FFPJT26FSbSTeKnaKuHVE6HCpyZsJP9PdUtgsCJhde6fyu2dGjMGMNR7xJ362MCkTan64YNYQbtoZ/i44UYmDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ablAreqsLQdVXtAOvf24QODHZ6DkBloyKAHfv6REqcE=;
 b=dK6/R6sLB9fxb3dRU+LYOzRNF+n+zCuAVjAELTS6U9zp/2C0vXtrqCuBCrhhaod7DLYePV8AIgh+dxx9DGCBFf0qYyEAhM+CGCEvL5qQBlW5P+B/HocI1z3btejZP/8WAMgRXz/s9OMGyfDdDbue9vePKmy4+TFfIo4YqOiotjpzKHanZkXMOH9ZT/MZdEbreO3KyUZPo/dvadhvnJ81VYfxNb2A2sFwdSAkInAT6DL1gcCC+gWnppBnh6nYMfjmHaxDqs9yD3QgoySgtM0rgwDMwNO2Y0x1PjhYFHX2HuBUtb5dCyzc9zyjyV6hrgAbNVhDHNuJzoGok077UGfqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ablAreqsLQdVXtAOvf24QODHZ6DkBloyKAHfv6REqcE=;
 b=ZJrJx7qQXElqNqSD/Pw09q3ywLK93iaVIRhG5nHuC78T16678Ok0QXTcCvS2el/4+98oLd66f1Ek2mu035Y9kEjSVu5NYbi+3Bli1IAAvz8hu7nNPcxc0WOhvdKfKs34/oOvejOWMHPAR5B0Gch1yPaaacs8d4fCPXmqoLqeP40=
Received: from DM6PR11CA0050.namprd11.prod.outlook.com (2603:10b6:5:14c::27)
 by MN2PR12MB2879.namprd12.prod.outlook.com (2603:10b6:208:a9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 13:53:28 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::fc) by DM6PR11CA0050.outlook.office365.com
 (2603:10b6:5:14c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 1 Feb 2022 13:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 13:53:28 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 07:53:25 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>, <Shyam-sundar.S-k@amd.co>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 2/2] Documentation: Add x86/amd_hsmp driver
Date:   Tue, 1 Feb 2022 19:23:01 +0530
Message-ID: <20220201135301.158868-3-nchatrad@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 67278e45-d384-421a-3bbf-08d9e58a39c8
X-MS-TrafficTypeDiagnostic: MN2PR12MB2879:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2879B8FFCBE837B0C8A040AAE8269@MN2PR12MB2879.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LTphAnNZJFuEm0XmaT6vIgucMbycLEVbL0+pKqtTqjboSNhIzGOWoCNCMJbRWrCFTf1bCqAsbPjHiExQn/simHceOqLEIw+1Gw2YTZSr7+2sKxoYr82eV5HNi8L1wN+/Lr0RmCtd+c0j/Zr9xd3zJi+fOvy0DTRFmu+4fmq9n5Esa+G2atUmR79SZV54+5LLUAurxn1j+BnxdyhQiAUwuxjjxYr2sdG8ufmz3uWvbGYqdsQJkydq/4nRz0OGgK860i2d1L3X2rZwG4r0EIAM5X6WCKFzw3RqbDkU38itEy0hLklQKL7JeW+P9TkdA1v5jD4IAqemj/nQ/nI5a5S4w8hyplgjzmUaMYZ2obbFhq71HkHQMlWo4dHvTRSytren/gQiVTF/vu44b4B0T+7xVgjwVJ91zNDfIf3oPk16dz/gc3aj7i7mIh4qwRyVaz9LOFZDkQOXWVdrGr5L9zEFxv/5hjAZymKD7iAl7FcLzNBKDcigdYRqPand8g8vqfrlMepii5o/igr0nP9y2JxHsIA2yZL9vWqefsQwlLzL+VHoJGuS+fU80D2Lz4HaztCZTpVRkmDOuk3lfHekmRz0MaTXECVtSYMpRQgUkPNiu1ysyFhffB1tsQWgm8H3sg3nf0HOf3VNwJTRMODOZqttBbwzwu4ZGDDkibfYSmQnDzrxHMetR/1KSs1wtJv7GdMWH4tOcEKFSSa3fGYkr117rYOgnfEurX/DoL6ql3gLJDlolRvdbfRRr5PRlS+ROO3ouqlC4pVID2a+njdYme3ZNIEgkq6naX7t11NWEgwapT9yCKSeyJ9oxYJN7j2a9DCLFimVpIpC6rnMHv80oELK3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(186003)(36860700001)(7696005)(26005)(1076003)(2616005)(2906002)(5660300002)(336012)(47076005)(83380400001)(426003)(82310400004)(356005)(16526019)(40460700003)(966005)(70206006)(54906003)(508600001)(6666004)(70586007)(6916009)(4326008)(8676002)(81166007)(36756003)(316002)(8936002)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 13:53:28.6369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67278e45-d384-421a-3bbf-08d9e58a39c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2879
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This documentation for amd_hsmp driver explains how to use the
device interface.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 Documentation/x86/amd_hsmp.rst | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/x86/amd_hsmp.rst

diff --git a/Documentation/x86/amd_hsmp.rst b/Documentation/x86/amd_hsmp.rst
new file mode 100644
index 000000000000..b77b888f810a
--- /dev/null
+++ b/Documentation/x86/amd_hsmp.rst
@@ -0,0 +1,93 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+AMD HSMP interface
+============================================
+
+Newer Fam19h EPYC server line of processors from AMD support system
+management functionality via HSMP (Host System Management Port).
+
+The Host System Management Port (HSMP) is an interface to provide
+OS-level software with access to system management functions via a
+set of mailbox registers.
+
+More details on the interface can be found in chapter
+"7 Host System Management Port (HSMP)" of the following PPR
+https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
+
+
+HSMP device
+============================================
+
+amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
+/dev/hsmp to let user space programs run hsmp mailbox commands.
+
+$ ls -al /dev/hsmp
+crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
+
+Characteristics of the dev node:
+ * Write mode is used for running set/configure commands
+ * Read mode is used for running get/status monitor commands
+
+Access restrictions:
+ * Only root user is allowed to open the file in write mode.
+ * The file can be opened in read mode by all the users.
+
+In-kernel integration:
+ * Other subsystems in the kernel can use the exported transport
+   function hsmp_send_message().
+ * Locking across callers is taken care by the driver.
+
+Features support by the interface include monitor and/or control of
+a. boostlimit
+b. current power, power limit, max power limit
+c. c0 residency
+d. prochot status
+e. clocks (fclk, mclk and cclk)
+f. ddr bandwidth, utilization
+g. data fabric P-state
+
+
+An example
+==========
+
+To access hsmp device from a C program.
+First, you need to include the headers::
+
+  #include <linux/amd_hsmp.h>
+Which defines the supported messages/message IDs.
+
+Next thing, open the device file, as follows::
+
+  int file;
+
+  file = open("/dev/hsmp", O_RDWR);
+  if (file < 0) {
+    /* ERROR HANDLING; you can check errno to see what went wrong */
+    exit(1);
+  }
+
+The following IOCTL is defined:
+
+``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
+  The argument is a pointer to a::
+
+    struct hsmp_message {
+	__u32	msg_id;				/* Message ID */
+	__u16	num_args;			/* Number of arguments in message */
+	__u16	response_sz;			/* Number of expected response words */
+	__u32	args[HSMP_MAX_MSG_LEN];		/* Argument(s) */
+	__u32	response[HSMP_MAX_MSG_LEN];	/* Response word(s) */
+	__u16	sock_ind;			/* socket number */
+    };
+
+The ioctl would return a non-zero on failure; you can read errno to see
+what happened. The transaction returns 0 on success.
+
+More details on the interface can be found in chapter
+"7 Host System Management Port (HSMP)" of the following PPR
+https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
+
+User space C-APIs are made available by linking against the esmi library,
+which is provided by the E-SMS project https://developer.amd.com/e-sms/.
+See: https://github.com/amd/esmi_ib_library
-- 
2.17.1

