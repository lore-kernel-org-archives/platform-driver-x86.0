Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E824C49EA6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3B6F61166
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFWUEi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:04:38 -0400
Received: from mail-sn1anam02on2065.outbound.protection.outlook.com ([40.107.96.65]:57989
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230040AbhFWUEh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:04:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Arv/0q5cqMR5TMQcutk9S/W7yX4W+5cN4OepFz6sb5AF4Gb3zNfwRfGMn/E/wIboN8b1u1gLvjOWuEYqcy5lOkmyovJPS5rcvAaRmMV+tqBVAU0iQa323Eq/xOYGltflHdPt7g8YMzLFlLXpqxNJLBfYcP/9R2X522S7nc87OjNhSFp/Kb1HWf9Mj4uwq8mofdPmP21EUkNCxFYk3JkE/voy3KFJjrA43+qX6IMEF9HKgM+oLmIKCY0QjR17pOAy4h5k0A8LLkc5FNRZmUveKw1H3emqw+V/hDaYGC63y9jeSl7VqvFsJNMtemArx3CnM4b+vBfAlkL98GC08ak18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vhEeoxuYNou4jwGDe4cHA3OkwTjyZuU1roThTsqJbI=;
 b=ee8hjqpdOQ5mVigZOPHYWyGtlIgDku/GN+eRwMSm2VytK0c48MrZZmp/VaulHO02Q5UOF0xeYm6nvYP2P4X6Q7o6YOdPTAPPLmQ8WwktwaWXV5lsE5mSRE7N3FgVjjxTQQyVU4a3rxIr6cYDjAoopUk36uVAXe2X1Fnqr4onJ3oW+FyxKxqG3Gjy2wlvTRWhDEMNNeJEympsMj64E9DDrDG3aPoQlktI022Ar9qzEoCc1MtTil3exE/93xPnGA1KaUAu2HzX+qQWm4xzbZCO6UXMGS6MhExEcY8YJcrkLp9Tqij5q7Z1C0Oz8H0kjnhe6kEXwDMHdt5XcndbEB1X+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vhEeoxuYNou4jwGDe4cHA3OkwTjyZuU1roThTsqJbI=;
 b=e+yz9Q+fFl5lWwOb/3SZO72ikb46+YqIs9h0e8df5lLEhKdZJoH/M8gMYOfQ3XFGM2pX4ejr9QraRlQPupa7vytA+z3XoweUoiUo3n7G8ZPv+QwZFMalsouU+Kg9nWn4lF7KCZcp64wg7bdDtTEctPj46A3SueF+k1jq/jhShBM=
Received: from DS7PR03CA0224.namprd03.prod.outlook.com (2603:10b6:5:3ba::19)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 20:02:18 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::5a) by DS7PR03CA0224.outlook.office365.com
 (2603:10b6:5:3ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Wed, 23 Jun 2021 20:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 20:02:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 23 Jun
 2021 15:02:16 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/7] platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
Date:   Thu, 24 Jun 2021 01:31:44 +0530
Message-ID: <20210623200149.2518885-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f11696a4-beec-4c16-0235-08d93681ce23
X-MS-TrafficTypeDiagnostic: CH2PR12MB4184:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41843FC3AF7AAD480D84A59E9A089@CH2PR12MB4184.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wrXQf45clsCH5nyxjxomPg6p5PbJ6FDmzlHZcVEyMMO8DsQyVk2X+w7UcjxkA6pfh6n8fCPjILQiJR7KKoO8nDkuVdXMbNJsHEFeQBG2FNvWc1nm3sHd4GAIZpCc/VCZOqDYo+B3davW6jJTGne88faI+yeSzC986EWCy4mnaVHqeaSykSv4aZ9zbBvqeLlpZ8v5oH91wUzSrzCksx8P0rHFjv125+ikxbttVN++CSxgbbgB5HVF/woZ315IE7q9Kx27IOe918DGqB3+quSDCCXL68K8nC7PCQdT6RD6tqxnF1ZR89GMhv632Puhqt9SlDE3ilan1TPw52LXf7AKysLynoE9eREc4AfMeKoZ/+78wK0RC0aZt6wnXYZs97Jc1dS8V6dUejwGERpPmquWP4h3lxEZEHeVfR9tsQ9b9cu7Sch/kyBUM2rr7A6zkYGzWZIGnI+wk2zXwooAlDKCa0Ysfwbp26iTvGNOlW87KBYqM6UYPq5+QNYE2EH7P8dx9uZhQGJV4LT3cXSSvjT7LcD1nqo5eb2eujzTFY6R1UwOXYR2P6Aoz+cpQx5D8HCfEq8WwvAKgK8MQz47tp3dFNYE3E2r0X2tCtMxbPmQz2jd9lWhd9mcXJI6T/j4dRs2AlRmdCUMtQCTSJCXGMroxPYfrolmbh8kKl5tjqnSgSFNTgKr8lAoGik1nDNOGPrGR8oB/NKtUxH2sELDyaTU6Gx7QP7XbqrN+RibdWxlmXM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966006)(36840700001)(86362001)(82310400003)(6666004)(36756003)(186003)(16526019)(54906003)(110136005)(2906002)(4326008)(26005)(7696005)(356005)(82740400003)(8676002)(36860700001)(81166007)(316002)(47076005)(478600001)(2616005)(5660300002)(336012)(70206006)(70586007)(83380400001)(1076003)(8936002)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 20:02:18.5628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f11696a4-beec-4c16-0235-08d93681ce23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It was lately understood that the current mechanism available in the
driver to get SMU firmware info works only on internal SMU builds and
there is a separate way to get all the SMU logging counters (addressed
in the next patch). Hence remove all the smu info shown via debugfs as it
is no more useful.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2: split patch2 into two as suggested by Hans

 drivers/platform/x86/amd-pmc.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 9c8a53120767..1016a3415208 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -52,7 +52,6 @@
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
 
-#define AMD_SMU_FW_VERSION		0x0
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
 
@@ -88,11 +87,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
-	struct amd_pmc_dev *dev = s->private;
-	u32 value;
-
-	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
-	seq_printf(s, "SMU FW Info: %x\n", value);
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
@@ -256,17 +250,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	pci_dev_put(rdev);
 	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
 
-	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
-	if (!dev->smu_base)
-		return -ENOMEM;
-
 	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
 				    AMD_PMC_MAPPING_SIZE);
 	if (!dev->regbase)
 		return -ENOMEM;
 
 	amd_pmc_dump_registers(dev);
-
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
-- 
2.25.1

