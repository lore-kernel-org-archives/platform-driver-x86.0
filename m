Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A35261388;
	Tue,  1 Sep 2026 04:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238326; cv=fail; b=V8GVCAoogvTRtMGPjZ/6IIW0NiSXygaJ1xoWXm19P/SnO5JEAxNT56kIgh/qbqhejuEmuIZWWuuze3nXwHLhM6uIUgzfWFqlb7XK5PPdi0W0ed4Yye1eGTYrWQUKWEPoZhliDkqV48GoBeE/hdLKWIFBa6c7rYupX4n+TT0JOTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238326; c=relaxed/simple;
	bh=FR5qw+FGZ0ofM+7J/W/yiXPyFYP+XMdu/61eSqX53UU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkJW+e6Rmb0ycoAwsEZV2a1UiFYeJKY2DO1fnR/dF5KXSJ4y+DpgK10rj6EeHXielA9F+JchhSfMYSLLJdau41TkxwGP+44lrQq9WMbEG3hVaH6OzlhZsVZA8GHlKKY85nRdofIG9dYI1OpotJk5L82m7/zrgnwbJP9CcBFL5+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TbR/Dvhr; arc=fail smtp.client-ip=52.101.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TbR/Dvhr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzDoA6UN34pxWWF/Tu9mwmyIxGzuF/BDS0zpohFzsm8rm3j/6FC+v8LYfV7MuoChPZGzCKVQGTL5eyf08b/VBSYkdmRbvq/F5G+Asu6jBpMWFiLTyLGS+yvud1RcsvGszzhcG9OhfIL0JIDgb/8/UDMrgiHen9kz4iGx7/8HTaFFgtyi5mcLG1asFaYhIfdOaQfAQZB9M0hpiLyQsTzrnUgM+HQ+RnnPfKFu5AdSPeYNGANJCgxGjJmB2xn+xEDoCm4zpl4/qnKRyeiBalopMgXCUVqGYUYKN0SajneUz75vNo/VCRFptkMvORHtnuy1O1V1m6A6GC/G15bxHso3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxweoJit0yHM6QcRlfVm76n5tg6ZghJv0BBuVoSjUNk=;
 b=HL9OhDuw6vz7XbeShkf/Gjy5Rgz9xt6nPpXwB2yNVRRy0bNBxU7z516Y7NK12eSLDBO/0k04GTocKHFVgEIvAxaEJ3H5XmcI6r4tlDC5UeA4RjgLfM4OY3YNym9SuP/foocEjpCa1oNjYjHn71EvCQcXW4fnTa3gTwfOII0C3zCBS+AhcPmF8bseps+OzNJoocGNc+jlVl6aq+VfPpO9NA197ymxDdabL0+9n8wUy0Adcm92rIPjo8z+Qx7GzOv3l+ZXhh2E2b1nqskL6lRK3iKbsWVYc+PdRpsBuRM8J5JH2JPUXGN0O3DF4GavcriqyLDvlYd4/d8gv0BgW9hJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxweoJit0yHM6QcRlfVm76n5tg6ZghJv0BBuVoSjUNk=;
 b=TbR/Dvhrlc5lcclqaflPrpgL3fc1u9VvdnxbcWetfvN9rFuXVbWvGO6LU5T0kNIgLCNfvumCGhwvzG/TJ2beq+u7Kh8O/ZI0ibM27/VS9/PmsyBLyMbxBZU+uQkLg1uvr3GNuyWK8eppfsolNwrvTHDDhwwFKfLX5+soG4iDQDI=
Received: from SA0PR13CA0019.namprd13.prod.outlook.com (2603:10b6:806:130::24)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 04:51:59 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::a6) by SA0PR13CA0019.outlook.office365.com
 (2603:10b6:806:130::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 04:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 04:51:59 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 23:51:57 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v5 4/4] platform/x86/amd/hsmp: Document and expose client telemetry table in UAPI
