Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012370;
	b=eUmUgUrkAVkfKtthQkcjHe1o6FpKSiXX6vA0mRaa9Kjg19xwxh3VBUjNARYMABb3x+Cc
	 i98f8kW8MiBRBhr+5L8hFig/KEXob1k7dLWHpwUaq5z2y4S0cTeB8czeR7atTLYz6oEBn
	 +kEONIciU3GHXqIDpYS5a9coCXFJREVa5dPutv9K81fL07hNg2KVdNlMnMRd+26vGzOOC
	 KlyIGM8ScPuWu8Uxy6z0oYwSU/bC7nn/88LF/2/u34oPbIysDm0Wj5PlTpdU2VtbP65Xd
	 w4skSa5ls69raS2QdyZZwDBa+sO2a5Nk2m0yyQnyvyad6DguWix/e4Fuhtj50jHJJjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012370;
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
	bh=IqqI7TQI6Tjh6es6NgHvCgDvJvkbY5Rji5ulvTNed4w=;
	b=htr80GiikTlrAnZ/kUU3nlYEGfpPLoqtCTH1wNF6lPsPCjIiY+zPUbjf928WsfsVnxeB
	 oCwa/wMiA+WecYSZrUTXpF/BfvjauopK2yyQ8wH8LbWfU3YvbaoSrUI11Ahtq9MAHX/Oj
	 Njf4OFxHbyX8BYurrnljNpaXu0qoqJ8/kEBJXJoCqjcJZDheC+QWiIspale9CInhaptIL
	 xDre7+CEGu5rgVXo6vPGwL/GTZqoJciPSsncu8Shhv142d6kV+iSSmmBKhSIn5tlxwnN9
	 gb232ySkVEUyT6jKoZGbsvR+ObCMhBkASu6Ltv8xySRXo7vMgCy24qDMmy+mmKYCzQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nacZUX1j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.54
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013054.outbound.protection.outlook.com [40.93.196.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18F606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D18F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nacZUX1j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaUgHZSP/VCHBpZzsZ8sT4ZHEISTjxx6UbcKp8c5oSMdZZhnm56Il5nkDon0WAs9bJ8SWTm5vYLuinJM/cESg7mvvvAhBvuh5YCOjO70lfH8JBkzoQU4+a+Dbmw39Iao74EZpR3FTMg6HPSZTn363RPDCcaVvMp2FR3BwmK+tkae8v6g2Ld+/lfjTE91JvU/2CrFvZJkYYJ7EHgK+LtLxp1YUoFJhY3eNAKLLZFQANsoiUCeDhGz3txVDyWN33k9j2xReUjV+Yktt+UHHblS2AXMMuTazRZCWMZulseK4CFCeMzdXWuAzl1rtrMIPDPBd5OInTTK+FLDwQ3jD1tRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqqI7TQI6Tjh6es6NgHvCgDvJvkbY5Rji5ulvTNed4w=;
 b=nzL/Ji8s3bN6t2DTb+aWzQugB2AGDJVmAZO6s+m+mbJ0/hCznGMCq2SHuPIYvUsRiMiPauY9/IJivnzUnJtEof3DBjKcU/myPJJ93FRCj544Ckji7EE5GsQzrF9cOzCkrB6wqF0k1SoJEoEZq+YYRH/L3CBo+8v3PM538HI0G57qdqbXmxyr+3iQH/O6Bh3Krhmi3wOsjjD+UUpAyeLNV6GcEqzRad/ni/MajFVoRWEvBh7T1skUfRFrEpTvejAKchpjhE+HhVH2iZEPbzoMuXyTEw+ofpITqxmsljjw6994YYAwaweH2VxMiCl1HkQ296fwAADM/bzqXZMJSwIL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqqI7TQI6Tjh6es6NgHvCgDvJvkbY5Rji5ulvTNed4w=;
 b=nacZUX1jCGKrxC9KRPlPShkQB1KGZV/Q2xJ2P0l6HkSd6KOAlGy/qTpqog4+a2vg6cxdzTFGIijy+W1M/jB7AmfLN9+f1hnLcUEsg8w5fXjU/msNv5Wr9ZcdSz8vA/F8/5l6WeAwfxGvcomd+/GVQYb3c1YI1Nyxpm9tC7bLVf0=
Received: from CYZPR14CA0013.namprd14.prod.outlook.com (2603:10b6:930:8f::17)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:47 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:930:8f:cafe::64) by CYZPR14CA0013.outlook.office365.com
 (2603:10b6:930:8f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 14:32:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:45 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:41 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 07/10] platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
