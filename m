Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983593;
	b=ZUwI0rsNhX4eSqNP99axOTEZmrMRfrFO6A6EUC6ZH4Baph4Gzrub6vxFw0IEnq7VEQe3
	 Tr7p78cEjxpgtR0Drbb7tdy6HUxVzJR3JKxyzGfoRaNKvh+Ive268Ty9sduqSXqbE0ytp
	 FThElKXO47aZm2XkyfPyJYnK39Dbt8pl6lPZtfOgPNAGVQHd3Gj8QA317Ox0khZMr76n/
	 Tsa2nG60DBPUEzqwqSoyKipv8Fj03X0nFzsqLzNj6WJjF0tOBVHEvz8/McfI72xTKUUFf
	 QY9ZOBAbstEV4ZXAG2idRr7nFehUOakbXChqJYX/8J1JVysDAnL0nBoNQmhhL5Lqfog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983593;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7O5sjGm0sKAZ/uP6yZhamDGYMQf10qjLRZz/i+ogJi4=;
	b=YgE8Uobq82FyCqrUP4GS8ZY7SKAxOsvlEUTIChV1/NIed9a/QvTsBe9rHO4mYELdJRQ/
	 PqOXcV9+3HC60TmTOymdRS8oJc7yHl+ZAlj16vUfigvnf5FYXn6/GwBKbNyMMu6yS5Dq4
	 rIpUIzCy+u+lfpFnOXcTV6W3CsdaenSAHh96vlzofNmCKkEWxvCcPIC6zbd0IgydvnDAn
	 AehPtf4thR8Anbs8AvGpl/pG/s6hCmDjpnbxmreXiBzynemR2GRGXkRo3vttorrYlSSFK
	 keN/W4S5e9O3OjFhf7ZpUcv6qcUWhkCVd5IzhNZ7fQ+yR0ZjvoTVMRimBIgb6suI2ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=txOh1+Sy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.11
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010011.outbound.protection.outlook.com [40.93.198.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C0606A32D
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D3C0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=txOh1+Sy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tERbLc8G1XvQU88hzFlOChUhGRXXUSQdL/3R/TAo/xLkgPXEiwObs2Ykga0uLW97kZADxZQ4Xdb4DbgILX0bRM9nxcGODijZcYn8VQUnhHRc+ROCNVYD++8WudMadUZtcRLoJgxzxHL1stqlT+HcGOuN5F2mue1O3lrtAQJEzaNl4b6rFjhqtdfRUA6eX/Q7xMULBfdHJB6+SpBlz5IOsKyTgTk0Ph5zx6RkKntPiu2TJB9Ah6WOGcIUVqNgbtgWjTJRwkJ9CBrGybVDKKuO4go7qIpcbDWztQD1bdOyzpgx/K1s+WJLqVuofIlH/NNmIPds/p/vCeZdR1Bruw7oLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7O5sjGm0sKAZ/uP6yZhamDGYMQf10qjLRZz/i+ogJi4=;
 b=CQBwBaPSG7OGbXHyQaqsJpgMAReYQC92SreffEjrH3ogc3bZWgvhkownPR4R+Lrs3dZhvW0wjnRlBybTFaRTQgriEB+b82y2cQlmpJQicsMkc0gkGskMH87rKIhqXtEzxGyUioyPw9WZ7xGVBTeusbq7DCJibY09bOY6cb4Iswnn1RmY2tIkV2bRuoM8v5WBTDV2u2HnvV7qH94nkX7BwNS3lkGO2wyBoiqNgXXhilIHtjWFN6OX6psUP3UkPHUWwCtpJdKO74nGEO82pa29WS1idc7DPFcOV6Vu1y1eFzPTOTohYSi9CLMn0y2bFcl+kzkmf0CfcyvEQiDICyhKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O5sjGm0sKAZ/uP6yZhamDGYMQf10qjLRZz/i+ogJi4=;
 b=txOh1+SyDB7nt0e+S1wPsBvCgjfkajjbeF7Jz1/UWHHpJLXhVlmUT9E2UAO+rH9e9eScDqVjP4vIcUNTILAN7aN4lsQOiuGpx9oL/zHvhodY1zk08bqhkGWNT7Uod3zBVf5ve8cpeshyQpvdEZ6M8iz215C+5B7dM/iAcOu6+9A=
Received: from MW4PR04CA0305.namprd04.prod.outlook.com (2603:10b6:303:82::10)
 by SJ2PR12MB7895.namprd12.prod.outlook.com (2603:10b6:a03:4c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 16:46:27 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::6f) by MW4PR04CA0305.outlook.office365.com
 (2603:10b6:303:82::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:27 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:24 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 06/10] platform/x86/amd/pmf: Add Smart PC builder support for 1AH_M80H
Date: Fri, 6 Nov 2026 22:14:25 +0530
Message-ID: <20261106164429.30738-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|SJ2PR12MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c577cec-d307-404f-ab91-08df3c25802d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|261021133027099003|261022115727099003|261026130827099003|261022075727099003|5023799004|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261021130227099003|261022113327099003|261021135927099003|261009223027099003|261026121527099003|261102123227099003|261026140227099003|261026135527099003|261028144727099003|22082099003|6133799003|10062099007|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Hd2Pbzfv/5BAVHTcq6aZYvxVpX/GHoqxl8t0VJrG1+l0yJC0xaTJ5Z8fodFeIumA93r27T5/UPJWA5K/uABi6eENkrlh3LWH2jUHQQfcy2ra2XcRFX9MirDPJ8LsSiK32qBLUt8hwFxa4K+Xwl8mBA+zYgYpXsPjVAh8z6nZJ5I75lGjuf/LtxmiZ4kBXibWThXJFxsKaqmju5M0IfPnZ2WrQY+IjT7bvONAFup9FUwwCT/cPHpVNdqdjYvkg0u817xGAERA20M7MbwU2tCTlZU5diD3nqRSG6ZBlhgzncvgN8a9wiaDIUMdbxKynfcnnDErVHkIjdri4O1YQojeQo97UXlf/eVvmLSxRbghR7OEaWmDiFVp1SjC1g4lnYpn7Xu5KlMLxEATW/YadqjeIcDpmM+x7mUYLzf6wg1gixmGFFUjwFeYIZIZrVDFEo1LUB6oZB56zD3i+tM1CHNKCLIFinGjsB62r/iq0cxCDr9pSa6si6xy3RpSh88za9Y3uoCDeigxPAWCVbdyzrtMGDhFN4BEz2KVlCH4+CqlFWZ5vXcAdy3OfGHQpDjR0CBhwIBNgkNexk6LmwVBYkoNRdsdzEAleV0aJCY7i3SkshoLDKv5kEc/682yeIF6tX4refuqPWEQCoWyKo4if0hKMqf7A4YRMy2ZXVj2JnHFcWnsOEiM4107uKtCbandu3yKMFAq4YmMOmLkPcQXkGl0SA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(261021133027099003)(261022115727099003)(261026130827099003)(261022075727099003)(5023799004)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261021130227099003)(261022113327099003)(261021135927099003)(261009223027099003)(261026121527099003)(261102123227099003)(261026140227099003)(261026135527099003)(261028144727099003)(22082099003)(6133799003)(10062099007)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vgXoDoJNfr+YLo8iVDqYvyybsA0hJvOAX9HnI3q7wn/C+rwRyaNSZObM08IMuT9+Ow0EjZ/DYAYme+8pZwT72ItSsCLtzG9DkZqOKiaFWgHB4D0E/aD5enCN9lvADD5etMNnShAjKk6k54uKTZJkgq8hbq2Fq/4n6/4vOPlcYalheujO3s3wuvcpk5cjPeOIQTJK6dfSzOYps5G6r910tRudXCTJEfZeAngO9ca3hHv1IxgXzz0zAM8bTl/R1cJIav2pE9hJUHXc6VJ7AchcH3niGxvzPkmqTbeecQo/y0RcURiHqL9on/Lv1SOT735IcoCH0TpX6jQWelNCN9aktkuq1DkaTmHKqv81yeq3UvTMeVRsB2/5x7FHjyaSKWE3q8MYunnqhQWQ/uW/xeTV+zkXpu82QjKKyCBFZAjF+0/aomStQ1DB2+j+sb0JAMVR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:27.0513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c577cec-d307-404f-ab91-08df3c25802d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7895

