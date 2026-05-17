Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9797D1C84A2;
	Sun, 17 May 2026 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030769; cv=fail; b=ZCXm0V/62+KutLA1gj6o0g+R0AytRU1W4d2zuPGSVO48AL0s/Ez9zpPikDDtw8YW1FPsfBDKWbFfXBXbEnLMCKtm9kRfXEEc3cuXjNak4rLqH2PB+TMcBF654FtVUgNBtXDQUjSjtCT0NurHoSAflIyq+MUdBFfAlBrvziecQ3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030769; c=relaxed/simple;
	bh=cDX0JTV010ssd+HsFFsmuQ3cp1z1KvHhTjwn3rbLHok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbDC0X4lTz3nYutEFrACK+SDXUhmxTAXmDvqAUauJZjIxT69/Ve4gohiCqr0RRaX2hNg/stj5nmRDZ+LqUUPMmaTj2QK7n9NCntT9MekPkZPcx58XPqyznDbMXDr10qyK/ga1c0M9iF9+5/UXOPbRt3+YXAWnnO+YlyaZUMs2Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ulSF5qDP; arc=fail smtp.client-ip=52.101.57.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ulSF5qDP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdjewzFSMKNuaiGMd8uFy/E6ETdq9JqSgY29/EU7k6Tt9ZRPs8NZSZ30pb63HfBhLIUGKNZUryrV4MA8NeDvBUJqN0T+KsTsdXjuHFuEfSOjz2FMRr6cNh55DioWLHd++VGxxEiddKsVzvxyGRufE/XamEin5jt7Lj0cxp7SuahXLOYqNMRoCPH6ZiaU2HAz3XtFHD3EEHsSMwgOJLf30DKB7G4xOiBnvHZFOVsMpbeVVKRHlMN5ebKIPeJJDs3Ns1+AjueG+8KQJM2ADC9tHSlm9RALgqNIvW7aRlVfLuxqSyyIPXo9nIBio8pnvMx4s4uiFhJq7E9o7eMQ4N4ECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMK7RNrXVBsnd2qMlojNWiDgT3HIz8WUrBbyvGftEvo=;
 b=IJePRWniPX2Ew3/+szeVDiMYhTPv3xrLEaBqiEX2iUJn1puhCdzXbClYbWQ9W2wHFRyBhEjdTv/1iiQDCs98WdTAwD9hNulsaNJJjwbK+8RGV/DHednHeyNdWGav3grmvvv4H5iZEpljqaxzRpRsfdwaALbTNYBhCh7mO9Be+r39i+i/oFg09ekKZcTzy2mMHhb9TBC0RGpJyP4ZHdMZhSj4XPw5SV2o1fcUV21NmRp8bg8wk75Hds1U1wjsFjy3omcpyDivmqlnRnXg7PnZRUEtNlJTd7+jOQqv/YLmK2g2A274AFKqdZcZMzl9LPDO+bp2YmlzlLKiwhn5pSa7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMK7RNrXVBsnd2qMlojNWiDgT3HIz8WUrBbyvGftEvo=;
 b=ulSF5qDPTklP6oGvWvTQ1BO0/KpJgH9c4jz3BFr3n9A07pLG5OTvImFzBcZeGvwwlmHR9oDxyOvWlZne6N5Jn+d0IHm8aJMGqVBnr2I1yHbS2CNeOLtP+sgGtQEIChhw1Bsch+fULywCnwIPLv4w2Vu15pyl2s6Efpy/RdJZAaU=
Received: from MW4PR03CA0244.namprd03.prod.outlook.com (2603:10b6:303:b4::9)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Sun, 17 May
 2026 15:12:41 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::83) by MW4PR03CA0244.outlook.office365.com
 (2603:10b6:303:b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.21 via Frontend Transport; Sun, 17
 May 2026 15:12:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:41 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:38 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v3 2/7] platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model 50h-5Fh metrics table
