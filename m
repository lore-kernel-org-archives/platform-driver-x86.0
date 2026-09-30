Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6851A726
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789091; cv=fail; b=HUoyUfANyMTEGynLBLA4+1x6q2FHBEu43u0YSm/Wy/WshSHrkl3rexViSRNPKz1jC88MA7qqUN3oMfR9xC//X89nuPDh+oQ2tf2oqWCDGSN9XGXxSpWwvl0HqsKYkM0J/fZm1DymS4gmrH9Tk1zPqIJW9woGyDj6m49ldBm6i18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789091; c=relaxed/simple;
	bh=yFgs7nWa4I65bnfh4sSyD0RhIYbzd0qvAbZhzUZfv40=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D0W55twcIEnxDGZBzhWZD3QVHR9cRMn9vI8tYbgEb4ffx0kigriPc+e6PHPvxW0tLM4ugYzi7p6lq2qklPiOVDlAU7i5bcmGu2yKPKX01P5wYPYuD472q6fOhAqXsB0Vx56Tt3Gp4INY6/7/YscDYoewzg1HMP7M3cqI5fnk3YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SitvpUN/; arc=fail smtp.client-ip=40.93.195.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SitvpUN/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1DfVuYFMwjD8sJNL/YpdAeg4QOp+spwl+QWaCIBznQnBitL80xHrbu/hgqEWpDXDhc5Iw8yUTj70YGzoOXitC8xGIqYfP40jqbQWlsQJJ5KO9cloxyoYw3WKKa8NMJ45fR3DrgsFGizTG9NHS2qjfgVzZfvYij78eGSQZ4POz4dmUwCq4m5eEzpoi8TXR7Eto+ffhQMjmMm5goRqxobu5ozvqOkrmTghXCpN55dFtV7+haOgqbYioRcp4m3zVRxuVk9QfP9+N3qKuDLUBLOXQhPovZ2eiWcoIpodDowQY0NlfDCmgcWINnI1BVbA7MF1XqDgu+4GJ8CwLpQ5y/C0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkpuPhS6EKqN1cWTwmRFWij2P/eEPdNOcl2bk3MWGik=;
 b=XJARokUKAGyYRmP8ecVazxiLeE2uNaagvCr7H1uaWqzd4j2NbAy/Fa8yi63z0oqBtUSVawaB6kKLORUmuHliLqJ6x+HxDLnPC5lKoaKcqAUEy4knm13IcKWydhB+kA6NSmCyDwIZNLpqxCt0+oUCiwQ92DoGdPhD+wQWzM1NANGVZcomUwWjTsy+qPe2j2pp3L2BRKH9zYK+Ke8QEqPYrT9cEuZ9po4E8l6VjI2z2BCGd116lTfH74uYQuMRzWkQxxNCWffkW6eI1K2xqVGpgy0TF1Fay3s6JGO0v0htorCuwu2adacbnN83RFErsGdBV2mvEkGytQqSXw3tye1KFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkpuPhS6EKqN1cWTwmRFWij2P/eEPdNOcl2bk3MWGik=;
 b=SitvpUN/qwUYB55QVBn5+Hy9FFjtftNxfCM8YUQ7aJ39KZbt5yQV6SzRoIctNoOhlWUP9fpqqG2vfvfA3QLrQxSCwUonkZ9AWElGgOV6mT+VTlh+vZRx6Cl1ej5guLyLoSBP308C1mEp5eWrMBALvwOODRUakFqnsI9x5wUMMcI=
Received: from LV3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::12)
 by IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:24:40 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:408:234:cafe::a0) by LV3P220CA0011.outlook.office365.com
 (2603:10b6:408:234::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 17:24:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 17:24:40 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 12:24:37 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2] platform/x86/amd/pmf: Fix ACPI buffer validation in APTS path
