Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF68CC19F2D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiHBL1j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236888AbiHBL1i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:27:38 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A11629CA4
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhQIDhq/b2w5Bpzeue3ud/tcfti/r855CU/2X0+E07pY3Hcddk05ZMYF09aBahrNUza1ptae87LYtAkac/Y9hIGUtx7zZMCLw/f8/r0Z+OS3Wk+MLTr4S/Quxwv/aW9yaZub2n/d0c1+zum5OWZ7eDQZxq+h5BH7LUyC+kWWcowi1rNRagToFiK1X+YwQA5R0CgmpF4gr2gkVzbbrAmy986540SfOW2dat8jwUjEmdyHeUPgz8uoNcmF40vHsh3I1Cp3gkKDhV2hC5DEtF+5b83iaHBePnu0VmpNSRhFhblz6Yf5Q1aX7wVqiAaTyCeUcO+0ytXKk++gKtFu5EmKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTOPTtcTtLwYERkeUC8c+spsPlj86ria9DxLk1EUKGg=;
 b=PvULTxdvxaxUhG9PP3mGYrnk4R1oUAPGdNXSWu27qBuDI3kOgShEKgxxcw6o6Z0wVDkKWA24EDrLr1F0QB2d54YPT9n4UYZCWQUb92oeQHFkoWBIlYYug6eEGHsZCHctbbFBWLUKnblhkD62aaiy0uVK0kpA+jaqbOKqCtDOSiYaWmJwzCi8tAY8cDYqcVbeVqWZUJAa5dwj8TyJag9OVeaN4pAkKwd75A08Ux9iLeSiXFYEjak61ud1pz5xWp9nZ88P3AQWlgMtyantQiqhGEgsjL1eAsj8ZrHNv3sWkSbV32BZ8WJJK5mQh1a0pWu7KXjDNFsuWyao4zTxnCvQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTOPTtcTtLwYERkeUC8c+spsPlj86ria9DxLk1EUKGg=;
 b=e/w22HwhQ7ccmrd7HpY8XCgmIEJ7eigG1rpCCwISH3XxPpN1VMR4zpcAY43S0eYLJu4WHnZYttUh448lrgKVnDCw/cCEdxDH0y6T5iOwe+lIYZfRwxJ1VPpLQbJUQvMzrjvJNNhk+gEp0jrYNqfwOvR40fGgtUAsUs9NeeKmuSY=
Received: from MW4PR03CA0209.namprd03.prod.outlook.com (2603:10b6:303:b8::34)
 by DM6PR12MB3626.namprd12.prod.outlook.com (2603:10b6:5:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 11:27:32 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::f8) by MW4PR03CA0209.outlook.office365.com
 (2603:10b6:303:b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.13 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:23 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 04/11] platform/x86/amd/pmf: Add debugfs information
Date:   Tue, 2 Aug 2022 16:55:38 +0530
Message-ID: <20220802112545.2118632-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed658e6f-7b5f-42dc-3ce2-08da7479fde3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3626:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fEoQ6jpU7Q23IjqrrV14Cb5RFdS2k9X223xPrf9duL44MugyqRR28mZwbWb/4KIk/rmGBdquDJsj8gAr0OGQbB/lhzG+KtAXl/Znw9R4hOyU4BJ6YKgRl/0WvO8n+CyEtfGtKKiMaDeCZVH7R+XzILHm+agNPBLnjQY71PtY/Zj5hLO5YYEtg+Av3b8E0CYWdkEgzZVODHC3Bv1kGDzx85AVLvLj6ojc0lqn4RSAsNBK0rZatB5/csBCajh3vS4RB4OqtvHUc4NAdU9B7mGURTsovXTrdLv7jIa570Xsll0L5D+BaJzb1BcL7iiMJMDGGofesQXlfDPfNiogd1eGDSC3w2oJjfw0N0QE6O46DwmG2Jm/Q7PF0xiuBVnBBvWC5syocMSH4YANZkW3HI2deSPMahb3RsS1bJfWHc23pn0mBbpPiHFgAkOQV2C8AUxnxauzY2rxDlyJPxmYQxLpy1++NiDR3dNM9SuXZRv//nQYAISqKu5J0yCnxBtSILI8Nah3SqFmCX8ZpLgVuli3EtppBcb7gyRrqfnWuxtsti656bzUai7nHjb3NIhFX4VICMgbqkeAbbhrqZyPzM22VVbAStSmYrsR39EZs442q9ZQXQ9np/g2RZoBz4QQIVpOIobJnYTXfe/B/tiX6/ylvJi3ftN6ctAPkxONGqhbFo32my0fHsi75a4IxoDtJeSVlCT4qGPlUpDAoVjhKNo1++nOVxUs3pekclyM06uW83qUVbor3yooRCHbvQsS+B1mITI/rTxXxzUiUSFmh0aYadQzGWyuM9gHqKUIALmYorZHeQWYvBlybmNlFf67GiXAqSGRAboGaD6VCIeU+5JsJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(36840700001)(46966006)(40470700004)(82740400003)(40460700003)(70206006)(70586007)(316002)(110136005)(81166007)(5660300002)(40480700001)(8676002)(54906003)(356005)(4326008)(1076003)(8936002)(478600001)(36756003)(2616005)(16526019)(36860700001)(336012)(83380400001)(86362001)(426003)(47076005)(186003)(41300700001)(2906002)(82310400005)(26005)(7696005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:31.7927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed658e6f-7b5f-42dc-3ce2-08da7479fde3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3626
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add debugfs support to the PMF driver so that using this interface the
live counters from the PMFW can be queried to see if the power parameters
are getting set properly when a certain power mode change happens.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 36 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a70ab6c9608a..032d9dc5e09f 100644
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
index 5c867dac7d44..e13542359403 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -90,6 +90,7 @@ struct amd_pmf_dev {
 	u32 supported_func;
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
+	struct dentry *dbgfs_dir;
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1

