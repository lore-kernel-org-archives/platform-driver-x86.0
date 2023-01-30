Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3C0C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 16:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbjA3Qtl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236454AbjA3Qtk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 11:49:40 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C52AF77D
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 08:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qimq0+5eeGz7gXj7uTPUl/qdO9oTtY/4AxU8maMfMPFTtJODGjMtqKP4h6VYxDysipBvqOIPRUG1jTybbZL8Bh6bW8mTseqLsmhiHw8rU5wvrcJvhGUbvqNtBa5MEP2gWCxWAbM2v5HkCQaGt6bdCT8DpsfiffzZKOf/rUwSdX1h+1g1qxVvn0NKL/uM5Fz/6Zce/J5xmeM8XkgHhFO9+LhNGkGXYNpmNfMmX9MZwMpIJm+KKkYY36wu6A3grIyD+k+n/n0sM5L/1nNYwr8icCh0q/tE3XSSNFFyFr+5yJQha0wxmo23vvJndudXzj8VGtr3NSqvCLnXv54GWES3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1OiyZ3MWh/Nr0XAQEKrs2CzZdpUR2iN4dLTlpSKchw=;
 b=KGR2glY2twE96Fwf2XhN/BIFOd19B3PONJ0MKBa1vz9h7N7Y7bCmBD1JrNGuloLvvUQp6s5/zMiFFqLfUFtwuIahMF2oC50AagjzErJ6aoyARjSdAoB7dWkKKnimSopxZo8irPSgTDfGuLPd2/YmfAnKARyKkvleeubJHsUQZLRdUY2Pzvk1T+r2DMRh48wXTZCJBhHXjXTgnYlYq1T06e+zfyG9yBS+xfopzJSwHbP0TjF4RlF/jG5zKBzubvR4O9wwgK2jd7bA63fRmpYm8vIu5fvgO8m8L/9ARgWmrGtVEpaYeBeq2r6Oqq0yJKTNtC0ep5eLvO331cJCca8fQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1OiyZ3MWh/Nr0XAQEKrs2CzZdpUR2iN4dLTlpSKchw=;
 b=onIipk+67tnF55qCIAmx/CmB7Z+tkSckXeGaFx2vVYt5kSgEjze1jE5je+aw9hynEVT6mtQVG34FDvZv44t08btSWsjUEZ3fwp7PyW2HfN6aldXaFMYQ+A/h9XA2nKGGtwF0Z/nZlUxWbVSsJD8pDLBDhfx6RKGYnRjuNGFPkFs=
Received: from CY5PR19CA0118.namprd19.prod.outlook.com (2603:10b6:930:64::22)
 by BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 16:49:37 +0000
Received: from CY4PEPF0000C978.namprd02.prod.outlook.com
 (2603:10b6:930:64:cafe::bb) by CY5PR19CA0118.outlook.office365.com
 (2603:10b6:930:64::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 16:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C978.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.19 via Frontend Transport; Mon, 30 Jan 2023 16:49:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 10:49:34 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/4] platform/x86/amd: pmc: Add num_samples message id support to STB
Date:   Mon, 30 Jan 2023 22:18:52 +0530
Message-ID: <20230130164855.168437-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
References: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C978:EE_|BL1PR12MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd28815-527e-4c54-3faf-08db02e1f8eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDhrERS6mMjWUODFKaPEm3fbOIFi1mtAo1Jld12kKz5iUfs2Xofpp1FzwRtXBqxVWWHceDQlp+PmpEFpj25Oernm5SIccd5ppz+uCLKvfvVBvpO3Xv0Ph4ts1BC6v0uO5ug6U2Q7VdEQ6tEMYqnyTgUHp4AyYicWJ2vDoQvYLMoACq/88Y4eNu9C+vkQ9bO1f7wJo4aEyTGQr3PaKH+8XSyNipk8VvliH4SNZXqTZSHn2SOk4YQrt2Ze75hqzDHIVtm6WC0ilM0QbOK1XcU/JbuqqgLM+/TLRuGdFF3uIi0RW8m92VY4VFV1LIwk/i9hYzncgGVI6tw/r0x2qSWz8pex1/ut6il6yPSFnrF0idIm9yXpNWaO64pf4FpsV83RPWjbJV44mne9TKdYSqPYsK5JW86aP2+IfARej9jM4URmbxIq0Y4Hi6IzLwsFVWKifKoh507tM83YA4KUef+39QWT6ZMiZqieQ0tEFhcvM/nLFke92k5sla772+qGDYdKcQ3wO/l4voL82ajsp+/2kbPYPg+YSLrnQF4pFOsP5gfwb0rsBqye0AQQ9Z6C/aHHix6zvNycx4/VTAe/oXZtxcKOGV4A490Rn+fJkiUNDu2Frpp4zO+kE6cskvwjvWVdiJ3D0lLP7d/U/45n/GsjQUblTPA5/LrI2s/WZBsaehDZGi4DoDkH8jD8khhOid2+GgNA/yIuTfEKwpCXc6bKoDyTMHiAmcw3/NonuTzAgbq6n6yYN/uHx0iUcaYQBxRDA0VfV0SXtfaGwZvL+BV8cw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199018)(46966006)(40470700004)(36840700001)(86362001)(82310400005)(356005)(36756003)(7696005)(2906002)(54906003)(110136005)(15650500001)(6666004)(478600001)(8936002)(40480700001)(5660300002)(41300700001)(4326008)(70206006)(8676002)(316002)(70586007)(40460700003)(81166007)(83380400001)(16526019)(186003)(26005)(82740400003)(36860700001)(1076003)(426003)(47076005)(336012)(2616005)(750200003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:49:36.9027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd28815-527e-4c54-3faf-08db02e1f8eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C978.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5825
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
 drivers/platform/x86/amd/pmc.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 3cbb01ec10e3..b0f98a201a81 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -114,6 +114,7 @@ enum s2d_arg {
 	S2D_TELEMETRY_SIZE = 0x01,
 	S2D_PHYS_ADDR_LOW,
 	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
 };
 
 struct amd_pmc_bit_map {
@@ -246,13 +247,36 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
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
+	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
 	filp->private_data = buf;
 
 	return 0;
-- 
2.25.1

