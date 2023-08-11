Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB961C0015E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Aug 2023 11:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbjHKLXS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Aug 2023 07:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236137AbjHKLXR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Aug 2023 07:23:17 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43727C3
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Aug 2023 04:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCnpdJEBCup/+WoX9W/SgG0AJWWATwCRVZ0cbSQLWLihZQgncfwBKyay3zNlU331eJXJoOEP+t3YY6i5GsBsvbZEWd+THCFLyHEBwNGkOKfg6fr2b345iGX6YOwf09hKoOFY7JENQ0ggRsqnLFus+K3/92FOoa7baOv0x10gTO+WTphf/Q16emMvOvjY1gl5nqWmo4HZMzngVb8urjzFFKPktZ9O0HOSoWqoUcIXFqj5wDoW9g4AWyOra6zehTH6Mi4Dx91yvdI8WX3rr7YUHPRf83WUwD1Z0o/0vjjcVPfHAKdsM9RuFPdzv8WkDmGwT02Pddm7nalu2iwVBIX3lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2h03YdqUupiAtN2RKrLOdDnrhVn9vqoF/fDzK0uhMA=;
 b=h1kGO0HGGR4/3cAkehUjGYTXmLyyZsQibOkTtoIocL74tCilaMI+/zvoR8DPype8uuf95cz7H6kysgwFekzpbyMIa/f7SBlQMoWqZVEfGH2h/6xD/J3/ZttPkJOr8bRadrAQwB6posBujs5fEqqKv+zQN03B36HAEEQyI5hlCZ9aUQKd/W/dlNu7vSN1rO3haFIDn91p5ljop5rrc2M3U8368d3RCKgNgVrADR20YXQa5jhS61ymXl6+JxOPURZ1owLUKKf0tMaQiPTm8nv1z6n7CsHaFkD4LK1hX8aM+VQda8KuaqS7K4umavesTuuazJg2mi3K0dVLvNAq5Y5hWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2h03YdqUupiAtN2RKrLOdDnrhVn9vqoF/fDzK0uhMA=;
 b=49HOztW1SgEWknwCYQTBQxHVyA4U6SVkAoohXD+INA3HdQio+umMIhPf271G+/78pj3bc+annmkImt30d2q/QTuP1/buHrzzcsrjkGS1hWtH3VjsdO8AAPSwnu3fKIAIKCPWfsmLqfc4bK3AnNBMaWXuPUpYHuBd8odE2U2b2XE=
Received: from BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48) by
 BL1PR12MB5031.namprd12.prod.outlook.com (2603:10b6:208:31a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19; Fri, 11 Aug 2023 11:22:12 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::89) by BYAPR01CA0071.outlook.office365.com
 (2603:10b6:a03:94::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Fri, 11 Aug 2023 11:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 11 Aug 2023 11:22:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 06:22:09 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/4] platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
Date:   Fri, 11 Aug 2023 16:51:15 +0530
Message-ID: <20230811112116.2279419-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|BL1PR12MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: 44eb0898-617c-45e5-de18-08db9a5d351b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZQkhjaVrn6QQzHYiku5V9rcc3hHbAKyfs+E+YfoO28JYiTu9q9f0X075PR1i5KRYFL9JZ0qoJIJcyUKrGfLj6WeWUUKguMJC0vaSG02dOf0mYHl6Viv7DtB/6VXFpiJjs/lV7d0MrIoxNWh9N3SH1UZFjVqmOvgVrefk9zUwz2syJTQs09QbmqNONFUdSDPNrQx5Uxl0kADVmXlya7+peF4efSd0vcVKduA0rJQlyjaXVaksNJiLsU7P2IA6c9ThlFIYD+y+6iGApkK/ff2xU3OawxYrXPOHDSlwejXDpB+pnMDDHdrguCl7r7DDwtBX5OXs+1N8vmMXs25FOuoXVtMTC9oEGGyu+ZGmrOEZdDc0UnaYVLRkYc1D837jWnv45tFIkZrv4LLzH1Z3eFO/vLYTA9GYcosiTnX0LdzhYAzhfzTfBtxjAn6A16iZnxXLCIRNmbAYlD9w62AkS264WAOmGrhBM//cHcCE9TmOEf+WGiLpH7lpL05MK43/shm9a2fLNm20oh5Qoh+VZHNr4xw5uzZhguv30NvSvYDl7eXSzYCbc4tzFKgVPcUA6i/qhYQjkYGTafH8MXIIW+6TzcMS0K9pfHPxtKve27UG6nI7GPv79SWqe2JxQuG9GU9NiJxXFmPQxRlgmNICZCB6JWtMRMJXnGRQxGgmDlPoIA6CDqw3gznGDzIpwOMB2lw0L2GbQ3Tvvg7uMFrypqbN7baC5p+7K8LbOgbIS2Rj2Om5DkV2aN2iTc67v5xeYaWreqmix7hQiDi+XU9mn5bgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(1800799006)(82310400008)(186006)(451199021)(40470700004)(46966006)(36840700001)(4326008)(70586007)(70206006)(41300700001)(316002)(36860700001)(2616005)(26005)(47076005)(83380400001)(426003)(1076003)(336012)(16526019)(54906003)(86362001)(40480700001)(81166007)(356005)(82740400003)(40460700003)(110136005)(6666004)(7696005)(36756003)(478600001)(2906002)(8676002)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 11:22:11.5305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eb0898-617c-45e5-de18-08db9a5d351b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5031
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
 drivers/platform/x86/amd/pmc/pmc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 043451fabbbe..45f7d21276bb 100644
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

