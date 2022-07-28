Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D2FC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiG1SVG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiG1SVF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:05 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7570B5A89B
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPkBhUeWx+oSwyo/YPgegdrdVu5aTh2DiOvFIc7IwHsVHE8TEGSr6wHlcqbw3tEFEbKNz7t+8z29YWxyBqn7YYEyIT3P2IIa0zHScHpHSR1BXD3GOOXuwkwWMoG8wHIdHcIfRygLpNhhAVs4e3IakbHKoKl5/01XFsTK7SZoGT9hvs+xCmYKZA8N9SL2Guw2sc7teSaenYWhEG2fHD1MqGQh55o4PF2IGjuPqU7K+PaC44sQVCPVEp07KZgd4bKAoo7SHxlMWAizV0VGYU6ALCxDF3V3mBPyouEO5C8lEw6bV2pSqczHZY4UnZDXROZ4hdF2UyYNzlfqH9bgF6yv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQZgFx5h+W8YgCTHjzEIbXXX41FaKfvrYu5+ITYuV+Y=;
 b=ehaWx8m5QHnO4d3m7O/ScqUod6wl6H6CF8xUw9Rkov9NLOAEUkU3GBRCiJmTfPconZzhowfhoThzKwntRI3XoQh9QvFFJbTB3R+YYDsO8Iz++sfQfBZ2Ib6EsTaJ0EV//bWUkiQb5ftAkzT/dX7WWrA+hMARmyFmy/3RZe87fi7BFKXOReshf3gsFP4VE/c41bnN7Fk8JZzT5BPEox2Oh67AwF9vd+Fecf20Ro2jXGJ3AufYzmyICKRd3Iny2VEArdTTauQIk+NMzNhc2gXE0X+J8WO+7tq4HvQ6hgpXZgVKslC+xC0l+TBwk3lx5Y64WE87w+/30Awp5hj8tpSk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQZgFx5h+W8YgCTHjzEIbXXX41FaKfvrYu5+ITYuV+Y=;
 b=bpQlDppbQWuRqjrkbb3sRMjtoGFlx3rpxwuc8gR+TV+bv8AhCXYfOYMwx+iVWp/7xIAYiTs4yU0sj9KU/stPj8UumZx+1KznyH0/vcaLkhp+O6pSvMybBdBEaONhf13fzsp7U4vMqClTom/KA10TzIwJBk5l6zyMChIuffGPqqQ=
Received: from BN1PR14CA0023.namprd14.prod.outlook.com (2603:10b6:408:e3::28)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 18:21:02 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::17) by BN1PR14CA0023.outlook.office365.com
 (2603:10b6:408:e3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:02 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:20:59 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 04/11] platform/x86/amd/pmf: Add debugfs information
