Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873F9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Feb 2022 13:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbiBPNeS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 08:34:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbiBPNeS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 08:34:18 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3166B258633
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 05:34:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDzSOCkF/8T0561pmBbGjQCYOgDkJPaoMRbHLqCTMkLGK9Vw7Op2tEsbbQinl3dLZ6Op3SV/k7i05UrIX7qjFly2j7X2UgNpA7jzmnBMecoM+qBaa7FG15ZOPi5lzxG22LsYwffmvfxm9ISuZHXVoh5ZyrYtPQecrXBph+2XQCHZJRQHJUehlHrMCMElVXvM/9xMfSbXw2hcg1+13vgu31xxO/M/3EazAuKhrMCQsVZ0XDovoExRzYBYCjVkSqYSrJ9vmuvvpWos1wXAtxzYZ5XlptKrRUD2pdtIrfn+2rtYhEXQkpfC1Tm+MyPRFEWzxPA/JgFwqYup9a3HDItzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay1o1RZQdiFqywg/btUXMs8EPYTVLTpJJGh8ToX6zeI=;
 b=DZDelVz3or4b6829nYRYvgD2A0Aw568huCpckBTd+1lAgm4TRUJoU6C0ciW7ssmJ9QMyvqEhS8c/oYx7Y4xEg2tsybO1WO13rPWNERM7n56nyw3631ZO4vP4Q5gFoSfYinBjxqOARl2mvtj7pa6w42+nWaV6gmzWcQGPgO5TqOdVPohiHqodfiF1wVRBvsYjI0H5NZ62azeOIqlg0yLlZoKREihwOmtZopdP7Hz7PCSouSfDNZW5Tuh6i9L5yATrY5TpGT0Oyk+lcQUMg3vwouo1gA4XLPnRQ2QBQoi7D4RrUtSHFp8kiQ2VmYKcdik13110Q8PyOcGjjofS4Y1WLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay1o1RZQdiFqywg/btUXMs8EPYTVLTpJJGh8ToX6zeI=;
 b=3Q9m54ABBlxmJAHgZ617hO6GBX1V/jeAWZzXLKVnfeKKOOa/t2N2MTpnusLVteaM6gbUs134QgvBdHqfkNoo7O1VWgVClkp5VBFpdVKFteSyLmyDyMsqcQcRVqmRSsXL/1ic2pZKuqaq7hmhynZF3KyUxI2cuZ6W6z9cR/5IuF0=
Received: from DM6PR02CA0168.namprd02.prod.outlook.com (2603:10b6:5:332::35)
 by PH0PR12MB5647.namprd12.prod.outlook.com (2603:10b6:510:144::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Wed, 16 Feb
 2022 13:34:03 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::ce) by DM6PR02CA0168.outlook.office365.com
 (2603:10b6:5:332::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 13:34:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 13:34:03 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 07:34:00 -0600
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <carlos.bilbao@amd.com>,
        <siva.sathappan@amd.com>, <nathan.fontenot@amd.com>,
        <song@kernel.org>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 2/2] Documentation: Add x86/amd_hsmp driver
Date:   Wed, 16 Feb 2022 19:03:36 +0530
Message-ID: <20220216133336.108810-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216133336.108810-1-nchatrad@amd.com>
References: <20220216133336.108810-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 642f17f7-00e5-4a05-c4c0-08d9f150ff62
X-MS-TrafficTypeDiagnostic: PH0PR12MB5647:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB564714453D62981F4738736BE8359@PH0PR12MB5647.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZYa9F3QVGwxppjwo3Kss7WFaCINHGAAm5MB/KkCbEubUQ9DG0+e/9/XOuKMIIEabHx2KkktaeBQFek/sO1a6rSsMxsvKhaooNhfYvGsvNiLshRBLyNIVCuYSrr1oCJJ7o7il0kvV22F1i3oA+s43JaU/wHC2SZCdT0Tcm05DE6zwLOZsYaeJpJKo8tdXWXzo8ftx3dIb6h1fV4PnWilGEeBStOkqB5s2hNyt7m31b1qz08CCdPl8rrfVPoiCQnb8bZDcQSPq4TEGN0UWG8PzjIIneyu8zHaUA+RlKgcGFejBxrUeNkNoAKI0H6ZyN3Vy33QM2pq/r0G1wFfmbecpQbiNZzXRaelEwCQQodAm4NWMjPFsLF67+71gMyWPobZvm/Vm4TUcwbLBeU4sUpPymhp5mYmLrrxpDNLZNFd3CBPdvn2150npGrlDGOa6ehJpmsuohB1yZQ6y7WOe7lEC3/JurIrqlcim4com/F5665kl9pKDnCUHk6ijIYHYoTKV3zIbXyKdS8a73b9SRKZcvM2UU4Sg9VHzzWaFM5ZD9MbIUNwBkSSleOilv7umaghHmxrvqM5Lw9CVzUpKE7mwCVXqNOyLs268C5O+8/JOQ+l3Pqf2KD8pckrn6cfVg5qDZIaT/ozZErns/pyX3p8a7CWsZ8/gcqnKVNg5KndwpCbQeEEkec+tN6PciRac3Kacpg9UPW49RXL3uv2++8F2zAdbc2gfikBA2J+rASiCa36vHHT3g2M0pPasf0jSzhx3uZU8JNFo+hgLZtx9PMRyIi5APPn+U9wARdMsPFXouMb1kshcMiaReuwRgS4beLIdut9zp128Ss8lfLhpRh7Eg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(36860700001)(5660300002)(82310400004)(16526019)(83380400001)(7696005)(6666004)(47076005)(508600001)(54906003)(4326008)(70586007)(966005)(356005)(1076003)(316002)(26005)(81166007)(426003)(186003)(70206006)(336012)(36756003)(8676002)(6916009)(40460700003)(8936002)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:34:03.2882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 642f17f7-00e5-4a05-c4c0-08d9f150ff62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This documentation for amd_hsmp driver explains how to use the
device interface.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
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
index 000000000000..1956d1093070
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
+	__u32	buf[HSMP_MAX_MSG_LEN];		/* argument/response buffer */
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