1AH_M80H uses a new PMF Trusted Application (TA) with its own UUID, a
larger shared memory layout and an extended set of policy conditions.

Add the v2 TA structures and the init/enact callbacks for this TA, and
select them through ta_ops on 1AH_M80H.

Battery, slider and sensor inputs reuse the existing helpers. SMU inputs
(socket power, skin temperature, GFX busy and C0 residency) are taken
from the accumulator based metrics table. Smart PC keeps its own
previous sample, so that it does not disturb the delta calculation of
the NPU metrics interface which reads the same table.

Key changes include:
 - Add the v2 TA shared memory, condition and result structures
 - Add amd_pmf_invoke_cmd_init_v2() and amd_pmf_invoke_cmd_enact_v2()
 - Add amd_pmf_get_smu_info_v2() to read the accumulator metrics
 - Apply the TA actions with the 1AH_M80H SMU message IDs
 - Read the v2 layout in the util interface on 1AH_M80H
 - Make the Q10 accumulator helpers and
   amd_pmf_get_metrics_table_log_sample() available to spc.c

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/metrics.c |   9 +-
 drivers/platform/x86/amd/pmf/pmf.h     | 157 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c     | 146 ++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c  | 200 ++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/util.c    |  80 +++++++---
 5 files changed, 564 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index bf6117b4d742..35f1c78464c8 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -28,22 +28,21 @@
 
 static struct device *pmf_device;
 
