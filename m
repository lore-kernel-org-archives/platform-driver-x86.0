Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9E63CAE
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204722; cv=fail; b=pJjUWgJjN9MChjzNOtsFgu7T3juMZ+/NE7V2EGHMlezD2p6gBYXKzmuG7eBAR1VfhrLTRUSPd9taQQtXm76zijOUNIBJdzE5fdPRjswYtvCis+uL936pMdHS4g1VmB4F+O+v5+5GfPQDDaJl3KojSD7AScx+qjQaHyPgNj+GZpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204722; c=relaxed/simple;
	bh=w2RA/DPhrv0j/CP6Ty559rerP6pVLuYu8O+Um32VtlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bm+axK6uBb5MoGoRxh4yxXIZ4Rf3FLVxbzwRJla7Mg/AZvKH38bve48r2033BJWR/YyU9gTtI7cLVikhniJdf3G4HWfJ7+jh+1Tu7vF5KdBzxE46Qer0k+ZgIPuiV4dCF2uN5skrtxz6gjOGJTtm5Aw/Y2R3P410sUvyq/HVBGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T8FupS5b; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T8FupS5b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AF5t+/SlmU+a9QvcdsVE9HyCmyJ8XjBABcpj03tjSHhQL8T4PrsZWWhi6Ldk0Vv4T8IpjdpaiKdY96FaGRBPXA50+L+d8b3snXJsV6Vt7Ru/ULBqVyTytcX8Yo6L5Q6j+iLiBqZRbXgjbfvAl0hWJW/SEX4UixEKmbU6GfU+9uHtj9pGd/LrcwBq/6KfTRLiLyYIi/9vcPtsmhGK0aUiypXbB9RAMHIQmUlrS3+II++ZVL8Eir6YJKmrElw5E8X+ryn1yJm/F/HT8F0KS6givUXRrhX9potzeP8FMj3pLi+1x/UKKZlXSCPISpIerX52yHGrsyr9wzQ2pzmYO5G7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RATgQPwZsOhvNjoHgDS6R5Z1JoIMvTNBcR7veJyZfMo=;
 b=fpDAeOf2UFENPrq7XhBrGipdYehaeG6okaGdV2Vl39RxT54CtVJEnhcp0DJbstcTxzxF6NThkLhPkjrQlB+6ffzYn5oRbERqaUGLDaas0VKaaItQL8cv+splyNcU5LU8YsOGkTLMgKf4a5ZKRnUICrfhBxtUmZpLtQasPF53Cr3+NOWfM9XqACvy5sR/+ZD88wnndcrxTdL4eHVEakp/wbQOTDIYjSu0yFAcDOBQGhhtJzdDDrntNPLHC5Nn6gVBSoTw2p7Adg11bWWP3j2iNu0HIWEWY/whbOH5cJ08sJDliA0DGgZ36qmWccMcqBXqYFggxTIgF9YIB1kSm4a0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RATgQPwZsOhvNjoHgDS6R5Z1JoIMvTNBcR7veJyZfMo=;
 b=T8FupS5bliroepwN8VNItRU6h68g7WOCtoMQVHL1H5d8v+C7kPNAp13ddHpb3lKJGplK6WgnTzNUk9F4UQ8D4jKFVZ8nqStDkhobQY24cUFVOh8v6xBm+48LJ2lbO9KZ3+1267qTnFdEIs2ZsRVlTF/MqRt9Skykv5xe9KrIwrg=
Received: from CY8PR11CA0017.namprd11.prod.outlook.com (2603:10b6:930:48::26)
 by SA1PR12MB8094.namprd12.prod.outlook.com (2603:10b6:806:336::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:05:17 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:48:cafe::f) by CY8PR11CA0017.outlook.office365.com
 (2603:10b6:930:48::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Thu, 29 Feb 2024 11:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:01:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 05:00:03 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v2 5/7] platform/x86/amd/pmf: Add support to get APTS index numbers for static slider
Date: Thu, 29 Feb 2024 16:28:59 +0530
Message-ID: <20240229105901.455467-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SA1PR12MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fcc0216-54b0-4607-f5e4-08dc39164fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8jX+5XHD2+jcdT1hRUidvSy32hxO8x9AnAijdNX5hYr4gIBhGFG1QKg5jTHw7k9tmb0VcbfOJFE12AXcgWT1inYxuXYztHmUwfIcWmwSak+tJUwhWYW/ONq9YBW4CFv3dOCqgR4wSI3Sa0a5JL3cjFg7/4A8J/zul0ki2xaJFariH33pwh+aMH0JKYZn57PfmXkmMD9tboU/G48fFeMw8YxBe4XpDWtEYkT3fUdRbOqu8M1Npttp0nUTaPo3H9hFy9go0IVKkVfcrmeAqE21hVaGsDdKdse4hcE9IhfhH79dD4p8a8TCAQxaF2C6zkfE5bF9LHDWgBPrdS14B7fMCrCL2u50iz/mmHmb91t435dFST36ZsIuZopeu6iE3K+fSiqlgQ1tn4bOFaoGdPDlZwKk/OpOlBJ3Sj3ThnvJB9s1gaBJyzAEe0UaahAZy+EXmpQbMElxKMCNEVo1mC5iyfzfr/FWhYdksy9+jt0BJ4Fpvn6AGwAmrR0MyV+yEDKz2Jz5zUWgwMBB+T08rey5mnM4GrW+RKXZZ1RJbrm7NZU29LBKMrT5iCLkw/umoQPUNYSYBj32qxaB35X1HPc1Sb4AS50J9jas5TfFA/iqJmP2N05QY2dehgscWiMg9fzDaWS6tbnqFta43B2Keq3QSMAxbjplQ1pL588XcXKyD+690pDE5NMvOAUtzJDI9a3lByNGw+Lj5aa23IH23XMWfWzcmuzcys1UHuT7AXMpd6NnOHgh3vKu6o6BI16QdbUJ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:01:25.7381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcc0216-54b0-4607-f5e4-08dc39164fa6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8094

