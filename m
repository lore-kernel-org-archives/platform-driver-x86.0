Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0651F7580
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758261295; cv=fail; b=Jw1dHTTbzkzA5aMbwrDY2TEO8qpRZKwnT4GHI0qZ+5TLjK6qCQUSwKqh1Yq3DPH3MfLT7wV39JSpYwxClBMqzLSp4Wv+gplFvqQzND4qCLVMXDLI8QVv/fD/yHNGe5ugmRwqydfXcSUCI3i6teNqVQzL/RWzx90Q71WsELE5gqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758261295; c=relaxed/simple;
	bh=xUxo4d0oJpWNM9qYPpVeOePRUpesA/88htc/ZVJDjT8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YAXmYo+jAS7Ezw4QyjMYnw8BV7Wm17M4yL8cIgimIn5ghLsdFY5qzh42PecdUquno4dwBc6InI6ti/7B6JgRNzuR7AxyZrnQnaioALAdrbWRKcwtOzv8Tc4ikaRwXRAe0zsqIBjQYpfptGbV+l63j/MBOUn2KztR4XqAf+e7iO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G0nrxz75; arc=fail smtp.client-ip=40.93.198.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G0nrxz75"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPfdyB9X8H4UpMqc2MLVl24/EIW4RKWF55PY0UYZS4HqkKJTgaTJ/wTu8rzTdGP739Ot8oeDZ02pfKuf5yUVXc262u37SdBq+0+lWBmajYeMDOEl8jr5f2DgklmCw8tF13qHakzAXWQcIry5DRJ6I6pk2FVLHOspCkM5ugug52flUji6lOyNursiOzWmggMBM2JRh7L6Zh91aVEG/ER5NKjDsnnpUPKNZlEaKBeyIEuxrCoKuFgsTCwCyagfLX14/Q620llNbMB6F5mwAl1dJ1YoxLN3litBkxOeZlZ6S/2L2qJ5rZNUu78aOetITPC1T3B+dCwN2wIseDvK8gWswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcM/nVpqN/KbMtY8of5reYBBrRyElIlk/IyLnoEKhEE=;
 b=MssOG7KG+JMyZJv6VL0Gev6TUJUyRsRoST3BwLGhYrQsE0bJlWL0/dJakKDjFhQON6B8BTG3tJSud7TSuJ9sMPRhp6nnjpuKk0nbhQEav7kEomActy5a0eEri2vMGFB6YcECCbbOnL/u7DKEFATBM8Bl4GqPzYdHPcsXVBLvKe9HmGbgZ7RdBI79Cj4/cZAojea2TkURteXjpQqeIg4LMWL5zKEmc9DnAYyQb6lwCXUa39BArwtuviwZRcTw0NF5TEw1OhdzwtFd5Lsu9wYJmAI3OJMuenUKLC92qHUdkdWqjPB7Uohnfngnw8u3R5lY+3LQIfIZz/xzg00/KartnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcM/nVpqN/KbMtY8of5reYBBrRyElIlk/IyLnoEKhEE=;
 b=G0nrxz75IJVBVUip8EC1T4OYcY8YnPUILeLaSiqTaD8M9UVDDLvcDcryZVDAHl6bsKmRQPytf0efTx84KA13YyAFVHgVjhahY1N0P9xXHKLewXABEI1dd01I2SPFQpmavH2wWWKl+Ic6u+RymW/xgOLbE5jOtqcPuU5dHLskvbM=
