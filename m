Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0D1C48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22E6461166
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhFWUEw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:04:52 -0400
Received: from mail-dm6nam11on2053.outbound.protection.outlook.com ([40.107.223.53]:59616
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230103AbhFWUEv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:04:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFh+W0QL7zR2wGMkp8QfOJ6i51PgmESTAXse/+IuR0bHMGHMyUAMCW7PK4YTBI6+TJ29xZUc+ohDuK+XpNY5xjsSXBQxR4HlT0nr8YIQXswj4IGGnVMRIXqvf0FSL6Obl3c4CQYLHiSdpsOa7/EaTHhR4lhgfFDVl2bGBV3Dn8ShWHzC7rF25U0DImwotX9SUNzHkP1JYXmzrPuoAhy+CRDJaQASNAri8oeTrqE9X1qr1p/iYCSfOf22dCPtvtIeAuQoB0+ixacxDhmCqvOA4Arb3isxTXR8L8QXl5c9JrczKqV1ggcpUEnZuLOIJsiYeZt6YucrYECNznagW40TJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7dIAeTFDBtkYaWWLM/h7UQt9ZLPEGaAtPgnP6j2ru8=;
 b=WLaYHunTPXkrXLjhcSNuEQvHTJxP6pKlbIYitPXh8swlt3gcDyHYQ76/mMbn7ffSfwEqAhyxk3AXnC0Jfkk2UbLdlLW+bRlA8KORvS7mFJTsiPZ2Ci4xMCxaVKKgTKoUVj7TrovolUDE3zbmYID+XuursAV0HX+YK9eOiIz6oz2y2V3wxmWAO5qMAXTEmDDSzF6WcLfHsN+TDba4Cypm/RV0w9mBvxsipQU0tdpAdF0QQK5ABz49Y8AiVr8jqKn04QFa9M85bFI+EDOBoX1WNgEneLAoYC8kITdsa5KKoN53DRBiqpcDD+mRQJ44FFlKHSo49JC8Q2tG+82m8Jm6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7dIAeTFDBtkYaWWLM/h7UQt9ZLPEGaAtPgnP6j2ru8=;
 b=zbzP8Rk1m8wekuPB5o0HhPywFwm26LxkcnH9MYyR/gHfVY4eAu7zJ1uWUEgIE0XDQMVJimxgCiHmLMGlr39Iqqd2U7Q6FfNrv+9EPI6fw4QDLGs4vo/yKkPtdPrepIBN5W63I4DYY7efSz1Jq838180WTadZzOoEcbHSYMRZrJA=
Received: from DM5PR19CA0053.namprd19.prod.outlook.com (2603:10b6:3:116::15)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 23 Jun
 2021 20:02:32 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::57) by DM5PR19CA0053.outlook.office365.com
 (2603:10b6:3:116::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Wed, 23 Jun 2021 20:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 20:02:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 23 Jun
 2021 15:02:30 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 6/7] platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
Date:   Thu, 24 Jun 2021 01:31:48 +0530
Message-ID: <20210623200149.2518885-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0187a294-1e99-4039-09f7-08d93681d667
X-MS-TrafficTypeDiagnostic: BY5PR12MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR12MB40687BC9B83B4BC20CB6497A9A089@BY5PR12MB4068.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0CsdDayTap4CvEznP8KIZal0wCFVRsyreM32MUJXbJN029UEyxoikQkRdFwraLpf2HzoGrCs/3M1oHwmCFtRv1JaPA3OQqo3ZYZBLa3P8DArpJ0zp0Gy8MflqNYhbFTCGz8nunXpXMytLUH2uArd1LfYo9HJSBgHvnSkqMhkKhlaURlDc5l57agB3GWLrMp+bvBd3FI8NnsIeGCSMT+SJQRaW6KvE26GTqRGngyqoJqQofGvej1PjP+RnNJxo+NwnzI4uNSiwdrwvtcZWuNjlwHlfLYUn92WSs3Vsy+MO8TtsFc20XZD9VRmBSzpHmzhejDclbdLMitFgwsiDIWSLvbqJmalPa323Nsu7tOMIZbL6DbY8viEK3oEe5f1O5ILLMdn0vrEJQxGRoFgI+hg5lEBP4Kjdwl9EzWrduLP1FAndo3APtaABoJ3+45zSdlWVeoiE49Q6AAzpOO7YQL8s4bh10CMwjwtg7/nuYp4Nhmegq6SlOlqLqDEg6WIL01N+jdk2H/syDGwduya6dbEB5wncTM1UGW/gjPi9N2MZ0i20vCVqRL4JotjBqyKuvwDMdjmK0O7xiTgMskhjXIXhNeL+wKvCse7SBqyoug0EaxSw50vfmNJ3wHNnLxzHfIzuKzlyNjIQm9xZvK4PDCjwQJtDILd6IZ9T9Lp9smQzZXnSV83h5k4TNsikjuGzsDDuDtmTCuNf6gHlPhMgurLvVMo8kSQrdecO6QaF/s2Qg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(6666004)(36756003)(336012)(478600001)(7696005)(316002)(426003)(5660300002)(70206006)(36860700001)(1076003)(2906002)(186003)(82310400003)(47076005)(4744005)(8676002)(2616005)(8936002)(54906003)(356005)(110136005)(4326008)(26005)(82740400003)(86362001)(70586007)(16526019)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 20:02:32.4314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0187a294-1e99-4039-09f7-08d93681d667
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some newer BIOSes have added another ACPI ID for the uPEP device.
SMU statistics behave identically on this device.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: no change

 drivers/platform/x86/amd-pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 174f067f0756..e024fd36bd26 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -443,6 +443,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
+	{"AMDI0006", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

