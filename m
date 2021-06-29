Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6319C11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3DF761DC1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhF2IvD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:51:03 -0400
Received: from mail-dm3nam07on2083.outbound.protection.outlook.com ([40.107.95.83]:54635
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232487AbhF2Iu7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:50:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWAaOgVmgkBO7zU+VKI4CWrFe969ktDdJyrVHoB0mw75vELY1MTn0DIkwAmm/yPvkhUsgLKhm+j4I/QYqJe4j0j4piOU8kJGdXV5aiO8WzRG7TegUOrDGAmV+Nv9SMxOLnDrBtd4+joQABKumhFGZN0W3FaHz505KSYJdR+H2p1ReAXIvVZFZ46MDlYAUfXsZT7YEJIjWi+8XEeWlMVRQDLNUWPwalWa8ghmqLBVSV83R1I2sR4OQA9cU4nQyvP7pYOUfHMHFeKGMHBw2MR1nWcHDXIb3xjNMN79lFRBeOBGoca708OPzhE+atIrZ1XWeBrugyybGdZYFk64zPfD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1X99rtdJZgS6JUO0Lvd375XCUmasfaYqPYiqmZWN5s=;
 b=lMn2A968KDkUpaFYeDhrJt/0Wnfi/EAXFJ2bX4gDXL8e4uIWSvZjCZlGt5JGwHZDC6WA5nwQtWKpSgrBqSs7Ay+UrGiS3l8F+qIzW+PgWGTsuKQw12sJb3J15lAoNnWsFdk5/DV5X3ZlLC4fqtLIsXBjMwP1XCt5sEi+eaYJmRLZobCoQ1bMySLD1Pnl9FCmxafY+KRldL05jV8SyYAnRNBzRQ8XpWIyvDlE6HTij0oRGQ55Gn0ClUb6/IMizN1Z2RdrqN9gu1vzAnGTxG4K2vpq8tCslUR88hLPXH+Wcs/n7DfN9fXaRYe8TWVayT+p4yX/rsW692NhN39UrsWAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1X99rtdJZgS6JUO0Lvd375XCUmasfaYqPYiqmZWN5s=;
 b=A+C36e4RKVFpQoPF4cpy60XK3AO/EgbY0YoK0+CHpxJpIRRvKc35HRqOMCjpbBcanhEHl/PkUQSrytgWIJugj36ZGjMvM6bGVQLbuCEcxvCSP9Ehau1WueIMKHNkh3sj3yZrzB2uYJlUSyqIOomDWGGHQMAnp5C0c6zDBuuZdXM=
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by BY5PR12MB3875.namprd12.prod.outlook.com (2603:10b6:a03:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Tue, 29 Jun
 2021 08:48:29 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::93) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:29 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:26 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 2/7] platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
Date:   Tue, 29 Jun 2021 14:17:58 +0530
Message-ID: <20210629084803.248498-3-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8d83939a-e82b-4f8a-20f6-08d93adaaad9
X-MS-TrafficTypeDiagnostic: BY5PR12MB3875:
X-Microsoft-Antispam-PRVS: <BY5PR12MB387528D1352C02F217F114AA9A029@BY5PR12MB3875.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mm4bJuLfkRuu7BOx6rhsBr/qtld4X9Raa66uGPEQ4NygXBhpbgkOXPZmUXIN8x4u6mjr/oC7Hi3ZvPe+SYOfjEieHz1UoeBuuU0chTUs4OwnmIfOlXNAR9VdH6sw2bdndAF/8T4yVQS/QUqPaTqtcFX7cNWwz9cUvSa+6SyIJWx7zssknJDRcNNDMUVxwUYcg1+4f97GCEAEYSeeIZS6RTbfdKYsFqcfzJTGHQH1mTX0QmGuyUc2syyWtg22ghazecXrmzpxFsjsEmh2zyADP35CgTgHVlrcGIPHM9vyp0fKdJYNrq85uOSAm9VM6FdWZVyfGOhqK6uTiwcBwP9VFbXd/BOU+TgdfsTAswaNh7EmgfK8lBcA/y0vYS/jfq+2jYAivKcVsROz43klPntatFzYCM7jJE9HFLWeXCSGnhfCqY3HojT/htihqbt76KDzM7g7tr3nzKGmfcKOZKoh4fkhlQeBm0BY1FTx+OIELP69PUH4drE5OQemNVe9KRfHP1XjH2V4gnhrlkn+cgS2VXpjoS0mJQmJkX1+90ZHdJSHviRAQIOTBUmqBpXDeGTqC8KcWQnflZ9ve8B4J5CaHVj8yCNLeL27k9hlnfoMUon0SMgSJOpoUs79RsvScfkq5YWqMnEFSQy3tVhqIvzPNfkJl9aHG/vF6DjWmPlnJTJ5pvQKNCMIzsjxF5JRK5HrGWjkrL67jEFklhlvzGmhAEOP48/kV8VGBIBs5U4UQXE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(26005)(478600001)(54906003)(426003)(186003)(2616005)(316002)(16526019)(110136005)(4326008)(2906002)(83380400001)(7696005)(82740400003)(47076005)(86362001)(336012)(81166007)(36756003)(82310400003)(36860700001)(356005)(8676002)(5660300002)(1076003)(8936002)(6666004)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:29.1574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d83939a-e82b-4f8a-20f6-08d93adaaad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3875
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
v2: split into multiple patches as suggested by Hans
v3: No change
v4: No change
v5: NO change

 drivers/platform/x86/amd-pmc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 1b5f149932c1..b1d6175a13b2 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -52,7 +52,6 @@
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
 
-#define AMD_SMU_FW_VERSION		0x0
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
 
@@ -89,11 +88,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
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
@@ -280,10 +274,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	pci_dev_put(rdev);
 	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
 
-	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
-	if (!dev->smu_base)
-		return -ENOMEM;
-
 	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
 				    AMD_PMC_MAPPING_SIZE);
 	if (!dev->regbase)
-- 
2.25.1

