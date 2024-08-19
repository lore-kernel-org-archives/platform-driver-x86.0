Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D014BF87
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724049274; cv=fail; b=pe0zbQGeOo3mNhTEYT2s+n2Q2gH4KUirfz4DnWRFmEX2zsdFEC1aldRhiokci/0ey/ssZ5uwRh1dmPX6Uaj+7G9znp7y2uCLIDwLePIt+BsysgYFhFggUgGTYYlcEl8jBQkkLy/OFGT97KjVDmAtMjdLl13EC4ixZtwPNB3+upI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724049274; c=relaxed/simple;
	bh=3/X8WVBhUvhOfUf0ctECrjpc23KPdw0mTCZkz4GQ/30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xcv3rYR67WOoTkv3gZotxg5Yj9KiNakGsynLcF/Ne5cyHszaNN6Nam960AXCwzVAa2iI2tLSOWuKdUge+uAEWxXI0pzGgEClbQXLGjPM2rllFabXPFTdgARD+eMBah+KS+GKQQ6wTQ+6FnzQte07B8ggm3wegxuWJVQUOC4gcxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=srG8VWBY; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="srG8VWBY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4QHExN6QDmxnsbMy7OVscQ20D8NuHbdMvAXilKC7a0YQdPRYhSGZSoujhPAQzAM6duAIW2sbb8oyFC8Gd3HeMGxopmJI6Ri1WOrXcflaMCwD/bOkh/0ml8bGSWdzycsrYR+Vc6Wlib7B3WPgMEVucu5zPfoskRGkqqBgWqao5iNWkjal2jJN26s51ViW2sLn8RjlX0WAdCHw+PiNHEoaNzmIezGPQ178qoQr1lRI3ybfDVgJSMMydXdlr8VUuawmb8XbWY7Gx+M/W51fCgZd8V3eBmOwRUSax8qPgFDkLDNcFoWwtWW4BPOGSY+5nYIoEBb1ft4u2n42UACXnTqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtrdIu5Mxj5ZJdahrO0z/zpX4Gbvf7sEFuOZmsWHt7U=;
 b=xQmF9suAIIHLeNK963rxYNTqoUGBWb7eov/AuwQqnJhBMiaW8Il1M6IsMd6m8e8PKM7ZHWX3tRPjIIsceYqyL32s0HucVe7RETa/Oi76N315aALqCzscuN74+0QdIxJuWZyo6fLSB/0qKVFuneZrRXGDvI8NVriKvdK1TvO4CiZrT1honaIIU+hVeG+5q1esQp/bDbJ3m/VYw34hdc259tDMhw2KJzDl/vWcXbwJ+ApZyy6juMLpsY7+OnjXFWKlE+Jtv4EMGuE9TUVqRWB3U3pY5lJ6kerS6XMSir88xp8U7bnup7QUAKUvAl2qbOSdywPB/J4s8i6PusBom6v8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtrdIu5Mxj5ZJdahrO0z/zpX4Gbvf7sEFuOZmsWHt7U=;
 b=srG8VWBYTce9zHhuDsKLb7I6hrhW2taubpuh9CMw0YoGs3H9ZDM393dUpM/E/1ikQgAXV5V3y0H8At9sGHbAoNoY+ggZ2nI1nRloN9RlOMRBAEw51tWK+bLx97y9JXoeP+GJhDum+GPSFAF5MS7Ae4DCalee5ZuU0dYffbxHiFc=
Received: from DS7PR03CA0222.namprd03.prod.outlook.com (2603:10b6:5:3ba::17)
 by LV3PR12MB9354.namprd12.prod.outlook.com (2603:10b6:408:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Mon, 19 Aug
 2024 06:34:28 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::c9) by DS7PR03CA0222.outlook.office365.com
 (2603:10b6:5:3ba::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 06:34:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 06:34:27 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 01:34:25 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/2] platform/x86/amd/pmf: Update SMU metrics table for 1AH family series
