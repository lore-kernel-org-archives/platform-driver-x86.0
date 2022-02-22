Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58ACC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 05:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiBVFTV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 00:19:21 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiBVFTU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 00:19:20 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB8DEDF33
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 21:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hopygvpi8P+u+DBvWi7lIMxSsxxWHeMunLSAtuGnT20pstZkS9WEHdJnEH0MMCKste3aDCjnjOxfC+zTsqLS5rDld4pPtf0rGKECg7+X2MMtgddJqzgysrHhz2fipEYXhVzUwTYLCnuqQMjoaQItkQ7W28MYuxbpOUhJ7cJ9aDSe/HiqOf2xBYkSnTMSGKFMLejOWSVXncQHtYbefgOl53u7FHmJnZYTGhL2bFrVYzgkyJ01MKWmAP0gjdyOpBIJ+aEp88wpmx6o2/IsAwWD29zCdsW47aiHi4zw2hJiJYjbGZjj+boUJeMNfgCU0c7ZDvaUu0jRqRFRs8G7mQYZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mf8ywKiFNZqASKEUK+R67ar5KBtmHEJFEpGYBLEUnGs=;
 b=boRJwiqli7tYES50uHaRZ3tg/4Byx+PTUg8iXPy8ajnHAaqSgVxmm6eHopVJZfIwMd4zF9ZUKl0gMA/A8YhxF153CO9esuaqFBHSqXWVF6Wgg23zdR+iPAlpItKpwcQm12o4K6OQivswiVZD2hkQLNTXN9dLAMguj+TdNHJUFzsGCE/kyR+vuJZouEPhNMFuK5MwLm2AeXWQ7QZfj578fPa9XU9sXtfADbOkROzFy0djfsBOBh0N7Nasg7RpMcoJkLhF1fwzQP9cPpustOj1lLOvcnnFF6Rg/PZe2tf/prk3cIdq1fk5HUucUOsL46ZorCTsX8YqIYR29wE8aMbPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf8ywKiFNZqASKEUK+R67ar5KBtmHEJFEpGYBLEUnGs=;
 b=QTdZBKtI+GuGM2xbh5yEgeHfOjjEbn7blVAUOgmyJTXk/89oIDWOrpkKitU/P3l1ng8HjHJ9jiwQPxQDOoU0XbZIVJIhxdztEjkEJNw7I8T+vxl6x0i9ASVJDXUWva23a0Slol4lPUIUnhUpqFVUUg9izqSI90Qx/PDZHH051lI=
Received: from CO2PR05CA0093.namprd05.prod.outlook.com (2603:10b6:104:1::19)
 by BN9PR12MB5100.namprd12.prod.outlook.com (2603:10b6:408:119::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 05:05:25 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::89) by CO2PR05CA0093.outlook.office365.com
 (2603:10b6:104:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 22 Feb 2022 05:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 05:05:24 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 23:05:21 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>
CC:     <carlos.bilbao@amd.com>, <siva.sathappan@amd.com>,
        <song@kernel.org>, <nathan.fontenot@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v7 2/2] Documentation: Add x86/amd_hsmp driver
