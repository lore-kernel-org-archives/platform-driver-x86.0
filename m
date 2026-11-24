Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795507007;
	b=Dt05Y4JFwuURRkcrGjAANH54a+CKjnXSuKGtraw26kluirS5lOyIC9qSueHGxLBo1nSn
	 UHoDpCkhFN4f72JnXZsF9cKxHyAcaw73Wyf2BWcScmRD+LnpvsEcDxeF/+G92hFD17/SH
	 JAl7fz6nApBzBWKtyg6O+KkGAJXWphT2I2cyEy3C/TJExFRIvAJiwvDeZtOVxtJL++LBR
	 linGwZ5WTb2z4PLA+Dnhjo7VgTkMPcjjZhrQEex7wvx7fAk9xRlV5Ug6n6Lqee9AOMVKI
	 WrXCxg7rsaA1OMfdwky5k5auszn/OJ2mtLo+SuJQRh4kmZl7LufBjF7RAG3egyYxFjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507007;
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
	bh=xtWpcJUXfu5EkRDB1B1nw39Ks7cR2UdfCBIT+OT36yM=;
	b=4Fb7T9HR5U6IVW9/jMzueEy8oTejpQawH4nRVf1pubXKzfPLxI4kmt2NLjjwPVcZqKXN
	 jZGzox5oItUEG3YcPoi7m4H1d0NLJjyQmpUMAM3ZKC7z/uNzTu2tvzoqndUS9p0JlIm+Q
	 eh55twYshDyyPq2C8yDRYftXMDZ1X8gJjqpJruz6c7KMKMm6eAfnrX6tP+1J220Eerai5
	 jIY6GJNDC3XhCgh+QpPXI3zs21vOO+e18DXu9AszEq3y2DrUwiDTiv/cqEh0QBdz0F2pP
	 awOZhgr9WuBsG3c9it+qUYlBsOc3dpm4D5Aq/R9L8nxU7sKnd5ZDeB7d2IY17M2nx5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rNAqDckD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.66
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D4606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D1D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rNAqDckD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHi/o1xzICQXBQLCVwZsT4Vo2RYi0QPRL0tH8gK/fiJW25j1e0msDbHL4W0Of3NjunpDWmB69QT2vMZCb7KtvwXnLyyZvXyVhdDc3TU/pVhFCEFDAj6PECMhhX4KShYOmtb2F/x6F2rBsv+IuMikjBVyCo9WfCH7KY/thEx9BvyBtk5xfDqBfNgfORQl0YiRBbz+iWUyqvPwZBxise8pJlkLZfWAQEt/OqU0hiYtqS94KCochKpDwSiXTSHQe0o0HweCTPRJBtDjvVItzNfAvbJWYn5fnOF6rD2sX9hlza0JjoN4i9WyoA6LtaJOeDgOtyx2sDAm1cvRDYGF17DJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtWpcJUXfu5EkRDB1B1nw39Ks7cR2UdfCBIT+OT36yM=;
 b=WuvYxa0BqHYF/L6YDW1k/K6A2PVGjWQynU7BMjOMR+FmKnb7ODSdxar7b+lw/YxOPx3GAPapDmFwXwBTeGtE4wBiyjv41lLN5nUE92OjDXo/g+uUD7OwPwu9oB/WiBnHyQzwwmm8Hv8J6rBpsUcva4bnU0/w7cZTA9JDg3M4P8CBwNO0XuXwCoaboMromEemn6lJ/ZphHGJKTAZPXaY+Jh2ukafxlJAv6Bj+1/j8cxGib6HiPw7U2c7GKsz+mEf5Ks4C2NAYvtCc+rbOtxycnT2JfgiH4piF71XJohRSwOyF817apybisQ1t4gTgb/ZrpGXvfelqu6S5t/5ldANbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtWpcJUXfu5EkRDB1B1nw39Ks7cR2UdfCBIT+OT36yM=;
 b=rNAqDckDZIvzXtx0Lau1Mc3GT+4nHRLxI6II098GC4HpzvYO06GVbPr4/SMgYXabCmxikAoRT7ZSXstOReVnCFgAHNjG7dJ1KqDbo+KAlTcov8dXx8gR5zWv4AC07BFNZ2Z5/p+ukhUg87bAQ+mY3haiw0DbW7uwWUyEkEKkTVo=
Received: from MW4PR04CA0385.namprd04.prod.outlook.com (2603:10b6:303:81::30)
 by PH9PR12MB409658.namprd12.prod.outlook.com (2603:10b6:510:412::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 07:52:40 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::2f) by MW4PR04CA0385.outlook.office365.com
 (2603:10b6:303:81::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 07:52:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:39 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:36 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 01/11] platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