Date: Mon, 19 Aug 2024 12:04:04 +0530
Message-ID: <20240819063404.378061-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819063404.378061-1-Shyam-sundar.S-k@amd.com>
References: <20240819063404.378061-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|LV3PR12MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 806e412f-4b70-4943-5bce-08dcc018f991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REtoa2FRdmxJbWJreU45TVkrMTJBQ2hOVkt4RVFnNEM3NWREY1lyZkZaTWpo?=
 =?utf-8?B?NEFVemZyb1Vnekt0RDhrTVhMYUdyWGIzTk16VEhtaFJyNG51WjFSUDZBN3pV?=
 =?utf-8?B?bjY2N3RCdnZwR1NFWUFjcUtTZWYxcDltdSt2OGM0TkZlRTAxano3VzNyUVQ5?=
 =?utf-8?B?NmV3NWNvTTlSY21DUHZEbXFwNyszVFBONWFTRVpYdENkU3p2RlFTL09iRHBH?=
 =?utf-8?B?YkpMMXZudmVhY29wRWRDQUZtbGd5eUVzSjZ4L0tzQUVpOWZLcERObmk0MklI?=
 =?utf-8?B?MmF6TGlsS3FSOHpPL1l0OFFqZU9VWExDWHE1N2YwS1RVM0N0REFqU3hhZ2Uv?=
 =?utf-8?B?WkdWVlRRcHhVc1haN3hPdVRBTlJQVkFKcXhtMFR0MUVFUXViYTRtMloyZXE1?=
 =?utf-8?B?VWVtcCtMdlk4RTVHV090T0NEZk42WDlQOGJrMS84Ukc4Q0luRk12a0dIY2R4?=
 =?utf-8?B?eXdBT1JHcTczNHhOc1FhN1VoK0R4Nnp1ZUFlZStFV2ErSThmWGUwVkFvTzNq?=
 =?utf-8?B?eDRxaTRTQnpsOWxmeTUxWngzYURETDV6cG5IbE44S3ZFR2s0RFlncEZ1U1U3?=
 =?utf-8?B?cjVWbWVTVUFlZGlYMHJoM3pzQmkwZFBRUnU1TWRMY0ZPUVh0bktiZGFoN1g2?=
 =?utf-8?B?RjlGNmVKZmlsZlcreGF4cFNIOG13SHFkSURPWmtzcUFwT0lqRVVSQTUrV1BJ?=
 =?utf-8?B?ZUwwOUdGd3ZxNzJJS0VtbmdvcG01UXUrelN6NDBKUmY4T1ZQT09Da3ppRElz?=
 =?utf-8?B?VTFVTnRXamdMTStyd2ZHZ1dXR09UT2o1ZGJpV2IvTXBkWDFtb3dWYkVSWGJm?=
 =?utf-8?B?ckQzbmpnOU8zQXZPeCtOSmlzOVZsOEpoeWN5OHBETGRRWDgvSHRHVzA3ZG9M?=
 =?utf-8?B?RURUbTlaM1JCUDY1d0xkNGR3YWhIVjdqRmhEQ2VHOE1qRHNzN3NmVlU0Tkd4?=
 =?utf-8?B?RzVRWmI3UlZiK3gzdHFJZVRNQnFQU3pyQVVud2xGMGFLM3c4QnFoZ21lT1Nt?=
 =?utf-8?B?a1FqM2RaUkg4elROeCt6aFV5Vit4ejhhUk80K0NYakdkSDRSSUNBeWkxNHRG?=
 =?utf-8?B?blRXeTE3ME9wT1lwYWtTMS9UcW84N1paaGU4MHE1R0pqWVpqamJLVVk1LzI4?=
 =?utf-8?B?UFhMT0tBU1d4bGJvdnBZZFgvYU5iTC9qWmlZdXF2KzVzYUtZUEpaWDQ1alNO?=
 =?utf-8?B?ZVJsSEVjaWw5VjRtU2ZGbEZCWXdyOWFvTWFBZWY4OTVtQ0kvTmpMYTBycEhs?=
 =?utf-8?B?a2FyQTlNRU5Gc2NXQS9VTjE0Sm1yU3AzeUozSkF0L2EwVHJnc21sSmx6QjV1?=
 =?utf-8?B?QjZjeGRQQlRPL1dhQTVhd1Ywb2VjQ0RPVmFCV09oR3VUT2tTT090dkthdkhh?=
 =?utf-8?B?N29VQzFRU2dKQWlib3A5TmU2TnN1d0hmY0NHUS85SS8zZzZ0aUtQTWdXczhM?=
 =?utf-8?B?R3llWVV2U2c0YjZOcTN6ejZRRnhuTFlVQmpCUzEreEI1VDZLYzYvQVhzdWFG?=
 =?utf-8?B?elo0K1VsRWpNc3ZmNkE1aWZlK0dkTTZjWDcvczc5alh5SWJJMStUYVhaZnBr?=
 =?utf-8?B?Yk85SUovMDFkNmV3MVo0YXJ4Qmo1elEyNXAzVC8zQWtSUk1qTDNtRTkzN3A4?=
 =?utf-8?B?WHplQXZnb3Z2cUl5SGRtS2FWa01hZE84VHhjZWNwbTgyOWNDL2N6a1F2OHF5?=
 =?utf-8?B?dUNRVmZkdk9vMHRBNVhBdE1RK1BIc0hhOEpWTDhTSXZadDROL0JoY2tYZXky?=
 =?utf-8?B?ZU8xNjFSVU5HcjdESU9qRTJSekMwaHYwR01CUlhVd25hdUFnT0VvMTVVMmJ5?=
 =?utf-8?B?WDQzdlZtbTlqZUYyODNtcUdNQVVNMi9iUituRDBmYjl2YjRKTHlVZ0NHRTZB?=
 =?utf-8?B?RCtjU09yWE1JVWJ2NUlhTHFnOGhpRjA2NFdnN1o5VGRQZm1QRkFoQ3pvY2hD?=
 =?utf-8?Q?50SkjE78YaTvQYSNfFCwbmO/PpcVhwId?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 06:34:27.7475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 806e412f-4b70-4943-5bce-08dcc018f991
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9354

