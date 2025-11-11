Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806562D8792
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 06:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843105; cv=fail; b=mSggXoNfpIDFx0DEURzEAO2HKwKeyaN39Rc1DiiD6XlTCKA4Lo2V3CQWAw8B1DwIk0/uqQoL6XJR6kuOiBH/BiSpXk+2mnZksxxjyX9uh7NsSE2a+itL4W/NOYGe1U+vMvEPIyQM7dRMQiCaY+Y6Yls9eTNyAIRN55+KbGEdDKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843105; c=relaxed/simple;
	bh=m8tQnnWtJbGJXAA8lT70AorLROqoDb51aSNd7cXciZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fn8wQFt8Z18y5iitEoR25/huRkCmucjXU6qK2ySvr+xoWlGIl7LEYONYXIku2tU9cc1sz/mA2cJoMCFTzCwjsRrGK9lgSOqQ4/VL0rCQ5TK82HQSK2R7iyasdeuAG4PQCbh86F6Ph5tqP1dvRjtLCoaVWB6Y3MTRovZMDTojq1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fP0zdpOU; arc=fail smtp.client-ip=52.101.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fP0zdpOU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPwF+fEMb/4wwH6jqbm/P2egES41QBBmj56qTmTmAdbNTbzMabxc2tYhMi1MeNAvrUyoc6yS0OUQNIXqG1vfVtqm+wdDQbUMZV4HCK8JZmbAz8Fhh30VRxa66F+QhhHcmagrncwxlJtm8EVZrRwLleicACykIE4LbUaMBIo0DLtg3ye73lT+WjHnIOUqMm58n5pXdT2knWn+CGlRN3c7u5W/0Tg4arjQMScIUOzAj4whU1XXs9cF/Cd6vV3q6hSzHFYO3MNOE+9MKaA/CqObCUWZKd3gT9CPokGAcyVSvjpaMMQEO9ndKk4R8PhGvisnni+tVeicVjRbYNh7Ndh8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFzXhKfCbBfxpHgidEi8sK5nU8lyVkQT6lQzmMDW4Nc=;
 b=neMjVoW+A4qCU8WL1KfytB1KBZPGJIKsdElsmOjmR7OMpWubbyjiNFSEkSgWJ5blf5gj6li3WHqULYre359i/lDFQQE00EZ3jqmsDaI5nJsnjbLMJ6j+nh1yU3vwJIFI4w3cXredu+nyWYn/UufRSPzzXp13spTv8X31MBmCT+FR30H7XVPL+sy/I88clwK5LOxTO1mR8OaziW6drbetWbozXWoOs8PK6vUunVuyS2yxlA+d2lYEzjMmIGGI1X3IoeXC7L+zMEEJQNWyMMRbTQsm16nHQvIKWqJqnpYMtHYG7NAHL0TbEDbphGDCCG0PvisykwqTUDIt8vjuP+4L2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFzXhKfCbBfxpHgidEi8sK5nU8lyVkQT6lQzmMDW4Nc=;
 b=fP0zdpOUo8/CayE3tEIicExiFSKh9qIwi58ktEzsi8xywpEpgonlkTDbddiBM/s0eLPsqSRTmiH3Jcchhk6VRcrPn0fO/owEjGXod+O+roL9+taGS+WkODeNPSUbafDH2wsM210nRZqGJREirfXSLMN3NgaqULJPbHFgJ4Exyhk=
Received: from CH0PR03CA0310.namprd03.prod.outlook.com (2603:10b6:610:118::33)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 06:38:19 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::35) by CH0PR03CA0310.outlook.office365.com
 (2603:10b6:610:118::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 06:38:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:38:19 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 22:38:16 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/5] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
