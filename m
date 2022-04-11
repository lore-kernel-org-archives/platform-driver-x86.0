Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1407EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 14:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241191AbiDKOk1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240420AbiDKOk0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 10:40:26 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B8A288
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMC/6CVBEkgCKj7W0wmEYj/2G7z4kFDhR2RWdkjFF3qDCnJ/AmprNpo8EdP2KAKEoViPpaTWI4PwkBTSYMbcYGwroJo23n141CNvgRgGlZzGVjsyP72V4WOy6valCv5Z0cOqiQW22m8R0wFEMc5nCys83xsdJMn3cF3teGSHkBnLpPNTcbreiLuNuiKieQLgGBTOu+okYW1mBwVO0vkVPbnYYN2bWfJHFCwU/EV6bKooTdQ0Smreq+m/K++EUhnPvZdT9tPPRmi54pDyH3T2Y3Ca2+RdKhTr0KlXcic3YAV9UaCaynvRiAcksMUQ6MsFiJnGIucMDKo/jNuj5oAEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6TbJNMJWO/0mEnADURtuGqNKLxDg6va4cYqARObc30=;
 b=iSkeFj6P5eMLJvQO8aCzDbF3X13xeUFR2EnZPdkr1DTi2CLtyhXBEN+SwoEHJoq3rgFBZ25i6zXAKdbNSFapBgEimDrmPEA+bDJAqLm+jOY/UI2YlgsOZSZULMC0jNm8+FzWifCCrJeWSfTl6xtjyXEO1B30U9dJDIkltz8pnV3+pJZVSMonJ5ZOVzmu3lkEo4u096mYygTNCKMVlTSLL9IsEZHt0no+y7jZTFU54syyc7nOUsy3WmWg9Rv1qZNGG+y2laWShYlJa7DJT8DdRSk3TxoGd8bJqQEDOLS9uKyiHusu2Bjl8s1INBbDK1t2VbV4ApvvOuINnxueDUdmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6TbJNMJWO/0mEnADURtuGqNKLxDg6va4cYqARObc30=;
 b=cXSXM1EKpiOKcxLNkoTttRAWT0lghEyyvAhTa8mfjBrbSiy/tZLG09xTuMFRmNmbTcOfQUux/cFfd2bHR6AACGmTG4kQuLxxMLesv9k9VzlcuNfZtEm3OScPAjpLP3j7OrX8szy7PQVtq4UryNEvfONhjj7cnqr3w+flALt/0iw=
Received: from DS7PR03CA0078.namprd03.prod.outlook.com (2603:10b6:5:3bb::23)
 by DM6PR12MB4843.namprd12.prod.outlook.com (2603:10b6:5:1d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 14:38:09 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::df) by DS7PR03CA0078.outlook.office365.com
 (2603:10b6:5:3bb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 14:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 14:38:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 09:38:07 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        <rrangel@chromium.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 1/3] platform/x86: amd-pmc: Move SMU logging setup out of init
Date:   Mon, 11 Apr 2022 09:38:18 -0500
Message-ID: <20220411143820.13971-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df385827-4ba7-4653-3b56-08da1bc8e593
X-MS-TrafficTypeDiagnostic: DM6PR12MB4843:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4843F67236F8B211F9A0AE74E2EA9@DM6PR12MB4843.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QY1YbayS/fFsMNMwy+huOvg/YfbNqglWrHqfbFlHMQumR2RJaSA0DsbRP0Z1bcGlKRja0RqBS+n8ztP26Vz94p6G3rFcr0w0kpuq4tMA/9wttF3Jl0URhBEsFig9zTl8pxo1DFlzZn5tE9NhjdjWo6XhQIWLmaJs93c9pZUGjWjKkoqOsV2XMUEyupp2QfZmE4wgAi2daPwO48g6GGuCEtLd0KZcEugehTT+4zRz10HduhizImVWBiaXTLQQ47J45HAaQ8gjCmkWw4ysHMLmEUUa2q6/H/j37uxhg/2MXIB0FiwR6pA//+FscgAP19w/tmoMpPPbwvXp9tkT010W1o9IXO/gcV1umWWj422zUCglPzOw+AFDOEIzVVX27bRFx1R34NqN/h/Z9N6H4PX7ZRdTbo7sDEbDnlC/p840NiO0HUXrN9eNd7BxxbmN2XhnCj1gMsrhF2N5hSOXhT8tx8/na1YUN38iliByQxZlMHwN9IE4dPqeBlMuXASNoWtVS4aXS1n6BVaaED79VPooZzVqJwWh1BHecesmsegpPBpVe4Y44GObCMj1Jn97ZJT+MyvQyYJAMPEsR+4rDMixqVK7Mlv5GxoHFEgQTgq/i4w+fDEOdxZUudq03dTPmmol36yTaizOiQksMIGpcfgBvejcLQlwv33uToaceWOgSJAXBn6ldiVG+NCaYUlc8yfMkbpkd23UZIg2NEpdGum7+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(426003)(1076003)(7696005)(336012)(2616005)(54906003)(16526019)(186003)(508600001)(47076005)(86362001)(110136005)(36860700001)(6666004)(26005)(83380400001)(4326008)(70206006)(36756003)(8676002)(81166007)(82310400005)(70586007)(5660300002)(44832011)(40460700003)(8936002)(2906002)(356005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 14:38:08.4449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df385827-4ba7-4653-3b56-08da1bc8e593
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4843
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SMU logging is setup when the device is probed currently.

In analyzing boot performance it was observed that amd_pmc_probe is
taking ~116800us on startup on an OEM platform.  This is longer than
expected, and is caused by enabling SMU logging at startup.

As the SMU logging is only needed for debugging, initialize it only upon
use.  This decreases the time for amd_pmc_probe to ~28800us.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Drop extra check for dev->active_ips as already validated in get_metrics_table
 * Add tag

 drivers/platform/x86/amd-pmc.c | 47 ++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index e9d0dbbb2887..103ba0729b2a 100644
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
@@ -447,25 +455,32 @@ static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 
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
@@ -634,8 +649,7 @@ static void amd_pmc_s2idle_prepare(void)
 	u32 arg = 1;
 
 	/* Reset and Start SMU logging - to monitor the s0i3 stats */
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
+	amd_pmc_setup_smu_logging(pdev);
 
 	/* Activate CZN specific RTC functionality */
 	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
@@ -846,11 +860,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
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

