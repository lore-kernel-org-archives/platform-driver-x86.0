Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17F9C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 10:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbjDLKWh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 06:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjDLKWg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 06:22:36 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D587230FF
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 03:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG5gGcLJJkxx9VIfS3ijwVzYhja0GcCvylMRulAt4Q0UeEDR6y1/qVlUMvaVwNcut2Mx3kD6BJyP6IIO9OpyeVootBnVBjVJTyakTA/ZB5g/7vY1ZHdLGpmSU32/LdLUBhRwLrPiFc+A1pD496Sh84cjJSnvXpEn9qDQepLZbNidfG7rYOS+jQsESJjFIKekUcVLyhj2aSosj85ZnZUvLodBkdPjlGtqXtQrc8aj+1NiGP7gV1WaaTeWr/Tval0nie6jR1nEHW5+0nv5YuHAeC0Q7JaAlG+XIKslI1DvAMhJJdSMW+Hr2u8x8Du88JfKgvR9CPKZmx1UMYHFUeMfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ1Jisd/RsV5/BmVXwsBf2ZjPMdZ8GjRu3nXfLY1P6c=;
 b=SDONSdoxj3bakiALjNQE7KacE4YHV/ZwDKpLelWHE/Q0npXs2KjI7ZMF9cNUm09dv1TPnTLffdBLhsvD9PwiDKQl1WLzt8ACKKsaQF0dJ07HkdvyyOuGeNtGqIWoRGGEtHkxMk7UoRR+eum9jtrCMsBV5Eu5jxPrSKaqnotKTvZY/bMAapNCYBf3e8KDUbBUH8sTKh6b4nHAKOk52IINg2P97BvxYFB6GIAiLYDfy1eDTY20WNMFswfDnVXOSLWih7pUC8IxAp7mUNUbFeGqKrcHnVHN8v8kXRsm5zt4eARDDlkQSXIGJe5aaNOeF+KZTnpgx/NXIDkEAIgalRQLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ1Jisd/RsV5/BmVXwsBf2ZjPMdZ8GjRu3nXfLY1P6c=;
 b=JvtTMVwwgxatDPwVl1hY0fudORhmjwrRenMok+SErgDa+OEVBqfXyeAvRZfTJherBRgKJ2mwG/xXFmEkGD7gpGdvx88k7wH9fgbHqslx2mI+LIQErFuO4J50LPxfdSX/k/QLmvs4xg21hRhSSIm6bSqrSs5matTYSjUCKv5nLRw=
Received: from BN9PR03CA0385.namprd03.prod.outlook.com (2603:10b6:408:f7::30)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Wed, 12 Apr
 2023 10:22:33 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::4e) by BN9PR03CA0385.outlook.office365.com
 (2603:10b6:408:f7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Wed, 12 Apr 2023 10:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.30 via Frontend Transport; Wed, 12 Apr 2023 10:22:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 12 Apr
 2023 05:22:30 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Date:   Wed, 12 Apr 2023 15:51:55 +0530
Message-ID: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT059:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 202c49e7-bb4a-4720-1c2e-08db3b3fd40a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2IBDR+xEcQbeIrF91SheKxW3QPxMBJyUgsm0P32kyf0R1+jACY7GbC/DHBv0A/wCnrsrXhvN8y2MuBva5w4G2aaHMatrcydHfHZFUHdYJVQ3YMWcX11vSA/czaWeVrmTX26Oh+u5kX1aqY0gOZTZeTBFq2iQ/6vux33yL8p5euKUIzbV5DBGXy/fQ4er/SmIK5rj7k+Qwgeud8HcgXwN0syGBC00mJDrVHjWVL5QHUwmsy+Mb9dz0Iw7r3R9Fdw0iotqsWv8j5LfZ6BTwUoR7II9JuZZe1dhATfEu9lioDybeHYyAIrTDwMiW/dS+x/92HjyhlayigLKEX9SyOCrdebrvnXgJkd2pQ9ATPUs7GUKcyM+nDzcbBfYz6CvHG0WQ1+EEJltcxjF1R+6k1mR4NP9YIV+iZdYJD8xYIoQ0pQbR5V/qIPL0CIQxM2BP02livma0TwpqCknIeanwi8QUqMkXmc7pGzLR2rAdKIpnUUm+BuvrexJgETecZDQEXLpZKS23ZYaFMej1CLm5NuWbLilvt4rQT9Xe6EraIbMQG7tP5YC5PQ7lQgXT8AyrVQMl4DQHVijDU9qeZxj9FQCYd4em9UMFLuiKj28bHWr4W+ngFbNffhjLI0QoSyxfZn86wcOFDBVPfDslf0e3XdD/VKLMYiJqbu/k9w0PMjz/0oLBwjaZaMSJeu4Bm8QWhgNNrYZ86lwINSzDRJH7OIO3J8cY7AQR++Zp/KsRbSIEkM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(8936002)(36860700001)(5660300002)(47076005)(83380400001)(336012)(426003)(82740400003)(82310400005)(41300700001)(478600001)(6666004)(356005)(36756003)(2616005)(81166007)(16526019)(186003)(40460700003)(4326008)(8676002)(1076003)(70586007)(110136005)(316002)(70206006)(40480700001)(7696005)(26005)(86362001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 10:22:32.8999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202c49e7-bb4a-4720-1c2e-08db3b3fd40a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFW's have support for querying the STB DRAM size. Add this
support to the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Based on review-hans branch
 - Add a switch for cpu-id check based on feedback from Mario.

 drivers/platform/x86/amd/pmc.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 877b629e5cae..9f8bc6711413 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -114,6 +114,7 @@ enum s2d_arg {
 	S2D_PHYS_ADDR_LOW,
 	S2D_PHYS_ADDR_HIGH,
 	S2D_NUM_SAMPLES,
+	S2D_DRAM_SIZE,
 };
 
 struct amd_pmc_bit_map {
@@ -146,6 +147,7 @@ struct amd_pmc_dev {
 	u32 base_addr;
 	u32 cpu_id;
 	u32 active_ips;
+	u32 dram_size;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
@@ -888,11 +890,34 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
+static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_YC:
+		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39)))
+			goto err_dram_size;
+		break;
+	default:
+		goto err_dram_size;
+	}
+
+	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, 1);
+	if (!dev->dram_size)
+		goto err_dram_size;
+
+	return 0;
+
+err_dram_size:
+	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
+	return -EINVAL;
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
@@ -901,6 +926,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
+	/* Get DRAM size */
+	ret = amd_pmc_get_dram_size(dev);
+	if (ret)
+		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
+
 	/* Get STB DRAM address */
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
@@ -910,7 +940,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 
-	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
 		return -ENOMEM;
 
-- 
2.25.1

