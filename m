Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C94C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Oct 2021 21:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0424A60E08
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Oct 2021 21:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhJYVcr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Oct 2021 17:32:47 -0400
Received: from mail-sn1anam02on2066.outbound.protection.outlook.com ([40.107.96.66]:50595
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233429AbhJYVcq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Oct 2021 17:32:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEn85kJP+kqnyfAQF+UmY9QSORkmRGiNjfnHHbPc4X5U1F33gDYRFr8LQYAybBC67aOkjwm48q1OtXIMqygxJo9BRGbCYO5gk2mQDyzudVQ0kX3masFUe5Ts2pqcZlYzNtoBtzd6i0k16nvEwNprrw1oHepSaMSK6l/EDgIP/Dmo/mhitbut5Q2DxhlotXAb+lNtYOtR0YKDOpmLZvFowO9Q+AtS+hv9JPV/YR5dQfg5PjOqm/svD7/N6jOYPyLob6PIxwRVhi2w5HbnDK/FZkAKVOw1+U5lsuk/T0OM4SG+9C9cUg2AA6ZVISh15TouoxVyN95XoLC6Izt6+RgGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMPOnsMpcVWU4KfJT6Huut9FLFzakz/lXkMf7raQxLY=;
 b=dj9LdU6gMjSuDeamhRPo6cTdUrSIoMEGP6Pw5x+uxDNeXqrTDAA7n8yj5GqQXhnoenKJFv+jm9j74Ls6BCRkeK8Ya3jNbnJE0GIWbbtkTWbX1nVcvbH3ydxZTATflQNXKgp43SvDY6aVdauVPjNfc/hVc4zCRod4M9ly919cgGMlxxYTPeoOI485FhKuI7z/SWf9yRcYsrXrIp4S+eu4udoSU9sXg4J2uyAwDwIXg5Wd2wjy++gCJkRYc+0YvFaAlq+yIV99AjKXH7+tyrhMuHBAsCJdZE3mC0ilc14l0ku/p+dkDkPPOGPJeNznyZ3VI36krm9BRKpmxVafB4fd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMPOnsMpcVWU4KfJT6Huut9FLFzakz/lXkMf7raQxLY=;
 b=ny0g0kRMaZunLHfU+G5Dv8BWsNrrcGHMfMkeUgaxSJ0ShVpuBbqMyXzSs3i22VmYh70RpJoSpgLu+go6YsNNP2hx3xfvKSiH/q6CKy4PVgPCUqsjz5Xj0Le+qr81CMVEp4Dkq2dDMTgDddmnyid/Xl3jDMNq74rMrMjX2N9P8Ok=
Received: from BN9P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::25)
 by CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Mon, 25 Oct
 2021 21:30:21 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::f3) by BN9P220CA0020.outlook.office365.com
 (2603:10b6:408:13e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 21:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.18 via Frontend Transport; Mon, 25 Oct 2021 21:30:20 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 16:30:19 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: amd-pmc: fix compilation without CONFIG_RTC_SYSTOHC_DEVICE
Date:   Mon, 25 Oct 2021 16:30:21 -0500
Message-ID: <20211025213021.3052-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e652bd8f-0a42-4121-a5df-08d997fea5d9
X-MS-TrafficTypeDiagnostic: CY4PR12MB1576:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1576EDDCC4A66846F5F6070CE2839@CY4PR12MB1576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imE5ASFTZfJNdwow4rqLxNKaPe4RvXmeMlzEwDbX83PQLgu19b3iJjxc02OBYZKcju207aRvGq9J5evyR5STwkkihD7XbgMOPNJhuSGg4BG/rgfJYOmOFjTEyWZEhPFDH9AhDjrJjX5JhzdY6zZS5J1DS8RItETWV5ihcCOF4h4hfblCuvJK/7Kn89AaED+JFZEshKvi2R22IRlmspvTNiOGGV9yR7yJldwW0abndlh32dHdbLcZ+LaUgFhar/6N58bIK+oR45CjXW1lHPryd8gxb+EBJ9EcQ1Gd4yHyHYNAm7Wys1nT/Ohbr2Q3LLAaRas25VS+ruy3aiM+5avZvbnN4ucDm021DI744NqHqhW34MKKDidJqbCTVTSS6fm/8hI+MnxCQPSPWoHOT4cOzY1PX85JV04ecxpypR5Aeafr9USACHnHtVkCq39yhtguvfm6lRoKbzffW67a6uiAn8tqLs+agAShX/Xhjo6jtkf9qPa9gJjxSTUNr6fGdXUB41eo+wUA1owyWoRRV5elU3oHkHHJZqJ7yecsqDTG4bEWGTRZkJof+rWYB1Dp7lMEEerN3T4Gqp/DfM1cwu76z1j+6VTg1E1v/k8BXpduZ7e2UD3Cu6acb5+Fio7GRPCcAp9Vz4fWwfbrK+spmUc8Xr8QvxEnHBD72VlS4dUq2ePXM4zL1Axx9815HSCtoeU6OSPQ2m9pjJ0A6wcPogevkeZ0PjPH25kkB6/blW0tbpg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(6636002)(426003)(8936002)(44832011)(36860700001)(26005)(47076005)(82310400003)(356005)(83380400001)(508600001)(1076003)(81166007)(16526019)(36756003)(4326008)(6666004)(8676002)(2906002)(110136005)(70206006)(186003)(70586007)(86362001)(2616005)(336012)(316002)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 21:30:20.9197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e652bd8f-0a42-4121-a5df-08d997fea5d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1576
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If the configuration hasn't specified this parameter the rest of the new
RTC functionality should just be ignored.

Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 678bf6874c63..95cb724918e0 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -416,7 +416,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 
 static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 {
-	struct rtc_device *rtc_device;
+	struct rtc_device *rtc_device = NULL;
 	time64_t then, now, duration;
 	struct rtc_wkalrm alarm;
 	struct rtc_time tm;
@@ -425,7 +425,9 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
 		return 0;
 
+#ifdef CONFIG_RTC_SYSTOHC
 	rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
+#endif
 	if (!rtc_device)
 		return 0;
 	rc = rtc_read_alarm(rtc_device, &alarm);
-- 
2.25.1

