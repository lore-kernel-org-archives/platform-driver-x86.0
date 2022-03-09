Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FE0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 14:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233616AbiCIOrI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 09:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbiCIOrH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 09:47:07 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25786156C5A
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 06:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgXOq1mbYrE1q+cZHlmUYLCAlrEM6Ij2PdPEFNYg0M1RrGistG0pnfdleO1Z5hdGa7MzXCj87/XXYLwDMNDKaSfCGShQ7kpxGzz8x8SsINpzuL0KurrfcSoEulUcEp2wUwjmOY2t2djBVXZeJFIZDQcv1ViA53SkAL0w/zZAtGhAERdhoouoyAtDRESXLZOaXzDlY42idMmW9nNM1kBrBpiFkXL3PC8Zmx+F8g0rwHLzNp//s9Ehe1TheYDnb3QeinqSwq93lKj4rnIV2CjUkZdxMc7RoMi2XNKS8pLogNPpZHi4ciZOvxiFREVdEDdaQSsuLI+HsE/8X8bctdnAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBlLJ7YFSDKe0BIqtWwI2t3R+gbFyT0Af49ieSPYv0E=;
 b=QNnB1VJOsKFH9z6xKME3zfP0vZuuApsITKujMdgo3CT3EOQxfJzrtZmuZl7QjoygrgIbMSgBkjqRsoFzIWR5cq0bkKG8iaY7ze3p68wM6MP9lI3O5wKcB2YV5Y7bSUiHgzH9Fx52u+Yyr8kmTpz9L8Gc+2KsRDxKMVNsSTm+hF0WrUX7JpRRl8yXQDpo4Nk29OdmvCuCCF4rlyI9Miqm/7wWKw/qmhcCBHKIGnWXCeM7rGmnpcJT0EdINTbhbrcQJQY7A4TCfRXMTRut7P8cbpcYNbJYqNoqWu6GZiL9oTEv0SoU0j90OqzxTUyjvjwLua3+ceFwsJJY6AA6gUb8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBlLJ7YFSDKe0BIqtWwI2t3R+gbFyT0Af49ieSPYv0E=;
 b=rY2uMeQLMRI2kTQBaaPmBFi1zrS+GRsjtwFxQypa/jyX2XJZkeYJ3YNDo/OByIkVqVxrlIWVhFqgKCw9K4lBA5CaSZ4FAuj1Qj/Mgj7oaTpebv8l+8aLUYkwhrPT8uK88E/Z6E/x4vaP4Ih0bNT9bacrplDtLmCrMWMcOLYZuDg=
Received: from BN7PR02CA0021.namprd02.prod.outlook.com (2603:10b6:408:20::34)
 by BYAPR12MB3621.namprd12.prod.outlook.com (2603:10b6:a03:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Wed, 9 Mar
 2022 14:46:05 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::32) by BN7PR02CA0021.outlook.office365.com
 (2603:10b6:408:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Wed, 9 Mar 2022 14:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 14:46:04 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 08:46:00 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: amd-pmc: Validate entry into the deepest state on resume
Date:   Wed, 9 Mar 2022 08:44:03 -0600
Message-ID: <20220309144403.213756-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bda6bdb2-627f-483b-96a5-08da01db89ee
X-MS-TrafficTypeDiagnostic: BYAPR12MB3621:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3621890C6EDC3C3034A7F8B9E20A9@BYAPR12MB3621.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGSbGf9XeyoQQtZwtmCcrls2slvlWDEE9stnSVZQ/zKfqBlCtXDrLiWbDhAkcBXZqb/utyBkkzdduwAlBewPyfzvfanAkndDV5D4WV1WkeDWVkh6FgU8yfslKY9SteFaZDw18K1FTl04PmiSK1CehKYabFGL5jVyFmqKH2elOTElvHrV44ssqa4Nl5H8VBteSlju5WTbMEacqut3KVtpn0bM0dpvqXLNZBiLgtEJvuaSVncJAz05WTx4ZKIFXzklnEmNmJnW16QfxCoQmbG6Scb1jTTxgR0DWFmocXnoByulW48q0320JAx9vQD6t0ThOZsucfUn+qVtU9hoC2LG75tu6cXlioelMjap4QPM2ggSjFAb0Kjq+2hapAvxMzGvujNeJxDhzhKQj12dPhejTFu3j9+oHV8jO2YLFLizDhgNsfOKuu+Q6DJ+sEFPzNITqxOtEbnzP/wLNIcUrtIjZ9ZZU6YmdIUFA8g+L1DQyApxwWpGaeP1UMY5eQBDwvkd1tFBU1nMM0NCjL5oADh0rKeWy73mrpe2p1zaKt6zLMOCcnXQtfozK+SDN9tDqg1Rvtxxe1dM7lAZsn/cYZlhseRccdhGJbgrUof1rhle+4lb8rDg0cbtlKKaC35LuTfqSRqH1nnKa6kIdWXa4HbOqIG/LSHzPlHWKe/hhO+bREX2XF9E91APfZizjW+Lfm6aHYFhtO1AOXBKa9fPr2Oc1w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(316002)(8676002)(70206006)(70586007)(186003)(5660300002)(44832011)(54906003)(8936002)(26005)(110136005)(4326008)(47076005)(82310400004)(336012)(2616005)(2906002)(1076003)(15650500001)(16526019)(81166007)(508600001)(36756003)(83380400001)(86362001)(356005)(426003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 14:46:04.9301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bda6bdb2-627f-483b-96a5-08da01db89ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3621
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the only way to discover if a system went into the deepest sleep
state is to read from sysfs after you finished suspend.

To better illustrate to users that problems have occurred, check as part
of resume and display a warning.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 05b4bac38920..e117404e1bb1 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -171,6 +171,28 @@ struct smu_metrics {
 	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
 } __packed;
 
+static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
+{
+	if (pdev->cpu_id == AMD_CPU_ID_PCO)
+		return -ENODEV;
+	memcpy_fromio(table, pdev->smu_virt_addr, sizeof(struct smu_metrics));
+	return 0;
+}
+
+static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
+{
+	struct smu_metrics table;
+
+	if (get_metrics_table(pdev, &table))
+		return;
+
+	if (!table.s0i3_last_entry_status)
+		dev_warn(pdev->dev, "Last suspend didn't reach deepest state\n");
+	else
+		dev_dbg(pdev->dev, "Last suspend in deepest state for %lluus\n",
+			 table.timein_s0i3_lastcapture);
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
@@ -178,11 +200,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 	struct smu_metrics table;
 	int idx;
 
-	if (dev->cpu_id == AMD_CPU_ID_PCO)
+	if (get_metrics_table(dev, &table))
 		return -EINVAL;
 
-	memcpy_fromio(&table, dev->smu_virt_addr, sizeof(struct smu_metrics));
-
 	seq_puts(s, "\n=== SMU Statistics ===\n");
 	seq_printf(s, "Table Version: %d\n", table.table_version);
 	seq_printf(s, "Hint Count: %d\n", table.hint_count);
@@ -571,6 +591,9 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	if (enable_stb)
 		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
 
+	/* Notify on failed entry */
+	amd_pmc_validate_deepest(pdev);
+
 	return 0;
 }
 
-- 
2.34.1

