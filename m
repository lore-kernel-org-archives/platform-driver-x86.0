Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CE1C77B70
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjDISy6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjDISy5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6EF2D59
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC+o3qJ7c+u5fFBzXzDubVt9/ErU2je7mDYtJM7dgCYiTNemHNgEqdPTRrjKOykgSk2++F9V/wY2gglnekyifhCHaXaHf+XGKgTN3sT8Ob/Hb1C6L15oi3582yyvkhIyk+gfadvHC8gtksm6RidhR+8jsYx4iquCVXXZrfG4v7Q90A06ZuZM6LWoRsjKsUUzmC5Yxizc8+6UpH1xtDnm7d318Sv1ulOJ8kDHP9KRQ8lmfeJqDcuF2OqFScQ3lSdYzucxYV8FDqQGe76g/AruwImrTRBeCxrn3WhcFLL6ZmZFJNV8aRfJwj6YDCuCHLE+STojkMfD6YcOo8X8qOr/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUcIJjPQF1oZWmIpwbgb2fQW4nl7xevw4LLXZj+ofu4=;
 b=BdzSIZwdqyYSpOg74vFmGHGO82rjRFiq/wyCkn64ayFIkr0kul57puj59x/x/QKZV7BQvTeAt/G637THUHZFGsMqKmlgbUha+DdGp4DynHMvLdRBxR74v5Edb+jxoiX4B1t3UepYgWqp05aa6mvxOGO7SC4AOvUDouDtE1gPpLClZN7Zo5RED3hLA57QZGJO+1YpzCBhYYLWYWrIA9OyN7gMUCWCyhXKxDIlGSmB4Apu9B36Htsvpw2Iqxiuu/ejA6giQQSHpRkSKVS34zl40+PRAZbxZ8JhhhHCOWMInqwt0kjr4C1liMcSOs/CCQFDdfkcnnatrJ1lzTXt1tZ3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUcIJjPQF1oZWmIpwbgb2fQW4nl7xevw4LLXZj+ofu4=;
 b=mdZXH6pvhYa960PSm78hAu1xdYz9zVnulzxxS792Tnmx/6/tXTI3zW4Y3xhKZpBRsFuxwANncGpW77VyXABSC4AKnLZ3HEWFJV/SS3+0qe4BGciJWpZWx70pusPumZHGu4y9cbozsI2twipEfL1srVJPurQQVcGRD892ig6YrBA=
Received: from BL1P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::11)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sun, 9 Apr
 2023 18:54:54 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::1b) by BL1P223CA0006.outlook.office365.com
 (2603:10b6:208:2c4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:51 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 7/8] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Date:   Mon, 10 Apr 2023 00:23:47 +0530
Message-ID: <20230409185348.556161-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: c61a6f5b-261b-4bbe-3905-08db392be7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0zKotXwvCDsD9Z+rVl34IPe8CmuGtV9CTe0EvhnBz+p/gYp5nm84XvhOARfDxP/Fxzgoqtnv4U+N5K+DOew9qx/ygY3ITo5qL23Qhz96UmuOqtJoNq2eI3RosO1gjqzJSFFNn5Adc01d3JMb16i2lEOC/fS2u+jV1IOan+HZl3fTQFq0rigHep/gvET3lrG+CsrW6/9+HUAsv5JFFfReyZMhpMNlVg/jc6XPrq+HpdfQ49AeB7Kh2IKeSpHl770ku7/VXM4ABFlMTinq30UdD9zbi5jHMTs2AE+6bddNuIvnuV/hfDTRpihfG3HA9B6yZrO2CPCYEOWxwRzaWqhqKLw8RBlv40yX9gcFpiD83bt5YPDznMpdyxwpoJf5HIoc+045blcokoqgZB/1IzC+5jlVWvx4DvGuT537agAtQ+uX016F+0nacs+mAtkGcytDBONWHBzNkrk5LOkpqKMJn98tn7jz9QJ+OTp9uJrX1NU8bxowUapJCC1XMiHMyVaQG2a8H7t4//Mcx/QkEGXAu2mQeWTpc0lqKCHjzIf7KsygGH6MyOtO5uO3b3w3O+wz9ztBVZ0eS4cLq48cX2ph007f1WKHz59wnYIba1Ow8bwZJCjtr4V0H0J11i+dJaSFI+fJ9Jq6e2P/vXFUUXfbpH75X5bekn41aHRfg6k87HGy3zI4fAX0jz6pzLk5gbRiNssuUuYvQ5cLpbumfUXhV5dLmOP4O2yK18IsjaFc4k=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(478600001)(7696005)(54906003)(110136005)(316002)(1076003)(26005)(16526019)(186003)(6666004)(2906002)(4326008)(70586007)(70206006)(5660300002)(8676002)(41300700001)(8936002)(82310400005)(81166007)(356005)(82740400003)(86362001)(40480700001)(36756003)(40460700003)(47076005)(83380400001)(2616005)(426003)(336012)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:53.6862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c61a6f5b-261b-4bbe-3905-08db392be7ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFW's have support for querying the STB DRAM size. Add this
support to the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index b14d068a6474..86f32b01e3ff 100644
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
@@ -895,11 +897,31 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
+static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
+{
+	if (dev->cpu_id != AMD_CPU_ID_YC)
+		goto err_dram_size;
+
+	if (dev->major > 90 || (dev->major == 90 && dev->minor > 39))
+		goto err_dram_size;
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
@@ -908,6 +930,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
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
@@ -917,7 +944,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 
-	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
 		return -ENOMEM;
 
-- 
2.25.1

