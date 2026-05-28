Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161183AF66F;
	Thu, 28 May 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961230; cv=fail; b=nIXCkIBBYUKB+5I52sjphbuXB3jpGYBLoHCSzaZtlbsu5N9nmcFhVMlTwgs1/va0ygCDObTFmxw8TJr32chmspmrgmoNm5QYR30DcspC5EeIBeftitwwi0C/VPPxaPK7WUaITEi7BRswZF9IrinLkbcEzVPtaZJ3ibhF457Yj+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961230; c=relaxed/simple;
	bh=0f1eWmFvJNzqzXC92VolsCXHqSACPZq0Z1kqA1i2Zpo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTXmF1CqfhFpgICi/nIldRwaChiWhLOFq1DNWt6TwZo0buWmzsfcS3fWYUayBI18mgGgBiJ1rjK9/JFCaiR7YBFDQA34IqoBlApVPfU7cX/jVqX9OX5xqQjAZTEJGHCc0R8jAtdu9R7zR8Q2fGRp6WBj7Mift17LWF6NoOFdals=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H9ADyWWI; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H9ADyWWI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oz0ZDS/uZqAYgTBaNajHJWvBKaMnqSjk/CCEobLxN/jYr865GZtE4n2qwQ+h1PHfIPqKs21gPFY8VSH1mMxZa8Jui3VtjuSbKH55I8gZU9inSpOUXQCtg+dgm0jpY4Oft9MG/CLMtOCu4PB0CAiV9hV5wJ5ZLMRpUMwMiyOsM9jG7ae5rdwAlsTPuHGbsPq6J2Qm1yuXo1duUaNsruUdhsvjVIUuYwKN1occ0iIBIOTmwSgOhSJtWclmumlcgftdZy2UrBMWrXfYr0y9CZgYZjwFrqo/yjLlKZKTjjpQoA0zo9wqjV2YczrPInG/Izp9REdpNBRvEenVDIDVjqahwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sE2WV9tkhN2aiycQIkQAh9a9xrvgDAZIdVJzDJVM3M=;
 b=wqNSRdrcHPZp9j/Qkd7g0x557aMdfAo3AiEO+1zdOOc8iEeHbHxKAJ+gg1oQAxMaEkesp/zgqSGgK7zIjE9YihYaudZOGwYRwprrzVilykA/TPtHvNBxWhGowTTLsBiDAidlh9gCqhjtf6lRsidYSfANBePBi96cyFv8/CPrJYpB5FGeiyM+WSdCnBc4+fantGfESWLgGjB6SmoT+xc+TrQVVsxgMXoKQMI0GGm7kYO8pKRIIEXqyQGhggBAVGNQ3he9c8Fl+tnJPEfM3+GBcWaL2zhH8vy/vyJIPENBZHFiThnaLfnUEWjMWPJ2hmvb7cSMiIj8D6G7Kqrd7ttb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sE2WV9tkhN2aiycQIkQAh9a9xrvgDAZIdVJzDJVM3M=;
 b=H9ADyWWIdKPNyhGRTDgRIsxm9/OrjyCqyhGXkT80Y7foIlxHtRdOnS3XoakU6eOYjAmatfwzVg3dA9JoUxLxITLgVVMa+Hh2eM1cJDr2M+PKkcWFzV3N3k8kMcRA22dYOe9y7seTLcB9hziFmTCqNWNk2kY9ge74n9BaoR3K+9M=
Received: from CY5PR22CA0065.namprd22.prod.outlook.com (2603:10b6:930:80::10)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 09:40:22 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:930:80:cafe::9f) by CY5PR22CA0065.outlook.office365.com
 (2603:10b6:930:80::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 09:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:21 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:17 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v4 2/7] platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model 50h-5Fh metrics table
