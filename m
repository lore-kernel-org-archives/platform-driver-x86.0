Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A0419B3E1
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556175; cv=fail; b=nw9OhNP46bwx+7nK4FXkjHQsvhY3/hHovT+ELHKIwH8nGO1pmXi/snfzpmam66xlv6ZZRxO/I6kg4nFjo6a8rBnrgyD1MmcFbIxxAvVn/cab9AQ9JTQygSDL/QTa77jHlP0ELuMQX7OpgG2uOjfG2KR8ewJbr4s3gBcEtfG6n1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556175; c=relaxed/simple;
	bh=sqSQ8BmiCVUKkD+mrN6oyFuzDzFZaA4q6KNiwcebGUU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XfTnX58JiWBoTn45qofBQ83Ax+qZYzFEq92R+hrltx7nMesDDtNm6tW2AKghvlT+5R6nm2ntLVDySZ1fohx0PuOfvdJf4lRC2s7jLklhLcED4pWuFG4gDIfnyRgO/ECESPSWoNGkDljnu9YYG1AFkVCxyZEwCfeZ+u6rKQLujb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qNUIGOEp; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qNUIGOEp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAVolzWuS2ttpBvkr9NMRIHErTzI7RyYv6I6fdjpxPQLievNawfqysejug2AIoHzvFa/wM/GwDMWJ1rKW4zZ69x6wUDfunxy4uQfUVQeuDb6UVtK3Vd0P+siec8QAM5qcIPqw5pob3hbOIQUlIc8JZizIVWjhqyhfqljyqJZOTrpS8M0v0VMtmZbVUZ6OiXoAltpKn7r1dO7ZWxR4brTs2HjAiZyq9aX26eVJnEV5g4XwLh9qSPYTJQL/yeWsC1eFaRwKSfHTgp6FesoGmDKCNI//ffsj32iUqjyv2NCRqaM7b+LRPg0y9CC5i1i2y6/YRqRK+DrtsFFsG74CIpipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfSg8Oj4ruOtcFxuc7RRv+yaKihpELEPIVZw7GZQCGo=;
 b=ky5oHVMLm9AqoTktJvDQ/29FSVYtYXFLHifRdCcx8V/oGz2H/UkKIOf5FcuPpysKRo1JPFUFkJkIAq1jVKTw9w8pgSYE36IL4k3wzWtwj8IdC2WzGCOfTrcX7Q4CMQPkMRtfYRkhmsEsakIZxijQ0Ki9s3xxrYQZTun7BYOHvrGlfboLOS2huEs9ZRbP/9u8xF62HIqCC3jtpvk5cKSAXao9yTk9M+FyebKC5kyHg4Tk0WMV2vQ6425FvVtLCs3pOs6TDe3B2xzLCkG3gTbZCJ1HseJaJTNkXNajwVQvM1Vy9qXiEesiEKW7z1w0Ef6YdsibHNbPto3YvRlBCzPKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfSg8Oj4ruOtcFxuc7RRv+yaKihpELEPIVZw7GZQCGo=;
 b=qNUIGOEp618WLShCnA0xkDrK4khUX+YNJgUsT5Ewyqpmov1DRK82eEkPybkA6z5oWRSkn7V0e7fqCTqmezo6pkuv6UxHZjGM9Otf6ZIJkJsHzqEC4jeSIlDprQq39n5ZdLYDTZhMqJoT/eLhbfz09EzjB1qdxgnKLme+/SEy0jg=
