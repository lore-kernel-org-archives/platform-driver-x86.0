Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517F2D595B;
	Sat, 19 Sep 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804140; cv=fail; b=kIB3xDIrN7jgRYLBxLBQXWOJFU04g+jRG7V7NtKcRX192KIEGKv8jqQLRvz/RHeaDrIKMxBx+0lhZKKJuYhIjoAkc/2PAAGGPSDatOXRE61PDfpZN1CV2Xpd7mRwaBcJ1dlAlBANZ0KmVsFzCjVt62/+zIrvehMDrIZatSFwRI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804140; c=relaxed/simple;
	bh=djFWuCX8MM2YvFc4r/yLesTaEP/hfWuDI9I21eriiEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S/eLr6raCTC6lypBSQ8yAuFMp68ny4z2XtyIRa9Xxcfbj3xUWpbquSLLX50SLgo4+J6MduZk/CD+P9s5YN6PYfAry7CZ2LfpBPHgypl55WFf68OLecFz6joQKsOTizBSoCRadYMR4wwcYcnJ9Lt1tyYBzPizd/AH81g3dFX4QH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T520Sxju; arc=fail smtp.client-ip=40.93.198.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T520Sxju"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Py4UkUjO3k/nPZy++ZvKvfLBydvFj/dyokUO/TmQD+nfeIh9gm17HQIMPzV4AidQOEOi9MWQRKjcc4LI9wI+0CfQiC7ewyuwREfKoOrjw9iaCcQtMjm1scwNCQzvBd1XHeRmv7hoouzNEDAxXmpGcqhMaF6ayibY6xIZKwjxMQBoDd6xFuNVJj2El6OxxnKF/HCbohFKs/rLz6lXKpxMn9Ku0ZuDiMlZxodnUKZKYPPsUuu1cTKx58+zUOXRVZ6LSSi8PH7Y5d4JZ7J368klDYhYtjuKlPeKAPFntJ/AGABfDAFt3tA9y+ZU3Ux9ob2zuT1QWdPxXN9j8pWNXGIpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pc0tLr+23qYaUqHIrmIuecm3UauFOHp5UsGeAvCeDlE=;
 b=eBHvRKXFPuSnJPa2jlBWZKsHZ6Y33pTZUFadSTwnilw1UvFUWOWU3le/mogj4x/QmMXeDUXENi8chQdlyr9OKuO/7EK6AEdIi2US3zaKBPwnGvq4TiCFAPwwdV4Y4Y3ZwenjXuTqO6dxszuUyRYI4J74Gd8kN5glDa4E5wI94UfCMRe/HMVOGOBBWVgDdYeEUGN4iROL9qHTW+i8Q0BpJFGMt0PooNT6CTcYhuoPGQ8ke+s6nWxqHa4wmJUqsZ/TKCCPoGzWJhZ4YdihKXsdFTerMATtCRYLqPyFAesSM57jzi6Dm339SLTf8aYmp+2GKRp2uZEiPbZnVpIWwIi0eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc0tLr+23qYaUqHIrmIuecm3UauFOHp5UsGeAvCeDlE=;
 b=T520Sxju0uQ6GJPvqIuZnhpKzsGD+KPM4nDNHEN1ZBvFP3TylPkPwBihAMNh4m5Iu0hdSx8sVxS0L1/KHwpeDNDT/6eutE2OcoKpEf/NUkROOVWVEtrFCTudZjFQ9KJbFPQ8A750uDBHYSkgEubrqqK/mRZ5cHqW44xIG2TRpGE=
Received: from PH7PR17CA0068.namprd17.prod.outlook.com (2603:10b6:510:325::12)
 by IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 07:48:51 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:510:325:cafe::ad) by PH7PR17CA0068.outlook.office365.com
 (2603:10b6:510:325::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Sat, 19
 Sep 2026 07:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 19 Sep 2026 07:48:50 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sat, 19 Sep
 2026 02:48:48 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v6 3/3] platform/x86/amd/hsmp: Document and expose client telemetry table in UAPI
Date: Sat, 19 Sep 2026 13:18:18 +0530
Message-ID: <20260919074818.2541775-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919074818.2541775-1-muralidhara.mk@amd.com>
References: <20260919074818.2541775-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b8cac4-78f7-4c44-94e5-08df1622722e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|10067099003|11063799006|5023799004|6133799003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	xaK6iHHjTOmzn+JAeZOsRvqpnCqnFAawFJHCmBBtl5GDwXDuRZXCJpEs1z2XEcwLADs3V44y66DTFyPQghtDhhfUg44k0oUgI80BTJbxkppZbSSwiK/KwPWhUbgFkFlIxmjESQ2mz2/3OoJLa+ocUbfgLBy0YsoIU4oXOjmtM8QHOlsWUnJ5EjLUN36RjqyG+BKzOt5im04gk7OMG72atSVLiB3c3P2dWXTAD4rXPcVF+5F7RddAAneZ6jJHnSG8cdmIK3axmMjYhlRd4huQTUP15hqJaazzAfQUScPUAPlYnUdZiXbZLfvzsiZElNBC5oc9/U1ehs41yEwuCeCfdNFWCRRB1Qe9Honqvb8sgh7T/6CNMXl+NQ4f0qwtiZ4ARYpavMRwjmi2T16KZufrC7oGgMwwKIAwFU0pHiLgA8IGn+Bjx8CSXyupuhEG4r6SQ2jon+zpBk9RygOWMvRrXVdNcR44QjnZnEW2PyrT9rSfMctPWAy4n29AXOj3IWdxCUZ0W27ataxiYcQtMPPc5uND4iHU+qVl+sjKXKRy8lAXFm6KdOvcWjam3dzXE23zOyZD19YX7TIe9lO07MNAdUh1syNTFvaP/A+xXrJnnooosUQVXPkUw8UFPTX1h3RO/NZvsgKE69nzromweeBBN1RBb+EA4dU1RmcViv1Uhs4iWizkVt7og2yB0TmImXlgviku7qnWS7lkif7RAhScuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(10067099003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SZ8YseVWWMNbNct0XkoI8I1VeoiW6EQ0hVbb/K2gn2qGK7HNRSb0i0u4NbIHuepB8d8yAErWcnlZ7Sr7ymmPEuTO9kTzhpqmNuxPzAWdnCvcnDgwU0NhzV4fN90p6WcCEyIF63cBC5IJqACMW/1O7qOi0vBwqtZLnNA6Ld/AySKkNKSyoJaSo5vXcqHYCZ5LZQzkV8N7zB/BzooTGYlW78ntIDVjtIpt7hfnDqABFpvNRElroBQ9u9sWYVGaeLX4s7P9ySQnIEGclUxCtG6N//y4kJJ/IJdCxkEcAYDqhDjDJDTGPB+xb/FPjGFJDC3EWvkLOOl9v61977sph9pE/ZRUpwqaTlKlb+CNPBpCfh+Wbwc5JagnvH6lS9Von55vC6omPY9gcw6vHN3h/6di/O9a5j8vI6gUmuZDeVXtLfPBU2lDs+hkqVmwVahVP0Wr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 07:48:50.9619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b8cac4-78f7-4c44-94e5-08df1622722e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255

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
index 9641e5977c2e..8929dc5975bc 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -816,4 +816,261 @@ enum hsmp_client_message_ids {
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

