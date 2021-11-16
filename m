Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F62C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 07:41:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E34A619EC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 07:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhKPHoO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 02:44:14 -0500
Received: from mail-bn7nam10on2061.outbound.protection.outlook.com ([40.107.92.61]:41728
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231401AbhKPHn7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 02:43:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsiKDEBlsE7goP7ezJBle0S2+cLOXM06m/TgFkE69nqRTRx2ys+fFrOzL/CGOT8ca/mTE7Bm/BoEYU5NAoNTh6eudLRpBzxYlhr/HKF9uSyW0PQXNfvlafu6UJRDRwtyz1Vms8HfRegVZQt6eep9jtIM9romW+5dbI0RG//f2sEJwLn3ahnsVwjGobwrRG+HMu0caC9yfudIbeTuXNiWbVir2qSk+U0RFvpsqtHUCuXT4wYecWdTzHoEAxToRcZ9Zp29Dep+6url71p3wOfbtFeb3FvpgQLmMXeEi1b34S3/79kRpMkZYGcGGtwKRcp+MLyWg952YgHB1+Kdjeh5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTavOjBIXZ91wkmShFKozvoYqwKxsnTofa2HKyIDTrs=;
 b=CZ8KBjr0qwNrmWzMJ6QQb202zNXHWlSu8aIOE8UxmN3XaYR1v1IDEqnkmW0WnjmrApC6Kc6A3v2lq13UOuTRab6GSQ+itDSPKwIAiKHfyIWoKMFcII0hgXSDcf8zxhMkeRKlksHIdjgAuun17j11f7REbcsrHxS+Dg9ZitrbQ3OdNceiHzKTy9jWz6eo2Py8Xd0f1LmMVsq/Y6utvHzjB2TWbC5XAX5RTWADzhzgEO8v+/TDleU4JzLmu39+lUv7uNGDPTMDq9pJdhFLlnAlhBKpykNbB4PBLJ9OUn1fdNgsLb4P8b/eLl6bPZszEuYLbGv/OEHiXcezgJWii28ptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTavOjBIXZ91wkmShFKozvoYqwKxsnTofa2HKyIDTrs=;
 b=St1GYOK28OSr1TTO5bbtVlCyRRJgQpAbH3UwD3pvo7bQKiei/ewaJzzmCSLH+wUpxE+ra0QVXJjTRbUpfB5pS57U8wmpH1zIhURvlrOgPmMZNgpPe2PUtGU0OxK8DTcLdbixXoww3qLAb2oULUY1C8sJry3AlAPHDad8k6PInvo=
Received: from DM6PR02CA0108.namprd02.prod.outlook.com (2603:10b6:5:1f4::49)
 by DM4PR12MB5199.namprd12.prod.outlook.com (2603:10b6:5:396::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:41:00 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::d8) by DM6PR02CA0108.outlook.office365.com
 (2603:10b6:5:1f4::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Tue, 16 Nov 2021 07:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 07:40:59 +0000
Received: from Mayan-RMB.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 01:40:57 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 1/2] platform/x86: amd-pmc: Introduce message port argument in SMU routine
Date:   Tue, 16 Nov 2021 13:09:59 +0530
Message-ID: <20211116074000.28626-2-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074000.28626-1-Sanket.Goswami@amd.com>
References: <20211116074000.28626-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dfddfc6-d960-456b-8a8b-08d9a8d46f1b
X-MS-TrafficTypeDiagnostic: DM4PR12MB5199:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5199438F129168E5FEBC334E9C999@DM4PR12MB5199.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rw9TCCQY6OlYMf1ng4QcMLy+hDCRM47EJFwmXFHpqeT3RJ7tt4UM0+BmzgMAPh42jINbisuO+ziggqAAAyCLm5f8VkMXAsz8tai8TQICe96piDmFPa+t11bz61y3C2yQ0TKkPjO56AWRMtzuLNfFIXL5w/ObCk/0NknKZOtEQycncX0nLcNXiQiVsTrmfvtsvI4AT4eQY6BMf3VbZ89qNCvAIlztHxhULphfYsbIl9oV06TLoBLMDfxh02NTyGHY9FC2wWLvjUofErXVoUayzaFxkkbsfwc62QK9c1vJxHQRhGc8xrmBdxEvE9I6gcaCdgIgTRtvGFPugPWiO8d6Y2ZL5nwlBMUGVZanyY73YSIzLVreRZa7Avt/YF9BAIvcenjCIEV6JfrL0HCmgfnHj6klqP1eeKf9SyjuCZ6g90Ok4XisrbVs4wuManlz79eGWfgEYvIrtqOrfKSf9A6V3wnKz/1LiTjpwo965c9Y1R8Rrqngu9MunaDSLsVVsWcKqZLGWU9M+SrCKisV+1d0vy6ouUfi7bxt93RCXPsF9Pp1gkjQ6olG9REMB2EbtbZTVCutiOlv9SohEbWMx9ehj/b5/nrQdpgoWFA2BkMLiLFFsOe6A+H2/lsTGuzPDLivCf8bemEieKMUBX4uX36mqwS2s85drXtjp4COTQyMgXte1uvBHFlcaB8wtsdB07xH2uJdDI6h+xSoJgI136GBrQdNWsLLT16GE9AUrEeDp0c=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(54906003)(8936002)(5660300002)(2616005)(15650500001)(4326008)(2906002)(426003)(336012)(47076005)(316002)(86362001)(110136005)(508600001)(186003)(36756003)(7696005)(16526019)(82310400003)(1076003)(70206006)(70586007)(36860700001)(81166007)(83380400001)(26005)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:40:59.9165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfddfc6-d960-456b-8a8b-08d9a8d46f1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5199
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a msg_port_stb argument to amd_pmc_send_cmd() function signature to
distinguish between the components using the different SMU ports.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index a39354ea96c4..5769d009033a 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -41,6 +41,10 @@
 #define AMD_PMC_STB_PMI_0		0x03E30600
 #define AMD_PMC_STB_PREDEF		0xC6000001
 
+/* STB message port and Parameters */
+#define PMC_MSG_PORT_PEP		0
+#define PMC_MSG_PORT_STB		1
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
 #define AMD_PMC_SMU_INDEX_DATA		0xBC
@@ -140,7 +144,8 @@ module_param(enable_stb, bool, 0644);
 MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
 
 static struct amd_pmc_dev pmc;
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret,
+			    u8 msg_port_stb);
 static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
 
