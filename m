Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4F3C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 17:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FF1A60F9D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 17:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbhJZRRX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 13:17:23 -0400
Received: from mail-bn8nam08on2072.outbound.protection.outlook.com ([40.107.100.72]:52961
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234055AbhJZRRW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 13:17:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx6OpFoXeXrjqJmX7B/4eMRwm+fQn1pkTJP9VevRCEo/o3n5iyIW1WErFDq+L+YgQevWp5SNyHEty+rvdnbFQn73Mgs66fkXpnY8a+xpp76ZX/li/WuaQ0GuKRIGJzQC5kViUOIv1UeKwC4INiVkNHms5m7dC0Vm+4Ms3D/2KQ8AKGb9YRmRzzvO8/eYC22v3/P4k6cxzuEqbh2+qnV+tbOyGve4eGvL9Z66ywnFtv8+lqX3vMYF5Tel3DkGLqYwGrbW6KvMLbUzVSgig3yVZYUDhqUAdKD86GSw6FxK4iwHCcaogPbMjwPxKetBp7R0FpuK4/Hg00jmzN+Cw/NfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pbf5AKfBHHy3HAOi5+Vdo+mTT2mZezFYHZARSGThvk=;
 b=E9QQZh5U9UMBJAr48lZNxM61sZQXIACibKmk+xc2+j49CmzTk5ru1Hzx6lPnCShTkE0MRqHO8g0mWvobDS9/acGb23QHBJyQNvTn71HXYWyhtUSw+csa8grQImO0GbWGZt8oigjngxMNW/ogeMVx6mxSeKt21W9KLXe+5MeG2n/nHReRMAh5ViQKwImNm0NFY2Sq3aWkB+MSM5jYkIi7v8V2l68wTDGW32mN46Gj/ca9BvU4jIp4D0vBFXB0BH8+OnBmm89k32r8Eam3ZMwsAK+b3bYvlxMuddlzHy+OxNCjT5GcFEn7i6CtGJA+0mSf8kh90A9T473XURW69gLI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pbf5AKfBHHy3HAOi5+Vdo+mTT2mZezFYHZARSGThvk=;
 b=vl3DSiNhO8LlvyEZex6wol+zEn5Jx4rWPmfvYUcO8+qzP7l0/cZo5/EDQ4nriyXfYg9AYKqsWGaxzI8P/Py6KHGoSKCwr+1ETKtXx0moNxrbvxYU3LLdTjaTaP+2pROzaFVJSwWyj2ORQmwRGZFsVvhIIVI2t4EfqbOzGdCO9aI=
Received: from BN9PR03CA0388.namprd03.prod.outlook.com (2603:10b6:408:f7::33)
 by BY5PR12MB4818.namprd12.prod.outlook.com (2603:10b6:a03:1b4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 17:14:55 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::f9) by BN9PR03CA0388.outlook.office365.com
 (2603:10b6:408:f7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:14:55 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 12:14:53 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/3] platform/x86: amd-pmc: fix compilation without CONFIG_RTC_SYSTOHC_DEVICE
Date:   Tue, 26 Oct 2021 12:14:41 -0500
Message-ID: <20211026171443.289-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d428332-3ba8-4894-b188-08d998a42157
X-MS-TrafficTypeDiagnostic: BY5PR12MB4818:
X-Microsoft-Antispam-PRVS: <BY5PR12MB48182EE7A608E9078326F915E2849@BY5PR12MB4818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+sRqTGJZPHUW8Cxh6Ggd67mCr5Skxt0lg4gCKQfcJhRh/rCT3Pyv1H3i2G1lLcIe1mK4U2z3uWI+clSK0dx7QEYu9a4v/BidlNO3eoDM/hPD5NtLZwjWXzc1ycXF1xLVbd3F7Txlh0ClwTfMF2ZW855+yIlFyhwTXrzSLloUWEn/EsmNxHJLhqsqXHUFBe/wSwk7SAqTMji1cHWTGFO+KohC0SOTwlrJSU3tUvMAzmN7Ek2bjC0tQiZ765///t+Fzb9heLRXVLIWAwpfgZP6PCIxM7AXCT4e4CEKKReShIH/D27PnlJ5fzHy+sQGacVtEHbv0ayNCr1ftw+AgV/qFiJQAegBfyieOaFWz2ZfE2wxj5RdwIXfB4nceiUNoJ0ipXZx02p21T4g/68XqoEKgvXBwN/ZrEnWHAJYwhXY4IpZMpXbimCzMhxSbDVZCNMvPXMFbjKViqJ7xDdzoKNxYdQq4CA5O2qzZwU1clOkpLY1sdGg1qgAkJuFiHvoDhgLWfz9UYPbiQRRrCg6OgT3l1ZhhyqoCF2vVCtdwIZYBaizqW0OSrgLMcYmhJtmfimW8S32/wosI/j5357Vh2l9HCqRXyz5U7kPdcfvPoj6KvxGUoiqY1Fygkh3H33z4o0w0hcScMzKG/idqz4vE/LIR3jbF4yaK/F0lcLMfl2JDSXVNyk24cSuq+gmVioNSE0HmJ8mfvYQcP8pybYND+8tfj4GK8S6zbszaom4ge/Czs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(70586007)(6666004)(2616005)(426003)(86362001)(4326008)(2906002)(5660300002)(36860700001)(44832011)(70206006)(47076005)(7696005)(336012)(186003)(316002)(16526019)(81166007)(26005)(6636002)(356005)(110136005)(8676002)(82310400003)(83380400001)(1076003)(36756003)(8936002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:14:55.0669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d428332-3ba8-4894-b188-08d998a42157
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4818
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If the configuration hasn't specified this parameter the rest of the new
RTC functionality should just be ignored.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
Changes from v1->v2:
 * Hardcode the device instead of #ifdef

 drivers/platform/x86/amd-pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 678bf6874c63..b8d77a18e95a 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -425,7 +425,7 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
 		return 0;
 
-	rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
+	rtc_device = rtc_class_open("rtc0");
 	if (!rtc_device)
 		return 0;
 	rc = rtc_read_alarm(rtc_device, &alarm);
-- 
2.25.1

