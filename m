Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0072C001B0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Jul 2023 09:33:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbjGMJdx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 Jul 2023 05:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbjGMJdv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Jul 2023 05:33:51 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FA31FD7
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jul 2023 02:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTdvydHyCick+70j1oTcHN7tMUDukPXmI/vXOOIkhYsBy2/DhthJ8Ys8NzEMwQook9/5E9NrptLtOjj+dzPKT7d1g/6Ftak69VaKdUIUmh+wEjrEPy8l+fhprfUzKb0VlqaqAc/YgCwHHnZvtfNVeMBlUXDt/v9ztOd6ZIsUAu/4pCJf+vFHXblJW1L17xqjoc20rG+AEtn2UMTK3CjK7PIN1bd2n1ToKULxlFzw4WH79OTpHT/olv9gKwPOaTpv0yXPruZUEjrYYenAiqyc6Jx9H5psJRfAQ/gJUotcp9qGTeO1mMcL21Pj4O4cQI2LHJF5tAawblD/Ls3yPceAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjMzjbgxXsshBxxtPRLEQtGYAnOZSmnbDmjk1FiHmf8=;
 b=Cx58h1u61EFvfL+kcMuWn+RmkRJBf221aq32bCNrGIB3qTsi51UJ7qgnEcO6iXAjoTB6LnB0hcAcVjh/SFjKiP/ughiM7m0t1Dk5gq2oQBK70YqQLJG58Yf/DbSJ6ywznvP+HGtxrpV9jtq1fG9/VsBy0q5QQu0msTV+bYhYPcJk41j/b4QrCU5bEugyfD62q8Fil99Gz8x1YQKYWgroyEPoa7DrcKNRlVmIdKM7uPiECdfM/EwHzvUZlU349IXNEV6f3z4PWCmmPpnAay3Z305FUij1NSfTuVOwpIaf8I4KvF48ynGfPfuABS/L5S03u3/Ut+N/2t97mwi4FBlF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjMzjbgxXsshBxxtPRLEQtGYAnOZSmnbDmjk1FiHmf8=;
 b=BkXu9ucw61s4y4tz1OneyMb2Wkh1uA4oEp6rnHrySSb4qSziqPbSwo6C+iU1IRHpwfJUp0JErbxIb+s2STAWhaYueKCHEogN4QX2zjJOQ4SEoCbDSKN0ek4WpgopKReGtiHyEamD4IV01RiVEOGN0v5kfCjwQJVWI1rZQu1OfDU=
