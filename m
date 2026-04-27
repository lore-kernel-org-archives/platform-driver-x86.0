Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E13534EF07;
	Mon, 27 Apr 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305133; cv=fail; b=mnR7pUe79RAswx5k7ugKNvbDcIyBlE4Xe2g0iSvI4RdsBR6+gAeCOctXi3IZuX+y+RKTlK4ve75+k9zsDPoaQ/khf4YNepdMBIkm0wNUgylvvnH/c8P+576gvP0Z9q4nMJd4vPXHII1Fv31hIFNOY/j1NoBnNApEVqsuEhg+/Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305133; c=relaxed/simple;
	bh=toJSGjZWHk0HwteNEA2SjPsAsMRtqCJgJqPapcw/8bw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6wvdmlVOIPKmkGSR07fmX/5B71xJWz3+DUfQLR+kmAxXumaZANV3oqJwNFv0G4CGEPFX9HqB1a2UR01aI+H8K+Im1tGLPGjiwwRzuNfwaCo3eE/HrRraVvjVMh+4BTkmAEMmtzV6sJ99Jv9vjPtFOcd7S59I8VJd2R1O8aPbPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cMuKz3Vk; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cMuKz3Vk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG6J9NeV9O8XoY7S+05NFfquBy3a2eMV/KxnqL9ACNxlTaRVVpgSwAJioFKF3TP2yRGYm/xq2m9lG5AO9K1t7wOFznzU+YT1KmsTuStkI9/G+taiH30NriRgAYGhBlyLkthnXG3goP7HLh5W0xLq0POS6ZPcHpLAVb89TR4OY8rI0mPzNbKF3XD1XLwV/BrM6tWrdTRo3pzSO1yAVcl2w/4E1o3s8fay6uc1MaNOe06TlH7RKQvFdI9kxJ2f2ewH9t20MoEtX2cDOJWhDm6900b+EiOEF72Vqesp1X5P0N96BNjoHwN5dzmyYNGIPTdGNOAFIbOoOaq+KdCaxD8wKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXYj2W6YSYaYZDlzGaPpQY1UPqXTtbtZeCLhIYfTnBg=;
 b=IWIxwQ8t7QxBoVZsj2kaHbEOn+Pj3TSGrAv9bD8dizptQ8xqroYlnmcekCfzu9xeybnU2SVnzbNGOBPLrSlLchOxOfYstHUctkozkrEZzso91nGZisfted4Q4aYn/FiI1NF4yvUdI4CDwhIU3q5Q7Tk4fVynulpUBv9sK8dFu2WNICIUcum0BN4YO1VX5oEFOusYxdSLGIs/A0m3RPMww8tL9oJJqrtKh+JlpAZ4AdOV6Td+WYSRM2y+MJ1uJHKWxEkY523LKAV9Dk1Aa7yGs1v1kVOMwlj/zxzHrZ42HhcuA1KUy9kFScxc0TwF60OTDjxGk9A5zSsDm3XykMQJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXYj2W6YSYaYZDlzGaPpQY1UPqXTtbtZeCLhIYfTnBg=;
 b=cMuKz3Vk8lePPn5vEak1Lc1FmTnekpfMj/cpFeLWt+ym8aJWnDRPiFW4+U+He0GlHBLTZ0qWUQz41Eoe8bpQ2taaX/SfxXxtUd/zLp3fOO/mdYWLHpyiXM1LETTQVwo/ANMUiKx3EBCBcmIy+qJPBbwuOOj71l6lCWMpU5Jyj2c=
Received: from MN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:208:52d::12)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 15:52:00 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::7) by MN0PR04CA0007.outlook.office365.com
 (2603:10b6:208:52d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:51:58 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:51:55 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Muralidhara M K <muralidhara.mk@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v2 2/7] platform/x86/amd/hsmp: Add metrics table support for Family 1Ah Model 50h-5Fh
