Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF28C27C76
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 11:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235024AbjAYLcH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbjAYLb5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 06:31:57 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524AF9EF8
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 03:31:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR2Xpoj9FHgD+eX5H62j7AbrnGJ1reu/rsWtVAOIwIGXAFnu67SpMfV7BnNiJHi3oo+6d/8pjkiKqEP1erPAfuiEP4gNEHuyoFigwZnnqpYTNzB0FFZIeUMQcahemkSGXpMHD+/dTt0E9S749PRlWtuK1WFrTkrNSDA1YsVwmLhaH5RTc71ig37Ax9Eyb0i7BfokGoIikK1jGtcFzYP1W5P2ZHD3UNd7CkIWbG+fEvy549P2gXDvu+WnQH7hrBUq8t2J2zJlM1xx6n/zLGyLyeFhRcqvqhrgzCXxs1jIdVhFWzmxW5jZeZNHP/svPa70svY0HBh99YBAYzNOJwS6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBoahyUu5yNgOqPlu2c2zAHTU8RfsI1gE+yRYIfqNxk=;
 b=cu+yivmycMqARRCTwYWHGtMNZGegM9Bo1PYxY8D1Fq/oUPbdRuZFDUv4vvImii1ouzr+N4TQ4FsU6J5S5ets+RErVSLnHNh3kMKO4R3DGosY/6SDAaF757s3BvsoQs6hZ/1XAnDNjC4Dm4BUMVkGIRH7kEF7Xnm/OaWNL1BpSoP9XjPtGgel6tu2Qq2Qdw9Rq+LfEvgc/xiyl+L5o4bBQd544WZ5PiULAWbrZkGemP/BQITZFJh40m7xq4BU87VQk1pzt+Xu+VxCEFpky8T4y+wquQmnUyii5l2U66B0hBcteVdvwwhRdECQpUa4FMyp4eDS29Hyfo25UU2Zc5XuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBoahyUu5yNgOqPlu2c2zAHTU8RfsI1gE+yRYIfqNxk=;
 b=30wOkju5fRoVXqm0LNab6LRcvERqL4Kk7bjEWbSnWw7WNnbov+j6FAgvQwEfBoNzOvZ9Xmp5y0uM/Ex4RDT+jJr1mok2QAu1sGhEQ4a8P4QnZ9ZEUyB+PZyGW3UkMk7nMoSzunbDCOrwCZbi3ZUov4KoI721bMBzsVpi73/OQGc=
Received: from DS7PR03CA0121.namprd03.prod.outlook.com (2603:10b6:5:3b4::6) by
 BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 11:31:52 +0000
Received: from DS1PEPF0000E634.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::a7) by DS7PR03CA0121.outlook.office365.com
 (2603:10b6:5:3b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 11:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E634.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 11:31:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 05:31:50 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/4] platform/x86/amd: pmc: Add num_samples message id support to STB
Date:   Wed, 25 Jan 2023 17:01:24 +0530
Message-ID: <20230125113127.3862898-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E634:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 280c0208-d6d3-4181-e1fe-08dafec7c19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cb3Hc/KmEnnVq8AJ+XFAfzDTRi4kKI2OgjZNh2xAOJ6oODQXRwkxA8Qwpp2/p/AJ77KamgMItXaaAq6Ztmu2G55va0LnpAMZRdzWVhoASmCGS8sKYtyVO2E557dcj0EfDgY+mBi75nC0ETBclb+dL7nQCk6Hv6iz/cwJvaeYiePFnDPNU+gXecvHP2ytcvkwPzPKYmvUno+7CkbP+AthEZ8uEzdOrjIdwkfBarmdUsguXCFWMW178rOWTZeNSCCp2uSQ5eIGM//aycJ33KTWc+8cpiG9OhQ07zMb0ihcSSSZ7pdZYTkzubzFi/PKu1VaKiTS8TAfleq22N0tUxhS2H1rwPks0ublhliFMlmYb39+vKXhhxsUEEkRSXrtzmrc5OQXbGhbvY4r0T2SNcJnMGgcc24K863PW+lKPApIFmWLt9NZuA6o8xO8PHu2FYunrdc1xAXbo73oFBXzlGVPM503SVzRio8qTDGOhla2y609XzEas8TDtcL7MtXoafFqjqDY9A40CD5SBCBeU+gBZ4wTxsUE8/0H+o/2ueqzOiEwZm4AFHXt6QhHPHXIkHJz18F0C9BDR4aILWh+/omKNQk9+yHhg/8EAFH/Rebkg++ufhX6I5+7Vysbo4AYDlMCp5FJEy+pv0FnFYhPemYKPW12Q09ED4IG8xqxltL5yYFEcCelJ/H7tXYgEUFhYmnh6UBV8QYHJau7Km4J4TomjTUi9E/s/kc/WVxfg4R91QBZxDTPYXQMVlTjhJvQ4BtElst/RJZXx+xxjWYnWI/B0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(47076005)(1076003)(110136005)(336012)(54906003)(2616005)(8676002)(316002)(40460700003)(70206006)(36756003)(4326008)(70586007)(5660300002)(15650500001)(426003)(6666004)(83380400001)(41300700001)(81166007)(2906002)(356005)(7696005)(16526019)(478600001)(186003)(36860700001)(8936002)(40480700001)(82310400005)(86362001)(82740400003)(26005)(750200003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:31:52.5861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 280c0208-d6d3-4181-e1fe-08dafec7c19d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E634.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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
 drivers/platform/x86/amd/pmc.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 3cbb01ec10e3..01632e6b7820 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -114,6 +114,7 @@ enum s2d_arg {
 	S2D_TELEMETRY_SIZE = 0x01,
 	S2D_PHYS_ADDR_LOW,
 	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
 };
 
 struct amd_pmc_bit_map {
@@ -246,13 +247,38 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
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
+	if (ret) {
+		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
+		return ret;
+	}
+
+	/* Clear msg_port for other SMU operation */
+	dev->msg_port = 0;
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
+	dev->stb_virt_addr += stb_rdptr_offset;
+	memcpy_fromio(buf, dev->stb_virt_addr, fsize);
+
 	filp->private_data = buf;
 
 	return 0;
-- 
2.25.1