Date:   Thu, 28 Jul 2022 23:50:21 +0530
Message-ID: <20220728182028.2082096-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8ada30e-5c43-4acb-86ec-08da70c5ed72
X-MS-TrafficTypeDiagnostic: PH7PR12MB6881:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c2asC9ysxPYHrwm4ujV0cy8OUBjos2FSlm2hsQEzd+9tN7QqcK5O33OaS4au2F1IUWRtRyj9nwvOOh/cDdO0Clf0PJodNHbbbDVshRLO8QtLeuh4kbb6N/rdIN8OEkmFm+CLr33q7Fpf2VZxQQb5BM8yAzjGhAzer8jcPBY56VeSJNHGjNN7KdUpOsHjTmctblU7fYh4cPqE8ClK6wr9gg/Zq+X5eeaYkWfvzbx+viWiqgkulj/UKL0zEyvKuCRsuQVhZnftbCzBGlNpZC/O3ME0nGEVe24sCDfLz7Wmw4ISNix5yVVFmPXfg5rxRGvgg5zaIKffIfuKEUiPYN5wLkhPCFTCApE2wvAtD/Rj9HvgnzXZqbxCiekDIYLT4tjecgQS95hGx4rT5Ob/1a4HKTj7bRxAg/TaZHy7bgc5XQKb43CyHaokqRi7WQwtRIQtXmKd4le/2TjIX+W/kiiSFyY8smGLbktevzp5OjBiKEVLhW47+gio8kRPeGE29CBwSUx62p4mBH4g73HylvBqpr8Jko2uRHgJwTwWREExZHjniYkGzV+lHrzZgZHe8V5zqLymyAawSoYcbK+/aPKcYDwqIUeHN6zbynM8qUrDPOQvjUM1qyEyDhHVXzKlN8WUxeI2N+zSn3xzT6RtvLUN/eQqVqJ9MIOxgGVYlbulWF15EqHoXFu7CgDjtc/cpLRhc7Pufp13lMndzkONVAGs1sziXy1bB9wdgPq1kaRspLKT2+ojcPvu3Y+CZXdBDeQ3gPseafBE2Sd58ouv0QyIO05wNzTKHV3TQcIUnS+LcBksZCO0avLpEe5jiBcxL/MhJqqzrpFAsOoaVk7TkJKG+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(40470700004)(110136005)(26005)(40460700003)(478600001)(82310400005)(7696005)(54906003)(41300700001)(6666004)(2616005)(86362001)(316002)(16526019)(1076003)(40480700001)(186003)(36756003)(4326008)(8676002)(47076005)(5660300002)(2906002)(70206006)(70586007)(83380400001)(336012)(426003)(8936002)(81166007)(36860700001)(82740400003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:02.0139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ada30e-5c43-4acb-86ec-08da70c5ed72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add debugfs support to the PMF driver so that using this interface the
live counters from the PMFW can be queried to see if the power parameters
are getting set properly when a certain power mode change happens.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 36 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index b6006e8ee1a1..4ce69864879a 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -46,6 +47,39 @@
 #define DELAY_MIN_US	2000
 #define DELAY_MAX_US	3000
 
+static int current_power_limits_show(struct seq_file *seq, void *unused)
+{
+	struct amd_pmf_dev *dev = seq->private;
+	struct amd_pmf_static_slider_granular table;
+	int mode, src = 0;
+
+	mode = amd_pmf_get_pprof_modes(dev);
+	src = amd_pmf_get_power_source();
+	amd_pmf_update_slider(dev, SLIDER_OP_GET, mode, &table);
+	seq_printf(seq, "spl:%u fppt:%u sppt:%u sppt_apu_only:%u stt_min:%u stt[APU]:%u stt[HS2]: %u\n",
+		   table.prop[src][mode].spl,
+		   table.prop[src][mode].fppt,
+		   table.prop[src][mode].sppt,
+		   table.prop[src][mode].sppt_apu_only,
+		   table.prop[src][mode].stt_min,
+		   table.prop[src][mode].stt_skin_temp[STT_TEMP_APU],
+		   table.prop[src][mode].stt_skin_temp[STT_TEMP_HS2]);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(current_power_limits);
+
+static void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
+{
+	debugfs_remove_recursive(dev->dbgfs_dir);
+}
+
+static void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
+{
+	dev->dbgfs_dir = debugfs_create_dir("amd_pmf", NULL);
+	debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
+			    &current_power_limits_fops);
+}
+
 int amd_pmf_get_power_source(void)
 {
 	if (power_supply_is_system_supplied() > 0)
@@ -231,6 +265,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_init_features(dev);
+	amd_pmf_dbgfs_register(dev);
 
 	mutex_init(&dev->lock);
 	dev_info(dev->dev, "registered PMF device successfully\n");
@@ -244,6 +279,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->lock);
 	amd_pmf_deinit_features(dev);
+	amd_pmf_dbgfs_unregister(dev);
 	kfree(dev->buf);
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 30740a5cd30d..de8dbd5e04e8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -100,6 +100,7 @@ struct amd_pmf_dev {
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
 	struct mutex lock; /* protects the PMF interface */
+	struct dentry *dbgfs_dir;
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1

