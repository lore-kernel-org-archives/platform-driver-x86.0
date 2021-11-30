Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7060CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 11:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238876AbhK3L1f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 06:27:35 -0500
Received: from mail-bn8nam12on2055.outbound.protection.outlook.com ([40.107.237.55]:14113
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238953AbhK3L1d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 06:27:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoqC1NDx64RxNOIw3hHpo5DwDulFjxMHwvlrbjg0DuHPg2iJ3tveturIumh4FiXDbc/+Lw9qg+2aP2PIPHNhKF3eEhwnwUoPAJFNYjvpCNxcRrCuQ/apMjwVTLRI0R+F7NymYxQejG/+H2EvuT/o/a2ZM+A4CCoQZH9MF5bmL5R7YekNaxPTPplu805csAI1RS+wpLuosfvNvoDb1b+ZkKwXHep6ETCSBifgVTbZo2v1FhdTQl66/1FRVJOXb9kVWlz6zeimt/WJgfYjzoG6ECmjQ1kay+lC76R2dQK0CCsWf5GLn1sPZeHbQJoeb7HQtiZT6iGJJdj1I6pRR41vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHfqyqLJYO6v3sWU7P50/LD0zebGoi52IaJ57L6JWfY=;
 b=f/4M8YpcN02v+2PjThvZwInH7qFU/d3R1wTHxv6j+jA7aa2ULcpA8gHGmKV+BQmMHfhQ3vAiDjk7yjkcOM/AL3iAH3nfxxbuoh/6Gna79P1YWFwkUNbUpOPMBC0LP5nmpYvxFwq2KPir2kIx8hrHZlgAfjN3P/j8km/jcjmI/vpsT+aml1IO0DT9JKp/gFTA2wSt3j9kcdtccpjboGnVCn80a8qcuk52l/qA4YwqK76e5TWZv5Sx9LfaMp8y40siwZeWduk5XJDK7f4wxGdBPXupez1DZs+tqaB7jB+UQ+8ej0O8fbyrz3QFmqHkIyVapSMaHGsHhJs1DeJK0pdFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHfqyqLJYO6v3sWU7P50/LD0zebGoi52IaJ57L6JWfY=;
 b=TewC3B4U3hiyyREzE66Qyt4haigWMhmJEcNn+HHAK+l67Eiv0dXmDAo14wddYC1VVmxCJdvbIBnrNTJjcI8LRhObhBhdtJwsYoLgoVSGJ0xHwE0bK7h+KfmfbT+fYgQ1+Vt7cZkoEUNa7XPeKkeXq4v4CkI8x2xaqzrs/5O0nbg=
Received: from BN0PR04CA0175.namprd04.prod.outlook.com (2603:10b6:408:eb::30)
 by CY4PR1201MB0214.namprd12.prod.outlook.com (2603:10b6:910:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 11:24:11 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::7d) by BN0PR04CA0175.outlook.office365.com
 (2603:10b6:408:eb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 11:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 11:24:10 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 30 Nov
 2021 05:24:06 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v6 1/2] platform/x86: amd-pmc: Simplify error handling and store the pci_dev in amd_pmc_dev structure
Date:   Tue, 30 Nov 2021 16:53:17 +0530
Message-ID: <20211130112318.92850-2-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130112318.92850-1-Sanket.Goswami@amd.com>
References: <20211130112318.92850-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83190369-1696-4f27-0163-08d9b3f3ee45
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0214:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0214112F5B40FA39B337347A9C679@CY4PR1201MB0214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibiKjAACI0iL928k3htrKZoN/Y90rbyus3zDTAkqGxC6y0f9xyKm5QkNcBlj6FfaBAen6OcgNLD4EeHAE0tYCvaNs32UWDFcd9bS2+TmznFJViYMfX7Z/xfNKw/HRJYsXxXhVi8445J4wK7juA0qPGRoBVmwiKPzwJJYpjLJUcJXne9PoPEegmPLeaC1mXPz8eHJZgPC9MJD6mGtcNp07MLoPTWwOuHw+DNmeUetiGLQVqdOwun5OYU7lG+nTm9UFfqMKsq1f0p0KpcknDrx2eofA+/niUCS65ly/9uOxTI9uKkq2Lyxzi++4aGf0tcWiPueWC7OHfRYKkYV+SECCnBVUFV4STGSbf3qVayodFZY7V9OVypEgGAQNal6q18sBvCEUlMMry4KvvTzXLvkU3MgJFGoy6Hyf93Hhv+/Q/etlAxAhd4BsRtUKhGCfmsYosE1Qq7Wmq3n6jH3lGVREfTtbmuvdd8BHQasrUFXEqK0pZXY6GjauOmoFBFYHPuQt5jpTFHhFRtmJEx6c7d7z2U5MTVjRCxUOfCiSrEdyU4BX4Af0bRPVBJIvYNVIe3eREEtge4fvImQjlB9gty/pS0fdSzinQX/tDVxkXfXbUwzVWfnrr2hhFuuMt57Ri426kbHiBYR3qD+wvO879WyA56TcQuVOX2xxzcQ5a8Yr3y9I4lARjWxfR3tmimtF+jOkNSBD6mOZbHjZyH+l2WR5LO9URMNZA0d36ZBq5nREgfAXpIwLrdPy8COCByaughjHuLxFdcXoAr9LNLnVOj4xrSjEKiocXS0UHf1LFAUZYc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(426003)(5660300002)(2616005)(316002)(26005)(54906003)(110136005)(7696005)(356005)(336012)(186003)(16526019)(2906002)(81166007)(82310400004)(47076005)(40460700001)(1076003)(508600001)(86362001)(8936002)(70206006)(8676002)(70586007)(6666004)(36860700001)(4326008)(36756003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:24:10.5130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83190369-1696-4f27-0163-08d9b3f3ee45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Handle error-exits in the amd_pmc_probe() to avoid duplication and store
the root port information in amd_pmc_probe() so that the information
can be used across multiple routines.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v6:
- Add goto label in place of return -ENOMEM of error-exit path in
amd_pmc_probe().
- Add pci_dev_put() in amd_pmc_remove().
- Merge patch 1/3 and 2/3 of v5 into a single patch, which was earlier
meant to store the root port information.

Changes in v5:
- Use goto label incase of error-exit path as suggested by Hans.

Changes in v4:
- No change.

Changes in v3:
- No change.

Changes in v2:
- No change.

 drivers/platform/x86/amd-pmc.c | 40 +++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b7e50ed050a8..b3b8a5daa02e 100644
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
@@ -533,22 +534,23 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
 	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
-		pci_dev_put(rdev);
-		return -ENODEV;
+		err = -ENODEV;
+		goto err_pci_dev_put;
 	}
 
 	dev->cpu_id = rdev->device;
+	dev->rdev = rdev;
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
@@ -556,24 +558,25 @@ static int amd_pmc_probe(struct platform_device *pdev)
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
-	pci_dev_put(rdev);
 	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
 
 	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
 				    AMD_PMC_MAPPING_SIZE);
-	if (!dev->regbase)
-		return -ENOMEM;
+	if (!dev->regbase) {
+		err = -ENOMEM;
+		goto err_pci_dev_put;
+	}
 
 	mutex_init(&dev->lock);
 
@@ -582,8 +585,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	base_addr_hi = FCH_BASE_PHY_ADDR_HIGH;
 	fch_phys_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
 	dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
-	if (!dev->fch_virt_addr)
-		return -ENOMEM;
+	if (!dev->fch_virt_addr) {
+		err = -ENOMEM;
+		goto err_pci_dev_put;
+	}
 
 	/* Use SMU to get the s0i3 debug stats */
 	err = amd_pmc_setup_smu_logging(dev);
@@ -594,6 +599,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
+
+err_pci_dev_put:
+	pci_dev_put(rdev);
+	return err;
 }
 
 static int amd_pmc_remove(struct platform_device *pdev)
@@ -601,6 +610,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
 
 	amd_pmc_dbgfs_unregister(dev);
+	pci_dev_put(dev->rdev);
 	mutex_destroy(&dev->lock);
 	return 0;
 }
-- 
2.25.1

