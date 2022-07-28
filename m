Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E160FC19F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiG1Rm5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbiG1Rmz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:55 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B6E747B1
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/TN0X+P07+vmWy5cVW8Ar39u85BFaCJhIOw+GyRAwSw8T8AR6MmXxT/9F7cQ91U+68E3Zj1fWQEh1/Wb7wZ01TIvpbcx5YKgLvTtDm6i4PrdXaJITlH3r8hYF2/xonAbusFpURD1fQYz6+C3yN4FWzGK8EozOrZcPdVmddENFR6Khw+dd8opclEQ1gL5wfyRP+n8nqDg8AlxjmGX67D6+rHqufVUzpolDv3XMd5MuTN/0NvrvB15Sf+TVNDxkNJV0HMfx+fvLHKFoPSMdKfVWlhvv7ip0BBkWZdhgfMKnSEzKvJaE6txMI99Pnv9xOiS/CgvnQavmTnY1zYHM2DLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQZgFx5h+W8YgCTHjzEIbXXX41FaKfvrYu5+ITYuV+Y=;
 b=aHvXlOVt6GFdf0isX2ii/m3VWSHcz1T7ealonqcZAwvaTHmyeREoMaPVk0+rpSG1VFlPBbs/8Y07x62tdFFNXYeb0A4dwOL7xQ06o0lpQD8Wb8bL8EV16miTOBvbhVxssniQzVsIQDvUncugZ5oM1tRAdTp5VQv516NbcHnAUxhN8Ajw3b1/COOZPMvKpPNjyjraJ2pUQtMtbw/5/ke73/doK6UCVoouzNaqfRg/5ZqD/LjkmitJbGOAa8IyusGurM6oTGFSIMqtUf/sI2rZgKw1sM6LjZ5tQaUJPpUb/ihzsagTfXcxlXtzMJWpyzyb7OnR5xyHUgbBMfVX2cISUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQZgFx5h+W8YgCTHjzEIbXXX41FaKfvrYu5+ITYuV+Y=;
 b=nCfI+pjTzV964w0Q8qsCw/fs38CluuMR5TCRBaantvKcOdUueuGTvXJGleYcBPf0HDJDBVUMukGw97pJrda4lGhIkrGaqhGAjJx8rQybWk/zEResqRMirJzVyJBDJ9Axle1Q/pBqQ/Xi+lzC1L9wGWHy741zV2FinqJxleiZzQQ=
Received: from MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::34)
 by CH2PR12MB3799.namprd12.prod.outlook.com (2603:10b6:610:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 17:42:49 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::fc) by MW4P221CA0029.outlook.office365.com
 (2603:10b6:303:8b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:45 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 04/11] platform/x86/amd/pmf: Add debugfs information
Date:   Thu, 28 Jul 2022 23:12:01 +0530
Message-ID: <20220728174208.2081453-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
References: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c4b1389-c9a2-47c5-c832-08da70c09681
X-MS-TrafficTypeDiagnostic: CH2PR12MB3799:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4zhF/bGVkZXl1vKpFl0FB65EdOnNnRuekdyqqXvoStDDvnkeUIKsjg729heZrlAAXa13vsFRpDnabcdYVfa5dINReubZszbWyK54T1I8BUu0+vZBTGoIE4l32IH3zxqQdQI2QzhcplCuq3aNrLXCEjH+EbcJFThJstk0Ak2n8+lONOD+Wrab+jaP/Ekru7oaXbVhc5z8QWAFeQcQsbAzwhSyt0pd0bw2+1zGidIHHdkbdDs/gRNqz/6Lo+Xip6jNRvgWs9r3eDENLatw/rMOQ+yTST7o0I1P1pteRKHhAtVyP2F9H8iodTX3rEQb/mX9zsAEPFJPiu5G11UuDdbXSTz4mjkUckoPcsWB/83291TGf8RWRsKhMMoeyCIDLCoGkHl4TATs26ExZIsmK+gfkO/uoKNysf0O7HTYVWIEaq8ekWY765u3SyzYulo6SZHYKj90qs+ZFW8cYz8vUB5vs/CiSOg6PcRTioNw+WuS7j4Me+JR0t8BnCyK7jIfPHFHdo47D+kDvQZQ2B1I4yWiG1Zks4bPuNRVvRyhO7/BMsXQKtiJWOJIBErzZdDUOh/kCXgAB+rZkHR6TvfHb4Lf5CqcjutcnxJfa40twuS6ysCLVGhMpP1Ohys6evEumswmLcC5IWAg6iKtZczjUEAE3009s73ONXrRvDCirBXEWxndgr0eCPMtXQgsbL1f27xPH/3t0Q58kWaKOsEtVZHbf1vdKFhRd+oeI23qlqbUmmiBlbokKTry3nn+/TEHrDtJu5zVZxDRHbgK3LxXqm3fl5ftj4oTsGAIZ9tKl0F+0d1hXqrJ1/mvwwCeRvvSF11O4L/cRwQiyD6BLUp8JoVaQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(40470700004)(4326008)(478600001)(16526019)(8936002)(186003)(5660300002)(316002)(36756003)(7696005)(1076003)(6666004)(26005)(41300700001)(2616005)(47076005)(70586007)(110136005)(336012)(54906003)(2906002)(426003)(82310400005)(36860700001)(356005)(83380400001)(40480700001)(81166007)(70206006)(40460700003)(86362001)(8676002)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:48.5747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4b1389-c9a2-47c5-c832-08da70c09681
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3799
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

