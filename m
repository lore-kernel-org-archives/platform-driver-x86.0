Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011017.outbound.protection.outlook.com [40.107.208.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68484374E57
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705374; cv=fail; b=bcDApQUlIpZ+R92kImz/+0UzCxt+Q6OG5ceqhFtA5/4MPMM4+GgpfrSj04+L+uAs8bJ+xTIEITzNDFjP7uC2R5tWvvN6RzWuiTscy/Fmn2dyfi+8pb0VqlAQPxZe9OfZQmedVoC6Bhf0ODuyRTY/jAlC2vfy9UOcNJWtZESaBhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705374; c=relaxed/simple;
	bh=lIh1D3H4bLobqOxJVW6Jnb06yaObNTAgtApIjLzmh5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVqKnuwovoUzcFiWa6rgOb1lrMrmAIqCgf2yC6WT6TZ7SGwbjwFbdSKSia0ezcolMINqxGGIWdAhOtrKwisUgQNzbFKZVp/UEQ5hu/Zs0l3y+WgdwfSEaH4A3mWLJl6qo1LiqI5FV6u/S4tIVOuXaky8adaWblC7w8ESMKWhWFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=190hNFt5; arc=fail smtp.client-ip=40.107.208.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="190hNFt5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9eGbFL+ueOSLgQN5rS79ZgAW6hhgAJzIYkMN35TcTdT6qnEn4LTmBpAGoCcICkEA66A5IlFvOWPUr8GeUVWnP0yi4rO+1FazNkzZQFrmXVUZ/DvWAHaZ4nixzDrCSLnNJI94PXe+9y21aOLbSfqBgf0u6/8Mh2M3ZnqDlnuP1rDndfw8iXGXL7aoo3308drLOIReJXzMuSpgoKZ678BqZBAu+PPtr1xXedWqUNGno941zWwZ7B0PBho+LPy0BSj+TzIHB2TVpQUsvp+3jrXZjsUzNkXzJPAxaEJAJ6XilUnxxsrtHMuOWOIYoXJ37U2V6V4W6rxql3us7nngGtrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI+amHMudgmvkHIKGfx9DcscPnTotbq6hT/YV+Y/ZyI=;
 b=rZuyjK9VUGtdJCGx3RnqpvUTOVSaQUfhXjuTWGLFW5eZycQJadjSWMj3xow5B4xOZXmY5431dX96DNUWDurKdXsa4wKAx3nUpitLTUX4AlsE2BOcNLIVwMdsh1p7tMLVG25NsSbe0nQZpsNMw3yXWJYlGodnpqve99MsL8j6TOoPokJ4tuDI80TqMbiZRDxG4D/NpETxqxg2W3e3tEYCWmhSIjKWx7XfGzkS3sWQhkE05jX5rTc02XZ8Pg4fFLGtTfmtltQjP/Ob49XVZpu7/gNqD74aKSbhu7j6aN/TAB6QpyrlfBaVshgr4g1PLEvwv2GXYSge3AFdzhVFbo59xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI+amHMudgmvkHIKGfx9DcscPnTotbq6hT/YV+Y/ZyI=;
 b=190hNFt5xSAA2eag0D3pyeEx02drV2DwO6cyzJJqRqzx0jJX6i5sZFH6JhT5BNozocv5klH++465zg4cJl3OfhY58R1JmTHnFiaEf5xoAds4KoVxgsran+Uwk0ilwdaGZr9NhQVuzRCcUolizut6CdEkU8a5GOjHgD7JAnNDJ0o=
Received: from SJ0PR03CA0112.namprd03.prod.outlook.com (2603:10b6:a03:333::27)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 17:42:47 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::84) by SJ0PR03CA0112.outlook.office365.com
 (2603:10b6:a03:333::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Fri,
 10 Jul 2026 17:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 17:42:46 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 12:42:44 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/5] platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
Date: Fri, 10 Jul 2026 23:12:18 +0530
Message-ID: <20260710174219.2522269-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 68bd7589-d32b-4fbd-2e6c-08dedeaaa787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PbQph+bUcRD+NgxQ3x8hcGCgwHmu04dhE3qRo6SWHAuwh+3bxv64SfDMuiTaTRo9yPv0vGZqZNbcZj28o0aJYGhb9WwRQkscASeUowJo8BFvrFCVJifmAIqarmSRUiSNe0wHiRCkFq3yph/i+PbQhx3pDqpRkQUpYndz1CZVlQUY2YiH1Kao5RqTcWbIni3cpFg+rj/SYK0QDWKnnivjbcB4S4oZB58oY/apyCo/XkiKsNPSDvKys6o8X57ltRCcgoDyaQI9cKbFX+2MxJt2Fw7kbI/VJ7TWFxM/u+zHN87k/7vc2FhedrAXZox7D1DT9KMrb37+/xUW31QQG3AqMseSnqEwIqn3jJEpHAbyiCCW3ZKpDd0XFzTaFfrhPnS2fsUOtB0hQc/wohHnxrjr47WlgcUbWemGGQlF+RLaZ3BNbWQN1aNwqzrCGVbx0EoMtbroW2R3j/WJqtzm3o4HsEGPhFvaX81sl5LcYXnyX0wGoroaUuXB+Pw8i7n0/4ApZmXn++Cnj+f0CUoiYX86ZC9+Kf/jLfbK1YO/AbSjY1yf3F6V2Ol5YnB13u6N2rIETDzit/sIpRaQrHmxBO9PGH2erCUQ6+aamtAWHcZdsq91hDdiKvq22VrryOBXR1l4hOrt6HZ7wRaXn5LA2x2Z4aEXUV7Hw22YFY/DMhb/xgiFdHEkb2TJPbUpS4chNinLKGQaxUSxVkKPimczt5dbtw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uCrVPg4BIwuz+5bo/Fq2illbn3c3MakbM8xno5rV4Go4K0A2NdvmRks7dLyGvQDdWAKJ0MviYP2sqVoWP+PxjU842VmeT1vk5HNFDkOhM3FuzvKkK77jA4V7FuapkJds5uG6+9jOIoMB+2wP8Bioh3CN7qOoPIWft589ZmqIkqsLQdIz7HX68/7gwD5vZ/sxsW1fkXsgLW63gkE8EU15oUiAK4lQ8aPYmWNtdWH5hVHRSlzOaszWxALH402j/I2Nj6sRTPpoyxea3zWw3esoOM9bcTibKDrWXq2GY1KkTjJJQJhZjdozdkHCvo7LTg2O9ZbAQyry2FPblEYYRNqV0cbtR2Sij3NQDJhOu2t8uOfpc+xOFczLNj2ny3QV8Uj9rMpAfbUBfB5I3PAD2HXAY71c0mLpQZZECZQRQHkR447JK0D5z7DGLdl75Bc4ZZCk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 17:42:46.8935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bd7589-d32b-4fbd-2e6c-08dedeaaa787
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410

Refactor the NPU metrics retrieval code to use a switch-case structure
based on CPU ID, preparing the driver for supporting additional
platforms with different metrics table formats.

This change restructures amd_pmf_get_smu_metrics() to handle
platform-specific metrics retrieval paths. The existing logic for
1AH_M20H and 1AH_M60H platforms is preserved within the switch-case
block.

No functional changes.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/metrics.c | 42 +++++++++++++++-----------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index bb4f9127c655..5a8ebacbc3b3 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -9,6 +9,7 @@
  *	    Patil Rajesh Reddy <Patil.Reddy@amd.com>
  */
 
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
@@ -134,28 +135,33 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
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

