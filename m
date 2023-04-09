Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7E8C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDISy4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjDISyy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:54 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA98A30C6
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUTs+Zoyct+g3YGWuHtgfFJ0cf//HJQ6tcMmN+f8kT8RDPLwC29i4IVBL4s0knHKoArzu1YsUUQoUPi1W5isNLQEapSQGtT0Ytu7bPYFb5yclSTg/EzRuak22RMA9bc3hM0A632YecWgXR1o3GnQNIGDt/VXrMZYCHS+ynXjSrzAwHedMhHnHAPHl7MbGUms75xtnnWhV7NdwfSLGxjl83cppT9ZUSkNSWnH2NNxSvOm02a7XMLfxAIhSoyGoi2QEvJBSGW6PgU8dL5PETBb91bqTACG0jWa16pSkL0iB2XzcbXaubNHOfnZNqm3kfcyAhw5oKchqwNMm1ibMnbC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSmLBOLSCszdBMNbwXp7nuT+emJMJpynp4h7XgcVd84=;
 b=BoT823W1NBi/CkFQjqLGHnjAqtgNIRDV6IPF8IdPCrjl9xu+kgIDeedFvmyucYcMc0GEVa0NXdM7zqWpMBfO1se14De9nG6/BqEUCLE3XXjSQY9jcgLH+/Iz+aaJyAP2RulBB0ejpMBIN7p4yES5OHjoH6MmrTUF/2jYpHR7wZ7AARmPo2bl21reiB92sJ/FKK570uy81H/idGV47gIPKRUbfgBNvOWGqAEvQCmwRoMCByGfKbE3rVUa6xvPkD1tKPgNY31IwVnyj/H4V+b12ngtJD1040NpxtXx7FON0RN45HaT3rKmE+yP/+JdnRAUFVm9KtMPgas+yzZD1QHCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSmLBOLSCszdBMNbwXp7nuT+emJMJpynp4h7XgcVd84=;
 b=WMNkp0TmNti0OFYKB6DYLM2/M1AAjaxXi2NiFAfMMdv28G5TZm3H1mbLXZKHwQ4ckq3WptqeHfC2+tckLy8lcFKYuTxLFAt3ERt3GJszjS/PdUL/TcVMbSe73oeYlP2FkLQgny13dcYV3HR/rw+T+u92QXXK7peDsJ7OAc6ZPeQ=
Received: from BL1PR13CA0095.namprd13.prod.outlook.com (2603:10b6:208:2b9::10)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sun, 9 Apr
 2023 18:54:47 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::6) by BL1PR13CA0095.outlook.office365.com
 (2603:10b6:208:2b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.26 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:44 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 3/8] platform/x86/amd: pmc: Don't dump data after resume from s0i3 on picasso
Date:   Mon, 10 Apr 2023 00:23:43 +0530
Message-ID: <20230409185348.556161-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: d14cc46e-184c-4214-1a99-08db392be36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkKmngx7DIh24j7JEWxbMXvypIv374MKF6QdY05YiczEM1CKwuLK7/TeTo5JWWOkqHeJce7q5iJwgG4rsCtBePXcqo2QbyA02zPN7MrZycbsx3ku4SDGymIVQtuaqMUQ7Trr4Gb7kRhihkGMm2kc0vN1Cm+ZxH+xsuy+NRL3uZJkKdDbRY5CeIHtAucgorbgcY+ropcbgzEMgBTHJMO+9GXzYhskenRb8MgqOPvXLIu2xvFTCZMxB6YyTek+nOTCFqJqNheRXdD4La7IaUKmOUfN9GRNh7gylcNzjAA8c5fVmt+hFaVwGinCvuQQruGpD/zbxbhMeaf4rXQCEaeGSopXcwTMGNjJxJHkJgTJezi7Q/HHA0Lv5SChb1QbSlrgbXjR01Iffl14GfBYxnB6A507987EUsmvziESxkflZjcZNbDpXvOWit+vt6FJ5MWpTawr3UsQwwVdDwLaJeKa8sGJ7AT1ETjPFB1N/0ckGusbTeCbawoJVrkU1d+HaIGWS1Dv3jN7AzmTOHc2pNVJgz6HPxtNkTMP5415wpZuL3DT3K0cYQDV8f+vOZvt1lf7UrQOQtPuF/p4GxIM7byvpi2eZGkgsFkU8WVPp5KYbBfUFLDX9x/gVJpGa9kA9xBFbKypJsXCjdtx539DeD0IPjkTTwvgHVc8o9XcaMQZ7udSMukMf9LzksCyaSS+9fLk
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(70586007)(70206006)(86362001)(26005)(1076003)(110136005)(316002)(4326008)(186003)(40460700003)(16526019)(36756003)(966005)(7696005)(54906003)(82310400005)(40480700001)(478600001)(36860700001)(8676002)(8936002)(2616005)(5660300002)(356005)(41300700001)(81166007)(47076005)(2906002)(83380400001)(336012)(426003)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:46.4675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d14cc46e-184c-4214-1a99-08db392be36f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mario Limonciello <mario.limonciello@amd.com>

This command isn't supported on Picasso, so guard against running it
to avoid errors like `SMU cmd unknown. err: 0xfe` in the logs.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2449
Fixes: 766205674962 ("platform/x86: amd-pmc: Add support for logging SMU metrics")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 9f824ecd84c2..f3a099550ff1 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -839,6 +839,14 @@ static void amd_pmc_s2idle_check(void)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
 }
 
+static int amd_pmc_dump_data(struct amd_pmc_dev *pdev)
+{
+	if (pdev->cpu_id == AMD_CPU_ID_PCO)
+		return -ENODEV;
+
+	return amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
+}
+
 static void amd_pmc_s2idle_restore(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
@@ -851,7 +859,7 @@ static void amd_pmc_s2idle_restore(void)
 		dev_err(pdev->dev, "resume failed: %d\n", rc);
 
 	/* Let SMU know that we are looking for stats */
-	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
+	amd_pmc_dump_data(pdev);
 
 	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
 	if (rc)
-- 
2.25.1

