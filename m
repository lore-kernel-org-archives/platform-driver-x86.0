Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C4ECCA486
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbiGLPDI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233758AbiGLPBx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:01:53 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B26C08C9
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 07:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4C+MzXzFFY5P7guJT+GRz5K52r+IhaztE0FMHEIJ8XIeWpTonmwlM2CujelzkmmT+b4cK9wIiSz07hlXTuK1PbsQw+aEmfYwZmanHpFsLUmnpkVecy+apNleE7dGlEGqsNPEeXTd71EgKDXjJVKlSaxd2knkKPfNb1AK8wczT9UWQRh9CF6jTLREj7nrZahW0oKgz8XTvSvey+/30l+LJ3PRk1bupgzLRueduKXcdUjtlFhumywDZFiiUHqlOwbj8NZLKrrKx0G+SoJXhOlmv7w6OisWJvNLSnbGFknxhW3bVuDQ800lLxQqTLf3o7mSPGylLzCiqwj0yHHO8w5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqBOyrgLf3j1wEyoJwIjlCBCxb49hwEDjHC/STsnriw=;
 b=Nqa13KnjeEYKjal1Ctz8sHkuezuiDlXodjXJ8d9tWLDLEocYc8WaXSE4bzlYZ4R1goAEZGR7er1Gg3WPGRfBjc9Ji7oMAAP8r7mBgbBkjuqO+ZohK8dx3WN4u7mTgV+WML6ZgXbr3nf8fiX3ai3UD7EIuKD4lUAaD6A4v3/GAnGBy/FHy7db0k2UpIhdPXQi4eoaTmq2W1XNo7qRnq7Bx+hK2kVzPe5q/uiITFqECne7NCoT6gx/nQkWr9ZBmeNQjdKoDBf5zr2zwcwhSD1A/vxjWexO4WGB1KOgiOdElxp/nFGAbzZWY3LjL6jAIFTWwsF8cWu0+JPkQR4dAB70ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqBOyrgLf3j1wEyoJwIjlCBCxb49hwEDjHC/STsnriw=;
 b=C8q+yqT0ET1yYj8IRxRph0qLLHwuvt/H0F1zw0jSSW7cDmIbTHwQ0ri9/t1x7/VGApH7gzTzBAdtRrTqrH5dPDacMTkQRWSSilt/cOHMocP/drSej7U4fWpOQrZZ4crYues+PHsOZnboFtek3eSW2J4Yvx40xdl7w1deut7nNSs=
Received: from BN9PR03CA0448.namprd03.prod.outlook.com (2603:10b6:408:113::33)
 by BY5PR12MB3859.namprd12.prod.outlook.com (2603:10b6:a03:1a8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 14:59:40 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::89) by BN9PR03CA0448.outlook.office365.com
 (2603:10b6:408:113::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:37 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 05/15] platform/x86/amd/pmf: Add debugfs information
Date:   Tue, 12 Jul 2022 20:28:37 +0530
Message-ID: <20220712145847.3438544-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bd58e6f-f19e-4f46-6901-08da64172575
X-MS-TrafficTypeDiagnostic: BY5PR12MB3859:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: toEzk7+fcyuuxrsSnCw7jOypJdMYYj2mGzZwR7tFEL5CyLIL6BBo+G2RIYKmu+XNJY+lWfaWvBR1rjFqjh5ZL3wN6WEG72h6K8MquyzJM+cePGPTUDX1CuMCXa9V3NkUfiAG3Sw47OE0y3EJGTPCELuvV/mlj3SdcnhsAYVFRjyRdFAm2YILnskVHj58dXEguVl+nlTfW7wDeDgm3XqH463YCWP/VqVr5yfi+ZOdE7wrsc5kvFGxuWIaHBDS090aOh1HHwoF0HWDbhdOfVtkCg75ND9XE6xup/hE02pWx9vy/C1rWPd1dyNSAdRTrtYHK3fKCmkiKXLm0yOD6jXyhiI0Tf16ZeUuWfjDBnFIA9uyG8XttM6d5oJCNuWanNclhepVh07hoQTEc/lX12DTiSysRH6x7/HDYW9MFylWsUaB4FYgxLGzvZA09c3j840ju8sOg9HcGkf+3HW2BfbDPzesYRvm1BkPp06yttPOiNg+ZPGeLA5E8sevXPvNLf0miCroUWE+wINqFM2QDX5kyhG6bU3CGGEkV/DLmHG+GQ67vm+zAMjI6kkycQrWr95uNChn9jbgIDuwZZGJuvhT12Z+DPGHRRrqYu/SjnRv7Hcb1V19d19lqMHOaT0dgPcmx/knJMXHNPgqqFkl7HXPJex7CFS7ilJ0ZB7twPW7Qr+zmfSHzgT5Yc4+3KQvs7XYpOaV+p2yh5K9bE6isS97hGGqXm2qAtC/PEbybo5Th1LdgSuK5nRaCo+4jw0Atof8daLqGngdU8CXnGFAllNXHDLpEejGBQGoGYvL40osqwONenHut6hZO7MNxl2nYXIGRWx86a6ctpba80DGR3L6LIpajeYLqDIXUqMoQxoRBFU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(40470700004)(316002)(36860700001)(41300700001)(8936002)(4326008)(2906002)(5660300002)(8676002)(47076005)(426003)(54906003)(478600001)(110136005)(86362001)(186003)(83380400001)(336012)(16526019)(82740400003)(1076003)(356005)(2616005)(40480700001)(36756003)(81166007)(70586007)(40460700003)(70206006)(26005)(7696005)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:40.1042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd58e6f-f19e-4f46-6901-08da64172575
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3859
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add debugfs support to the PMF driver so that using this interface the
live counters from the PMFW can be queried to see if the power parameters
are getting set properly when a certain power mode change happens.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 46 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  3 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index b6006e8ee1a1..3d2af6a8e5e4 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -46,6 +47,49 @@
 #define DELAY_MIN_US	2000
 #define DELAY_MAX_US	3000
 
+#ifdef CONFIG_DEBUG_FS
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
+#else
+static inline void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
+{
+}
+
+static inline void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
+{
+}
+#endif /* CONFIG_DEBUG_FS */
+
 int amd_pmf_get_power_source(void)
 {
 	if (power_supply_is_system_supplied() > 0)
@@ -231,6 +275,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_init_features(dev);
+	amd_pmf_dbgfs_register(dev);
 
 	mutex_init(&dev->lock);
 	dev_info(dev->dev, "registered PMF device successfully\n");
@@ -244,6 +289,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->lock);
 	amd_pmf_deinit_features(dev);
+	amd_pmf_dbgfs_unregister(dev);
 	kfree(dev->buf);
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a405987ae653..77021ef4bfde 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -102,6 +102,9 @@ struct amd_pmf_dev {
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
 	struct mutex lock; /* protects the PMF interface */
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *dbgfs_dir;
+#endif /* CONFIG_DEBUG_FS */
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1