Date: Wed, 30 Sep 2026 22:54:04 +0530
Message-ID: <20260930172404.3506849-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e351f2-ef7b-49af-a832-08df1f17b5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	1R8DSfTNWqOWpVBDO/YFMF1hEKl7kNjicBZvWEOhqX7USCyW4jJikyB1XPBm6XK3tnywhI/1UaWLRTdk/xD8/EPKJDPYkbMGQRRvLIBa2cqZheLSxG6BKC+PnREopxquXWx5qs9TCBhVLqL23MGDqPCl0q6L9xvxJnqbh+WxuQywGZQZU94IZlWgK5A8hV45PCmC1zuHYyb0cNkMxfZ1tw0smwVuhvFOArM8vX43iNhwXMYbcZQvCceAV0PveHeRKPmp6yCxXX1zudIhDQiG78PtIw/yRMDGKD/OpGO2YVF5IWPdADxjlNXIsfHc8rbDC50u5WZNozl2nXhNjBOxmdCULKkG+a7zDxeuU7nmwinmwXpjaXhpNJO655dPUlMqfvtROEzKsA60V8SzF21xZUXtLHZLRcFDSVUyrtffHib0CoaRLVGI31sM/1dqcRD5Lgo6Ptx40wHG6lYHOzRLUmtu23vMQs8+wTyai7hQwrPR15o4bVAEF3kPKTTdvkXETJ1cW4AgUNsKz9hkTr0ZYR9hqzZkfU2xXG5tcRQEhugSCkwypuf5W0+2j+5dkcI6fcYAsA9vhGe5GfTJKS83XzUx6SSI3Hpv2khSd5Co6DcDvUPMQba0AFJucNL1SSWVHBFWBrBeKJ3q/e9cPdI8TqiXC03tRqCvcop7YEcJlg7jFgkxsmayOkP1++cv6KuOdrEkijL2RqOWDhm7uNvmmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rv5igefLGod6eP79ATiOgqir2yOzwFQZi6WAhgBHfiC8oF8LHS4jx1GpUSXWFq8iuivGtDPZsk+0BQZ0FEBSRBdesBM5VJxcZrdQD1HNqV1tNKFpqN7kfI1FXjaw8C67QbS6V29HfwPa1QfyLyXUTwRVAGof/sGUSiV7AjFcYtfjrybl3TqtNYe3pfOeqCmKPvKm7V/Cz+jIO8baMHyOOrrEqbuJ1EYqoIWfDLR8u5z1M0HYdu6/6VI8A5psmK5+/Was6HiFle+zziuCnfkccdrIWQA7ohbThjR8+NvetyKtA2Ibi8Vv+nSOeusaHFQX4G//MopGj51w7Vysw3LoJDWZJu9LRcjc6jgAy5LieiTgYSoKwpLfd6T0nGhoM8lsKkfRAMLiPcDB9Ot3eW/JmlbPc+r/YsD51hTy5BROWUdI6dovfzfMr48+NHdUlmKJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:24:40.4192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e351f2-ef7b-49af-a832-08df1f17b5cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329

apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
without checking that it is non-NULL and at least 2 bytes long, so a
short or NULL firmware buffer can cause an out-of-bounds read.
apmf_if_call_store_buffer() checked the length but not the pointer.

Add a helper, amd_pmf_if_verify_buffer(), that rejects a NULL pointer or
a buffer smaller than the 2-byte header, and call it from both paths, so
the check is done consistently.

Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Add a helper function for NULL pointer and buffer validation. Reuse it in
   apmf_if_call_store_buffer() and apts_if_call_store_buffer().

 drivers/platform/x86/amd/pmf/acpi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 3d94b03cf794..efad01a4ed27 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -50,6 +50,16 @@ static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct
 	return buffer.pointer;
 }
 
+static int amd_pmf_if_verify_buffer(struct amd_pmf_dev *pdev, union acpi_object *info)
+{
+	if (!info->buffer.pointer || info->buffer.length < 2) {
+		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
 {
 	union acpi_object *info;
@@ -66,11 +76,9 @@ static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *des
 		goto out;
 	}
 
-	if (info->buffer.length < 2) {
-		dev_err(pdev->dev, "buffer too small\n");
-		err = -EINVAL;
+	err = amd_pmf_if_verify_buffer(pdev, info);
+	if (err)
 		goto out;
-	}
 
 	size = *(u16 *)info->buffer.pointer;
 	if (info->buffer.length < size) {
@@ -138,6 +146,10 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
 		goto out;
 	}
 
+	err = amd_pmf_if_verify_buffer(pdev, info);
+	if (err)
+		goto out;
+
 	size = *(u16 *)info->buffer.pointer;
 	if (info->buffer.length < size) {
 		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
-- 
2.34.1

