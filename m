Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E3BC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Apr 2022 21:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234823AbiDFV3n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Apr 2022 17:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236957AbiDFV2j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Apr 2022 17:28:39 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CFC232113
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Apr 2022 13:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIW0BFZq7ZvmOr9xACOe5p0e7Z27K3H8BGo0XobO/xj2ZhpvMf8NL670GrZUe7Nk9g0zAKXvO8+C5l0Iake4ppsJWKwTLq0n67zJUsZuCAG7XK5h7u0mYNr3GHnjwdYlh/fHCA3tu4zFJ0aNZBCfYXHPTMEwW3a9XR5MjUa3h1bRJ+20aGge7AROqahhxCEKhA3La5RHi1f4BgsyUZGhja1lfAy1p9jK9gaOxmfGN8BeyE1XsytLTZ45ge5tW38NPH4pM/dAQiauDVd23S4WCsp0fyKX8JLicBfYHOdRldJqo9MlCeWLWyFzEE2u7qnjzx5yZgb/uYfRSaWKAbS8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRyxR/KwnY4Qh43Fr6lHdAWc2SwOaIEhFz+EpnPZckM=;
 b=dmhxXVkh/s1ofeYNDEkjjPRScK3q7Id2u98NXzOscnolI8wEqSFjBMwIp9QO0Nw4sNJT8KFFDa+Uv1vf7HhsbYaLZfsN+Wj4D6b0RsrtojSEs//EbOqsQiN6pwy2HtuwhKbdeT03GDrGhZGNP+kEyAN5wqZYmR8Ut6n8SuKnY3BJ1t3AXtWi5gOWTiuWryzX5Hh9MnqmKZnNW2hkCvNVjFic006hGcdNQshmGggyVcyKD3gxG5p6olLGRyuMNmR5oubULwOw4d7U4/LkK5YF9MM6q5IImVMA+Ppk9/tpCXvlX2Q2YKfyt5ry5nwJ+emVKT7ogTe1zfuVOwL4Evq4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRyxR/KwnY4Qh43Fr6lHdAWc2SwOaIEhFz+EpnPZckM=;
 b=lwOhxx4TauuHwNmqkWRfR6r69fagRc0JcrK5ugglMYpyS83O8I3c8Tc+qFhZ8SzjE33q2dHjCksGDd5tHOqvFIZxQiLWMH7a23Iq/RZDNVpLYCJBqdQLILnP4PY4f1DcvKJg9J718pNB7OR7lJJEW0OGbpOrC6OKrfGNH3mUmIc=
Received: from DM5PR12CA0049.namprd12.prod.outlook.com (2603:10b6:3:103::11)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 20:27:07 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::ea) by DM5PR12CA0049.outlook.office365.com
 (2603:10b6:3:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 20:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 20:27:06 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 15:27:04 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        <rrangel@chromium.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/3] platform/x86: amd-pmc: Move FCH init to first use
Date:   Wed, 6 Apr 2022 15:26:54 -0500
Message-ID: <20220406202655.10710-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406202655.10710-1-mario.limonciello@amd.com>
References: <20220406202655.10710-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15353af8-96b3-4178-32bf-08da180bd185
X-MS-TrafficTypeDiagnostic: BY5PR12MB4115:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4115FF8C4B6CA7526A831932E2E79@BY5PR12MB4115.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCTEQ5zQTNmfzaOqxETE0Wh4t6HZ/4Yu3xEHHNLdku5ZR5veBkmxUWxqHh7rbRRv5n4U49DMZGOSh4oRNm/V3BrxYZ6EmaCK5PgvpIwsF02vOzlApcrYsGWgzWSmiM8QGIrTGMHP6srHeHMUWDL7QRJcJkDH5ojImrKI3PtKOiIiUrXoTXWv2vZttPHQeANwh+qxA0IQg9peN0jkYZ1l1O4SWtTuaHLgAXFnQdfpJaXTQYirZGcMpZ4zmeXYEfbgXru0eaTqGO+h7cN5dZ8jWaC/lu//xA0QXNpdJ7JEv1QFenjdOnkhdiMnEgKvicic3XfK5uZvaCTShq0ES01l/eGStqK51tOKGMOd2GN3GHCve3DHXaO1jr6dj3S66oyBnSQDhd/pEAhvU8OKGigaQmAk0ES65uDxXJacw3LsFWPNECEBEVTi/2DCaBgAIxNly871l55WmWfYlRbDH1rLEv2oWr82GmiCy5Rz+orUXAB1MbFwg+EC9UnY0CFOv9QNgfr1q1moARtQxxp+qbXFOLyJiMeQc5wfNlj1/+S659x/TE+m0zWRbICJEfwQQdEt1/jwfyuodfBNk0BnHIiZLi85uyt5zgrJKhdtcRHnXJ0Y7UsK6P/VPI5EhHHhkuOyr7rzq+7jcqX3VzOlmiXMMKHENnu5E5y7jc0bWxsaTxPZ6EkCEUn3qewPwr0jhoL0trxPHgXK6og3OQiK/OJqAw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(6666004)(36860700001)(7696005)(2616005)(47076005)(16526019)(26005)(186003)(336012)(426003)(8936002)(1076003)(4326008)(36756003)(5660300002)(82310400005)(356005)(2906002)(316002)(54906003)(508600001)(40460700003)(110136005)(70206006)(70586007)(86362001)(8676002)(81166007)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 20:27:06.4127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15353af8-96b3-4178-32bf-08da180bd185
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

FCH address is accessed only when looking at s0ix stats.

As this is unnecessary for initialization, move it ito the first
time stats are accessed from sysfs.  This descrease startup time
by about 200us.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 28e98e4649f1..66be2601866b 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -390,6 +390,17 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
 	struct amd_pmc_dev *dev = s->private;
 	u64 entry_time, exit_time, residency;
 
+	/* Use FCH registers to get the S0ix stats */
+	if (!dev->fch_virt_addr) {
+		u32 base_addr_lo = FCH_BASE_PHY_ADDR_LOW;
+		u32 base_addr_hi = FCH_BASE_PHY_ADDR_HIGH;
+		u64 fch_phys_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+
+		dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
+		if (!dev->fch_virt_addr)
+			return -ENOMEM;
+	}
+
 	entry_time = ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_H_OFFSET);
 	entry_time = entry_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_L_OFFSET);
 
@@ -803,7 +814,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
 	u32 base_addr_lo, base_addr_hi;
-	u64 base_addr, fch_phys_addr;
+	u64 base_addr;
 	int err;
 	u32 val;
 
@@ -857,16 +868,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	/* Use FCH registers to get the S0ix stats */
-	base_addr_lo = FCH_BASE_PHY_ADDR_LOW;
-	base_addr_hi = FCH_BASE_PHY_ADDR_HIGH;
-	fch_phys_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
-	dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
-	if (!dev->fch_virt_addr) {
-		err = -ENOMEM;
-		goto err_pci_dev_put;
-	}
-
 	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
-- 
2.34.1

