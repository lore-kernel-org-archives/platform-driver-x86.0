Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC9C13329D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038571; cv=fail; b=RhbyMxlkIgNe7fv3AlzWWU4GAhNK2y/kgU8ilzJpYk5B5xXLaU22CzBHcThX3Ey1IPOqzJKrVAXUptbUIMP045WsFF+30AOzAsJafz+NcywZLgL4VajcLmP3Qn1jJVEO08ZCB/WZTZiE+W16ErTgHb3lYWszjGTu6vQr4Zl2Kgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038571; c=relaxed/simple;
	bh=Ji8sfLL5r8Vhc5yp+XZmRtoT7Z/iCKPyoALEWrHp3js=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHqC+9ndI3l4cdEUr5qNwYKOpQX80M0RDnfYz6QDOzKU+KTpRqTMZgzlbpS5RwT3cuEA15YhsFg3hakh2Pby2m0LfsfEPwimHu/nwEiZZSVygQM8//EvV0vwE2bd6fH0J9rz7fQNhVu8LpaKdOBxx8q4Jpz4ZgmRUqj/R7MhNrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d5dqhHvm; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d5dqhHvm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGwnHGlihN2P3SltVwrjcRaGUk9CZ4ocD4E6sHKiGJf08g7pWTPDsQJ+n2ZY+H3bEpMB3TfMdNquRK2kYgzzVVDqK4XksofUC0MdpVLcHqyL6KiWrbNYaSmpAQK3T98DijVQ2cfFXOhbW00ptGcQFhbhg1ed3BEi8Cta91HiSyJof9MioIegEgcUSBkY5NnuDXeaz+oV07C5UL2wQwB8Vvw8N5QvQx/0v3a7jTbV0CrliGNhzjN6xfncToHlbBR+MMs1rjlzeGGCwqOmQxp2OpcY29C0SO0pgy0N9l9T/9pbiU/6suDzan/yXuPiI6iWrpOHFanItafMMAW/AIEbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSlFsK8bBrA2orhZYp6xNH27VT0CObcMz78Z2EEIQj8=;
 b=gjpU9kkdP0kN/NFRy9leeEypP+IWay7ygZ253YR7gX4d8MUG9dkGnerIwcch08B1usIWLzqvH/0NjB/2Gm6YD0lzB+10VeXTF5QPkOdYgBur9enS+e8pqt2KqGaaePzRQfprIiekO7PuOV2KeHVcTQVHd59Ha/9tCc1tbTWmn6tLBZgkMouZFC5GCmDCzXamfl8Blij13EDH/S4pdp7blcsUTAY8VqMUJscB+ZBjPI9dGLxrG9vQP+GRY0bo2XiNzYdIeQUpcb6I7wA0j7BtWFJEU2EKEU1A2F6TS/i5abe6lL+eTiiBLHnkiOUTvpDJJmlbCIoy1o51XqG6ubF4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSlFsK8bBrA2orhZYp6xNH27VT0CObcMz78Z2EEIQj8=;
 b=d5dqhHvmKPk+XASXijoZRnkM5eo8zxjFbN5sfNB1y7f4Wc/wuSrc52uQGc/qHUrM3zC5JWFFW14y42WS3haRfx2JjsF2ZiC94ruYfdrePkd+mtpo6Sc7KULPwlCE5rcQbCQQhgUpyCa4gogGTFK5PubjM5h9SffrqajU3/IMfJw=
Received: from CY5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:930:1e::27)
 by CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 12:56:06 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:1e:cafe::7e) by CY5PR04CA0007.outlook.office365.com
 (2603:10b6:930:1e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Tue, 27 Feb 2024 12:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:56:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:56:03 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/7] platform/x86/amd/pmf: Add support to get APTS index numbers for static slider
Date: Tue, 27 Feb 2024 18:25:18 +0530
Message-ID: <20240227125520.3153140-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: a66f540d-3873-4bad-eb99-08dc3793766d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jT8ev0VjbYtfFIOZ2uck5qYiL53O0Li3FxJd0GXX0RavaO3T/gOnuTedjnXvViRLnBTcaSEJQQrOjEBl8fwtoVyBvxQmOmsbZg9rRE+pV/FOwfg8+BYu+qQY/MYs0PKoku8D0Hw1SXvD9lswChTQO79pbhUGot9WwTtIbYJUvXAG/N/dwPEQeEvXiv86SRdUtgRZUSBnoGxxcevUSkcA/Z1UEsq/0qlrfV0Kg4fVrIqJnWxls8qxxXrJaUSH9NiBGfzWUnw1uLhh/Mi435N95u+P8drAtREKWMxRJDy6frma+r5pxVROI93Ob8k3Kv/ghqxuSfUEv4rV6QHp2xdL6ICYN0mDHhyu3GQrjM2RgYbCWJNQMotrHesUTBdmJosExtP2YESugo3ab+lCUIKwFoNosjuHy//fpDUTik/orWcrX41/B8tlnzVeKLdRoujl5kENEiPZEZcB9nZmW6emy4r2TZ8o33bAOqYtQaRz1wcrLRItkhUXO/kNUbG/et7HfwHNCRa4GTyCcxMunPjmelgoacGWXixMn598EME3sKyYcg0lz8fVud2aHwnM3h7avoIS+lxLwZFx7cr93jCtn9UH1aXimv6wdiSITlLFAXCPtJWZDmBMQ81HMPJO7WmqvzDmjUekWzYNlFPpAxR5yH5C7emsEvuX2oh2g4bLl2FPqWwJHnHv6tejtwVDgQsY94KLj8KsW6NgRay9lnTModKRh+qERU3D/QgnoMWTwtFfKZj20rNRvraAskNRIG22
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:56:06.5309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a66f540d-3873-4bad-eb99-08dc3793766d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370

