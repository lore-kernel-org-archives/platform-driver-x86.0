Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB45C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 09:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjEPJSo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 05:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjEPJS0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 05:18:26 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA184EDC
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 02:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7XEcGXnO4xr4sTucvE11ZvuMq9COhXO8Mj+Kvd6RfOEUDWEOxMsG0pHOXjIaokJCNOmaiEw1F51Cws2BUI5okM8Agy3Wu7fO3GHPoC7rwKZkQKl3CNIURcFv/UGxBHMoso69r2YZl4V1v4fAXoO44hr6pAHFWKcynoxLQHICgzJ3zCELBWPgx3kJXxjAsyPimefrB8TgsA8E5t4IiQYrKXjAhAFCQVD0g/ZJxPzbaxxfI4K69Vqu+rkjLrNC2zXkaaMNBfKWtfEwhjtZ5gSB+SDJ6mTLhcf15Fm3asu8tXyq/lX3y7RTnkejDqay5mG5fn4c5Hx4bO5W9LctIR2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYY3Ia9++BHA3QtxEp1Zcr5hKInS1KbP1JcTw+wJwiE=;
 b=PuDtcRNTfi/YozPx/uF7hGBScFy7ydtgbJyqi6o9eOy+DcqJ1Pi2Ni/y3fYWc751XF7IV0CDar3+8XwELQUXrPQPK6rpn+7cCXPf6nqlDXSm07R+vF+qzzDgoRUVV1hNDeni7gcBgT+wpVFy0qxfy+u9eWIm9HrbNuwWtL6bAG/7qldnWvOrS0R4KYKxY8ChoVVvri2gEbd2+5f8BeuemWpR8YMicKggf4B8jAme9b2N63doMFVg77jXspsGNTY4mvCc772JNqavUrY/kZGMMkgImgGhovESq9d/UpwR04e7DXYqQEGQQp1ry4wO1xRGm2dXE97ww/thhvwsFNvb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYY3Ia9++BHA3QtxEp1Zcr5hKInS1KbP1JcTw+wJwiE=;
 b=2+c1dvz+gtiIJEYzNEZX3kXy7ECS/TyoZEo+trWzAZX9RSeL7IoIqsmIt/YXPPkeOUsARWVgBeAUAG3jzcLlziFJSNgSyS1fRNYlyp6Qqp8AoYdc8WzdPIpCgH7SL5DBlA5MX+ZGqF4j9usD0cAzeBo2n5YDjohCJMgis9dZaFM=
Received: from MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::20)
 by CH0PR12MB5187.namprd12.prod.outlook.com (2603:10b6:610:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 09:13:36 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::82) by MW4P223CA0015.outlook.office365.com
 (2603:10b6:303:80::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 09:13:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 09:13:35 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 04:13:32 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/4] Updates to AMD PMC driver
Date:   Tue, 16 May 2023 14:43:04 +0530
Message-ID: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT049:EE_|CH0PR12MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 77aa842c-7083-465d-6c4f-08db55edd3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FelV3N1fDtPzHqtZSB28CEPNoOA7o+slYAV2czUMmzZrI7N4Cu0Bhu2WlrRTyBrIA0Q2Vn/jc2uMioGjr3hW5nawx+UOhBr52YuCOJebin3ZCUT0gEDiJhKzqqV4DYS9fUY2SeNdg8TFagVIM6dwZvr9/iTYEnYAJrZHehDkj/PyHAVmKjYYAUMNUOy7S8jVKyv4Z0YVsB8a+EVARTGg9rXhT1cxi+1x/HOkSOHdvZZmBi4G0HSv6DUh2EVrCi/eWS301NlxN6sEHnAMryCCR5EICJgHuJCDOphNKwEvMKNM5j2duvZEdQhrMSxNtSQ02PmHYTB8RJeOZjA5Y9trkTFNdyGescJVAgnmIwgAiZd15bITT76w8jIbQro6ExJ9+Ek6RE4T4A5L2TKxr26ttOXqImoKYjREhIVi7y2NS06yXvUECa0kA5CHNaC7Tzfn/8LX2LiNScK8f4670MeZlJsW7Zm8st6vF8cUz6Owb0L2TUvCdo5k7t+hcVelu4eMB2/dCplLPZ2tXwCo6FrdJgMk5CRjT+Qa9aRBUz8qePk+HQ3g5v7LljpNBGL9uR/1yfCNPklAZ9RveE0fijRxMUJZknj2xR/8eG9WuSAkMSkR0x07KsHmcHasuCGxuK82pO+Qpr9q8LDkctXnI83yusAMen36nihROrtssURjU4yNAtR8HbLq1OA+r9iYPCizM1qo38Tg+xkKP3J53WsDn+pEfDByeCX5AHi1Y/LlP1akVU5cNQ+JI0FiTrme2aO3OJoqVBZ0dFkVf6S0DACEVQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(356005)(81166007)(82740400003)(478600001)(40480700001)(336012)(426003)(2616005)(36860700001)(83380400001)(47076005)(26005)(1076003)(16526019)(40460700003)(36756003)(6666004)(7696005)(186003)(41300700001)(316002)(70586007)(70206006)(4326008)(86362001)(8936002)(8676002)(2906002)(5660300002)(15650500001)(4744005)(110136005)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:13:35.2591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77aa842c-7083-465d-6c4f-08db55edd3ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5187
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Series includes fixes and feature updates to the PMC driver.
Series has been split into 4 patches to incorporate the review
remarks from v2.

v3:
 - Based on review-hans branch
 - Pass true/false instead of 1/0 the amd_pmc_send_cmd()
 - Add helper for supported cpu id check as suggested by Ilpo.

v2:
 - Based on review-hans branch
 - Add a switch for cpu-id check based on feedback from Mario.

Shyam Sundar S K (4):
  platform/x86/amd: pmc: Pass true/false to bool argument
  platform/x86/amd: pmc: Get STB DRAM size from PMFW
  platform/x86/amd: pmc: Add helper function to check the cpu id
  platform/x86/amd: pmc: Update metrics table info for Pink Sardine

 drivers/platform/x86/amd/pmc.c | 123 ++++++++++++++++++++++++++-------
 1 file changed, 99 insertions(+), 24 deletions(-)

-- 
2.25.1

