Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A100C7EE29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 11:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241011AbjEYLvE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 07:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjEYLvC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 07:51:02 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325C897
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 04:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO1PyyLWjlYxbvzEzoWF3LgbwyfMYufwpC6owoZjP52fT4RCEdaJRHK6ks4U9LcDmVsC7er0FCiVnn5dzfECUGfAG0A6uZcHrZHQ+kiK4V6J3pXhiBvF08yEgHWp8dwkH8MqMbbvdw1+Y5xviFgfcI1Uzto3Dq02+iVQ6wqBw9ULBnH/XmLIPsmFGtF7ns/oGcf2mSLqnIQMCi3HOrAeqq3mmyfSslGqdjSja6c3oikY01OR80MUBKdqZIwQxfebS6k7AwUmYxFk4AGKAgQxLPDf0Yi/jbGnXlO89LIzIDVlma2Pi1cOrOydG58OWurPALAREp18XExrpqkQGIn16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awbiAi2MYU6uSxVInJe3LpYrsb0BC6FN9fRMoC0xmCk=;
 b=frM/aJtR4taLmiPtK4OGV97NKClhsUAjn6JCx6HhNbhbt8LNCpWwmHc6UZsSpy3obXu0wUTV7JIH1R9yD+kw9DDdtcEI0dkFoKhunhU+ToDEv/2Xg+yqsnvskOrMAB1Hi9UnFVMx+I/ERbbD8woQ6Bh3BLQrXnGAh6533pcvAYPp5aYGIaQqKh4KESkWGSQGAfM9Rs+r/m6DwDjmldiWbjbc2b/8UgqXztxeEel8dubLtcpU2DaG+1eoEUTdXwaU+wA0yYjZeHq4zgS1xoxYmsq5LnXsq7aZ0GehC+jqCXA4SUxJpVCwxH0wyz5ijfFUx1yUr0ACEKc5COZPQJ8u/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awbiAi2MYU6uSxVInJe3LpYrsb0BC6FN9fRMoC0xmCk=;
 b=fkfLun4A7otDWy0sxYXiZi2lbr0crZp47wHQI0VUnOTPFduYbrzJdxxQY5FPmcSEiUygymHkW/bWxjObXqqwCiPxRSHAjmVlbyn2V9yfy+qzK+qIAs1ef65Fm/HviEOjwBAMobGGzNEVH2+32jjBjBaD2cQNXL2vb+35ucs3UEk=
Received: from DM6PR03CA0056.namprd03.prod.outlook.com (2603:10b6:5:100::33)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 11:50:54 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::6f) by DM6PR03CA0056.outlook.office365.com
 (2603:10b6:5:100::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 11:50:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 11:50:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 06:50:51 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 2/4] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Date:   Thu, 25 May 2023 17:20:02 +0530
Message-ID: <20230525115004.865395-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
References: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT068:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: af944767-33ce-4f80-60f2-08db5d164bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbtpmGPcV5vvwtrb9K8od5Rlk69fPxSGNEEzefD072AacjQEDG9Z5FaptA2aKP9zyS5jSPY0dLt7Qamt/AoB7KxIei0URF2Ln0fOTxiXus2Xws4Z3vzVXCFFUL+mJBr2+sDZ7iAhhr1nd7Ciqs9QEhs4iwp0vF5SVFTpc11hGEU7b4s/t3+HCo7SWU7M/xsVC8RzB+38QM6KyxuVTh7E7FlWr5+kWWCoHCCa+BOL343+vZ15AECCuM27Ad5LrgKNTmjqSCb9dtHNT2hdNere8NzXuyai+/v7gmzHw2fNlhrXFTC1Hr/kPJj5TNjShFWBfMTkRwh5WwZlW3UNFrSyaBHR+oSeqHAJAbGUmdQ6p089uQyUqWV5xRGf6fBQ5XY/oLVpZwB2zPKZ7Bpg+YeXsHD5MtfDb5bQ7R0FwfE3VEyoFm/Owah17RNxekSt4lkjmTXoMy3NfZGOsu/+9N2GdDEY2oDshK9xkxlr1L+udZaDh/FDUcQ4J+2DN0JRFizlWR48P8E/Sw6KymRJ78SHq0xvQwyxzsMMfTYiiC3i34r+4vC9xGwzRfS2ACTOJuqUwmrE6FXtqWvmYEK01bq8t10VvYArNr5pB+50BrLbxNYfiLMGlXgh5hp4PW6nZjRp+AN374m1gtq38atPPHhx1kbAZecqlG78QEzfmILpVgsBU9NCjB8WpWIr9dOu5qd7O4PmzXGlOYSNQFte9sVU1oCr4oWwZocQd9JYkOHsAKAGr0plvWSfy1CvfCpAVH3mbkhLBrSyKH9hNYDhhlSo2A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(66574015)(47076005)(83380400001)(4326008)(40460700003)(81166007)(82740400003)(356005)(36860700001)(2906002)(5660300002)(41300700001)(70206006)(8936002)(8676002)(316002)(40480700001)(86362001)(70586007)(36756003)(110136005)(2616005)(54906003)(6666004)(26005)(7696005)(82310400005)(16526019)(478600001)(1076003)(186003)(336012)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:50:54.4297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af944767-33ce-4f80-60f2-08db5d164bc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFW's have support for querying the STB DRAM size. Add this
support to the driver.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