Received: from DS0PR17CA0019.namprd17.prod.outlook.com (2603:10b6:8:191::8) by
 SJ0PR12MB6901.namprd12.prod.outlook.com (2603:10b6:a03:47e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 09:33:44 +0000
Received: from DM6NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:191:cafe::ad) by DS0PR17CA0019.outlook.office365.com
 (2603:10b6:8:191::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.25 via Frontend
 Transport; Thu, 13 Jul 2023 09:33:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT098.mail.protection.outlook.com (10.13.173.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.22 via Frontend Transport; Thu, 13 Jul 2023 09:33:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 04:33:41 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmf: Notify OS power slider update
Date:   Thu, 13 Jul 2023 15:03:12 +0530
Message-ID: <20230713093312.1233743-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713093312.1233743-1-Shyam-sundar.S-k@amd.com>
References: <20230713093312.1233743-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT098:EE_|SJ0PR12MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db17fa1-2a5e-4520-8214-08db83844081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xBDgFTK+LLNDz7I2ty2XhUvEs7cbVwm0NkzmrLQU6EmK07DTNQxBm7/Htkb27g9LaOUNE32o7XLi02PiO513h+oi1n5Pr1Xo8KqdjF00Xo2+gSor8A6t+yOefdHVz+mnVw4SZTX/T/XNjFlAuUxzfLIPiOygMdIYuosI/LpBk1slH8/hnCDt/czrqaEq6y6NIGsFyvYAUCStd2yGP1F52XskYZV229vBZm/2rJVsCfthRVb1S3D9bv8oW1m8PlOvnNJ8KoulJ91oCbMW+nBPg4AeGumJDzuujhaQUJLdRuhSbGUgxSrTKHbqBxbG793o0b3EZ/nZcUggK6iDqNzDU1hIBoi+2QPRzsqfyS/WQ9IrsR0p8GTXKW59J3TsqWdRhg2XDBu6dXCHX2fsCtGVpVH8vJf1U+mQW77qpCjedTIGTH+qL6P4YTJ9Z3eBbo4AiuQzuPIW7WE0hGVND6cBl+YO3sV9Gao+NnFfixHeGx8asxZhhc2DSNlY6IEBg/PjLHFh21c2hHQM9jZe74y9MutUcJC0GoOCYOIDVZ5IAUzyBuYGRJfxyAojjeAWKJohDB/ZgdOoKjOG8XuiGkI5t0wn6AFVyvZR3yaxF+2K/YKz8UnhybPXi3afvOZ4dnt283OpoE2ltv3zn4IOpkCEarP9uCfh/7METwEme3wzu2YOJMewzKXUHde2swcfyf7GJK3nRdIok+74MXjhQ9p1+wTNXucG23/eaVck91n9zVfSqogjpqC2jUp5wKJ2cprTqu8rsKlVeJX79HvY/tZacg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(36756003)(40480700001)(40460700003)(186003)(16526019)(15650500001)(26005)(2616005)(2906002)(5660300002)(1076003)(336012)(83380400001)(426003)(36860700001)(47076005)(6666004)(478600001)(54906003)(110136005)(41300700001)(316002)(8936002)(82310400005)(70206006)(70586007)(7696005)(4326008)(8676002)(86362001)(356005)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 09:33:44.3426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db17fa1-2a5e-4520-8214-08db83844081
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6901
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

APMF fn8 can notify EC about the OS slider position change. Add this
capability to the PMF driver so that it can call the APMF fn8 based on
the changes in the Platform profile events.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 21 ++++++++
 drivers/platform/x86/amd/pmf/core.c |  9 +++-
 drivers/platform/x86/amd/pmf/pmf.h  | 16 +++++++
 drivers/platform/x86/amd/pmf/sps.c  | 74 +++++++++++++++++++++++++++--
 4 files changed, 114 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 732b15b392ab..3fc5e4547d9f 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -106,6 +106,27 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 									 data, sizeof(*data));
 }
 
+int apmf_os_power_slider_update(struct amd_pmf_dev *pdev, u8 event)
+{
+	struct os_power_slider args;
+	struct acpi_buffer params;
+	union acpi_object *info;
+	int err = 0;
+
+	args.size = sizeof(args);
+	args.slider_event = event;
+
+	params.length = sizeof(args);
+	params.pointer = (void *)&args;
+
+	info = apmf_if_call(pdev, APMF_FUNC_OS_POWER_SLIDER_UPDATE, &params);
+	if (!info)
+		err = -EIO;
+
+	kfree(info);
+	return err;
+}
+
 static void apmf_sbios_heartbeat_notify(struct work_struct *work)
 {
 	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 730b22457117..42224e37c8ba 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -72,7 +72,11 @@ static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long
 			return NOTIFY_DONE;
 	}
 
