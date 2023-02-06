Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39E6C636D3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 15:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjBFPJk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjBFPJj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 10:09:39 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B434C00
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 07:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d03VNs6QPNCcxyG7NxqD6PUAvZe4E42oPaKDMAfXIziOr8SCfSWiYY4q2GzLjLMuymnn5vvcqUuHcE1u3P3zy4It5NSbMgzTyq8QDoJ5uRqDreNd/Po2UoIFmXaCE8qmE6yrQl6orRc0ATN2Y1eXmYxqPgxDcTKGJsd3BzuHC3CBymFW6eCqWsJrBZqh51reTFXgqXVqh7SPBlI5oktc19Y4m4XUM2DOBL1HE4HP+LdiEMZZhnkCQTjDfOxV6T5SUbvo/Z65C8Zu3cfiiW52AkKqEWpuQ9R0yR1i04e4XCtER1YUNND86XSUDGSIDwSdI9qiRlCzQXc3iG1v2NLmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD/DIJ2ioMg+Epb5T5eiZbBUeZFNfdETHugsw9Bjros=;
 b=Ox6ZKetelFPzoWGYGqWAp3tfUbyhIQQZwTrxFkhRiGaMmTmNWOIuvtWsugK9j/AMD9LPnXe4UD7DD6idu39HcVeMhMXfktPSIHXjyqPxpY0v1oVIe3Fi0MQhRmAV2QrgEI18cNRPOibdErsCuhqHKEX4TUtxLbPWEcxtLjpvDcrQ5cHznAItz44/lcCJiS9otX+pn4SAIzdq0rQUp1rZPUYoY94feSPFuf1JJQdbKby/kNLGoSju7eMr5wy9QnEHIda+uzYCTMfvraG1q9qNS7HXX0+X7ACo/6GV9h7BGrflqg7xL9CTO+Swq0BNJbyOrXQxkbT41Oc63ajjLs4wsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD/DIJ2ioMg+Epb5T5eiZbBUeZFNfdETHugsw9Bjros=;
 b=dt8uFh0k6LTkDz0oj1tIFEgQz3mkIuSILEPY/4QQJ74U8APrIhEiYbkzniCvvNhYPJLGPniekYAAWaGbgjgac36m/+mzn/+6EzmCqEVzK1ZKTiVWgeD1WK+EhJbuwy5ISmZXs5UGAORPJYjMeO3Oa6+YMyXQ2PNYsVjvYpwTA7Y=
Received: from MW2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:907::46) by
 MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 15:09:33 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::f4) by MW2PR16CA0033.outlook.office365.com
 (2603:10b6:907::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Mon, 6 Feb 2023 15:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 15:09:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 09:09:29 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/4] platform/x86/amd: pmc: Add line break for readability
Date:   Mon, 6 Feb 2023 20:38:55 +0530
Message-ID: <20230206150855.1938810-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
References: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 8793a0ae-d39a-4f99-2a22-08db085426c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XofPVTiOljuAGs/wBNuMtUH2lg0HMSgNsvLgfUzf/t0hZiC8B581yVtbCVXVrYSGoCRBMHqWnXC4h3XL7pho3vyAeVsVfr/xxmdNoyjG8sb+QJoNyLKXAWNYDW+ouBynnFvz60Bjp5u6hhb6taoUWfYWysGVUMVsemPo2nDoxvAxFpwig27h9Hk4JAwRh9/6TsnBrUV3E3BnXjYlw49+9CM7JmE4RdJXnrjDIY4EWdZL3hPCrtFa+jnl8uZ+WHyzg3M13YuTCkdBE2+Q9IdHNcUJimxyk1v07E+nYURSzrQq5nO4cubWoj5aKT3CG86uvQNzV2Ydpc/3mJSKg2ysvklWfAOpsMaETT9vqvR4xUp0iS0We5bF/qBxdVLwmdKZ5e/FzVei2oKIjoIN4R+PtBofeJS2E1fQgJnlYRvBrS/oZ+zfUQT+8H3Ciha5ygi8V9Y9tM9UaisLNScAVstJ2JeQSiOZbzlHLfX8U0oWSMQ0B2GS2a5fiahWHDzMMjcvvCHUxPPqafeOk3ag/p+ixeUTocAiqYZiZlKEqwJf6KHg9HZUKoMiNwpurYorDTTOudy5C8yPlhU5TJRGLzqoh2XRItoErfYmRLFxQzQYqrnQaGrpB5SGH8svuB/7n85l4RatjT1yyBDmxG8CAz7YU42G4oN63Xx8zVT1W0NODZEbqtjCqeqtrqHw8lArifebHj37X6bRFI+ZsjqKWHzhMUT3RhryHQFNPSlcr2jbPIM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199018)(40470700004)(36840700001)(46966006)(54906003)(110136005)(316002)(86362001)(6666004)(82740400003)(7696005)(81166007)(16526019)(1076003)(356005)(186003)(478600001)(26005)(82310400005)(2616005)(2906002)(5660300002)(4744005)(40460700003)(36860700001)(36756003)(426003)(336012)(40480700001)(70206006)(70586007)(8936002)(4326008)(41300700001)(47076005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:09:32.1872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8793a0ae-d39a-4f99-2a22-08db085426c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a line break for the code readability.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index b99fa676d35e..ab05b9ee6655 100644
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

