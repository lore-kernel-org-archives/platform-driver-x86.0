Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B148237B018;
	Thu,  5 Mar 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707881; cv=fail; b=HNv6wv7P8ucKChxv4uEL4xCVTySaaIy23kMmjT1hMn0+MFT3Y3AaeEE7W9HkJw2XfIE+NxPvwny2MCJM305LQgpQOIpqdOS7QMHy+7EOAsJHj3ttc2pnRzSei2P9m7UGjbz2gG+KoqncL2vIhLge224ugA96c87UIjQIEY85nFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707881; c=relaxed/simple;
	bh=LBzHM6ZRFKrYdcQEjfoh0MaGmAifFpeI74m0axqWoXk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h24uRXzcS/5Sf1CEd/gkxB7dzJT/yEOy15s0qKHwwHGrjHyjDmYSjKXxfHhz1p1q7aVMW6qyIUodqfwxcEJDV75RTUFwJt0oBuh00y4r2LfKA5IzMVR3LT+1TSN6HTOyz7ldROVd6W8j30Mn5LQCrmcTtM986rrMpALeRrmQm34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fPJLmV7n; arc=fail smtp.client-ip=52.101.85.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fPJLmV7n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XREu/StHGDl+xX96enQY17XNPt+Fhy14dpJ7QKFRBTW78qNm5zXN9NyJFeb0zHnxovVG9YtOR3fbU+vL9Qr6vPHJIK9OlWWK5mFVpTh811JjIcUpk3re+UREWPLYUbHJQbyDr0fd6fkId8dpvJiXaBdumJhZ7vz+Q1damoeCW4hdwF2ZpyM2P2HuaXv7EW2bKZ04hG1kSjs3sTJvmhg5EqAaqiuyGRi7WnbZAS22hDcNAzAHlUch6xJomHWXLZ8S5hiPMzS2ssqF0Y5cJeSj8U5LODQ2ueHOoNmkBdHhrgZIRm+/EUqoVKgXFs1jk30p3DQ4PB6yrUnhbRXbAd8DJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wbt/PCrxVEVPa2/r7lRieN9zxz9CpkGXfMBGIWDQ59o=;
 b=j2h1+5iOwCu2wui47sqW7w/2yY0Iv7AzapSV4AGuIawBFJUmMAcCVhrgcro4S52faOtUwjcYlWiHT2F8Y188JGMuulG+4QbRrbTk/3bL86TDTc03L4sudOvT3MGNFQE3WsH7Ti2Vz6785LZXfNKYjhXaN6m3Um4mCKbskrmOpetJZ1TkCyc1dABBSjSJkBsdQFrh4en0g4OtIeDgRHOQ1QvU7F4CIy6e4tOJkj+RGZPlCcRcSCddkhS+aMK5UYXM+wyXKuFac7SAuuKSTPwXeuR9vudWXvzmENXNsYsUl2gqYiSfHNfY+M55rTRlkdPNXQqU9oS8pNIhi1F91ESZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wbt/PCrxVEVPa2/r7lRieN9zxz9CpkGXfMBGIWDQ59o=;
 b=fPJLmV7nD0tgHqt6WdpExDg+fCZEX5gacaCGlETvPbR0qOP3y6bcLpYZ9DexFBxKL6yFmEpD9zezSgftF4tahsqEyQ0v8pulENw2UX1TS6s3kFK/GXMavgLIvcf531pbs+rtkstqBLAbqDPl8tHd5AVGJgGQpqtDbMeWcNv+zEQ=