Received: from BN0PR07CA0029.namprd07.prod.outlook.com (2603:10b6:408:141::11)
 by DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 13:36:10 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::24) by BN0PR07CA0029.outlook.office365.com
 (2603:10b6:408:141::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 13:36:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 13 Aug 2024 13:36:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 08:36:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd/pmf: Update SMU metrics table for 1AH family series
Date: Tue, 13 Aug 2024 19:05:40 +0530
Message-ID: <20240813133540.367384-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240813133540.367384-1-Shyam-sundar.S-k@amd.com>
References: <20240813133540.367384-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: eea1ec93-8c94-4e64-e1c7-08dcbb9ce46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rwgpSk4qnUoFqGmBGrdZleDRBltJpdw5IuATW4U/NhpI4knyGDesDKiupRXw?=
 =?us-ascii?Q?WiPAoIwu6lrLWiqv+64Ig7TlnIIvRXyCiyKxch8QthWcZkqkmvRTVAfSPViq?=
 =?us-ascii?Q?DdooneWsWoVD6hrSbmAtratZPWYBIIC4xaOJWeva67usHC1hjXbRtCLgtks9?=
 =?us-ascii?Q?l06yvfD3l+CavEJTTPYGF8ZxqSSd4iqNKCX64Nm1BraWK8otMEolEES0jhKX?=
 =?us-ascii?Q?MpyDPquIYFZ07MY+sQYOkctiCliCeeX73T5dcMgzSfgs+ZVpZK88xlPS1GX1?=
 =?us-ascii?Q?7yX8q3BmavFhJfdJKg5qlY5v807lN6wzfZN2veq7Q6x/kIRINDpADa/YYc+W?=
 =?us-ascii?Q?Qh/tK/Pe1hEtdygzQ760ClssfhC+4Gw7QSyecU9qUkxy1RmC87TiNwzjJ/qG?=
 =?us-ascii?Q?khDwDMZUSaInL3tGFtj3/Gbc/APhzEe/77Dtjnxzts52jHvMaSxYZAa49QSi?=
 =?us-ascii?Q?SP2noFd7JOz68d8w0M2WMN9MH6mJPHddwzxNgN/WRGwvvYC1FAV+7P3m6dtC?=
 =?us-ascii?Q?SCjBGB9Zoyzc5lJD7opHGnZyggLybU447FWqWBvnY9B2OBRbIGIqrk9IB9nx?=
 =?us-ascii?Q?kZFngJ92jlvEzgrJ2uP+oh/AYxMqcMmJvf3PGTiLwRbxNES2U+6BhzWQf4EQ?=
 =?us-ascii?Q?E3bvR8h2web5TFqjjGoYimbHtrZ6Im/2DsA8l0WsuKn3VIMax5pd0RNRZjK5?=
 =?us-ascii?Q?3a9gJVWwXNKiaHjFioqgHheT7/bJY/1LYAXzR8EJssFcGz4sHD38HYXgEiuT?=
 =?us-ascii?Q?vp+bTewYQyhpPpOQTypb444RBvNDx0wynsQ3RG8O2/DML1KmugSWwg+I4fX0?=
 =?us-ascii?Q?n2MKdzkTmAiiSpXSr3WuFnqhaNhV+3Pv86RJMXdtxcB43LvpDoAdzr82WgoU?=
 =?us-ascii?Q?s7v8W8Iuxht+x/ltRnUQ+Qsh5ZsoTTieHCbQFpc+SVD7qbg4KZn03u7zOAbM?=
 =?us-ascii?Q?C5nWTCallA4GMHdAnS94GoOEkt+eNawkUzfhYcpv1gs8Jo3xR2/QaIFABQRj?=
 =?us-ascii?Q?0ySXW3wj4qlGJ5PNnZrJJ6GSVCx6lrAXoAsRXuoL1emqHzArm4MQUAjN8j4U?=
 =?us-ascii?Q?cesBiGyzHqsNeSDhErGVr8Xxn2SF2UYiCaEeNcJpAKSr5UKp6OUHRMkioAyY?=
 =?us-ascii?Q?JhsBdXhxfO3wkTHf0RUPfewWL3I/Wawd1h5NSU08pHH5T/e5boQh7k1jOPUa?=
 =?us-ascii?Q?Uo1GFnBVJKtzFz6Jgknx5p71qxac/2dcSv2mUPtyT8iedQdUHoJurQ+zaqCK?=
 =?us-ascii?Q?i1xzlbHl2wsDyiv7GUlpJh2hCEQQOsHgvDlI2JCJNj524oyLMFZjYHwW3OSi?=
 =?us-ascii?Q?pimblWnIirWoQzPwTh2LRsczfFoIBURkFbUN4bOrdzFxA9ukP6WOl79+jGff?=
 =?us-ascii?Q?GvzxfLmMQvIVJ6OsC5XLxT8Pnrj6hbBz0kT7mTvIYujN19dk6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 13:36:10.0710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea1ec93-8c94-4e64-e1c7-08dcbb9ce46b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717

The SMU metrics table has been revised for the 1AH family series.
Introduce a new metrics table structure to retrieve comprehensive metrics
information from the PMFW. This information will be utilized by the PMF
driver to adjust system thermals.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3:
 - Address remarks from Ilpo on the helper for C0 residency calculation

v2:
 - Align comments
 - add helper for max and avg calculation of C0 residency

 drivers/platform/x86/amd/pmf/core.c | 14 +++++++-
 drivers/platform/x86/amd/pmf/pmf.h  | 49 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 53 ++++++++++++++++++++---------
 3 files changed, 99 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 88314b0277a3..0ba9045224d9 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -255,7 +255,19 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 
 	/* Get Metrics Table Address */
 	if (alloc_buffer) {
-		dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
+		switch (dev->cpu_id) {
+		case AMD_CPU_ID_PS:
+		case AMD_CPU_ID_RMB:
+			dev->mtable_size = sizeof(dev->m_table);
+			break;
+		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+			dev->mtable_size = sizeof(dev->m_table_v2);
+			break;
+		default:
+			dev_err(dev->dev, "Invalid cpu id: 0x%x", dev->cpu_id);
+		}
+
+		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
 		if (!dev->buf)
 			return -ENOMEM;
 	}
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9fc26f672f12..8ce8816da9c1 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -198,6 +198,53 @@ struct apmf_fan_idx {
 	u32 fan_ctl_idx;
 } __packed;
 
+struct smu_pmf_metrics_v2 {
+	u16 core_frequency[16];		/* MHz */
+	u16 core_power[16];		/* mW */
+	u16 core_temp[16];		/* centi-C */
+	u16 gfx_temp;			/* centi-C */
+	u16 soc_temp;			/* centi-C */
+	u16 stapm_opn_limit;		/* mW */
+	u16 stapm_cur_limit;		/* mW */
+	u16 infra_cpu_maxfreq;		/* MHz */
+	u16 infra_gfx_maxfreq;		/* MHz */
+	u16 skin_temp;			/* centi-C */
+	u16 gfxclk_freq;		/* MHz */
+	u16 fclk_freq;			/* MHz */
+	u16 gfx_activity;		/* GFX busy % [0-100] */
+	u16 socclk_freq;		/* MHz */
+	u16 vclk_freq;			/* MHz */
+	u16 vcn_activity;		/* VCN busy % [0-100] */
+	u16 vpeclk_freq;		/* MHz */
+	u16 ipuclk_freq;		/* MHz */
+	u16 ipu_busy[8];		/* NPU busy % [0-100] */
+	u16 dram_reads;			/* MB/sec */
+	u16 dram_writes;		/* MB/sec */
+	u16 core_c0residency[16];	/* C0 residency % [0-100] */
+	u16 ipu_power;			/* mW */
+	u32 apu_power;			/* mW */
+	u32 gfx_power;			/* mW */
+	u32 dgpu_power;			/* mW */
+	u32 socket_power;		/* mW */
+	u32 all_core_power;		/* mW */
+	u32 filter_alpha_value;		/* time constant [us] */
+	u32 metrics_counter;
+	u16 memclk_freq;		/* MHz */
+	u16 mpipuclk_freq;		/* MHz */
+	u16 ipu_reads;			/* MB/sec */
+	u16 ipu_writes;			/* MB/sec */
+	u32 throttle_residency_prochot;
+	u32 throttle_residency_spl;
+	u32 throttle_residency_fppt;
+	u32 throttle_residency_sppt;
+	u32 throttle_residency_thm_core;
+	u32 throttle_residency_thm_gfx;
+	u32 throttle_residency_thm_soc;
+	u16 psys;
+	u16 spare1;
+	u32 spare[6];
+} __packed;
+
 struct smu_pmf_metrics {
 	u16 gfxclk_freq; /* in MHz */
 	u16 socclk_freq; /* in MHz */
@@ -295,6 +342,7 @@ struct amd_pmf_dev {
 	int hb_interval; /* SBIOS heartbeat interval */
 	struct delayed_work heart_beat;
 	struct smu_pmf_metrics m_table;
+	struct smu_pmf_metrics_v2 m_table_v2;
 	struct delayed_work work_buffer;
 	ktime_t start_time;
 	int socket_power_history[AVG_SAMPLE_SIZE];
@@ -319,6 +367,7 @@ struct amd_pmf_dev {
 	bool smart_pc_enabled;
 	u16 pmf_if_version;
 	struct input_dev *pmf_idev;
+	size_t mtable_size;
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 3c153fb1425e..74a5e325b6c3 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -53,30 +53,51 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
-static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+static void amd_pmf_get_c0_residency(u16 *core_residency, u16 size, struct ta_pmf_enact_table *in)
 {
 	u16 max, avg = 0;
 	int i;
 
-	memset(dev->buf, 0, sizeof(dev->m_table));
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
-	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
-
-	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
-	in->ev_info.skin_temperature = dev->m_table.skin_temp;
-
 	/* Get the avg and max C0 residency of all the cores */
-	max = dev->m_table.avg_core_c0residency[0];
-	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
-		avg += dev->m_table.avg_core_c0residency[i];
-		if (dev->m_table.avg_core_c0residency[i] > max)
-			max = dev->m_table.avg_core_c0residency[i];
+	max = *core_residency;
+	for (i = 0; i < size; i++) {
+		avg += core_residency[i];
+		if (core_residency[i] > max)
+			max = core_residency[i];
 	}
-
-	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
+	avg = DIV_ROUND_CLOSEST(avg, size);
 	in->ev_info.avg_c0residency = avg;
 	in->ev_info.max_c0residency = max;
-	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
+}
+
+static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	u16 size;
+
+	/* Get the updated metrics table data */
+	memset(dev->buf, 0, dev->mtable_size);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_PS:
+		memcpy(&dev->m_table, dev->buf, dev->mtable_size);
+		in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
+		in->ev_info.skin_temperature = dev->m_table.skin_temp;
+		in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
+		size = ARRAY_SIZE(dev->m_table.avg_core_c0residency);
+		amd_pmf_get_c0_residency(dev->m_table.avg_core_c0residency, size, in);
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
+		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
+		in->ev_info.gfx_busy = dev->m_table_v2.gfx_activity;
+		size = ARRAY_SIZE(dev->m_table_v2.core_c0residency);
+		amd_pmf_get_c0_residency(dev->m_table_v2.core_c0residency, size, in);
+		break;
+	default:
+		dev_err(dev->dev, "Unsupported cpuid: 0x%x", dev->cpu_id);
+	}
 }
 
 static const char * const pmf_battery_supply_name[] = {
-- 
2.25.1

