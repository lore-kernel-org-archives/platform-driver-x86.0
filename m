Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012352;
	b=w/CmW/05qaD+BYhrwkv9qt2FNTdeBMD3TNDbU40R6UW9kksKG54VImekOePCLcEVwKiF
	 Tc+3j9D2mylmdE31Jr2FlVHNPnmBwIKMbgXRReUyHfVFqkqcNgwFpl91uh+tOHiXiBP/c
	 TaakQTpure5b8IYsG9WXBV0VVpbCeBG8skWsiSAmZF+7vmbhqfOADqycW8sVjhb6a6cZc
	 SssuCaKR9SvfPewCeA7Z8VYtochTRaCWCkR67DyQTY7WT9A8I75Oc/9/jyjuUJeLZ4POI
	 UkaTh28IbCtg7kVuFpPWXytWrYDYed6EcqJVFPAZbBrIqrCuAjyY04lA4elF6YUS2HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012352;
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
	bh=CK1E0/Wga7pkg04Z8NvQQjK8qcLEmJBhopH/7APZna0=;
	b=URyAav1rK8Don1G7dKOJTpEbw/3vJO+YRPkLABXQWQuUmKwjFAMdWSHk8Za3X4p4o41/
	 bWObTX6aIzssnk9dl1n4Y3thLGa5fmWjcerm+L0AySVrz7CusWe2iqLcfExRg0AykTdwc
	 54jyZV2QAyh70eLb1sTMVWheoEYRJ0fSliHa6D1+copQ6TKsCLAZFdYm+IQDfQgMy0/rM
	 p52RUvP+W7CKqvEPYhriVGSixw4x8ykuLxNSE6oCoLedvo64/g2JwKDcVf6k4elVVgOdq
	 +EVN0nM4U4q/9C9eNpdayNd65Urn0ojCecwuzAWZ1hXZYkULV/BveWqsSSCc/Hp+d7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qpzlcatW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.18
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94086606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94086606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qpzlcatW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XifR018iEFwAvD2/+tKOKrBo5g9DW9PXziNxPpPe50c+mlnJ/MtnISqWPvz9ily9u07a6oHIqM+C9Zj3KjYegBR/K5QwuT/oEwt280gMYXXksFH+cc+rzmXy1Kn7lUM/JgebTBHgze4TptR2tVev973y4Q5pWGBnN+8uDTTKwltltIC1SCuHABYjETcKDH5X7OPcdd5NLTAGeMN59MxSycmaLHxj5ijsp59YbcsmfmmrNVStleS/5y16PsYHao225Rec7gVoPidmvw4ZS56q8wXvu4dwiKHOqewJACLStVhCx+e1ezDHo+Phnkafsy7/kmYbBVgEQg8Et98CtFlL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK1E0/Wga7pkg04Z8NvQQjK8qcLEmJBhopH/7APZna0=;
 b=iYD1qCNaw0NGXq5y5/E+VCJC6lD+yXrycm07KL8WNJ5RtCJNPvFhfi1fM7ylnrdUOz1T08IU8aYx4G0HpQXGvdM/5rxV1aA2R7gTsDTHJ61vcIVtCcc5yCIvR/S7e2YCqYuwdQWUUhSVMIYF5IKPwmUx+jZy8seGyzwKFNBwfGRpm0XavzWVinSt1bNSwpiZxTIaRSv+VCjHCyq1TqiDbDZSJH1Dd1SV06fVzsyu/XEo7UmgGvUgc7Jl4E7GDl5PlX7NQ6lWIU2LcuobQLvvSF+XndiWI4murQ6Yw6xVwubXs1YSx+2DOn/nRBYtlwtIK276LEnfW9OCJFSRv7D7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK1E0/Wga7pkg04Z8NvQQjK8qcLEmJBhopH/7APZna0=;
 b=qpzlcatWFp0oDAt905Aqlb2fC+nBLk8bhhOKZaYRG6aDyMekucgQScbHT9DfPX3VVxuzPCaDQIWbaugyhd4hai5h3rx2UW7hpeJ9J6PoB7xIa3gtS6jI/nVrweWIFGMXWtPbAnafiCdmoLyX6YGhnmtpVH1jFOe+CPww+/hYA4w=