Received: from SJ0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:33a::33)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:51:15 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::f8) by SJ0PR03CA0028.outlook.office365.com
 (2603:10b6:a03:33a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 10:50:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 10:51:14 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 04:51:12 -0600
From: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>,
	<platform-driver-x86@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralimk@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/hsmp: Add support for variable-sized metrics tables
Date: Thu, 5 Mar 2026 16:20:50 +0530
Message-ID: <20260305105050.2940904-3-muthusamy.ramalingam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com>
References: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c147759-dc7b-479c-5aea-08de7aa51f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info:
	ONkoG9q2Sshyx8e7Jmb9UsPB1a1l9AqfpwzQL1XzL1DhNJnnBD7DU6vWKsyTDhfiev8Zw8myOpG1LXSv0TPQoRFF9OzOZ2hKy84yCodU/dZ7xtemkGbLvFwBeaJ8RUaYJdu20f9kiWcyIdO88AcHfyLzO84c0Qkse9ALjRQOD8NhN8QaVxrfpCyyi5hisrUTGkMhQQrHfuhVaRHMDIcn16sSoKILbCDRmqbSJqlXrfBWAaT9IfjR4BqK1P2O2erAiH+ALXziCXoASzEbQprn2CjoBEdtgi/a3x3v9yYY21jsl0uULHmYq3hKW8MmptzpOHpX0Qz0DAW1rFIXO8zIArYcZE24XcO7rkkh8MnapBlBw+GfgMpj9RqWIhAGhH65wmzgjSkh2+dLLLI9KOfTy5opN0hjXY2xSOlC/lpmyD0zg3ybWEXMzDyAlp4kBtZo6Hnz7bwixwiGc4Wt4g62A1pv+jRL6Z/B+HQSsUxeQaKR4OEX4LkiSe+LY8xrDpGrZik2/JJy+YcLtOZHpjkeZLXVZgFLP2PdzfGnjt67WGW8XwC5PcMzrd09ZCmHzhQNPbu84a2htVKb5YJWbaHyxY+9Lx5ampTDbO+IqeaYDyfVH/AxKGO+L5see38ORZWxTEuGODajdVMo6+ju4muCcfAgSqB5tDUKaPxp0fqfkpe6P7NDhVjPJMa1O0+HuoZ4PYILOfAzQiNMAcyFuCheEZiUqAwxEcuWDOlzOc7QkfE35Dkl8akqQbQ+zJ2MYZLWWBRt2x8t23VgP6KoPpDHMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mJPi2mEhdR8RJ+1cTSt3RrE7S7kkSPf67NdRaP/uNhIvDcyNcbQKN9FTQYLe1nGDG+Xw74Rb566tEo9reQza+Vfp044rQupW0IV3Az0uWWxuPDlJoRT17pLwxvVbvxbwAnaY3TmD/L9mAmwb0KpRh6b8f2V8PBkUzpDoNQpUkAOkQX5wuXn4BPf64SfPQjmgUg1oEVwKp9P4aRu65d14oZKu4ibP66jLEIOWFFlmwAr02d7NwnBsKlphOHLjQ7OEXEIfBHIanCJAm8O36WB72sTJgTTJ7kbzhlktgy3zYsAaTTN1CNE/osj/sNWvxXK38kWYRB9wVbasoCYFwBQhxlwTVMy7KbLZLooaiMm10VC1m6u/ybI45UvoC2TRFrwBp3dWolDphkJ0tqZe4xyKz2fCCRXu8sp+RrDeWnDihNqnhz/zK8ZD97OKpNBIsdTT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:51:14.9865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c147759-dc7b-479c-5aea-08de7aa51f8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344

Add support for the new metrics table format introduced in AMD Family 1Ah
Model 50h-5Fh processors with HSMP protocol version 7.

Use CPU family/model and protocol versions to map respective variable-sized
metric table configurations.
The exported hsmp_metric_tbl_read() function provides offset support for
variable-sized tables.

Co-developed-by: Muralidhara M K <muralimk@amd.com>
Signed-off-by: Muralidhara M K <muralimk@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 86 ++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |  9 +--
 drivers/platform/x86/amd/hsmp/hsmp.c | 83 ++++++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.h |  3 +-
 drivers/platform/x86/amd/hsmp/plat.c |  3 +-
 5 files changed, 164 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 603d62f8d4da..1daa7c5352f3 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -575,6 +575,92 @@ struct hsmp_metric_table {
 	__u32 gfxclk_frequency[8];
 };
 
+#define F1A_M50_M5F_MAX_CORES_PER_CCD_32	32
+#define F1A_M50_M5F_MAX_FREQ_TABLE_SIZE		4
+#define F1A_M50_M5F_MAX_XGMI			8
+#define F1A_M50_M5F_MAX_PCIE			8
+#define F1A_M50_M5F_MAX_CCD			8
+
+/* Metrics table (supported only with proto version 7) */
+struct hsmp_metric_table_f1a_m50_5f_iod {
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
+struct hsmp_metric_table_f1a_m50_5f_ccd {
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
+ * Future processors within the same family and model may support a
+ * variable number of CCDs and cores
+ */
+struct hsmp_metric_table_f1a_m50_5f {
+	struct hsmp_metric_table_f1a_m50_5f_iod	iod;
+	struct hsmp_metric_table_f1a_m50_5f_ccd	ccd[F1A_M50_M5F_MAX_CCD];
+};
+
 /* Reset to default packing */
 #pragma pack()
 
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..c91b694bd394 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -238,13 +238,14 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct hsmp_socket *sock = dev_get_drvdata(dev);
 
-	return hsmp_metric_tbl_read(sock, buf, count);
+	return hsmp_metric_tbl_read(sock, buf, count, off);
 }
 
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 const struct bin_attribute *battr, int id)
 {
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6 ||
+	    hsmp_pdev->proto_ver == HSMP_PROTO_VER7)
 		return battr->attr.mode;
 
 	return 0;
@@ -491,7 +492,8 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6 ||
+	    hsmp_pdev->proto_ver == HSMP_PROTO_VER7) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
@@ -509,7 +511,6 @@ static int init_acpi(struct device *dev)
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
 	.read = hsmp_metric_tbl_acpi_read,
