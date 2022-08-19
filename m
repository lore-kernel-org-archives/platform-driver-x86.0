Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C18FC28B2B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Aug 2022 18:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349938AbiHSSAO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Aug 2022 14:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349988AbiHSR7h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2022 13:59:37 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 143964F646
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 10:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6aeMgkHNhNqq/Y5zzx9aPsjUL97QjKYr9zuXBGecvJhjv9+mK0CgR9yLzNxKqKk9jqVOgoJWm4P2e2kApKQcef03dhSUlJ4XFA9iedL7+P9ffuEykvgHuM5q5UGKEXQkBsKKh8z+j/Vlq557nKY99/ADGfOeBvAlhOJiCOEIaueOw3padXwGnbRtJMKxtQH/HJF4nFOPIhjzxjwWqigdyV6YvHr+5atWqiec+dsLCpU0munzmk1wqIJMYy9McbKJoE1546Tb7sqwmVI3qgc1BktwwXRWSAIvKQfyrdscnrDjX9B6veTdjJX7rHPc5wBhUzpeGGZmmKcqPB6Z6Ixzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F+vJtTWH1BF9zjQtDLmVgeYYIsGve6VdfnuhhFKMDM=;
 b=DCZMtWeCtPiCHOtRYh9XQKhnVMcXW+xdUX8SBTtW5pXjHV4lzPuCLGrM6dS1U7k8BYAtLk5zD9nQnUuxcdR48QilJb3uzPnH3TZswlQPxBwE8fqR6OMzzduEtUqTWAftpR1copjgH5o01P5nqG11nMA5hBPEfFQpFEHX0h2yLFry7e487qNc3hA/e5FZ7TgaBlAk+vcWPjmJNqN+wcC+ahrh0447WEkb+etQJpgwAq1iuwsSiciwb8IzG8MZmoPdyj630BZ5HSkc+0Dx8pO8OZNrqVcLpRJUsLBfRhV33bC4/J9oaot4faWURhG8MwqE/056vnFFhEBKK/XmQQW3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F+vJtTWH1BF9zjQtDLmVgeYYIsGve6VdfnuhhFKMDM=;
 b=hqR6iv/ep8ownyKHAh9uRVFWxWOGbjD/9qUbdn9Um5gSsyavdoqq8mABNSE9VaGX/1yTDCjHkMTeGwT9Hqmg9QToX052vI8TblVd/Wx4y8bBK9VMTxfiWqMDx8WVCSxP0TPbTtcJUgBeh8XWr5ExcvCpx2txVvs2gFE+2lMymnI=
Received: from DS7PR06CA0023.namprd06.prod.outlook.com (2603:10b6:8:2a::14) by
 BYAPR12MB3639.namprd12.prod.outlook.com (2603:10b6:a03:db::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Fri, 19 Aug 2022 17:46:22 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::34) by DS7PR06CA0023.outlook.office365.com
 (2603:10b6:8:2a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19 via Frontend
 Transport; Fri, 19 Aug 2022 17:46:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 19 Aug 2022 17:46:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 19 Aug
 2022 12:46:19 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] platform/x86/amd/pmf: Fix clang unused variable warning
