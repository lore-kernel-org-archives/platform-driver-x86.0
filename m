Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266417D378
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723471833; cv=fail; b=cRDsFu7ZP53a6uvg2CP6N+usE1HxvMA4Zg6gx4CunCEy/VcqRMEppdDhB2kDBTxaNFum+bAvErQmW9MvIpJ22OkLsjcs+Ckr6S3VieG2TgBEHfxCXdTudkDJ4PxDJV+7kIBov6cznR60VUUH75wSLTkAXmLo3I8DfTJOjQ28N4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723471833; c=relaxed/simple;
	bh=BvLOenLm4rWqNTY5HysOu7P4WYowNNyL1VbobhPMsQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8uF6idI7OHBbywsUbn/fx6sEyX2KNKG9WLB0HVli8PXuiqG+OaLzq/bXAS1GeFQ/UsL0eD5VO2qFprsHCWEwjIgQBvUBo84oeef0HOaNJucwrhBYxyUIIHL5pUvosmlV7zkzuAUZ1Ygp1OaZngAC9zed3S12rPhlC5y87Ws2OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K9ZmkzUU; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K9ZmkzUU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLl309nwJu8IFZ9FySeqwjSRKVLwgxHOgoMmUPt5AIsRKl0tEMhOB5A01P/mBvq/XecjSezRDspLGqk1C5HvQhvo1U50BZhQy44/xItZuR64m1XWOsFwzub6xf2XPPWA9cnFqY/2rY3eSOtE4GgildULidclolEkRgTa8MzhKonxw1DcjWDGpYavMFMkhOJsQx5aX7lLDp4e5dHZW7E7QgM8sFO8cRhG5b6ho6pb6eMoSA7tX5TXtHrSF8dshOGYb6PBPx0jd5V0Jo/xdR0LX9YsUN0zX6328ifR/OsgXB4r31WvFIm61qXynX9pbN4nPbPJdtpFKfoUD2qkMk3KsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYqnl7uxVIF2NeyxKHYfCqjEoSprNxgfoU5BtyRSKc4=;
 b=DBIP8iNcvZ+cQW7+QSYybBoz8w05Y5VhmU7Go1pMC5FO6/3MBHvi7iHW8ix6j2zQ3Xms9rakSWSW7v9bhzWWNgl4HlR0lwipxqSS+eLO1HOab3f9xw0f0dqt1nnoLktG/NbRtD1HPFFmV6QIh3ze9opc6kFoFZDu2NzLOM9tsPllFuECatoBreMsm9qZHGkf21bUT8yw9T08YQoc82w3uCiivRnsa/r/eyzxqTSll4pSvUrfpK+COCkBK+GrCjDEG/X4YOGUVY7q6jfz8CKaAQjCGRVAyfxTdT55P2j4mjL7jipFb+s1cW7PsfENtnpSBQDNKiCk2SQxteLSAE7aAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYqnl7uxVIF2NeyxKHYfCqjEoSprNxgfoU5BtyRSKc4=;
 b=K9ZmkzUUJ8bEgI7SslrSsi0VNYzfIjCOjhJcjmofnTfa2evFZvV01SL78LNpzKWplBWlllVDkZtEpdTqrq4cLRgAE5dqHx4s4xxq75nU1CF4DFgwhSaN2Jk2UESzAiQNHEg7VVK7Bisl9CxLsETLOOuBkkL3sYSwXk068/LLD+E=