Date: Tue, 1 Sep 2026 10:21:34 +0530
Message-ID: <20260901045134.2833282-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901045134.2833282-1-muralidhara.mk@amd.com>
References: <20260901045134.2833282-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: b0688e4f-8539-4dc4-9743-08df07e4c1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	AU+vf3OEPWiMixiMoOXlPYL6NpWMpTJfwIkM4vbpd7yf6W1YmKJ6WLcSONa01WN9Bhue4fapRWDB0FmMxAvPsxZnKfzSgDUv6l9JIR+aYBxi6ML/NBHZMjrk6Wjtr3Z4f3WTvfrZR8joqFfYxWX8jPVBJK2h5m7qvjh3o9WNLxDoHntUuru1UtqBbTMrzcwRLUl2c3YPiFkDfx8B03GOzJB9ltZeqA65ucZLA00o0lAzEng8m56x12dNpuXCpRwmwvHqS7OcAQuxlgxNBjocJqRc82kNjI74SrfShm+BchbHcnLh/eg1jbb6jnKmT/JATAovrhvKN74I/zc2pPku9zSIE1e8I2/N/V1WBfxmuepeiOlxo61iZoYDl9soU+DxyldtSy/AQdG6eZ8xf+fwXxxw64RyhvxruhRqW+/XmuVSc7VpxVSB8P/EF2NxcLG3BwL0mz1wC5JpJ5XNILZxEG2WWQ8bXsdyE6AfBRQ9hVOLhS5OwhxQbRdokNOMiZwmikcL4jI+wVu2Ul5O6QoM3MQpDp42KULRcMu9JbvOl65Z4EktaZBWK971zI+k2xqmkYNgB45uRNZrHmos6ZsYmIPnh6/i+bV8vEIvBxtoXNiqhQxC7z5mcuHxsDSy8Ae32uZ7Xo23Wg7q/aMbh7TUB3otViH0s4lsWkxaJRj7Na+w1Gxh2yERY7MZJQb4Elv76sx0+g7EvAzmzjVZdGoGvg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wHzxWTTEirb1YVsulAjDf4jBmtUoFMEPcInTjkcm24697JUqhOmy4MC3AmUqmcjNlG2ngneWuE5z7Wo+NnRm0jFA30fRgzL1Cetn//fJWIOb2Sh5mvnBRGcJWJGRtmIA8gr3UZKDBSXLQR29zSABTSEl2JTqLGtukmAVX5AEM0j6fCvO8unR9pfhclLwzEtzwJ/qn8cR+ecS8Ktx50G9oHeuxwQgFMwL4YRN5wV+5Heb+DVfhDxDPxOU9SPq8nI7PslPYB8+oFSwjr9EVC22EiXzqI1e/dt4sEbWcnLr/U3dt0VkI5V2+87BxsDGhLKWqh0+ApPhksY0uk1MfYEfcHU4KzvB28DMsBcFkP9yGl+ItgzkTrUsFv8/oupdbEGvJVa9QQ7Pptvi4ExSud6fnPjYpv+fYyqYtuh3cz0PgZPBK/UR/Coh1NGr3cxtjLKZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 04:51:59.4985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0688e4f-8539-4dc4-9743-08df07e4c1d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479

The client models return the Ryzen Master SMC telemetry table, which
the driver copies out without interpreting. Add the Telemetry Table RM
layout, reported as table version 5 by
HSMP_CLIENT_GET_METRICS_TABLE_VER, as struct declarations in the UAPI
header, so userspace has one authoritative, kernel-doc'd definition of
the byte layout instead of decoding it by hand.

Point amd_hsmp.rst at struct hsmp_telemetry_table_rm rather than
duplicating the layout in prose. The Public PPR for the model in use
remains the reference for units and encodings, which are firmware
defined.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 Documentation/arch/x86/amd_hsmp.rst  |  14 ++
 arch/x86/include/uapi/asm/amd_hsmp.h | 263 +++++++++++++++++++++++++++
 2 files changed, 277 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index b95f09945193..c483c68dcfad 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -221,9 +221,23 @@ The following IOCTLs are defined:
   ``sizeof(struct hsmp_metric_table)``.  Later version metrics table
   layout is documented in the Public PPR.
 
+  The Family 1Ah client models carry their own telemetry table instead,
+  described in `Family 1Ah client telemetry table`_ below.
+
 The ioctl would return a non-zero on failure; you can read errno to see
 what happened. The transaction returns 0 on success.
 