Date:   Fri, 19 Aug 2022 23:15:58 +0530
Message-ID: <20220819174559.4029855-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a777e673-1909-4cd7-f927-08da820abacd
X-MS-TrafficTypeDiagnostic: BYAPR12MB3639:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVBHZQihk2wmSG5PlrZTXB+Rg4m4FZuBBkVeAIaO3jaMKdpyI5o21U+k2fcALoBWSeEhWnlaF2fHlKM/Rz58jygNQapEU4FeF0JtbWqFZG3KDwAKq24w6eJd2wD2XVGboWc/yo7esggx+Xkzc77AFoJiETwnni4v3LMHwQHF8S5Uw1ilc58ww1TPUXk2kneq9PLcZb1X/UJA+0yxfvKt01It7TYs2Lhv1fRL3uwYJ3ICApdlCHv3aizCxHL6drPWItGRIip0K6NhfRBEeUOQemop8UAJe+lTD6DQUZkE2wVxVmiYO2Src6LnMmiI1QLtlvqtQD9050Ri8pqGaKVecO5jhNomlTSVOWctFDS8fq5uIM8VT0xu+sOpIc1VADW5haAiAAnduUwlKOmDvrvP7p6Kq9ivqhssGcHjdqmXsrGKnijfpuYh7msxHSdMuuycEzhNopwfxkjzSKd9jiZrIaOpnds1zbYuXOJvWUe+Ipqj2ybbavrvM1fGkRkyMsuXZwBN2YKtptWhhSLn8PsbZjRvE8lYiMB0LgT95E4/LLhXUc3HuxfcON/cWuO6NpO9FDGJpefaok6ytUVg8vrpZlKQavyubWggYBTLy4zbozjJLhh7kBC/tfWleRBnK/j3GG4pXeyR8BzxeQWERFpUv4k9O9U69/DGyI36TkRNkrQJ7cX2zk7+dRsnxQ2xCtRDEesKdHezbBU1YPIcF62EDuNUlQ48NdHF3j1LpLUAk2DduPxEuaj8rSV0waenK+TqiZ58otvaw82puPM6MoyO1eB1aX3azk0riXO4Ag4KmSOmExu1mepJHvp0wXKhXYyj
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(36840700001)(40470700004)(46966006)(2906002)(36756003)(4326008)(8676002)(478600001)(70586007)(70206006)(40480700001)(41300700001)(82310400005)(316002)(7696005)(6666004)(86362001)(26005)(110136005)(54906003)(356005)(1076003)(81166007)(2616005)(336012)(16526019)(40460700003)(83380400001)(186003)(82740400003)(8936002)(5660300002)(36860700001)(426003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 17:46:22.0597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a777e673-1909-4cd7-f927-08da820abacd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3639
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

variable 'mode' is used uninitialized whenever switch default is taken
in sps.c which leads to the following clang warning.

---
drivers/platform/x86/amd/pmf/sps.c:96:2: error: variable 'mode' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  drivers/platform/x86/amd/pmf/sps.c:101:9: note: uninitialized use occurs here
          return mode;
                 ^~~~
  drivers/platform/x86/amd/pmf/sps.c:84:9: note: initialize the variable 'mode' to silence this warning
          u8 mode;
                 ^
                  = '\0'
  1 error generated.
---

Fix it by returning -EOPNOTSUPP in default case and also change the return
type of the function amd_pmf_get_pprof_modes() to keep it similar like
other drivers which implement platform_profile.

Fixes: 4c71ae414474 ("platform/x86/amd/pmf: Add support SPS PMF feature")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h |  2 +-
 drivers/platform/x86/amd/pmf/sps.c | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 7613ed2ef6e3..172610f93bd1 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -303,7 +303,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 
 /* SPS Layer */
-u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
+int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 			   struct amd_pmf_static_slider_granular *table);
 int amd_pmf_init_sps(struct amd_pmf_dev *dev);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 8923e29cc6ca..dba7e36962dc 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -79,9 +79,9 @@ static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
-u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
+int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 {
-	u8 mode;
+	int mode;
 
 	switch (pmf->current_profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
@@ -95,7 +95,7 @@ u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 		break;
 	default:
 		dev_err(pmf->dev, "Unknown Platform Profile.\n");
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return mode;
@@ -105,10 +105,13 @@ static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
 			       enum platform_profile_option profile)
 {
 	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
-	u8 mode;
+	int mode;
 
 	pmf->current_profile = profile;
 	mode = amd_pmf_get_pprof_modes(pmf);
+	if (mode < 0)
+		return mode;
+
 	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
 	return 0;
 }
-- 
2.25.1

