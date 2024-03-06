Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374457F7FC
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725492; cv=fail; b=a+2e8sPZW1780ABcbIvnXnsTCsDzFHchdeWoQh8vEG6oGVAj8VYbHndjjInAIOp5tqI3mX9ZPtIAaPL1OGeX+tyN4/FfE2x25RIb+nGH8xAC+clhpQbZ7GdrpMS9uoSmgX4IiJgsOjvrDgDD3mYMwro2lNuxJgjY7xpk2LUlYh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725492; c=relaxed/simple;
	bh=3zav3Vz94J8sPtNtpP6f5P5lbRj8j9meBeLd18aHE9A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSqGr11ahnfbh/I1yTdkEiH/RUEWT5fEr6dClNV3/Zc3fJ1Q4ZQtkmdi58953KdBsidoXCxhpl8OsXSoaYxDM76R6hDJ7rnSWo+2iNjz/9zTmrVfYFEf/Jx3Ct85c84/uYOSHfwGFusiZzxyPGnciwn2NT9lQKo1pRaZXmD5RPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rw1mQTyt; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rw1mQTyt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9hqBaSX9CDNCQawqSN79ERtzGNbhpB1odxyA1IgSOb1O7g70KwD1wSxWQ3VNYj+oOVQujb3oxdIISrVvXGJ2bH5oVUmBRJxjTTVyuD0YeLR33565+s3I7SVWum2jBjf4+prvwEY93ys9OlmqH3on7QOURd576LQnyPreTQj/XTqi9IY2lAq9rrwjlWKfSL/UnN5+QHrncvZ2cLQrIc/Fz15q3JmspGxnWdH6FhGgH2+2IXnD2SFwTJnSVF3z3M0auwGJaeSHI8VRNbDMvs775xXb9Qsl7HXGwgKw/5FPu+V60Qn9NTIuc+9DWSatmWzJ4S7QIWvSxcNY8mzFBE5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCpQ93dd8pGpwT8rnePjtJrVEmmlWfXRkRxIFKNYwvU=;
 b=iePaTm89wQF2mFFPsc0rdIygpYhwrlfGMhj0vREWwYeZJKEofmw9yZgXavTSnvRHV1mcTvPzFTdlfFgcneznORuNeB65z2rE2kTBGbWBtxx038et2Akjk+olJt0Ey1/e48KWxoN7iCama+wMoe0lCjIHrI5o5HQ/GjCNW69zBHCEAnTOCPBJtxAv4jZArFRVzngqE74ZqMWq81BbanKftmJsbEJFZhAKBw+84SZ7jJK5lsmjqCPHRrsgir7QdMJnnf9rkiqCa5Qobw6P1OgDvqwZHOOymzxcNoGK2CnlgZwwM/PZjEIsR4dFZEQf91PjvWgYZdZ8v2TAci3c9KTg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCpQ93dd8pGpwT8rnePjtJrVEmmlWfXRkRxIFKNYwvU=;
 b=rw1mQTytR7gqE8cEEDRdeT5ryZtxzgjgBxkWqsFLSE4Vi5L13ZXTUATXxQXiGOfIl8DsWWY3BYhyZBv86cXI7wSQU3BnlP7jxEgOyalXuScLVTi2S2DaAAXc/yyPIBMDbEfkY983o0uzN7LRlr2dNsvJUzsfZ1bPm7ZH9w0bgls=
Received: from BYAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:a02:a8::32)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 11:44:49 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a02:a8:cafe::ac) by BYAPR03CA0019.outlook.office365.com
 (2603:10b6:a02:a8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:46 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 5/7] platform/x86/amd/pmf: Add support to get APTS index numbers for static slider
Date: Wed, 6 Mar 2024 17:14:13 +0530
Message-ID: <20240306114415.3267603-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|DM6PR12MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e94f96-0186-4948-fe18-08dc3dd2d3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BKJbUIZG6GmRqVDNJcVIMCQRZGdRTkjOYChTe/VlngScmLtIWf7f3Lw1MyplOAugytxKqNUjm1amQ+Bn+DKGIJCLSyhAG0ewmVipLkJkNIyJLxp9guYf8PUKzmBxOjygxwaQxIJbECTKNFy/DmiIHJsjyH2sGxKelvJ9ucZ0VRU2C+wN8i2z6PVdd3pVF+3QF/KWCIXzLAD2Kcun01NGFBeBa7f+FXf2OQWpfQkmFLphH+jLwzw447QOrWIfOoTXtoCFtCdk2UdHVYuWMy/Xp9v0brA7cpwBqgTR92oi4nz4wYx7ykqLqTf3K1caMOPnp78W3x5CpIzbS1vGGBZoNNG+yq6q3c+FeAdwfKGC52vNu6IHwuSei0QpFF+qaNEOULhyHi5xDXtMq0bZre8FB2TNtNSJghS+SSc/4qmWs9a+aBRwBET6Hy4ZWoNZEg6//KwJoazMI1zbvGZRAuAQ3jxDqkOE/e+drrwJuZcaXwWpiWiOTX2hgJyn5lZ8LM9/LACZSonoFWszWfzT5X/V0CyC+xzavE6DUI1ZnHbDbXBgYFG3qUjSpugnZNH2bMEpxpiQX0GrR6JmHqenLDtKyHswyNB6qbyKxlwLOZ4TvuDBHqQlRQutnfYs3lqTDDMWI7PBazpbfoWrpxNq3idvhiIJ5Fu9QLz/pvHwOfqLCOwux8PwK07EgYEOpBdaZfnIEvLgyJ+/M+6dSrW55QBtaEbixlSEWkVkH7siHYm5fdKAg6jURVK8FYG7EmGF33Pm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:48.6589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e94f96-0186-4948-fe18-08dc3dd2d3f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233

APMF spec has a newer section called the APTS (AMD Performance and
Thermal State) information, where each slider/power mode is associated
with an index number.

Add support to get these indices for the Static Slider.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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
index bcd1ae71109e..44ac22098d79 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -89,6 +89,7 @@ struct cookie_header {
 #define MAX_OPERATION_PARAMS					4
 
 #define PMF_IF_V1		1
+#define PMF_IF_V2		2
 
 struct sbios_hb_event_v2 {
 	u16 size;
@@ -228,6 +229,14 @@ enum power_modes {
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
@@ -268,6 +277,10 @@ struct amd_pmf_dev {
 	u16 pmf_if_version;
 };
 
+struct apmf_sps_prop_granular_v2 {
+	u8 power_states[POWER_SOURCE_MAX][POWER_MODE_V2_MAX];
+} __packed;
+
 struct apmf_sps_prop_granular {
 	u32 fppt;
 	u32 sppt;
@@ -289,6 +302,16 @@ struct amd_pmf_static_slider_granular {
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
@@ -643,6 +666,8 @@ const char *amd_pmf_source_as_str(unsigned int state);
 
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