APMF spec has a newer section called the APTS (AMD Performance and
Thermal State) information, where each slider/power mode is associated
with an index number.

Add support to get these indices for the Static Slider.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 10 +++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 24 +++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c  | 42 ++++++++++++++++++++++++++++-
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 0fc8ad0ac3e9..28df45c058db 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -96,6 +96,16 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
 	return !!(pdev->supported_func & BIT(index - 1));
 }
 
+int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
+				       struct apmf_static_slider_granular_output_v2 *data)
+{
+	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		return -EINVAL;
+
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
+								data, sizeof(*data));
+}
+
 int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 				    struct apmf_static_slider_granular_output *data)
 {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 5cad11369697..b27e96aeac23 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -85,6 +85,7 @@
 #define MAX_OPERATION_PARAMS					4
 
 #define PMF_IF_V1		1
+#define PMF_IF_V2		2
 
 struct sbios_hb_event_v2 {
 	u16 size;
@@ -264,6 +265,17 @@ struct amd_pmf_dev {
 	u16 pmf_if_version;
 };
 
+struct apmf_sps_prop_granular_v2 {
+	u8 ac_best_perf;
+	u8 ac_balanced;
+	u8 ac_best_pwr_efficiency;
+	u8 ac_energy_saver;
+	u8 dc_best_perf;
+	u8 dc_balanced;
+	u8 dc_best_pwr_efficiency;
+	u8 dc_battery_saver;
+} __packed;
+
 struct apmf_sps_prop_granular {
 	u32 fppt;
 	u32 sppt;
@@ -285,6 +297,16 @@ struct amd_pmf_static_slider_granular {
 	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
 };
 
+struct apmf_static_slider_granular_output_v2 {
+	u16 size;
+	struct apmf_sps_prop_granular_v2 sps_idx;
+} __packed;
+
+struct amd_pmf_static_slider_granular_v2 {
+	u16 size;
+	struct apmf_sps_prop_granular_v2 sps_idx;
+};
+
 struct os_power_slider {
 	u16 size;
 	u8 slider_event;
@@ -634,6 +656,8 @@ const char *amd_pmf_source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
+int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
+				       struct apmf_static_slider_granular_output_v2 *data);
 
 /* Auto Mode Layer */
 int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 33e23e25c8b1..dc4c7ccd4c43 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -10,6 +10,7 @@
 
 #include "pmf.h"
 
+static struct amd_pmf_static_slider_granular_v2 config_store_v2;
 static struct amd_pmf_static_slider_granular config_store;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
@@ -63,10 +64,46 @@ static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *dat
 
 	pr_debug("Static Slider Data - END\n");
 }
+
+static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data)
+{
+	pr_debug("Static Slider APTS state index data - BEGIN");
+	pr_debug("size: %u\n", data->size);
+	pr_debug("ac_best_perf: %u\n", data->sps_idx.ac_best_perf);
+	pr_debug("ac_balanced: %u\n", data->sps_idx.ac_balanced);
+	pr_debug("ac_best_pwr_efficiency: %u\n", data->sps_idx.ac_best_pwr_efficiency);
+	pr_debug("ac_energy_saver: %u\n", data->sps_idx.ac_energy_saver);
+	pr_debug("dc_best_perf: %u\n", data->sps_idx.dc_best_perf);
+	pr_debug("dc_balanced: %u\n", data->sps_idx.dc_balanced);
+	pr_debug("dc_best_pwr_efficiency: %u\n", data->sps_idx.dc_best_pwr_efficiency);
+	pr_debug("dc_battery_saver: %u\n", data->sps_idx.dc_battery_saver);
+	pr_debug("Static Slider APTS state index data - END\n");
+}
 #else
 static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
+static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data) {}
 #endif
 
+static void amd_pmf_load_defaults_sps_v2(struct amd_pmf_dev *dev)
+{
+	struct apmf_static_slider_granular_output_v2 output;
+
+	memset(&config_store_v2, 0, sizeof(config_store_v2));
+	apmf_get_static_slider_granular_v2(dev, &output);
+
+	config_store_v2.size = output.size;
+	config_store_v2.sps_idx.ac_best_perf = output.sps_idx.ac_best_perf;
+	config_store_v2.sps_idx.ac_balanced = output.sps_idx.ac_balanced;
+	config_store_v2.sps_idx.ac_best_pwr_efficiency = output.sps_idx.ac_best_pwr_efficiency;
+	config_store_v2.sps_idx.ac_energy_saver = output.sps_idx.ac_energy_saver;
+	config_store_v2.sps_idx.dc_best_perf = output.sps_idx.dc_best_perf;
+	config_store_v2.sps_idx.dc_balanced = output.sps_idx.dc_balanced;
+	config_store_v2.sps_idx.dc_best_pwr_efficiency = output.sps_idx.dc_best_pwr_efficiency;
+	config_store_v2.sps_idx.dc_battery_saver = output.sps_idx.dc_battery_saver;
+
+	amd_pmf_dump_sps_defaults_v2(&config_store_v2);
+}
+
 static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 {
 	struct apmf_static_slider_granular_output output;
@@ -256,7 +293,10 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
 	dev->current_profile = PLATFORM_PROFILE_BALANCED;
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
-		amd_pmf_load_defaults_sps(dev);
+		if (dev->pmf_if_version == PMF_IF_V2)
+			amd_pmf_load_defaults_sps_v2(dev);
+		else
+			amd_pmf_load_defaults_sps(dev);
 
 		/* update SPS balanced power mode thermals */
 		amd_pmf_set_sps_power_limits(dev);
-- 
2.25.1

