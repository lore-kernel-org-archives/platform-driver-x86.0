Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45979C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31B3D6109E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbhJZSoX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:44:23 -0400
Received: from mail-bn1nam07on2071.outbound.protection.outlook.com ([40.107.212.71]:18606
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235794AbhJZSoW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 14:44:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyg6pOOu9PbouswaMjvzIRIYtoM+6p3tCfJMUiUW+rsg2dpRMo8W6BbKONo+aoXGHI6VmeaBFwItMKh4NGXgyq5hwYKZuj8j54YwjOqpO5YcjRP6Y7GLD4WxZRcXulFfVB+o3rpLM5otUH0A+2zwn4DPb6dq3AYjQD6w4W3tca3DzvRgtrjfXhlkHvOFW6PuaTymG3v6brT4tmThivJvLLFzJnD5Mlar6/ehGpCeTxHMLvWc2FoOVgbVHbh34OruMdy+TA1xl4qNqlqzgx7d3acdL/WOjlgvhqYmWUllxrdRbkbLcqcTKRjdXW6OF032QrR6xin9TV3BLtoxrJXXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0s6/oNcGkZepPssORUWK35wrwvwtoKw4kDCAgEGqYg=;
 b=iPfOWW3JsYTugOR687ok1KC2FQ5SiLQZ1D3Vk1BRtR580QY5/uZZsea/4BExijrdWRIDpWpa69b4cp5spyQIrRb+uSl0cNTPdv987T8ZDl0Ddd0UKIIt1CA1gDxyCtclDnu/tGUGj+9PlDf5Hhd8gbnQSF8H3y/O9YvUfijipYrhOgC8RrR0lXrDvjs4zB2E5TThxC3nVhXnMVo8skGX2LkXATy7zWIOe7jkZe7YO2KfJWybDjkbVcf/+7+Cq5YfkdXAcNzkTQHg5YMuCiw0OyOa/QCdEFKUwuNTxbFKtSHeeRufYoB6cq+PgqhJgTjrvIOyXrFrV4kVIl3H3Z7fHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0s6/oNcGkZepPssORUWK35wrwvwtoKw4kDCAgEGqYg=;
 b=lVykv2T8pVkkfUlGHkbbm3aYkvfyIGDY8FSfsZKuwI1Y81UNUi4BWUUVxnFvVOUr0GE++/me7CWYEDMk2/XnJbbLAW7lKyGllzTTkC+eM/SRG8hO0pbx8BpCm/8v9Bsz00aTXgfzK9G1CIBdl3TT3jYsYmm2aYgbromb+67Zl5E=
Received: from DM5PR07CA0148.namprd07.prod.outlook.com (2603:10b6:3:ee::14) by
 CH0PR12MB5315.namprd12.prod.outlook.com (2603:10b6:610:d6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16; Tue, 26 Oct 2021 18:41:56 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::cc) by DM5PR07CA0148.outlook.office365.com
 (2603:10b6:3:ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 18:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Tue, 26 Oct 2021 18:41:56 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 13:41:54 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v4 2/3] platform/x86: amd-pmc: Simplify error handling path
Date:   Wed, 27 Oct 2021 00:10:44 +0530
Message-ID: <20211026184045.2201-3-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026184045.2201-1-Sanket.Goswami@amd.com>
References: <20211026184045.2201-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99586f1e-5e2a-40cb-2ba2-08d998b049b1
X-MS-TrafficTypeDiagnostic: CH0PR12MB5315:
X-Microsoft-Antispam-PRVS: <CH0PR12MB53158E964CED720C12C823299C849@CH0PR12MB5315.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSrSEoIpcbLFJ4wgcir4zUBPSQEKbaX7yg0e7+ZUyO3Lp4rumh98Zpxcw9gy+fmD/LrHVfk4vb/xlBKfc1J2JFiqyXssGpbUpo5KjZ4qoeTxRKtLLvemOCi1Verdxpz5OjqfpNyefiZVCrqRr+Xo2MIjaZlewSiTUJbx8zgxycELcTch2XxTFg1ZQd8Q7NpeeJ3fl36+zsr4g8Jzib5MRHksWOnvPXtQx1h9ZKP8W/9rvm5Y8+ASBoG6vGmQpQnGLEk7uZuVgY+xPvKn/jdzdO2k1QJEAxqYI1e0wk1scWZ4O5ojFt1VUg709+i0UAJZe1vMfjVqgT5TnL5sFNP5gWTaJmoHo3SQ7Zzv3alyuGtp33nnj3kyYATPqBbr0SHFyHKvVlwT+Ss5ANOYoTJWrV1rSgmgIpzYoiEjilmgXZNJLDRj5pWa2bbyKGKktLg9sGkkwsS/rwjVGA91Cej75LFIzl0DHPxG3m6qAabBW0/aHtfemJiggzrW0/L8tgGhGKqm5ttg3hgd0GFi/4qMBfVQ4lA8aibC7Pn0oO7JcJqbq9p6g6sOnHnE/CJdrh3o9gAjZmt/9OpQF4lLaYRj5cFD4k0k1djmsmvlaAHgCJMcaGMrKaMp/79bCHVHf9UHE2LvHZvZjuxhwU2ya2KHqVuSih+4bUuvOfMyHKWFrBrI3lwEmtjEfK4f+92Tg4wPu8kSQkrKMd6WmWvbJhw5Olu14CmZ8hGpG29bJxpaC8A=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(426003)(5660300002)(36860700001)(2616005)(26005)(110136005)(70586007)(4326008)(16526019)(86362001)(186003)(70206006)(1076003)(316002)(356005)(81166007)(8936002)(8676002)(508600001)(82310400003)(2906002)(7696005)(47076005)(6666004)(54906003)(83380400001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 18:41:56.6770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99586f1e-5e2a-40cb-2ba2-08d998b049b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5315
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Handle error-exits in the amd_pmc_probe() so that the code duplication
is reduced.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v4:
- No change.

Changes in v3:
- No change.

Changes in v2:
- No change.

 drivers/platform/x86/amd-pmc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 5d88e55e1ce7..50cb65e38d11 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -546,30 +546,24 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
 	if (err) {
 		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
 	}
 
 	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
-	if (err) {
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
-	}
+	if (err)
+		goto err_pci_dev_put;
 
 	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
 
 	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
 	if (err) {
 		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
 	}
 
 	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
-	if (err) {
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
-	}
+	if (err)
+		goto err_pci_dev_put;
 
 	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
 	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
@@ -598,6 +592,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
+
+err_pci_dev_put:
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
 }
 
 static int amd_pmc_remove(struct platform_device *pdev)
-- 
2.25.1