Date: Thu, 28 May 2026 15:09:49 +0530
Message-ID: <20260528093954.2461272-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528093954.2461272-1-muralidhara.mk@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|BN5PR12MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: e16cb33c-e9c6-4578-88c5-08debc9d2332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|3023799007|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	EwdNw70XuqFAOd48YjkAeFLcJRsgiLvqEdmRsORyg5m08f8PnwTlkdCNaAfJApC1wkNGcgAKELMMOKn5/8XGMOArgVVgm34E0mCGU1KwNbEQzdSNSVMgHDZjbypKPFhwwVigj9BWcvBHaHYNvetjtiW+tgKUjgdcgQPjIYgG7Fr4q0PCftq6AH3BpMThELn4jQhyuwUIXp5bR/UGUXeLan6t+y0bHo8IssuaUAk3siDf4BHXfiOQDdhHv59eHsFjdssmZyD7ZzWNBNKD/fzE0BJJhKvYrWWNoj4+x+s77KGSfPqKBvP3YniRoM7jOTB+6Av5iaRKxskptNHAPVWxoUKRVMED2CFtTCHYxuugc3VP1mbhlZE1qcJtNYDEp0EXqWPWHI7z2v84jjfPu1Zz//QGyFxWgiqhNCUZVgBPi71fMZqtbH5laM66g3SqZN7GMscf50o3vrByqQf0nnh6gHA/EMnF/uMMX5ah9GJNH0X+9aq38ZtA8c0W2xSo/eVcWaOWgPCCF6qyglKCnhvcoO4WuTXl0lQOZxKnZpwxviRMMyeCjvInpgLxE/y2CdpPRkLEdxPtEpJrSB/SkcFt/B5gd8gsvpjBrWRdIFyyXADyANTwrxT29dxFL3iyjo2eDUTGI7+6l33JDtZbs78t2XShjrrwqiUdUb8Oe/Cg3m0lo5IliwhmJXPtQo1TQDlJYPyQmiRssVozf/Al7l5N30WBYpxCzGjbe9cGwwbUBfM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(3023799007)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IT6b3RLXYdUKEu5YJMsZoT6B+NLxyNHDIiqBvN+hS4n8CmTIaWZfp/0988/zKIL/vYedCnDtSeuGuSFidxu5c7vtw8k8P1k/B8/Zp/duLLO5X1fqj/w4A+DNRZmu/O4YjJGB1U7pnzSiMzYUAI7Isb3+E6OvIhoiGuxiEgcdqPqFtN/weHMJfmm/zI0dS09zVqQnnVWQKTz/mZmFunDCGosBG5+JKHxL2e70JEocnNwvD3gxeSfnxyAma73pRxnU9wimuct7KRs7+t/eCxUxXQC8jjRPi7GbGkLofdCzot4uRwUTsoNkcke2fWjNMMN29j9s71TFoi8L3h7VSDprY9XtIIHKcABpfVMJy9E6JQ0PYQKm4FUXlPZtyMYfvBhAL1EkTNz5+taMRAX5vJhnz1KsYiYRgqm/Q5ufJB/RG2bPKITkIrKui22mzbeBn8cJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:21.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e16cb33c-e9c6-4578-88c5-08debc9d2332
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511

HSMP protocol version 7 on Family 1Ah Model 50h-5Fh delivers a new
per-IOD/per-CCD metric-table layout that is not compatible with the
existing hsmp_metric_table. Userspace tooling needs a stable UAPI
description of this layout to interpret the firmware blob carried by
the HSMP character device.

Add hsmp_metric_table_zen6_iod, hsmp_metric_table_zen6_ccd and the
top-level hsmp_metric_table_zen6 that mirror the firmware-defined
binary layout 1:1. The ccd[] array is sized to the hardware maximum
(HSMP_F1A_M50_M5F_MAX_CCDS = 8) to keep that mirror exact; userspace
iterates ccd[0 .. iod.num_active_ccds - 1] and ignores the rest.
num_active_ccds lives in the IOD block because the IOD die is the
aggregator that reports the CCD population, and keeping it there
preserves the 1:1 mapping with the firmware layout.

Driver enablement for protocol version 7 is added in a follow-up
patch.

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 93 ++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 52e53ec5877f..fce271282348 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -592,6 +592,99 @@ struct hsmp_metric_table {
 	__u32 gfxclk_frequency[8];
 };
 
