Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440CF3B894B;
	Sun, 30 Aug 2026 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101014; cv=fail; b=CgZ8ubR2QulF0vFJE10Nek3ZCHLVXwjYuJZtC+CLaUMfAti0OOosb4/JsZqe0z+BTmwCCqrq4ZxrWwY8Nv2Sg5OTc1IOEzKf4Q1YfnqLy40Y0mHS0mTg53WJhrkBxb2L6H6xxQcHpRgg3DxuyjgbC0VC8aGA+ex181Tbht0CLgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101014; c=relaxed/simple;
	bh=ZMjAVVs1AzEKqvMCzduRLrUvyegKk7ULNjFZg0JjpWk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EDzy5hJoP+qAgXBXRhd/hcc19jjLlpPNsC7KoAo0ECj5KXvBAIVfDuWa1QCOZr+3cYlemI812tIjZ28F2RRTEroOW4pC0SCCFz8oFof4pdYb1qJlwxkzFrMcnhnqrU26DRzeH6xBerGy9h/EZYm3nURqeJT9btbTr+qUYxgSqog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sCRYXx+7; arc=fail smtp.client-ip=52.101.193.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sCRYXx+7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCfhN5WtWxgZRhk78kObljrvC0zNUVxR2+1+5xMHLO+C+gZcIjBZjJYtTBhpczL77bD6XyKQ4KIARllcWXpJxGId8ftVEPHBidbBOVHLsw+YK8l08kl0EviQ11PuG6jgTlcPj01aVJjhLNG91W5iIxXWxSrbbkfh2384ACk25PZI0POhdMOEH8DBJZMBZGP9ihJouP7lf1DGa5N9kpouJxaRalFoKUetXQOUqc/LbXIHy80swof5WR9ujE/3zUCAwfzf04MWU8GNVLynhUkc29CWgP7YbGWGe8yQXddb94Y9+Tzxf7k6jer3pkoKcNz+zGfz4NgjHtunE3PN9v/zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LzY+XNUiDghZX1LFspT3pazgVynyJAb6N8gdRpgM6s=;
 b=ntfLbNdGrq8XaaNnouho5h9YLVJa5wBzur7exmoheS1beXtJlx6IjQX94oZPSgituiLyu73Gfc9MrTRGpHq4eZU8+9VjwnqaSL+A7qmXX5vS51RN1BLF69d6b+bmvFec22As2QTU9bayxrn5Xc9mxqy4cNsDEuiCD+MFfZTQxmXdWsdICeuDOhQjb/tMEQS97r3FQXvxzcHYQ3Rud+HOSpvflB+A+V46wMMYNdDFfFaVvcOw0GV4DgONFn9aK1oA3sth+ZpSfOT8x6lcUMf9b/MO+fSRl4R6a7JUc9Be417mLD5Can9BtLjOC7QKY17X4hBXjLp9a/38APU0a9FuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LzY+XNUiDghZX1LFspT3pazgVynyJAb6N8gdRpgM6s=;
 b=sCRYXx+7ijYLVmxdbYPy8LAZylLqVcGUFgSdUYQkpBXEJP6ARP08uDzQplMlOEpFRy1x9UH4M18CSIsMUNbElLYEQPkh+QK8NSVKOMxTVSbZXTyEsL2LUopNyIwRm1eaDwf3oj61uZIWX/1URmdi/gC+1pVZNoExAM/B1oBCaMo=
Received: from CH2PR11CA0014.namprd11.prod.outlook.com (2603:10b6:610:54::24)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Sun, 30 Aug
 2026 14:43:27 +0000
Received: from LV8PEPF00000059.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::4a) by CH2PR11CA0014.outlook.office365.com
 (2603:10b6:610:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 14:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000059.mail.protection.outlook.com (10.167.245.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 14:43:27 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 09:43:25 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v4 4/4] platform/x86/amd/hsmp: Document and expose client telemetry table in UAPI
Date: Sun, 30 Aug 2026 20:12:56 +0530
Message-ID: <20260830144256.2113643-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830144256.2113643-1-muralidhara.mk@amd.com>
References: <20260830144256.2113643-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000059:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7f3146-d5a7-40b6-64cf-08df06a50d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|6133799003|18002099003|22082099003|5023799004|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	1aKioafzqjBGQhG72SmB55X2Dffohwgg/zNpDP0rrrK7RAHRybJgzTr/DwnQDp6WJlCdKUjwE0cIn4oGlkTYwAZd131VTRWm1DrkkSCXh75NzdCvyvSoatsqoRRZzNwCl1a4vHCFvX/kbd56/YvVnIl7UM1COR5655PIYD1pjo6IgcyN/rD0pkmT3whQ4Iv+DHBR1zzvK/KrPO+62vzYr1q/6hZBCDN+mN59KxrZk8iycpsAIBsmDPOnHG7PgoVmKgTO9xg3jqbxsCn/uLrOV87RVpt9vxVKNHA5DW1setEjB2Y2UTyT8RtoTMmhHRuMsJxMsZ2QTU/8cTav75/B+A2+0aRFtJqj0N1S7lXqDnSL0yhymd00rxMPtkiqcAT449LN9XL0PXP7rZSZoGecyfdPmYT3wa3e4FSbJZYRMpsA+pyB0vmyjjnF1bvz6fjwWP3y0LjV80jW0qXRkxVEmzPiopYIDqq62GmLVS7OmRZOWbVpli/FjLIqysug5xGRqBooHv6u1Uwoy7ZxWdLXhAi0rm35CVXa59u5rcnAAz8tPE+I6UraHVz9oHVuY+63KkxAp3LkMeRYoYYiAE3NsDw6yUKUHwiYJS4uLBCix0ZcrMuN63ZcVYVgnhQZIIRQQjAxUNNVOdRBT91ynwN00KMbTKjwUSCxTcp+EqfnNMrWd8oMbKKY5eNXuZvLCBNgNR9+B9zlf7pnnXRk/uhkmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(5023799004)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y+wVc/6UbF2pR1i11dlRonJUsizaLH01l6jCR8YkrpsfKJW5dkojzVqYD2tZ/geDI+KAjO+pY2v/CcrBNK63Qe8oxFJB/Ot+UW1+aTM5YvYBavwwS6Taf4EWa0wDPel6PMhDT9gpMGSqi/Cm0wzAJuUpZXM1izFCS9G7x2O09qxO4TINNvsoYMfBmmLhTYb7a8qCQniCDVSE64OpLC8yCVJ7MbLB7q/wx+8PxJ0Mw23nrs2d4rBpryQ+7Ejz0wJXcUGyi7LlQKtoo0ZeHUAVOcQBfi/DgOpLQ31xq+yDgFPp4/Wy2nCBmszjAycY/4QDwlMstygbOhl9ylbjvOnDGB948CeCTyITCz02Wv97DpNtI2WSaBo05W2bXd01bIfDPEl0hQxj/2IolcjSeaglQ1V5jnJAHKBh6ffLc8TQkan6BoxEKJ3idlyBJd/k8CyW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 14:43:27.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7f3146-d5a7-40b6-64cf-08df06a50d8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000059.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565

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

Verified byte-for-byte, field by field, against AMD's internal metrics
table header, and end-to-end against a live snapshot pulled off Family
1Ah client hardware: driver-reported table size, struct sizeof(), and
field offsets all agree.

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
index 00ca7855ca00..3b549fd65c6d 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -799,4 +799,267 @@ enum hsmp_client_message_ids {
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

