Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F24334B8
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805383; cv=fail; b=HkNiKWkfjJxiPEPaLENX155usV5mLXiA9X8kzzdysRhfsKCQ8Ba8TVS1Sz4o6Fo6FjtUiHFERDshF3Xofj7CGqC1gMZM8rYLYkxFBQCJPmNwWLKtPvxjGT0SdnLjIGFsr4WbYfNuTgDEZcyz8HZay8le4fn13TRXuNaeaxuYV48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805383; c=relaxed/simple;
	bh=+tjRS6wwaeOide8DrGjIIWrnDcE0yaMpqt8b5MAP6YY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvFi+7rNtSiiXXKIbKMDBJvuI5n0TALJbl9HVJkKUIViVmISUC7uQ46jFdtQftvB1MfDYC9A4YGu197U+BYyOKaJZ3CwLBVOpVgXDUUOM+hbLFnZdM2psidA3KeahQuhbm9vouNjhsl1bNLeCwMmtI2QigrPcOj53hPg8m+XTHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QYhc+7f5; arc=fail smtp.client-ip=52.101.61.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QYhc+7f5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApGNpOjLjVlHtu+wbQCUFTnK0BOBum8FKdQJ7Yueyc5T8uv8TNDs0oRI8WiLWW94xUggcKbL3XQA1Z6cqB+y5LNkYzYBmOTLms+qhvsy3rsK17ZUgK52ILQ+taHpjgnYjbP/y3yzAujiOI3HVrH3Fb2byNKAiTwQojT1Q8Xqm/leL2R0uVz1sfXEbpznDNOb01kGFtKzm+47NaK0k48qNDlmeo5SYpsPqPURq5hdbST1prR+NBIHfsOaR93A2mA9Oe66cnoIsLcveWHqyctRwUkRC1AvBJvGbb++L1QMm+wg94OCVzM53AyHcX8ahN65J+i3ktNgMdiZeIydP3A4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLahYkOTITGxBgpfQFm7Zahfyp5WOUmea1PMXbHiLe0=;
 b=O032PnIgTikQVrJGbY4Wsfc7sODKx0BD7vYDs/oAsufTwy/NQZ8xA8u9sM/jVl4duOw9Y4dZDRu+IlBRYvlWEgcK2Q3Bi6wsB8NK5qJV0+klLUfkt8IM8p9R2wCmghApwoEbVkr2t+caa27+o6Qyaphd4C6s4i7YCV1OjFdASGx8XO38moNKib0vN+XtnERe7nYYxnwXQ4uAp471rqct3CLFVDxgWM1Rzgyn1qlwxrvchd9VLpqtKPmW0fUYDWDGyG1CjY3yCdrSdf/TjT9XkXa46+oouBxADSK1sXF4fnH4Z89kBAAHr0GilijtBKcwFD7TKg9AXPtObnJhyyiOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLahYkOTITGxBgpfQFm7Zahfyp5WOUmea1PMXbHiLe0=;
 b=QYhc+7f58rlyVSeMxK6IYm6glG6DWBSY/V+mKqoJkhyuxMoUUVhZdJw4wkNFtiBQnrug+hs/BM8Sv9zbMV0B+68B0KD8EQSBXhBW7SrebQPTJ2cIOw7+eCR486AMNFM7BMa3IGb8WLgAmfqlTkb1E5jpWECGsfncDmd7C8PDQGU=
Received: from BY3PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:39a::24)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 11:16:18 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::2e) by BY3PR03CA0019.outlook.office365.com
 (2603:10b6:a03:39a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 11:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:18 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:14 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 6/7] platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
