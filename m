Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E26C197A0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Nov 2023 07:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjKPHWE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Nov 2023 02:22:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjKPHWE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2023 02:22:04 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A434ADD
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Nov 2023 23:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4xIJAFYsDP/Rv2J/a7Z+aiBByr44T5LjAGphGtT3wyVUSEaNpaXbdrFLioQQoYi7VmNPtH0zNK5Y8Ie+v1tTW/R43OjsAefeypVlp6+rdLaBI/kNrx/NRigVLP8QwsVPiUlehn9n+CPkUHrXAhGe8S9Pi7xo+6sAmWsWIzXPY1s/ZDTN3DD6ObHZ4pcrmUA6LRekGwC3A75tVZ308eSDTLR/z/twbR/t1LhgUFHh0o4CJCU++B95gQWzy/mB3qcPcMe+XPqKznS8y0idqQiJ9CkEmSWjFyod3AfK25ftJ91vKlFv+CdjkvpgGv/l6FP5KL4M4qgzwyB567Mgzy0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUJwUu/clVBbAzut47GnB9/d0XzutuX6HEEJdZUbVZo=;
 b=fEouwPbs7gir9N/EVkFemPEmkkAdGks/ZzlPOTVG+8sFEX/ze6pE37eV4ckPbVty4z9ifGWtiPDTMsneGp6fXbaO5kKwoxcFK3n9/BtYVjBdF5/SflnGEqjBnrSnzXqQs5oaoQiEZh/k1LhPbD/C7d0mciElNszDGY1vUZr43kXy6vbRVRtu1YMhg8O9OOJpXmwB77hW2hgn1XoNPFVOawLrZM6Vt/GEA3YxhNWzungWqyGfe00UZ7widQcyIc16lqD7xwXFHDdWpgjY1aKbmGHQsDoNMpdWtmT1lGQ2VTkGmSsDQqnCq+Lt43wUT0WuN6grLiGhH7tvrbYv8u/ahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUJwUu/clVBbAzut47GnB9/d0XzutuX6HEEJdZUbVZo=;
 b=Jl6FTTP8RdHJcUYISr8MC5K6UE4xukjYbL+uRrkKv+l32ZajLeeCS/B7x7HnVL1HXenhTRUEstq/ThwTwfkxUbejyuP80l9JIzVoG9CqV2NCp7CYvAfmqbOWlayEbrPHeEEYkL9ElHu2qHuunUfz4jv/Doc3oFMmgBNyQOUOa1g=
Received: from CY5PR14CA0025.namprd14.prod.outlook.com (2603:10b6:930:2::6) by
 DM4PR12MB5166.namprd12.prod.outlook.com (2603:10b6:5:395::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20; Thu, 16 Nov 2023 07:21:57 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::59) by CY5PR14CA0025.outlook.office365.com
 (2603:10b6:930:2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20 via Frontend
 Transport; Thu, 16 Nov 2023 07:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 07:21:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 01:21:54 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>
Subject: [PATCH v3] platform/x86/amd/pmc: adjust getting DRAM size behavior
Date:   Thu, 16 Nov 2023 12:51:24 +0530
Message-ID: <20231116072124.3370008-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DM4PR12MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: eddf270f-fd05-41f0-1ab8-08dbe674b767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvLGdGFN3h29DtHd7j1gstwecvlJFMzKhSS5ggNu/TUGTQN2IF2owjjTCKziYBSJ3G0qWxfOhVLaC+3BYlaPMM8r05kWgdmBhBrkdBBGJPeERhOaPuEVRcxZqhJdmpWjBcMW74EEoenEw3V8RfsrHjYcBx2mRp0sx/RKqVbl6SsygQpZYOw1xNbg5a52fViPF/z3gYX7e7nk/cfcDTRXlbIuVDRe9v5gmXO9AnLsiv/NAiAYyPqpvi4dyIV6fBiuAr/ocRJFtIDa+3CcFyft8RblCcApspP09/EaP00rmw3lG62oHVEwl6Q2ov5TxhG0cm+AE+tQsp+rmX8q64p0LMNM+fk/+ELnBBE8AqjG7OluuNAl5Lq49Gd+I94nZKzUW9qBZ8PUT6ZKPWRvHrDpB14IrJX2Fly6aOGwQQYsQcgtMconTRXfUDogXOypAW3whp9ydV0kR153AN+0y/bSg9cTwInQlPKz69y8KgK8q5P1GmqnKJf0/igrI+b5RFs04YhtnbneJCRTG5eC5wqngxZ7SnHK3kPparUIHj1+PHkI6S8iadGNcnFZaq5m3MbmP38rKvznKxFaLB+ylOP9OFutyBW45r5iK0v/TZ08PdFD9/jnhFbzM67Cm5pyFEXZdF41/kSlduvEcfCHVZ3Myzt5nv3X4FVjnZmA7lPJFIgLWIe79Ek32Im8EF7yMfOxBP/X1x8uNYz5LsQrQyaAOeUeZkj0AONBXizwUhA2aIaosArX3UAqbDfmXaRqxz4uoiDX0EDe8w5EbvsfQoaKlg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(478600001)(966005)(2616005)(2906002)(5660300002)(40460700003)(7696005)(86362001)(8936002)(8676002)(4326008)(70586007)(6666004)(110136005)(70206006)(54906003)(316002)(36860700001)(41300700001)(47076005)(82740400003)(83380400001)(356005)(16526019)(36756003)(40480700001)(81166007)(426003)(26005)(336012)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:21:56.9545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eddf270f-fd05-41f0-1ab8-08dbe674b767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5166
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

After talking to the PMFW team, its understood that the "get dram size"
mbox command would only be supported on specific platforms (like Mendocino)
and not all. So, adjust getting DRAM size behavior such that,

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
v3:
- Based on review-ilpo branch
- Remove amd_pmc_get_dram_size() function
- Remove prints that are noisy

v2:
- Based on review-ilpo branch
- Drop calling get smu version from probe.

 drivers/platform/x86/amd/pmc/pmc.c | 31 ++----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cd6ac04c1468..c3104714b480 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -964,33 +964,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
-static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
-{
-	int ret;
-
-	switch (dev->cpu_id) {
-	case AMD_CPU_ID_YC:
-		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
-			ret = -EINVAL;
-			goto err_dram_size;
-		}
-		break;
-	default:
-		ret = -EINVAL;
-		goto err_dram_size;
-	}
-
-	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
-	if (ret || !dev->dram_size)
-		goto err_dram_size;
-
-	return 0;
-
-err_dram_size:
-	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
-	return ret;
-}
-
 static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 {
 	u32 phys_addr_low, phys_addr_hi;
@@ -1009,8 +982,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 		return -EIO;
 
 	/* Get DRAM size */
-	ret = amd_pmc_get_dram_size(dev);
-	if (ret)
+	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
+	if (ret || !dev->dram_size)
 		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
 
 	/* Get STB DRAM address */
-- 
2.25.1