-static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
+u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
 {
 	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024) * MILLIWATT_PER_WATT;
 
 	return min_t(u16, val, U16_MAX);
 }
 
-static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
+u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
 {
 	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024);
 
 	return min_t(u16, val, U16_MAX);
 }
 
-static u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter,
-				  u64 curr_value, u64 prev_value)
+u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter, u64 curr_value, u64 prev_value)
 {
 	u32 counter_diff;
 	u64 val_diff;
@@ -92,7 +91,7 @@ int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev)
 	return 0;
 }
 
-static int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev)
+int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev)
 {
 	int ret;
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index af46a2c28ec8..d19d877d9ab5 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -148,6 +148,15 @@ struct cookie_header {
 #define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
 #define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
 
+/* TA version-2 array sizes */
+#define TA_PMF_NUM_ACPI_SENSOR_DATA	3
+#define TA_PMF_ACPI_SENSOR_MAX		4
+#define TA_PMF_ACTION_MAX_V2		100
+#define TA_PMF_UNDO_MAX_V2		100
+#define TA_PMF_NAME_TRACKING_MAX	100
+#define TA_PMF_NAME_LENGTH_MAX		256
+#define SIDELOAD_POLICY_MAX		400
+
 #define PMF_IF_V1		1
 #define PMF_IF_V2		2
 
@@ -178,6 +187,11 @@ static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0
 							   0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43),
 					       };
 
+static const uuid_t amd_pmf_ta_uuid_v2[] __used = { UUID_INIT(0xf51cad64, 0xea14, 0x4789, 0xb6,
+							      0xae, 0x89, 0xec, 0x7a, 0x1b, 0x8b,
+							      0x94),
+						  };
+
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
 	u16 table_version;