+#define HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD	32
+#define HSMP_F1A_M50_M5F_MAX_FREQ_TABLE_SIZE	4
+#define HSMP_F1A_M50_M5F_MAX_XGMI_LINKS	8
+#define HSMP_F1A_M50_M5F_MAX_PCIE_LINKS	8
+#define HSMP_F1A_M50_M5F_MAX_CCDS		8
+
+/* Metrics table (supported only with proto version 7) */
+struct hsmp_metric_table_zen6_iod {
+	__u32 num_active_ccds;	/* Number of valid entries in the sibling ccd[] array */
+	__u32 accumulation_counter;
+
+	/* TEMPERATURE */
+	__u64 max_socket_temperature_acc;
+
+	/* POWER */
+	__u32 socket_power_limit;
+	__u32 max_socket_power_limit;
+	__u64 socket_power_acc;
+	__u64 core_power_acc;
+	__u64 uncore_power_acc;
+
+	/* ENERGY */
+	__u64 timestamp;
+	__u64 socket_energy_acc;
+	__u64 core_energy_acc;
+	__u64 uncore_energy_acc;
+
+	/* FREQUENCY */
+	__u64 fclk_frequency_acc;
+	__u64 uclk_frequency_acc;
+	__u64 ddr_rate_acc;
+	__u64 lclk_frequency_acc[HSMP_F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+
+	/* FREQUENCY RANGE */
+	__u32 fclk_frequency_table[HSMP_F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 uclk_frequency_table[HSMP_F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 ddr_rate_table[HSMP_F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 max_df_pstate_range;
+	__u32 min_df_pstate_range;
+	__u32 lclk_frequency_table[HSMP_F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 max_lclk_dpm_range;
+	__u32 min_lclk_dpm_range;
+
+	/* XGMI */
+	__u64 xgmi_bit_rate[HSMP_F1A_M50_M5F_MAX_XGMI_LINKS];
+	__u64 xgmi_read_bandwidth[HSMP_F1A_M50_M5F_MAX_XGMI_LINKS];
+	__u64 xgmi_write_bandwidth[HSMP_F1A_M50_M5F_MAX_XGMI_LINKS];
+
+	/* ACTIVITY */
+	__u64 socket_c0_residency_acc;
+	__u64 socket_df_cstate_residency_acc;
+	__u64 dram_read_bandwidth_acc;
+	__u64 dram_write_bandwidth_acc;
+	__u32 max_dram_bandwidth;
+	__u64 pcie_bandwidth_acc[HSMP_F1A_M50_M5F_MAX_PCIE_LINKS];
+
+	/* THROTTLERS */
+	__u32 prochot_residency_acc;
+	__u32 ppt_residency_acc;
+	__u32 thm_residency_acc;
+	__u32 vrhot_residency_acc;
+	__u32 cpu_tdc_residency_acc;
+	__u32 soc_tdc_residency_acc;
+	__u32 io_mem_tdc_residency_acc;
+	__u32 fit_residency_acc;
+};
+
+struct hsmp_metric_table_zen6_ccd {
+	__u32 core_apicid_of_thread0[HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD];
+	__u64 core_c0[HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD];
+	__u64 core_cc1[HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD];
+	__u64 core_cc6[HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD];
+	__u64 core_frequency[HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD];
+	__u64 core_frequency_effective[HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD];
+	__u64 core_power[HSMP_F1A_M50_M5F_MAX_CORES_PER_CCD];
+};
+
+/*
+ * Metrics table for Family 0x1A, Models 0x50 to 0x5F, table version 0x00700000.
+ *
+ * The layout mirrors the SMU's binary metric table verbatim: one IOD block
+ * followed by HSMP_F1A_M50_M5F_MAX_CCDS fixed-size CCD blocks. Only the first
+ * iod.num_active_ccds entries in ccd[] carry meaningful data; the remaining
+ * entries are firmware padding and must be ignored by userspace.
+ *
+ * Future processors within the same family and model may support a
+ * variable number of CCDs and cores.
+ */
+struct hsmp_metric_table_zen6 {
+	struct hsmp_metric_table_zen6_iod iod;
+	struct hsmp_metric_table_zen6_ccd ccd[HSMP_F1A_M50_M5F_MAX_CCDS];
+};
+
 /* Reset to default packing */
 #pragma pack()
 
-- 
2.34.1

