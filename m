Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A88C7EE24
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 09:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjEPJQO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 05:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbjEPJQA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 05:16:00 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F3E5BA3
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 02:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt7z+qDsA9FUuPKlDI6pZDfkyI0NloCVJ0NZPuTa5JhZn+ihIhzBcdj1KUIaxu2vHVmec5QpvyX/jkbJ8qA7HBS9xvgjTT+zDYBscKsZHSHH1xdiqyOdtQfqkmgplIk04vsZ7mbacPRGqRFgDGuQi0oV5hJEw9mVcTaXAM9k7F2CnVVq8/uTEe+16ZXZKZtmk7Xg5LQOfva9BbfQ/Ro0J5He3h61MntAdxUhW8b4ch/lOSOonRJhBENPi+5mJSeFy9Cw+wXqXg37Rjbdj33OgcyQiTb1KM/g6mnOldIQLH+4HxelDgD6+EEtlxYiolqpNT0hRm6hSJ1Vv/2s8OcAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kFALfnGsTZydzbxnZbUQUWIlXHlbRbx9tyLrV7E0NA=;
 b=NuoQJi5zOrH5aPJR/fsXFEEBlt0341IjsxmFF/Fr1Fa7yq7fN7H7m0KD1IUGyfWan3T9NPsej7XTT16U50zSYD9U1ZnvJPmi7b4x1Q4qDrWyOdFkcRlooIXjwd0SetM7jnlNKpdyCpbRU+8MtqlH++1bl+TdzO/IqjfNNAe92MlpwAe4hnc1NoJk7YOzBKNDgFXhR5/qmI82zbg7FKhHT6ikzx5fkDsZLsoONc5p8WIEBtmMC1bFwVlGYYikNOdJPg/s87uBMU0d1ATED7paJIOKgQCUJFGI+E2AM0Mvn01Z8jskHPnQ4YHqzUxFT+mZvWb0JhkoIvilZNoViLTaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kFALfnGsTZydzbxnZbUQUWIlXHlbRbx9tyLrV7E0NA=;
 b=MpdwnoyIvXS4MzxJqymoWINY0aNLTBVk6C9tUrFLwrqOaA4kDHmPwSejxkAKzRvc4ElElAszQQy/ShM6hhe1tRoGf22IO8lZqpX2NDs7kaG6dduDNHuQyYbxwlytYap4yjOxjbYToKJoRHvWGkxZL9D5HisjCgiUXTZjXuTZzIw=
Received: from MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::10)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 09:13:40 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::78) by MW4P221CA0005.outlook.office365.com
 (2603:10b6:303:8b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 09:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 09:13:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 04:13:37 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/4] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Date:   Tue, 16 May 2023 14:43:06 +0530
Message-ID: <20230516091308.3905113-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 92745128-00a2-4cba-8334-08db55edd685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iR33R6qREsSb1bTfmZPka4GBP7BnjvBe7NQCEVI0nMS7tMoW+lat3UsQNKu3GePQPEYGPNXBXuB9W3B+4uHv2q5EkAY0IrUeCnk83XBColH/QNSjUpCtfzus75GGNlN2DCEYhVmzubjZ9Lkez+Vere8B6V441Lh1jUMY4pFWLFQuJ32Ee96cLaPiG2P2bXR877rCjvkpzmDmsi3KW8Adsza1qxhHuP5aoDgAUttaouJnaMlrFSv4DMqwAEbRVFGBGFwlJOeYvHNtDp+ZMxLJYFCVFgCzC7mAl4Xz/dXWdgvKFFdxOs5SZYpg1w83QYbS4GP5cf8hrXTf0oA6x2t+DYKvX72QqaI0tnO9pTCpUoRlvcneblRuxQEjyY9vK0MR3h3cFDVWoaLHEIf+/S1cMdzF7phyuutT+IMWK2K3FEw+x75UbgVsf29FOUNzdWmqcukMJRzT5DN5tskibjlHpnj/UXWJW9TXvdM2LIcOw9Abna4581tSxW+Qcd3wne/r49qHOp3WO8MG4Kb9Q1qpwMtCABcbnwSSxVORriJui2JEuZZaNCCwREYv+rs+pM2Pe6ZZF0IAaQ7YcxHuCb+tRlRry/q5H4tba3RIc6WmhTG3PuM7MCWmjBL7j5GIQ1cHo2vl/NtHS1duQNbxnewAKhu2mWViXCYNB9LLl6xafmuu5zmtChE40KhksZq+k9Z6SFN8svjo5Uau+hOUQKdvdyUie8mpjQqVXyOld4eLLkK1GbheHecqJdZIDambXzLLqFlBzYlgNGcDyL6aNV+XAw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(186003)(16526019)(426003)(336012)(81166007)(356005)(26005)(1076003)(41300700001)(7696005)(2616005)(47076005)(36860700001)(6666004)(83380400001)(478600001)(40460700003)(110136005)(54906003)(4326008)(70206006)(70586007)(82310400005)(82740400003)(40480700001)(316002)(5660300002)(8936002)(8676002)(2906002)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:13:39.6178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92745128-00a2-4cba-8334-08db55edd685
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFW's have support for querying the STB DRAM size. Add this
support to the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index f28c295b47dd..e2439fda5c02 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -115,6 +115,7 @@ enum s2d_arg {
 	S2D_PHYS_ADDR_LOW,
 	S2D_PHYS_ADDR_HIGH,
 	S2D_NUM_SAMPLES,
+	S2D_DRAM_SIZE,
 };
 
 struct amd_pmc_bit_map {
@@ -147,6 +148,7 @@ struct amd_pmc_dev {
 	u32 base_addr;
 	u32 cpu_id;
 	u32 active_ips;
+	u32 dram_size;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
@@ -890,11 +892,39 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
+static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
+{
+	int ret;
+
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_YC:
+		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
+			ret = -EINVAL;
+			goto err_dram_size;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		goto err_dram_size;
+	}
+
+	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, true);
+	if (ret || !dev->dram_size)
+		goto err_dram_size;
+
+	return 0;
+
+err_dram_size:
+	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
+	return ret;
+}
+
 static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 {
 	u32 phys_addr_low, phys_addr_hi;
 	u64 stb_phys_addr;
 	u32 size = 0;
+	int ret;
 
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
@@ -903,6 +933,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
+	/* Get DRAM size */
+	ret = amd_pmc_get_dram_size(dev);
+	if (ret)
+		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
+
 	/* Get STB DRAM address */
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, true);
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, true);
@@ -912,7 +947,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 
-	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
 		return -ENOMEM;
 
-- 
2.25.1