+Family 1Ah client telemetry table
+=================================
+On the Family 1Ah client models, ``HSMP_CLIENT_GET_METRICS_TABLE`` (05h)
+returns the Ryzen Master SMC telemetry table, table version 5 as
+reported by ``HSMP_CLIENT_GET_METRICS_TABLE_VER`` (04h). This is the
+Telemetry Table RM layout, defined as ``struct hsmp_telemetry_table_rm``
+in amd_hsmp.h. The driver copies the table out without interpreting it.
+
+See the telemetry table chapter of the AMD Public PPR for the model in
+use for the units and encodings of its fields.
+
 More details on the interface and message definitions can be found in chapter
 "7 Host System Management Port (HSMP)" of the respective family/model PPR
 eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 3e1b7cbe0f04..907acb93c456 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -808,4 +808,267 @@ enum hsmp_client_message_ids {
 	HSMP_CLIENT_MSG_ID_MAX,
 };
 
+#define HSMP_TELEMETRY_RM_MAX_CCX		4
+#define HSMP_TELEMETRY_RM_CORES_PER_CCX	12
+#define HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE	8
+#define HSMP_TELEMETRY_RM_NPU_BUSY_DOMAINS	3
+#define HSMP_TELEMETRY_RM_OC_DOMAINS		5
+#define HSMP_TELEMETRY_RM_OC_SUBDOMAINS	5
+#define HSMP_TELEMETRY_RM_OC_GUARDBANDS	3
+
+/*
+ * Firmware lays out this table packed to a 4-byte boundary, so __u64
+ * members here only need 4-byte alignment rather than the usual 8. Without
+ * this, the compiler's natural 8-byte alignment would insert padding
+ * firmware never put there, shifting every field after the first
+ * misaligned __u64 off its real offset.
+ */
+#pragma pack(push, 4)
+
+/*
+ * struct hsmp_telemetry_table_rm_iod - I/O die counters for RM telemetry.
+ *
+ * Accumulator (*_acc) fields are monotonic counters; consumers derive
+ * deltas across two snapshots and normalise by accumulation_counter.
+ */
+struct hsmp_telemetry_table_rm_iod {
+	__u32 accumulation_counter;
+
+	/* SET VOLTAGES */
+	__u64 vddcr_set_voltage;
+	__u64 vddcr_soc_set_voltage;
+	__u64 vddcr_npu_set_voltage;
+	__u64 vddcr_lp_set_voltage;
+	__u64 vddcr_gfx_set_voltage;
+	__u64 vdd_misc_set_voltage;
+
+	/* TELEMETRY VOLTAGES */
+	__u64 vddcr_telemetry_voltage;
+	__u64 vddcr_soc_telemetry_voltage;
+	__u64 vddcr_npu_telemetry_voltage;
+	__u64 vddcr_lp_telemetry_voltage;
+	__u64 vddcr_gfx_telemetry_voltage;
+	__u64 vdd_misc_telemetry_voltage;
+
+	/* TELEMETRY POWERS */
+	__u64 vddcr_telemetry_power;
+	__u64 vddcr_soc_telemetry_power;
+	__u64 vddcr_npu_telemetry_power;
+	__u64 vddcr_lp_telemetry_power;
+	__u64 vddcr_gfx_telemetry_power;
+	__u64 vdd_misc_telemetry_power;
+
+	/* THROTTLERS - FAST PPT */
+	__u32 fppt_fused_limit;
+	__u32 fppt_max_irm_limit;
+	__u32 fppt_max_pbo_limit;
+	__u32 fppt_limit;
+	__u64 fppt_value_acc;
+	__u32 fppt_residency_acc;
+
+	/* THROTTLERS - SLOW PPT */
+	__u32 sppt_fused_limit;
+	__u32 sppt_max_irm_limit;
+	__u32 sppt_max_pbo_limit;
+	__u32 sppt_limit;
+	__u64 sppt_value_acc;
+	__u32 sppt_residency_acc;
+
+	/* THROTTLERS - SPL */
+	__u32 spl_fused_limit;
+	__u32 spl_max_irm_limit;
+	__u32 spl_max_pbo_limit;
+	__u32 spl_limit;
+	__u64 spl_value_acc;
+	__u32 spl_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR */
+	__u32 tdc_vddcr_fused_limit;
+	__u32 tdc_vddcr_max_irm_limit;
+	__u32 tdc_vddcr_max_pbo_limit;
+	__u32 tdc_vddcr_limit;
+	__u64 tdc_vddcr_value_acc;
+	__u32 tdc_vddcr_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR SOC */
+	__u32 tdc_vddcr_soc_fused_limit;
+	__u32 tdc_vddcr_soc_max_irm_limit;
+	__u32 tdc_vddcr_soc_max_pbo_limit;
+	__u32 tdc_vddcr_soc_limit;
+	__u64 tdc_vddcr_soc_value_acc;
+	__u32 tdc_vddcr_soc_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR NPU */
+	__u32 tdc_vddcr_npu_fused_limit;
+	__u32 tdc_vddcr_npu_max_irm_limit;
+	__u32 tdc_vddcr_npu_max_pbo_limit;
+	__u32 tdc_vddcr_npu_limit;
+	__u64 tdc_vddcr_npu_value_acc;
+	__u32 tdc_vddcr_npu_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR LP */
+	__u32 tdc_vddcr_lp_fused_limit;
+	__u32 tdc_vddcr_lp_max_irm_limit;
+	__u32 tdc_vddcr_lp_max_pbo_limit;
+	__u32 tdc_vddcr_lp_limit;
+	__u64 tdc_vddcr_lp_value_acc;
+	__u32 tdc_vddcr_lp_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR GFX */
+	__u32 tdc_vddcr_gfx_fused_limit;
+	__u32 tdc_vddcr_gfx_max_irm_limit;
+	__u32 tdc_vddcr_gfx_max_pbo_limit;
+	__u32 tdc_vddcr_gfx_limit;
+	__u64 tdc_vddcr_gfx_value_acc;
+	__u32 tdc_vddcr_gfx_residency_acc;
+
+	/* THROTTLERS - EDC VDDCR */
+	__u32 edc_vddcr_fused_limit;
+	__u32 edc_vddcr_max_irm_limit;
+	__u32 edc_vddcr_max_pbo_limit;
+	__u32 edc_vddcr_limit;
+
+	/* THROTTLERS - THERMAL */
+	__u32 thm_fused_limit;
+	__u32 thm_limit;
+	__u64 thm_value_acc;
+	__u32 thm_residency_acc;
+	__u32 prochot_residency_acc;
+	__u64 gfx_temp_acc;
+	__u64 soc_temp_acc;
+	__u32 p3t_fused_limit;
+	__u64 p3t_value_acc;
+
+	/* POWER */
+	__u64 system_power_acc;
+	__u64 apu_power_acc;
+	__u64 dgpu_power_acc;
+	__u64 npu_power_acc;
+
+	/* FREQUENCIES */
+	__u64 fclk_freq_eff_acc;
+	__u64 memclk_freq_eff_acc;
+	__u64 lclk_freq_eff_acc;
+	__u64 gfxclk_freq_eff_acc;
+	__u64 socclk_freq_eff_acc;
+	__u64 vclk_freq_eff_acc;
+	__u64 vpeclk_freq_eff_acc;
+	__u64 aieclk_freq_eff_acc;
+	__u64 npuhclk_freq_eff_acc;
+
+	/* BANDWIDTH */
+	__u64 dram_read_bandwidth;
+	__u64 dram_write_bandwidth;
+
+	/* ACTIVITY MONITORS */
+	__u64 gfx_busy_acc;
+	__u64 vcn_busy_acc;
+	__u64 npu_busy_acc[HSMP_TELEMETRY_RM_NPU_BUSY_DOMAINS];
+
+	/* STT (Skin Temperature Tracking) */
+	__u32 stt_min_limit;
+	__u64 stt_apu_hot_spot_temp_acc;
+	__u64 stt_hs2_hot_spot_temp_acc;
+	__u32 stt_apu_temp_limit;
+	__u64 stt_apu_skin_temp_acc;
+
+	/* RESIDENCIES - per-CCX CPU off */
+	__u64 cpu_off_residency[HSMP_TELEMETRY_RM_MAX_CCX];
+
+	/* DF P-STATES */
+	__u32 fclk_freq_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u32 uclk_freq_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u32 ddr_rate_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u8  df_pstate_source[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+
+	/* SYSTEM */
+	__u8  gfx_disabled;
+	__u8  spare2[3];
+	__u32 gfxclk_fmax;
+	__u8  cclk_core_fuse_enable[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u8  cclk_core_enabled[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u32 cclk_fmax[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+
+	/* OVERCLOCK CAPABLE */
+	__u8  cpu_precise_and_direct_oc_capable;
+	__u8  gfx_precise_and_direct_oc_capable;
+	__u8  pbo_basic_oc_capable;
+	__u8  pbo_advanced_oc_capable;
+	__u8  pbo_nitro_oc_capable;
+	__u8  memory_and_fabric_oc_capable;
+	__u8  misc_oc_capable;
+	__u8  extreme_cold_oc_capable;
+	__u8  down_config_control_capable;
+	__u8  spare0[3];
+
+	/* OVERCLOCK STATUS */
+	__u32 fit_limit_scalar;
+	__u8  ln2_enabled;
+	__u8  cpu_precise_and_direct_oc_enabled;
+	__u8  gfx_precise_and_direct_oc_enabled;
+	__u8  spare1[2];
+	__s8  psm_guardband[HSMP_TELEMETRY_RM_OC_DOMAINS]
+			   [HSMP_TELEMETRY_RM_OC_SUBDOMAINS]
+			   [HSMP_TELEMETRY_RM_OC_GUARDBANDS];
+	__s32 core_power_limit_offset;
+	__u32 max_freq_offset[HSMP_TELEMETRY_RM_OC_DOMAINS];
+
+	__u64 npu_temp_acc;
+	__u64 df_pstate_residency_acc[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u32 cclk_fboost;
+
+	/* PMF */
+	__u32 pmf_fast_apu_ppt_limit;
+	__u64 pmf_fast_apu_ppt_value_acc;
+	__u32 pmf_fast_apu_ppt_residency_acc;
+
+	__u32 pmf_slow_apu_ppt_limit;
+	__u64 pmf_slow_apu_ppt_value_acc;
+	__u32 pmf_slow_apu_ppt_residency_acc;
+
+	__u32 pmf_fast_spm_limit;
+	__u64 pmf_fast_spm_value_acc;
+	__u32 pmf_fast_spm_residency_acc;
+
+	__u32 pmf_slow_spm_limit;
+	__u64 pmf_slow_spm_value_acc;
+	__u32 pmf_slow_spm_residency_acc;
+
+	__u32 spare3[5];
+};
+
+/*
+ * struct hsmp_telemetry_table_rm_ccx - Per-CCX core counters for RM telemetry.
+ *
+ * Arrays are sized for the maximum cores per CCX; use the
+ * cclk_core_enabled[] mask in struct hsmp_telemetry_table_rm_iod to tell
+ * which entries are valid.
+ */
+struct hsmp_telemetry_table_rm_ccx {
+	__u64 core_c0[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_cc6[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_freq[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_freq_eff[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_temp[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_power[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+};
+
+/**
+ * struct hsmp_telemetry_table_rm - Top-level RM telemetry table.
+ * @iod: I/O die counters and per-rail/per-throttler/SYSTEM telemetry.
+ * @ccx: Per-CCX core counters, one entry per CCX.
+ *
+ * Layout of the table returned by HSMP_CLIENT_GET_METRICS_TABLE on the
+ * Family 1Ah client (Models 80h-8Fh and E0h-E3h), reported as table
+ * version 5 by HSMP_CLIENT_GET_METRICS_TABLE_VER. Units are
+ * firmware-defined; see the AMD HSMP/Ryzen Master SMC spec. Spare
+ * fields are firmware padding and must be preserved.
+ */
+struct hsmp_telemetry_table_rm {
+	struct hsmp_telemetry_table_rm_iod iod;
+	struct hsmp_telemetry_table_rm_ccx ccx[HSMP_TELEMETRY_RM_MAX_CCX];
+};
+
+#pragma pack(pop)
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
-- 
2.34.1

