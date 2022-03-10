Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76955C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 15:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243506AbiCJPP6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235394AbiCJPPk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 10:15:40 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E6EA1463
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 07:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9LBUP6ljdB5spllzs9yPz1453lJrNLcknpUjSFNBeVhgP0Zhep0ng8hoDooGVK2VveObEeT5fxj/Mgt7jL+hZVeTxCmNFdupa0esIfyubp/bibruQb1jzRMNQvCqo+X21q8vHxT7gJyBuFPuj7GGSgEZBglEryf73u4SYpz6fAiI1Ic52eeDOt5AkDGkQVRfSQXa4xy7WwrCcW9kcbaZbvKJv65LmMw/7QyifYIwiKgeex46lwWed2koKzd35CX5SL17QBbnTn6sYm0owCwNyC+rYk2W9MD5AYrFKq7Op76Tl6F4kRtTPs1mTOupuJlPB+VImbsNjpxJcbALSguhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4PrvGe+Mujn6p9bdXDqiDC/zlJ/+JZjKAEjCyHt7M0=;
 b=I+YcbliqC46YW6v7dSawVUjIt4lZBIswairzX3xNGlWWVZDZMnDNCbhNp2/JTvZC/oiGZEdvgHm8XrKDqDo8ChV+6Igq5j8vLt4HFi8z23WAlu70g2AJCg7eklT2yCaQVJFhUarTM8q1FRiVoaZ1xon7VaLAimWFKUn2uPJDNG4TEJlDqsN3+kHW4IIZMr33WdpoE0Ws6wGJDs1ZXBadDRKg8lbg+sRHk4mHeS7wp2uLDq/z5222nvIHIPaiPfMyNymMdRL2nTfWUd9Z8ozzQ27tiXKesWLS0nL7iDccEGfnu5AcCQWGslW7YmDppWHNX2/BDjaJ7fdkRhsQPgtNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4PrvGe+Mujn6p9bdXDqiDC/zlJ/+JZjKAEjCyHt7M0=;
 b=SG0Z7qelZYCHHw7BPHZokt61TLLF6+Bu4DM3fXf0rX4O5/JO2vxKyDyGbCTya+z3eHIa0+b2zHc0/RAoZH8OL2AzCJ0ATYF6nNZ5DxxH3mwZ5BsSAF56aWNh414eMIxaJGJLYhB9z5Q6FtgpPRGi9L1nI/RQXN/0JKehOLVAunY=
Received: from DM6PR03CA0016.namprd03.prod.outlook.com (2603:10b6:5:40::29) by
 BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22; Thu, 10 Mar 2022 15:14:28 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::78) by DM6PR03CA0016.outlook.office365.com
 (2603:10b6:5:40::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Thu, 10 Mar 2022 15:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 15:14:28 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 10 Mar
 2022 09:14:25 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2] platform/x86: amd-pmc: Validate entry into the deepest state on resume
Date:   Thu, 10 Mar 2022 09:09:20 -0600
Message-ID: <20220310150920.560583-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2092c712-2f1e-44b2-89fb-08da02a8abb3
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2578050EDFF435CCDF4AF4F5E20B9@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hjqE0NfVZJEOwOK1A169OlZxap5f6sKiGIMdYinUtRG5RuDh4/rBeZzkT3sWSHDDp/JHRgc3sswXZT+dUb4KXt5k9WmAoB6TMcPfyq2rmbmRp6E7QdSCjICSCLAI8X5KB2jGZLI1YQoPNkz8Kd0hilzYYQTbXnrXRjDNUBUZIS4Rttu7R3BAyIOVlF7FNeru7J610YFjRQTK923vWRKZ0hdMx13gCiwIphlFt1WcV3twqNCYsSftKmweSVSx7yt/hx7Rokk4+si/Hhz1xRWR1vvu8jnjUZQ88axsneCg1BtFqjtbTI3P3H77VaQASZY/KxgASQYl0k4q5dbFzEM6rEtzRU/juFGOZ4rVMAVOd8QxC7SrGcxF2iqaUJHPBgmFLDYYTI94kyb+b9EU5Q2PJXyEoEUZsn+AeFwkQN/PcAFq+2B8yylNcaC6L37dltNchD5Q7RaXCd2UqYB/YYqg3gZpD2sZY7hEPTMYA+sQZVRgSWK5vORI7OV/d8Z+w47rAUItZSEoHeezlqhCUEZf2/tNfPUFJA/HrMvU0fPrxDrRWw+s53xRMsU3kjD1ZW1NqlEZ+wHMBNqU/yvMX4YIR8osY53K+/608lD3XJjX3HNVFVl9BxwH83haiKOl/mcvezzc5wM8g1YySrarmEDkHruv7UcHDFkE/zNOqGsOD0c4To7SY32iXlWv7S3wpZa15aVX5ni86QaFLMbtxMgcPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(16526019)(186003)(2616005)(36860700001)(70586007)(36756003)(4326008)(426003)(8936002)(86362001)(70206006)(8676002)(26005)(336012)(316002)(110136005)(54906003)(5660300002)(40460700003)(82310400004)(83380400001)(508600001)(1076003)(84970400001)(2906002)(15650500001)(6666004)(356005)(44832011)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:14:28.3684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2092c712-2f1e-44b2-89fb-08da02a8abb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the only way to discover if a system went into the deepest sleep
state is to read from sysfs after you finished suspend.

To better illustrate to users that problems have occurred, check as part
of resume and display a warning.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
changes from v1->v2
 * rebase on platform-x86.git/review-hans
 drivers/platform/x86/amd-pmc.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index fc0b4d628dec..971aaabaa9c8 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -322,6 +322,28 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 	return 0;
 }
 
+static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
+{
+	if (pdev->cpu_id == AMD_CPU_ID_PCO)
+		return -ENODEV;
+	memcpy_fromio(table, pdev->smu_virt_addr, sizeof(struct smu_metrics));
+	return 0;
+}
+
+static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
+{
+	struct smu_metrics table;
+
+	if (get_metrics_table(pdev, &table))
+		return;
+
+	if (!table.s0i3_last_entry_status)
+		dev_warn(pdev->dev, "Last suspend didn't reach deepest state\n");
+	else
+		dev_dbg(pdev->dev, "Last suspend in deepest state for %lluus\n",
+			 table.timein_s0i3_lastcapture);
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
@@ -329,11 +351,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 	struct smu_metrics table;
 	int idx;
 
-	if (dev->cpu_id == AMD_CPU_ID_PCO)
+	if (get_metrics_table(dev, &table))
 		return -EINVAL;
 
-	memcpy_fromio(&table, dev->smu_virt_addr, sizeof(struct smu_metrics));
-
 	seq_puts(s, "\n=== SMU Statistics ===\n");
 	seq_printf(s, "Table Version: %d\n", table.table_version);
 	seq_printf(s, "Hint Count: %d\n", table.hint_count);
@@ -689,6 +709,9 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
 						PM_QOS_DEFAULT_VALUE);
 
+	/* Notify on failed entry */
+	amd_pmc_validate_deepest(pdev);
+
 	return rc;
 }
 
-- 
2.34.1