APMF spec has a newer section called the APTS (AMD Performance and
Thermal State) information, where each slider/power mode is associated
with an index number.

Add support to get these indices for the Static Slider.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 10 ++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 25 +++++++++++++
 drivers/platform/x86/amd/pmf/sps.c  | 56 ++++++++++++++++++++++++++++-
 3 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index f0360eea81e6..82dafe74fc6d 100644
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
+					 data, sizeof(*data));
+}
+
 int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 				    struct apmf_static_slider_granular_output *data)
 {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 5cad11369697..e1bcd9e80ab9 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -85,6 +85,7 @@
 #define MAX_OPERATION_PARAMS					4
 
 #define PMF_IF_V1		1
+#define PMF_IF_V2		2
 
 struct sbios_hb_event_v2 {
 	u16 size;
@@ -224,6 +225,14 @@ enum power_modes {
 	POWER_MODE_MAX,
 };
 
+enum power_modes_v2 {
+	POWER_MODE_BEST_PERFORMANCE,
+	POWER_MODE_BALANCED,
+	POWER_MODE_BEST_POWER_EFFICIENCY,
+	POWER_MODE_ENERGY_SAVE,
+	POWER_MODE_V2_MAX,
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -264,6 +273,10 @@ struct amd_pmf_dev {
 	u16 pmf_if_version;
 };
 
+struct apmf_sps_prop_granular_v2 {
+	u8 power_states[POWER_SOURCE_MAX][POWER_MODE_V2_MAX];
+} __packed;
+
 struct apmf_sps_prop_granular {
 	u32 fppt;
 	u32 sppt;
@@ -285,6 +298,16 @@ struct amd_pmf_static_slider_granular {
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
@@ -634,6 +657,8 @@ const char *amd_pmf_source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
+int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
+				       struct apmf_static_slider_granular_output_v2 *data);
 
 /* Auto Mode Layer */
 int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 33e23e25c8b1..0cf38bdae7a4 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -10,9 +10,26 @@
 
 #include "pmf.h"
 
+static struct amd_pmf_static_slider_granular_v2 config_store_v2;
 static struct amd_pmf_static_slider_granular config_store;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
+static const char *slider_v2_as_str(unsigned int state)
+{
+	switch (state) {
+	case POWER_MODE_BEST_PERFORMANCE:
+		return "Best Performance";
+	case POWER_MODE_BALANCED:
+		return "Balanced";
+	case POWER_MODE_BEST_POWER_EFFICIENCY:
+		return "Best Power Efficiency";
+	case POWER_MODE_ENERGY_SAVE:
+		return "Energy Save";
+	default:
+		return "Unknown Power Mode";
+	}
+}
+
 static const char *slider_as_str(unsigned int state)
 {
 	switch (state) {
@@ -63,10 +80,44 @@ static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *dat
 
 	pr_debug("Static Slider Data - END\n");
 }
+
+static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data)
+{
+	unsigned int i, j;
+
+	pr_debug("Static Slider APTS state index data - BEGIN");
+	pr_debug("size: %u\n", data->size);
+
+	for (i = 0; i < POWER_SOURCE_MAX; i++)
+		for (j = 0; j < POWER_MODE_V2_MAX; j++)
+			pr_debug("%s %s: %u\n", amd_pmf_source_as_str(i), slider_v2_as_str(j),
+				 data->sps_idx.power_states[i][j]);
+
+	pr_debug("Static Slider APTS state index data - END\n");
+}
 #else
 static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
+static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data) {}
 #endif
 
+static void amd_pmf_load_defaults_sps_v2(struct amd_pmf_dev *dev)
+{
+	struct apmf_static_slider_granular_output_v2 output;
+	unsigned int i, j;
+
+	memset(&config_store_v2, 0, sizeof(config_store_v2));
+	apmf_get_static_slider_granular_v2(dev, &output);
+
+	config_store_v2.size = output.size;
+
+	for (i = 0; i < POWER_SOURCE_MAX; i++)
+		for (j = 0; j < POWER_MODE_V2_MAX; j++)
+			config_store_v2.sps_idx.power_states[i][j] =
+							output.sps_idx.power_states[i][j];
+
+	amd_pmf_dump_sps_defaults_v2(&config_store_v2);
+}
+
 static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 {
 	struct apmf_static_slider_granular_output output;
@@ -256,7 +307,10 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
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

