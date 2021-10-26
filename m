Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B410C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:41:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D2676109D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238355AbhJZSoR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:44:17 -0400
Received: from mail-co1nam11on2072.outbound.protection.outlook.com ([40.107.220.72]:21752
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235794AbhJZSoR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 14:44:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBKElSvTnRuaevai0OExMtLjqD92a/lLzgI78kRNo4UVRMk71TZOIZHGWNUZOM1YiXyiwYqmFQTPIrFhiYqP6E8rsL03K88wSRZvQVeX1dZxVMRSuIC3KHe6vZKg7jkj6OVYcPQoegi4BWP05EE0NXssDcYlbOgStDRHLH86bU9C4ZpY4dzIDKpNkny7TXXvjGXrB0lBXEQx7dopeTYhp+kZaitms/J8ED9owghuXdqSq0yWAVYsO15lfiVBF5ZlEkAZB5XZSbDk+3HdJzkIhFl9m/HfUWHPEJQr1h+7QUWArW5yxbvf2WzAA48ld4FYZogYFO39T2ZLyO/Uk0qocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvDBePDoYP0+HlsA9FX7q/sqm/p2DNlymjsCmEbTm1w=;
 b=Su5NDYZyuubKMiEusLqQyUoxA/5ofUQqAOD43UnL/+eVltIJwflxmomvBVxC5dveYa1wWJywWoaOI8K9sSfDffB5L05C/nFOrdjC8XpLC/adJ0DbfzolY3NHvei9NOtBO/hlFtByxxuWepeHOrXwu3OdLL4mytXkKxjY5Ue1PTsRiEgP07tQiFzEAsalUhcHwCC1ZF2avGywAc7w0lBl4GbEga0vxNi4D26IgNoDxqc80K7X1CRf2mgxaIp1Cf3o4Vy/56oNhmga4eurPqUAdiSWQFkSGIpwFOC1e0zXAY9qnVeHc4t6IsQofxhY4Lky1BB55g5BbAElpaaEzr1z3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvDBePDoYP0+HlsA9FX7q/sqm/p2DNlymjsCmEbTm1w=;
 b=HLryhj60wtk9mprq1IdKaDq4s1ExI32/AUanrRsLBC+y0laOwKKsRVwD9jmMitv8o6t1lVytIe/fFOFwrkeh5q/u9DF3SZtx3vPpa3IbXr/T0yjcDnZ0cMsFO7loQEnmbuILe91J+gW1UZs9vSD+UopkNNeNMecielo9hAZTl60=
Received: from DM5PR13CA0028.namprd13.prod.outlook.com (2603:10b6:3:7b::14) by
 DM6PR12MB3737.namprd12.prod.outlook.com (2603:10b6:5:1c5::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.20; Tue, 26 Oct 2021 18:41:47 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::bb) by DM5PR13CA0028.outlook.office365.com
 (2603:10b6:3:7b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.8 via Frontend
 Transport; Tue, 26 Oct 2021 18:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 18:41:47 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 13:41:45 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v4 1/3] platform/x86: amd-pmc: Store the pci_dev instance inside struct amd_pmc_dev
Date:   Wed, 27 Oct 2021 00:10:43 +0530
Message-ID: <20211026184045.2201-2-Sanket.Goswami@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 59c5a6d5-2a3c-4225-437f-08d998b0443b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3737:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3737A7CF2AD7F745CE94C4F49C849@DM6PR12MB3737.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DeUGMCjl24KTR5u3hOzNLAHXTNaKGaxGuhASPdpu8AyATQG7n5gG5PAeyQW4j7tS+gFVvmREzGOSjS2i3Chk99tBWRmLgtWWaGFk56Q3T8Z+kR5vtxNvKAPdnL8GUr4lMl6EbrmF4GMReetGvbGOFRmtBe+IhVoKvKcMJCMDGlBBjy97YFSWFCNnnCNDIoauerRn3XPPQCDB+VZHrMMiKaMpkAvFk/HZfH8SIyznSgxMGCoQjM/h1B32HEQdg32YRgu/yR9xNmRmqVxbvXPxHY6CyJ/2q5kRun8laVSKSrnanWdDo4FK7yh1dB0giFUN6kDjutH3KkXRCwK1XS1SROCcURFAgGUsefYeE1Z9Norm5hFbWM7nlAPo9UaO7QpPZLkUyh4x25dwHBQ/U+lHDcDBZ9nBgFXHTRkuwxOs1cEcgMIMS7Xy3CeWYGR/iyk2uXLLeTx73DQkScj8bVvEYhtKTba9t7pAX7X29oLXJXqocz1CgurZJKhR72xpaArfHNRc7Ty6NymMk7jlrOiqAFGrmUx1fHx48rKOQjGVqd8K8hCJPHVNT//SnrbohHRZueC4WGyPOK8jyWwBLF7xrSwWAMp+vP8/WP9GH9fbqaQAMAWOce0FDPW8f45MB4zyxGYrnc/EyqgtUVLYWLHPaNAXxI4f5w170gLoezGBIZJ3899KSi17nyXzINw3naBf/y4tY5XpcNQ5WUp6AX5Bn3Gzk+Eurguhyw7XD3U91pc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(47076005)(83380400001)(16526019)(2616005)(316002)(81166007)(5660300002)(110136005)(4326008)(54906003)(1076003)(356005)(70586007)(36756003)(2906002)(508600001)(186003)(7696005)(86362001)(8676002)(36860700001)(26005)(336012)(8936002)(82310400003)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 18:41:47.5027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c5a6d5-2a3c-4225-437f-08d998b0443b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3737
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