Date: Sun, 17 May 2026 20:42:06 +0530
Message-ID: <20260517151211.415627-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517151211.415627-1-muralidhara.mk@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ec0c2d-3b00-4e86-5c0e-08deb426bd5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|3023799003|56012099003|11063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BLzFqoux48NdzVkXAHFvLsOTPQVBWr/LGVf+rTNMKEqulDeR+u4/EJsCTyZXoR4lRfXKt2Es6SB8BrPLOtqsSxDvjOBF1SBO9aKlHBhCCZA1xI0xlxqBrpFUg+ML18rZWlftFvVD4Su/aA4NvVOPvZcOgLwpM7x3qqTv9K7Y9TUj80T9yYQSRukFXdtZQF4WkxpXON7ASKDS/KhptIBE8k5fkbvr6sIOX3Eg55mFKkPGfWGhKorappSBNgfVGzkFwpqGEUI5mqlO7CWIpLw1JyHrwlBSkWhr0sBfnOU+rMNnDPxqysh1oIxodp8O8fymxLyqxmCLkR9rWpyVbxvp8xagGaCYf86cSyL0KdD7hFc45HtFHqxap8eCq6wyOvVHz6BVRhzplwLQ5BGNQl7GvAarzPaBhACx97MmqrNC13GzjhQ814p0fYzssMhpxYZZFhEi2JUMgw82V5Ui85ZSzSNylZ7B4XbW5E85q/8uS/1amILV+r1y6CnTtOBXZqAYCp1siXdVWkAr1WpktO8F7lTEFyqzRAGlZXx3PuSG23MK2o9J1jb1lj+Ta8FrhhmlA5Ow6jSvlDXX9EU2iHTPgdP8naQTWy9ifyJ5BFEnn7Il/q9r1bXodO8aGO7QWRmidfNY7n7oKei0E93dYH6Pa/w/7ClwpbPM0PT/YAzK0Sxv9ljSpXBB9QtOX1F9LKOhKYCXb9MAvAQbi32TMv3ZAxJkGz9/kkSMMzmG96mlhTA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(3023799003)(56012099003)(11063799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vzi6GOrLjvk/PiF8s2tXh4BJz45DOeEU1t+60OZcE7TcUSf49esjf4G6NArwp9gXE8roCp7geoFpuBrxPZ7kgft1HByiTIynPByae5xHfa4D/9WYzHp7eVWx3PfQkSZBPS8C2i8Sxf8C24rucxQ4HH2MOLihi0NxHHHm4p7C8Vh/4cpZ8502vgAlILwkJhM5bZaWdHk2iKyc/BEHJDVChWjRVOLe0OoBa0Kb6gRsTnKxGmSo9O3cTPhLmJh3mXTt7HqPapBoYyfsInTLgO/FV0Gbq6ptx31ErB9u5KdybrH2sySlyel+KD0Y65oVQPacVgBJXuaPvAO5lc4NH93vpxG2VmZZD5JB+kYYf3exN/DJ7aXU89G/Bxsjwx3zpVSpPkvvsXuXVQ8BtN8DVFoOjoY/HB0prsVm+l0dPEZUpsownIc8l7qts/hIqGZpyLFu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:41.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ec0c2d-3b00-4e86-5c0e-08deb426bd5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946

Define the UAPI structures hsmp_metric_table_zen6_iod,
hsmp_metric_table_zen6_ccd and the top-level hsmp_metric_table_zen6
to describe the per-IOD and per-CCD metrics layout for AMD Family 1Ah
Model 50h-5Fh processors (HSMP protocol version 7).  These structures
allow userspace tools to interpret the raw metric table binary exposed
through the HSMP character device.

Driver enablement for protocol version 7 is added in a follow-up patch.

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes:
v1->v2: Split the change
v2->v3: Move proto version check to seperate patch

 arch/x86/include/uapi/asm/amd_hsmp.h | 88 ++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 603d62f8d4da..da3e3bbfa33e 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -575,6 +575,94 @@ struct hsmp_metric_table {
 	__u32 gfxclk_frequency[8];
 };
 
+#define F1A_M50_M5F_MAX_CORES_PER_CCD_32	32
+#define F1A_M50_M5F_MAX_FREQ_TABLE_SIZE		4
+#define F1A_M50_M5F_MAX_XGMI			8
+#define F1A_M50_M5F_MAX_PCIE			8
+#define F1A_M50_M5F_MAX_CCD			8
+
+/* Metrics table (supported only with proto version 7) */
+struct hsmp_metric_table_zen6_iod {
+	__u32 num_active_ccds;
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
+	__u64 lclk_frequency_acc[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+
+	/* FREQUENCY RANGE */
+	__u32 fclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 uclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 ddr_rate_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 max_df_pstate_range;
+	__u32 min_df_pstate_range;
+	__u32 lclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
+	__u32 max_lclk_dpm_range;
+	__u32 min_lclk_dpm_range;
+
+	/* XGMI */
+	__u64 xgmi_bit_rate[F1A_M50_M5F_MAX_XGMI];
+	__u64 xgmi_read_bandwidth[F1A_M50_M5F_MAX_XGMI];
+	__u64 xgmi_write_bandwidth[F1A_M50_M5F_MAX_XGMI];
+
+	/* ACTIVITY */
+	__u64 socket_c0_residency_acc;
+	__u64 socket_df_cstate_residency_acc;
+	__u64 dram_read_bandwidth_acc;
+	__u64 dram_write_bandwidth_acc;
+	__u32 max_dram_bandwidth;
+	__u64 pcie_bandwidth_acc[F1A_M50_M5F_MAX_PCIE];
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
+	__u32 core_apicid_of_thread0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
+	__u64 core_c0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
+	__u64 core_cc1[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
+	__u64 core_cc6[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
+	__u64 core_frequency[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
+	__u64 core_frequency_effective[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
+	__u64 core_power[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
+};
+
+/*
+ * Metrics table for Family 0x1A, Models 0x50 to 0x5F, table version 0x00700000
+ *
+ * Future processors within the same family and model may support a
+ * variable number of CCDs and cores
+ */
+struct hsmp_metric_table_zen6 {
+	struct hsmp_metric_table_zen6_iod iod;
+	struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
+};
+
 /* Reset to default packing */
 #pragma pack()
 
-- 
2.34.1