Date:   Tue, 22 Feb 2022 10:35:01 +0530
Message-ID: <20220222050501.18789-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220222050501.18789-1-nchatrad@amd.com>
References: <20220222050501.18789-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e9d911-4422-48d3-9db1-08d9f5c0ef2a
X-MS-TrafficTypeDiagnostic: BN9PR12MB5100:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5100550E346FD985A4E4D917E83B9@BN9PR12MB5100.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VcgtYQ1w1h64X3kaPH84+czjG3T39N34T+i4JO1/rPd4hsP1JsB/f4at3C47N7TyaqzHT8aWxreeevVcnAU1hBWyagv3AmKSqi9GBOpiIc+H7/ZD1+2PFFjN0m/nAY70Go7rnJB2dINHD/VPV/5FkUU78tgH3LLVNQV3c1Zdp7RPAJzPQH8KpJ7LW1vVAxxn1/ASuHq16w+RxdOPOksvQLFfJ7uI2Vzck+g+5BGgq3YRjiANJmKeXfWsETPHIXeksrT5w6Up2IZEzxzDhvT2bWVA6PiadaWOQzW7wcTT6Y2QE95qBKEjmdamvecD+BX4xDZQOclS5ydh3qbiKCXYUuNT5XO5f8fiPf8wFY5wSehSfL2cVJRIIdefcpTUQRcqyio9mNNNAQo3re3/6AIOvwXfvkREOzpsVZjqhkwkdLC1CdQloQElAUDUi4Ucq648RYiWoPyWWNAVPCutB/2rd6kZEEF3qiRSOvr5FuUxbNFmqaPF7P7cymIguU3a/eTC2groJhgXmeSD4wMIymPMVCRjXvu9x4rKrp0Q2sodluO99r5T+rTQnpN3TgRUNTzx4rZ+Somea7yedn5tmFkEoLoxX9TTUlERL5IRvjwPvhPhKDb/QP7GeU+bihVDJVIbTYM5j/I8jJmusj2VDeNu3chX9AhstbeNMqVaVdncX8C7y9PdbEsbsHcxCGSIH7s1TWBb71nR6TdgTyFDeaXHZG7ntiYUEmY1WwqRvCZR4a8pjHCN9Lw0CPs045uotxTeDq0wqD70KIANiJUdTYhVCljt9QuSpFPcDwoWQfq2Z/rSRGP9K2QfZ6kOWqoikVSdPRo9sbccisnKCUb+SALicw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(82310400004)(426003)(336012)(83380400001)(966005)(110136005)(70206006)(70586007)(8676002)(54906003)(508600001)(316002)(1076003)(8936002)(5660300002)(2616005)(36756003)(2906002)(81166007)(6666004)(356005)(7696005)(40460700003)(186003)(26005)(16526019)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 05:05:24.2834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e9d911-4422-48d3-9db1-08d9f5c0ef2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5100
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This documentation for amd_hsmp driver explains how to use the
device interface.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
Changes since v6:
Add acked by from Song Liu
Changes since v5:
 variable name changed from buf to args
Changes since v4:
struct hsmp_message is updated
Changes since v3:
 remove change ids
Changes since v2:
 Add statement saying the HSMP interface is supported only on
 server cpu models from AMD.
Changes since v1:
 None

 Documentation/x86/amd_hsmp.rst | 85 ++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/x86/amd_hsmp.rst

diff --git a/Documentation/x86/amd_hsmp.rst b/Documentation/x86/amd_hsmp.rst
new file mode 100644
index 000000000000..9de7e028d6e3
--- /dev/null
+++ b/Documentation/x86/amd_hsmp.rst
@@ -0,0 +1,85 @@
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
+"7 Host System Management Port (HSMP)" of the family/model PPR
+Eg: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
+
+HSMP interface is supported on EPYC server CPU models only.
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
+struct hsmp_message {
+	__u32	msg_id;				/* Message ID */
+	__u16	num_args;			/* Number of input argument words in message */
+	__u16	response_sz;			/* Number of expected output/response words */
+	__u32	args[HSMP_MAX_MSG_LEN];		/* argument/response buffer */
+	__u16	sock_ind;			/* socket number */
+};
+
+The ioctl would return a non-zero on failure; you can read errno to see
+what happened. The transaction returns 0 on success.
+
+More details on the interface and message definitions can be found in chapter
+"7 Host System Management Port (HSMP)" of the respective family/model PPR
+eg: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
+
+User space C-APIs are made available by linking against the esmi library,
+which is provided by the E-SMS project https://developer.amd.com/e-sms/.
+See: https://github.com/amd/esmi_ib_library
-- 
2.17.1

