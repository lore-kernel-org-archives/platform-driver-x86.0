Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F046FC83F11
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Aug 2023 15:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjH1PW0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 11:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjH1PWH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 11:22:07 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828D9E8
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 08:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIr7sZSnPpch8S5zykwguNmoxFAQVuggE1vttyZkvJSfa6ouJcgDCXpGYy/nyw8+cls4Hf7K7vqLZLUcu1VFOoed2oVAdS+RRUmOcJ6akJ7DDxTmha7mfabULuJzZCajpzv6uNgSI//yugWKMaDkgKbYEp2BcTAvFUPqvexaFyHT7e+LhnV5Pwjj9Uc/LrI/4blIBTuTJu6ciTwQCLJMMTY15LTZgei8eZgx4EltvvQ/fa+OEvSEyUHRlu8krFE5eh2ucEEHNePzaUKKAHlT+EYEiMVXbpx8qsmG7lsItyFUmg70WFjbm65DUOv0DflmP74zzqYPkX3Hl+aviGFOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3Oglz6ABC2He/rZtd2oNcDuFbBYBtAsYXHJiwawWjc=;
 b=VFMprvh8eEQU2FbHT444D0ZO7KIeTUPXi0sThj2BjPjJlRK5Y1e+y3/myXXk3iGj/U0Oi4EeVm1GGGFZYgdaVGi+XNJovmJ5m0nzjFTnDGoyUG2vAgb9zZCvjeCW0AgCnkLs+rdIk3H8br618EqHijhDjAwcU7zCW6lil8TMzAI3AqWrLn4JxCF8cUKnP9RxAPvslARlRFv107dZ8kX9wjU5XJL7nKN0Q08ZXZx/8bwAiAHHnrmUoMm9rjnzJMcrZhC8ecSZQU62efsfcmero4yL3aMqiP6JPejiK546gwnLfiVXhsw+NWt9TDEbSxkHajmHN1JuXBGijvNKAXspYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3Oglz6ABC2He/rZtd2oNcDuFbBYBtAsYXHJiwawWjc=;
 b=1SVskcwH16BBmIB2qx3MjaQT0taKQIXSDVvUUl4i+8SJX/QgN4GBlor1Bq4qSHZEjROlcCktR/Hd12JorhSQf0DJ9es0hcYSZ9qPwzR2kKoQRbSwSKOBGhO4sf4CLbSigVS6KKh2vCP93eAlzKfvj4uEriCAg9xPuJXyPx1bz/w=
Received: from SN7PR04CA0233.namprd04.prod.outlook.com (2603:10b6:806:127::28)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Mon, 28 Aug
 2023 15:22:02 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::e1) by SN7PR04CA0233.outlook.office365.com
 (2603:10b6:806:127::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 15:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 15:22:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 10:21:59 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
Date:   Mon, 28 Aug 2023 20:51:33 +0530
Message-ID: <20230828152134.4120496-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be40777-a9fd-4ab7-251d-08dba7da876d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEwDeKCy6j1HwDgZnzJAip34io//e3nVtNwV49cqhlnrFivoGFftV3xylrxtFNlwxkYlJScvH2WfkIL4WyDfrUTDhXUz9W6mUXddQsDlXCpJu/IBDFk8gCbhV9/5OLKyR2HsBj2MUiUtKasd7WCtR694DiV9u1TfloIg81eQ6iADaCCS3DQjphLlBqHTu0NGGpf9AZgFhcZAPD+Hip8l8WqyB3+xyHu/CP6fgPYCBNA2mHdiVLNdJcWL/V152850v+BImibJ5xWN68G2Q1rlONOThJ9QSlCBf8nbn4JlqXJ2n6eQ2+ztj/FnfIvIXRnPwpDFu9ga/C3XL7feLc7Eohwv9IZAU/NyyN8UQ0Z3MJIh2Xo1qnwFCLEAPUX0nq77EKPUyYyWE5VFNflTNHf6frr4QGYZc765IYyClSffo87i+BnuZH7rcjZyXj1DPv1wV7mKJh1otJ3fa9IXhWGlubrkwegk9KE0ej0qpR5JywOqIyeHN+nUpSDfQXcgpWJ52ek3La8hzqIQJLxxyEOdi7tIB5wMbzE4ihKom3k4H+mPGbwMfb60sYXJozGgk59LrT898PVKsrP6aOFJ+DRZyc4zKmJdLdDJfbojIhk90o4m5JrzOYwE1/6TAyKPKaiGK7yuC/BWUEWfY4s/BtAg8yPrJTplopPNbxj6lrh/W0zSO02UNTzAtoxDCefysWfmavVzhiBbTAyynHxrxzLrR34oIe7dkzaM28zZFiWbwhMy2ffhFsRRBU2NMGeKhMvHvCGTHNsgmRbnm0nEYGpwpQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199024)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(82740400003)(7696005)(6666004)(40460700003)(36756003)(86362001)(81166007)(356005)(40480700001)(36860700001)(47076005)(2616005)(1076003)(2906002)(336012)(426003)(16526019)(26005)(83380400001)(478600001)(110136005)(70586007)(70206006)(41300700001)(8676002)(4326008)(8936002)(5660300002)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 15:22:01.9218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be40777-a9fd-4ab7-251d-08dba7da876d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recent PMFW have the capability that can force flush the FIFO
contents to DRAM on sending a command id via the mailbox. Add this support
to the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c1e788b67a74..c92dd5077a16 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -55,6 +55,9 @@
 #define S2D_TELEMETRY_BYTES_MAX		0x100000
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
+/* STB Spill to DRAM Message Definition */
+#define STB_FORCE_FLUSH_DATA		0xCF
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_MAPPING_SIZE		0x01000
 #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
@@ -236,7 +239,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
+	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
@@ -251,6 +254,10 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	/* Spill to DRAM num_samples uses separate SMU message port */
 	dev->msg_port = 1;
 
+	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
+	if (ret)
+		dev_warn_once(dev->dev, "S2D force flush not supported\n");
+
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-- 
2.25.1