-	.size = sizeof(struct hsmp_metric_table),
 };
 
 static const struct bin_attribute *hsmp_attr_list[] = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 19f82c1d3090..55b941f8a819 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -348,9 +348,22 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
+/**
+ * hsmp_metric_tbl_read - Read metric table
+ *
+ * This function maintains ABI compatibility for external consumers.
+ * It reads from offset 0, which works for all metrics table formats.
+ * External modules using this function will continue to work without
+ * modification.
+ *
+ * Return: number of bytes read or negative error code
+ */
+
+ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf,
+			     size_t size, loff_t off)
 {
 	struct hsmp_message msg = { 0 };
+	size_t var_size, remaining;
 	int ret;
 
 	if (!sock || !buf)
@@ -361,29 +374,37 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 		return -ENOMEM;
 	}
 
-	/* Do not support lseek(), also don't allow more than the size of metric table */
-	if (size != sizeof(struct hsmp_metric_table)) {
-		dev_err(sock->dev, "Wrong buffer size\n");
+	if (off < 0 || off > hsmp_pdev.hsmp_table_size) {
+		dev_err(sock->dev, "Invalid offset\n");
 		return -EINVAL;
 	}
 
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
-	msg.sock_ind	= sock->sock_ind;
+	/* Compute remaining bytes using explicit cast to avoid signed/unsigned mixing */
+	remaining = hsmp_pdev.hsmp_table_size - (size_t)off;
+	var_size = min_t(size_t, size, remaining);
+	if (off == 0) {
+		msg.msg_id	= HSMP_GET_METRIC_TABLE;
+		msg.sock_ind	= sock->sock_ind;
 
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-	memcpy_fromio(buf, sock->metric_tbl_addr, size);
+		ret = hsmp_send_message(&msg);
+		if (ret) {
+			dev_err(sock->dev, "Failed to send HSMP_GET_METRIC_TABLE, ret: %d\n", ret);
+			return ret;
+		}
+	}
+	memcpy_fromio(buf, (u8 __iomem *)sock->metric_tbl_addr + off, var_size);
 
-	return size;
+	return var_size;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
 int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+	struct hsmp_message msg_tbl_ver = { 0 };
 	struct hsmp_message msg = { 0 };
 	phys_addr_t dram_addr;
+	u32 table_ver;
 	int ret;
 
 	msg.sock_ind	= sock_ind;
@@ -403,8 +424,44 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
-	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
-					     sizeof(struct hsmp_metric_table));
+
+	/* Get metric table version */
+	msg_tbl_ver.sock_ind    = sock_ind;
+	msg_tbl_ver.response_sz = hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_VER].response_sz;
+	msg_tbl_ver.msg_id      = HSMP_GET_METRIC_TABLE_VER;
+
+	ret = hsmp_send_message(&msg_tbl_ver);
+	if (ret)
+		return ret;
+
+	table_ver = msg_tbl_ver.args[0];
+
+	hsmp_pdev.hsmp_table_size = 0;
+	/* Determine metric table size based on CPU family/model and table version */
+	switch (boot_cpu_data.x86) {
+	case 0x1A:
+		if (boot_cpu_data.x86_model >= 0x50 &&
+		    boot_cpu_data.x86_model <= 0x5F &&
+		    table_ver == 0x00700000) {
+			hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table_f1a_m50_5f);
+		}
+		break;
+	case 0x19:
+		if (boot_cpu_data.x86_model >= 0x90 &&
+		    boot_cpu_data.x86_model <= 0x9F) {
+			hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
+		}
+		break;
+	}
+
+	if (!hsmp_pdev.hsmp_table_size) {
+		dev_err(sock->dev,
+			"Metric table not supported for F%02Xh_M%02Xh (table version: 0x%08X)\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model, table_ver);
+		return -EOPNOTSUPP;
+	}
+
+	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr, hsmp_pdev.hsmp_table_size);
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b153527e0a0d..a887eaa061e4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,6 +55,7 @@ struct hsmp_plat_device {
 	u32 proto_ver;
 	u16 num_sockets;
 	bool is_probed;
+	size_t hsmp_table_size;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
@@ -63,7 +64,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
-ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size, loff_t off);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e07f68575055..9e37502defb2 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -59,7 +59,7 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj
 
 	sock = &hsmp_pdev->sock[sock_ind];
 
-	return hsmp_metric_tbl_read(sock, buf, count);
+	return hsmp_metric_tbl_read(sock, buf, count, off);
 }
 
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
@@ -94,7 +94,6 @@ static const struct bin_attribute attr##index = {			\
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
 	.private = (void *)index,					\
 	.read = hsmp_metric_tbl_plat_read,				\
-	.size = sizeof(struct hsmp_metric_table),			\
 };									\
 static const struct bin_attribute _list[] = {				\
 	&attr##index,							\
-- 
2.34.1

