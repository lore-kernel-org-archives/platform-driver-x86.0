Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0BAC77B7E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 14:20:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241604AbjEYOUA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 10:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241621AbjEYOT5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 10:19:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA9F189
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 07:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8V1HoMSId71jBMq3+UoKpns9vfpkOQNUelCi9zWVv/z7FSEqnpZmC3tkhTCQdG453f0Rrq2ZOGert94uhWb6a2kg8UiXQJPZAq6HiVIiMXXUawVRGqLbZ17uOpzXL/mdxWHOxAboUwyE2TiPwpsy6iI2KiDgIW8/I6DhvKvlMdZ1pZOYScmdQxV4yHxQprvc40eLPSOEq6n+yw4H13XbK3RxgVhxwKI5cxyLNsY292Z4t1XjuN+7WMoe7rO4gQCvAbyOruH3k3Tze8rsVfQ+rMFpQg+dgoTCnlEUuPYKlPkXT49/wb9nHDtvN5YTnNZ7XXXlnDLMZF/2Qignnkc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl3MViNHh8ZVa0aRlqOeFKQehXuanyJQZkuJgJ/VHeo=;
 b=VVci01ax/ML0GEZ3DCk0/LnIV4gzL2f5TkeHZi+yLXs52Xz3M7CEoHxjPiwNy1GawnXSaDSbYfWwcArzhTO+Wy7c5AbuflHIlhk5hsYzwiHbkAOdPNFhCAqt+ENU2NFKS2q+ECbCQroUmJ+d/CSeyD+IYOSpu1mno9mGHmNsD9DAVmRP10SQ6LfpYp6246kFWdxUFT7Z1/+yut96qI+tQWclQcOPHcGc7jXjE6JMEcmN84vezNTdujg+RBF/w53Upxwm9dj8/XTyL8H+zy1vnjEnUGovZq9GN4OqwCQNaau6tui+U9/f7tr+BjH0Lz6jcb58H5CH0YNisIHV2fQroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl3MViNHh8ZVa0aRlqOeFKQehXuanyJQZkuJgJ/VHeo=;
 b=yjihll9EznWQi7nyiJBVeK6xSGC2TMLAf5mNHWHZ+Dwkz8UECFf3bVju5FYpiE7NvI4V/TwRiTNgLUpRFCrs1ZGYXzzeY2WjjK8bGsr/Bucfih2Rn4GxU3unlllcoQ05KqYtL1q0xBIcnlRI+iGUEKAdqP5B0a50emkiLr1zslM=
Received: from BN1PR12CA0008.namprd12.prod.outlook.com (2603:10b6:408:e1::13)
 by PH8PR12MB7182.namprd12.prod.outlook.com (2603:10b6:510:229::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 14:19:53 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::79) by BN1PR12CA0008.outlook.office365.com
 (2603:10b6:408:e1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 14:19:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.30 via Frontend Transport; Thu, 25 May 2023 14:19:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 09:19:51 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v5 1/4] platform/x86/amd: pmc: Pass true/false to bool argument
Date:   Thu, 25 May 2023 19:49:26 +0530
Message-ID: <20230525141929.866385-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
References: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|PH8PR12MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a807382-c3c2-4723-ed37-08db5d2b1bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRc66tDFuBwWEey3dtCnlHg381pIbafsg7DaMXlauDbR80EgCIYGlKzNHJTee+q9bVdNltqWh/hsH5b7TgNbjMX4PPyo9GEvyoSdvA5AD6ef7Gy/eSG05/KPgdAMHF9d6QApc8zc3VQoEVniDZ1Qh4b/FIGmwSNUzlqKR8fvbawNagnc4z0qR7If6cU+X5uF2dyqFCmZ3SB/emIeSBDqcY4fd2+i8hPHtzDMDJHowHBfIC3JjK3oK8mU6RereyCHRcU8U+KJx5KPvSpQDChQx5HbUj6tt+UiSib40Zc384HTfy9A1S1ejxgqAIeq0l9NINGzalT6cCFStmrXk1Mi5NXWn7PjZI1CU1m5M7gmKAA7zU+AhX2xqQFuh+5B2joMH2FlCkAhsQTeILwzVxSxtcy/9gmUEzZS37fciCcYlixrDucQjiVjjYY5vFWgKxeqWsXGhblSAOCy1TB3MawJtkyRIn0TBUSmfvZGGC5x0Sh7X8udjQPfKZ78o+CUoj8K81GbD0I12Smb3XPgAdhQh/EiruCyWQFX+miSFd+heIRnchQgKhdnDDBCGavK55vEZT4OEUBtARD4pQ7eaPrpoSiCvOdLL+Yw1N2YM9PoEn+l6LQCjPaeuNsR2W6Fpg7wEsHj80MU61j9f2dCGB4alv2BiU2BNPz+G/oal6vmjnfygl4VKWh89ZJAjGaloOpz37DwlnzGGUaQBcQuJ4pr5beOPeW3j6BUD27EuNFW9b5M4RF0A8HkPxPcxSVTufpmLasf5CX+D2BkVHu064HPpQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(6666004)(41300700001)(7696005)(426003)(83380400001)(26005)(66574015)(82310400005)(336012)(47076005)(36860700001)(186003)(16526019)(1076003)(2906002)(86362001)(2616005)(81166007)(356005)(82740400003)(40480700001)(8676002)(5660300002)(36756003)(8936002)(70206006)(70586007)(4326008)(54906003)(110136005)(478600001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:19:53.5028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a807382-c3c2-4723-ed37-08db5d2b1bdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7182
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Pass true/false to the bool argument of the amd_pmc_send_cmd() function,
instead of 1/0 to match the function signature.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 427905714f79..f28c295b47dd 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -261,7 +261,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 1;
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, true);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 	if (ret) {
@@ -317,15 +317,15 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 
 	/* Get Active devices list from SMU */
 	if (!dev->active_ips)
-		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
+		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, true);
 
 	/* Get dram address */
 	if (!dev->smu_virt_addr) {
 		u32 phys_addr_low, phys_addr_hi;
 		u64 smu_phys_addr;
 
-		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
-		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
+		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, true);
+		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, true);
 		smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 		dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr,
@@ -335,8 +335,8 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 	}
 
 	/* Start the logging */
-	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
-	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
+	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, false);
+	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, false);
 
 	return 0;
 }
@@ -377,7 +377,7 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
 	if (dev->cpu_id == AMD_CPU_ID_PCO)
 		return -ENODEV;
 
-	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
+	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, true);
 	if (rc)
 		return rc;
 
@@ -794,7 +794,7 @@ static void amd_pmc_s2idle_prepare(void)
 	}
 
 	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
+	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, false);
 	if (rc) {
 		dev_err(pdev->dev, "suspend failed: %d\n", rc);
 		return;
@@ -829,7 +829,7 @@ static int amd_pmc_dump_data(struct amd_pmc_dev *pdev)
 	if (pdev->cpu_id == AMD_CPU_ID_PCO)
 		return -ENODEV;
 
-	return amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
+	return amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, false);
 }
 
 static void amd_pmc_s2idle_restore(void)
@@ -839,7 +839,7 @@ static void amd_pmc_s2idle_restore(void)
 	u8 msg;
 
 	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
+	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, false);
 	if (rc)
 		dev_err(pdev->dev, "resume failed: %d\n", rc);
 
@@ -899,13 +899,13 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
 	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, true);
 
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
-- 
2.25.1