Received: from SA0PR11CA0205.namprd11.prod.outlook.com (2603:10b6:806:1bc::30)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 12 Aug
 2024 14:10:27 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:1bc:cafe::98) by SA0PR11CA0205.outlook.office365.com
 (2603:10b6:806:1bc::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Mon, 12 Aug 2024 14:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 12 Aug 2024 14:10:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 09:10:23 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmf: Update SMU metrics table for 1AH family series
Date: Mon, 12 Aug 2024 19:39:51 +0530
Message-ID: <20240812140951.310550-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812140951.310550-1-Shyam-sundar.S-k@amd.com>
References: <20240812140951.310550-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: 951bfd34-3dab-4505-3152-08dcbad883e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lh9vjDhOiVwTTOFjQd6zeZKPw7wxWovuQR0UPzj+nOKNwoCO5BnszRo+1kl1?=
 =?us-ascii?Q?vH7DFe115tsVozDIToo41Hh6VNnj7bzkekb0gTO1RDDdv8a1nMJd6OGHi+fA?=
 =?us-ascii?Q?FHK+h0t/cUcTk4sK6hcfycoxPg+rzzNUpe+yuEkNk2QzHVP1wZrqQTfqUA69?=
 =?us-ascii?Q?g/8/ksR2v2cE2zCwWVtMmGmV2jFunvOgR1+OjYs+7b47Jn2X+NlB3HRm0Njk?=
 =?us-ascii?Q?xWq88LbZWJ8ND1WQPfm5EjgoR5Pv9SFEchZibtg387d9wsi3Z2zVDJ2u3IOK?=
 =?us-ascii?Q?EBfBx1c111kiIa5NVUj2B4Iuh3gC6FS/I7RHGCGx/FipVlsY6Q1HWnBVM7Ku?=
 =?us-ascii?Q?GECKihBJFDpbSCHnhsV4Epim/yF+CoPULsB57jUP+hsfJccJwhd72VGIbwGP?=
 =?us-ascii?Q?BaARqcl4mGKhoNJy3zcOhkgSwvI4wuMUxm1lgv6w5Lu4yn9NlYAMfwJtQib/?=
 =?us-ascii?Q?OGaZ1iN4TQUXWGDa5QxzE/kNndm+s9A8jV3hN8Ia5icOdRWNxiA/hFpRW1M3?=
 =?us-ascii?Q?yCX/2WuNyjvRaFfSzXKF1UTjE1lU8ogP/b8/dFoZ/Q6QtX3PSkYQ4b7dGcwS?=
 =?us-ascii?Q?4RvN7hIv1TPMUuEhnMCWyTH8QrCmeeh5/mZZRwPISrU3LoBU6Enwz7WwWKHA?=
 =?us-ascii?Q?7FmYFibKhCV6rJJTvfXb3GsU/1bFI0a65sVQk+KXA9kDP1NgNyP4K4bckmwI?=
 =?us-ascii?Q?yiLXKM+C26tWf4nYXyz9zCssNIzCBSqxGQ8caXH50c+g7LoVv/oHAOoGZzZY?=
 =?us-ascii?Q?rAvgI+DNsS30O/jnoQqoqO5MtBmTYzXDZA6Re00QhYQ/ScYdwu/ZbAL6HljW?=
 =?us-ascii?Q?g/Q5IgNtmn4Upn15uFatLASpatnVklnaAXPi8AmkwDjn9Soq8Lr2z/akjPPu?=
 =?us-ascii?Q?0UnT2uk7rUP+u3eE2XZVEv2tEITaswaZkdo2vyrK5fw3nQbhMpBKVBitedQ+?=
 =?us-ascii?Q?UI4un5+++eBa2eEsVgJ+SDx8QsVnNf/euW8rxLhrzVdv8xo44aU5F3PvC7s3?=
 =?us-ascii?Q?toZAT+8H1Z7nth18ZGMP4fvzo/GTdvmNOzoyQLLiGEiI7nOvFDYdXb6R5mTH?=
 =?us-ascii?Q?W4ARgHsBAaMwf3coid1BW2a2Mosov2oJymjBEFwVfdtjbh9woVVFJycPooBW?=
 =?us-ascii?Q?GBJdOFroJZH8gpK+kh7h7AeY71WAVUrSPpaJpSq+ivyYIQqMTSW2Z1MRykaf?=
 =?us-ascii?Q?K+dDvE73SzfPwMU8K2/aHPcduiqSIBJzIPx7trW/8eXszSNLTB07tBbYrX5G?=
 =?us-ascii?Q?3rx5zFS1FZhl3vutMWIb7e4yAmwMo+xHwf8IAVC5d/FKDuGj1phVP5JuMng3?=
 =?us-ascii?Q?uFrW7az/jiFkKbyLZEd1DzQOCSsDSDSkUigGebQzKP0Jqp8DkoAn7bSfEIZU?=
 =?us-ascii?Q?TbuhHgCJgFWqmBCk/AzNtJUphxtQDzLlGjftGdHphu0eij6DXVDyqyQYbnyq?=
 =?us-ascii?Q?NfY67ZI/SEXMZsyz74lPY/WZWy/380CG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:10:26.7524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951bfd34-3dab-4505-3152-08dcbad883e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084

The SMU metrics table has been revised for the 1AH family series.
Introduce a new metrics table structure to retrieve comprehensive metrics
information from the PMFW. This information will be utilized by the PMF
driver to adjust system thermals.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 14 ++++++++-
 drivers/platform/x86/amd/pmf/pmf.h  | 49 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 47 +++++++++++++++++++--------
 3 files changed, 96 insertions(+), 14 deletions(-)

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
index 9fc26f672f12..7e2035ed3c8e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -198,6 +198,53 @@ struct apmf_fan_idx {
 	u32 fan_ctl_idx;
 } __packed;
 
+struct smu_pmf_metrics_v2 {
+	u16 core_frequency[16]; /* MHz */
+	u16 core_power[16]; /* mW */
+	u16 core_temp[16]; /* centi-C */
+	u16 gfx_temp; /* centi-C */
+	u16 soc_temp; /* centi-C */
+	u16 stapm_opn_limit; /* mW */
+	u16 stapm_cur_limit; /* mW */
+	u16 infra_cpu_maxfreq; /* MHz */
+	u16 infra_gfx_maxfreq; /* MHz */
+	u16 skin_temp; /* centi-C */
+	u16 gfxclk_freq; /* MHz */
+	u16 fclk_freq; /* MHz */
+	u16 gfx_activity; /* GFX busy % [0-100] */
+	u16 socclk_freq; /* MHz */
+	u16 vclk_freq; /* MHz */
+	u16 vcn_activity; /* VCN busy % [0-100] */
+	u16 vpeclk_freq; /* MHz */
+	u16 ipuclk_freq; /* MHz */
+	u16 ipu_busy[8]; /* NPU busy % [0-100] */
+	u16 dram_reads; /* MB/sec */
+	u16 dram_writes; /* MB/sec */
+	u16 core_c0residency[16]; /* C0 residency % [0-100] */
+	u16 ipu_power; /* mW */
+	u32 apu_power; /* mW */
+	u32 gfx_power; /* mW */
+	u32 dgpu_power; /* mW */
+	u32 socket_power; /* mW */
+	u32 all_core_power; /* mW */
+	u32 filter_alpha_value; /* time constant [us] */
+	u32 metrics_counter;
+	u16 memclk_freq; /* MHz */
+	u16 mpipuclk_freq; /* MHz */
+	u16 ipu_reads; /* MB/sec */
+	u16 ipu_writes; /* MB/sec */
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
index 3c153fb1425e..3173f6b6d6f0 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -58,25 +58,46 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 	u16 max, avg = 0;
 	int i;
 
-	memset(dev->buf, 0, sizeof(dev->m_table));
+	memset(dev->buf, 0, dev->mtable_size);
 	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
-	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
 
-	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
-	in->ev_info.skin_temperature = dev->m_table.skin_temp;
-
-	/* Get the avg and max C0 residency of all the cores */
-	max = dev->m_table.avg_core_c0residency[0];
-	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
-		avg += dev->m_table.avg_core_c0residency[i];
-		if (dev->m_table.avg_core_c0residency[i] > max)
-			max = dev->m_table.avg_core_c0residency[i];
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_PS:
+		memcpy(&dev->m_table, dev->buf, dev->mtable_size);
+		in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
+		in->ev_info.skin_temperature = dev->m_table.skin_temp;
+		in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
+
+		/* Get the avg and max C0 residency of all the cores */
+		max = dev->m_table.avg_core_c0residency[0];
+		for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
+			avg += dev->m_table.avg_core_c0residency[i];
+			if (dev->m_table.avg_core_c0residency[i] > max)
+				max = dev->m_table.avg_core_c0residency[i];
+		}
+		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
+		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
+		in->ev_info.gfx_busy = dev->m_table_v2.gfx_activity;
+
+		/* Get the avg and max C0 residency of all the cores */
+		max = dev->m_table_v2.core_c0residency[0];
+		for (i = 0; i < ARRAY_SIZE(dev->m_table_v2.core_c0residency); i++) {
+			avg += dev->m_table_v2.core_c0residency[i];
+			if (dev->m_table_v2.core_c0residency[i] > max)
+				max = dev->m_table_v2.core_c0residency[i];
+		}
+		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table_v2.core_c0residency));
+		break;
+	default:
+		dev_err(dev->dev, "Unsupported cpuid: 0x%x", dev->cpu_id);
 	}
 
-	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
 	in->ev_info.avg_c0residency = avg;
 	in->ev_info.max_c0residency = max;
-	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
 }
 
 static const char * const pmf_battery_supply_name[] = {
-- 
2.25.1

