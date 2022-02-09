Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D31FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Feb 2022 18:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240796AbiBISsF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Feb 2022 13:48:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240903AbiBISrd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Feb 2022 13:47:33 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE17C094C97
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 10:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbKbyrI3Hc8UfyVFALecsyWd5gwhYEFRglruEH/UsuOH0xTCID+xqm/gCLooeuUnM5k0vZK4oHNmi01av4yJJDVnMl/56hPrnP1xaZBirAe+cdMDgCO2Hy7D+Tika5ZW5c7IkKP4RqPSDli4dzDbAGoUZ8AmDLNM5hIld4jGRM9u+MlN3CGfxcY5EXVcyIi1kq9thYeCMNbNwRdhAYvZYf31NuhTAlnm1dWfdyB7oeR3iaK53IbwBrG69DmUiH3x23JCGgBiVGw4Gv/P3hymCUG++FAPlILJ7kR3iv4qVz7QYxUuSAMg8SGPXMJpCjs9sH5ecDLtHiOlJ8NPKS7zAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM6hro7KMlUmsxtsz4wWKJakV0yVBhyBRFAsMnwPJ3A=;
 b=eYUn4v3jy8dbJXnGoDRRIEasxaMRZvNeOAORQXejnkGk5Ym2vmdRwhK3x5sigfguaUnixoL/3fgZJ7D/R9tAmufk6H+0SH3eRQDIW2ehHPIg3W4ZgmYSfBOypeDBWr1L7hbsR4aVsXijpEAemb2mBaSFgsZKiudqJvUGDOaIlzoMTdkUuaSczcPwX2dLRsaQkHNYQbquN8AY24FywrvOPcLCA4rVVsuksLEgKDtaECj9wJEQHWmpujxjeJ8IqsWspqEthhRymoWj9PpSUo+lIJ/rJdRR2ovR6LBgQxDeYM0U5xCtDKDxN23XkUkCgKK+ShiQlWyUtdTtmIRsVUd22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM6hro7KMlUmsxtsz4wWKJakV0yVBhyBRFAsMnwPJ3A=;
 b=bO0hTwkRrCuQLREdb5TZK/7Nz40Qcb/sQo6OyQyDiTQIaxzhnYtSToy/uKq8znMrGcJN5h5AGCJxkx27moKwvTi9qok1RxFXNiutTeUZDi8uMvzq7YRJZciPe5uXb1Yvzyy6mWEC0Bo7MD25IEv8SC7cM1sRKr5CAG3jnfIeHos=
Received: from DM6PR06CA0081.namprd06.prod.outlook.com (2603:10b6:5:336::14)
 by CH2PR12MB3974.namprd12.prod.outlook.com (2603:10b6:610:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 18:44:34 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::22) by DM6PR06CA0081.outlook.office365.com
 (2603:10b6:5:336::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 18:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 18:44:34 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 12:44:31 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>, <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 2/2] Documentation: Add x86/amd_hsmp driver
Date:   Thu, 10 Feb 2022 00:14:06 +0530
Message-ID: <20220209184406.99938-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209184406.99938-1-nchatrad@amd.com>
References: <20220209184406.99938-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0dbfab8-3ae5-4382-9594-08d9ebfc3798
X-MS-TrafficTypeDiagnostic: CH2PR12MB3974:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB397448D32CD4B7B38B9B39DEE82E9@CH2PR12MB3974.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifJHKvAqVRJHJbEPFyakvhd/WdDO3ewIqMb/6au7ml+60NlGmHKA2G34uYt3yd3V6AvlTOhJyWCViN7f0XcFaXF+RrlG+Hw1/M1oEvjQl89rABduq+hJ/5FcPaMGIZFzXh/eSCqKcftkW0W6llW2jv8JvrNi62ZVerMbEOiXkvLUng/2Qns8YfWdthdXyNvhotD6SuCI5+REzMtIKf6JH0cXpYmxXRCNf+HMC8O+7HojN79nE3ftJBH+64e3uXqg9KFhJvR7aVLlZ1kEutT/kmXzK/Uv84aFU/Nl/R0cj/oxkcdogQ8vydbfyT+zfzYlTJ+J8EyVO/VYG/5YVHOpB3wfi0aW8p7mGXGrLejpKTEYnlohgdraDLTa/zSXFNLyVHcYhbzTaGhbdBdgff0f1ZDVvTu7OX8CGiCY94i6Ed0KfCDGPXghfa7NRwsH89UNPKdN9LNq/m+fBDCo05UAMlxB+iT95J60cWtuG6u3OZZ3S4ZptCnC2BrXqbjb6iuZCwSpaYlSEG0G3wT2ZcU2d9wz/hSCslhfnaZg2GICTRQyRQw7xnM3NdsyYCx0kyxsqxGowtXeAFN5lYNu0cT4h1l8FcXcx1TcaIp5gT31yjdIhZhX3ZViAOhP4o8Wbwn8k1whuTBsxXQ5BHT9iJgF68ONbgM8FxAWMUQPLVMNpmPDiIW9S3dwhz1qD2+dkJhy7vYxYYN9ePkEbgA/yBLazSMC8gigXlUBDDPlB5suMNrFp/wI9FwiCHVQUy33spLUDuRRlHx16cHNrLWfNlUBb7sNRC24Ma+FBCzrq9fS+L8Z0faVYJJUiS/NK6XyNL7rSf0zroMtYF9UsG58pYb3VA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(54906003)(70206006)(82310400004)(70586007)(16526019)(356005)(81166007)(2616005)(316002)(6916009)(4326008)(8676002)(5660300002)(36756003)(7696005)(966005)(26005)(6666004)(47076005)(336012)(508600001)(36860700001)(8936002)(40460700003)(426003)(83380400001)(1076003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:44:34.5418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0dbfab8-3ae5-4382-9594-08d9ebfc3798
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3974
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This documentation for amd_hsmp driver explains how to use the
device interface.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v3:
 remove change ids
Changes since v2:
 Add statement saying the HSMP interface is supported only on
 server cpu models from AMD.
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