Date: Wed, 18 Nov 2026 20:00:31 +0530
Message-ID: <20261118143034.3566684-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c459530-bd59-4f27-5dae-08df4580d011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|56012099006|261028144727099003|261022075727099003|11063799006|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261026121527099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Oa8i/R2jtSnnuNfiJycZzbgX+sTGPXQLPAKP6wQn4cEvCT2Fi5012APo6dJkZdJ3p4LLIadraqwOzQpmstxSGYm/R8JMhro/93yJQAjhnPfWLUBW3NYQbmPq9BleNLvZGwTtTIXDXEhRwT+wcFa5nzK5mMUI9Juox0WNcDNqcYFqe+kkp+2dWDyBpLMcCvZmo78S8WLavBLcKfboFNB3sObup/B7shbzF0+JQfw4dXeLlkBrqGitbung9FrVyyY5Hnj7EiTHFu+wIysZQo0s0tu+ZnR3mfBTW8wBrSVs+BklNpAedB7RDOX+XRcMP14UCbpsbY15oaZVIucroFcm+eXILZBhWPfoRLAtH++0OByEPBGW4Ikwu0omfUa3fCvTKUn0QsIPev1chgyZo2l20sRjatE9kWFCnGVD5BuC6ijYRB0mbXyVXvKZlaJEfS6a4JgpTQDdyjaGfa0ygrDkdYjG8Oy+bjeuESRibX2q58Xfd05t/kXTksY9+WtqM+IkCtju5cFcXRMnwMBBZJDwgezKbt2/CU8J3uk8m8fOFkaOkrB2p0GJ5d134265XWypM/sYwa2CzIdwzOyTT6totJt8aD28lZquybzBm+U0YB963Dfc+tiIrlBcLZM3DQFX/Q36M7gx1TGbkYXozw/kqzs+jWHlcIduLEfkE6s/MsB3NT/rW7fmFjfcA7rf6mNW1mulm6rN9gdST9OmZYAGYQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(261028144727099003)(261022075727099003)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	av38EGVk8xiJosUAJtp4NVp6qWLHKTl2XU7R8q47PA39nBkG8Rnq2rPQFffJMhesFfGN+g8OUeRvS9PvFXVI5Wnv/ETS+jh64QyilnfZ8JAN/uhB/DtH3wQ/TtqIQF+HGm88gWZ4017ihgfyOooRqrj5AdW/BbMWcTItI3oozmH5lkQ3vJHk/XXIXEUIP/pFRxoxAw/FtmIDn54KA9GEQ6w8drv1iu4R1C5n/GVHwCO29CoYzwaocPrwC7H50jddK09H2PlMLXvXGJgKbKfIi6XMTUk27z8t8QCpzOpO4uptvI7RZQi8AK82gfpFFjV1SuJkkognvvhGIep6HNGuZGJg/t3eaVtYepA94DWzhYMLqCnPtdCi4qRJuoWC63OuGvx2AQal3eWNttehpPS1m6IAEzuJPGWHznwWugRuMShoUHUe4O9k9tG2DXlLJ1nn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:45.8009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c459530-bd59-4f27-5dae-08df4580d011
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081

On 1AH_M80H the metrics table address is provided by PMFW, and PMFW may
place the table at a different address after a suspend/resume or
hibernate cycle. Reading through the old mapping then returns wrong
accumulator values, which end up as wrong inputs to the TA and the NPU
metrics interface.

Add amd_pmf_remap_metrics_table() and call it from the resume and
restore handlers. It gets the table address from PMFW again and maps
it under metrics_mutex. The previous samples of Smart PC and NPU
metrics are dropped, so that the first sample after resume starts a
new baseline.

A failure to get the new address is logged and does not fail the
resume, so that Smart PC keeps running with the other inputs.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 55c893552050..26ce4132b809 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -12,6 +12,7 @@
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
+#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -277,6 +278,25 @@ static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
 	return 0;
 }
 
+static void amd_pmf_remap_metrics_table(struct amd_pmf_dev *pdev)
+{
+	if (!amd_pmf_supports_accumulator_metrics(pdev))
+		return;
+
+	guard(mutex)(&pdev->metrics_mutex);
+
+	if (pdev->metrics_table_virt) {
+		devm_iounmap(pdev->dev, pdev->metrics_table_virt);
+		pdev->metrics_table_virt = NULL;
+	}
+
+	pdev->smartpc_metrics_have_prev = false;
+	pdev->npu_metrics_have_prev = false;
+
+	/* On failure, metrics stay unavailable until the next resume */
+	amd_pmf_get_tbl_dram_addr(pdev);
+}
+
 static int amd_pmf_restore_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
@@ -288,6 +308,8 @@ static int amd_pmf_restore_handler(struct device *dev)
 			return ret;
 	}
 
+	amd_pmf_remap_metrics_table(pdev);
+
 	if (pdev->smart_pc_enabled)
 		amd_pmf_reinit_ta(pdev);
 
@@ -336,6 +358,8 @@ static int amd_pmf_resume_handler(struct device *dev)
 	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_RESUME);
 
+	amd_pmf_remap_metrics_table(pdev);
+
 	if (pdev->smart_pc_enabled)
 		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
 
-- 
2.34.1

