Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44111C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DFF861C6A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbhF1LHv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:07:51 -0400
Received: from mail-bn8nam12on2057.outbound.protection.outlook.com ([40.107.237.57]:48225
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232617AbhF1LHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:07:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glQ6zUXol8wFKim5FWlLevbgkguq03ktZd9hI30MnvLdKy3gexUx7+w+ueIXAtw0cyd5hSvEzwt2JUDm9bLQr+i/XcGja0pKa+BnAfxfavhqR7HSRT08TqeAR1Z3y8vQZcnQqBNx20o3txtCvdReslk1DplygpB8MvHldakiFMkICdi6tdew6KA4KrQP2yOXH4ejZRzKaqswlIgTTC961Lz7K0Cczd67Sd87nW9VkwWbXzDoxaYpaPzY1YGGL5hUaHq3hlZv6igFAX1Ur7F0ZIBQhf63P8IavR29ME+n3Ujxseihyw90nVgNAldyNBWYdPhdsyPxoDRK4pe+DWdF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWKe2u/Hn2Lf8FgyR+2YCOf6Aa8U0OI3AfTv5ltoCnI=;
 b=n2WjsPdorCyhNQPstK050GC7f1fbYtdWMebfExzljNChBJ7ikk0cLCsnD0uEeIjC4RozbzlPvHxDA26UxA8Dr4CJkx3pqQ5av9+hBBQb6JZO6u6wUc8TJ4uU3c8W8RqflPxlxsY15I7LyFl0yVZak1lWnC4dhwySsiijYuAdbSgjG/9MR/f3nk65O0DJ1NDWRhXhmgnGAtLtZ+C7zq9H6tAeP+Rmjw+fxhAQMrC7aoagp04Q5/J1eW6lIoiBtGM+X2ajfh7guGOqSMVHHfkrsUZaMXq/ONZgVFid67IgbV/+XaKiid6k51gBHwfC7NZeE+7pRExauHUwqDFYhxZkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWKe2u/Hn2Lf8FgyR+2YCOf6Aa8U0OI3AfTv5ltoCnI=;
 b=B+IvSYC5GxgtpcEDUzk93SFkZ78RF+VUkJvz11wPvmuMKeHObsOvUDwUxRAd0GRGX2B97yPB4TlHfnnl9TV7cVPB52z1H+7sA1SEuPiTaGz5vUVCAl+v4zsSjZG+CzzRvtRyCmG7GrirJYN2bapbpqQSRVWMdxZm5ewVVbswmsM=
Received: from MWHPR15CA0025.namprd15.prod.outlook.com (2603:10b6:300:ad::11)
 by MWHPR12MB1680.namprd12.prod.outlook.com (2603:10b6:301:10::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 11:05:20 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::d1) by MWHPR15CA0025.outlook.office365.com
 (2603:10b6:300:ad::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:20 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:17 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/7] platform/x86: amd-pmc: call dump registers only once
Date:   Mon, 28 Jun 2021 16:34:47 +0530
Message-ID: <20210628110451.4047142-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
References: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d19618f-f7ac-44d5-3077-08d93a249ea4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1680:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1680E1EBDD5FA1A2F2D3D6DC9A039@MWHPR12MB1680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ua1rFjlAkqEjBTQzUboTezEVZZ+EWAvrCZOat0VQ+/kJu0ETN+JioKWrjLZHDE/5akpCUbAFQPPTLLTwG6mAd1cICjKeN9PjxXNaQayQd5ThuzzAiQqBygU8WSiaUz5AriuD4f/oidRBJWDpL49xm3Ij9it0de19wFVziMgKlQYlDM1UnDEfvy7F7IOvV/+QNgvKt42N6gVRgaERSThcD1vq61WWuD26EKiwtboXYcz8Ys1MsRjlG7EUtJHfP/KudpLmjUtiWLrz7RwK2dLmHgqdUgUh9XRTkuzz9McSwSZx1yNuanETdunGdrUL2+lGuyR8/IzmFAAyXBtJtV4kItAzzYlkpVM4iRq8DoXe90JSkiXrxZrhNpJW4kfGjIrR+3SvvGBj+BtkCTPgsEkKURhfUWrhhs6CYQXdLvenrfuQ/HG0sFJFtV8a2vSyFmWNLOnrXrpUR4vqiiFexV5s9A0LAqfp/8PlckEai4yx6dDRMXZa4plXCaTi3OoZou5jVrd88uJux+9IhNG9tTo4cAFrOW1Tlqb5F+/44UOkh+isIlLrPAJfVXV2Y2TOJt8HzEENlsdsPqWiUl/oTuJmMjVzQ1U3tOASlsMa8bgf31vudX21tC7kGyHUNTa2kBZ7O+gIqeCM/9HMY8WOU2i9cRbZa+ZmoqBO2qYeCBkhomUAWw/je9HfQDa6t5A+LKv3QAl61G2KK508Ao50zicJ1xol0KtuaMVQONKFUlh9Xh0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(6666004)(336012)(316002)(54906003)(81166007)(110136005)(356005)(16526019)(82740400003)(186003)(426003)(26005)(4326008)(83380400001)(47076005)(478600001)(82310400003)(5660300002)(7696005)(2906002)(2616005)(36860700001)(8676002)(70586007)(86362001)(8936002)(36756003)(1076003)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:20.2760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d19618f-f7ac-44d5-3077-08d93a249ea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1680
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

 drivers/platform/x86/amd-pmc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index c0c8f950033d..5be2b1167c6b 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -173,6 +173,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 
 out_unlock:
 	mutex_unlock(&dev->lock);
+	amd_pmc_dump_registers(dev);
 	return rc;
 }
 
@@ -185,7 +186,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -198,7 +198,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "resume failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -270,8 +269,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
-	amd_pmc_dump_registers(dev);
-
 	mutex_init(&dev->lock);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
-- 
2.25.1

