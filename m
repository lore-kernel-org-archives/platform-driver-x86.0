Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67402C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 17:15:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 497EB60F92
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 17:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhJZRRZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:17:25 -0400
Received: from mail-bn7nam10on2041.outbound.protection.outlook.com ([40.107.92.41]:40993
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230160AbhJZRRZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 13:17:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en9PmEUnATP8Yx7FzBIsHroh2cB3UcjbbG5JpqLuYWgsG/qv11rD6aw6+ydSyGfO4U50FZJABGw2Oa78kDNALlpNA9YJ3lRAUmfKLtG4pzsphAFNpxmUHMrJc4cL6zuFl7ygeJLgf7t7BQa5i7l6KSxDCfRVWxi70uwSchuPQRomPz65a6SkIQN7eEEWDNT5wV1si7Z01m4vcRG/PSB+xvFH4TrW2JMhSgdx1XF+CqXip7u5ETX9RzOs+KtGIXfeQY+EP6yHcVelAh8DzGUMhJ+R1cruOPQuBvRLC+M7gmvDyGSS5thH2878gzOgB3I9GZgY1gnAXJyuiJjMujDq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOlY/JLUETslaSaMeTVFxHYdkr9OPuFUaC487Xj2DkY=;
 b=Lojz/SvNhO8V+9cqqAFKAUmQXaIC9/g2L/9IYi5Y+Fagjo1XXTfkuoWNgYtSzAs6UgREkoQD3vgJsFWjM+90XT7L+RFArUVWj4kBP/J5r1iV8E9gZra0escdstNeG7aRHWnPmhLMCvIGF23xp2IrWJPPKbDzG1PP4mlvmLcTCSaQwhsytMbS+ne6XtqXgtquOBFopbkBNXsD7YZinI9mKYcxDsBBW+5KMXUJAaeqjCYTKSb05UCU7rvA9pPjPLhWUeJ0OURvol/Axm6vPVYE+ElR5Z4bE7yT45v7FNL/YW0oiqnqdC+iKxpaWe4f/Da0OAIT1AKWI9SVIaCz4ynCdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOlY/JLUETslaSaMeTVFxHYdkr9OPuFUaC487Xj2DkY=;
 b=mDcGKESPpp/slYODFr23c6o7dcgC+44VMO7iWzYxLPOm3AeoJJlodZtcx1dsePaSosxM7J321s/x81uULTVkFRJId7N64tDURwwFoayV6hvUrPDDKdlNjtGbV5Zvvk9z4sMjFWzi1b+5uaX77JzSgEQcc4Xi5Za2s6Gf+5ZGN2A=
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by DM5PR12MB1292.namprd12.prod.outlook.com (2603:10b6:3:73::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Tue, 26 Oct 2021 17:14:59 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::3d) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:14:57 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 12:14:54 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 3/3] platform/x86: amd-pmc: Drop check for valid alarm time
Date:   Tue, 26 Oct 2021 12:14:43 -0500
Message-ID: <20211026171443.289-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026171443.289-1-mario.limonciello@amd.com>
References: <20211026171443.289-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7890b9d-d80a-491e-ad4c-08d998a4228a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1292:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12928CC4D9CCCA019B8A16C0E2849@DM5PR12MB1292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHqNxrpX8J0OU9aULpCVZLUvPks+msHBZwoJNvwJ6Vi7HmFD3iof1BdyakliK/HdSLjvtV/xTxCdaBDHWDQSDsOoABXv6QQIdgcT3Cmn0lF5+DHcECELlLIzyM+N9XVrBqR3LELMseDOM9uzOF3tbCDvazk4QxEJZTNOd1miUO7wxalmhLJUBU2Ywsy7rvG3SQ8KTEgsNal7Z5j+nb0E7gCEez59ju0gbca6LyTKViAPxXxBCX4XuHyn2h6dMk1zh5vf3JBic8xyCo6ezK5GibjSZkz2iRb0MurGt/4m9+D8oLyl8JUKvTNHmH/eeivlZYhBncs/rTbAqUiIuuLd7DTai/X47cWEI9H6BqsoXOPAV1B1t3GFvFTH25wK5NQTCABUi8IDeteS3N7bBVB3OcdjQ/OBlLtH+U71I3hLsQFasFCTmgdkG0+vfeWFI971MKDax5A6SDd41Ln3nnqgG0jx5de7pjpAFqwItLDrLADe+/z06eZl/9QDJ+GBG/CPSJULww4C44QQVdMug14nPjxaXfblmDtzdRfK4mvPpTuam0FZVQn8I1N5D1W3hBJh6SfskRsW2JvQhJnk27AH0pOQclPObxgOAgq0z18yR0pqOj9GWJkyA4bqSBM8GC4jWRuZejWp1+qPHTJLkZ8Znuox8YcfTXhs0DKRqtMse6QIA5iXxlUCEemyDbK9IPU2w6KWH8RLoNYIc9ysOShYCi5q8r2HJfrPhypWEtIlUV8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(7696005)(82310400003)(16526019)(83380400001)(6666004)(6636002)(26005)(356005)(2616005)(70586007)(4326008)(70206006)(36860700001)(336012)(8936002)(4744005)(2906002)(54906003)(508600001)(110136005)(8676002)(5660300002)(1076003)(186003)(86362001)(36756003)(316002)(426003)(47076005)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:14:57.0778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7890b9d-d80a-491e-ad4c-08d998a4228a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1292
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is already checked when calling rtc_read_alarm.

Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 81f3b9d79f43..b7e50ed050a8 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -435,9 +435,6 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 		dev_dbg(pdev->dev, "alarm not enabled\n");
 		return 0;
 	}
-	rc = rtc_valid_tm(&alarm.time);
-	if (rc)
-		return rc;
 	rc = rtc_read_time(rtc_device, &tm);
 	if (rc)
 		return rc;
-- 
2.25.1

