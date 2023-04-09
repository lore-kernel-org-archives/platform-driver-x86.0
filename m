Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438B2C77B61
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjDISyz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjDISyy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:54 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D252D49
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqziBKNbMTcEqtaLFVr4LgBObRnIJzaus79LWxvGJ4QmR1+buZU8AlbpDkamFWDvpX1phhxBLKpBFg5CYk1sh41x8rVyXOSMuhUBTOuEPZo2WbvyO1BLwfYSG/FypDxh6pLOwuAvMctOBMThBdmaCY4UN9a36+roggwUGSXF3UDWDYb/otMIGDGf2LLVY2PI5t4zDJlHqqso2z5J/NU8PcndmgxVRYyPk9WfyxWWpq13z/52uA3xO8tW5S026h6fwyLON1IatH7QBdsNmtcLhsv+B9fQtPFzurOWkzGu+RKAl8yQC8rKAI9LY7KwiP7LulF+zlNlCWECdzyILOagIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyW9H3otT7HdWCRtZidzV+7L42gzFkFtq5m7rN1O5Sw=;
 b=eD0tXPU9fWnA19BFrrGSZu64Ib/b4D17qT4wJez8UVyx9oGlhN24IxrimLoMkv+3Y8XxdQkatcwEEl0yQO2e0bHkpqRlVtVH4uRQo0i1jDC5Frn91FFAuQnJkDj5LRm2aDyV0nmv241LqZpxzcc2WHwfkwpQNuEp66I/g7UGwgKeVp9fb0h7EuYKNl5+42X+ICDfDjv+TwNDDwMTr1CUi0+7U6q3XAjtww5CHRdx3i+O1HWcWXyG9Jc7h0RcKzzMJhWvN+Hl/65hLOvOtv8o/3FBnL+d+3Q63Oib48BMX3hbB2bkGUXXSr+AwJdUGqqVZrmTXb+P49VRtmCeKYpyAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyW9H3otT7HdWCRtZidzV+7L42gzFkFtq5m7rN1O5Sw=;
 b=j9jqtvFpEG2ofwGFMF69Ui/Q2SFMTkszkaNkAR3tQd6dDb3t6kSLFuLd3QBAu0CzwR8olIVk3WQq3EiYbbBVinmeEKVeX8C9ZhAKGUdLHgqm0hfx7xO2ObQ4sVYr7IAVsQ2Y9RlXwqgzsdJ6J/zXaqGFpWXkw8z1D+Fq5EDUB+4=
Received: from MN2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:208:134::24)
 by CH0PR12MB5043.namprd12.prod.outlook.com (2603:10b6:610:e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Sun, 9 Apr
 2023 18:54:48 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::f5) by MN2PR16CA0011.outlook.office365.com
 (2603:10b6:208:134::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:45 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 4/8] platform/x86/amd: pmc: Move idlemask check into `amd_pmc_idlemask_read`
