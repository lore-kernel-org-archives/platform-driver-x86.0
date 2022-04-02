Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08709C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Apr 2022 23:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiDBXNG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Apr 2022 19:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiDBXNG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Apr 2022 19:13:06 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC027F2E
        for <platform-driver-x86@vger.kernel.org>; Sat,  2 Apr 2022 16:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2Uk/XSrzUDlXt6czYq/lsSqFThZnL8NoNR7U3BhALSww94XawE+G4CZqLYodpWn8BtLCwbaXiI077j8mEL+SXwpnPyQ1KjtJ6+gzIXf4fQDiIbHst0WDtFkJt+BpC26GY1VMtlWtFf7d4bdtRjbKISwI3+jOd9y/f+kPTwlPowT12Wz12R4NPCRHNlM3hMom6cNKgWgQ3UFqJagJY31vgLMhS7mfz0mvD6g6OIjlOHLUNl8AB/zovLtr+X2NFRbwI9IzYGWo7CXTN6NZkhohovacOTISP+JYyVo+5Rbw+0wMmz5QACsGYNn0UmVVGKMtkS/ZRZ0goR+xQri9DlZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWbx2prfnVVcOVBs6ZTpqfibjojvMy+OtWE5AHV68cA=;
 b=f8J0ofX+Liqixueup+lKmwxePoCWk66g98zBI+Ze1saK8EVyL2/IgrEf0cPxj5mYlO+d1nzrXjWehRXYYtP3InUznGmjPZsTTJp9kqMscVfktIsVL6xol/DcDenGxaQqUOkNwHBCcXI3UZlGlQyRItV72Vw8v0gmNRAh6B9fWgz8iJ6lHPRKvL0upsiXPiZ7uoUJLCFQtWjbEHW56CVHuBUoWuVUNenCy47lN8/ekzTsSpXvAivswHCNLxoWEfGKHGMrUYuycp+NRCDq4lQQGvxoZR8JjdZc0X8716JCJeA1KYnwcxuO8/ZiZMwnpipdlKe2myehS+S0iHrB4ZX/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWbx2prfnVVcOVBs6ZTpqfibjojvMy+OtWE5AHV68cA=;
 b=gVLCU418v9drSynRZ10dYO/f9BjSSReorvjec4LWj9H+B9FjVCvfAErytPkr96g55TksEBy/Isru+qTOvSwd7aO1XSvPfAzWTK8VWk07+Y5Q4S6sq+kXyJ/VJtR8BBY38vc+v5XM9xFuTj3Br2WRLMNGoEvFZPa8VZy2pgb9t/I=
Received: from MW4PR03CA0223.namprd03.prod.outlook.com (2603:10b6:303:b9::18)
 by DM5PR1201MB0202.namprd12.prod.outlook.com (2603:10b6:4:4d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 23:11:06 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::91) by MW4PR03CA0223.outlook.office365.com
 (2603:10b6:303:b9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30 via Frontend
 Transport; Sat, 2 Apr 2022 23:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Sat, 2 Apr 2022 23:11:05 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 2 Apr
 2022 18:11:03 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] platform/x86: amd-pmc: Fix compilation without CONFIG_SUSPEND
