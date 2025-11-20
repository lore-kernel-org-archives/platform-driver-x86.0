Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6466832E6B9
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636080; cv=fail; b=IEOY/Kiqd6snu5myXKNW5aj0qPyoPye/HbkLapdN5AYPZVw2mSz88YJbLNvjJniwEkuSJ1DZrelq/3SOLaF7tS3fXV0Z3IHIuaVN8eGVzg6M10KDtLoLu0gGKXFEJHLjk7T3sPYw8FEEEgP1WIF3HsAcVyp59MNJ5Hi/SfJJ2E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636080; c=relaxed/simple;
	bh=+igA168cGzKeL8nU9CHMuz7gxjb/R42L05eQhIE6W2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgsEE2bkrZz43USirlsazupFoB24aOAzEg+0TZRc3lChO43hswIQG/MjqzicjznFboqbzHlJIC11173ub8C/SLc5nxsXb53QyjqX0gEm9SZ3Aar98hmoRVsEfBHgqg1QRcJ4Fhh9+o8LNMYz5zoEG2zN994fQNDRLxvg/dt1Hy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=etSs6Jfd; arc=fail smtp.client-ip=40.107.200.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="etSs6Jfd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9DLPDbPDLZgpXne3QVKRPS/g1i+eyhdC6K6puza3sSQH+LiHc15x6WKlZb4b3ARWCLtJKIq7VT4cwrGrxJih7R19ud9GLIVJyKFfoGVhys4zoVaIWqbofDAuyMMAnmJaWpFvaZWjm943rf6/YEkIirWy/xhhYsHmMpvzrTRpS8Ekrc2ST4yHNkndUq9au47GUXqIRbhtU28kP5Fyfu26BucKVqtDKFMEog5XyS9kjeDfF+b+Zgw7/cNZPQRwi75iXxOIZ17I8g/IdHc8O2kpVs6Ek9baWx47QgfdV50ozycmkV049cewruoJAkj4FWV9OwubRytFusI2o9C0GCUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ws3ZljCcXmVf05rzJMYw0vFXaCweuL6igxpC/9V3CFc=;
 b=e6kKkJSyTRN7avk5X7CtLI84CcfOt670lNs4wXHpI8HwZCnJiBFsoLxwRSAzxVqZfCgv30i/cI1I8MUJjD0SomLelk+qN5y3WQ4htDhxNTyyhh7GwEBVMj/OJAJvKq1ncYINviorQdjPkjMQklF13mcrrYlkb0hsLHrH5k7g82xCzuaa3Ml3BHZtv92L1vLLhNP0URm6fmq/IqyxKVc6qUsF7XkxeOs6fNlgQ6eYwyA6D4ypx0z0yLbEZ9bvLXCHHZFoguoGEDk4/LfQqx/Pa2dx/vHLwRuaHb8aYsKO/s7ZMk3tJIHGBGS//By6WljJYSZbpTptGcwwcs1e8J8/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws3ZljCcXmVf05rzJMYw0vFXaCweuL6igxpC/9V3CFc=;
 b=etSs6JfdwIUdGzJnhEBM//6sNxVj4VP+ZOGEsHEdi/Z9Usx49fzFqVFGnO6LmIL5G0S7hZ8x1Uc+5IDq9b3aRpa6F6ishGIb85Tr8lJFaLUgTX11+2dpfV2ZjFCPwd2pqa+kzDpdOUkEoffbBreWemI+TdVB6aF+N3JbngZuqrg=
Received: from SA9P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::21)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Thu, 20 Nov
 2025 10:54:35 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::84) by SA9P221CA0016.outlook.office365.com
 (2603:10b6:806:25::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 10:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 10:54:35 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 02:54:31 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/3] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