Date: Thu, 23 Jul 2026 16:45:33 +0530
Message-ID: <20260723111534.1940925-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
References: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2dde09-218f-4bb6-cd9c-08dee8abd15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	smHHKCPmAZbbg6vb/87ks23VKTBfDkFuUMinx5tZ69e5hWDlI2fjenxYqsR3+wQWn/gm4AHPF8NB7P1xrD2YUMG15q6LOR7T9+YY8m2y5YFjZOORsBe0dT/LgGDASLuDphnHRT50ILLdWYn566ONKCdyL6nNV/4MZ/27iiYch3O5xROQsy2doQ1JfEqZVvXP9eVvo3BiIicKv+Gxh198T+TU9T72HEyy7f02LVxgYMtN+KGVtNxFXkuLEykzynGfjz7ct+X4gfGHjUkXNDaebD4Z4JyPW8ZUpvPSdTJH+m4Tw8sZTOCc6rRcPmEeZP+ztlpdZJWmZd4Cud/Afd1f0c5C0KfeFMUOP/ZNkvHIWFkJ/VNoi3tTnrvHju1djA5UwiINc+vj/uvK9xJRBc1tvZw0DuQehEXeQC3ZNY9XmFI6nUOFzzINEcbQGJe8UQZOJYTyk6dfWELeud6HxyoEL8NZXDwKGfimoV9+PZWmKTclAn00BeDrF/BcNOohE01pBvOuz4tsnnZcSJALpHWVPlLhJa5ZUA8hGUaDk78CF4of5wGEJeifULaZhncab5MeQ6KjabbTBLzAGvTv1N0rkIGuzFsSDpZ85U7Si3VlkTeWcLr3XuI3ka4X/4n/H9YMHUHq0XXlTUT/EiHX4gyQqWoKsBQuaNnz4XyV36Hi9J8MUZAGo0TNy5YvocSLGOsMfxd+A5ndCIjIj+KzSCDC4w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G70E8pa3nHFdyueCGs6MTI1m/vz+pWbb11S/kgQ4AqnyF5CgDZZP8PhFaIS2v94GzVlrKtDgHcur5Vv29ruepWaL8PR8P0oEgcFIF8Q1RRBNTBsvV4L/EFVotH1AGihdz/qo6wtAAIRLgCDIrWEv0PEnVWWrx/l+jOF13MP6gEhAWavo00CADQI9TMgA9mJ5mO1JZpJskiuu2aHs/TKsozSTS/6pUeGzwoSbvGjUoabpc4oIdhU9CS/BWFoqF1V9WyZRlYpXRElHZuOlUYZ3KD5mVyvknI8x8bXrShK/l8s8kAbTBBNVH5BqMzecuejir8lDr0Eje1E/r9EZ3QDYmjbfgmYDFpeeL677bPzt9l/XB5jlf2kasYPV91j6OozGehvDyV/zCLvFr8DoYZo5rphUHYfukLsuD8uoV8FORzQQjVESKLkRPrFKhJ7ozatl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:18.1555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2dde09-218f-4bb6-cd9c-08dee8abd15d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154

Refactor the NPU metrics retrieval code to use a switch-case structure
based on CPU ID, preparing the driver for supporting additional
platforms with different metrics table formats.

This change restructures amd_pmf_get_smu_metrics() to handle
platform-specific metrics retrieval paths. The existing logic for
1AH_M20H and 1AH_M60H platforms is preserved within the switch-case
block.

No functional changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/metrics.c | 41 +++++++++++++++-----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 8ee60d455ec3..5635b1a01827 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -136,28 +136,33 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
 	if (ret)
 		return ret;
 
-	ret = amd_pmf_set_dram_addr(dev, true);
-	if (ret)
-		return ret;
+	switch (dev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		ret = amd_pmf_set_dram_addr(dev, true);
+		if (ret)
+			return ret;
 
-	memset(dev->buf, 0, dev->mtable_size);
+		memset(dev->buf, 0, dev->mtable_size);
 
-	/* Send SMU command to get NPU metrics */
-	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
-	if (ret) {
-		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
-		return ret;
-	}
+		/* Send SMU command to get NPU metrics */
+		ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
+		if (ret) {
+			dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
+			return ret;
+		}
 
-	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
 
-	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
-	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
-		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
-	data->npu_power = dev->m_table_v2.npu_power;
-	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
-	data->npu_reads = dev->m_table_v2.npu_reads;
-	data->npu_writes = dev->m_table_v2.npu_writes;
+		data->npuclk_freq = dev->m_table_v2.npuclk_freq;
+		for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
+			data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
+		data->npu_power = dev->m_table_v2.npu_power;
+		data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
+		data->npu_reads = dev->m_table_v2.npu_reads;
+		data->npu_writes = dev->m_table_v2.npu_writes;
+		break;
+	}
 
 	return 0;
 }
-- 
2.34.1

