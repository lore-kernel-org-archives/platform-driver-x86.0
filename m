Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DC6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B531F610A0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhJ2R0t (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 13:26:49 -0400
Received: from mail-bn1nam07on2057.outbound.protection.outlook.com ([40.107.212.57]:22697
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229826AbhJ2R0t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 13:26:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amggs77KOLVEJHHp6wLB9e1YMYlMIMvITgorHtSsb2g6EbXZLYuaGGXfmhRnSZ73b1DeCHx4Y5dD8mSXr9ayAdtPFBIMS+pO7WUzTT2pg10mQ9+sVvGKaZpTc1f52glPmvrLQMrWKLFxyXP8TLR/Z3iJgSVtElvi+gnii2lonRuuuzCYGBFvMb77fK4QuAfItv2lYmr/w4WBvpAryBIaaoAipt6hrc+h5DEHhRRUxUkE7EfwNbliFn7FKauBxFkDg83lcWnQ63AdD1RjiBLKlRkz7BYsoGHec4xfipimoAuiX5UdwGj25aDZdYnKazNzOeoz/4IVcerT/7tFYgG4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI1dNvv9FDjOtZlzdw9zka+IewxPgXzG8ObIuwRt/9k=;
 b=l+WzCJa3ZYe8S2qts4yMl3/Me7TgujOs9Gd/uQfquLGdRpuQ8ShLR1Yiv5+1iSvSF+k+2JyEqMpln5tdU0HyW6Bef8R1+y1CRTGlQ1p/BKgkioDBPNfLt/DXT5imOCMEczzvP52tbZtiwY+p5Xe5pdTvWS07Rh6ZD6BX5ic0cVFii3pNus8+b1jI3YLRbtfhjrCviG7hY+jzhV7K7oD07j5nTgTfyxzwu8Ftp+ogYLB8sg17g2J+7jdltLaAwbROd0NiHtOXmzSFi+0WCqeiMo6TdTLprO0GrJcXmCsD4OAG2uzKwX1/UddtoudNQFAS8pBxf8JhWbpw2308zL451w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI1dNvv9FDjOtZlzdw9zka+IewxPgXzG8ObIuwRt/9k=;
 b=pRi8K9OiFBPXGbRzRUz3d7AhK2Jmp5ksRMS1BrwSrQ2vALxpkbbVizdKn8Y5mq3OuGzLGezDRrPrs5iSAemVxP1A1wuN6Dh63zmiyeZ3rE72iBlpihmFDxG3uRex0wSZT6LKusB/zM5/zi8MmRwg6pNUX/PUtsc9tE1hzoFFVfg=
Received: from MW4P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::17)
 by CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 29 Oct
 2021 17:24:17 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::73) by MW4P223CA0012.outlook.office365.com
 (2603:10b6:303:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 17:24:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 17:24:17 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 12:24:13 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v5 1/3] platform/x86: amd-pmc: Simplify error handling path
Date:   Fri, 29 Oct 2021 22:53:02 +0530
Message-ID: <20211029172304.2998-2-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172304.2998-1-Sanket.Goswami@amd.com>
References: <20211029172304.2998-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58eff0b7-cdbe-4e95-b725-08d99b00efdd
X-MS-TrafficTypeDiagnostic: CH2PR12MB4181:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4181BF4DD0725E73C47333B49C879@CH2PR12MB4181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Huav1jIskObwrzapSWeZ5kjQZgAMhZXZP9bMj6A7/yD27WYhBrZFnmbH/byzLdlExwzfSmuUsQ2a9jF+Y3INsZS2/V4qV+ImmBtByD1kjvzNNttliwDaluhRIVwAO09UT5Ln73ch1hWmHcY3E5J1TtmIeegJr7xxW9lP+N06Ppl2bTHvo9il+Tddps5uPK1gc60TgcxZhW1JqN1ybe0ve5nDk/Q3hJ+wRPcJZyj/jPTeZp6VYCPN0LcP8Dlp0ch1DsraedsugzdtOVndqn59/eyRmg222GRsgFv6ZNvMcsPYrqPKIWOFtRoBDZ8a00SqWeZnqaCb4XeRgJ40JyS2cvEWQTGlmtIIgDyA4W52tJFQFbKOXeK34QGHG9/s9B8SHHwdpiN8rDxZLzrS1at7d4rT7KCmG4qasP9Y0EfcyYs+oK5zTTP+HMoEmTWLrBftFj4t3Nxgvgd8ek+TXIMP7l76UKaL+hU5yJVVNiGCAVi4NRfYBQcuBQF5dy0enQyThb+sNlNXhXfspjjVgqCCCVm2TGeTR1+XqTWLIxrlsVQE/1dnrows07ZyS2vGpdFIrUwmraF0BVnbf7t9OHFp7uErhAwazth3ZQdtC/pMGnqiukntE3mF5+Ai4+ZsgWw9i2Q9KS7lJ5vx2QObkOcVxFanefKsjr8zOcpPHz2RfBBbckc8Nzm7zQWYYJW/qCJ5mddWjPCsq0x+kXZD31WSYAyIDldV6Uos2HJlmTGD3p4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(426003)(6666004)(110136005)(8936002)(186003)(54906003)(336012)(508600001)(16526019)(8676002)(36756003)(2616005)(356005)(5660300002)(86362001)(2906002)(316002)(81166007)(1076003)(47076005)(83380400001)(70206006)(4326008)(26005)(7696005)(36860700001)(82310400003)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 17:24:17.4567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58eff0b7-cdbe-4e95-b725-08d99b00efdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4181
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Handle error-exits in the amd_pmc_probe() so that the code duplication
is reduced.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v5:
- Use goto label incase of error-exit path.

Changes in v4:
- No change.

Changes in v3:
- No change.

Changes in v2:
- No change.

 drivers/platform/x86/amd-pmc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b7e50ed050a8..9af02860ed59 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -533,22 +533,22 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
 	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
-		pci_dev_put(rdev);
-		return -ENODEV;
+		err = -ENODEV;
+		goto err_pci_dev_put;
 	}
 
 	dev->cpu_id = rdev->device;
 	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
 	if (err) {
 		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		err = pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
 	}
 
 	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
 	if (err) {
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		err = pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
 	}
 
 	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
@@ -556,14 +556,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
 	if (err) {
 		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		err = pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
 	}
 
 	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
 	if (err) {
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
+		err = pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
 	}
 
 	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
@@ -594,6 +594,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
+
+err_pci_dev_put:
+	pci_dev_put(rdev);
+	return err;
 }
 
 static int amd_pmc_remove(struct platform_device *pdev)
-- 
2.25.1

