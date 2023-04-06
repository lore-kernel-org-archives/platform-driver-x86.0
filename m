Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A394BC761A6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 16:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239682AbjDFQtP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 12:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239957AbjDFQtE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 12:49:04 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F20AD19
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 09:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbHJK14Zs256rHrR7NovEJ9QOvYhwUdSujBNc1Y/3rCimGKoxWlPJFhHCH49pJccWL3lt9gSdpWBsjj0UybFoYaQwWB5QdS7xCknQlaTXgaTc5oznVcFXcvwb5UCm3AbT3jX6bBV1TsyZCblvsWtQSTa4tt8K5tT94DmVvlMKpiVEeJsoKDiwXKb4Bf2JEBTerBnZqWTaUQUwCvzddNpXuG/Rt0DO7zCSE+PQ7bvTfpaViipgXFAuUJDsaK3fvzn4d6m9a9OtRR+6nlAllr9jiZ0os7i3zGB4EK9ujkBHdAanxUNITPP3rkac1u3ubmkh7mSYWwjtsP3+fmmOHhpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wzOR0pOho6eytpSGv6/UQQxBqOEv/e/EcMIHYnVNxA=;
 b=ldOuQEBlycX4nx8uhgj0zmeBA+kYK6p4FUA0zEQAp5a+rWTMOFDmyExAojWFuxn1cCu3dCRXvVYMuQXS+LNMjlAyYE4B7MW2UddOQj9tlXDe8duv7OW9CnqZIPdCOjDICqHFIkYpNoDQinPjnJvpz/PncHFgKMZ0M5oHblU2j9QY1G1DG8/6u/Im86MNNY5X7+z93Y2GC22x8FY+TLJjsPn5D1/SCLGjGoFf0U8Vf1cx/nqwV4XLFEeP/wxWt/5nBjH8trnmeXY39l+KEZbxaOvJ1YRf8S34J+K/2buTRp+utGtGqni08nVYepQrFF1z7lXPa9gmeMk+zi6Crjqxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wzOR0pOho6eytpSGv6/UQQxBqOEv/e/EcMIHYnVNxA=;
 b=e6XUFy/mDH977sa4serQ3tCNGaSnPS27ucUQ47iOLDYqB9tfX2C+wtqxjt+RE0iWqV0do/cZR6wknUhkazfb+Fp62bKQIi4Vlyvm0IbikKUXIggjQOeIs/wc0/bUp5kyuleVYrkAQnajaRtsGPqlTuwiFSAMW1yCeJof9n7esCk=
Received: from MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::8)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 16:48:58 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::78) by MW4P220CA0003.outlook.office365.com
 (2603:10b6:303:115::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31 via Frontend
 Transport; Thu, 6 Apr 2023 16:48:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.31 via Frontend Transport; Thu, 6 Apr 2023 16:48:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 6 Apr
 2023 11:48:55 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/3] platform/x86/amd/pmf: Move out of BIOS SMN pair for driver probe
Date:   Thu, 6 Apr 2023 22:18:07 +0530
Message-ID: <20230406164807.50969-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 9402736e-4088-4bfb-a7b9-08db36bed141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1IQXWN4feyaeOUyoilP75n9ksSRAirwbPnSr/FmtR2j4EWS+YevhC9EpX+iFD4VpMbx2Y3O8hrpyZNxEaWbJsG9jBueqn6EMoWPO4gkKBoul8A6k9MxIBnUhennh6byF5mmcIsVZSg0NN2oEu+ZkXLkGWJKGZtW+BYVdonsWaULlJYjyU8CBRJHpsWPXrirXZlOa5BFyCckWufRSDKOGr8WRxfkywHu8DZffUtatU1O6s/pioVllFsJ6fz31PJIADOO9a7J8tih0+yRLHy20oR8eYD8/Pq3rDgecp00bMXB8ZDIXSQqW7YbSa6GXvo+2WqhNTS/mf9Dcv1Fp6Q4ODloh+PkPH6cmkiGyxnoCVq8inqgNGUukfBjqTsQXWTMZGyMRP7q0DlQdcIWgn7iVzWO0vjKOpqywZzbI1G3zO6ABNTyF16dBVhjLYYuR9Se0O3PyOcvxOqvu4nBM3DZgeAIk37MvnGqPlgUUT+ljr1RSfj204rSLHRyRMBeMWzV71Vt9rC4CeORKR7+CUJaET9XH+j/+Z7D2nWZxY5q1+EBYt3Jxc6VEaXa2m/eFUb8K3OmVjrpurmHpMu2XxCJORVJvTp3AEqs8sWS+UYzRQyFZFizQJ5495BPQggsU1Ia8BJ3sfbm+1LkumY4WO7vIQSMAP2102cDMb1sqCSn92FCZlXWxvkXVRo96LqxlgIlhcLtIwMegCVyJCQ8nBeVDD3zr4eeFGW1WKYW4/8dVOxM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(8676002)(4326008)(54906003)(478600001)(7696005)(70206006)(41300700001)(110136005)(316002)(70586007)(36756003)(86362001)(83380400001)(426003)(336012)(47076005)(2616005)(1076003)(26005)(6666004)(2906002)(5660300002)(8936002)(82310400005)(40480700001)(82740400003)(356005)(186003)(81166007)(16526019)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 16:48:58.3765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9402736e-4088-4bfb-a7b9-08db36bed141
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The current SMN index used for the driver probe seems to be meant
for the BIOS pair and there are potential concurrency problems that can
occur with an inopportune SMI.

It is been advised to use SMN_INDEX_0 instead of SMN_INDEX_2, which is
what amd_nb.c provides and this function has protections to ensure that
only one caller can use it at a time.

Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig |  1 +
 drivers/platform/x86/amd/pmf/core.c  | 22 +++++-----------------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 7129de0fb9fb..c7cda8bd478c 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -7,6 +7,7 @@ config AMD_PMF
 	tristate "AMD Platform Management Framework"
 	depends on ACPI && PCI
 	depends on POWER_SUPPLY
+	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
 	help
 	  This driver provides support for the AMD Platform Management Framework.
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index da23639071d7..0acc0b622129 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <asm/amd_nb.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -22,8 +23,6 @@
 #define AMD_PMF_REGISTER_ARGUMENT	0xA58
 
 /* Base address of SMU for mapping physical address to virtual address */
-#define AMD_PMF_SMU_INDEX_ADDRESS	0xB8
-#define AMD_PMF_SMU_INDEX_DATA		0xBC
 #define AMD_PMF_MAPPING_SIZE		0x01000
 #define AMD_PMF_BASE_ADDR_OFFSET	0x10000
 #define AMD_PMF_BASE_ADDR_LO		0x13B102E8
@@ -348,30 +347,19 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
-	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_LO);
-	if (err) {
-		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
-	}
 
-	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
+	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
 	if (err) {
+		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
 		pci_dev_put(rdev);
 		return pcibios_err_to_errno(err);
 	}
 
 	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
 
-	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_HI);
-	if (err) {
-		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
-		pci_dev_put(rdev);
-		return pcibios_err_to_errno(err);
-	}
-
-	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
+	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_HI, &val);
 	if (err) {
+		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
 		pci_dev_put(rdev);
 		return pcibios_err_to_errno(err);
 	}
-- 
2.25.1

