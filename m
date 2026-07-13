Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F21A353A91
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968020; cv=fail; b=g059TDwVszmGtbutb6IRy/dqKGrsQ8RdqP9Ys6tKQpds5exWx/75rUK/dcGKp/+9gzhdFKYVKwLo7duE15Zo5ha8YY0W8LQh8NQvqZmu6NwKvh6ZktRjGDfmCTPT/V/Ev7lAQiYQ14X8+/ywZ2scjk7p6K77gZPYTq0mJTHwNjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968020; c=relaxed/simple;
	bh=QwHiq1HZLmEpQD05pXE33DqlcBgNU2qaq4xe/GKBzO8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b9b2Y52RITDCxfDoXus4mDcHqK9iJp17dsGezIblAnD8eUa75FQ9fFKzsY1zxym+BvjDkFzQYKKdhvrz5ikXUwaPHvneT2uwazSbINJdz1ahmDDn5F+xJk/2pqKG4BnvQbKy8C1Cb5L5cUA/id/1/sFl+t5xHgZc7TAsW/HnowQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n/bI0xan; arc=fail smtp.client-ip=40.107.200.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n/bI0xan"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3zrfz8BZ28PJa8vwErWjr1BR2e3rtMdbpi5hDx9zAbLrnv7fF6qaqrJpmc5JXjZU+QDWgs+tk0XNeOUV3Eymkgb9WDXLpJLdhSuxZr0oxA3tpJxSFeioc+AJf56y0X6xQAk4li1zCy02ClBMuXDpZmaJU/+5n+aioXkowf9dqPd1mYncNfR5XYZDSWdXPbVzyf5dux3zgx87CHVLaLX0OrG9XsJpEqSfs4zyRYIdKfDallaXq4FSU5k5x1gKnv+Rt2Gw51V5hTZuTKLbtQR+3I4FKnpevN0qitiyaqMd0IDj4Qx8JRFl2uBIocdeZC99YMz4Vyd6F80UqDPAu0asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fmSFUS0lci55cX5jq7q6qJYF376fD+cYGOSHcwotgg=;
 b=YA5L7x5dERdEn2MFof5SIhU4GVwtxCHOyrYok/dsQolbPLAa/UOk37MbXcc6F/BvNDGN8WBTnz14dPYWb8OtRyhv3R5cVy2owB+PjNmyQQUPOXy7bkBo090v1rOAMOCULy611Prw/ajQujaUQqNsBVzuPFa/f3Gftoz7hBwSNwzKyVmCaFrN7uVv7lw38gzdLq7FweqeXVI8f46gexpXerNMOk8T/gOgPJe0mtkq+fV2r1iB9qFLJy1CqC9e0HBoQD2MTsFNk/6Zs7WCR/QNUm4eywtRGppwlNyAz7LMP6bIPZzbkGksg32pdKwY1+0UR5m5vncFPAzXKjQdWyhSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fmSFUS0lci55cX5jq7q6qJYF376fD+cYGOSHcwotgg=;
 b=n/bI0xan2Ur88JsO7BxCdGUFYoT4frMBC8HsTiedDNlm/02qSzBxemuGYMrJTmJporYK7xq5fxBXZo0AyeSmfqDznTf6DhaIV4c4o4V9VfelstP7c+UQRKBGEBT+ZszxeXK/G2fVB777qFTLzEVOPpsrBT/JKnImhnrErwTsYbk=
Received: from MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::35)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 18:40:13 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::7c) by MW4P222CA0030.outlook.office365.com
 (2603:10b6:303:114::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 18:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:40:12 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:40:10 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 5/6] platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
Date: Tue, 14 Jul 2026 00:09:35 +0530
Message-ID: <20260713183936.690228-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
References: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c37647-11d4-436a-4d71-08dee10e2c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	uI5+GLu14d77rZldWX6z+340nETFPaRB4EI3tQHY1PQfCy2DpuSDVsmbA80irzA5JZGghlvElsl3XkfK0xXbUhHU5Rjmm3EDM/5p8EMR8E9r4cj2p9EfYskD1jZLxi5T1LHPlDxfI971XILkSySihxsLkrSwI0wQE311myFwSsXIv3epKOhDHbpcgVBT1m7JbGRPHHfW8ucEDf+FWesKDTXCPKGJn3eegJA3u5wsSqdMjOgq5a3r7bSe4sHNtjPFY9Wdj8wLX8rPESjk13EY8J0VvRKYwIu/qCs7jstZf60xjbCKvIj/Vufqwe0oo6pKVIhf8yMwzbKTUM8hothNk6HT21D2nrXIgp9R6wiVs9LxBCUgZnmC32psdFRcOjWQW1r1vdGINZVQl1NiiDsGOmJPmnAyooi3SarARjGVzvk/CmpNGN4gyk6Foojw5A4f5Fvt5/d2jpjYPlnW35q/ypkyAjtuf4Oc+ml2Zg+4jOlWh15oFDUHAnpnaNnRbU2b2xeglHpRj3H94A1G77FwWcOsbCAbkTMnFaILH+GuHSRA9QXcwlq/mA3gg4xRjHXWjsGe+i7/W/tV6YQofV9iX0IW6TONN4lwOr07f6/iTCEKoMDB0BsKowL3RFBeZE/tZEPCzceNewaOusvcdnPkZvslNp2Ffb7fpy6qkd6rA9hbC+H17J/ylXOKEdKzA2X2N/AmZiDMM/HMbKnkSwxoEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MTROsi3HNXsjEiH/G9eCyla1cM0T7OYFpSGL34uN0rosJCVy8wb+SMmmdg34N428Eyrhv4zTudzYF2CzHl0NgK1w6ssQJTE1bsNOn+FpIE4FHiv2YZVLs2qDhcYrSJA9aQriH7p3XDskn4DkI/wF2FKMhDZhDqMeUEQW3vRqD4P3CHZMdxrtdZM28cRAzZF4tj+kvZEphQRr5993LcCW5C7AmroEW38BEJZCuDa9JGqBgVFGW+4QJSpv6r3Pcond9mCPvP5scxszQYr4L9gix478wgATwdtkscVEdKHtsSqWX+oWO4sWl70cuD6flCWbjqB29tqUst0piEXgu9ads+9sSMPdjdyuHIo4VSicWbmSwRZgB0JkdtcTV3ruaIbeibX9Jcw6S9V3DKO8vsKmwpAIRJkxekb1GJhX9tRDCPGIh95uHJ5p4F+dAJkNC5yw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:12.6216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c37647-11d4-436a-4d71-08dee10e2c9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518

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
 drivers/platform/x86/amd/pmf/metrics.c | 42 +++++++++++++++-----------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 13dfc7fbd420..c4f5f4d36bd6 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -9,6 +9,7 @@
  *	    Patil Rajesh Reddy <Patil.Reddy@amd.com>
  */
 
+#include <linux/array_size.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -135,28 +136,33 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
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