Date: Tue, 24 Nov 2026 13:22:03 +0530
Message-ID: <20261124075213.2317127-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|PH9PR12MB409658:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edb0ee8-8fdb-4859-cdc6-08df49ffe9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|261009223027099003|18002099003|22082099003|3023799007|261026121527099003|261028144727099003|261102123227099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YIRUO/jOHkcupSaDpiSZXRywlFA9tZEkRPboTTZf77CM0Ua42q8g3jV3KoQMPms4RASszliGHgAv7iIPkBDspWKOvcASevEIFPLgDGv5qeSv3a/KZ681wmaKlltr/8hOhq8UQx8kdXGjezQ+NfOJxSfeXuR8tHKCjJd7F0DwfdjVWswju+X1pDYCdTG02eqBgN4jM2XaVSirSntAfVCoflxMv+71MfVK1xr/4CftSicPJ7cRcsK9zA5SXgH7kLtAwM/TUdCSKuDuAlJjwZamL1slXak+OXpjYInqXpgGzdjMziILY/39U4TQuaksn/ioPdwNYlp5O2iMk9aB1Jt3TI12h1HtQTyCfrNcJv4m6trwAkwel4vpKT5w+I2rLzUv2fOCvMcHdozj0+lspAluDTQ23YcsTMhvW0p5BBwK10Lk89grLYaLRd+iobHRtgdV66UgZO2dGaNL44NQQkebrz2Z6Whw7cr4NpcKtZ0zWEUGxcc0ZpSWxvi979R33nNUG7jHIwWl2AqlOcIQ6pLEPv2Y2O+ENUlscJDKxjcrzu67PSmzu506gDj3W5e8bmulj62qppFuIrc1m8JbOtTaQmoitfbwW6oGRnaLRRejAGu49HPtqX2snZTxdpO8HKEc3Tj15GTCgO804sqMTfS5u33ICgaYp9/wUaPHO4cx89vnlhyIOCPQy/BhmnIKiPLFePcO8s3VnUCfZLqsNECtNw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(261009223027099003)(18002099003)(22082099003)(3023799007)(261026121527099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zN4u0ftKSxMH+Ygha84hbesw0UOtc0ojf1VBIVz6pCrfmcTHycxUGYEZu7gHTA1U78ZXXRWZyyA580O+ij1kRY49OX/soIfMGhkyZctzoP9HFrcZwzomaGJ72qStT/Ti1vTrxfTvgc5gVd7sQK2tSF+9MQKiuSBaJsTU8W3BQ1JlQHuX52PHS/HcfvKRe4NHkNoyqB/mjZY04MLNXbt4w/8NlU5580JRkazGXJqfVM+YLEy5fmY2KPLY+fEkrSj/TTWnchvAHI84yBd7MJTSAk/v7VJD6KXiOO0+jV7Xtj0HdjDK9bj1IUCS5cNIpUlrK4a64eP1sFpXA1iwTF6kR1CD3+6s9SaUf9LzV7p3X2jp6tVWFwLkG2TKsT8WKp6EoUL+fS6qYS6RYXnkr8RHjP7rIyEl7cPMF8OvBPf5iugA5ZPwq3InJjPI6/mys2wP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:39.7359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edb0ee8-8fdb-4859-cdc6-08df49ffe9d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB409658

1AH_M80H gets the metrics table address from PMFW through
GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR and does not support the
SET_DRAM_ADDR_HIGH/LOW commands used by earlier platforms.

amd_pmf_set_dram_addr() is still called on this platform from the
Smart PC and auto mode/CnQF init paths. It logs an "Invalid CPU id"
error and sends the address of its local buffer to PMFW using message
IDs that mean something else on 1AH_M80H.

Do not send these commands on platforms that use accumulator based
metrics. The buffer is still allocated, as the existing metrics paths
use it. Add the 1AH_M80H case to the size switch, and move
amd_pmf_supports_accumulator_metrics() to pmf.h so that it can be used
from metrics.c.

Fixes: 641b41a7a125 ("platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support")
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c    | 10 ----------
 drivers/platform/x86/amd/pmf/metrics.c |  7 +++++++
 drivers/platform/x86/amd/pmf/pmf.h     | 10 ++++++++++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 926de4de2cdb..19b75609f554 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -68,16 +68,6 @@ static bool smart_pc_support = true;
 module_param(smart_pc_support, bool, 0444);
 MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
 
-static bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
-{
-	switch (pdev->cpu_id) {
-	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 6bad7a409ddd..4e9e39e0816a 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -158,6 +158,9 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 			dev->mtable_size = sizeof(dev->m_table_v2);
 			break;
+		case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+			dev->mtable_size = sizeof(dev->mtable_v3);
+			break;
 		default:
 			dev_err(dev->dev, "Invalid CPU id: 0x%x\n", dev->cpu_id);
 		}
@@ -167,6 +170,10 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 			return -ENOMEM;
 	}
 
+	/* Accumulator based platforms get the table address from PMFW instead */
+	if (amd_pmf_supports_accumulator_metrics(dev))
+		return 0;
+
 	phys_addr = virt_to_phys(dev->buf);
 	hi = upper_32_bits(phys_addr);
 	low = lower_32_bits(phys_addr);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9f64ab833c08..b29c5192d878 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1105,6 +1105,16 @@ static inline int amd_pmf_get_power_source(void)
 		return POWER_SOURCE_DC;
 }
 
+static inline bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
+{
+	switch (pdev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * fixp_q88_fromint: Convert integer to Q8.8
  * @val: input value
-- 
2.34.1

