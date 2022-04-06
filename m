Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA0DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Apr 2022 21:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiDFVaU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Apr 2022 17:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236988AbiDFV2n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Apr 2022 17:28:43 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2064.outbound.protection.outlook.com [40.107.212.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7070A237033
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Apr 2022 13:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQtdRWeIfEuzhvZtyzUyI7WnxNH29Eq1EsYx2BqCxaZO1nTLKKHzXeiFBlPRfSZE751w83vDQjUmcyjCL0YDuGz8i1NXJbFDhXaVQkyVpHb1/aemSkepw621+XaidoupDGc6+9bpogwZwTxWoJarVK9M/m0GO7tlFdl5Ib4KOUr4olTsxVLCcyzUvoC7N7Keia9hKMR1zpYugsTAXAb+XdN/fOr+6bT24qJLq9rUNwjasgLNqB0OY4P8bUlIhmFe/1QaEpKN9lmv2IyzLet4L6b4eDsjUjGZroMRn4fDLIwHLOSz80IQbMauwRoO0haVR1kSpupEcBXTvN3oXg5Wvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVFFrqOteIOhvVi3uECKmrgQJhU+WzBfQ/NbXa11FPE=;
 b=Xow/yI223FnAOAILgfJpitgY0zWtTOBIFGQjNM/HgOMKwcbzWcnBkzQEFnAVOLp4o1XcrIlRp/a3J+amRjVcsAhBgR70XlJYURXE3yBUXZpzLQSFua4sY8/Du1AwaL+xr6UrtzQPNNfIMFofuQfKxnk5DtWgi0Qng/mNJi/nyaxEjikx2HpG9PXo6Qb99SxHbdCKTpjCASwruQASLnISTDNfdusf3DHJwOPq1/28SL4IU0oeJFQ2KWV4Vdu78NeC0kAjJr8yHmtxhn8GzsEgREDAw8oERIDvB1GQgU7DqHobcj1Yg0+tRnLa5X3m9lEIBfHhvjqfbKv8tffE2v98ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVFFrqOteIOhvVi3uECKmrgQJhU+WzBfQ/NbXa11FPE=;
 b=HJeu/ysUwLwo4a2zyiVjCGULavQJsCXu5Ywo7yZc8M42YzOexFmtOFZBKxiID3KXC2XKCp1TOT3AjAGufmVfvcewvdY2FHRC5+8DUGI8VHl60u2wHO7pQPoT7XpdgaNNmZIgggPwYdlLfIDKQ3PAswcxbe5lLXYTBXI/NuauSPY=
Received: from DM5PR12CA0067.namprd12.prod.outlook.com (2603:10b6:3:103::29)
 by DM6PR12MB5567.namprd12.prod.outlook.com (2603:10b6:5:1ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 20:27:06 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::e1) by DM5PR12CA0067.outlook.office365.com
 (2603:10b6:3:103::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 20:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 20:27:05 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 15:27:04 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        <rrangel@chromium.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/3] platform/x86: amd-pmc: Move SMU logging setup out of init
Date:   Wed, 6 Apr 2022 15:26:53 -0500
Message-ID: <20220406202655.10710-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406202655.10710-1-mario.limonciello@amd.com>
References: <20220406202655.10710-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1c64bc0-6800-4d9a-267b-08da180bd115
X-MS-TrafficTypeDiagnostic: DM6PR12MB5567:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB556708C824E13350A47B1C35E2E79@DM6PR12MB5567.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Fe/a1Y5zeo258K9gp89BE2crufHRwqFXhr7Q5q49817SpMMelapH18oAQ/yL0i0+xzUetYr4c5FQTH9AzNABHthFTlIL3ajmgYnOTXSmKKB0/D0Haeb9trdZVl7DuuROzq/7iJSVVrXbfhu5e20cOnyLzrbCc3ZpyY5wxe/klPwjQXvzTg4XecviVrbGEow4v+j6iXJCVg/Vh6KCCOqb9obdXK/NsTTI28fzETeUIFUTk2g6KK5KP7GG39Vn1RXk1cTr3qCTO1RyrdBc9Ujq0jkuzQSRLQoNGVQFI4zQ6Cqcg8eNbi4Upx+IzjvQzXlb31gG4DBMIMPv2BC2VmjCOoVgriW/lpu222+EKQQkozGV2pANhgkIi2lIM27qnl9EJb8YT0m31J+pYrwDcnfDhIE8qn40XMOjR0PYkvlPDK+I6nog43vc0I0RhylyUTtf3WsmteB3DHZJ2Ghwf9VHq24d1pM2jV+XByDRRTmAF8Dnpmdl+5Qc6ajNcaCf05gfKDHlWTpepaVHWpxYdsWlyfjr+aJ8CpnYjeRhh6j9QMUg5V8DoU7MFQvNvgAx0bOwakN0AwdukEqYrZfg5Fscu7Nu/XNVv+xcxD84+oN8TnzmDYBSOJGy88pxBas166WSVuoYp9Tto6MQdfExrZhhsG+OuV3rLfNN8m754HYAW+Pv6PfmiAJh3MpzW+izarFIaBpzT61BHN7wlJsmsDu5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(316002)(110136005)(2616005)(70206006)(70586007)(5660300002)(186003)(26005)(1076003)(36756003)(16526019)(54906003)(8936002)(83380400001)(81166007)(6666004)(86362001)(4326008)(8676002)(508600001)(40460700003)(36860700001)(336012)(356005)(82310400005)(7696005)(426003)(47076005)(44832011)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 20:27:05.6783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c64bc0-6800-4d9a-267b-08da180bd115
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5567
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SMU logging is setup when the device is probed currently.

In analyzing boot performance it was observed that amd_pmc_probe is
taking ~116800us on startup on an OEM platform.  This is longer than
expected, and is caused by enabling SMU logging at startup.

As the SMU logging is only needed for debugging, initialize it only upon
use.  This decreases the time for amd_pmc_probe to ~28800us.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 54 ++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index e9d0dbbb2887..28e98e4649f1 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -162,6 +162,7 @@ static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
+static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev);
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -319,6 +320,13 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 
 static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
 {
+	if (!pdev->smu_virt_addr) {
+		int ret = amd_pmc_setup_smu_logging(pdev);
+
+		if (ret)
+			return ret;
+	}
+
 	if (pdev->cpu_id == AMD_CPU_ID_PCO)
 		return -ENODEV;
 	memcpy_fromio(table, pdev->smu_virt_addr, sizeof(struct smu_metrics));
@@ -346,6 +354,13 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 	struct smu_metrics table;
 	int idx;
 
+	if (!dev->active_ips) {
+		int ret = amd_pmc_setup_smu_logging(dev);
+
+		if (ret)
+			return ret;
+	}
+
 	if (get_metrics_table(dev, &table))
 		return -EINVAL;
 
@@ -447,25 +462,32 @@ static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 
 static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 {
-	u32 phys_addr_low, phys_addr_hi;
-	u64 smu_phys_addr;
-
-	if (dev->cpu_id == AMD_CPU_ID_PCO)
+	if (dev->cpu_id == AMD_CPU_ID_PCO) {
+		dev_warn_once(dev->dev, "SMU debugging info not supported on this platform\n");
 		return -EINVAL;
+	}
 
 	/* Get Active devices list from SMU */
-	amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
+	if (!dev->active_ips)
+		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
 
 	/* Get dram address */
-	amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
-	amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
-	smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
-
-	dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr, sizeof(struct smu_metrics));
-	if (!dev->smu_virt_addr)
-		return -ENOMEM;
+	if (!dev->smu_virt_addr) {
+		u32 phys_addr_low, phys_addr_hi;
+		u64 smu_phys_addr;
+
+		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
+		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
+		smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+
+		dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr,
+						  sizeof(struct smu_metrics));
+		if (!dev->smu_virt_addr)
+			return -ENOMEM;
+	}
 
 	/* Start the logging */
+	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
 	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
 
 	return 0;
@@ -634,8 +656,7 @@ static void amd_pmc_s2idle_prepare(void)
 	u32 arg = 1;
 
 	/* Reset and Start SMU logging - to monitor the s0i3 stats */
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
+	amd_pmc_setup_smu_logging(pdev);
 
 	/* Activate CZN specific RTC functionality */
 	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
@@ -846,11 +867,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 		goto err_pci_dev_put;
 	}
 
-	/* Use SMU to get the s0i3 debug stats */
-	err = amd_pmc_setup_smu_logging(dev);
-	if (err)
-		dev_err(dev->dev, "SMU debugging info not supported on this platform\n");
-
 	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
-- 
2.34.1

