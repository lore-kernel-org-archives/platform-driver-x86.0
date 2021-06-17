Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6AFC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5110E613CE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbhFQLdS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:33:18 -0400
Received: from mail-dm6nam10on2071.outbound.protection.outlook.com ([40.107.93.71]:62816
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232332AbhFQLdR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 07:33:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O43E6AtgJzxRs/4wSoi1kjEHV9qp8re13uwJWDlOu5/P7xumJmCBFIFZaSqWjfLaOztEIQnupG2b/RXvl6R5hB+R80pymJP+Zy9St79YUD9VMpf55xJNeo2Ou+4QREeHdZCyo2F8wiUKUMKqON9rcUibmm+nQK0e8Kmjz4bdwGtKNxaqzQC6NzZcYuqPmE184uIY8Wbx541Xd+PfmDmVx7yrai+SXZ1/MFkCssXszktlsviw7nG223KOUjytasIAijGIuybva0ss5oAR1V59NSy3c5CkNLDGFEfNzLjXIKHHCMP2mc/FWuAli+fLm7qSpBIDC/U1IAWeY03dB6VoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0z4v1uIZ0xHTL+nCCLTSj0X6G+Yg6QNBsbAoGmMELo=;
 b=SzA0ii82Eu3z5hMDzjmA7rqHFo89T9bVaKA9pBhfOgAVEBUXrVbqy9Sj7OHNwxDzWMjF1ANkthP6GdWq53EYMtupOhMU78Frr9ErbF3Mu4ZohB1JWF58c+Ranf41BtBRwI5h2wqtL2tSuyVaxweI78F9wmjRhRFLFxHBGJi/dgH4wmLfR4KLuUXYYxq5Dr6G9gXwfOmpEyuawLvLBxRdsQ+OUCfMvZ9hxvl4s2UFqG4FIf5BG/CFbZ3uJHk0tTxRa9CMz6+nd27aTfX7TzfmjdjQHdqXSP/dQD0OAOhfpGvAo7uEk9L7qBxEeJd9DtXcKVAbywIbtfMIXM8CusI4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0z4v1uIZ0xHTL+nCCLTSj0X6G+Yg6QNBsbAoGmMELo=;
 b=YQ7xhq8SPrBjyh96Fqmf5H6BQY0QzyrASQBxTaS9gNQyKRDl1dXk6HnGh5SPov9TLQBMRz0XPT2SzaLf3/xgS9Lu39B0NBEINBAuWb9sSatkJDHKVFGv63CKcIvVay3NXzy2IBPMrlBhqSTIF7//2KaHZf6Y1T4/WunbvdVqMSU=
Received: from DM5PR12CA0058.namprd12.prod.outlook.com (2603:10b6:3:103::20)
 by MN2PR12MB4485.namprd12.prod.outlook.com (2603:10b6:208:269::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 11:31:08 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::8f) by DM5PR12CA0058.outlook.office365.com
 (2603:10b6:3:103::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Thu, 17 Jun 2021 11:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 11:31:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 17 Jun
 2021 06:31:05 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/6] platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
Date:   Thu, 17 Jun 2021 17:00:36 +0530
Message-ID: <20210617113040.1603970-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f6cd6b6-445c-4bb5-38ed-08d9318366c2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4485:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44851F5C96F3C2A2A6C765749A0E9@MN2PR12MB4485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Utigr3aymm1KEmwV/HIyyXug5sgAIG5V1XR/ayUEn5eOPz5rZrgPVc2z6mPm1KcgK9+/U1Z70vvw02g+m1A1Tp7O298JbUZWzf0jdpcnfT9v8wgEBCpo+KmUYLVmYhjV+dn/Cz4VryNhpzT9b0pCedZbpowzsJ7ua4Opq2uLwoucusF5sXPhW2iVvYvNmO8ok8EC0TWBKVLtjhMe+oSA+fGh6g7ZRl0Wh2eFvcYZ8sY6JFRDqKmwY4rtpnLaUMPTbeuXN+hVh46MJA9MzvmEYz4fpHGXZdZxs0UnbP0Yd+5GhDOzF4X42RBXrcr/RRlvsE2V3IP2CVZFH3qWqBpGj0OKl5kLx+Z3PcUIVMKwvWBbvbeXDceV6abKI4iBKH6EuJdU2gGI0ikzVfl6siQ2nLyL1g/eZeYzA0jzjxZVmNwhuR7x3QbEafD3HXBotAL6EiEZg0lyNxcz4/8NSvVD7Nzk8wZNqr8GPl32YzGcMijUrgwZW92q9Rn0feuZ9a7RLx+PEgnW4Q/ak34+HAipiuEYC9wufp9yEpyBrgkXp+C+DdlhZgAtQeUp2jg7dRF+LkcZg5qFOnuer1UUKVhapbIChyJJvR3jYkZcYt1iZoA20qQV6UHyWVS/K16ImYIfvUnPIsWewoxAc7LSnlOgZuYhQRBlsB48BJO9VbdUMO9tHrp8YcEMY4xE0VMiZC0e
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(8676002)(54906003)(110136005)(336012)(1076003)(4326008)(70586007)(36756003)(186003)(70206006)(47076005)(356005)(2616005)(83380400001)(81166007)(16526019)(8936002)(82740400003)(7696005)(426003)(5660300002)(86362001)(2906002)(82310400003)(36860700001)(316002)(6666004)(26005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:31:08.3137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6cd6b6-445c-4bb5-38ed-08d9318366c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It was lately understood that the current mechanism available in the
driver to get SMU firmware info works only on internal SMU builds and
there is a separate way to get all the SMU logging counters (addressed
in the next patch). Hence remove all the smu info shown via debugfs as it
is no more useful.

Also, use dump registers routine only at one place i.e. after the command
submission to SMU is done.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 9c8a53120767..ce0e2ad94d09 100644
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
@@ -164,6 +158,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 		dev_err(dev->dev, "SMU response timed out\n");
 		return rc;
 	}
+	amd_pmc_dump_registers(dev);
 	return 0;
 }
 
@@ -176,7 +171,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -189,7 +183,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "resume failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -256,17 +249,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
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
 
-	amd_pmc_dump_registers(dev);
-
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
-- 
2.25.1

