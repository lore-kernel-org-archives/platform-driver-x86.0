Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F515C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 10:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239110AbiBQKWN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 05:22:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239099AbiBQKWM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 05:22:12 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F400920181
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 02:21:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsQNkn2o2gIpb/gm2liwE/KR4IZFUEA3R/Xg0dOPhOO/wtWuLJIQ4RTnaXKj1g8XgI/ObJLjLXXeusK0z+zITthSXe7nFTb5iWnyNia4YYIgKOCWGr9hYzBNsFOr78Tq/mmG3jbq8qURmreq8gdGAFYm8kZs0k6u2wLnH6sHFwAWgJenJrFljuLX4TH38KYbM6o/IkCEdkr71MqsZ2L88WnPCPq0uM/mCUYvYxcaHfxC9up+C31F4g4vZlwN1Ac43iSIRUa8HL/gNclyxeuLTIQ0lqcX1RgIzk5EBsjt8jD+m2Cr4uYfyZJCF+BWpFkWR0SlpvtfXNBnt8Kr4XHtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoDeVBvD3gFnyWzlNl0B8IA/IzPuBTDTVKUMfp5oO4s=;
 b=IT4Frwn9JJK11ozzLfW/KxmDj6nxo+L25qkux3+emg0MNwWSAvoglPAAqWskuioYsP2P0LioatcXXNUPmYTL68BfaCAJR4sYkbwY+UJ+wpK7P9H4P8bhC06kPu9YVYAfdOvnMrSduegj9e9/yIL/fnFUsCFMFlqd7YsP7PD1v5z0WBsNBVmcDr1zh1rPJd9w7t7AjREx+cE6cNJ5MPMIgMjogoG+U60LpKS3eHRdC3hmkhDHx6FGbKWZpF/JaHKs5Qy2+TOF0CEkCSu1QBwzx/B3BtxdgpGw6uyIc0Jcg4zPkkYfZytfR5QIMpi32EUKUswWUwSPDXRjphqmB65ZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoDeVBvD3gFnyWzlNl0B8IA/IzPuBTDTVKUMfp5oO4s=;
 b=LLs5VEUaWokVcWidpMrlx00ZcmNzqYT44FRXrPnROaKNaAE1KBtVGA91YGmhNr3+uE9JZJkPCtCA53DwReYozC0y2QH+uqsPDIJrGO7+Ji0i+M7uDBiBHvvEoprZtsjrr44jMhKWHAPlwRP4pFg/VHIvOQbJuMkdCs0nUruVSzk=
Received: from DM5PR07CA0122.namprd07.prod.outlook.com (2603:10b6:3:13e::12)
 by BY5PR12MB3745.namprd12.prod.outlook.com (2603:10b6:a03:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 10:21:53 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13e:cafe::d8) by DM5PR07CA0122.outlook.office365.com
 (2603:10b6:3:13e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Thu, 17 Feb 2022 10:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Thu, 17 Feb 2022 10:21:52 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 04:21:45 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>
CC:     <carlos.bilbao@amd.com>, <siva.sathappan@amd.com>,
        <nathan.fontenot@amd.com>, <song@kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v6 2/2] Documentation: Add x86/amd_hsmp driver
Date:   Thu, 17 Feb 2022 15:50:41 +0530
Message-ID: <20220217102041.30088-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217102041.30088-1-nchatrad@amd.com>
References: <20220217102041.30088-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451d8552-ba91-4781-e3db-08d9f1ff512c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3745:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB37453AD229723E6A53EC2F9AE8369@BY5PR12MB3745.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a5c34l0yhnAupApQVFTC3mv7GM+hI9WuF2gS75KLyNXwQytO9LAyMUE5hTgIb97mgOuOY/+jt46WIO5Ibn0zJ/ym0+xaN07jsdwx3W8/QGyo8FS8ybv07Q/4Fb9aIIA5YI3/9ncQY6Zs79uZrOl3OhtwlHM/UZLNak8BFL/VtbB+zXrMCKvyH7hXRidglQllAiRGyRuiGrXLFEOqBkkw3RbI9JZv8kS6b+FSlgkG/I6dfdW8SKzW8CMxamHdvbrduCfoFDNStwhDsUnm5HrFh/T6q+U+L4ngtOFOctDtmJkDJBqAFTvmEB2Iegvyj17GIrcMre70w9pfuhl/j9J55J4RpGzFmQBbNgCRfah9wqw9su43sVV2CzEzG492cUnMga3tHYMFvD/J/6bzQ+EuZHIqK5zkLuYAP7X4owscMp6M+C83BpAuiTYf+OO8TSI5JRPLTebZcYrlBklmgTh7ewFsKuPIt4SXdVOm0MF2M0Zga+90uL+JsAZhyu5LOLiyRsnTRkn44iCdwj+NQKaEPm85m6tEYSa6WjN0xho+UKxxz1W1nyzuM+to3L5TmVkeqHe1NDh4KvlPmWP/DKfAftDB9OBIOlGmm0vrD+zneQ8X8ADURZMOIFm0zZgnyJ8qydHhNpDbHzro1hEg3J6fNo844YfLo1FqzUmRnilAuA+FO3QttOTB6LPOHFWLRYYyNw45hqdhKAwOnmuu7es8ANmNylNyLM02dZc6aLUol7xX/5YxB8WPLrDrFeVY+ON0wL9JgU4SdLP/Dvdnw+szKA3cvXKd3E9LUrQradJflgS2Uix17yTOlN5kJB0LWN22YIP7WClP9C+Ig/FFtWd2jw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(4326008)(426003)(356005)(82310400004)(110136005)(40460700003)(2616005)(8676002)(81166007)(2906002)(54906003)(6666004)(508600001)(36860700001)(7696005)(8936002)(336012)(36756003)(966005)(316002)(83380400001)(186003)(26005)(16526019)(47076005)(70206006)(70586007)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 10:21:52.9393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 451d8552-ba91-4781-e3db-08d9f1ff512c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3745
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This documentation for amd_hsmp driver explains how to use the
device interface.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
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