@@ -729,6 +743,8 @@ struct amd_pmf_dev {
 	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
 	bool npu_metrics_have_prev;
 	const struct amd_pmf_ta_ops *ta_ops;
+	struct amd_pmf_metrics_v3 smartpc_prev_metrics;	/* Smart PC delta baseline */
+	bool smartpc_metrics_have_prev;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -1123,6 +1139,138 @@ struct ta_pmf_shared_memory {
 	union ta_pmf_input pmf_input;
 };
 
+struct ta_pmf_name_eval_info {
+	u32 value1;
+	u32 value2;
+	u32 value3;
+};
+
+struct ta_pmf_name_eval_table {
+	s32 result_count;
+	struct ta_pmf_name_eval_info eval_results[TA_PMF_NAME_TRACKING_MAX];
+};
+
+struct ta_pmf_condition_info_v2 {
+	u32 power_source;
+	u32 bat_percentage;
+	u32 power_slider;
+	u32 lid_state;
+	u32 user_present;
+	u32 bios_input_1[2];
+	u32 monitor_count;
+	u32 mouse_count;
+	u32 keyboard_count;
+	u32 bat_design;
+	u32 full_charge_capacity;
+	s32 drain_rate;
+	u32 user_engaged;
+	u32 device_state;
+	u32 socket_power;
+	u32 skin_temperature;
+	u32 day_of_week;
+	u32 sys_time_minutes;
+	u32 platform_type;
+	u32 app_input1;
+	u32 app_input2;
+	u32 ambient_light;
+	u32 proc_queue_len;
+	u32 avg_c0residency;
+	u32 max_c0residency;
+	u32 s0i3_entry;
+	u32 gfx_busy;
+	u32 proc_time_avg;
+	u32 proc_time_max;
+	u32 irq_per_sec_avg;
+	u32 irq_per_sec_max;
+	u32 gpu_engine_time;
+	u32 gpu_engine_util;
+	u32 user_input_delay;
+	u32 camera_state;
+	u32 workload_type;
+	u32 display_type;
+	u32 display_state;
+	u32 asm_state;
+	u32 sensor_data[TA_PMF_ACPI_SENSOR_MAX * TA_PMF_NUM_ACPI_SENSOR_DATA];
+	u32 sensor_status[TA_PMF_ACPI_SENSOR_MAX];
+	u32 combined_socket_pwr;
+	u32 bios_input_2[8];
+	u32 hetero_state;
+	u32 game_mode;
+	u32 activity_balance;
+	u32 pepl_level;
+	u32 transport_mode;
+	u32 asm_supported;
+	u32 workload_class;
+	u32 video_enc_sessions;
+	u32 video_dec_sessions;
+	u32 rsvd[10];
+};
+
+struct ta_pmf_enact_table_v2 {
+	struct ta_pmf_condition_info_v2	ev_info;
+	struct ta_pmf_name_eval_table name_ev_info;
+};
+
+union ta_pmf_input_v2 {
+	struct ta_pmf_enact_table_v2 enact_table;
+	struct ta_pmf_init_table init_table;
+};
+
+struct ta_pmf_sideload_policy_info {
+	u16 num_policies;
+	u32 priorities[SIDELOAD_POLICY_MAX];
+	bool expression_result[SIDELOAD_POLICY_MAX];
+	bool policy_applied[SIDELOAD_POLICY_MAX];
+};
+
+struct ta_pmf_agm_log_table {
+	s32 policies_applied_count;
+	u32 policy_priority_list[TA_PMF_ACTION_MAX_V2];
+};
+
+struct ta_pmf_enact_result_v2 {
+	u32 actions_count;
+	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX_V2];
+	u32 undo_count;
+	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX_V2];
+	struct ta_pmf_agm_log_table agm_log_table;
+	struct ta_pmf_sideload_policy_info sideload_policy_info;
+};
+
+struct ta_pmf_name_info {
+	u32 type;
+	u16 name[TA_PMF_NAME_LENGTH_MAX];
+};
+
+struct ta_pmf_oem_debug_table {
+	u16 oem_major_version;
+	u16 oem_minor_version;
+};
+
+struct ta_pmf_load_policy_result {
+	bool add_policy_success;
+	bool sideload_enabled;
+	struct ta_pmf_oem_debug_table oem_table;
+	u64 conditions_to_track[8];
+	u32 max_policy_sppt_limit;
+	s32 name_count;
+	struct ta_pmf_name_info name_table;
+};
+
+union ta_pmf_output_v2 {
+	struct ta_pmf_load_policy_result load_policy_result;
+	struct ta_pmf_enact_result_v2 policy_apply_table;
+};
+
+struct ta_pmf_shared_memory_v2 {
+	int command_id;
+	int resp_id;
+	u32 pmf_result;
+	u32 if_version;
+	union ta_pmf_output_v2 pmf_output;
+	union ta_pmf_input_v2 pmf_input;
+};
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
@@ -1186,6 +1334,10 @@ static inline u32 fixp_q88_fromint(u32 val)
 
 /* Metrics layer */
 int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev);
+int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev);
+u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter, u64 curr_value, u64 prev_value);
+u16 amd_pmf_q10_acc_to_mW(u64 avg_acc);
+u16 amd_pmf_q10_acc_to_int(u64 avg_acc);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
@@ -1305,6 +1457,8 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
+void amd_pmf_populate_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in);
+int amd_pmf_invoke_cmd_enact_v2(struct amd_pmf_dev *dev);
 
 static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
 {
@@ -1320,8 +1474,11 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *i
 
 #ifdef CONFIG_AMD_PMF_DEBUG
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in);
 #else
 static inline void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
+static inline void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev,
+					     struct ta_pmf_enact_table_v2 *in) {}
 #endif
 
 int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index a12b4ee965a2..6c82ce011d79 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -12,12 +12,48 @@
 #include <acpi/button.h>
 #include <linux/amd-pmf.h>
 #include <linux/amd-pmf-io.h>
