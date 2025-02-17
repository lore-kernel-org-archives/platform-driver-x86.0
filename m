Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7819259D
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780365; cv=fail; b=Fb2o77pfj/EiiUi3KhU7FiiYZYHe8LrOrqoKKEz34FZzNpRJVplJsQKkmrAlB/nX0v58BPQinEnkabcKf6t50GNxu2KEbHZfAeEOXulT0es/1S8kT/Fni92r7usq+eXSm+o90EW0GfqtTVdixqZ+kpa852hHV8xge28CKZpOyLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780365; c=relaxed/simple;
	bh=O2YoVxsm6lOY5Co+syrw6oqyFXgUhs+O6YSyUkmxpws=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fG8WdrmImd+AKDJySt3O1d4c1KPli7GuNH6NVSdD88aGGTfqvelUDVAYMD1GauWYRxwdxSE/l1SZtkOp47QfvHmv0c3hyxtmIi1DYulPhwJDSdb9M5Ey0SB3XJzBGPGf+xfiQE8RhM46p8bpfFCv1FrJhJpbSZaFYm+07SM8KMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wXZ4iwr7; arc=fail smtp.client-ip=40.107.236.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wXZ4iwr7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgW6d4Lq1pwaZm5ve6V3/D+7heyc+hvmeJkoVLcSnD/3Z9lzCj8RtzIkalRatJsaNLgsGGibiKP7bBKAABMn3aZ61LGLlgSIeZEqRVxR1KF5flQKkqhJrrWMhuyEEhgeVpvzqEjNGs6vHjxEaGe/URbwf14JQ3udybIWiHdkYcU/6/nUpQEabMSsZMpqUCNd+vU7RwfKFNj/5Rrpb/6c9DP4+fvN+GR350TYrFOWIX3MCjihG4wQfcebkDUnmo7MRD+6kAs+WVJPrd/SUPwkrfRLKgiUDMNrT80O4Mx8lDm5tu+6ki9OR91vjuv+m+dmGbeiwqnKz5FRqZgznXyIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+EnlFnmR6xHYpiVbjLxFJvqnsq1NeCaHUxabngmG6k=;
 b=RaXHWzwtvvluDk+oAHcCYlc5IyQnBAmJ0ipECTyYm/Ncy8rSMZ1Cy2cyAQXVobOY3k7xaSoSK7BihYYWCc+1We/DqBwCxcznmqFsmccNUnZPHSO8pGr+uWsaWrQXuz8AIstN7zt6cGeFAQcV/cTGlaDJwZRO0+Us2PRSIatBlq0OIEKMbCWbBVwk67dJJNi95bfyoI7nMjVY5U6lW+ouDYO/DIFB5VSwEiQ8Wc/SI9/m2mFXHXMbFN58+x/mH7CVYESJtkg5vBlWUIA8Dnhs3ohukEyOfyMy+OTeYUDFzslTIPVjAM+1rsX4avDvbt9f11xLbs1d8zvyWmeDc4buCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+EnlFnmR6xHYpiVbjLxFJvqnsq1NeCaHUxabngmG6k=;
 b=wXZ4iwr70OHB2dgPVLOpeEdpeZWZvT5nOnEzbVyfpsiJ6XxRKQbqr9f3ug8LMZy1MYOJzlPDYFnvrZVCSGjYz+ENVa3zNrSR/Kse+Az3m4nnNboNDpUDYhGpM+X0Z+D8lO9X9i6kBo+tJU/J10L9c+VvHBZA8uhHKJH95bMB/Ps=
Received: from MW4PR03CA0313.namprd03.prod.outlook.com (2603:10b6:303:dd::18)
 by CY5PR12MB6453.namprd12.prod.outlook.com (2603:10b6:930:37::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 08:19:19 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::4b) by MW4PR03CA0313.outlook.office365.com
 (2603:10b6:303:dd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Mon,
 17 Feb 2025 08:19:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 08:19:19 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 02:19:16 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/4] platform/x86/amd/pmc: Remove unnecessary line breaks
