Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B02AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Apr 2022 21:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbiDFV3r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Apr 2022 17:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236937AbiDFV2j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Apr 2022 17:28:39 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D7B1C2D81
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Apr 2022 13:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNIF/2DTZ3JEkvNYQ9YXsH/F92UZWYXPY1N6WMNrFPhEvWpWJ1XMksA+eIpOWJTueSehk4ETc7A/FraPgi71LL2JxxGflOvTkPepmAoHwBVRe1xqrkLnDamXjdqq4kjlwwcXrEWd5q+bj73rtTxAiU/GpqSUbzZudILCH1cW4aOyOo9qU49wrPcCXcflQx+pgLzBLMV94xqKSQHHjBTFiGBMqbbq3XrG8J3FLCQ/slx9ASmS5PDFrFiPoVK1csTkl+IBHmVWp+zxbUUU8j6NG6mqfUODS6AlaE6pBEYmNv4BVz3cjN10JI9alNNq2/iN5JfUcANkxJMDSW811v4wmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRB+afLqmFbPV7vYy/ZPGjX/xIt6RETlk4hV48RZcGE=;
 b=S/M6bCZNZQ6z7dnwiEVO+/tBAIYkgXCeRj8GXB1IlpRkw2RyOAvxfY7NBxcZ8PCHNTEB/sGlLuJBO8BgvEEbL//PM5tTTauJjsOpED6N8lV+EasASxRYoVgSOD8dORL4aivhtoiquAfsZzWTh5k226szYKliSIdlZd9kvaie5IfC29fKJapJ5jBajGQJhZ24vwH+HmOZPTqvdTXOTySd6PhiV0FwzS8jnPdG1U5Arww0ZxB+MEvbTjzJ3nEWOg5SCPrLWhX4Jwl1mAi7Z8yHFcS0s5r2HpJ0Ww6P9/zlTYYYyqQyozWXNfHDVsXfiG3sV0hJnqZK3xPlK0q5txGzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRB+afLqmFbPV7vYy/ZPGjX/xIt6RETlk4hV48RZcGE=;
 b=ch6bX3Yu2b79ddz2UGzrA58sDR3zGj4DuhsxZ1zNiB92e2zZFIvI+Nv2UcJOyciNja56tZBzQQGukZ7pMZfzZaks0pSA5FnGM5JpYCv1Aw47nXW8oDcUmp9HJol9pJBhuQLE8hb6qfzGPEN2dGag3Ci3oHetEvpBWEGnBHf/1LQ=
Received: from DM5PR12CA0062.namprd12.prod.outlook.com (2603:10b6:3:103::24)
 by BYAPR12MB3335.namprd12.prod.outlook.com (2603:10b6:a03:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 20:27:05 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::63) by DM5PR12CA0062.outlook.office365.com
 (2603:10b6:3:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 20:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 20:27:04 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 15:27:03 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        <rrangel@chromium.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 0/3] Decrease startup time for amd_pmc
Date:   Wed, 6 Apr 2022 15:26:52 -0500
Message-ID: <20220406202655.10710-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 263b2fba-28bd-49c3-6c20-08da180bd075
X-MS-TrafficTypeDiagnostic: BYAPR12MB3335:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB333525796F041EE0AF79E383E2E79@BYAPR12MB3335.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N/AOvDJ53ecAK9tVHmiD1KkwDzzvxW+ppfle0JcXsvrEvUsy72dGl+TOCnTE/lp12ozlyCQAazF8SVX0vkgzx6VOZmEedD5PQyLfBL5uWMDNlAh8YqtkyaBOA0CQHMXgUKTGCi65SbH2IG8DvDMkTeC+SfU2dQrtXPabkYRqPStmzQV0J4Xroqcu4tTj2iPt3f5gCruPIuMsOMgYeaBUGaAqZNDCcij1wUDNa5/pgYg4zBC06JGt+owCkMfA3uAVH4VV/OqDvNPdZSr2rpKJm37oTATUMDzAT6gHhcotKtXRJ65GNn7jLX6jEj4iVKaQ+Y9kscXh3WrVD5cgxzhwSrLR3g8VVMPEWYZ6Q5G6UMA0gxrYMHtAySRmlFkqeRDDDrEjmBDOx/IWWnITt3cHk1Pkb2lH28TjDnNJ6GgeliJ/+gMXCX/rmho55L7Sru1fnj0Y7lltj3n6hZvxXRfggs8LH3Op5Ou6As+8PI0vKwuxdKF6FUrNLAFKobJLId0xk4enGNYIepWqk6m3OnpiD0PyqBUe2amgfbf+nMTBxx2UXxNv3MmTK8Rk994AEBrnE1tfLS60KDY6FzF+pWCNPBi84PQEnSjELyvlgYkAmX5X7jEh5jhDALonOzOXf85E1uYEBIUFcqdFK2KpsxaxTYG4JYdn135I58UdYW+4c30vUeXh1ECoTCvdcZhCo+zgW6Q+S6nl47AyODQ4ECYf6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(26005)(2616005)(1076003)(16526019)(7696005)(47076005)(6666004)(83380400001)(186003)(40460700003)(5660300002)(2906002)(4744005)(44832011)(8936002)(336012)(426003)(82310400005)(54906003)(4326008)(316002)(110136005)(356005)(70206006)(70586007)(8676002)(36756003)(81166007)(86362001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 20:27:04.6316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 263b2fba-28bd-49c3-6c20-08da180bd075
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3335
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It was recently observed that one of the worst offenders for system
startup delays was the amd_pmc driver. With 5.18-rc1 and measured
with ftrace amd_pmc_probe spends about 116ms.  This is bonkers for
what the init actually does.

As a lot of the functionality that is slowing down startup is related
to debugging mechanisms or conditional code that is executed during
suspend, move it out of init.  This speeds up the startup to happen
in ~1ms.

This is done at the expense that the first suspend or first time debug
features are accessed it will be slower.  Those aren't critical path
for a user turning on the machine though, so this is a reasonable tradeoff.

Mario Limonciello (3):
  platform/x86: amd-pmc: Move SMU logging setup out of init
  platform/x86: amd-pmc: Move FCH init to first use
  platform/x86: amd-pmc: Avoid reading SMU version at probe time

 drivers/platform/x86/amd-pmc.c | 85 +++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 31 deletions(-)

-- 
2.34.1

