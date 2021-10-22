Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04836C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2C3B61248
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbhJVRcO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 13:32:14 -0400
Received: from mail-bn7nam10on2054.outbound.protection.outlook.com ([40.107.92.54]:50113
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231453AbhJVRcM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 13:32:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ42KbwJqBW3sMeZ48X/HmxPWZ3CM545F3ZJNjyRkQ3gtPyIcLtPf+vrrbwXtBb2OzMlINqjVMjdw8LWvq+HPOfSEoIGsNmo8qisPsOMqD/KyUjB8FHpm7k3i6/z9sOFMRu1s9ZpgQoxMXEgKTMPrRz+Fcj8g08lfRyx2qAR0/UOHBhCp8T1iybkzKyrDjF5PS3kRmD6PtS8VaRG9Qq8WAckU25XSLjsKKNu5WXx0JBggf2b3hZpfttL9SncRt0e1ySZrmiiQJT0t+QNfpom5mnkwwlJkyK9VLirRydWLURmhA27Oob2+gzWEN8CL3y7HrBhirisEvLjfl0lFP94ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXjqLFnzvKFy2ZWqUJydwAfXWXLOW7t7XPQa9aCVTKk=;
 b=FiOo6zLV//DgY93Ap+ftbS3Oceu3ml7b7iOhpVRPqTX0HwojIcIHNiUsawxO15jXvMtSyq5xtlJL1SMQOMBqgqZA80eqMU5y+FCFCheM5wY2keF458tDYlijyEL+fJyG0/WKzABvIeGhpxjgTv/ksaT8SWvIagM772f3yu9fE0Ruka9wj5doFp2d3cyUuYiN6Qx6XFyQvH0NU+gnPeN538JJnTwGJQ2bD5T7eG3qkby0uBVd+HSz56xOOtvNarwv/fLkNKW7xQATVfe8asmkQVGTf6lOCeXrzDn9z9n+qBjT+NxnmPz9nkGfnl15uLk5E3OaNW4DAUp2EgqtXTRttQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXjqLFnzvKFy2ZWqUJydwAfXWXLOW7t7XPQa9aCVTKk=;
 b=JlHctk5FBu5M7ghlJ1ZKKYhR91Np5ADHxq8Vu0twARKI9t6gQZolYK8HO7TYA+ft6KYSOVGXiWDN6txZnSoIcv6LujQrWl9w+4LfdgczQxlMJlRP/Su4AXPF2LxO6t2ViMCva20YgFUtmNDKt4JMog30LOVBbZGMe4v0ZZTIP3E=
Received: from BN0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:408:e5::35)
 by MW2PR12MB2426.namprd12.prod.outlook.com (2603:10b6:907:10::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Fri, 22 Oct
 2021 17:29:49 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::f4) by BN0PR02CA0060.outlook.office365.com
 (2603:10b6:408:e5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Fri, 22 Oct 2021 17:29:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 17:29:48 +0000
Received: from amd-Mandolin-PCO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 12:29:45 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v3 2/3] platform/x86: amd-pmc: Simplify error handling path
Date:   Fri, 22 Oct 2021 22:58:44 +0530
Message-ID: <20211022172845.2608-3-Sanket.Goswami@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 387264b2-b20b-4141-e8b9-08d995818c23
X-MS-TrafficTypeDiagnostic: MW2PR12MB2426:
X-Microsoft-Antispam-PRVS: <MW2PR12MB242658DDA321F21C568FAC5E9C809@MW2PR12MB2426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46k0Tn67jUBGB8PUM00Ih/V3Qlt24EhpR4TKRUDXTtpnNosMAJ967L1GP9WyRLQtZ/c77JDAKN4WVOHSJi9UtLTn5UeQW4PPSZ0t0mooCZ03XeK+YEaWXHG4Lm2FH8j/jLALKR7TjuIV1Kxbrp2fqsxg2FrEnTqKVG0N3JULOTuagb/RRuEsp1X5xZPmEjeLDQxTjF8oNiWR6s/I7snWPW8MYpWsWiQLwsmcpzh1bIqLNwWP7K8Xd+2nNb9LKf2F6FgRoFgCJ5DaABeayMJUJhFJSgY8BxDpa4YdL/0EPWYAy6ACDR1fXAJ1yvbioWS2tMvpKU4C8GjZdk756EIgPNIDfUe4ZiGbeXl3tcPWAo6IVmhS+MpIOK1qbj8n0x1yqgrUqaE4GuhKXS9XCAwZl+IWiN4czNUYiWtuMkSiDgql75rkw0Ul9/pGYOu/nfUr35u5V7n0hReEd/tXqHHj4wNbA7zjjREjwblyzG7Fg4dow55VHFC25AdwscvKPSsWv02eH3hWqGYFUtBt6p0WOCuPouUiFEvrv2Ph6UPToAoUK7cjH5CpFlA16CUjif0pW86Q030mTogZKV7kdgnrqZdJsFwQjEOC1CuqfUUt/RM2KXWXCGp5HJCK7y6Y634++D7aUXEdZmw03y+/YXoiPPqbWxpFqfMNffpMMG90C5+91mUmswfTjmVqXR5aE2snSIClbPY64ADT+c5545P935NOITx/LmeuPcrtVpAVuOw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(26005)(81166007)(70206006)(47076005)(5660300002)(186003)(2616005)(110136005)(36756003)(336012)(8936002)(316002)(54906003)(82310400003)(83380400001)(36860700001)(2906002)(86362001)(4326008)(426003)(8676002)(356005)(70586007)(7696005)(1076003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 17:29:48.3679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 387264b2-b20b-4141-e8b9-08d995818c23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2426
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Handle error-exits in the amd_pmc_probe() so that the code duplication
is reduced.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
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

