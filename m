Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011002.outbound.protection.outlook.com [52.101.57.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00F2394EB0;
	Fri, 12 Jun 2026 04:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238401; cv=fail; b=HOJvPjrpCDdwaP6QNOYw/LxUdot8wKQtxKiSwtCYYekL5hl2CzWcN35zFblDXaIQIn7xVlZhPCCvwSGInJdHzZ2LwLXmWB5Ah3mcUyCehJqn6u0aqeng665PvgNdUbnG7lUcNHTgO4uApWp4GTquWWNVdtt0VKBiQHx86Ggnhd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238401; c=relaxed/simple;
	bh=gPDMjCAoaHkOLtYFAxLKjKyOqvPok2nCTtfStJ3zcq8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N17LbWxnV7I9uRBKlt6n49l7gaN7qapNH5JWy3cZUzAayfTZPTFRvHsOupwL8vT1XfecSSW1PYW1SSGlyk5H7cLY1chc4rXN2LsiPE9z4QBw+10OAU0Q2yFrbYNiUPUElea3ec213yWH5xCz/2XFrSRgArRLkmFurZmIRF3gl1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yTFEwaHE; arc=fail smtp.client-ip=52.101.57.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yTFEwaHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDYghPuutiUEIyfOu0CNtjwOyjCvZfSvjHcvVSzTxW6HIucK1EqI2BhDIT3+fb1DsDzvva3+GR99JXnG9ck95T5vjUh9ehG3Ajyf07/gRypRn5/vgVWpzCGkfsr8mcxL1/r5S/tIxCJlksbm7ICFo73srMZQj8l4L0SkdcLLbDxbgQZsk9aIm0Q7yWO6OMilK27ENKEN9Lw0+X7eY4sZuZfl8dw3aedhqU3De+Ye4GE1PcIj1aFICSLu0Jugc1x6cnq15Y03hrbfKkkXTRzR8w3jIzzY2GIjq0d30+x3JXuvC/liVJtJFpWo8sCKisX8LTOG1ZXCTqa6rNehzVOiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMz/5a1gSRdTCgtnBsQwo04WNpfqcu1wgyDAw8egQHs=;
 b=dGIIMEcbtwfg9sNrXa6olO3tTyuFoSQ5xZmvmkuYEWXlV0af9jS1Bb4RIGj++BBh5Of/Z8fVdi9k6EXTozn4tqvxvVLhg1FxdCug5O9Sb1TQnB9GSzAOo/3jZe1hyxZxUnWtlr6SdceiUyxj3/h5MqdbSIBdPJPsFT5R/DYDF1a3qTmeulnt8YS69fjyC3yM8CzU8QKRZIHRLnrhA3XRdCGbNjS2hl3LMC+xlWIqT70Gs9KDRuaiaYXnsPObZ+zrvFouFf0coy40RC63Q1jGd9jOp4YezDaZbKn1SjdYZIxzZkPP4w4ytqiWMYr69ebXqBlVnuvsKJ/jq3Z+qA41/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMz/5a1gSRdTCgtnBsQwo04WNpfqcu1wgyDAw8egQHs=;
 b=yTFEwaHEYBpSak4aSjAf1NGFPmItGcw9iUVKqbkVNhVgyV87xtRC7VVFhQewAnLT9P0TNViinNMCtuWjMSQCtQ6c+81J7YKc4jIMjOEv8WzwfV9NvrtqiRnBp/HX9/7UUBqOkGNbr0nQgQ5j8o46SVMVct2bQnBswpTdfQBeRmg=
Received: from SJ0PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:33f::22)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 04:26:35 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::58) by SJ0PR05CA0047.outlook.office365.com
 (2603:10b6:a03:33f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7 via Frontend Transport; Fri, 12
 Jun 2026 04:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:35 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:33 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v6 2/8] platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model 50h-5Fh metrics table
Date: Fri, 12 Jun 2026 09:56:04 +0530
Message-ID: <20260612042610.1629037-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DM6PR12MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d20feed-a21b-4ca5-0542-08dec83aca2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	jB5r/uw6Q0WiXf2e7HgKK/Q8kMO/Ey7zcE7ucvln8WwYSAXE8+FJHy6b3CcTq7PQlZlZRFL13w8iuC/fHaVwggt4wiRKwlbIUNI/0KsRDN7CLf1s3rALZiJsVgxSR0UiinOtJHtbKPIwCyRY0zjzdT8VgRwjCo8w373UXOvYP1QGRZEyvWWGA119LmnhNyjuGWKRTItA+SfhkDgWsJ67sCQFJAwuqjS/7O6sgCeA/nVBpuvAdTTo1nkfkOK7d6apnNG+ul9XH4rEtIAEW8MmQfEgeDXDfFE6k0Ep5F5gBCTJ2YJyXrB4Azo+6z1AzpEorX5hImIw+kd0ro7r093QOS8xE1grhVW9+J7ElfFXEDQFsG3HDJoCTIHpyp8RQ1c+t3rxBc0yQ4qUOtkjKXjex/LL1mr9Of1b7lXkTH8p6PF9+q5AALMx+eOS2irUE9r9ZakYn0wVBsTm4O66EBiyRkUE7pdLr640IfObgzFt3j9GdwLB9pd5MWvdhL6ME1kOKAYRotGX6w+nQhU9WXX60cKVAlQ6XFK9hTWZnmXwa5H5e5BJon9Jc9zhkPVK8fih59K67bxlkVIPIl0V4L2He/isyrzKkWWToLKApbLyPmtgK4cnvFy0To8OnRbV5Wx7PeAtFmhRP6WBt2q85FqoFOd41CZcnSi1aEZSoKWTgNZheHoF1al2JIH4CblG4Q207FFO+t78Cc6qIDEPwIx1ttyKC7dsncSEACWYRrECRLc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PTreUP6b5eXsVMUUt+/xEirVqgycMLEZTyB+V8dNZ5jWpE0v74fRhljp65miyC5OqB5og5+VLez8An1gN6iD3NKL4ln/B4DuCeZvi5+9UjhE1XJ+n/XBlawD7xjHtmtPnSc0uyuTmwVl9JYcjBJbcw+CWL/OJ70tkh+aL3oforalydhbHKZ0j0aG3iHwj85Ds1h951wwanSDNQ42Lup8O4Ny2Xevsv0pk1Ii3j0YdteANgx2jbd1OMk2w8HGQ+SfWzQzBwG7X1HYyZqMRly8xVueuYAs8mG2OOFe8AGYXzUa1vQ/85xigSeMQ5BNpezoQvi0EIdD0LZuE0YUff7gzoQgbD45PRL+UmYoKqrhIA5MW8+s4MOwpm8pNK7X+8BUUJSSX6v9O1oUaNbqkrBsM60m/MLsHcjwJAy6gthLSzboWuQvJtlajROocpisQdBf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:35.7650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d20feed-a21b-4ca5-0542-08dec83aca2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372

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