+#include <linux/array_size.h>
 #include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
 #include "pmf.h"
 
+/*
+ * The metrics table reports C0 residency per CCX, while the enabled cores
+ * are reported per core type. Core types 0-2 belong to CCX0 and type 3
+ * to CCX1.
+ */
+static const u8 core_type_to_ccx[AMD_PMF_METRIC_CORE_TYPE_MAX] = { 0, 0, 0, 1 };
+
 #ifdef CONFIG_AMD_PMF_DEBUG
+void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
+{
+	dev_dbg(dev->dev, "==== TA v2 inputs START ====\n");
+	dev_dbg(dev->dev, "Slider State: %s\n",
+		amd_pmf_get_slider_position(in->ev_info.power_slider));
+	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
+	dev_dbg(dev->dev, "Battery Percentage: %u\n", in->ev_info.bat_percentage);
+	dev_dbg(dev->dev, "Designed Battery Capacity: %u\n", in->ev_info.bat_design);
+	dev_dbg(dev->dev, "Fully Charged Capacity: %u\n", in->ev_info.full_charge_capacity);
+	dev_dbg(dev->dev, "Drain Rate: %d\n", in->ev_info.drain_rate);
+	dev_dbg(dev->dev, "Socket Power: %u\n", in->ev_info.socket_power);
+	dev_dbg(dev->dev, "Skin Temperature: %u\n", in->ev_info.skin_temperature);
+	dev_dbg(dev->dev, "Avg C0 Residency: %u\n", in->ev_info.avg_c0residency);
+	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
+	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
+	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
+	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
+	dev_dbg(dev->dev, "Ambient Light: %u\n", in->ev_info.ambient_light);
+	dev_dbg(dev->dev, "Platform type: %s\n",
+		amd_pmf_get_platform_type(in->ev_info.platform_type));
+	dev_dbg(dev->dev, "Laptop placement: %s\n",
+		amd_pmf_get_laptop_placement(in->ev_info.device_state));
+	dev_dbg(dev->dev, "==== TA v2 inputs END ====\n");
+}
+
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	int i;
@@ -121,6 +157,48 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
 }
 
+static void amd_pmf_get_c0_residency_v2(struct amd_pmf_metrics_v3 *curr,
+					struct amd_pmf_metrics_v3 *prev,
+					struct ta_pmf_enact_table_v2 *in)
+{
+	u32 curr_counter = curr->iod.counter_acc;
+	u32 prev_counter = prev->iod.counter_acc;
+	int active_cores = 0, core, type;
+	u64 sum_of_avgs = 0;
+	u32 local_max = 0;
+
+	if (!curr_counter) {
+		in->ev_info.avg_c0residency = 0;
+		in->ev_info.max_c0residency = 0;
+		return;
+	}
+
+	for (type = 0; type < ARRAY_SIZE(core_type_to_ccx); type++) {
+		u8 ccx = core_type_to_ccx[type];
+
+		for (core = 0; core < AMD_PMF_NUM_MAX_CORES; core++) {
+			u32 core_avg;
+			u64 avg_acc;
+
+			/* Skip cores which are not enabled */
+			if (!curr->iod.cclk_core_enabled[type][core])
+				continue;
+
+			avg_acc = amd_pmf_avg_acc_metric(curr_counter, prev_counter,
+							 curr->ccx[ccx].core_c0[core],
+							 prev->ccx[ccx].core_c0[core]);
+			core_avg = amd_pmf_q10_acc_to_int(avg_acc);
+			sum_of_avgs += core_avg;
+			active_cores++;
+
+			local_max = max(core_avg, local_max);
+		}
+	}
+
+	in->ev_info.avg_c0residency = active_cores ? div_u64(sum_of_avgs, active_cores) : 0;
+	in->ev_info.max_c0residency = local_max;
+}
+
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
 {
 	u16 max, avg = 0;
@@ -138,6 +216,50 @@ static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_e
 	in->ev_info.max_c0residency = max;
 }
 
