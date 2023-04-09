Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C8CC77B6F
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjDISy5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjDISyz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:55 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EED62D4A
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaPPytF8OC8yqGD6zcGlvfonB0sG3x+LgJ1R9IGnx0GbZngVnCXwv1fPdwaMpyeh5jlMIK23lk4uNwgP9/UgPysCCJ5btGL9wFxcbRpX3sNalhsd227xk9WXzlBLmqaTPXKhM2VmkDESXtspIc/FU9FO6x+tUGVXo1jX7RSvVm1Fsh9DwinRxt0yvG4oOU4YHVrKTxAE7IlOi/yeedyuhH2MlaCvWYrTYhjj9eVpWgR+kfXGfrEtCvIDgQjokLZxMrM+c27hfr/o7S5Tm4pm/px6ogrWfSKOQcJ/5BspANIVnrWbMiaAwE3CXSwWKeMj0DwDWz9vfRVPHZPK0uAzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNxv1ZJBN8fURxiR6DNoNKib26bs2H739GHGhKRnGAU=;
 b=X/OBIg7OFKNbkOtFOmAkvBHaQBmHI3keTrcKS0w/K43qVoyp23CMSt/P/JO1yXQhvqpgH6q/roYXp1oZt7enpd9MWczJYh++d8JUS22ZOtmv5rZT0wjS8hRb7X/dkB3lV9VlEjVxSnkVMZAPEyIh4TY1TPJf+Wv1/q/vOUxBwhepVJaE1aTD2/r7QDQ8w0nJlXM6Im5BzPnHc7JGAnabEN1Lro/LfY8U9l5QxVqoP0mrbVoZ8IpXLJm8d83aTbbZvOn5Gor8cz+xcbw9zqVyR/4j5psN/Jmq1C0cb7m6jlUKxlwqcGD5ZdzWNNAAzTzb132n0LoFKUtcg0fKlnKQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNxv1ZJBN8fURxiR6DNoNKib26bs2H739GHGhKRnGAU=;
 b=4BDvzJuTNZ/LDDUKJwrjBG2YQNxoj0aWoYpbtgF1UvCDWIBObjp/nvlriqF8kk2qOJTamizlVhFD1Nga6yaixXHiVI3aerVgQrGP06ZJYXAbWTCiYQCcNRVmFV3IWXw9qgHtmVLPiku2JMY0wEX0s/Z3ZUOHDQiAPwYa03Y4/lM=
Received: from BL1P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::24)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Sun, 9 Apr
 2023 18:54:50 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::48) by BL1P223CA0019.outlook.office365.com
 (2603:10b6:208:2c4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:49 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:47 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/8] platform/x86/amd: pmc: Utilize SMN index 0 for driver probe
Date:   Mon, 10 Apr 2023 00:23:45 +0530
Message-ID: <20230409185348.556161-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 30692fb5-ee1e-48f8-1942-08db392be572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+mzUIfnrKN9/V/syjcuzxuFjEKpvWsMno3+AGMGmI1rsZb0FOk4IAhQk3FV+ZZefx9DzA3kbicgy2kD7KgbbGaysnz0WhJ+WAl2lyyaU+Trtuedmf4gtR7njlakxrSeP+t2DKWXh8uY8wJvcaDQnpUZOUTKQSjTTxNETsJ8edyc/AGCed+zG3KgCR9u/wsW3jYjJ6YvWt7g9wtTuIrBljxhD4a6eoNfctY643tJBrsiYH8ggRqiSJWgeyF2IauGOQumW/dFWSdcg1Pz83zR1xP2FWmR/IGghk+NgizHNKiQ/bFN0vHcGkTyUSoSDj5mDfmvt2PenZw9KMxXFCACb8rjxc+vrdQbd64AsR5f/2nKMhCD5L52/Lzml9ZF7zV6hrb0Fg4CKNh8Y83IWVyAWwurjFZjxw+qzjgnQVzfVqxR7PkA4E2ko4pWc/h3y2A277vKBwQfSvfy2G6p0tZ6f36kHTafrwHxwrNI6O/YFLvZry+0wZycBto4ChHSaOaTijKsvyI5B3+d+LdpmOzxh9dKGWz2iVk+5JCWJK6ABRiv22scdD1WQlCf/9dN8AsfzNeUdlspVyn0+wmB5rD0icDBkyR+EA2VgzJmaQDKBgpu1a2Y/Rm1R/tR6W6kwBHNPJi/238CXp0HxopQZQzh2M7fhCbdt7HAnhsnCgI0qFNMtbWrYM6k0aFuMNzpH4eUmBg5ksXYALzDopI4efJ3X1H72bObWDRIqohwZ+9sGmY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(36756003)(86362001)(2906002)(40480700001)(2616005)(7696005)(36860700001)(83380400001)(336012)(426003)(186003)(16526019)(47076005)(1076003)(26005)(4326008)(478600001)(70206006)(70586007)(40460700003)(82740400003)(41300700001)(356005)(8936002)(8676002)(81166007)(54906003)(110136005)(316002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:49.8424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30692fb5-ee1e-48f8-1942-08db392be572
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The current SMN index used for the driver probe seems to be meant
for the BIOS pair and there are potential concurrency problems that can
occur with an inopportune SMI.

It is been advised to use SMN_INDEX_0 instead of SMN_INDEX_2, which is
what amd_nb.c provides and this function has protections to ensure that
only one caller can use it at a time.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/Kconfig |  2 +-
 drivers/platform/x86/amd/pmc.c   | 23 +++++------------------
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index 2ce8cb2170df..d9685aef0887 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -7,7 +7,7 @@ source "drivers/platform/x86/amd/pmf/Kconfig"
 
 config AMD_PMC
 	tristate "AMD SoC PMC driver"
-	depends on ACPI && PCI && RTC_CLASS
+	depends on ACPI && PCI && RTC_CLASS && AMD_NB
 	select SERIO
 	help
 	  The driver provides support for AMD Power Management Controller
diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 71dc8c80a79a..b7f736e7cd0e 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/amd_nb.h>
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -56,8 +57,6 @@
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
 /* Base address of SMU for mapping physical address to virtual address */
-#define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
-#define AMD_PMC_SMU_INDEX_DATA		0xBC
 #define AMD_PMC_MAPPING_SIZE		0x01000
 #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
 #define AMD_PMC_BASE_ADDR_LO		0x13B102E8
@@ -992,30 +991,18 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	dev->cpu_id = rdev->device;
 	dev->rdev = rdev;
-	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
-	if (err) {
-		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
-		err = pcibios_err_to_errno(err);
-		goto err_pci_dev_put;
-	}
-
-	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
 	if (err) {
+		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_LO);
 		err = pcibios_err_to_errno(err);
 		goto err_pci_dev_put;
 	}
 
 	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
 
-	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
-	if (err) {
-		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
-		err = pcibios_err_to_errno(err);
-		goto err_pci_dev_put;
-	}
-
-	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
 	if (err) {
+		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_HI);
 		err = pcibios_err_to_errno(err);
 		goto err_pci_dev_put;
 	}
-- 
2.25.1

