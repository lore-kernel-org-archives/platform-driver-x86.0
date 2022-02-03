Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17D6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 12:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236431AbiBCMFV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 07:05:21 -0500
Received: from mail-bn8nam11on2084.outbound.protection.outlook.com ([40.107.236.84]:64000
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235558AbiBCMFU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 07:05:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpTt4hymxCV3ju5SiRk7P2/GnxV7wfmjZBkWMFpRaUoVG0yKhsXqwk8T412HBAlIgxIrpPnAuk0tNE63KovT/LYiWr/k15PzcCfhMZFwYKeVpzLVU6MagmxeDqfdGa8z78vyoKOCsC0jsZuphbMyyf+8Mxu643eEf8vjaC1Q2410KHtIrIbHO7+OxPAwODrCxW0Dvo93+NzsTIKaeS4prsxV8qA5IRY0P0Z8hsVqTLAgchZwjFQc3oPZiCG0GlhiMs3A/m0My8MBwNTenVSNn3XYEQnclNaic0GtocTNvmA9QRUbruyyEM6GBUhVLdD6cMdk8ZfWOiBorGjSeDOg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f9M5Vy2a2bGmv2gCUCDKtvdM00oVV7ktEElM3VuSP0=;
 b=AHHGmbNtV7hl3hukSJZmJZhnHxbAIN3DOSENo44bKiOyPiADdv9HRduR1kRO3bkZO60fvCI6tIULz5QsaeRLf7T1tmORLckE0mgTl4+LR2XzJBRXi6fyvMw7TuU/gFPbTqzC6fR3ExaS8FZ7kNSWX++ma2qzlks+B2gWgbRExR8T6g1k9w09sUtGWJocJN3BRAIFMzHL1TFQemMQM2LVFWW11XnTySrhP/fqNptiAjdSiNayg0g8CWdYi+IsziwHoGNd5Uk9YPf9rfFl+E5PZm+0+fhUYSfdbEb8nxPKnJBXK4dTM8Yn62py39mHZ6bMeznw2hh6Gtt2iTWxTVxJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f9M5Vy2a2bGmv2gCUCDKtvdM00oVV7ktEElM3VuSP0=;
 b=HR3i0nWvrgfV9em0oT8FQKnZ3Mj83QEoJ/4h9p0Uf1grus48PNU7H0WmtLifKxcYJOF5q6eHn30/c4pnszvUtzqwHcLrM/bbB7BVr6aEU69jQqQUAx48c9AVrFBlw6ppSrgEe1YNXpXjWIBklJpYHlqNFVaF+BCh5t94OkUDHfU=
Received: from DM6PR02CA0090.namprd02.prod.outlook.com (2603:10b6:5:1f4::31)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 12:05:15 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::46) by DM6PR02CA0090.outlook.office365.com
 (2603:10b6:5:1f4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14 via Frontend
 Transport; Thu, 3 Feb 2022 12:05:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 12:05:14 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 06:05:10 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <Siva.Sathappan@amd.com>,
        <carlos.bilbao@amd.com>, <Nathan.Fontenot@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 2/2] Documentation: Add x86/amd_hsmp driver
Date:   Thu, 3 Feb 2022 17:34:50 +0530
Message-ID: <20220203120450.199598-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203120450.199598-1-nchatrad@amd.com>
References: <20220203120450.199598-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47ed42bb-a8a3-401f-6dfe-08d9e70d6fe1
X-MS-TrafficTypeDiagnostic: BY5PR12MB4050:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4050E7CF7A1FDDBCA54B26C6E8289@BY5PR12MB4050.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEOrVHMB88bZuukrJHQ1FsjYEDPnDZ3Bf5akGzf21m1TC4Cg3+5/Z80EiVBSnjxxUbRzOF6g6dlgZsT6DzzpBowKp7Go0nP+3ectN1moLI7I6r+GJgSz9epirrL2y7gpwJfXJRuxEbr8qXgzng/4bE3zEWBOELgi1BLJpoy/tsrO/iIxamo4Y87jqYlyD9RQZb25z5osB3Yy/wApX0r27iYEY+t+oEWPZFzYCkre0F/3SKaMn8wpu9qXmj0/Qg9ynCpmduuwOFHtjhb8xiU8c0dtOZTOUgdMi+4M0hxU443sbqSZ4kQrB1SmGO43W8OY+jIjcwLIgCcoow+X+XtT62tZfM32V4TVCggue1DdgQaeXCy701Dc6izhSrAWrT5mHlr0q/wooQmCecELFUpDz6e2JvRnAYNrCjmdebvIWHCQmjFwNKNyb7WO8ajPs2H+hAVHLE/WB0YTRLYaca5rwMn0hViK1XrMGJCXcAxeRVnjrK/Z2W4lgqapuDObOC2tbH0oMWUxoPdQ8ywZZUX/M/c/TlB1dapGuEqHbJbotr1B9C+jCNAXmWezBNrVxyzT4cvEQB0//AZxqen0ygrn5e7xzKav8Fu7KmX/ijTsmvqvF0rLiiYvCEBugZVC6/wSGoOKjciMiUVsRSrABPZla8aEqkE06BA9fsaBDHjGsKh3VnHd7lOc2vOaaxb2qfLdynaUV4eVMWE3eydUC4xstDrt1qCl8UxIPjkEr+LV48vK5jn4/mn02db+asPgQtQCh63R8GkkCbmpAuShGjHiSVELswZCnPBwv5VaJ4e0KxI52rF46Si3YAo8szm+4hn8UPBtJ/8953uX2Rm7HsNN4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(8936002)(4326008)(1076003)(26005)(70586007)(2616005)(2906002)(8676002)(966005)(36860700001)(336012)(6666004)(16526019)(426003)(7696005)(186003)(82310400004)(54906003)(6916009)(316002)(356005)(36756003)(508600001)(81166007)(40460700003)(47076005)(5660300002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 12:05:14.6177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ed42bb-a8a3-401f-6dfe-08d9e70d6fe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This documentation for amd_hsmp driver explains how to use the
device interface.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
None

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