+static void amd_pmf_get_smu_info_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
+{
+	struct amd_pmf_metrics_iod *curr, *prev;
+	u64 val;
+	int ret;
+
+	guard(mutex)(&dev->metrics_mutex);
+
+	ret = amd_pmf_get_metrics_table_log_sample(dev);
+	if (ret)
+		return;
+
+	memcpy_fromio(&dev->mtable_v3, dev->metrics_table_virt, sizeof(dev->mtable_v3));
+
+	if (!dev->smartpc_metrics_have_prev) {
+		dev->smartpc_metrics_have_prev = true;
+		goto out_update_prev;
+	}
+
+	curr = &dev->mtable_v3.iod;
+	prev = &dev->smartpc_prev_metrics.iod;
+
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->apu_power_acc, prev->apu_power_acc);
+	in->ev_info.socket_power = amd_pmf_q10_acc_to_mW(val);
+
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->dgpu_power_acc, prev->dgpu_power_acc);
+	in->ev_info.socket_power += amd_pmf_q10_acc_to_mW(val);
+
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->stt_apu_skin_temp_acc, prev->stt_apu_skin_temp_acc);
+	in->ev_info.skin_temperature = amd_pmf_q10_acc_to_int(val);
+
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->gfx_busy_acc, prev->gfx_busy_acc);
+	in->ev_info.gfx_busy = amd_pmf_q10_acc_to_int(val);
+
+	amd_pmf_get_c0_residency_v2(&dev->mtable_v3, &dev->smartpc_prev_metrics, in);
+
+out_update_prev:
+	memcpy(&dev->smartpc_prev_metrics, &dev->mtable_v3, sizeof(dev->smartpc_prev_metrics));
+}
+
 static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* Get the updated metrics table data */
@@ -268,6 +390,30 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
 	}
 }
 
+void amd_pmf_populate_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
+{
+	struct ta_pmf_enact_table tmp = { };
+
+	in->ev_info.lid_state = !acpi_lid_open();
+	in->ev_info.power_source = amd_pmf_get_power_source();
+
+	amd_pmf_get_battery_info(dev, &tmp);
+	amd_pmf_get_slider_info(dev, &tmp);
+	amd_pmf_get_sensor_info(dev, &tmp);
+
+	in->ev_info.bat_percentage = tmp.ev_info.bat_percentage;
+	in->ev_info.bat_design = tmp.ev_info.bat_design;
+	in->ev_info.full_charge_capacity = tmp.ev_info.full_charge_capacity;
+	in->ev_info.drain_rate = tmp.ev_info.drain_rate;
+	in->ev_info.power_slider = tmp.ev_info.power_slider;
+	in->ev_info.user_present = tmp.ev_info.user_present;
+	in->ev_info.ambient_light = tmp.ev_info.ambient_light;
+	in->ev_info.platform_type = tmp.ev_info.platform_type;
+	in->ev_info.device_state = tmp.ev_info.device_state;
+
+	amd_pmf_get_smu_info_v2(dev, in);
+}
+
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* TA side lid open is 1 and close is 0, hence the ! here */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index e672f7cdd1b5..117f16a459bb 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -115,6 +115,110 @@ static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_a
 		pdev->bios_output[bios_idx] = action->value;
 }
 