Date: Thu, 20 Nov 2025 16:22:08 +0530
Message-ID: <20251120105210.3945710-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120105210.3945710-1-Shyam-sundar.S-k@amd.com>
References: <20251120105210.3945710-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 79989520-fabc-419a-8912-08de2823316c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zk84bEl0UjNUTDZldnNPVG5Ba3YvY0dwVFJMb3lwcVp1RFR1UGdReWljak4v?=
 =?utf-8?B?N25MTTE1aFEvT0ZPTkVxQ2gzeFdCcnZCYVpXSmZwNFZkMUZHWm84UEh4bXor?=
 =?utf-8?B?bk51Si9yTVBtR2dpQkxacEg4K1FVR0RMK09LUXJ6QVlRS0xWUW4rUTl6eGdT?=
 =?utf-8?B?YlRQU3B1cHhTeUVtbG15QkdieVh6NU9WNFZFVVlyeEdhVkJiOFl5cmJ1S3Zs?=
 =?utf-8?B?SzRwSkpwQ00raFJzUlY3VThWTE5KbG9CM1ZhT0RZUG1nTmxla0p4YURGMzRM?=
 =?utf-8?B?MVY3VEVIYkp1Z1ZPR05TUzlhMG1taHl0QkUxdFF0Yi9oRWY3U3BNdzEwcnVG?=
 =?utf-8?B?YjI1NmVWazNkK0NDVTNuVDhvbUhCZW8wUnRBV2JGbnVCOEpBQ0w4UUdycnhu?=
 =?utf-8?B?TldvOCtaUmhSblhrdWVrUjZ0eVI3c3hxNmM5a1Voc1BtYkhqTlB6MVByKzdI?=
 =?utf-8?B?UWwvQzd4ZEZjdW5BNmUxZGlPc0swN0pvbWo4QTdubnVOYkRXQ25GK09EZUdM?=
 =?utf-8?B?VDl4N04zVTdtaGM2SWVPc3BiSDFrQ1RDSFVISGVNYUtKSU9NTklGZkQ3Kzhs?=
 =?utf-8?B?VzBsclJ2RVpudVg3bUdjRVFlV295TFl3NjZSR1hHaXFCaGxGUmwwTjZVaVFW?=
 =?utf-8?B?RE9POVE2b1NmK284eUtzTlN0WThZajNMODFILzA0UnhaQXN5cDEwa3pzL293?=
 =?utf-8?B?ako1NnlrNm9hak1FQ3hyczN4MEp6TW1TMmlXQk1pSEdOTHA0c0U5K0ovSVJy?=
 =?utf-8?B?UzU0SjZUUGllUkg2emNrV3hKckdsRU5UR3lLTnVncUZyVkk5WnY4T0JiL0ZS?=
 =?utf-8?B?TGxhUVhKVXJLeWZQQzBBYU91NkdCNWg5Nzc3TWZHbExmcWF4WDZHK0lGQ253?=
 =?utf-8?B?QWVyMXZmQjA5QmVTbGtvR2FsWkpIQXdVNVdoWFdTU1JCTXRHYUdNcldoMmhD?=
 =?utf-8?B?YUdBYUpNcFVaa2N5UjlEekx0b29xNFZlcXV2c3lBdERsZlVHb2xMZTNwVHFD?=
 =?utf-8?B?TkZRT2lUb1dDTDd4U0U2azV6NEc3OGxiZlVsMlAzZWpDT2tsQlpXMmRRSkg3?=
 =?utf-8?B?WU03dlR5RkZ6c2F3QW1aZUZ2SnVtWXZtTjV1SXczSFByU2hwSktSVVlJdWJR?=
 =?utf-8?B?V1RQSUhyK1hZNGdMV1NjV1A3c0dGN0dWZ3BENlI5dVQ1SEJwNW1USlRndUh1?=
 =?utf-8?B?SWc3RHBiQk9rZHlxVXVzRzlFL1loRC9INGZ5Q1ZYWFk1MWM0ZEcyOU55QlhC?=
 =?utf-8?B?b3I5RUMwWjhhS0lHWm5ENXdhVVJFeXJRYm9RdXFrbHhYa0QvU2pVTDRXYi9h?=
 =?utf-8?B?Tmd5ODgvSGhrNEZtSkdHaW42Wjc1MzhZbWVyQ0FzR2F1VFQyaWYvUlBWOEgw?=
 =?utf-8?B?encySTJKa0IyTEJxd0paM0l6ZUxraVFqb3hpc09JaWxkUE9kUmEzcy9Udmda?=
 =?utf-8?B?NStSdzFlMXJTY3NKeXRlR0JQSHp5c0JrSzNReGlnL3BwTmZ2cWhNSDdFY1I3?=
 =?utf-8?B?YUNWUDZvMG5JOGJLMmhHMzhiTHR5dXlaaXVIZERzNEIxUlBvU1FxZUhtU25m?=
 =?utf-8?B?Y3F1Y21NVm1aNDZmdHRYeUUrMVN5RWpCekNCU1dWM1QzSk4yczlkMXhXdWpE?=
 =?utf-8?B?U0dKV2dwVjhObThCUXAySncxY0hlZ3NlbFM0V0dkVVRERFl1VytvM01tUmxH?=
 =?utf-8?B?SHlKRm1CMDNIU3RhVEY1bjFSZlF5YUtQWU90bDZlSGg5UlB2RnZUZG1Xd0sv?=
 =?utf-8?B?T2pvWkFhb25seEpNME5lQVhPYjd6RWxrK052bWFneUd2NkhmR1EvcUJpRStK?=
 =?utf-8?B?eHFoTENBdjRYSzBpMnlieFRLRi93aEZOMnp3cXVGYTczb3o4RVNQMTgzVWR3?=
 =?utf-8?B?dk1iL1BqMk5ZM001MEdRdEkzZUN6S3pKUTZDNEpwUUNqMjNzRlVGRTVQeWZI?=
 =?utf-8?B?b3Y0WXFRL01ZbUtORXViSzBES2sxSmJoSUtjYy9ycVlyOXE2YUI5ZGg4STdm?=
 =?utf-8?B?N0I1eEhyS2VJMTYvajFzYmhuSGliU1VSdVE0VlFJb0dYakl5bURJM0NIWUJo?=
 =?utf-8?B?ZE9KMklTMzlHQ1hTTWI1SGIvMUZGMmFPa1BGbDMrTHV2dVQ2TzluTlVaZUlv?=
 =?utf-8?Q?0OVc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:54:35.0742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79989520-fabc-419a-8912-08de2823316c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892

