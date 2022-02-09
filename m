Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A463C4167D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Feb 2022 18:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbiBISli (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Feb 2022 13:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240532AbiBISlR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Feb 2022 13:41:17 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2047.outbound.protection.outlook.com [40.107.212.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EE0C050CC2
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 10:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vf804ngwRFVf6eEDC10Sz2rNamzrAx/59c7AXd1DasHU00/1dV37xASC1b/D9ap/yRBRKR82iM7vvCUZFUAYuzsZTmQnw8mXW1Vevbq8HAFf8QYD/c2SnNTCws9fT9x5ok+SLRJQFQJJn45TQbmIh6nnDHIUYBBaCZGynG5QPZABJxNCfOKApzz7Ha4vXF+fuW3J4qQgC3nFW/DZSfN23zFzbfdiQ1O6/sXcTt6pr31jxmCU7+mHKjFa4NjwCkKuctApuqqmE2RwpKpqph1Anp852JIUkzcIY4bwPc7U22A6VXZOTdBvdFxUrfOk+veEdafaF/OCZ2P37jT/8OvzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLqOuv6Y89oBZrCQ5fliOjOAiom6+kd5h/CjqHUN8HE=;
 b=k0zyhTchHXaWdONBbDTW80uuFg5tUHFaFiIUiqfzKXmQz8Id4aKGzKJ3lJJvAGTHA4NcTeZHLrYo8erYsHSNg/YLTdANYjH184/dZWyBYpcPy5/D2pMxcQBNsRk5tHQrn/gFJmK7anMDVKreHzL9MbIoL0v0z6X1ALZ+oINjSLK0r4cpvrF5sr+E2AXS93hljba883MgAymHLm+KGJYXByhumEn76SV9/oERghir1z9BwAQP5MfH5u2yy6Z0nY9CQ4E3WA5hv7NJ99jZqi+tsJlexGEh/kcYB6WO0raprQfXuniSCW0qS+TVcefvdhe2UmMGplPwSrT3XqPrd5nAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLqOuv6Y89oBZrCQ5fliOjOAiom6+kd5h/CjqHUN8HE=;
 b=1pYq0Cili0d5JRfIArtdSHagk71wbBNzmqi0yCc0kVkvnzD5IZ65/og53UOiVnG6SdoMM7fRTi8f2Ght8Br/aGPj4MioEsgGaWpjDMiwm4mz8wod/DYk9C2igEWJQmPQA4g/D06pBOVH7XAsGCMauwVU5EYuVn0rOI0CIQ/sA9Y=
Received: from MW4PR02CA0022.namprd02.prod.outlook.com (2603:10b6:303:16d::15)
 by CH0PR12MB5201.namprd12.prod.outlook.com (2603:10b6:610:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 18:40:52 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::fc) by MW4PR02CA0022.outlook.office365.com
 (2603:10b6:303:16d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 18:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 18:40:51 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 12:40:49 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 2/2] Documentation: Add x86/amd_hsmp driver
Date:   Thu, 10 Feb 2022 00:10:09 +0530
Message-ID: <20220209184009.99237-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209184009.99237-1-nchatrad@amd.com>
References: <20220209184009.99237-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e7e6764-8e38-4adf-eb96-08d9ebfbb2f3
X-MS-TrafficTypeDiagnostic: CH0PR12MB5201:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB520186037C74AFA2A4143C34E82E9@CH0PR12MB5201.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUUUY99BT8s4+eIXdwR2AIGu+Zoy1ZVcWR1hgalWsKKx4OLGqYlJHbPB1pU53GrbnmdEV6rai1H0kW1hLb4NOj+Byi9ELgTpxkMYyu2IfLXqTyCFjvzgDwf4M9pzPkLPmDsyzXyM5x9XV6OJcr+HEtNI0wbPo5WdWJYDNZvQ/iu5gwXuN7oOb10u2eVdwnUXM+Nrx02LOpuFASfytIYZhfxtmbgRKCkX8KrCbW6JnbjJjJ+uzGIh4b5z5w/XCQa9/zYhKeV//2NoYQLUyGF1XZDPYIv3p1HHXNB0BOa8jBk5Yjn1WooIimZVmc6q76JupRQAFVXIF+Xth0tySK1ls1hbOSTo+Kca8SLS7HB8kPZohvgp2xIDhNf3xNgKSnTYUe2/jKc1SWLyITNlzFJ7O+DeSOgcNSnnklKQZMqJSFfCKuj+m0crCH8InJ8cmDvbM9ifiMMTBS0cd3AHwbrOO8m54x0WHmY+Ar5p3MJm1UFutbR32adxG1Ud8ADl8d03rcU1rddO+3UEYn++z9/VW1cmJpf2PKiMZ1lvpJX2+mxDanQpFjR9524Ge7DJyk5lcyRpxN5dEe/7gXADPMj5kigFzVID8pbh6PzGCtzgfcbvD5ba7INyrggoaVfrSFS73CilDqKdEmlrhWZVwEd1YAJfYw9lrPbpskESQ0xskuNgxr9wL8ekIaiFVxHR1Bo+FI6Dt+J7EXHqPyy3nnCUjBJWCxI4bfjmJ9ZrMfWwmgQYNrZfi5Z4CrETmH7eF5bcdlTnnKWpAfz11XiNV4Dh0zwUkspOkpAiY0Z0YeaPs94pZZIPvdb4C6WIuWTaz2EnvTmnNA8ISQTGkQ7TiNSo1Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(356005)(47076005)(36860700001)(83380400001)(508600001)(966005)(336012)(2906002)(81166007)(36756003)(426003)(2616005)(6666004)(5660300002)(16526019)(186003)(8936002)(54906003)(6916009)(26005)(316002)(70206006)(40460700003)(70586007)(4326008)(8676002)(7696005)(82310400004)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:40:51.9409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7e6764-8e38-4adf-eb96-08d9ebfbb2f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5201
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This documentation for amd_hsmp driver explains how to use the
device interface.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Change-Id: Id8c9c758b0fd676f42db90ea27a7c468d7ebd030
---
Changes since v2:
Add statement saying the HSMP interface is supported only on server cpu models from AMD.

Changes since v1:
None
 Documentation/x86/amd_hsmp.rst | 86 ++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/x86/amd_hsmp.rst

diff --git a/Documentation/x86/amd_hsmp.rst b/Documentation/x86/amd_hsmp.rst
new file mode 100644
index 000000000000..5dc2619ec3f0
--- /dev/null
+++ b/Documentation/x86/amd_hsmp.rst
@@ -0,0 +1,86 @@
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
+HSMP interface is supported on AMD EPYC server CPU models only.
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