+static void amd_pmf_apply_policies_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_result_v2 *out)
+{
+	struct ta_pmf_action *action;
+	u32 val;
+	int idx;
+
+	if (out->actions_count > TA_PMF_ACTION_MAX_V2) {
+		dev_err(dev->dev, "TA actions count %u exceeds max %u\n",
+			out->actions_count, TA_PMF_ACTION_MAX_V2);
+		return;
+	}
+
+	for (idx = 0; idx < out->actions_count; idx++) {
+		action = &out->actions_list[idx];
+		val = action->value;
+		switch (action->action_index) {
+		case PMF_POLICY_SPPT:
+			if (dev->prev_data->sppt != val) {
+				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM,
+						 SET_CMD, val, NULL);
+				dev_dbg(dev->dev, "update SPPT: %u\n", val);
+				dev->prev_data->sppt = val;
+			}
+			break;
+
+		case PMF_POLICY_FPPT:
+			if (dev->prev_data->fppt != val) {
+				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM,
+						 SET_CMD, val, NULL);
+				dev_dbg(dev->dev, "update FPPT: %u\n", val);
+				dev->prev_data->fppt = val;
+			}
+			break;
+
+		case PMF_POLICY_SPPT_APU_ONLY:
+			if (dev->prev_data->sppt_apuonly != val) {
+				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY,
+						 SET_CMD, val, NULL);
+				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
+				dev->prev_data->sppt_apuonly = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_MIN:
+			if (dev->prev_data->stt_minlimit != val) {
+				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT,
+						 SET_CMD, val, NULL);
+				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
+				dev->prev_data->stt_minlimit = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_SKINTEMP_APU:
+			if (dev->prev_data->stt_skintemp_apu != val) {
+				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
+						 fixp_q88_fromint(val), NULL);
+				dev_dbg(dev->dev, "update STT_LIMIT_APU: %u\n", val);
+				dev->prev_data->stt_skintemp_apu = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_SKINTEMP_HS2:
+			if (dev->prev_data->stt_skintemp_hs2 != val) {
+				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
+						 fixp_q88_fromint(val), NULL);
+				dev_dbg(dev->dev, "update STT_LIMIT_HS2: %u\n", val);
+				dev->prev_data->stt_skintemp_hs2 = val;
+			}
+			break;
+
+		case PMF_POLICY_SYSTEM_STATE:
+			switch (val) {
+			case SYSTEM_STATE_S0i3:
+				amd_pmf_update_uevents(dev, KEY_SLEEP);
+				break;
+			case SYSTEM_STATE_S4:
+				amd_pmf_update_uevents(dev, KEY_SUSPEND);
+				break;
+			case SYSTEM_STATE_SCREEN_LOCK:
+				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
+				break;
+			default:
+				dev_err(dev->dev, "Invalid PMF policy system state: %u\n", val);
+			}
+
+			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n", amd_pmf_uevent_as_str(val));
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_1:
+		case PMF_POLICY_BIOS_OUTPUT_2:
+		case PMF_POLICY_BIOS_OUTPUT_3:
+		case PMF_POLICY_BIOS_OUTPUT_4:
+		case PMF_POLICY_BIOS_OUTPUT_5:
+		case PMF_POLICY_BIOS_OUTPUT_6:
+		case PMF_POLICY_BIOS_OUTPUT_7:
+		case PMF_POLICY_BIOS_OUTPUT_8:
+		case PMF_POLICY_BIOS_OUTPUT_9:
+		case PMF_POLICY_BIOS_OUTPUT_10:
+			amd_pmf_update_bios_output(dev, action);
+			break;
+		}
+	}
+}
+
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
 	struct ta_pmf_action *action;
@@ -242,6 +346,46 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	}
 }
 
+int amd_pmf_invoke_cmd_enact_v2(struct amd_pmf_dev *dev)
+{
+	struct ta_pmf_shared_memory_v2 *ta_sm = NULL;
+	struct ta_pmf_enact_result_v2 *out = NULL;
+	struct ta_pmf_enact_table_v2 *in = NULL;
+	struct tee_param param[MAX_TEE_PARAM];
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!dev->tee_ctx)
+		return -ENODEV;
+
+	memset(dev->shbuf, 0, dev->policy_sz);
+	ta_sm = dev->shbuf;
+	in = &ta_sm->pmf_input.enact_table;
+	out = &ta_sm->pmf_output.policy_apply_table;
+
+	memset(ta_sm, 0, sizeof(*ta_sm));
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+
+	amd_pmf_populate_ta_inputs_v2(dev, in);
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "TEE enact cmd failed. err: %x, ret:%d\n", arg.ret, ret);
+		return ret;
+	}
+
+	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
+		amd_pmf_dump_ta_inputs_v2(dev, in);
+		dev_dbg(dev->dev, "TA v2 action count:%u result:%x\n", out->actions_count,
+			ta_sm->pmf_result);
+		amd_pmf_apply_policies_v2(dev, out);
+	}
+
+	return 0;
+}
+
 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
@@ -282,6 +426,45 @@ int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int amd_pmf_invoke_cmd_init_v2(struct amd_pmf_dev *dev)
+{
+	struct ta_pmf_shared_memory_v2 *ta_sm = NULL;
+	struct tee_param param[MAX_TEE_PARAM];
+	struct ta_pmf_init_table *in = NULL;
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!dev->tee_ctx) {
+		dev_err(dev->dev, "Failed to get TEE context\n");
+		return -ENODEV;
+	}
+
+	dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n", (unsigned long long)dev->policy_sz);
+	memset(dev->shbuf, 0, dev->policy_sz);
+	ta_sm = dev->shbuf;
+
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+	in = &ta_sm->pmf_input.init_table;
+
+	in->metadata_macrocheck = false;
+	in->sku_check = false;
+	in->validate = true;
+	in->frequency = pb_actions_ms;
+	in->policies_table.table_size = dev->policy_sz;
+
+	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "Failed to invoke TEE init cmd. err: %x, ret:%d\n", arg.ret, ret);
+		return ret;
+	}
+
+	return ta_sm->pmf_result;
+}
+
 static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
