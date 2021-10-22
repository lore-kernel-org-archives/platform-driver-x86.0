Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C4AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB8016103D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhJVRcB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 13:32:01 -0400
Received: from mail-dm6nam10on2082.outbound.protection.outlook.com ([40.107.93.82]:57696
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231453AbhJVRcB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 13:32:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6XJU3kBa+RPpEp4Aj/umip7T5JnJjkq5MtvKE2m99YHj/H1vhTdQdX29WfQQSBn1kxUKGeWxzLsTONjsQdoCajJ1762+VskMGv+EvWRbeGlmEC4RvAxu0dtQgCFnE3vw2kcvZr5B7JLZI/xijLuBq+7nTtPDxJMVXez1P++/5r72j62M//2n31aQeEueYK6RIdnxL9zrvldeki0wKb+EntiLHHjqXktzPVQD41GVbXfDVRT+cslqp8okxGwg7hogyk2R1dgStD6NWCo3m+q+1z2fHL4KTdTovHozbrvNrkD1at+FPFB5kReey9cMIBT/EJSBxumMJ7Z1WtQtKOdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvDBePDoYP0+HlsA9FX7q/sqm/p2DNlymjsCmEbTm1w=;
 b=Pk/7f2QCG+2byCqkOUSAqzTLo6k6fQ44ri5hjMVnHNgj7x4dHCNDUl85TwLSQbik/M9Mn5YbplKX17qGSa9G+KeIlCvYul5i7v4euSpc0C3RXzJVu6dzMOlLS+ZIVYRqhnEGt6Y3GPw+i0q4VOpI9Oe9fPIdUV0q39NkhdqbxFQEiy6xCBibi7FAcgTzL3j6cZf14ACqm70TZo0Q0UBDUm4i5qRh3ocrVLSIV1hTS6WyPpVMOkj6B77EkykZ+bPWsrJd/4mT7ZteHtNYhvARplWK0T70baiJ1iu8ArWNYOCcqU6llEs+BgIrSdlgARmCtkV7biUKLdoy7fDy2hVJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvDBePDoYP0+HlsA9FX7q/sqm/p2DNlymjsCmEbTm1w=;
 b=EJux+Mmjd4ok8p5HkMl1UWShEDLuswMUyg6e4sjvb6QMy6oMI9gp+uTkLfXIIgj7u4cMKQf9vYPBymgSIxEyEjp+jXdiiYbnZ8BCOufvM/SLgy5OSDxJBPpzx7shmuM7IrgenO0uOw8tn44Jlk0dKtnWhQ1bUdhZDBLaQYV2nP0=
Received: from BN9PR03CA0497.namprd03.prod.outlook.com (2603:10b6:408:130::22)
 by BY5PR12MB4949.namprd12.prod.outlook.com (2603:10b6:a03:1df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 17:29:41 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::dc) by BN9PR03CA0497.outlook.office365.com
 (2603:10b6:408:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Fri, 22 Oct 2021 17:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 17:29:40 +0000
Received: from amd-Mandolin-PCO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 12:29:36 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v3 1/3] platform/x86: amd-pmc: Store the pci_dev instance inside struct amd_pmc_dev
Date:   Fri, 22 Oct 2021 22:58:43 +0530
Message-ID: <20211022172845.2608-2-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022172845.2608-1-Sanket.Goswami@amd.com>
References: <20211022172845.2608-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd4300a-5659-4bf8-87b4-08d99581878d
X-MS-TrafficTypeDiagnostic: BY5PR12MB4949:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4949438E6D895DCAD148B5AC9C809@BY5PR12MB4949.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5X89ZT0MkIYnp+OPf0KLS1Tb63jlZOm4/hyvcA6KoaQorAUeCrtePOGt0POq0NqciSyf7v3rzAUfYwdTlZ4cKshWocErX6RaKbgIh4dPCFLWqMsrFuYb2XMNXvQ7kyGyP2shcNCEeunhAntF+4aYiC/eJDuu3IdMG4A2KIGObJxJtWIbOmH+2thkk0zdRZEOgTRMEj8uq4BDpgtarVJdNimQbkvHMwHxAjYH4S3E6lbxAnChXRWIrGaneJuS6IJmxS5K5bkJh5ef+9fSwIt+fb7cfDhPq5sBVJGtmvObhzqH39tsILwhFWwfTlek5MV9qgdd7zsteINVG2nP0cOACaOlLBkbRk9omkWpSNj26ZslGfpnqcD4jdy6K37JRHYaJ3GcOOXfkRzAuXgYUvaLVXCoofRko6URTmYStOmgrs8ptY74ilYMMHbHgcyHnlaWidD4V11X36UxvONS9Ziwlp6ya3BSouzXVjEeA3K4jJDp+fbsxt1pHbZdZpJepMIJ87phnNjjHT5otfJEMR+6C54mQxpFa5ztbkJv447Hk7N8Sq/lQRPnCgIQd1W2EQFwtutbs1zZzkCXqsrzmPzmbOX4FYLw6lqmx802Jq2wnItNur/WpBspsOmNkWGdiEyFH5gYajJyXsyAbJ76HaiMsgaHBLmYRvW9TvSTVfYnjCrZL+tGTxyz5pXBid5Hrn13ugYfEKp9RLsP8bXuC01g+2E1bxAJ29tiRgdnmyK83qA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(4326008)(86362001)(110136005)(36756003)(54906003)(83380400001)(26005)(6666004)(47076005)(356005)(16526019)(36860700001)(2906002)(336012)(8676002)(70586007)(7696005)(186003)(82310400003)(70206006)(2616005)(1076003)(316002)(508600001)(8936002)(5660300002)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 17:29:40.6275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd4300a-5659-4bf8-87b4-08d99581878d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4949
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Store the root port information in amd_pmc_probe() so that the
information can be used across multiple routines.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v3:
- Address review comments from Hans.

Changes in v2:
- Store the rdev info in amd_pmc_probe() as suggested by Hans.

 drivers/platform/x86/amd-pmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 678bf6874c63..5d88e55e1ce7 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -121,6 +121,7 @@ struct amd_pmc_dev {
 	u16 minor;
 	u16 rev;
 	struct device *dev;
+	struct pci_dev *rdev;
 	struct mutex lock; /* generic mutex lock */
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
@@ -541,6 +542,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
+	dev->rdev = rdev;
 	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
 	if (err) {
 		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
@@ -570,7 +572,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
-	pci_dev_put(rdev);
 	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
 
 	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
@@ -604,6 +605,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
 
 	amd_pmc_dbgfs_unregister(dev);
+	pci_dev_put(dev->rdev);
 	mutex_destroy(&dev->lock);
 	return 0;
 }
-- 
2.25.1

