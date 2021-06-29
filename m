Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20551C11F68
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0617161D4D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbhF2IvE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:51:04 -0400
Received: from mail-dm3nam07on2066.outbound.protection.outlook.com ([40.107.95.66]:38368
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232601AbhF2IvD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:51:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBEbj8Ocp0sLfa8sLhavJ+EW7tAFrrQ4kl8Sl4n8rJisLJFzTPwqWkjphxG7MvYGcgtjjZ4MywN4ZSxhnXdrZpIokqhtxhCqIBH0ijofGL1sZPnZzQbTKGkqBWNrsoXapB7UEKwP5q8ai8K/PxXLsH3RA4pfVY8/eUjrOfIePGWDDFM2RNmYxbvQxYrBnyjPytN83S6ONiTnrpEXl6wc0g6OhPATytVRMe7U/ioSnCZH6OuRS/776xn87vGA1yy9W/sGbDNxAwsGkaBRsWMgHDPO6BUkKJ2TAuymRSou9Lt6sWUS2/chLiO/lF3DiJesAU90B4y9RagLTQeKyiw0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rh6MYExMeB/Dc+TZe6I+2nyKRuFeL0NRPXwnCO79IQ=;
 b=ZkCS4l146s6p4sPXkgS2UjrclFLDL6juiuMr/gH2RnFXKU25AEYyntVcEb5jd7WtG+Vg2yHOpC3emPSR4xzQ6pwYkOEhiuUw9zzTYEL5eW2DzrRlvgKYcO6vPCANtGnD6yhnUrJeXdTYJAKBU4xx4aHg0h52G6lqcGoV54CA9GnvVyr1w1RRC0TSrjpze45av+duG2dtM2sRjAYIlCGYRq5xJUobpxjYA/8EUQimCLAcftY2UzWywoMH94Ha4Ue7p55c/LI3kOyQg/YK3wUNOa9dirHed3If46hXLgskw4vHRvrn+PxhoBnQh7RelKI5keCeMu+OGhAgUusWLee5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rh6MYExMeB/Dc+TZe6I+2nyKRuFeL0NRPXwnCO79IQ=;
 b=l/CAs/GzURnYI0/7PN45Xmu9NOPXrsFvQNFkmcLQrsGuq9RwCbh7yQEvLHLhmMy1p9FLyjb02K1U04S3C3jqMOfY689jnWMDQ/oaCzQwe9m4jDMFa3unpP5IdFe3WpUpWETFh+6TzF3sz4dMFlRYw1wqglqc54/tLB5R50fVAjg=
Received: from MW4PR04CA0016.namprd04.prod.outlook.com (2603:10b6:303:69::21)
 by CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 08:48:35 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:69:cafe::d8) by MW4PR04CA0016.outlook.office365.com
 (2603:10b6:303:69::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:32 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 3/7] platform/x86: amd-pmc: call dump registers only once
Date:   Tue, 29 Jun 2021 14:17:59 +0530
Message-ID: <20210629084803.248498-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 274818f2-4fb1-497a-f3e1-08d93adaae48
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:
X-Microsoft-Antispam-PRVS: <CO6PR12MB542730550F71EA72F391E16D9A029@CO6PR12MB5427.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mikzdSzqp86yoxB2iBLSKWL+iIByXDMYieiTY7yYqk+o571s4Vr7Eji2UYrQ3AkZYpEAw1gDxunSz8uPXWPXDR+CQSYJex88RPvUwBjRKywRPj5PnXlhZjqjKiUco6MjPPdUstLw0PGkxJAyEsx31ocHi54qA6r0k4KU3vBGhk/2JzIl+W62V3791GwlzxP7i/ZMBCu9+BgbEUeEd9Va/H4D2431GgSVolcf3K6p5bguTr1WWqlsjb2PVYKgnSfR0gd/T0HOUNWDFt7cPZr96bH2HNEV+XYnhZfjUvStG0Vga7GeaInzaumlhgXkss/pSCKNEBN7dbtu6cwXrQSFy5quM8yIJS/MkEhZ5A0jFyNF/h/jThvGBH5QsvdYzItA7oYjuWW1JtMesns1VH7QJetrmX7nySQ5AW3IfWZ9BT6+rQeioWqLpNDc++3AnIhTNYSbgkpj17B/XtVRA4AckWJc8+vbf36FdS1O6VaVqbvi596Xf3bImyBmsX7VkbKOobVCCHFCH+YPU5DSdWm7HdoSiaQCrZvEXMe+lSj2RDACte82gk9XwHawXNmW9QpT5ydTC09R9Y4eRPLsIYcrabAPMM/Kl3tJ00/uxArPsilrxIRe6aVLaUn21os8N6AsJ5u+645Huar797lLIGelUfC2Q/GI9WUeYsw8m3rjyAP1Y14PLHHm6ea1yIQiZBGWtTdj0X4bLOZniAnu/K0BOVJJDRp8ddNu0+hDqu7bbP0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966006)(36840700001)(478600001)(356005)(81166007)(70586007)(70206006)(54906003)(83380400001)(36860700001)(82310400003)(110136005)(26005)(8676002)(47076005)(336012)(5660300002)(426003)(86362001)(82740400003)(186003)(36756003)(2616005)(8936002)(6666004)(2906002)(316002)(16526019)(4326008)(7696005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:34.9304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 274818f2-4fb1-497a-f3e1-08d93adaae48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5427
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently amd_pmc_dump_registers() routine is being called at
multiple places. The best to call it is after command submission
to SMU.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2: split into multiple patches as suggested by Hans
v3: No change
v4: No change
v5: No change

 drivers/platform/x86/amd-pmc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b1d6175a13b2..e5107e3b1911 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -182,6 +182,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 
 out_unlock:
 	mutex_unlock(&dev->lock);
+	amd_pmc_dump_registers(dev);
 	return rc;
 }
 
@@ -194,7 +195,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -207,7 +207,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "resume failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -279,8 +278,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
-	amd_pmc_dump_registers(dev);
-
 	mutex_init(&dev->lock);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
-- 
2.25.1

