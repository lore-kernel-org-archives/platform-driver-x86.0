Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEE4EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 14:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbjGNOpW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 10:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236165AbjGNOpT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 10:45:19 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5860E30D7
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 07:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEN/mhYnglbRnjjq88EVOmYUK02ABybyoj5n/BEOTTbJHcxqukkgmRezz0ExuCDnMSGkftd0YirWsl8iXr5kxQDwBqt6EplQcJ7mpjmAfAaNKMOGyKYc9Pn9Cf3+c8PYvJYpXPjf6juU2RU9tiyFBOim66RjZgBouSsOdc0Pxv3hr2/nA4jZwxTmSO3K0j9M8d0GYEtjnCURVA4EKmB0BGt48Ml1ImVtTdKK7Ag5tpEKvLUhC3tU6Z/FLPq8Kl+UqRYeX0fGPTxnS1dmFJZTEYo5Nv1hJhBfzi5z0ZRroLDSZd1SuC7guSj6JaMYJl3tlEnSMNn/EDrykBgEHrSnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL+lmPbI/yKGJrVtit3qnhgZlgomEknQX5CUgzpezdM=;
 b=TPaaW4oJqSNIEm4eUIStBKhpbwK5Wl7Ws4+/lXEpAjcQ06wnsPAzbqq64sCHgLsSsFMeAW95/yJBsoJI5S0/8xtEMfMpP9E/Eq2u1vqSTr3og8MjqdL2Oj9Ba5ryPW2xy9v6v6GHbPORZC4x4YocuiXdekf0EcjCJK7JD57QgOqAckFepYLnzcNeoG9qBYDlHUN3sKdBLd3x7zHcSU0oJF994+oQwnNJBUu87sBGHKeDzqVH3fQEMhHMe535k/uH+B7sa+tOpXeyAjT13LaSYs4/WMQhyRhvf53HK8KT/qAbxW5irITnKQ9akgrZu03V6dAUuIuQGjaomC20xFdXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL+lmPbI/yKGJrVtit3qnhgZlgomEknQX5CUgzpezdM=;
 b=AzaIQb4EtLl847fqHm+UAuyW7HCAzPSqjbp6sAgMLvozt5b1qI+gRfTetjhK0kTlHa7aJ1KeZKchpcKOpcIlzWn9pafkRdqvCUIgHC8FZ9ZdRz13M1Mgc2HmaunblvvWcWLFW/qLcOdt+D9rnCoPMf1xwrkYIQRG/vS1ZIUuTOU=
Received: from MW4PR04CA0203.namprd04.prod.outlook.com (2603:10b6:303:86::28)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:45:11 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::60) by MW4PR04CA0203.outlook.office365.com
 (2603:10b6:303:86::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.33 via Frontend
 Transport; Fri, 14 Jul 2023 14:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.27 via Frontend Transport; Fri, 14 Jul 2023 14:45:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Jul
 2023 09:45:08 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Notify OS power slider update
Date:   Fri, 14 Jul 2023 20:14:35 +0530
Message-ID: <20230714144435.1239776-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230714144435.1239776-1-Shyam-sundar.S-k@amd.com>
References: <20230714144435.1239776-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|DM4PR12MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 7213a1f0-dddd-446e-c8bb-08db8478ecfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEOX31ZGMpwoMhj/AuxpIq/PHJ2F6hGZI2V2pEK1hViYRf2563yUPNjxTgoBAiCu7tdKHWG9+RjQHx9WPKT/t1waBxd6RICZV+jiR8gL2i9p2a5O5PEWxV0U5xKZ5YBPX3J37TIhzvXryYMcCCwmcLeJZyqEA4CO17EAv7tfZPkXOGUXE1HMFm5w9WF9vio6E07jjysOLrhbV9TWbJwf3JZUqYq3F2qI2yDgJGZMu2qOSUP+j587lvcjx3GnXHh4V07/DWKNZkLmqR4li894r8i6Ko/MmwkrNKdHPTMnLnTgF1Ng/Jd69xeo/70Z7wWuMn8zQVPYU1BwZJyYjGzl4JhdUW1my0hYxiJUEeTyukgy+nq0JzE4lUjcDCPYrAmetLGKwiVF1qS77A8dHBxfjS4dyE2BIhsGHYkanxlZ8Qcaf0O8pnbRNvbIQ/OrA3N+utQ8jUV5sf+zUT0XR01+USJF+ctYrBvI3Df71jz6PwqjFIbouT+Gj9dlMrDbimAK0tvEo/oGGKZLR2zM8U72iuTcFUqsF/7now3uvf121qWHS28R8rC0vAG0lRRLpFl1kIlV7OAnHf+G68LZ20xojVPpHzHZeVCTPnb8A0D+/VPuu1acaGFTShuH2c1pEzXpE8neTy+WkMv9/nxSmw649K8uQvkEEDIBgdcgpTrWOAH9OOsLXCIdb7zMflQlLDAC4RIWjmufL31PQya8ZLFowxgD7jwz0OSz8oDX/i1r1RQ1UTkrHq2s2BOF+KA44wRyFeen43+cYntpA0d4AfmUuw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(83380400001)(36860700001)(47076005)(426003)(15650500001)(2906002)(2616005)(16526019)(70586007)(70206006)(7696005)(316002)(4326008)(478600001)(6666004)(110136005)(54906003)(1076003)(186003)(336012)(8676002)(41300700001)(26005)(5660300002)(8936002)(82740400003)(356005)(81166007)(36756003)(86362001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:45:10.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7213a1f0-dddd-446e-c8bb-08db8478ecfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5359
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
v1->v2:
 - Rebase to review-hans branch

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
index 7780705917b7..a02232516127 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -71,7 +71,11 @@ static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long
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
@@ -295,7 +299,8 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 	int ret;
 
 	/* Enable Static Slider */
-	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR) ||
+	    is_apmf_func_supported(dev, APMF_FUNC_OS_POWER_SLIDER_UPDATE)) {
 		amd_pmf_init_sps(dev);
 		dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
 		power_supply_reg_notifier(&dev->pwr_src_notifier);
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