Date: Tue, 11 Nov 2025 12:07:33 +0530
Message-ID: <20251111063737.4156385-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6461da-eb06-49ae-2901-08de20ece6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fwv82BMS7pxCY0ysbnNOdgEmnciMTvcjrILOuT5Qp3RGde57YCYUceqGJI5c?=
 =?us-ascii?Q?eCoJzsWBK6MuujT/l/N4LbPxY5jgAuhVIaazC5lpqNhpnPm2Apjw1DuQOJNo?=
 =?us-ascii?Q?UThtdkfOsX5qL48g+hLzV1gWvn0QAjsRs+97srCHqgxStxEmDsrOpWZxk4cB?=
 =?us-ascii?Q?a/revbXCcU92EQP1qCmfD/DiOJALY2qLkx2De551uds5e0fxYnvzr4WqpbHh?=
 =?us-ascii?Q?iVuCdadkTjvSuPJfatXIqs8PXbaRxQR8q1wrZT6qy6ILTFIzub31ksOxi6cm?=
 =?us-ascii?Q?eF5aApl2vCK24xzbSg4I5vYmliZss7froF++s0hbbrmUDPakfcdbW+xzT2Kb?=
 =?us-ascii?Q?ptiufXakpXsMwRzeI6HLfvrF1W4RCA+XZQKSmwyLp/2rJ7gcoe5Z6KjgzKGn?=
 =?us-ascii?Q?iQbDZUw0XqJdJz2lEIY9nTgiXy/8Az1YiGC3LyF6tTiHBAGu5iE6A0XA1HRg?=
 =?us-ascii?Q?pnUICA4uwCv6F5V4Est15mjE1MQ5GZY77qwjXmRFF2Wq5KqOCmtpp1w/PDf+?=
 =?us-ascii?Q?+hHsxuuGokE9bfgQzG8159rn6WXQncUn1sQENDOxLs0LCqLlKPVS+nrpFshI?=
 =?us-ascii?Q?dm3a8047JVRjnhAY6vjJX1AV4u+jzTKkiODV/Cbnu5tn3df5CGREqK+ptT21?=
 =?us-ascii?Q?Fh6Vj+TgT1jZetTzhbFFKmTUV4h7nyVF02KX/0EC8ISW3qp7Lskvq1LYkCTH?=
 =?us-ascii?Q?Ftt0wpKsBjK67OouOy7fLE2g0Omh+9nmuhRdqsYiD4dLhSoO5gWeDbjLh3wq?=
 =?us-ascii?Q?y0qYcqQgbjObM2k/dumRkk3MB34+OVLprBq64H/DzuZbq3U3EwkqDdOyANg6?=
 =?us-ascii?Q?eozlXlbgyIAGBr7AJ1gfna51H1woWCpuRPPgTH20UCyr1zNLrT62xZfCcaI2?=
 =?us-ascii?Q?9lurDBRMylLskMMD/LhqZq2PbObQrc46yBuXD02ZhZDRm8v3/g/yJoGIRL5a?=
 =?us-ascii?Q?q0VqkzQ6+WKhRLmrTvxZlxU6h3eEtRqj/NALJVW0iK5C6yxvMZrH6WPNgnqQ?=
 =?us-ascii?Q?rJmgUVvtxvkcJzDVQaFyJjg538muhCzUszeFAhq/7VMn+p+xTLYLwLsSzktC?=
 =?us-ascii?Q?bM0FOAFBy/pRmhiZyKa8qfSmEJ3Z530q/VXZPfrjERND9iE5GHIKiYb0V7t9?=
 =?us-ascii?Q?go2JCUm1ABjWMIkEyZ8u6+uCXd4O4umEzT/aWeHwvK1zA0IwsIQhQH+hWFNP?=
 =?us-ascii?Q?jTe0zNri1iNBvDugnTdmx3A/FjQl4MP5My11MeGulhqtX//smV5VsdUr4Ujs?=
 =?us-ascii?Q?Di5U+UrJDfocMWzYPkVvKceTKonpWyD9hDzAt0VhHyAc6KYVHZpo/l5SDveE?=
 =?us-ascii?Q?rak/YcozEHS5X0f9n0KXAdkW3cavS1cnfizXtWmmvCSIkMnoA1C1+DL+w2Y7?=
 =?us-ascii?Q?YnoRRlmX+LYFthk6vZoi/7ry5ncHZxtg7c9l0sC9XKkA1R1n9aiOMj3cIbhy?=
 =?us-ascii?Q?or3OJ8irikIrKYqdFecQNuoHje5k3LLci+HTgUbiwq+qmGHBi/ZlCPPs+cQR?=
 =?us-ascii?Q?P652KO2i3iqJOqU0vbWDiWYwCEISX31npYybVPnx0stlKkiNRS3ODhZzVrYA?=
 =?us-ascii?Q?GInBR6lMai6XCbJxZ7A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 06:38:19.1796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6461da-eb06-49ae-2901-08de20ece6f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565

Update smu_pmf_metrics_v2 to use NPU terminology instead of IPU. This
aligns the driver with current firmware/hardware naming and fixes the
mismatch. There is no functional change and no impact to the struct layout
and only field names are updated.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index bd19f2a6bc78..6ea5380f3b23 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -243,12 +243,12 @@ struct smu_pmf_metrics_v2 {
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
@@ -257,9 +257,9 @@ struct smu_pmf_metrics_v2 {
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

