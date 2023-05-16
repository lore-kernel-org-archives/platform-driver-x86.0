Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E60C77B7F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 09:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjEPJRK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 05:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbjEPJQt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 05:16:49 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95F349EB
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 02:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCsLRpRomnsbsKB3wZTw96DsaRlELCc6W85FFeUg/Xd8UUIO6FSeOhucmTPO3whVho1co6R7hMV6+DzbqXXfl0kWdXEqm9v/EDQdDKr+7dyNJSXsIV3OcLZvAqcUmOArpD0/SFP/meB6bbHa3eBuE6yjgH1jZvddUz15LlEiuPe6yZLYjP2lFN1LRRHc7Bal7hIM/VWsE4h48h20MglRdj6VkPW6l4BZIOvcouQN6GwsmffasDDEyg4QN0ykAfyt3Byym5clbKb49mSkRZC896bYBEig6ssDSg8Aosa1gJwPGf/hsaDAsiJpSwydRa4nMVSKnDJacCh564fJejSR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32tq6Ri0rSbi2uZKAapC2ZsnrJAudQHLgLWQbTVPjeo=;
 b=oGCGXi42Xbij0zx724NqJCgb9pNCJKGFGYxPy8+I27y5+WPoWDdCqERmJ6n6yfrLe0L3L6rB2GDJ04jO2XUZ8aRh7MyeKaTiydqhlEzLyXlRul99XITy5SuIgISFLDWubTX+KGo7PqtmXPQLu5auEoATv0+2Gjr4yRnhm6ddG1PRTAOvGEfm6iim3PHQxLI56+gHsL7d0mShf0kVFAAkwnHeuZhnejtFkfq+GRmKzJCrb1Y0MTBs3pFAXweI3nnT3HpepwS37G6YThymfAmbXv3PXD/brSIxOS14yFB5eNoNipvmIdtOFWG0W2/t/ZaYGSHprHJSU6TFIAjIiPFGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32tq6Ri0rSbi2uZKAapC2ZsnrJAudQHLgLWQbTVPjeo=;
 b=C8KsOvJI0biBNaI22xY5ixZi3a2GMg5lmdD6Y0u1V1E4ox0LzpfGBPzaebq2dDax8NBGmGfGDKxjFi5YOlbIfdA5pcXlZVjGCfshTapbWkqGonLQikExpyQUTvjYz8TgWG4JewPOVuRX7H7OPHzTKk2mwwv4L0HvjpmnGssvzmk=
Received: from MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::6) by
 BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 09:13:38 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::48) by MW4P221CA0001.outlook.office365.com
 (2603:10b6:303:8b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.31 via Frontend
 Transport; Tue, 16 May 2023 09:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 09:13:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 04:13:34 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/4] platform/x86/amd: pmc: Pass true/false to bool argument
Date:   Tue, 16 May 2023 14:43:05 +0530
Message-ID: <20230516091308.3905113-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|BL1PR12MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c111ff-3fcf-4fcc-858c-08db55edd53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7YNlYaTPFOKnFrzFZ9so2F8ibSszA26UTuz7MQvGgnqdoJosxJnIxZNDRJrXHzzXF7suOBXap/2VqMdBXhrVWknEzxQwfmfRzZm0TuZ68sj7AAgUrzdTE8KHnvkN4cOYP2sU+6EuLsGQvhZ3lmbHfuLebLcOehtvDQ9XOBQv9DbsLelkBLk92IQ0LnYgFdXjB1OuQAwq2Bw//TA7vke3g4b+07b78hTipOTsml5O5rCJ0gnPLq7oLe9kn73KK3I9sqZHsrnN/I4oznL4foVo5kc/qg3J93vz24UgP5Y5yLhfJsH7UAWmvvJ1Rzy8CB70KOH6LHGY2P4lZad3Y/1eIl0Z3vIgKVi4gseqkz+m02uO5HN6IJPsR0rBhdIOcp4Yi7mEXqY3yMen9AxIPFsAVgARWTnXysh9+OtQSzTzURt9k5Ri5HAuxeevT/Az1s11jANvXer3ZfF+CSibV3NtApbk5TRXuq+fp7Te8wHgU4z5kcurJSdBa0Dn6az2fnnaWU62wyuuRrCplW7HNg2U6mrHgYE4b/pomak2wC1Iyy5RyepE9jJL/IE87MgaktwvikN7c4eYwVxIVcel3SQ8sZG2lLO5CHhg9gsJwwEUS2Eb5UN3Kbq3asRrsMyXkg/VBmU4OTi7pk1V6SGcl8xUa2agY5iDVJXyyUfQe/0m0WWWW+OcG/1GIhq7aEMkI+PRWFArDLmerIUBwCEJidC78iN6BOxrAYJZoelamsGM/u14aKHW6XPXU8XeieyVZpw0SvgTvTxHfwuxzXTt+7x09w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(36756003)(110136005)(54906003)(7696005)(86362001)(316002)(70586007)(70206006)(4326008)(478600001)(40480700001)(82310400005)(41300700001)(8676002)(5660300002)(8936002)(81166007)(6666004)(2906002)(82740400003)(356005)(36860700001)(16526019)(2616005)(336012)(26005)(1076003)(426003)(83380400001)(47076005)(186003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:13:37.4618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c111ff-3fcf-4fcc-858c-08db55edd53c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Pass true/false to the bool argument of the amd_pmc_send_cmd() function,
instead of 1/0 to match the function signature.

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