@@ -176,7 +181,7 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
 	int rc;
 	u32 val;
 
-	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
+	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1, PMC_MSG_PORT_PEP);
 	if (rc)
 		return rc;
 
@@ -370,11 +375,12 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 		return -EINVAL;
 
 	/* Get Active devices list from SMU */
-	amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
+	amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1,
+			 PMC_MSG_PORT_PEP);
 
 	/* Get dram address */
-	amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
-	amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
+	amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1, PMC_MSG_PORT_PEP);
+	amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1, PMC_MSG_PORT_PEP);
 	smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 	dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr, sizeof(struct smu_metrics));
@@ -382,7 +388,7 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 		return -ENOMEM;
 
 	/* Start the logging */
-	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
+	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0, PMC_MSG_PORT_PEP);
 
 	return 0;
 }
@@ -401,7 +407,8 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
 }
 
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret,
+			    u8 msg_port_stb)
 {
 	int rc;
 	u32 val;
@@ -529,8 +536,8 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	u32 arg = 1;
 
 	/* Reset and Start SMU logging - to monitor the s0i3 stats */
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
+	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0, PMC_MSG_PORT_PEP);
+	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0, PMC_MSG_PORT_PEP);
 
 	/* Activate CZN specific RTC functionality */
 	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
@@ -542,7 +549,7 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	/* Dump the IdleMask before we send hint to SMU */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
 	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
+	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0, PMC_MSG_PORT_PEP);
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
@@ -559,12 +566,12 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	u8 msg;
 
 	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
+	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0, PMC_MSG_PORT_PEP);
 	if (rc)
 		dev_err(pdev->dev, "resume failed\n");
 
 	/* Let SMU know that we are looking for stats */
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
+	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0, PMC_MSG_PORT_PEP);
 
 	/* Dump the IdleMask to see the blockers */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
-- 
2.25.1

