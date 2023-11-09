Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C9DC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Nov 2023 06:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjKIGRq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Nov 2023 01:17:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjKIGRq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2023 01:17:46 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7AA26A0
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Nov 2023 22:17:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbLcnN9q3HrL/Ka6QoOThr8kvh2d/5phAuQzw26fcyISBAi70/wPHBadp85OjlizoE6Wry9bWiDG7H9dR2p1rQI0ahfiXbC3OAO+XqEOtUfKppxZd+I+JpSQ/P8ueEF0pHayRVGiH1HtJzmok7n5pUhuG7VZFMHz/tdiV8a8zCdbaAn1hPPptuGeMRDx+YDlm1VgfGk1NKZN6naUgeZJOMXPW4ZqfzIXtIftWCeFL8mq91Pxlpbpwk96rSwuq2XqGQ6jIU8va5Ge6GlWAyYmest4ICqG6Zpd9Ox84j5Uu4hhAd75msLhg5nEgobUkYpu4G01yi8BaEp3R1BRfpjGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/27Y7k2eK8HMk9jUQKDpaZe246nUZOZm9a5FBUlmqGU=;
 b=kEbXNPP2N08aglbPPWgl+Swb2Jy1OTq8k+A4O1fXlBIVm8te3aIYzZQiyIE4cWt33g7L8oFbFf7oSIpcmUoNEcww28Ta+bK2E7roEd1BjUW3TJl9Z0xIDCPuQ+/E/TsvGWuUe76jvrFlOtZ+4X64YcDgm0UMUVUkxoi8zJOZwXCez0JLWrhBY9gGWfI1Nf/2zIVNjVLRiN9oeuynebnUQ5wFgN1766B2miSoFEBAPDT+gPxOyGR8ucZxgL1+5077aj0S4iznxANStFLxzuUU8KUNuN78ezRDgkNpHwy8y9Opx/YuJQBaji7BNcuEE0k8SHNk8aPQae2IvG+nV9LFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/27Y7k2eK8HMk9jUQKDpaZe246nUZOZm9a5FBUlmqGU=;
 b=mEYqYvbDNVI5W/a5pP8GP7qyrxlndFdAKwCG3xJJ1hl98thbctNGavKsSZ/kk5pMvZnkCJTR3tNBy/KJprsibLWgAII1hmqwgdmX70ZKO/Bfkm4bpRa8RuU/Fi+kcv0FCRCiT17c7dMp5wbtAD86wXQTjrc3Pu1n9ANhYHxg3FI=
Received: from CY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:930:1e::30)
 by IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 06:17:41 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::42) by CY5PR04CA0023.outlook.office365.com
 (2603:10b6:930:1e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 06:17:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 06:17:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 00:17:37 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>
Subject: [PATCH v2] platform/x86/amd/pmc: adjust amd_pmc_get_dram_size() behavior
Date:   Thu, 9 Nov 2023 11:47:09 +0530
Message-ID: <20231109061709.2964246-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|IA1PR12MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4b1ff6-c7d1-4bb2-570f-08dbe0eb9417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nKzQSFO71XsJ4UBcigqxaPIBwPlctSnhUwOy5Is3Q/OJ+IoN8qIZyVTGzTKoiPXIoahx4M0KRM4l8lv5P6kKtF4pJkpMWgdKkpCauZZprE7y8Zb2U7teS/IKlruyibvXsswtALum67eEpW18IQz5k9vSbpqsB6TV5RtIMShvuwpiTn/2H40wixGqen4dS7reXn0JIMXU8yrXKI4yRIJh/hp7opr4fveWwX13ABsuqRR18PiB0Bc1MbsAv4JmjZ4790UkPpsQpp4GZQdaK+7HOe6ppiMZvrEfKl48WrqLR1TMSk8RHS19w1K17xCP/AeE2ggc6EkXnP3n9553G5bom3/NJhjmvX/3l6Qae83TehYpiHJHG/5ilMGGevPi0Gh0zH/isJZAwxfwsVmR8bvL8qpvwL+cjU8FHfIjmfBBsiM0yHQn6vkvY3A0USYFmMP45TcKO7tGv9PxKK6KdTbiSueua2TmipTnHkXMG/QDeXZaofWZqvh7HsfaDNTnMrJHiQ1gyBQ/odwizhbzYJB0kmlCAcRtHYVYIk8uLeWM+6o1y+wYzOofVi2uCxYaPohcXDBTpIZgiEDzu9jpW/+ZhMGseVtlQYca2pjNIESbEzoUGVe7UwnE8rEvA+uLSYIYTwDhqcpUtiJpichTXCwa07vWvAopJEIFmH4OJ5NZAzL7y5wI+xom93amgwJJgHb/WUH69h7ArOn/PRYyDEkCBRPfRHuJdgCKrAEy/VCc2FPEbmnXMsdonqTL8Kcj+/bJeELJgnn2QjojaTsKv9Z4oA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(36756003)(316002)(8936002)(426003)(8676002)(83380400001)(4326008)(16526019)(26005)(54906003)(1076003)(110136005)(70206006)(70586007)(5660300002)(41300700001)(478600001)(2616005)(966005)(6666004)(7696005)(36860700001)(2906002)(336012)(82740400003)(81166007)(86362001)(47076005)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 06:17:40.8457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4b1ff6-c7d1-4bb2-570f-08dbe0eb9417
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

After talking to the PMFW team, its understood that the "get dram size"
mbox command would only be supported on specific platforms (like Mendocino)
and not all. So adjust the behavior of amd_pmc_get_dram_size() function
such that,

- if that's Rembrandt or Mendocino and the underlying PMFW knows how
to execute the "get dram size" command it shall give the custom dram size.

- if the underlying FW does not report the dram size, we just proceed
further and assign the default dram size.

Cc: Mark Hasemeyer <markhas@chromium.org>
Link: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---

v2:
- Based on review-ilpo branch
- Drop calling get smu version from probe.

 drivers/platform/x86/amd/pmc/pmc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cd6ac04c1468..501c72c7d34c 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -968,17 +968,8 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
 {
 	int ret;
 
-	switch (dev->cpu_id) {
-	case AMD_CPU_ID_YC:
-		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
-			ret = -EINVAL;
-			goto err_dram_size;
-		}
-		break;
-	default:
-		ret = -EINVAL;
+	if (dev->cpu_id != AMD_CPU_ID_YC)
 		goto err_dram_size;
-	}
 
 	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
 	if (ret || !dev->dram_size)
-- 
2.25.1

