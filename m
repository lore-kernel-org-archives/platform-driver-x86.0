Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585AA4A498F;
	Thu, 24 Sep 2026 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265024; cv=fail; b=Elk3ZeWbxR4ZwQve3OqSnZ0U7stqM+oUOMksxG1t+cBGmochzbICaOXJQcb9ar2dwgOAHvUFE66jQZywCXFyAhk1qiN/p0yCR4W2HmE0eFF49+XiroBTwUmAoALHhB1JVuggKt0y59lVarJEfbSzInsw7/PnpYhDd75BmL8+jhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265024; c=relaxed/simple;
	bh=RHi+u1SJLCP6Tes8yP5rdQkyA9B85c6yGIWJhqNIPpo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRvvKQWrCZfV+Os6h2ncqsDK4Rs3Id6+u+hmJuSxLIpWMDMSLym5cvoOG6e/QgixZ1/OpsXSWGgmgxujUKJekyDOw2LX+rIzOQtNzTTv7rQEuRqXM2rM6ZyugxtpHQkhhGdIPa/3GqQ0MnFpLM77KS6ZGrUtFFFhbgT0J4P9J4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NQBPBJlY; arc=fail smtp.client-ip=40.93.194.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NQBPBJlY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQUduv3X0SZ8ncSYu8QDLaOVGqooVUPzACWSKPmmXrl4zTOwuMQTviDkpv/dMsMHuFBUNl05Ilan2/OvpJvHD+9t56AWzMmiwtIalcZs2GwSqYgD8JF0rM7yj/A5GXWIstbaVHyvdOZOVCaPxxm+GVlo9/1C7CzcqyMTUl0Cf4CQNmx1up7w+OUcLmpFrLVA4v0yOi8+rR53sBhfk0SOl+j7fajDPTD+GX3V8sR7c+3GBi/xbHDdiyV0Bhcvc4dCcqlkjoYnKPAhY444pM9E/eTjJ+vJZBv3j2+pMYVxTvxj+zpiun7E6hwwSI/D4wLNDeB8DOSozEjA1OKKLlq6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOK9Kp6I84137u+5X4rVwAuLCqV0zBpNvb5UDEjkc+U=;
 b=lZ3XfkXenDhUtDlnzqt9xggCdrxX5cjttlmce2MkKw0m4TqO1OsWNwZGtNZl4qwRQCMf0MWBxzpO6PPmj0PIj02Pw73mv8IWKFZQWfKfUro2ZQ6KVyWkM/BTTbOOkJ24UikHMUcFWJvxlVKbXHBBDIRhdgOppEfcD+eDJ1yj2O01P/dLrWg8jQuenEFnCo68eI6lZ9f6o8xKYye8noNO17Rfz0WKaKxesECJe5KCGXLCyH1UOlPlDjq6QJ1cuVzjf74yVhZ/rk+c3OX5X8xGFc2ZfFjuVd3jRlO9OGFC4jgd3kWbpXc2AB0oMo9LzHU5hOUkI1CSY/9sVi5UDV26IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOK9Kp6I84137u+5X4rVwAuLCqV0zBpNvb5UDEjkc+U=;
 b=NQBPBJlYqxa22tr4ieWzJtiOMliUQekb+O/Nwrikgb5EnghEor/n7Gfpldn1tngJksye9+MaaoQGZ4dcB7jI3guC7/AKlLdZ6/iGf1lWTrhf5rHbwTHySgH5g7Q07Pei8CVmaQpsfRuXRDgSxjWSfhvtBTm7ORj9xkmpnaVgrGY=
Received: from MW4PR04CA0043.namprd04.prod.outlook.com (2603:10b6:303:6a::18)
 by CH2PR12MB4294.namprd12.prod.outlook.com (2603:10b6:610:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:50:16 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:303:6a:cafe::7b) by MW4PR04CA0043.outlook.office365.com
 (2603:10b6:303:6a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 15:50:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:50:15 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 10:50:09 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v7 4/4] platform/x86/amd/hsmp: Document and expose client telemetry table in UAPI
