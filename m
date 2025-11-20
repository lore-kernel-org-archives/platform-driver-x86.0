Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01932E6B9
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636082; cv=fail; b=dlxHGl0Y51eCMVCa18wem6ohYntc29POInjh8BicIaYIiTqTF8MujdyDpEiP1BrXwCj6krSgsFqUb9TCkVn4l5qdmEJbm7XV9loS2KE9EtrjQQLqnjPM4qOy3UAmCV9JomO2Q4q8IMWxJ3by7IS/OgwBS+Vv6kXgpNah0wjauKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636082; c=relaxed/simple;
	bh=N4iuO8YxWpVy6LLWl7FWu315PE8aT49Rym6PjZOKe3w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpjN2xXlaS80TU76kkukS0g7YOCkxmUYn5aEztdEUSyPGPI7iUAJdiwd8ZCzws2rN35m1q//4vfJlOM1gmajrwyrC+yUktJBxLhREYdPHLLi8GAa6Hz/Rs6BIrt3/d5tmlgwMrBH4XrnwHPzrWJmDiEcJNKUIlZZBeeApsXDRGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LV7RSvDh; arc=fail smtp.client-ip=40.93.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LV7RSvDh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHs6abpGzrAHwiBR6dDdn7SuEf/UqF+zXyVsZWGwy+XHDYZZqIsMycWM5GpkSQg8RM2uh7vMALED8z7MUgNLtfP67YBWcw7hLQjPTj+JQFcSp8QviLvqnSfVmoQTzB+8V6eJ7gi41WjGeZDrCmambqShdDeEA7VNpoNndsHTZaPlPLwlrlmXREsdi20qMTqTyVtDxWhruJnunFzzIjGFL4EMYMrU98I2aOUFV8N36ClUCVaqv4D5rLxF494PkClTutJDwnP3KgBQdgVE1BSRoqfYa/Yx8JzX/rj4iUsGifpSqHtHHwWeHAxOCdATzixQmTbEvXAuFIPVUDpb3C2GSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPBYo2FfNFsC+D7YtBTKGlDgFQ+3L0po9rpBayPQjZw=;
 b=nJzqBPjCFJQluPWOk9Y7iZR9yrYgCN3HfbHyOeXaUqQB15THqUzmdSxzDjbN+WzKUtE+yxbwKdLDeyCQwZ2dq6Eo5BBIbjbdKHERMQS1zCGQXd+fY3/iJLzpj8BFnwPEzWKeIaIpPh4Pw0bwRyeTy8mkuESpRZ1zqBKsf98XUtqmj6SB46UtPUuXDXSzh1hojp43zLaGwJIoJQwpCSP2p9xnaeMIb3Lr6w0ujBi5F1shC2hO6K3Zy/HxtCOgYTdO6AFf6mN4Zqj/4fin+nZ2UALM32Ki3HF4P+57Tujh5PxY1ysUPjjX6Rwci+XJfvnM3whKyRNIA86Ucn6Vg+IANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPBYo2FfNFsC+D7YtBTKGlDgFQ+3L0po9rpBayPQjZw=;
 b=LV7RSvDhU+2hwShxJr8SWi1w1RfVMV8cx+9wY+DoLmXCpmL2dmqipSzZrT3ORuAjk0vUFC4NfuoZPqUs6u/wwYOSMF5d9z76wKmRJCh95jxlcMwzJc+XWgVtQDjToMpC1wmI+8fk4K4DAdTLha/gnfli/4qtbhlIpIrbm9anNgQ=
Received: from SA9P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::11)
 by DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 10:54:37 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::d7) by SA9P221CA0006.outlook.office365.com
 (2603:10b6:806:25::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.20 via Frontend Transport; Thu,
 20 Nov 2025 10:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 10:54:37 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 02:54:35 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/3] platform/x86/amd/pmf: Replace magic table id with METRICS_TABLE_ID
