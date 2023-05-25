Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33067C7EE29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 14:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241300AbjEYOUB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 10:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241605AbjEYOT7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 10:19:59 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9BF189
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 07:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTxSgV0aDkP8yCLeFNcpnD0REPKf2BTFqJxbqf/OM+hvkoNyVpQq/HE9uVcmvU5XqPHPopTWZOFtmPmZTMLH0L9kvGunUZRPCl4OMilEpVH7TxlRFtXkzUjwoWUjYSnCo4oQSDqBG106IpKq7hVo+FLHR4jjva35zFxqLyR/y+sD5UEPvNUeUsF8WRwWCuQ7VNb7XVxaNgw01/OGCdtm/TWN6jHJljCPrpMuHj5fmOaoi+PwHZs2k/V43DzEqEvt9MJMEjjCl3KuMWw4+pooSd9/UVVq2h/gAPnUCR503ZGTi2JQuo9ek9GBM1r87ntWInE+B4UUXRhOYq6qE0UwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awbiAi2MYU6uSxVInJe3LpYrsb0BC6FN9fRMoC0xmCk=;
 b=nWTtsxOl3XAAQ8slI8asAYCpao0y6TQxavP/gnRXHyvo2pgYlS5Ytv6t8nmseFcu5SnGJd7P4xpOZLbj3t8y2Qey4AlnLQtGgmoh+ZYthXR/AtRRbAuNmwqt5SVz6UlEmy1UbiV6ngi4JG2irizKTX8hUjXrb3Eebpnx7Whlq35txJ+8rTsmUiH6exdhasyPa71ven8hdzYUEkeL3Qj28UxkUdrGleIn320eP/z9rtPvwofha2y94+roAC8fp+r4wz2fHqqZ+maz/+igtk7C7D9eJHNq8Ttr1FM6jhlX55tH3quMBiFCCzpGedYjReSpzVl/IhW9/ZvnnFfRhB9Haw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awbiAi2MYU6uSxVInJe3LpYrsb0BC6FN9fRMoC0xmCk=;
 b=gUfT0WqYkZNy/4jG9ib595RvfuoBYnI8F69zJb5zCr2+5btmvUJQRA+9Yfi1p+gtg76xqKwn3ke6niPriq19Cz3OwbXnS4rJitgU2lrCR1bfwyvMwPCO7KcIe4dlIyQVCOlH4vWY5zMZOMRJ2DohDBKdDT5RpIJ1QM6iMlNzeDY=
Received: from BN9PR03CA0698.namprd03.prod.outlook.com (2603:10b6:408:ef::13)
 by CH0PR12MB5388.namprd12.prod.outlook.com (2603:10b6:610:d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 14:19:56 +0000
Received: from BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::6b) by BN9PR03CA0698.outlook.office365.com
 (2603:10b6:408:ef::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 14:19:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT114.mail.protection.outlook.com (10.13.177.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 14:19:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 09:19:53 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v5 2/4] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Date:   Thu, 25 May 2023 19:49:27 +0530
Message-ID: <20230525141929.866385-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
References: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT114:EE_|CH0PR12MB5388:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e5725f-0d44-4066-e914-08db5d2b1d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7S49C23q1HfpYxihp96oxiPUO6rURAkUGrEuyCcuj+XFZ24YFYLDu7FsvgvZhoLUmkm36icFQA6Wq8v0xaShNKrQY2L3vp7LGQ5HRHQ/VEdr54g8Fke5PWwHTVbGO5+AyX37FEhYX67oFi2A4U+slBSgwVx3HYXg1Yhy0zE1FvTuYBu/LpGIGk/FizAU7xBbAtTWIqqazh/CflUxHBRAWoJot6jJaE1o9RP194YACE0cx1XF5RV3HwUPbXT1FFubkhIwz9uPb2EheFuAcsyOTcxLqak2DeUh2qeHrW5I6wgXLWn/4AMSFzJRBmjNT6JpmawjhQL62B1Ct4ohJneTdWADiZsyrfUTAqUK9tY4iyDd42KlEl7w0S0kb5Oi5V//qgeWfG4qTnODZ2XxO1L0ruK4X4ywjQDlquFvoswNd177A3CSYADQdUR5RG5puNOORsjXwvnBXrKfNJDq5DQzUk/BKrPfBKYzcZKTu0QosiPIrY0qWcyQyEbRTJ0JWDsa0hz5jFQFA0aO5a/hWdORnvOd7WS1KU6ZXEFQ0cK44plPn5cvm2koLtMBrqzBHZDiGrmmd6Iw2GfdpXHQKkDUjaBIrP/dPpwlUXFGJxnPyYxx/OyBtxb82LIaLlnpDWootwsGWLeXvfhFJ2XzDTs+8DNarvuRwJlTVDC0NgVCJrT3c/A6j2AMpSEE35yM//hAKY3bCbBjkQeO/4+6Jz4fqzEK/YjMmcpvyNu6qXNQE5/dTwodL/h3avCTCImqfm6AZcMopX1aw4RH2MRZXLEl+A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(54906003)(478600001)(8676002)(8936002)(41300700001)(7696005)(110136005)(1076003)(26005)(316002)(4326008)(6666004)(70586007)(5660300002)(70206006)(186003)(16526019)(336012)(47076005)(2616005)(426003)(2906002)(40460700003)(83380400001)(36860700001)(40480700001)(82740400003)(81166007)(356005)(66574015)(82310400005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:19:55.8424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e5725f-0d44-4066-e914-08db5d2b1d41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5388
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

