Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7835C61DA0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 11:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbjAYLcL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235400AbjAYLcB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 06:32:01 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B962422A33
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 03:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqVbQR79RVk1ysy4x2RIVPfZAwEnBLK/mgaPiQZx6yBr+rRdow7rCrPuWapxi1Z7OQE8iMEqRTHWQzc0zg4p3vlCiaOMDdxGMRrLUjazlKzF+rdUPnphKrUCmUtYnVe1GP73WS4r8rJ4pNMgYYND/vEXdlpX1yAYHmxIA9E3OivRToPmFI+7fg5OeZJna5LzYDGVzkpwNAVlL8h1JVRv4/gkCS4rxCfuiCZTkxxFj6QX+aNrm2h4m8oTg/mvCfmYdq081OROpSw+U0riURTuZ4oKHwn8NDLjiCwDaRDSkloIfgKuS22d0ofsLprz15zyBYq5czCRYbt6UiyotNQGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9dIJQRI9wLy07EbEGrpzo2rckW3L2riCQucurRWLqA=;
 b=Wca+9X0+VubGS7kSVqZCe2n7d1T+OBmXm4s198B3CGs6dYMiefXWnElY1b48DQ9KklrdrjS5es+hR2Xqoy+bXqA3SLN8K6p6nH9xGMKPohkbeN927R3wYv1nBOOyz0zdlZl3g58dstjBVrZpaKaFabWXa4CL1EOY4MXN+WOX1iguDaXNeADXIKdPLyOTkROcUPDbGqnTqSsUctjF9ODOps8uzFW0miyrITuyy+IFXwowvBAsnVeSJmVi/Ez3GFRv8vl3MddlWAw4Im1yPh46IY8qV4/kKV8PUpgVsERsyTl63RyP3vbyWTD744cfsMmcIVJV8MQhB295j4QAyHsuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9dIJQRI9wLy07EbEGrpzo2rckW3L2riCQucurRWLqA=;
 b=WU4XuGYb/6ndSg7kolY3AOgGbm40mYY8eWG1j/21eO1h+Lk6pbKuUN96WVOBSgHkMo2+2vlak9hDub92NLtc8voU8h/Y8Bek+bnrhH5dlt6GeiqJEZjrKTQV6bzxMCyFX6SdgiqGuX+dBnIb/HVKytdzJ0wVsFzHPUszJHoLtpk=
Received: from DS7PR05CA0088.namprd05.prod.outlook.com (2603:10b6:8:56::14) by
 SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 11:31:58 +0000
Received: from DS1PEPF0000E632.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::b3) by DS7PR05CA0088.outlook.office365.com
 (2603:10b6:8:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 11:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E632.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 11:31:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 05:31:56 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/4] platform/x86/amd: pmc: Add line break for readability
Date:   Wed, 25 Jan 2023 17:01:27 +0530
Message-ID: <20230125113127.3862898-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E632:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: ee52af19-1db2-4ddf-82bb-08dafec7c50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0m00cAsGX84hCUsskXsc2nI9hUe16CZu3xGLP8jqJqfVV2jcnRsynPxBOXoGVu2Dkp+9TqBIgOQYXrithf8l/n6TbkB9VgZ+H6r0Pn7w36eF+m2qa24jnl4fOqe8P8RV/OcyQ6qfXwrM3JnGF6YPeIIA6njrYul3ueKJm0AajvuMRgELV5cbr1fZMmJOBevSLu0jKFNiKB1wq1sFWqgCHROWQzLQUG842UVDIGr/KJJ6T49/bjezfm5bjbv3pbONCNo+wtHnQjPw2jYLU0eCd4OxiUDfPwhcuNWaAS3gVr5ON0T/K73dgzMaEiP8UgHC0hHQY0o4W3RGb4Oh0lsOdkda3R4K1OgQtqIQ+hkiINOTZB9tUDkPofD2J5NBEP/2n/rDq6W07KfE74HuQ2fpXxdJ/qaZzTrK227nxiKO17E/qbmr1W1WFbe+2M+wmMeXo+qNo5d7J/e6SCNT2SA6eWUk0dXFzXbGPo52KBZp76QnNJDFmM4d59iskBdy/pNM7lGSV4gqLZReODy0ERrM3VjKtyPMlypLGeVvusxXiuoflfQtN7qmD2llpNTaCCBflMBLMRyYiNeQkYQjnFaylSuPp8XfSg8/2a+azTMcrkZGVHVQCxFK+HXYu82igtQtGWsuMt1Ul2H+GrBAdZ4QixKTNu91E23oPD/OD0FQrCsSCEJN4d3rR21L2a0PI5y69ApQGsJHtZEdhrKgsm2QV8P0XPQp6OAGAzVMxzlXa0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(36756003)(2616005)(426003)(41300700001)(8936002)(47076005)(336012)(81166007)(356005)(82740400003)(2906002)(4744005)(5660300002)(1076003)(86362001)(82310400005)(186003)(26005)(478600001)(6666004)(7696005)(70206006)(70586007)(8676002)(4326008)(316002)(16526019)(36860700001)(54906003)(110136005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:31:58.3509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee52af19-1db2-4ddf-82bb-08dafec7c50d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E632.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a line break for the code readability.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 467b80ad01a1..8afe77e443cb 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -105,6 +105,7 @@
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
 #define FIFO_SIZE		4096
+
 enum amd_pmc_def {
 	MSG_TEST = 0x01,
 	MSG_OS_HINT_PCO,
-- 
2.25.1

