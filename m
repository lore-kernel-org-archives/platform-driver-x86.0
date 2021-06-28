Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFC8C11F65
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DB5F6195B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbhF1SHA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:07:00 -0400
Received: from mail-mw2nam12on2055.outbound.protection.outlook.com ([40.107.244.55]:50593
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233028AbhF1SG7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:06:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ntn1M7nk8NGATrVHfsDucZGAqf8V7iIy2hJCIBdN4cGp3J7VRiOE9YlQME7ZOTgRsdhlEgvgFweeo+e3UrFzmjPMTh0BOR9yBpAMDHfVO7fctcLI8nnq4ZtC+ojcTiCVTKa+lBVPZ8iMNgLYM6h8UiqUGs0j5RjN0+rURICM8GsEzOp3/keHvIeX/QkpzvwfoH7aYv7+hleAk2hNTf2olrQxgLcKtGBETQcHuaXm4mwQtou8+zDlOmAnqGDH2vDN/WJSlddlaMOYE6nSmolIUO7bmksHXl2ucEXhDBI9uo0qyRJK240U3/gwiyqMR4FqaWqohSQuzSmBqhURXrJyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N11/ewu/k56Nfz+V+P+NmPtb2ZfvZ5MbbsxU1gc2Kv8=;
 b=VsiR8tqQLJ/tYdjyL1Dz5qH3l2QIW72PWKsL9AShEwXXpTTwpz1EjryowRqOgX4kAdcdNQldX4KSRsXMxOozt8sX6R6rFyKRZTSa6C4Qlx494PLuSKl9v1vBx1axC//bg/p5yD14+Hyq4j9ndfftvIzTukPvozOyTTSzmk4X0n0EPvbvMhjRY+IBJNiMU6NPtKGROtI13wtZgMDyJ0qkQiLyErs8cxW59Amlb0I520jQs4d1Fv4wGRoJ0eyv++Aaxh1uoDUE1jqnNd2qPUIbQpCEDLxm410iYJQyaouq5CZ8GG+fI3J4vOKtZE0LC948sM5zA2H8BlMaJ9IlbtvRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N11/ewu/k56Nfz+V+P+NmPtb2ZfvZ5MbbsxU1gc2Kv8=;
 b=kQIpuX1aWtJK461jTVbTTgx+5PnB5N8WVgfWsBMB8F3NwYOL8dppjeQ+wH+BTQXMliyGvzzC6C30M6JiyndIRdQKMoRiNYi838oM8Tb0TFsBxPNzOSzTTzoXzwHxWpgUty+K6M8BmuFprXkfFrPAqttHEWcGGVHq+TALL2rPPUA=
Received: from MW4PR04CA0317.namprd04.prod.outlook.com (2603:10b6:303:82::22)
 by MWHPR1201MB0093.namprd12.prod.outlook.com (2603:10b6:301:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 18:04:27 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::7b) by MW4PR04CA0317.outlook.office365.com
 (2603:10b6:303:82::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 18:04:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 18:04:27 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 13:04:25 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 1/7] platform/x86: amd-pmc: Fix command completion code
Date:   Mon, 28 Jun 2021 23:33:57 +0530
Message-ID: <20210628180403.236553-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
References: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6149303-029a-4cb1-d606-08d93a5f2bad
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0093:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0093F91C1B73563E99CD83439A039@MWHPR1201MB0093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cjs8q9G+Sts+cvFwq/IaiVjMQArq2lxRPNk/8H1KnkNKQ7M27c2TbMZJ00Px/Sxciv2NMOu3LAQ+J2B8US7WcZVxcaOof6Yvv4I4H35osEE9O/nSV2DBu2MYMtaVt2Ls6aFl9uXFf1++Jh1fkQ++DGpmm487ZHjEjcaUPcOFMw3JhX5EmcnefITZnasgwKmcTUE/izLMifcudDStxWiHoZakHiM45daqKMm2v0Ai4Nqp2LmAEuFhcOwwj6q7mzNL/WtLwBzlcc9+s8ivk8BGlQsxOV9WzSsCw+rLnca5wDjDkzLvDycaCmIhAOCFuKqikFVpls5CnjlUAPjs+wuLTnJiEwNdk9IQYvOrP7rOHcQ2wpfroNj/WjgF3RqKmw9LQQgpBuTZT5CDCD5oOwxSuH6RfwtMqZv/sNwx3vjHZYHSZUzwPXXcDn2NGqnUcyRXS2cjBLw22CB+o8iX3i22R52MTC0GW22QgICv3lVTlnjudHEzqzWn567KUps5sJW42xrL0GG1VVf+6KVWpttfnKYIz2Xc9kCbU8e97Fg2vusWy8pEAqRiOdLmONrdrni9z5HZ2sHVej15lU+v9nhDe3fhEhKMc9RRrd9jpz9DltCv7Vf2eEqe9kPFSlm0Wzn7E9JyQPapb64v0UvdkldxVuclBC72pN0dNqNgYhA1BS/SosMFTdAFSJxPBEQ2ShQbIS5vbqRDyDou9H1tawkll6mEH0nqIZENC12mtId2mz4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(46966006)(4326008)(8936002)(186003)(16526019)(47076005)(356005)(81166007)(86362001)(6666004)(8676002)(36860700001)(110136005)(54906003)(2616005)(1076003)(7696005)(82310400003)(82740400003)(316002)(83380400001)(26005)(478600001)(70206006)(426003)(36756003)(70586007)(336012)(2906002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 18:04:27.7103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6149303-029a-4cb1-d606-08d93a5f2bad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0093
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
v4:
 - Handle different error codes based on smu responses.

 drivers/platform/x86/amd-pmc.c | 39 ++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b9da58ee9b1e..e3262ed967d9 100644
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
@@ -156,7 +158,38 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
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
+		rc = -ETIMEDOUT;
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
@@ -259,6 +292,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	amd_pmc_dump_registers(dev);
 
+	mutex_init(&dev->lock);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
@@ -269,6 +303,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
 
 	amd_pmc_dbgfs_unregister(dev);
+	mutex_destroy(&dev->lock);
 	return 0;
 }
 
-- 
2.25.1