@@ -579,9 +762,24 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_default_ops = {
 	.invoke_enact = amd_pmf_invoke_cmd_enact,
 };
 
+static const struct amd_pmf_ta_ops amd_pmf_ta_ops_v2 = {
+	.uuids = amd_pmf_ta_uuid_v2,
+	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid_v2),
+	.shm_size = sizeof(struct ta_pmf_shared_memory_v2),
+	.invoke_enact = amd_pmf_invoke_cmd_enact_v2,
+	.invoke_init = amd_pmf_invoke_cmd_init_v2,
+};
+
 static void amd_pmf_select_ta_ops(struct amd_pmf_dev *dev)
 {
-	dev->ta_ops = &amd_pmf_ta_default_ops;
+	switch (dev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		dev->ta_ops = &amd_pmf_ta_ops_v2;
+		break;
+	default:
+		dev->ta_ops = &amd_pmf_ta_default_ops;
+		break;
+	}
 }
 
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 2befc1b14842..f6244d2f4c22 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -20,36 +20,15 @@
 static struct amd_pmf_dev *pmf_dev_handle;
 static DEFINE_MUTEX(pmf_util_lock);
 
-static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
+static void amd_pmf_populate_ta_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct ta_pmf_enact_table *in = NULL;
 	int idx;
 
-	if (!pdev || !info)
-		return -EINVAL;
-
-	if (!pdev->shbuf)
-		return -EINVAL;
-
 	ta_sm = pdev->shbuf;
 	in = &ta_sm->pmf_input.enact_table;
 
-	/* Set size */
-	info->size = sizeof(*info);
-
-	/* PMF Feature support flags */
-	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
-		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
-	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
-		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
-	if (pdev->smart_pc_enabled)
-		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
-	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
-		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
-	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
-		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
-
 	/* Device States */
 	info->platform_type = in->ev_info.platform_type;
 	info->laptop_placement = in->ev_info.device_state;
@@ -69,6 +48,63 @@ static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *
 	/* Custom BIOS input parameters */
 	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
 		info->bios_input[idx] = amd_pmf_get_ta_custom_bios_inputs(in, idx);
+}
+
+static void amd_pmf_populate_ta_data_v2(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
+{
+	struct ta_pmf_shared_memory_v2 *ta_sm = NULL;
+	struct ta_pmf_enact_table_v2 *in = NULL;
+
+	ta_sm = pdev->shbuf;
+	in = &ta_sm->pmf_input.enact_table;
+
+	/* Device States */
+	info->platform_type = in->ev_info.platform_type;
+	info->laptop_placement = in->ev_info.device_state;
+	info->lid_state = in->ev_info.lid_state;
+	info->user_presence = in->ev_info.user_present;
+	info->slider_position = in->ev_info.power_slider;
+
+	/* Thermal and Power Metrics */
+	info->power_source = in->ev_info.power_source;
+	info->skin_temp = in->ev_info.skin_temperature;
+	info->gfx_busy = in->ev_info.gfx_busy;
+	info->ambient_light = in->ev_info.ambient_light;
+	info->avg_c0_residency = in->ev_info.avg_c0residency;
+	info->max_c0_residency = in->ev_info.max_c0residency;
+	info->socket_power = in->ev_info.socket_power;
+}
+
+static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
+{
+	int idx;
+
+	if (!pdev || !info)
+		return -EINVAL;
+
+	if (!pdev->shbuf)
+		return -EINVAL;
+
+	/* Set size */
+	info->size = sizeof(*info);
+
+	/* PMF Feature support flags */
+	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
+		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
+	if (pdev->smart_pc_enabled)
+		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
+		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
+		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
+
+	/* 1AH_M80H uses the v2 TA shared memory layout */
+	if (is_amd_pmf_1ah_m80h(pdev))
+		amd_pmf_populate_ta_data_v2(pdev, info);
+	else
+		amd_pmf_populate_ta_data(pdev, info);
 
 	/* BIOS output parameters */
 	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
-- 
2.34.1