The SMU metrics table has been revised for the 1AH family series.
Introduce a new metrics table structure to retrieve comprehensive metrics
information from the PMFW. This information will be utilized by the PMF
driver to adjust system thermals.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4:
 - Add Reviewed-by Tag
 - use size_t instead of u16
 - other cosmetic remarks

v3:
 - Address remarks from Ilpo on the helper for C0 residency calculation

v2:
 - Align comments
 - add helper for max and avg calculation of C0 residency

 drivers/platform/x86/amd/pmf/core.c | 14 +++++++-
 drivers/platform/x86/amd/pmf/pmf.h  | 49 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 51 ++++++++++++++++++++---------
 3 files changed, 97 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 88314b0277a3..d6af0ca036f1 100644
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
+			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
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
index 3c153fb1425e..b5183969f9bf 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -53,30 +53,49 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
-static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
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
+	max = *core_res;
+	for (i = 0; i < size; i++) {
+		avg += core_res[i];
+		if (core_res[i] > max)
+			max = core_res[i];
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
+		amd_pmf_get_c0_residency(dev->m_table.avg_core_c0residency,
+					 ARRAY_SIZE(dev->m_table.avg_core_c0residency), in);
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
+		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
+		in->ev_info.gfx_busy = dev->m_table_v2.gfx_activity;
+		amd_pmf_get_c0_residency(dev->m_table_v2.core_c0residency,
+					 ARRAY_SIZE(dev->m_table_v2.core_c0residency), in);
+		break;
+	default:
+		dev_err(dev->dev, "Unsupported CPU id: 0x%x", dev->cpu_id);
+	}
 }
 
 static const char * const pmf_battery_supply_name[] = {
-- 
2.25.1

