Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB494206A
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539679; cv=fail; b=YUxXWqz/NKtxgOqn8AsI0Zjh86W2kLapfwwSFvNKPLMcOl1fpO+jUX+octY3Y4EKg1HLNjZYMqv0Uafuj6EOIVhgzGbKXyu1FaQk5CEgu4vU5aDQwGFM+XRaUy+S1n8ZyzUsqk6mNUgW4nPedyogQNFuELV++S88WFc3DmQ/yNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539679; c=relaxed/simple;
	bh=CqIThv87zKlCuRkmiZispJoG/EYtosIKtp6u2R6PxzQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/ALy2cjbRpIw7wa/thIn+51FcvfXo40W7lyKWeW/OxZOffRE1B+F1a0ornklZp5xkFYnlF+06I9/S0HpEE3kG9xskP6/vAg3k2B8oDrARVyLb9A+OOwFl1kNwxjk73bfCJCoALXBl9f65XM50ucV2q++LXs/hkxV2VRXi1BFN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0paTubKJ; arc=fail smtp.client-ip=40.107.244.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0paTubKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8OrtkKkboC8QwHDL4nvtkHiSpNVXqAMTrzux7lg3orPzrnqwrBUj7ohPrMFhPiGrioqUyOVTmBUpXZ5Tc5Zk8q7gOAVkryTU6wd3KfQJG1X6WJsY6ETIdF7ZB13lDGqQFsUU56tn4IQIu8y0IoCxQx3msyyD5CjJsRIFigkxV6T1N+/we2WIGJFORGoZ+rinikda876s31BYzk+aDpcpKpH77yHYheKXPc2/wJyfl6MrJbDXJx2/WR8ophoOA8l93OJ0M7lAG/oUckDWLwBvjtT4pU2aPFTt8pd1Yw7OOpvAyBOo9zZFoGJjrFAO/2WgCyr0qbkYjR75lPjq7NXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x/xZbDO47zcTshUueCKifsFcBl++QzAKBs5fTtfm/I=;
 b=IQnVlrNNcBSr4gsYQ+5S/PB9YQbQmg18FdoVIUWhrNMDL+xwCmV5diehEX5pJ6v4KIPl55bU1FNK+mVEppZQKLGIvHYr/9t6XG/6JQVKrBNaS6LNxxwSHCT4WmPrFO3xXz+oOCsHGhI1UtPY4B6NviRqnuWiGZ0l9HHcoiPoaV/oGNVEfGtKQm/n3wZILiaG5zAS2qYHXOniTcu3la2tg8w4xbw6ozB2he8TIF0ywLpGwATXkscYGHV3nWZ18oqRsXOBw9DeWbl81R1HnNEdl8TQWn6mWMI5JKfrg49dUC9AsbU60tFG0HrrsSCDiI0R00BODCAkwMHfmNUh+x3I/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x/xZbDO47zcTshUueCKifsFcBl++QzAKBs5fTtfm/I=;
 b=0paTubKJKqZysw8dqo6pXNRz8vUTD7CDSl/E/sX4tZsIMG7LM8pwEQzxFdDaQfb59XBl1bDAHlyqoB6ZiLSCzdncLEsPu21e3FtCKh4Fr1RKOT87GHrmrrBokgr+vSKSeP7SVEPchB907N0PRV2UxXXKXnTrEiGt/mITdFj2iBc=