Received: from BN9PR03CA0422.namprd03.prod.outlook.com (2603:10b6:408:113::7)
 by BN3PR12MB9570.namprd12.prod.outlook.com (2603:10b6:408:2ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 05:54:49 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::a0) by BN9PR03CA0422.outlook.office365.com
 (2603:10b6:408:113::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.15 via Frontend Transport; Fri,
 19 Sep 2025 05:54:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 05:54:49 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Sep
 2025 22:54:47 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmf: Rename ipu fields to npu in smu_pmf_metrics_v2 structure
Date: Fri, 19 Sep 2025 11:24:24 +0530
Message-ID: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|BN3PR12MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: f655c18e-ea28-415d-a023-08ddf7410ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XRyJy4k9dpUgJT17IcNcKm/Bntown+66ouxmZKqxh5EyuRxermVXpQ3n2Htb?=
 =?us-ascii?Q?uyVxmin4LqYZ4kR0i0CrMubzO6UJz6bHFbg6Iphg69nL/kNEX7b6vWiwf7cB?=
 =?us-ascii?Q?+hPXY+6CtoJYVAg9V0dFOQlZWouLUqPbNUnllbn5pALsDvbWvUo6p8E+OBc0?=
 =?us-ascii?Q?bffrh/2Zhp/ttkR/8K1lBLq+g9NQS4t/VvTKPfhLjK1KTUAVk78aOv9P+/DZ?=
 =?us-ascii?Q?hNL6z0pneRNvlYKYCjk1DGwsIyGmv6/hI6CLPtKo+JDZS8TYJBLtJAvqrBao?=
 =?us-ascii?Q?CL/FHaLtUknZgLsCKdqV9+7KUNwUdOP+lwuuMvdaB2ROXt0ly853LKGdikP6?=
 =?us-ascii?Q?uks5/g/TkYpfN3R1+rtm5zZEd81sjvTXxj44gZDA/mIIxQO4bQOLeegN6VTo?=
 =?us-ascii?Q?1eJ+yyhH+ueOArVnyllh1a5vleSpHUBW+ydvHtBiUrujzzFZFRKWnYHdKTk+?=
 =?us-ascii?Q?GquVmcJAdAM+0KFPM5WL9cwnaab2buyINSd1ppEQn3X0mKG5GC23FHKjEC/h?=
 =?us-ascii?Q?6f8qaR/X/aJ9z8aN7boieBYN6DeBRD/rckdy947n3oNaKowtVamN0EqkuSWW?=
 =?us-ascii?Q?6T4+3LEWVGuVte5Q5tWdrqplcJ6IuzGaNsj3jJDAxA0ACcSiYRbbwNthlqhd?=
 =?us-ascii?Q?MKnev6ql8xaQYvd7tEBICdZs2kPjFoxHHP8YWa+hq77XK2fwsRD4JnrSGdef?=
 =?us-ascii?Q?eAc9y7e7NrlMnhVO9hGVub9t34HmWYML7nn8/NlwA9Dty4dsvKu3VexDRqGY?=
 =?us-ascii?Q?3B+n7tynWIcRQgE+04Ntm4Mgd7GxMKv9GSj5GLDzsKaTWOYnEx1ooVzHu3tB?=
 =?us-ascii?Q?J/fAuFEwr/af9BVOHLro9KVU7iiqOD0/0mJ48JBdLW5fyYsmasYUSdsLopZn?=
 =?us-ascii?Q?JNuEqzyKCPz1e1Ocbgwf7Luw69elQaLA54FJwFG0nMgwsoxt1paERgyJ+e9s?=
 =?us-ascii?Q?/m0QsgFHaeqIaggaC5oaiXK9yCKzmcPy3Rnl6vZ8z+HeYvxCfGhKpAr1MD8P?=
 =?us-ascii?Q?NlLcmSfAQBEG5FRJaeYviKrziv3Ahws7KxPEznvSvFfGsdZg0KaUM6LBo3HI?=
 =?us-ascii?Q?v4GNEanJ5+hzG+Y0gXKxnSAEBT0sGhkGwEKKaEbt1T8nSbn7yR7cRPxE1yvv?=
 =?us-ascii?Q?QWtjho+AQwaNdvf3wV4onfl+ETWnABU7s1740dElzwuwOtDWK73weCEVu2wP?=
 =?us-ascii?Q?2oY8JAvWFGvzEVaSkDTGZwYU0J+ixSc28y9lOO8cgUKqzijYxOwJXk71rLix?=
 =?us-ascii?Q?WE8J8aT5Pbra1RJzuCxR0cqDtKaQb71Sxhd++8wM7BWS3ulLgmnV87HR2BCE?=
 =?us-ascii?Q?BSwabeyPE4uS90zTmBZdo6dMZ4OjiuteFKBmEgTCg5th41dvTBd8xoUUury+?=
 =?us-ascii?Q?Uy2Tpso4MtiWG8bcEm495MOA5SEfJWdftkENw4i0lzxRtQxkHZIeOC1mmB3S?=
 =?us-ascii?Q?WXmE6KtQ5uxfOvdVobn+AFeArjY7rR0t2H6uUiTZ4w2rACrpNyb/+9xgAKZL?=
 =?us-ascii?Q?D+GQKKoibLu1fMACjI+nYpp/4VhbuBvdwb6m?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 05:54:49.6195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f655c18e-ea28-415d-a023-08ddf7410ba2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9570

Rename multiple fields in the struct smu_pmf_metrics_v2 from "ipu" to "npu"
to align with updated hardware terminology and enhance code clarity.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip commit
"8236b4667aca"

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

