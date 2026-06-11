Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7FF3537FF;
	Thu, 11 Jun 2026 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155793; cv=fail; b=pjObdLTd0zEzoVBhECdRmqfprsOJcTazwulb1qBb6CJUSgjcXdPYAw7CQBQ3o1//qLyoM8LAwSsVPC3yS+NkvaTHHGsk3/gg4QkBMicme44bj+ArdT/J7SdQ2JgII96bLNhJAONNyQ/kd40J5yOFuzTXNUeH2V/Ef+Tk4U79oko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155793; c=relaxed/simple;
	bh=gPDMjCAoaHkOLtYFAxLKjKyOqvPok2nCTtfStJ3zcq8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSblNX40GCeDyxeB+TIV8by9qbFwZ6IdM7pz5+kdxijJVpO49R+ILwHRIKUvLSdUqKrMSnaBvK9kVvNVvAZQOjT1T0QAbCz8LLMu1WGde2ZLagKrKOiWtDQqS2isSSU6Mjue1m6IAAV7YkXEmgLXO2uA7os0hKKN7SOZlfVCgEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1nss822S; arc=fail smtp.client-ip=52.101.62.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1nss822S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njmU1r+AqaN7DHGWgyidjDwg3R1h9x2F944KyQLvNgZpVy5ofALrEMnKqh9/k98vfaW7pvuzDomt/njZovjGIaKO9ChyHxmO4RHZxdAFrqClvsrJRxE1iuWW0g3OqURHMpGfSYV5ny2GXx1ZtkknsYEs79tsOQVetHDbR8E0Ys+Y3H+jmXPreIeFjdcyzpdYoGLOhh7LB15FA6/ytjePZilgyAcIjfKck6+iC9I5msIbpZvx/vTe5vAvWhwd0UtL4D2DinSRLtXo3EmGh6dvIG7rX475i6x8uYfFVU9RKy4EVxWCDbESlJTFZrj9TPolR07ReTkmJgQTtXMHTVEhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMz/5a1gSRdTCgtnBsQwo04WNpfqcu1wgyDAw8egQHs=;
 b=QbedilPKaNvnpEY4eyI6+xuIbIvv37/DEDglS3GqZjH8pIRoC0brSiZdpGLJaRUcmr+huz4d98cMU9HOjbV/O1PC+uXwu9Id1n3VlSC6Ss6v4gDH0gF/7wjrxmB++xljSINDwJAcCvjfH9cCVYaI8Q3Dk0c6TPnMgjocBmCGSBPnPa9I8iNUfIDcu5ZekBppLwiK6BnlD2ll6s+9/gCdI6RaRAPR8UToYt/VY6IjxCBTvd3vq/WLiXWswN0BpWfCYo2t4OxSfea82/KJ/+yLd4wTSjobviD0wtUXnJKYbDwSWqkCnKPjJOUWaX2yATg+WSV2lPo8RYLHpmH/xXg+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMz/5a1gSRdTCgtnBsQwo04WNpfqcu1wgyDAw8egQHs=;
 b=1nss822SHkOzAvFfq5nrvNRZoGyb3tBHBIhgf0MQGOLL0DKA3qv7Zn4S5JUQpthWOewMrg198B7Vr3SrECiLPJPmhr4faI3b8e/NZMaCRQWJ05qT9nfwj5GkeGeVP3G3yQ6/R0a6j44/OT2w8BzTavrbQ3mrhAiS7ZNddKHzixw=
Received: from CH0PR03CA0262.namprd03.prod.outlook.com (2603:10b6:610:e5::27)
 by IA1PR12MB8080.namprd12.prod.outlook.com (2603:10b6:208:3fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 05:29:44 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::92) by CH0PR03CA0262.outlook.office365.com
 (2603:10b6:610:e5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 05:29:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:42 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:40 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v5 2/8] platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model 50h-5Fh metrics table
Date: Thu, 11 Jun 2026 10:59:13 +0530
Message-ID: <20260611052919.1095549-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611052919.1095549-1-muralidhara.mk@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|IA1PR12MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 01403834-7b1b-4d46-b668-08dec77a70e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|11063799006|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FYySBt4WgKg9B8aaA7Kazw9T1ncph/3/ziHx5104rAGHh9QzvQ3TapZ03GlSQ8USZfyhhSsGBOBqe6m29CtjB3uNxf3JK4GemaS4pDOfQ6/9p+BUVfK9zRgBU9PXcpRvy2vm/1Ong+Zu6nyNhbGu4/7tqy/DrFJ5lQ3oGoVhJ3oWIqCknhF6GOVpi78CE+N5Aw2BY/EUR3A1DsFGYZHITenqpR5Kh1kF7moC04fcqgO+IKFZK1jpB9/vh+x55/wyQvnRry3i7LqQ+EUbHfaCLzrjppcbU8iVpCJXhCvX+1ZeiPzn5jF7HaSKYYZWvuKzrm0JhNSDNI2pev+idv8F6aqVdddeADisIElpME+rsZTqLMUtwCJQSnE5ZekFj9qdRuvELgpMGpLI/78ibmFzV1IVlqweEJaOYy1flzBg8mWiA13VqTk2aZ+QxXe2Uk8RR70sd2Oe38PD7tGsOhO8Fl18StE2XZYJI1MU8j8J99YsXoLEjGNf3ZL+1FU12IvaHdVqhvd6olEq/KM5Oqz+gAKI+3604tBoTG8P9/NXmVhF25TPIKFNvMSK6h33FDw9EKEYPd71Xnjn3MIRLsaKt1CNBE592DGI5a9Enm/Vn6b7ygVfjuB4PJbBm2O1FxGbI//gG3M6mt8FcLZ7TIUuf4vv4hwzDawjVI+bpS6ZAxA363JRkUTWc1Q80hQNpRV5KBDWS75yXIwPvNuw+ABIw/rLKuntLbT1p/B++7BK4ec=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/bUw2n5iFm8qNVuLHUjQplkjGKgsYPRKnWgc8YCxdYZoz2LCHQd+6e8MO1JH75FTvLryAWBfrUPJUWkSuXYXSE7EENAlUTG6JZENEqvCub/PL+d8qO1S0SCRhMNOUyr/Tb94I4FTe4a7o6C2pb6KU8Y3ueCQ+PkHo/WCs+WlfmwpsaIeahpmrwIcdiZbDxoACzQXCdkAC0x/cnDV8zJdXLs9IvnzJDvJdEDBpmhuGjFXlaYNnI3ECA2mpjuw4sAuoNkiNX2Wwr2deNoAeYesiyxuXmtccyeL9pctAhWjCS0AyKUdebwVQ2DNl23yAIkl1jFq/CRp2oTwQskE+NSxb17ZPx0dQAnlQ2HMDrlCg+OrgDCqUrWv6+EdjVOnTB+kDJkkkkjcFABOBRvhj1qwYBrXGhopQOpjfkPjn0rmLZmUAvuUkD8h4txcL+7Nx0Wz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:42.6743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01403834-7b1b-4d46-b668-08dec77a70e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8080

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
index ff8b6defec1d..34e25d9048d5 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -608,6 +608,99 @@ struct hsmp_metric_table {
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