Date:   Mon, 10 Apr 2023 00:23:44 +0530
Message-ID: <20230409185348.556161-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|CH0PR12MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf8e1e5-41ea-4ae5-2aa4-08db392be44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ugX9Pb/D4xz6ACpIGLQmdkwDPWVypyq3b8XReypLae1hX8yNG1YXlJKs20t84FVzoLkZgfTR/FhtbhEtA8AuLCEl1UKegMceaHlpDRiLnkdJkrzon4m44SRMr9mx48k6Dx33oAOUzc2xi1ffytOHhKoecNBxAN/wl07kz5RKIuDJp/NQtCyjvCYtuAC8LJDjLwMy97oajS2EsNPaQlHN9/SraCcyXjBpQSss5sKc27AFC1XLnHL/OTlQezwPi195YSKCXGfqdKtn8w/Iv1Ea+NFsiVuv8Q91mJ8U+QQgzog/Y3XbSNNhyF4AjuCUK3dHfhjtwfrgT9l2yXLXrObfiWSbyaCKpSEmQlFgxzAbA+hrZtTG3tLz8AETSVKIiL5LY2f+KrlwoUuHQl/qfkm5F6vVYpd/NvOzacxQzynDhbp33RA4lb34BPGxKSRKoiN0ydLpte/5JBNocN3q+SWTG7ezsFmVJYChNYTQsWaMXgKsDOJgYUxQG91fRq1XEJHNF04+cHb0LCM37Fchbe3br57O8tjylxRndxRwC87vIqBTDPi9/Pzvmc4IaBFTXoVKEH0d+U/XzYm3MnXAjUQWJpvwcn783gXM0iO7gIOaYyq+T+isTg3kZy2Qnlm9GN7aG8D2rNKtAoxJqXL9n/85Vyppqlxth2rSH6t15kS/PmfsYvBBG89pAZaKyWE/bo3quwcx8qzmidw2idgE4u2UCWW+pTEhgaClK7SOBl4KYm/Om20juMwZYyMghBU4UPsz3IhPKMs/ZB07xaEc976aw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(70206006)(8676002)(4326008)(54906003)(478600001)(7696005)(70586007)(41300700001)(316002)(110136005)(86362001)(36756003)(83380400001)(47076005)(2616005)(426003)(336012)(1076003)(26005)(8936002)(2906002)(5660300002)(82310400005)(40480700001)(82740400003)(356005)(81166007)(186003)(16526019)(36860700001)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:47.9358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf8e1e5-41ea-4ae5-2aa4-08db392be44f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5043
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mario Limonciello <mario.limonciello@amd.com>

The version check requirement for idle mask support actually only
applies to RN/CZN/BRC platforms.

So far no issues have happened because the PMFW version string is
bigger on other supported systems.  This can be reset for any new platform
so move the check to only RN/CZN/BRC case.

Fixes: f6045de1f532 ("platform/x86: amd-pmc: Export Idlemask values based on the APU")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 74 +++++++++++++++-------------------
 1 file changed, 33 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index f3a099550ff1..71dc8c80a79a 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -344,33 +344,6 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 	return 0;
 }
 
-static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
-				 struct seq_file *s)
-{
-	u32 val;
-
-	switch (pdev->cpu_id) {
-	case AMD_CPU_ID_CZN:
-		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
-		break;
-	case AMD_CPU_ID_YC:
-	case AMD_CPU_ID_CB:
-	case AMD_CPU_ID_PS:
-		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (dev)
-		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
-
-	if (s)
-		seq_printf(s, "SMU idlemask : 0x%x\n", val);
-
-	return 0;
-}
-
 static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
 {
 	if (!pdev->smu_virt_addr) {
@@ -547,28 +520,47 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
 
-static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
+static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
+				 struct seq_file *s)
 {
-	struct amd_pmc_dev *dev = s->private;
+	u32 val;
 	int rc;
 
-	/* we haven't yet read SMU version */
-	if (!dev->major) {
-		rc = amd_pmc_get_smu_version(dev);
-		if (rc)
-			return rc;
+	switch (pdev->cpu_id) {
+	case AMD_CPU_ID_CZN:
+		/* we haven't yet read SMU version */
+		if (!pdev->major) {
+			rc = amd_pmc_get_smu_version(pdev);
+			if (rc)
+				return rc;
+		}
+		if (pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37))
+			val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
+		else
+			return -EINVAL;
+		break;
+	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
+	case AMD_CPU_ID_PS:
+		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
+		break;
+	default:
+		return -EINVAL;
 	}
 
-	if (dev->major > 56 || (dev->major >= 55 && dev->minor >= 37)) {
-		rc = amd_pmc_idlemask_read(dev, NULL, s);
-		if (rc)
-			return rc;
-	} else {
-		seq_puts(s, "Unsupported SMU version for Idlemask\n");
-	}
+	if (dev)
+		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
+
+	if (s)
+		seq_printf(s, "SMU idlemask : 0x%x\n", val);
 
 	return 0;
 }
+
+static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
+{
+	return amd_pmc_idlemask_read(s->private, NULL, s);
+}
 DEFINE_SHOW_ATTRIBUTE(amd_pmc_idlemask);
 
 static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
-- 
2.25.1

