Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49159C77B7F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 09:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbjEPJQM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 05:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjEPJP6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 05:15:58 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::612])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD615BBF
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 02:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6YgLoJM2j0gkxMQcHO6feTL/PAsI9ZdvQqJBhsOZqLNhAyD49TGOcv9OWGLC9etiqd+nh1rhVco3EsjH4MFWm5e2kcEyELbjIzg+BdqomvHQ01VzzRmgpkeVKR9qkmMSF4BM/3B3vNTyQ5lduyMJp6HBzrEXt4XTJVahKdv7YPyymT9h2+JUGssMJjeTr9+bGVsVshG8yRtlzNzgTfez3jlOnxtDtAz44L7P9Mu0FcqJufb1DIrbMAjR8jqaWmeLL8VVcVtbEKFmQD0hMoPn7DDwrl7w633GpViXt4KrOwRBXq/XFN/bjqzh7bcRfChPRKUHKI/v9TJlGf5WV911Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ41Rl4T0EYqitEKBY6//O1BZDNgx70uWe3gzVtR1pM=;
 b=byJVjnCDOCld5o0DSefj97YJI/IbJ6lmtDHf856vz0Fp+rfSEilzBjs5zOxRzwfrvLwb8kiCcdXVdbbkrJCZfPlR5/cqcyNESNaAFQYe0DXtRcqVZJAbb40ZIlgEpzCOorGYmHHBDo2/+KD/TC/MaaFf4J6P59Hfz5zB3bdTvc6UlNmEf6gi0vzJbLtZUB55zh3U8vHrfBjb/TK4Wxu3cIHdR8XyWxFfyg6NvN+PEfZNPml9WgdlvRBZvgEJkkqxpZdwofUHBm2e93F9BTr4C61eVsLFOHk0A5YTILjHQDKR3ZKEaL1iuMAONJ898/EtLDSYfsgYhHJNbwRCq7pntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ41Rl4T0EYqitEKBY6//O1BZDNgx70uWe3gzVtR1pM=;
 b=dKRS3cXisQEP10I4iMnh/4loke3doBpQMLe01qpbY6duCzhmDtL5s+s2PcOpJ9ZavLOQ/BWuMLjx35VLqnGCwI1XsUERb3RBNOsX3VMb6wKoXfCtdqj5voKNtpbnhfo+uaWfZ1MI3sktP9GIVFAM/xqLhEnixdbsxdp4ynCV0Es=
Received: from MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::26)
 by MW3PR12MB4508.namprd12.prod.outlook.com (2603:10b6:303:5b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 09:13:41 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::dc) by MW4P221CA0021.outlook.office365.com
 (2603:10b6:303:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 09:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 09:13:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 04:13:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to check the cpu id
Date:   Tue, 16 May 2023 14:43:07 +0530
Message-ID: <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|MW3PR12MB4508:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9a3390-8943-4be4-bc6e-08db55edd7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqaW+jzUxN8GHiKrD8CzIlsuGy3k/pJafASFr/T2Jv3DV2zC5Nd+1OHEbmZmkuu/64rHSEFK/5XEcOKq9he0XOoQOvcuLvcui9a+No9TzOBiKh8U1QTzpwVKkw38iE9Ae9wYnfSbwHbLeNkOD8OL/mKUISVMB7iX/Mg24gseX/2ZaPReZ0EHz/SHfN299iCUrUOor3ExcdIh4MTDeAclwmFwdBPYZCCM0yNaQN7DCttEgUq+bWD7eNmvkK8dTg9nGAJpGUlTVJCkC29R5dQkwuVp/Hl8MZNqc4XrmRLVhyP+hxGNlDbBhDJDuWCeC1xKtVqJDvPdniRStXY9N85rDq8A4akNtpRfgTUhlnhdzsF1u1yMBkPIrVKmAZo5ltg2QtmqTbIHWFo5xmvof0mcvjZ884gknRR+ewtbkgWEgXdsAXCDBVAZ5s7qDNDNEo/8ZwpeYcp61WhWZjQ50n8AbS+DevS2JgXq4SIMNbIWg+5b5DWZmFieoJKSKsc4lHkjcAK/Ma/MPS8Mknl76GcACRL9xzSak9gYNbJKZFyAfhhynbGu+mw0ZhOwqM2Ht/9Q8mLssPOsHDFdyGMhx9jXrCope9GKuZxR5Xv22VGZ/ZviccKxYgxpQXVIuceQFSYKOveJLuAjMDOw6vk3+JKudMnSqRvwSz+FyCLydzQv3Xcqj2rGRsMRUjDfbZhtRTei53HXRkPnIHliXCNniteSOYINp1yUOob6vxwxwopl9T1nyMfmdFML0bjkKzbXgqkDth1D03FBy8AHbnPzyHNskQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(478600001)(41300700001)(316002)(54906003)(110136005)(6666004)(7696005)(8676002)(8936002)(4326008)(70586007)(5660300002)(70206006)(1076003)(26005)(40460700003)(16526019)(356005)(82740400003)(186003)(36860700001)(40480700001)(2616005)(336012)(47076005)(83380400001)(36756003)(426003)(82310400005)(86362001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:13:41.7427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9a3390-8943-4be4-bc6e-08db55edd7c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4508
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a helper routine to check the underlying cpu id, that can be used
across the PMC driver to remove the duplicate code.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index e2439fda5c02..7e5e6afb3410 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 	debugfs_remove_recursive(dev->dbgfs_dir);
 }
 
+static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
+	case AMD_CPU_ID_PS:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 {
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
@@ -575,8 +587,7 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &amd_pmc_idlemask_fops);
 	/* Enable STB only when the module_param is set */
 	if (enable_stb) {
-		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
-		    dev->cpu_id == AMD_CPU_ID_PS)
+		if (amd_pmc_check_sup_cpuid(dev))
 			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 					    &amd_pmc_stb_debugfs_fops_v2);
 		else
@@ -1036,7 +1047,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
+	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
 			goto err_pci_dev_put;
-- 
2.25.1

