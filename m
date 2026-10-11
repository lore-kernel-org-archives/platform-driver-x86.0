Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB8142FCDB
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713243; cv=fail; b=O4L+YMNH3vf7tRgNg7CZ1annwjWZE7/wiu8li46LCwVksIHOl0DNne3k1OJ92YW4tkCmxW3yfEMJcx/I2nqCRWNjTVCUcTv0sfNkFLRK+LhC/3HYV7ZHrVIu+Z9W2PkI9vuvaGN1Wj2SZ8BsRjZuz688ocNv+ZqtwEAl7m1q7Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713243; c=relaxed/simple;
	bh=q4N0A9ibjDISeGXLkm+yC7muUCXmtttYcUy+hTGf83Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttBT4J+1LMarS2Dpzhvi+4Eo8Jnddh9aMk6OauY/29XJA893+asPnmym0P4Ek6QjdfRqGMAv1alg1Jzy8r3/yufHTvn0suc0RCw2qxvo3knJruKfbZAqpauu8qwVIaH/QvcCeutVRLcJd7QSIGHGoHdvYSXmnwpAgXSrGuQIjDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p86DlJgD; arc=fail smtp.client-ip=40.107.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p86DlJgD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROV8zVVf0YYo4d2a6rxbuHrJaQgkcronu13RPr6RnZuSDsuPO/tdgBWfUDToY+3KZ+FfzpWg2Rl5f1eREk4x2cJQ00TbeOAklMIHuUyucT2Ln32M97EunJ7AMNz/5R91kYf8t/l6kZw3B+Y5uPsr88D7vRT75jXpZnHZPozOpSjT35GEulJtoY7iRfyQnfw7nCKIfuWFbkPgBLVAAJGq5EgoxybKvSkerewinjWq0TjH8/Q4k3rKa97jL4FxZ6U2QPTMh1h1JyPlIToKiW5SH7P1xN8Q+495kK2TBGqxMDkQsIxHCQGRxkAXoSX2+hFKFn3DzlM863NahrXCpVW/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcSRFLwVNfwDpj7z7HwIlHXaYi5Rve9SNgFSLdYB8ws=;
 b=T/GG7bCU3mZFmv2fvuHLJ+ZMVYMEgueHs5wVhQZ+o63xVIRRA7wvARffciJdxrE/8idUsYpKTJ6Vh6dhaKv1qMDlQT0gf+b6PXoKjjLgjVHLFnE/H2iEEwnkN3S/yRA8k6PvikY3oVOz35D9h6swCeCtN91eTvaXf8rXBySyVfBK4Lf61oRnb4UYgubW5kJftqrGeaFvvpDIEbV9Jt8P47aFDoifqAsU7ez9PLaKy46oSMEZ01p6KVB7L8K2Zqc8wbbXxaHfPyRKBkirEHIEZ7IUMtKYcrMMHNngvDu+H4VHKc1D1FcILJRGAtkeDp/e70ML4SGSlietZfEq46/o0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcSRFLwVNfwDpj7z7HwIlHXaYi5Rve9SNgFSLdYB8ws=;
 b=p86DlJgDO2NzIYumPAW9H1wjfThSIN3YKrzNYzkGMHwrF7wHHh0ND62ZFR1gvqHCb7MfH8Gew4dFtfPVq28EifYVLcDP1uVCj5SZoEgLVLIwSrejfa4i6Qpy/S3yX6oOq0leIPsXbi3F5+BXZ9jWuPCPHx1WJ5kvTv19ok5u+y0=
Received: from BN0PR10CA0011.namprd10.prod.outlook.com (2603:10b6:408:143::13)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 10:07:17 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::41) by BN0PR10CA0011.outlook.office365.com
 (2603:10b6:408:143::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sun, 11
 Oct 2026 10:07:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:17 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:07:10 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 6/8] platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
