Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1CEC11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4A2161DC1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhF2Iuy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:50:54 -0400
Received: from mail-mw2nam12on2042.outbound.protection.outlook.com ([40.107.244.42]:42464
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232487AbhF2Iuy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:50:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6RvryF1AHgpHYW7Z+gt1sAPj8TCd7DuqaOxQxJ82WG1Oobh7VW2S8qO/F2SqDuxaPcLl+ExD6ZjD8Zmc8x76Pd+1R8ScK5LpskM67yQTHDPy1F9lZaUxu+lR6SQl3bxidmKRqtTBCUTvz9mJanGYscwe25v/1ri76PBbkiw1s8TmIe3ymgKCK0lmqKBf7ShXD2iV/sbDlzcR1CFV/dLnp/oEk2AHbLCthARBp+T5AmPvI7sODhe3mWZ6TM2JsoTSa4uorFtPoLae84z5+yaIcs1KqOknnleweabKW57w7bjYZ8aKAqPNvujW4GU9MWmnv4s5t9Eq/y3qJbig6mEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNXYP/ijzWaOzLZATDyOQvTKlkdXJnsb3AbfLE/OH2I=;
 b=etuJ4QAK79tLxyCTPP61Gr11e8lPbUpz9/FZ79h2Kl8kOwbm21csWmJCnASTkTsRYx3SSP6Rck3n0TWNcCIS/W8/4C2GNg0tDz6SONvRoVD6RFH3pwAHCRGjsQ24g1wksO4Yg8CkrB94NPsRhaX1x7nvjwlefHY3t+8QXMuC6Ma8KbvMr95QMzUabX8Ls8P3MSJWUGajNrLHMam0wC57wZS/KH+aXA2DX2ykXddqflBzH28O4Vh42SAK/n3mSV40/w0A+wQ9i0SVij/NandGX2x07XEoxNQDuIXCiqf+KdNYhZ8wEtVfi8jQzgrfHqM0NyWeqy3BqimmC4tb3KvuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNXYP/ijzWaOzLZATDyOQvTKlkdXJnsb3AbfLE/OH2I=;
 b=w78NyWl8Q2z8Y/XIN3EeVRjYvmMzrmUuLP8wXmkfINFZyoNl7XlxtrkW8CHgbg9TX1bhmF9RgKOblNC9WD3OaclRmMHpsGtJNSXBfH8jC2b7tb7APeOECB1lXyHHt1SQsQ+tDRCEf5AdwnHBlHcxEFVj6X/VKyqugrS2NlD4MhY=
Received: from MW4PR03CA0017.namprd03.prod.outlook.com (2603:10b6:303:8f::22)
 by BN8PR12MB2963.namprd12.prod.outlook.com (2603:10b6:408:61::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 08:48:26 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::12) by MW4PR03CA0017.outlook.office365.com
 (2603:10b6:303:8f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:23 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 1/7] platform/x86: amd-pmc: Fix command completion code
Date:   Tue, 29 Jun 2021 14:17:57 +0530
Message-ID: <20210629084803.248498-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a52e8c5-971c-48eb-df79-08d93adaa8b7
X-MS-TrafficTypeDiagnostic: BN8PR12MB2963:
X-Microsoft-Antispam-PRVS: <BN8PR12MB29637EE6EA6224B4B2D967109A029@BN8PR12MB2963.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3w1jpuyRD+3oISqur0Fdh/DdabHwEjrhCqC/0eGjRhK6KFuPyT48E4bLDoDuaqhGL/2ziEgcrsA3CbnTZpvLrZSRwA8+5mvyw6CiQTAa5/UzPqfYwd/UpZ7SC3JpBovd4VC+5/BkyTjmY3sKdUrDlNhF5exFzYQZwmOHHAOnGkEozWQa0c/vn2jktVnYgu5YQa+4Kf7BFmYYtOvlPWbKyQJgdEWXZn2cBAiOjllTk4o7cZ0N1Lsd2DVdWmRPpxI+T/MYGQjWJyj9o8Y66KRN4DQuN3pFA2Pswtz3mQEj9nwNy+FLoLwsMGaCX5cst+ZrUctLgyz41xmbgfTjj5x0atAAH+aTWq5P0SKd9PMHGxT3ESKo/DsXVLprWxegikiCxYSYb5J2M7G0t5+HsgQ+hoj+27b9yvGP/MgRxZXt6ivlog3igfQJksXit3BQw1ooQybwW+k0cgNQuriPNdzflfXaGhVsTCRWy1yiFiKcca+hWAQmWCwLfCTxmQ8DA9J1QMtcZxeSKDz0pdTKaU4nrl9eul950EtGzmqFNtFvflFCE7Y+bRSa/PZ++kEpUb37GiogyFF3a2Gd58zR3FUzbZEHYXEzmhrLQZpt9AYziEZdKXui+c5q7OGRq8SpgtTUDfqqRdRl3QS7PAKgojMdEiM2MhCKkg01rpuukiAw8NMckDGV3flhaxCYbQxr73peXQXFUNrPFm0zHym6Y7TlpxlV/JTSrRVMBBqL+Rlv3U=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(336012)(316002)(110136005)(36756003)(2616005)(54906003)(4326008)(8676002)(1076003)(478600001)(82310400003)(5660300002)(86362001)(426003)(36860700001)(6666004)(186003)(82740400003)(2906002)(47076005)(26005)(8936002)(16526019)(83380400001)(70206006)(81166007)(356005)(7696005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:25.5840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a52e8c5-971c-48eb-df79-08d93adaa8b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2963
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The protocol to submit a job request to SMU is to wait for
AMD_PMC_REGISTER_RESPONSE to return 1,meaning SMU is ready to take
requests. PMC driver has to make sure that the response code is always
AMD_PMC_RESULT_OK before making any command submissions.

When we submit a message to SMU, we have to wait until it processes
the request. Adding a read_poll_timeout() check as this was missing in
the existing code.

Also, add a mutex to protect amd_pmc_send_cmd() calls to SMU.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Acked-by: Raul E Rangel <rrangel@chromium.org>
---
v2: no change
v3:
 - use mutex to protect multiple calls to SMU
 - add a switch-case to handle smu responses.
v4:
 - Handle different error codes based on smu responses.
v5:
 - Remove redundant rc assignment as pointed by Raul

 drivers/platform/x86/amd-pmc.c | 38 ++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b9da58ee9b1e..1b5f149932c1 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -68,6 +68,7 @@ struct amd_pmc_dev {
 	u32 base_addr;
 	u32 cpu_id;
 	struct device *dev;
+	struct mutex lock; /* generic mutex lock */
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
 #endif /* CONFIG_DEBUG_FS */
@@ -138,9 +139,10 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 	u8 msg;
 	u32 val;
 
+	mutex_lock(&dev->lock);
 	/* Wait until we get a valid response */
 	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
-				val, val > 0, PMC_MSG_DELAY_MIN_US,
+				val, val != 0, PMC_MSG_DELAY_MIN_US,
 				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
 		dev_err(dev->dev, "failed to talk to SMU\n");
@@ -156,7 +158,37 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 	/* Write message ID to message ID register */
 	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
-	return 0;
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
+				val, val != 0, PMC_MSG_DELAY_MIN_US,
+				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "SMU response timed out\n");
+		goto out_unlock;
+	}
+
+	switch (val) {
+	case AMD_PMC_RESULT_OK:
+		break;
+	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
+		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
+		rc = -EBUSY;
+		goto out_unlock;
+	case AMD_PMC_RESULT_CMD_UNKNOWN:
+		dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
+		rc = -EINVAL;
+		goto out_unlock;
+	case AMD_PMC_RESULT_CMD_REJECT_PREREQ:
+	case AMD_PMC_RESULT_FAILED:
+	default:
+		dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
+		rc = -EIO;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&dev->lock);
+	return rc;
 }
 
 static int __maybe_unused amd_pmc_suspend(struct device *dev)
@@ -259,6 +291,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	amd_pmc_dump_registers(dev);
 
+	mutex_init(&dev->lock);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
@@ -269,6 +302,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
 
 	amd_pmc_dbgfs_unregister(dev);
+	mutex_destroy(&dev->lock);
 	return 0;
 }
 
-- 
2.25.1