Date: Mon, 17 Feb 2025 13:47:19 +0530
Message-ID: <20250217081720.107719-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|CY5PR12MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: cf55f74a-3bdb-4084-84b8-08dd4f2bc70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UQfkTUnPQY+rud6NibW5Sn8+E+iDH4bxHvUl8PTPPorf0I5z9qY1DeFDDuPL?=
 =?us-ascii?Q?Zx6upWw6yYLA52/T5jKAqXzIaXbrypO4SaqfmN7AJz6q2axxDTgpX0ZPQHM1?=
 =?us-ascii?Q?ITx2aaLnPfxJJLhw8U0RUy69v50E66LZ2UBtJMH7pWzTUK+FMnRnDLmMa170?=
 =?us-ascii?Q?HJ+M8rijfahK9cIAHw/nu484xF4dtPunv8KNHxkVwxDRpa+cCJiyXhiHvWfn?=
 =?us-ascii?Q?fOCfQhIwvcK1oAaUa8nq29tKOZ9G0IgrcPVK8VRPbvGBgAhsYdR/wLWE1Bfm?=
 =?us-ascii?Q?csB0FcLOH7vF/vN6DwbbqDuCpmDCOOg+ytwWNt01zh2K8v1r4sIzf4pI4lgG?=
 =?us-ascii?Q?svDGRSx6ocjGrtqoDDLl79NGUq9F3BnwZvpUv51LZbKtN3fdj1ZBSlm6jSmu?=
 =?us-ascii?Q?JTYDkpfglFwJgXlXVxmMCa7NvOWKP59ORTVZY6RPjsrh1GzW3FydbfVqc0Hi?=
 =?us-ascii?Q?wAFeBNnqCBBv8pcB7tpwry5pR9nga1gJVSriIz1EWFLS5uIV3OXn60bis7vb?=
 =?us-ascii?Q?OauumPSV9iAoc8ulPxcQHjgKl92BEojDEt9/KCCpNReOO2hsSPePYWfZsKqe?=
 =?us-ascii?Q?I4YFuxPZlzyAT2E+bJFPsqBFp1pAVd9qsYGO3D24llo3GSmgG2swHYZJEHZl?=
 =?us-ascii?Q?IKGBDBfP2DsNslFXxZwTOIADCIdDtHNavacUGxpNtdh6cEc2wDIMWBOqGqP5?=
 =?us-ascii?Q?EbYjeXvnVWQqbW/hSn5kTKnVrROMnLGCRzdIKlwDbJ0YBG0dhdHTBFiyfkFN?=
 =?us-ascii?Q?EHsyHNggDkFovtm37bYC39fgxNZ4difsWn1HUM0qr1UksP9br52xdfkFQhEG?=
 =?us-ascii?Q?uWQ3XdzaPY4YTdonKEi8VCDnO+FiViNUNP5c3RNauccGCgsTz1u+ARDq+B45?=
 =?us-ascii?Q?pOgXEn3xWqZUM98lpa9Ks6dGBvkww+YSWuJQnNk4wjS4G3bi+0OyuyUxnywZ?=
 =?us-ascii?Q?v3q+r3obNEP2HRqe547SoLxxfUw4yif0I8uyqH5wboMpemyy+KwQOvZr3gC0?=
 =?us-ascii?Q?ChgxE7U5NgCrT6gXiu5l5C1uvD9aEurJZERV5gCXJcfBcxpnKZ0RThI5t0Pt?=
 =?us-ascii?Q?RIwuqrLTA3MOTfn2d1SlHb8fQnzMy65sqL17HckgJL+q+qXlptQCRfZ7EEAD?=
 =?us-ascii?Q?mlEE/qndqneQ2uqicqo9iCY5AMF0e/LP5dc3ILm/GNUrfATLnGBE7wumxRAU?=
 =?us-ascii?Q?5PmAnXsNyzDeah6ivY/yTkzZic/cc4qHcsLwlPzrijgaGssItw0f1kcC9fWq?=
 =?us-ascii?Q?eIJpKU9nayM5QkmYhaJCVGi6qRJLQG4EKUbOwR4Pjqam/qUcCQPCpfsAB4MI?=
 =?us-ascii?Q?+J9oGGylSz1YXtuQENeaGfti81T2Tq0Q1FrUBgyI4PK6JrLYXOU6NiLW8e0c?=
 =?us-ascii?Q?1CN4v5TSITv9XRkLxqI6jknKn8COvzJEDfuv+g0O8lVvF+eJRRsi21EkDOOq?=
 =?us-ascii?Q?ax0OziKYPbq3sYUAGukYbVPzML99Ry3HFvRrexuDWNnkWfOxphu2bVe580UD?=
 =?us-ascii?Q?kiD3scN+3vJnjls=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:19:19.6303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf55f74a-3bdb-4084-84b8-08dd4f2bc70a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6453

Enhance code readability by fixing line break and blank line
inconsistencies.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 742920530987..d80a5b899a1d 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -168,7 +168,6 @@ static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table
 {
 	if (!pdev->smu_virt_addr) {
 		int ret = amd_pmc_setup_smu_logging(pdev);
-
 		if (ret)
 			return ret;
 	}
@@ -222,7 +221,6 @@ static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *at
 
 	if (!dev->major) {
 		int rc = amd_pmc_get_smu_version(dev);
-
 		if (rc)
 			return rc;
 	}
@@ -236,7 +234,6 @@ static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
 
 	if (!dev->major) {
 		int rc = amd_pmc_get_smu_version(dev);
-
 		if (rc)
 			return rc;
 	}
@@ -704,7 +701,6 @@ static int amd_pmc_suspend_handler(struct device *dev)
 	 */
 	if (pdev->disable_8042_wakeup && !disable_workarounds) {
 		int rc = amd_pmc_wa_irq1(pdev);
-
 		if (rc) {
 			dev_err(pdev->dev, "failed to adjust keyboard wakeup: %d\n", rc);
 			return rc;
@@ -743,7 +739,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	u32 val;
 
 	dev->dev = &pdev->dev;
-
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
 	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
 		err = -ENODEV;
@@ -751,7 +746,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
-
 	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
 		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
 		err = -ENODEV;
@@ -767,7 +761,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
-
 	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
 	if (err) {
 		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_HI);
-- 
2.34.1