Date: Sun, 11 Oct 2026 15:35:52 +0530
Message-ID: <20261011100554.1841309-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dbe5ca-a481-4d48-b553-08df277f6e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|22082099003|10067099003|261009223027099003|11063799006|56012099006|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	5pRTX8DCIyCYNllmtgyZ5ILiGddgSpgLzDE87Fe28mRF1y0wAvbNh91YLsI1Im6zyNKnNAjlDpRUJjfDn4TU280Zgw0qZfVauL2YvrfhaMVLSNUlbNvn4cK4enXK1qChuWry1K4a3xYgbZDrgkDfN4XZLuc8IIYojmkASZ0rApwiNEooVAYC4YGaWWSeJQ4JT0yaVTLbi6Czlarjxw1HfVOL7//VmBCoozaCE2ny7mXKSZfPySjEQh/xeFWu2bZDIrwsEWe2wRwTJQK9UZ2uRYHIG3vKSew8vi+S8cqqlleZLtBnzLQUwuwBBPOnZzR9b5xMz0lO+pFtjQ5WYe2K0HsdGm3RFso+ypyushtqZvFZjzqmyNtm4wLcxYxVY/5Yxg0xMdcySyCPFyZGM38zJLf9JgCpBKFadINiC66d7igqq3EAZyWiVjuNPB8kHoYqy950GFIseXb35ft8Vms4koYFGf9twhPNCD2wl6gDV6UEuQsehZWaum0RO5OpFrohBuSAfo3wEovFEfWL4jRVYpY6NlT98A5326b9RoR5VSgxdPWnpd9opCiIWZtjGQSQJT3QFdps76IYN7OWZe6iCqG0op+uUHsfFDrBJruOtO2uiLZ6LWnNVOyxX70jt9kTgsHtVVWt2du3Fb4P7onEcfLpiWNnneunW0U9gUXdsA46ItzCl1SE0FmS/YIP4HygacxW7VMDp1FGo+Ja6V2U/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6HKcnZCrCq1ExMXKXaw8BSrTS5yZKY7Q9OQ7yR4j29H7ByJqcpIKtDU9lkQfRsgGq2VYRu6ZQ7EPiRmsEPH6KRE+sZtXXQRbt0Jz8O4klcwjy/mqy9zQoTCr5JYMaxExAkxDLAPVVr40KfyLKtBYNstz63LwkWBq0d2ZOYoWtVBxLkJOucjEgiFqKjWW8qlioNUf53Z49Srro5rVjAudxp/4SnpCGcP3I6nrtB83ArDMWF2lqxet/BL9R/QIXFqEcXlfNZf1Jg9RtvJetGRBLZcy0It25z+uP0LZPl/QE21pjHX6DKFd3FAirat4/AVhALSWDUrkyYvNk+5u26LY1wseVNn3Y92linxY2r0mlmYP/bTxiHfSteTPETIu4PnubK/4IRl4phHQAF4taa+KMB0l4y4JZEEPqW2VWFi/Pxq9VvYn4UI2DGPv6YRit/IS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:17.0579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dbe5ca-a481-4d48-b553-08df277f6e13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413

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

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 06b7f9f2cda5..3d9029351041 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -277,6 +277,24 @@ static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
 	return 0;
 }
 
+static int amd_pmf_remap_metrics_table(struct amd_pmf_dev *pdev)
+{
+	if (!amd_pmf_supports_accumulator_metrics(pdev))
+		return 0;
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
+	return amd_pmf_get_tbl_dram_addr(pdev);
+}
+
 static int amd_pmf_restore_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
@@ -288,6 +306,10 @@ static int amd_pmf_restore_handler(struct device *dev)
 			return ret;
 	}
 
+	ret = amd_pmf_remap_metrics_table(pdev);
+	if (ret)
+		return ret;
+
 	if (pdev->smart_pc_enabled)
 		amd_pmf_reinit_ta(pdev);
 
@@ -336,6 +358,10 @@ static int amd_pmf_resume_handler(struct device *dev)
 	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_RESUME);
 
+	ret = amd_pmf_remap_metrics_table(pdev);
+	if (ret)
+		return ret;
+
 	if (pdev->smart_pc_enabled)
 		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
 
-- 
2.34.1