Received: from PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::17)
 by MN2PR12MB4158.namprd12.prod.outlook.com (2603:10b6:208:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 14:32:29 +0000
Received: from PH3PEPF0005961D.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::66) by PH7P221CA0018.outlook.office365.com
 (2603:10b6:510:32a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:32:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961D.mail.protection.outlook.com (10.167.243.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:28 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:26 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 01/10] platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
Date: Wed, 18 Nov 2026 20:00:25 +0530
Message-ID: <20261118143034.3566684-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961D:EE_|MN2PR12MB4158:EE_
X-MS-Office365-Filtering-Correlation-Id: 15098e07-346d-48e0-4c6b-08df4580c5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|10067099003|261102123227099003|11063799006|56012099006|261026140227099003|261026121527099003|261022105027099003|261021123027099003|261022075727099003|261028144727099003|261021121427099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WwLVXzxWGV7IK8gBp00lJ00jvsaaBs/QEysLPzLHuYcWZhBwYDUj/oIW2GEpab/tOtzDhg9q5ft6+AZUxyHQetR6q7kDPPJ5YCV6pHlWp5NiAzHpClTUSvCWl16SnmPd25hxBSFjoRABUjCvTDZH9d9b1V/+QRtLjvTlbr5eNo8sX5jfdP3uiEgFjaHa8mfToerrN2iYZxM4uDwT1KDhwP3C0TLQvB88OHmMYTLMfoXWy85gls0xUsckcIkInlUMdSZxIuiNsX8Z08Xz2mWqhObefLe8uZwofAIIcLhGrMMvpCfLMDv9XsL2DnmrafHYcD0NWHA1ejaOGunZ2MQKLlFJkYSd9btErDOoeKiesvLo1TPVGF6wdeUkviqZe/NCcgSV255RDfQGz9x9jpeRn0hGRkOa61IGy2iaSxWnQ2VnZIB/myql7scIVMvUM6cXRvb0A/WHSDx/kORUnQtY+8WjK1cDk2bu9Km5leie3hspf9A8F87Fpalqcc+133fZ16KY6fQPwwkXH5Ypv5iN8+Oj61xQI8n/qwfsR9NYU9Pn32hbLgb35rYPpwJHEx+0u0vFMqg2RZ2MrSR09I8DkCymKh4ujM/Y+Sb0Uk20A5lUFPiPpKJ/pH6PI5WFCH0T+bHRdS2kauY43zVZmkf9gpAxOugCwaX7KfpYOIGRrqfPbdzgteMSBOJdZAJ0qrIbGht0lIg8xjDDHuMkWRK0CQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(10067099003)(261102123227099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(261021123027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	odMd6md2roQjpZPFmfNEZs83vlmA4xe8ttvPkTOKR7vCMkYcht/9NUz18FWrDLLfmRJvzyAX1/1Iem+/QHuT/4OajmNp4kpP2syjvIujoSOjja3xq1jmxW3STZWhPkgKT1JXbU17hSxdZ+RxNCaWE6PtwAN0FvbljB/a0EQsaXZT/kUdNllh2vdJ7xJb6cFU4ZhR6zmLH26qKySyzu5ERfSXb2pmpqLRY9NsPsWnZP8wOWf9pGs2NAl137/MsSplbYAHDMn8SggmnfZkosTGRDt+fNXuAzUDjtFWECzLj4LBK9dcMhb5lGJmYU6356wjzx2xlYQsw1Jxk2gegfWu4mhiSTsHWzDNV40JfR18LdQmfVfqCBA6HjFBFXbnrf0ksjqMKVN1wbyydnw0BKkb1xR24qs95pUUXqb0Jw2LKOt+zcgmeM8BLqRfktopGS02
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:28.7646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15098e07-346d-48e0-4c6b-08df4580c5e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158

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
index 5c0e368ec8df..bf6117b4d742 100644
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

