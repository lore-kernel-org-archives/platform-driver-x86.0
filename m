Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ECAEE14D8
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Sep 2023 14:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346692AbjIJOVI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Sep 2023 10:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIJOVI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Sep 2023 10:21:08 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61ADCCC
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Sep 2023 07:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsPJSrPNtzVVNi+UoopqmdTykj2DCWssjapDfghJUjZg4Y+EAUCdtxUjbrfoJ7cwcytjHyAaexRJlnBnf4tvFh+ybe6z3YIIfbRMakiB8Sys94Fb/InEEzKATErik7KSMK4aY9QUZBYmjVz+ljf7LEdgSFJ9ulbrrYZiajkvpVhN2PYzO/nqbRl0BN4gBIMGxRxX/vIPfSXlBPGjFK2NmFajotQWh/k5C3TIhTs6yQVM4tKWqCMkscP6VaQPYg653NB/2BdDjjt0Nak0MLY0orJ2wjYCMPAMyOQ9T6hz/+02XWGuSbG1lFUa2HLhHCi+CnSjDdF6KuidR6Aq8BvsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs0pAIPzefkyEULOlCSB072wnU5ZQlGFzBkcoAS1fIY=;
 b=PzPXp8L9L0o9QXx+VWCsXV76WVvqGTwpoyOSF2hL2KBpl3vCsGx6jNwnL19LQN/XVhkZ/mJCy7GMfV6Fvn7UCeV48rueM9OrGM1aWpNggPzfuDKdGPQGpkKw8LqIXqk+dbDebhee5fNkbC0kmWKilWd0qryHUFKIWVo3BJOE55xfvBTOxyMhG6oxVrRibJetwAgquSXNuFkI6P5sR6JEW3mX4SN7Gd1ReDoDBvMZ4cpQ+CovqfPi1/VyU51k8lQGO1rZLNQSlJDY3fvzRzVDHdbhmpUOs6uPMXAUfYNki92tLV61hSaUVFYGKXinJuB+H+c/mgZI8axfayLvew9T5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs0pAIPzefkyEULOlCSB072wnU5ZQlGFzBkcoAS1fIY=;
 b=w8XNTRdFdvh7qB9nIaY3MliN8gN5VW/QFb+b6fLLZTBdryb9KcKNURVm9n6eNfrjBQI1kib6TRe7DG1rII3n3oG6HAbN5Rr8d9JzHrc1GGKawjRJ7czCJURWqvZQPzWH70pcPFE2t8gSyQF3k9OI6ozu5ogb1+1ED2Zyp/53eo4=
Received: from MN2PR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:c0::25)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Sun, 10 Sep
 2023 14:21:00 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::fa) by MN2PR05CA0012.outlook.office365.com
 (2603:10b6:208:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.15 via Frontend
 Transport; Sun, 10 Sep 2023 14:20:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sun, 10 Sep 2023 14:20:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 10 Sep
 2023 09:20:57 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 1/2] platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
Date:   Sun, 10 Sep 2023 19:50:33 +0530
Message-ID: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 5457d9b8-05fa-49c9-e6c6-08dbb20927f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0lo/e4zGuf+3Jc/Ki+NzCguQAAOUetyvVWrfxWv+SauaKqLlnHRwwvaj71RLkmP9bROCHn0uTOY/0YOd3c5hc6qw37zo5ZnW5w9WvLkVQonhYsLVPC7zjGlxcEq7VG0F8c/qJey7sihYClAGpFUctBE2wcgGpiNMnLk055vpoQueRz7TMgljo/Hk1idE+RowwlK/pynbiErH9lkMbvCYXx8QooXQcyFjFCcjSI9pSeOSc4K6pzJAfyvp2IfTCAtwGyK47YMFzsyMjZNXzPZYwDDzBz651ixK5/SX5k7qcACJdNe4WMluRIAyH4/U0KhNKxeWqZZSxKWLCINXhWylIBcJ6+LwSFrlRFIYz2//CfuXcpHLE70iVLTG9Z7fmkUVFXjFJnLoVkioskhtUOCvuvZPV50+zMOLdvp/snVJSW3EdiEECcAOQo1DcUfvqVgKwpY9FHHXWQWWEtXhH1TEdH0hb5/9SqWvoASdhrCCPxV3r1g5DguqzpnoEVyNS1t/J9YaVP8Hw/lctbT5U3FiYErw4lNs85EDFGx7sfVYJXP7S/Zu1ZM3J9zlhg39kXqdmzU2hTT4yiFB47JhyhTeazmM2lM3KCZKHwmx6DeTuf5Rg26qBvZtMd2AF7wAGBrRhX2ajkgRsFO5kNjHW+Xl+AQ2I+paPI94uHg9/X2lE/C63LAJ6O0u6ifsQjlPeU4A1McsN3LYiIaefjWL0be47ntUpVyIdtOdLoE66Z5DlIfZ0sy0wseFB8ySAox2sevA
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(36840700001)(46966006)(40460700003)(316002)(2616005)(83380400001)(426003)(16526019)(336012)(70586007)(36860700001)(47076005)(54906003)(70206006)(26005)(1076003)(41300700001)(4326008)(8936002)(5660300002)(8676002)(110136005)(2906002)(7696005)(478600001)(6666004)(40480700001)(356005)(82740400003)(86362001)(36756003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2023 14:20:59.7817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5457d9b8-05fa-49c9-e6c6-08dbb20927f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFW have the capability that can force flush the FIFO
contents to DRAM on sending a command id via the mailbox. Add this support
to the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3->v4:
 - No change

v2->v3:
 - use dbg instead of warn
 - print return value of the new PMFW cmd in case of failure.

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c1e788b67a74..443bb78ea5f4 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -55,6 +55,9 @@
 #define S2D_TELEMETRY_BYTES_MAX		0x100000
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
+/* STB Spill to DRAM Message Definition */
+#define STB_FORCE_FLUSH_DATA		0xCF
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_MAPPING_SIZE		0x01000
 #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
@@ -236,7 +239,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
+	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
@@ -251,6 +254,10 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	/* Spill to DRAM num_samples uses separate SMU message port */
 	dev->msg_port = 1;
 
+	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
+	if (ret)
+		dev_dbg_once(dev->dev, "S2D force flush not supported :%d\n", ret);
+
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-- 
2.25.1

