Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654703A28D
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 07:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191966; cv=fail; b=E40FZVHJZCAm1PUcvMAcVbvK09uwxqomPqJ06o+AqEo7gSB2CVLoGbKvcHWvcrpBaie3xuEpT/62iFcZqfWCRgY8B7zGaNBhWnCl7xaP/tcJPD6GzZunVY/MuaC0n13JlfkyCdt0cbq6InXRToYtNTg2ENnoDsX0hTaA8vJXaOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191966; c=relaxed/simple;
	bh=NTVTPWI8B9V0fjDyUWHA25zH8HZS1K9pfJrfz5HuWIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e2K7hc1sBsE5lGnMuqfM30iZkMjdoyOXHS+7HkJyI6vE8bdQ1DuYKpir3N89ngsz1tqJ4EhntABfMtXQOUWLxw4wPLD+iLbk1+PP9w5cEeEp+jrGk3LOJDjlAQXk8PhOcCVKdnKjcRfGK5HrAnrc52O9pC5eSJwDMvtqLc83GUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=apglNnNq; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="apglNnNq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVdWepe+xtCXUcCzSamgiZQXHNSvwTracpLuXewWEzcRS2Lk/MoYJzZvAcD9tlDX/SYMgE6BCMoLay9O/KZkbe2bOd6QrUrqswquEi1SlRUfQS2ECWi0YT+1rLGGjAhAIDqkB3JIAdEYAKgEXfu53n3AHKZ2SkMyr6gft7Pl1F5AJnranpHXhmF4paAG1zykwHaK5cvk7bB8LwJpDFr8+VF7VQCSgPJV50WHF3y6OMnws5+s/YacMSkKI7mGN57FKxsWdfDXUirs4qJcSbKj2I1e4xIYqbAgLgTpui6QDxAHeGfqtvTalUnDcduq40WDZeb7tVtF6VuRzmPomKdvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyHAWqysauMKyrAycs49ESlARXYyvi2kDPqcMdH/hlM=;
 b=WfTngFyDHHfjIQR62sm5zxrPqoeYrywc4xtDL+8tcv/gu2EW49cDmEokpYUZA9BzgclBUVG9BmKn5NhJir1p0f31/9XVcAMsaMf/PPYvDZeYX24op2Y+KwRdvFUtWfxYP1iIFzPFbEHELFd7rcehooIQqLfcj+3mQxonAFxOU8QliYvm+6YlRp9d2AESDXm9s6jpeppTHBowVjN1pLLUq1mqCD3LU65H9W/bxzDsfKl71JfODGVwBQcw3HyQF5q8sCV2MhPPfKVSTGiuUXdqJatFZm9r27KY5NZS5kl6tr/redAI97Y8gF1iEoJ/4smMvHlDklP+4dFaCZqMnQSvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyHAWqysauMKyrAycs49ESlARXYyvi2kDPqcMdH/hlM=;
 b=apglNnNq1Rbh84UwyQpH3PcUOs9667j9nK+X+RodBdzO5tm9FLqqS3pSo7C6mX56QZlL7KD03Qop2itRAr9WYrjP41MTy63guNKR8EygjmjUfJcpvsO5TMwTtVoOvVq3MbGOsQLee08i/iU71G1vbbWxTsG02Nw3di7EyDXgNnY=
Received: from BL1P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::9)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 07:32:41 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::d6) by BL1P222CA0004.outlook.office365.com
 (2603:10b6:208:2c7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.29 via Frontend
 Transport; Thu, 29 Feb 2024 07:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 07:32:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 01:32:38 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/7] platform/x86/amd/pmf: Add support to get APTS index numbers for static slider
Date: Thu, 29 Feb 2024 13:02:05 +0530
Message-ID: <20240229073207.4092698-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
References: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|BY5PR12MB4068:EE_
X-MS-Office365-Filtering-Correlation-Id: 525ae2a7-1f68-40b8-eaaa-08dc38f89cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PYZiKTiYijWNah/OxWZ/QwlqkDmy7zUnqzJVAJml6IxM5pVaR1yIt7z9+ZP5zd8gi8KKuSH+jt6YLcRsk6JhXzcagaOwTqdp6j6rpxQHtz1U0KRkrtAnlFu2e26GLY9FHg/X9fi9s88n7qaemEH7ACWxqHZzuf7da5ftC/jN+jI5QI5Q72pRU4C90eOX1S0yUHxBDi4QW//wQYejJLvAgCcEDzIYARPUnok/5Ry3wRW5pqrE4rCUX3xeacVL8Lim1An+HvHy9USEanoVVO5azLvRuHL5XnR7TfZqH+Jh1NUMPNFVwEO70rbprFaPHggPasRxjIjKjhOB7kUqntHUz8wJEy7blEdIrr32Eee7pfPgxIWzXKDo4eyFsxKM0SYpxYmv4Dia+Wmp2ND59lJowrZS61wq8H+wCsdktC4+P+acb5DvFFa7bsC/DfCGO2tAzGD06Oy/hx6dRMww7DQKBG4dDNyNj+Lat6RPgKIqthk7yr5S87erFiTEpvEVMzdd/FDb+GkZeUuW4JdCW3FcWbOpM4qe928lYSZQYXX6PZdyQxNAF/HEw4f086DLlaQmhiu2cBubHr7i6873P+KwUXaMHO9bNeHlRakciEu+8hCpy5S4DM+b7J+9HCS+CIZsh0m+heS9Etxa6e6lF4jJBpMJ0/xSkYaGkAz7Y/QCL1Z+qB/nuf5jLHmYaLW0NTtQA2OyFfK9HfE3wyqyH31DUS1xpkK2qp4q8PNwpOmscR79i8TimwcaH+xG5k2RKXV/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 07:32:41.0312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525ae2a7-1f68-40b8-eaaa-08dc38f89cb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068

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
index 33e23e25c8b1..e4bf685269bd 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -10,9 +10,26 @@
 
 #include "pmf.h"
 
+static struct amd_pmf_static_slider_granular_v2 config_store_v2;
 static struct amd_pmf_static_slider_granular config_store;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
+static const char *slider_v2_as_str(unsigned int state)
+{
+	switch (mode) {
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