Received: from PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::28)
 by MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:01:15 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::cd) by PH7P221CA0009.outlook.office365.com
 (2603:10b6:510:32a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 09:01:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 09:01:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 04:01:13 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Update SMU metrics table for 1AH family series
Date: Tue, 13 Aug 2024 14:30:40 +0530
Message-ID: <20240813090040.364504-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240813090040.364504-1-Shyam-sundar.S-k@amd.com>
References: <20240813090040.364504-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|MW6PR12MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b2f692-8df5-45e2-77d0-08dcbb767cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RQfujX5Jos1GSIixEhDzLrDykpbV8Up8/phMfuaLXrnW6G+meC/g6FEubfOa?=
 =?us-ascii?Q?SyK+zhPvB+ElyN5JyRKzbbdm6mc7Rp+vKSTTSeJX3455yqmK1TyimUAu59lW?=
 =?us-ascii?Q?a8IxGUdQfKp0Z9soW2+juGnuGl2GtZIwS8P/iTaTyPUW/NkP8qTeDximAhAa?=
 =?us-ascii?Q?IHjMNyumXFw9flJA8QwZ9woJfBrWyPCRi+TIMVMWg/5RRGah+PWrXWGJZp3l?=
 =?us-ascii?Q?xtmX9+imcpGfAymf5T81dhPgm6ISTsD9MdfiYEZ8Qt2hh+LkRXzTBQ0k8cyZ?=
 =?us-ascii?Q?wfLRpUa0rr0QohY5D1GNE3O01Xpy2YT1Q6GMYZLOUMdwDcetPtVcWUcmF0fS?=
 =?us-ascii?Q?3BKQHkp5W/KxEOSnaMFedlf/rrtp57Eh0gtLXFneNQ85gB8wZCqSQCcjevc2?=
 =?us-ascii?Q?KZsHesHyZYITXkIzkdrmycTZ7tpEqEowBojtnxT0T99vRP/VuwBo0AFW9BtZ?=
 =?us-ascii?Q?uBOqo9iK5PnQzbVY7B3fyQE+5Xi1SnSRuKLbXaz0FO25x32xF6nyH8YEzKss?=
 =?us-ascii?Q?+uCuMF7XBlsQSlth28XQrKp0qYC0YbDtVpnQndWnTWesI15vg7uyEYl49EzO?=
 =?us-ascii?Q?6yK3jT2P8LS6/CZInsKZ7pFGeTiTKo9V4ogv2/odi9fScO1cNLO+ohL8y1FI?=
 =?us-ascii?Q?zqnXVUkrBhC6GH/gqUKgs+mHkRYr92EVYdj19/cZtV8uQLKofdHZd2MJrTVj?=
 =?us-ascii?Q?LLCDsuRciaNgpQ3zBlJumIHEONuCi/HT+6FecLew08Xt6igzGpxR7Jhh8+x3?=
 =?us-ascii?Q?Wce9Efq5ovOiS67xqcX9uAvzWC9OEqIRS/80+wecBjaW6OIu7h47Z2O1Y8FK?=
 =?us-ascii?Q?CurM+WcsHCCOogikqbaI/TCt0r+C7O75wkFO00SwnJUi9yZnYybqzW33h4c/?=
 =?us-ascii?Q?YBJQDzSuh6YBQqG15tPddBH6VDArF41YBOvobEMaU6xCOqMHE+9A7bdfs8UU?=
 =?us-ascii?Q?GX9aHPDyVmNmno3s/2uUZjakoR9h21nusKdbpeW3kLNslTVBST+Lr+81WdwT?=
 =?us-ascii?Q?bG15JGCkjQnKKcLWKILhwe4FWsolzZoB3VrNjskfmYvTRyMmLRuCvDB2TMng?=
 =?us-ascii?Q?Q0PsFcfaQyXGLLKKyhaFKr3QVsu5jYb+wNv9g1lVKJl/49ZTXHjIyLZ2KN9K?=
 =?us-ascii?Q?/eqhp1D4E09OHfR0PW5gbQW/TVe3KGDTQ0zkoBkl3tSgYrgrWLVg0OKe9/O9?=
 =?us-ascii?Q?SUYy6B4MVZlwxT1Qh/AiPOZYXqiRtHnFjd+vnMlrrNYa6Ps4co9hCk4056ux?=
 =?us-ascii?Q?A6l7ebdXE/EuovQK5Tx10rHkSARRBGZNs4duNDnXBTdxY4j6iuTB2y4WolRg?=
 =?us-ascii?Q?j9WsbJ8xjhOCtH6znCM2fpawb1xhKbZVJl5vhvpXeUyVYOPCm7xsbETrB4R8?=
 =?us-ascii?Q?a5xs266Jce5rXnJC9q1IZ2a6+CRS+vXsV30lgwFw0920GmJ+YDDFkskjNt3J?=
 =?us-ascii?Q?gpUMvnpWdj5spJtLMvZCEXdKPYgGRSGC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:01:15.2157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b2f692-8df5-45e2-77d0-08dcbb767cbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019

The SMU metrics table has been revised for the 1AH family series.
Introduce a new metrics table structure to retrieve comprehensive metrics
information from the PMFW. This information will be utilized by the PMF
driver to adjust system thermals.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Align comments
 - add helper for max and avg calculation of C0 residency

 drivers/platform/x86/amd/pmf/core.c | 14 ++++++-
 drivers/platform/x86/amd/pmf/pmf.h  | 49 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 61 ++++++++++++++++++++++-------
 3 files changed, 108 insertions(+), 16 deletions(-)

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
index 3c153fb1425e..910ba7925f13 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -53,30 +53,61 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
-static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+static void amd_pmf_get_c0_residency(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
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
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_PS:
+		max = dev->m_table.avg_core_c0residency[0];
+		for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
+			avg += dev->m_table.avg_core_c0residency[i];
+			if (dev->m_table.avg_core_c0residency[i] > max)
+				max = dev->m_table.avg_core_c0residency[i];
+		}
+		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		max = dev->m_table_v2.core_c0residency[0];
+		for (i = 0; i < ARRAY_SIZE(dev->m_table_v2.core_c0residency); i++) {
+			avg += dev->m_table_v2.core_c0residency[i];
+			if (dev->m_table_v2.core_c0residency[i] > max)
+				max = dev->m_table_v2.core_c0residency[i];
+		}
+		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table_v2.core_c0residency));
+		break;
 	}
 
-	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
 	in->ev_info.avg_c0residency = avg;
 	in->ev_info.max_c0residency = max;
-	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
+}
+
+static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
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
+		amd_pmf_get_c0_residency(dev, in);
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
+		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
+		in->ev_info.gfx_busy = dev->m_table_v2.gfx_activity;
+		amd_pmf_get_c0_residency(dev, in);
+		break;
+	default:
+		dev_err(dev->dev, "Unsupported cpuid: 0x%x", dev->cpu_id);
+	}
 }
 
 static const char * const pmf_battery_supply_name[] = {
-- 
2.25.1