Date: Thu, 24 Sep 2026 21:19:47 +0530
Message-ID: <20260924154947.1706669-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924154947.1706669-1-muralidhara.mk@amd.com>
References: <20260924154947.1706669-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|CH2PR12MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: e277f9fb-ff45-473f-70ef-08df1a538718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|5023799004|11063799006|56012099006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	e/pvzgKKUV033rMRlSrkLnsp3buQG/l0ZM2fkJRzZnPdty+76xp9w7+NH5lFQSLDgYpSrQF5IDK244zXWRALBilWDpwwzZRjJqLBx5T5B77MpIc6GLJeNXKIKzqaUsqGxY1Tf46kKfiJ/CfsZeE6uTJG2TXlTEoqsyFV36bIogKOYVIfWfD1epC4dO1ev1/+Bqc461frGFG6GkAeueLmJ2X4uzTeOb16zk2vr9AsA51m6FAGTPZFrNz+fXMjkTQn1w9UCpJ9HPQjN7KbohXJaK6u4G6Hb5NrzFmbnIuF4FGm9EsHywkyT7NeXrc1oCoopirNH4tKTHYqTHYGN1OG7JQCCG6gqmPgz57iAclaot+R3cZ5bBFJ1qDJ3qMyJTE6/x3UuQ/MO5973pJtWR0XbzA8dY1Tx6EAmILg2Q3Qq9x02RSu2eDyeViGEqHIlD8YIZsdqyC1pzUUMI940yhIxiP7rQ1eEMuGSvlmZUwqPS+Uw4yE7MCfFaxlcZ8uuZcAXkOnS/lbhIKaB34mqMGpaAb+pRYATBajImJdnXIy8K0eOGF3ySNsIpn1d4svyswuo/L1EhoCx5mu0aD1m3BMFmktw90iWX78lThO9jgbHnuiKJaW7zv5yNGonFuCoEzSjCXuDeIFNh7E/GyZhqoEJj9i63hFyn4vjByFcDlJAOAFPbsZmMRBPwZphiyxq3gua+dQmVCI8ZPeWwXIfCWEhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ubgJJmiHqXc0QQZv8WARmP699PAVl9yhrL+TEgie+xt1SF5+wfvx1BSWpM2DRpxhqh4yCBZ+hsb/JNRD2sFlZKiuOrpKQWlkz8uOf1C/NEkmeB3hI9ijuf1hy73VQ8P4mdL6vVBNF9FfALedsTPBNCHSi4W9T2PQFzorZQAEn3yLIfRu52UeGPdxQjWazkaXcO2+fkOVRJLr9obgQ/sIOTGDml3zz6vspFqIABHTPtVfO3goHJwOYwzn5F20d/pyjSOg4/7EZvqaYcRTU/TiiCUzhH/7OWQqJfpENn578Z4wLp/Zw9jHdpC1Tk9Wx9DaWfDh3vLug4WxuaANWy9I1xRKYVRDzlyvILp2XVpyRrtsPMiEdOSPeAPP5bJngtnHjKcLgpEaz1Rxw8QaRZo+97/399oZX0RzlxtKyCHl/hRN9/qCP22gJWeeRV15C3rR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:50:15.9430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e277f9fb-ff45-473f-70ef-08df1a538718
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4294

Add struct hsmp_telemetry_table_rm to the UAPI header, describing the
Ryzen Master SMC telemetry table (table version 5, as reported by
HSMP_CLIENT_GET_METRICS_TABLE_VER) returned by
HSMP_CLIENT_GET_METRICS_TABLE on the Family 1Ah client models.

Point amd_hsmp.rst at struct hsmp_telemetry_table_rm instead of
duplicating the layout in prose. The Public PPR for the model in use
remains the reference for units and encodings.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 Documentation/arch/x86/amd_hsmp.rst  |  14 ++
 arch/x86/include/uapi/asm/amd_hsmp.h | 257 +++++++++++++++++++++++++++
 2 files changed, 271 insertions(+)

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
index b4f64b2407b6..dcbe89dc4d2b 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -827,4 +827,261 @@ enum hsmp_client_message_ids {
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
+/* Firmware packs this table to a 4-byte boundary */
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