Update smu_pmf_metrics_v2 to use NPU terminology instead of IPU. This
aligns the driver with current firmware/hardware naming and fixes the
mismatch. There is no functional change and no impact to the struct layout
and only field names are updated.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 5a18b3604b6e..387e37ea3608 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -247,12 +247,12 @@ struct smu_pmf_metrics_v2 {
 	u16 vclk_freq;			/* MHz */
 	u16 vcn_activity;		/* VCN busy % [0-100] */
 	u16 vpeclk_freq;		/* MHz */
-	u16 ipuclk_freq;		/* MHz */
-	u16 ipu_busy[8];		/* NPU busy % [0-100] */
+	u16 npuclk_freq;		/* MHz */
+	u16 npu_busy[8];		/* NPU busy % [0-100] */
 	u16 dram_reads;			/* MB/sec */
 	u16 dram_writes;		/* MB/sec */
 	u16 core_c0residency[16];	/* C0 residency % [0-100] */
-	u16 ipu_power;			/* mW */
+	u16 npu_power;			/* mW */
 	u32 apu_power;			/* mW */
 	u32 gfx_power;			/* mW */
 	u32 dgpu_power;			/* mW */
@@ -261,9 +261,9 @@ struct smu_pmf_metrics_v2 {
 	u32 filter_alpha_value;		/* time constant [us] */
 	u32 metrics_counter;
 	u16 memclk_freq;		/* MHz */
-	u16 mpipuclk_freq;		/* MHz */
-	u16 ipu_reads;			/* MB/sec */
-	u16 ipu_writes;			/* MB/sec */
+	u16 mpnpuclk_freq;		/* MHz */
+	u16 npu_reads;			/* MB/sec */
+	u16 npu_writes;			/* MB/sec */
 	u32 throttle_residency_prochot;
 	u32 throttle_residency_spl;
 	u32 throttle_residency_fppt;
-- 
2.34.1