Date:   Sat, 2 Apr 2022 18:11:22 -0500
Message-ID: <20220402231122.3877-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46e3461f-ebf9-410c-4e36-08da14fe10b6
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0202:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0202F571A080D7A5811EE897E2E39@DM5PR1201MB0202.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSqAfqgfYzDbguDFi+1KKp2+zIvtga98BEvD7IevVfmdB4WaVipGFwFNPDgDl7euGlEpfrT3DVqtLsKO2YDJ8qlojr1ZaNQ4BWdLrjNmD+IXHX9YtUnqXRcCSffSuSMVoirhRdfxrnanWMZZpqWYbp1hp2asSR7iALUdA7XZ3m65ba1DHEz0R4DDcQ7KwinuYrGXun0grz/u8i5Fq7/0dDIlVINmHbp5DnoE+guYMd+9AwqZ7uGXvyv487UgwtpRp3sfCkXcclKR2Vz8pwnMvSfXzaIwUo7Uqm0x9OpeyMiknAwPEg1AVBruXGisZ/e+NprmCAMaEA24/S4nrjMIxnGP0rtWy2vvNpLkGyuZDZfVC6FUF2VM9MkhBrdqzVOxrmO52cs8U9K1+/cL3qebNKntNfiemvzmnzrSAh4YVnmrB24nL9NP6pBYVKIOHTP/Qf1VL8E7FpvXzszL7Mz1bYSIcwfvWjo5FQwFHr/HqJSBPjn4bHnjguNFMe//sWCRb5cIxQaM0DboP1Aokb/gt/wP3bzhm6jtCswsDVmX1tb6Td50RJPIQUjyHOiWd4LNrXQVZzIQh85euMEAgCz345i6AisihwSGoQMlwYX7tvB1ABgVh6Y5ua30QRNCdprYULtGA11hLdYWwOcY+13MUH5AZv4NdDtHfQ8iXYCXufJ9uhFP5tNbMdW3pQur/xgXDH2+oYSfip9b7vVjL56bFg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(8676002)(356005)(70206006)(81166007)(70586007)(86362001)(82310400004)(40460700003)(2616005)(7696005)(8936002)(2906002)(44832011)(5660300002)(36860700001)(6666004)(508600001)(110136005)(336012)(26005)(47076005)(36756003)(16526019)(186003)(54906003)(426003)(83380400001)(1076003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 23:11:05.9103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e3461f-ebf9-410c-4e36-08da14fe10b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0202
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the
suspend process") amd-pmc doesn't use traditional suspend resume
callback anymore but relies on functions only created declared when
CONFIG_SUSPEND is set.

Check for CONFIG_SUSPEND and only use those functions in those
circumstances.

Fixes: commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the suspend process")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Fix warnings on unused stuff when no CONFIG_SUSPEND too.

 drivers/platform/x86/amd-pmc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index e9d0dbbb2887..fa4123dbdf7f 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -160,8 +160,10 @@ MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
 
 static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
-static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
+#ifdef CONFIG_SUSPEND
+static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
+#endif
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -325,6 +327,7 @@ static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table
 	return 0;
 }
 
+#ifdef CONFIG_SUSPEND
 static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
 {
 	struct smu_metrics table;
@@ -338,6 +341,7 @@ static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
 		dev_dbg(pdev->dev, "Last suspend in deepest state for %lluus\n",
 			 table.timein_s0i3_lastcapture);
 }
+#endif
 
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
@@ -569,6 +573,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 	return rc;
 }
 
+#ifdef CONFIG_SUSPEND
 static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
@@ -694,6 +699,7 @@ static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
 	.prepare = amd_pmc_s2idle_prepare,
 	.restore = amd_pmc_s2idle_restore,
 };
+#endif
 
 static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
@@ -733,6 +739,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	return 0;
 }
 
+#ifdef CONFIG_SUSPEND
 static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 {
 	int err;
@@ -753,6 +760,7 @@ static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 
 	return 0;
 }
+#endif
 
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
 {
@@ -859,9 +867,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	amd_pmc_get_smu_version(dev);
 	platform_set_drvdata(pdev, dev);
+#ifdef CONFIG_SUSPEND
 	err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
 	if (err)
 		dev_warn(dev->dev, "failed to register LPS0 sleep handler, expect increased power consumption\n");
+#endif
 
 	amd_pmc_dbgfs_register(dev);
 	return 0;
@@ -875,7 +885,9 @@ static int amd_pmc_remove(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
 
+#ifdef CONFIG_SUSPEND
 	acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
+#endif
 	amd_pmc_dbgfs_unregister(dev);
 	pci_dev_put(dev->rdev);
 	mutex_destroy(&dev->lock);
-- 
2.34.1