-	amd_pmf_set_sps_power_limits(pmf);
+	if (is_apmf_func_supported(pmf, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		amd_pmf_set_sps_power_limits(pmf);
+
+	if (is_apmf_func_supported(pmf, APMF_FUNC_OS_POWER_SLIDER_UPDATE))
+		amd_pmf_power_slider_update_event(pmf);
 
 	return NOTIFY_OK;
 }
@@ -280,7 +284,8 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 	int ret;
 
 	/* Enable Static Slider */
-	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR) ||
+	    is_apmf_func_supported(dev, APMF_FUNC_OS_POWER_SLIDER_UPDATE)) {
 		amd_pmf_init_sps(dev);
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 06c30cdc0573..deba88e6e4c8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -21,6 +21,7 @@
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
 #define APMF_FUNC_AUTO_MODE					5
 #define APMF_FUNC_SET_FAN_IDX				7
+#define APMF_FUNC_OS_POWER_SLIDER_UPDATE		8
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 #define APMF_FUNC_DYN_SLIDER_AC				11
 #define APMF_FUNC_DYN_SLIDER_DC				12
@@ -44,6 +45,14 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 
+/* OS slider update notification */
+#define DC_BEST_PERF		0
+#define DC_BETTER_PERF		1
+#define DC_BATTERY_SAVER	3
+#define AC_BEST_PERF		4
+#define AC_BETTER_PERF		5
+#define AC_BETTER_BATTERY	6
+
 /* Fan Index for Auto Mode */
 #define FAN_INDEX_AUTO		0xFFFFFFFF
 
@@ -193,6 +202,11 @@ struct amd_pmf_static_slider_granular {
 	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
 };
 
+struct os_power_slider {
+	u16 size;
+	u8 slider_event;
+} __packed;
+
 struct fan_table_control {
 	bool manual;
 	unsigned long fan_id;
@@ -383,6 +397,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
+int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
@@ -393,6 +408,7 @@ void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
 int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 				    struct apmf_static_slider_granular_output *output);
 bool is_pprof_balanced(struct amd_pmf_dev *pmf);
+int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 445ff053b4df..ab69d517a36a 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -174,14 +174,77 @@ int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 	return mode;
 }
 
+int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev)
+{
+	u8 mode, flag = 0;
+	int src;
+
+	mode = amd_pmf_get_pprof_modes(dev);
+	if (mode < 0)
+		return mode;
+
+	src = amd_pmf_get_power_source();
+
+	if (src == POWER_SOURCE_AC) {
+		switch (mode) {
+		case POWER_MODE_PERFORMANCE:
+			flag |= BIT(AC_BEST_PERF);
+			break;
+		case POWER_MODE_BALANCED_POWER:
+			flag |= BIT(AC_BETTER_PERF);
+			break;
+		case POWER_MODE_POWER_SAVER:
+			flag |= BIT(AC_BETTER_BATTERY);
+			break;
+		default:
+			dev_err(dev->dev, "unsupported platform profile\n");
+			return -EOPNOTSUPP;
+		}
+
+	} else if (src == POWER_SOURCE_DC) {
+		switch (mode) {
+		case POWER_MODE_PERFORMANCE:
+			flag |= BIT(DC_BEST_PERF);
+			break;
+		case POWER_MODE_BALANCED_POWER:
+			flag |= BIT(DC_BETTER_PERF);
+			break;
+		case POWER_MODE_POWER_SAVER:
+			flag |= BIT(DC_BATTERY_SAVER);
+			break;
+		default:
+			dev_err(dev->dev, "unsupported platform profile\n");
+			return -EOPNOTSUPP;
+		}
+	}
+
+	apmf_os_power_slider_update(dev, flag);
+
+	return 0;
+}
+
 static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
 			       enum platform_profile_option profile)
 {
 	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
+	int ret = 0;
 
 	pmf->current_profile = profile;
 
-	return amd_pmf_set_sps_power_limits(pmf);
+	/* Notify EC about the slider position change */
+	if (is_apmf_func_supported(pmf, APMF_FUNC_OS_POWER_SLIDER_UPDATE)) {
+		ret = amd_pmf_power_slider_update_event(pmf);
+		if (ret)
+			return ret;
+	}
+
+	if (is_apmf_func_supported(pmf, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+		ret = amd_pmf_set_sps_power_limits(pmf);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 int amd_pmf_init_sps(struct amd_pmf_dev *dev)
@@ -189,10 +252,13 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
 	int err;
 
 	dev->current_profile = PLATFORM_PROFILE_BALANCED;
-	amd_pmf_load_defaults_sps(dev);
 
-	/* update SPS balanced power mode thermals */
-	amd_pmf_set_sps_power_limits(dev);
+	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+		amd_pmf_load_defaults_sps(dev);
+
+		/* update SPS balanced power mode thermals */
+		amd_pmf_set_sps_power_limits(dev);
+	}
 
 	dev->pprof.profile_get = amd_pmf_profile_get;
 	dev->pprof.profile_set = amd_pmf_profile_set;
-- 
2.25.1