Date: Mon, 27 Apr 2026 21:21:24 +0530
Message-ID: <20260427155129.545327-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DM6PR12MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f67f54-3e00-43a8-43f2-08dea474ea1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2O4kADK+nzQY/fwDDhfjbtYJIcM3jjqilxm/irgPPI5F/oceYbg2k6J00yDxV3bUxBk6FQ65YVoQsnJ2IEEr6/mqbYp4YfXkbLglfFF6uxTxNUBA0ZAlOVoQoOEfwdO8Pc8QIB1q3XNDSps47IyIGvT1J3ppmQEU2cDb9/BhN9VTa3/WBxhaRXgbSYxE+6Ghe2bqKuzBmKe4cy3VGYU+90VEc14ofzo61fP48Ze6YhpBGIG0Ahngfa2YiAWyE0Ret8Edh74luOWWmLkTSRPZIfT3PfXFO0O8jl7Ron44kWjPm7CtZ9BQQUZkTaWTiD3uMlmNlVoOCHluI4Zs9sATghuLmrJKVatL2OenU1QDAW/2YIsbuY00hSuXHMV4zhxDIUza5MPEGPfgOUD1/eqrdvnmQ8DvEpNCVgg1iUylaVLiYheLUdo2yDE0w10+JUIfJkwoVG+rpjgQekiER1VOYJ0tP3gaFk8OlmurjRfycdi3Dch+2n+u3nTgUSt5NHjAT2dR36dQvvwP9kPWvH5IIycVDL+gO/+QflpUbBUnTI6wmQOiKpR3wmGDws1pt3ERsD9EKkkopBzwJ3GT2ai1OmGt50OS9EUAROnAbbL8NMZyzKbLptPPbOyH2b10Vd17z88ievkdt0EO3oYO6F88oPAiMA5hY0Tb0zAZYjPtePXBkfaPk5YG/AG4AvMETXnm65K/ZqaDafxtW333/ImWVmERVHz3dLGfncMQodt9s233LQ20k5ZRBs3u57gdBLnXMoHuuZriMMnpM0+VxwBBjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UvCF+BlnFBaqwpaUhICrW+8ZQPymAsNpVEiWhJ4AM0X5Dk/PVm/vSEEooM2sGPFf8DVanXBdZ3Tiv90Qha7P+JZaDZZC1nrI7Z/fndU/ltLQ7MBKivO79o4534xX0G0W3mw8g3x2XaUec5aIeYrxkSWu7nu7tigcdqj/VqDKp0CZOqtIY3fxxep8iXRXwK9AZNZrasHE4q8V+erktlWwGaV0YK90g2bXk/YxDfg9K7RR4NCFrTdhP/c4rspAIar6XptBl6xQXQSflQBkZhpSpCJ87MkUOqL/yjqETOcIhqjBlWu6d6JWrAAJuaO6cLLfCSAuecJZsgBXMKAl2FXn4BHeFw11GI/TvTtmz5/ERalvxbNHh4IlD2F4lDtnjtBw7jhGminO8/l9E9ONirlUVgP4u+fr74XWnrz/YeTYvPl4FpTqo+qJu4fdAq8HlbAq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:51:58.3692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f67f54-3e00-43a8-43f2-08dea474ea1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137

Define the UAPI structures hsmp_metric_table_zen6_iod,
hsmp_metric_table_zen6_ccd and the top-level hsmp_metric_table_zen6
to describe the per-IOD and per-CCD metrics layout for AMD Family 1Ah
Model 50h-5Fh processors (HSMP protocol version 7).  These structures
allow userspace tools to interpret the raw metric table binary exposed
via sysfs.

Widen the ACPI driver protocol version checks from
== HSMP_PROTO_VER6 to >= HSMP_PROTO_VER6 so the metric table
sysfs binary attribute is also created for protocol version 7 and
future versions.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes v1->v2:
Split the change

 arch/x86/include/uapi/asm/amd_hsmp.h | 88 ++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |  4 +-
 2 files changed, 90 insertions(+), 2 deletions(-)

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
 
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..8044df862275 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -244,7 +244,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 const struct bin_attribute *battr, int id)
 {
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -491,7 +491,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

