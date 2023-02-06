Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96697C636D6
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 15:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjBFPJb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:09:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjBFPJa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 10:09:30 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DDA9032
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 07:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXK0bCki2sikyT2CTchjEjT+7R9lS/Cj+Y7qIlcbms9I535nRc4voLTKaJAPB47vB/ODH2SW7ZJAX71McelXfL6u7ZHJ7nLEbSkAQx5auUXzHciX96zn7vRIqcyDtX+jPEbPO2nXEwbTmnjCCQMmjQMVq2Byl4Md6RGl/awdHAGwWqsXl+37MfMq9KJ7JyiWDpBANPi3wCPU6t+djRkfe2T8dljA+A10tJnJChgRZgdI0F8gpDGJhhbCxEUv3dK7ncfKW98VWqy/W0m5e70Hbexh2j3oiFqdCoxvCE4m7fMiqtIBjjc3CJ1zVvZexyjEQIe6BCkdy2vq3yUkaV9Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUYVrbsWdvZwqQn4T+1H251afDKC+ka/p/UIqXlGNQs=;
 b=VrWKgshec/tf+UJRCxxFwiUO8n3OOkngg2afA0t9Q+nlPykiPNNscQz5jgjLtfoMaMhr3T3ZFSAms4uXXXQzBLsMG7WgSuaqz3QpQRL0eFkY6RGolwgbJy4g7RFiMwQigSYsiE0CT/OiWUFOcqkDN/PPMHKUyKeJ6UzIWKTLuTbF2LBM1FPcrsTnPb1Ug7yTySTZChnZsYNu3DLslaZh0qkKtcCf/fh/5ZLRS3m9OARb47SOySeaz1j2lRB4revur5QB390s0Diroe61YTP2Qk2Fov/bM5BR6PKsBd9uzPItXypyKYDQE7tdl3D4rfUvQUSp+Ynn4/9raAoLk0N1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUYVrbsWdvZwqQn4T+1H251afDKC+ka/p/UIqXlGNQs=;
 b=O+s6DEt3jDhu9yO79icatnVbWW2J985XUSqC6ItsAYHXU7hRX6On+XmcVCLNS/9fW3JGMYfbSPrj3YN87lkX6fapZy6qfE/LKp1hxBkHTyDDQdiPJoaf2WaI69sbO3C19k81GNj+uMrR/Z2qalJ9QWv1r/7SQz8UiK4KFO3LNX0=
Received: from MW2PR2101CA0027.namprd21.prod.outlook.com (2603:10b6:302:1::40)
 by IA1PR12MB8223.namprd12.prod.outlook.com (2603:10b6:208:3f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 15:09:26 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::a2) by MW2PR2101CA0027.outlook.office365.com
 (2603:10b6:302:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.3 via Frontend
 Transport; Mon, 6 Feb 2023 15:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.35 via Frontend Transport; Mon, 6 Feb 2023 15:09:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 09:09:23 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/4] platform/x86/amd: pmc: Add num_samples message id support to STB
Date:   Mon, 6 Feb 2023 20:38:52 +0530
Message-ID: <20230206150855.1938810-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
References: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|IA1PR12MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f952e7-65be-4dd1-681d-08db08542326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpQTa5hai91tQcexLfMohXwTRqObnGuqKxscTcjFTcioFv4Ii35ogfb8Ca4wc+1dGoXwGGgFd2cDoWe9RloWlPq8SuKj8ZB4/zr9Wmw5jconGp+nPJVuh7YkPszddL+v9az4LAfcmQzYjZ0ihH+KSsr7I8ZBmS67r6Qp2hsnFRJwRuhNCEDHwjH87O8PbWRwm2Q5PwbxdZHQBGhYlJmRvIQOdLU+KKN/ayMNVREnV7JVm+qjbjYemS+z91zIfOLvyuiwiwBjnT1DwxcheggBPq5yJ91gxZPubgEFfdM9RCgIcbiNFdlw+11gPIejvew+d9YizdqgoniC0prTXjhnNoMjkfYAQ3eT+iI0xydur66BcDqmqKC7swkjp1COYyn6fgTbdkTpOiuqlw1/Nx+zbdkCDmYtub+eC8ppRLU28IQyH//IruuCuadCj6Oq115GUQZHV8lvhOmSkf9e3gSTwLXfMQl/s+PcrzAJVxYv0zJle/KocEhkQFNqgnZY+4/xOO0PLs0nOIY6LC66KaakktHNo4VBQ44dJ3DHYMn+X5eSSPfhvEQrO0v+OivGprPqPdkJY8wTdGh20KLRK4qNHhMLgECsZZxnVKB+QCqdfHi44HXOdKjtZo9SDNI2YZMC+s7NOSjs1kpsEOOiaQka9GiV1TCHcenqo0eBXAMSRGPEqofXalFXePkq9p3g4pziDgHyu11g1Yo0JU+Tx+YoTFB2WUkOCVCqm+FPtvwMZt2ESbrjMVupLKSKT5aX7hlVC3HPcF2oSlzCRkFPWyphow==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(2906002)(70586007)(4326008)(7696005)(70206006)(8676002)(2616005)(47076005)(426003)(336012)(36756003)(82310400005)(86362001)(36860700001)(83380400001)(8936002)(41300700001)(40480700001)(16526019)(186003)(54906003)(356005)(110136005)(478600001)(82740400003)(1076003)(40460700003)(6666004)(26005)(316002)(5660300002)(15650500001)(81166007)(750200003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:09:26.1333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f952e7-65be-4dd1-681d-08db08542326
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8223
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFWs have the support for S2D_NUM_SAMPLES message ID that
can tell the current number of samples present within the STB DRAM.

num_samples returned would let the driver know the start of the read
from the last push location. This way, the driver would emit the
top most region of the STB DRAM.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 3cbb01ec10e3..23440f70d3df 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -114,6 +114,7 @@ enum s2d_arg {
 	S2D_TELEMETRY_SIZE = 0x01,
 	S2D_PHYS_ADDR_LOW,
 	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
 };
 
 struct amd_pmc_bit_map {
@@ -246,13 +247,35 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 *buf;
+	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
+	int ret;
 
 	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
+	/* Spill to DRAM num_samples uses separate SMU message port */
+	dev->msg_port = 1;
+
+	/* Get the num_samples to calculate the last push location */
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
+	/* Clear msg_port for other SMU operation */
+	dev->msg_port = 0;
+	if (ret) {
+		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
+		return ret;
+	}
+
+	/* Start capturing data from the last push location */
+	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
+		fsize  = S2D_TELEMETRY_BYTES_MAX;
+		stb_rdptr_offset = num_samples - fsize;
+	} else {
+		fsize = num_samples;
+		stb_rdptr_offset = 0;
+	}
+
+	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
 	filp->private_data = buf;
 
 	return 0;
-- 
2.25.1

