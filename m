Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BF3C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBAF861C6A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhF1LHl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:07:41 -0400
Received: from mail-dm3nam07on2067.outbound.protection.outlook.com ([40.107.95.67]:37984
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232617AbhF1LHk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:07:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cytsJ8/ImXf1z402vPpPNR3SR8DdQHwGn0I6anv/YLpVXTznSD2fcoKexaT8hXeATaXLnoIT/w14mzmBuTErRvZmAi16h+vcTK5Kot9y9UzlYYszvaPsrMptydtY24FURCgj6fw9ZxERjLhjfZvHkBpPZbSkGFdo5+35SiQit+2O3Rs3CITdZR36eM1vOZotUxHnxS7CM1tixTTuRy4F+AaJTsNi+ky9X4mSDzQM43E+DdrxtAlq5kS6H9XiWlOW3dcx/R1lGPAbAikYp1CRnAQcz9xePE8S+gSBKnlrvKe4hQO8SroWWjjlrhBK00qT21CV4+rnb0TLXRmhvJEK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V1gh7JGfvJSlWnRjWDnekfsj0U2QLVRE7dqXqZ+zbA=;
 b=gZoxwj3HX5s8LI6SrmaPORMUn0jU+HkfsSbkiz64j69j9w3GmYQs9QYIeiOXSzhuulKeVacs7cQSTZczUkB54EC9CPK+O+ajKRrVfA/WK+rA2ORX56CV0eE+QF81hJtMlc06SsOJioMH2AqeE2gknp8mirL1xW467WboQHOTnr0uf7wbyjTuy8Si4GxZypq7lPt8D0aV69GMmqfRI35naaFj/mvUitKHwc9DmDhuWxKY+swPLset1G0E8cIT3BWfdEKSmNpZ/gdNCrS5t67muMtEwhz/HtNzGSH7aZ0YRGw6JVCNQYA9ecNaozYvXlj6HQamIREKQE1AmWGtZPVEFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V1gh7JGfvJSlWnRjWDnekfsj0U2QLVRE7dqXqZ+zbA=;
 b=DwBmqRjCU54Bg496JzLG8Xlj/b+bXpJ/xtkN13q7oemMbE6J1d+98zA9u7gcngWiuvQ9ec0ayQtSK0vOFH6UztO4LASMRc5F69Y+XABx1lcWcYz4eRVMveOzMhQbtNnlteWNw1INFmYtewqKBXhn2G9YHxR561FzGxKsMQQuUK8=
Received: from MW4PR03CA0204.namprd03.prod.outlook.com (2603:10b6:303:b8::29)
 by DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 11:05:12 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::51) by MW4PR03CA0204.outlook.office365.com
 (2603:10b6:303:b8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:10 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/7] platform/x86: amd-pmc: Fix command completion code
Date:   Mon, 28 Jun 2021 16:34:45 +0530
Message-ID: <20210628110451.4047142-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
References: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fb1e456-071f-4fbc-54f2-08d93a2499e5
X-MS-TrafficTypeDiagnostic: DM6PR12MB5565:
X-Microsoft-Antispam-PRVS: <DM6PR12MB5565A7010064060C39C6F1E69A039@DM6PR12MB5565.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G73AQfi0/fTjWxwckS8GvVCddQk9eJltDIkA3cWl1jxnJQFSDxKojfvA7NEQxqtt1DB/zJxt8VeVKeOfBEJkuqx+EGtUa0EGU6IExVONwD271yPddZWaRWiG3l0SHVBLxdOt26tFmcQQRdILsSeXdbR3y8LWGBohjY3uvXku5IPGhs3mnhN1GlikO8p7iZUjlom8O1sBlUSKVFJsDO62aeMxbnH4dojcknvO6fnxXl7LVwCed1u/Ty5M2gy2l6/Nph85rXGmpTejGQoB5Pdc+g6y8Yecox3SeXsS+GPIO9Wx1Mg4IxZW3s2qZnwd/X97+MYi+sF51AOliyfcCbwFp3ZGaeBiVuz+p/NVSWByhju2aJ6j03bnFTarvcidCxgSGvRH1b4GChpsjHFi1iv00GxsCIqt3u+gmrJsXJbf6lMu6cmaQOu91FdMqPDOZPo2rZtB9/oDC1Fwe4kmXprhSbCzYpPMdHy/afy/4yIgFTdfa560IAtUNe2uIWaHsw9+VXkxB85ndVEgsR3xwLR7DV1q0pOnn0cy+S3bSAaQx7OL1mx/w5Dh/CeYBcC0Xtdgv/0eqjSgOzsAWUyNnOdqIJrZT4LbkHgVI4ng2CBxm1CeTR7QVCY6bKhibhDeXFM8QZg7yZn6R2C8+1EYr+C8oMqxcoXLEJY0dcsAjyaODi6bmi5+6umDasAJ2teKEKcOnHw8v6fSLe3qL0FL3vo0681j9ZPrwDosJ4DDmbv36zk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(47076005)(54906003)(16526019)(478600001)(4326008)(186003)(36860700001)(316002)(7696005)(83380400001)(1076003)(36756003)(110136005)(86362001)(26005)(82310400003)(82740400003)(426003)(336012)(2906002)(8676002)(8936002)(6666004)(70206006)(70586007)(2616005)(5660300002)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:12.3193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb1e456-071f-4fbc-54f2-08d93a2499e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5565
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
---
v2: no change
v3:
 - use mutex to protect multiple calls to SMU
 - add a switch-case to handle smu responses.

 drivers/platform/x86/amd-pmc.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b9da58ee9b1e..f3f5f754f75c 100644
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
@@ -156,7 +158,28 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 	/* Write message ID to message ID register */
 	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
-	return 0;
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
+				val, val != 0, PMC_MSG_DELAY_MIN_US,
+				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc)
+		dev_err(dev->dev, "SMU response timed out\n");
+
+	switch (val) {
+	case AMD_PMC_RESULT_OK:
+		break;
+	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
+	case AMD_PMC_RESULT_CMD_REJECT_PREREQ:
+	case AMD_PMC_RESULT_CMD_UNKNOWN:
+	case AMD_PMC_RESULT_FAILED:
+		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
+		rc = -EBUSY;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&dev->lock);
+	return rc;
 }
 
 static int __maybe_unused amd_pmc_suspend(struct device *dev)
@@ -259,6 +282,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	amd_pmc_dump_registers(dev);
 
+	mutex_init(&dev->lock);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
@@ -269,6 +293,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
 
 	amd_pmc_dbgfs_unregister(dev);
+	mutex_destroy(&dev->lock);
 	return 0;
 }
 
-- 
2.25.1