Date: Thu, 20 Nov 2025 16:22:10 +0530
Message-ID: <20251120105210.3945710-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba2bce2-dcb3-4f8d-d606-08de28233317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|203893001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUM2MStOWjVIZFdQT0hvQUhtYUxmVmFBMDJmWEJFQ01mR3pheHNvLzRCYnJv?=
 =?utf-8?B?SjBRRk45azBsZjE5c3htQUNLMkNmeWtnS3VwV21IUERaeUlHSGFMVXBhQnl0?=
 =?utf-8?B?cGoyTFBnUVdZRFcrZ0xlOW13Sk96WnZmQS9tdk9tUndkVjJZM3QxbTgvRnZ1?=
 =?utf-8?B?WHRtSVUxdW4zM0pyakt3T3E1a29vUFFnWDRZcUt1bDl1dEZwa2YwenlnVVpO?=
 =?utf-8?B?MzM3MVI2WnhJQTY4WGJFa2EydDdkRERncnA0QWpyRUh6SDcydnVsMndFa0ZE?=
 =?utf-8?B?MVhRS0dyd3pXUnU5NTZ6bXYyYUx3Ymc2SFFSdXgwYmY4Vk9YSTVwYXVRRkVQ?=
 =?utf-8?B?bWZib2s1eGVkUlZsRTNtTVlJMmlTWE9YalJvMjZRbnFTVHVDeUpFaUp2V2ti?=
 =?utf-8?B?aXdoSEQ1VnRFdGs1eGRWOXoxdTl6TnViWGxoUzFWOTNzNFVDcitMRStVVWo0?=
 =?utf-8?B?Vk4yd0VyUjc0bEZEODVOZGV0cUZnQXAwczhqYTI1WkFJQVFuZnhoNmNLNHUv?=
 =?utf-8?B?dFlEVjRkZHdvTk96ajV5eExiOE1KRkhOZ0VwS1U2LzR4cnU1TGtHa28zVzRm?=
 =?utf-8?B?dldrbFdMaEZiMC8rRm5HQ3NLZGlybU52Tm1HK0V2a0pnVkdlNlJReFNVK09h?=
 =?utf-8?B?WlJDNExRQlErbTJaVXhCMHhEQmNhS0tmU1hkVmRJUGtPTVJ3M2svblVublIv?=
 =?utf-8?B?TGI0b2FIMTRyWWJkL3ZRWlNuSS9STUlwT3JaRHJCaDVTMW0rOU9nbERlenB0?=
 =?utf-8?B?eStDVzRIalZOZTlZQWg5azZKdzcrTDN1MkZWR1BaRloxeS8xQjlrdTU3OGJ6?=
 =?utf-8?B?eTB0dWlBVjRzcm5mUjI2cWZrMkF4Uk9RM1p2ZGJCQ1Z3cklleS94Q0o4MmJC?=
 =?utf-8?B?cDcyK09wdmxBOTdLVHp2NURrZzRiTnp2MjE3MU1Sa3V2REdSZkwxakpjVTA1?=
 =?utf-8?B?cjdjVkd5a2c0ZHVoZk5kR3hOa1lvK2V4MFJjT3BackllbWEyQnM4Q2JtRzlG?=
 =?utf-8?B?K3V1YzhzWEFianVFaVQ1eStLVCtNUUpJdGlRUnBZazFOSEp2SG9ZcEtwYXg2?=
 =?utf-8?B?Y0hQWk5qOU43VkZ4Rk54Ti8xd1RScDNqdXlZSy9jWVdBV0lXN3pVVlQ1RDl3?=
 =?utf-8?B?NHRxWDZxalBoaXZLUXV2c1hvbUl2NDlqd05CdHBoQVBMMFYwVDllRG4rZEJx?=
 =?utf-8?B?ZHo0OGFTZytrNFlkUkkrbCs2ZjZGcDB4UmRpdlhiTGtPUGR2TWxmMWRKZHBJ?=
 =?utf-8?B?amRLQklnY3pZeDRNWSszVkhyMHo5eENNbkN4STJPOXpQRGxoazdEMWNCQ1Vy?=
 =?utf-8?B?bXJ1Y2IySStPZzJvVnpLMTB2aERNZWNMdkJiY1dkUmFJQVNsR28xMnFXVjRR?=
 =?utf-8?B?L1RyNGtXay9ua1NMM296V3FiSWFMTEZDVDgvRW9BZVRtZWtEcVZBZUZseVhl?=
 =?utf-8?B?WlRDWVM0bjlIOVA2bS80K3lFakN6OU40ZzJESnMxQ2NscXBUNHNzcnZnY054?=
 =?utf-8?B?dDd1alMwZG0vM0ViMHBiMVorN3Y5SGN1MldCN1k4amNCK2lWSE9PSjZPc2xG?=
 =?utf-8?B?WWdLMXZnSk12ZXlsVkIyS09TOFpwQjZtcS9pSlhsY0FUZlZEVitDOFdlaGp4?=
 =?utf-8?B?dlJCQmVoa2lZeHJoOVExSWFraUx2VzZzYkY1Q3JIRm93TzVWaUNqWFhPM0pP?=
 =?utf-8?B?V1o3RWpBWUoxRlN1RFB1MFEvaUU4K1Uvd01BQnNmSlpKUlZtWWphMUNxYVZZ?=
 =?utf-8?B?NTBPTUFiV1RCQnJkcitUaHc4UG5WRjdhN3pqQUEzU2x4OE5RRU85WGZVTGxX?=
 =?utf-8?B?b2FPb2VZWlZ6N2Frd0Naam8wMjQ2blRoaitHMFY2eFJJS0FZZjhEREtQMWNt?=
 =?utf-8?B?NElXd0dQTEp4dmNZMGcvbWphYUlLdGJhalIzd0cydE9IWVpiM1o4ZGdoQk1Q?=
 =?utf-8?B?Mm9aSlJGODgyZlZJVllVTy90MHFQZGV2MElZb1FLclZpbVdlQm1tV3dOWTFm?=
 =?utf-8?B?ODR0SStHTnRUbEQ2UU53a2JrMDd1akc3cWFyT2NuYTBwVjZ3WVlFK2N2Q3BE?=
 =?utf-8?B?SDdnMHV4dnhocElwWlRKNGNoU3BPUW8yd3VFRGYyUHhOVURUM01PUVNpdFVD?=
 =?utf-8?Q?HrDgH+PyoEId5DfFQdUpWDvvh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(203893001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:54:37.8932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba2bce2-dcb3-4f8d-d606-08de28233317
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455

Add METRICS_TABLE_ID (7) and use it when requesting the metrics
transfer table instead of the hard-coded literal. This clarifies the
meaning of the argument to amd_pmf_send_cmd() and centralizes the table
ID definition for easier maintenance.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 +-
 drivers/platform/x86/amd/pmf/pmf.h  | 2 ++
 drivers/platform/x86/amd/pmf/spc.c  | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index e9dbf328d17b..9f4a1f79459a 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -132,7 +132,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 
 	/* Transfer table contents */
 	memset(dev->buf, 0, sizeof(dev->m_table));
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
 	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
 
 	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4478947385f7..e65a7eca0508 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -128,6 +128,8 @@ struct cookie_header {
 #define SET_CMD		false
 #define GET_CMD		true
 
+#define METRICS_TABLE_ID	7
+
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
 /* APTS PMF BIOS Interface */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index b81ab58f1a80..2dd6b146564b 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -206,7 +206,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 {
 	/* Get the updated metrics table data */
 	memset(dev->buf, 0, dev->mtable_size);
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
 
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_PS:
-- 
2.34.1

