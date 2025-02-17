Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DE319D07E
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780366; cv=fail; b=K9BF6P7SLywRQJspNjw96HgCO7yEE6dN165T7y5EV0SR5QV69HiY0bNiQP6mbLUmPNgpdrecbedgywt4mOpWqrfxZad/cNiV6xKiJaC/W1XEDnEgXcIttJ5+ZaQCjK0wyDf8aQWikeK6gqEbRbK05bBgT87LHIQYbU0o9hk1+WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780366; c=relaxed/simple;
	bh=kcb5ZCTjAuTbGMvFn2d5sS1Bvh/vdIWAPQTmgYzImhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cdlh1Dspm49V5q4TrywLtcn6yOBGCNKYC8tAm/l0lKOYg04K/vUA1TaxXL2sPcZTmK+zDd+NKqcaYAbg4B/bqD8d7WBzPkyCtq4SAsXy/IKTB33goTP0u06IQbjw+mG7SitzXJ3oltZGyzJ6lgfgStevMLD19lEtv5W5+jG1ums=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yahb8CZS; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yahb8CZS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1vuOjEpwh3Ioy7GF5eyJNrO1+oZY4WyhhZA+6o7sNZmIt2VVaJt00txc+ZVrFQs3hp1hdMrZ+p490s93/0lJ8e861x0YYBUUIaV5J48EPk3jgDa8xJBIMkB0ObN5sVxD8FTAaTh6Qbvi+jjzV3od+gaNf54FAQjwDOzWDbqYTQus4iW8hRTPnX4tRrJu9gHNn3DDN4lEP7eMt9vwHofSu+8436x7oowId3s8YLeQ1MrbNpqfuUvCP0FWV/cdat4loqF0UPLD3/frmzV8FJeXwYc3DfgVhemR3XzNWTCIXQ6NVfySCgoYI1bTNQK1v+AHs9XBzwknpXbhMB7n4K0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdRAeUjDv6/xJ7/5mnvkDOPPI1tN0TZ5k9uRZ4dtYoM=;
 b=hg9jf6KOgrgsufi+easPf10jHtBi47btb5XM9wclBkAJwFdEMjai6tOZHGqpdDaiS8roOblVRB9sAE1WVZdSzEPZlZlugz/34KI072y38LztLQSE5SsNSu42q9hWusBOS+48YZ8zAOVUGLS1eAfq6WA62kzgtskxkIC/VXJCMnRGEXwDMux1RAnruVAs1hmRE3CdvyluLmv1QUyN8vFSNEAf6owfGEDjX9ooupKqHMPx3ysIncVQk6P98dKLkDFVGSvSZt7UxgZhWyiIj+iymixjet98o5L1Ck4T2dt21NN9ot8ZNmuTD5KiKGUY9ZS/holF7pVZvp18yUkC59CJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdRAeUjDv6/xJ7/5mnvkDOPPI1tN0TZ5k9uRZ4dtYoM=;
 b=yahb8CZSFdrz5xExep4k2hDwlRPMoggU4NbuJQmSbaSToeLLdh2ayCK8ZMj5U+5zdmKEGZ/moVyBj5u2yGCNez4DxJ1W7qJtutjrHD0voQ0irLbe0agJsR2X42DZgqlLhXtebCHYOhDOMGU6l5cgGefyGAFNjcm7LE577fnnfAI=
Received: from MW4PR03CA0308.namprd03.prod.outlook.com (2603:10b6:303:dd::13)
 by SJ2PR12MB7942.namprd12.prod.outlook.com (2603:10b6:a03:4c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 17 Feb
 2025 08:19:21 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::b5) by MW4PR03CA0308.outlook.office365.com
 (2603:10b6:303:dd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.12 via Frontend Transport; Mon,
 17 Feb 2025 08:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 08:19:21 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 02:19:18 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/4] platform/x86/amd/pmc: Use managed APIs for mutex
Date: Mon, 17 Feb 2025 13:47:20 +0530
Message-ID: <20250217081720.107719-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|SJ2PR12MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 3545790b-602e-482f-b3ff-08dd4f2bc81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qdfSzsF9MCueFz24qnR7OlcZ84Cl/ElSLZUSFTvRlCOLufD4UDH/GNGzNB74?=
 =?us-ascii?Q?kLUBGOtPlGzaNXNI34YJAdhSC0eRAkBdGig+R9XzzUs9nU0/apOH+WosjYgd?=
 =?us-ascii?Q?h2UMGh1FlcVT82lTIEGHSGbR8QrCV+eiT5Aa6JrxyiKwdsKSRbyLpSZHjf2h?=
 =?us-ascii?Q?sVNdx8ebR8kznPaz4NUuzJu/6kkqIUGAT5bCQOHLsjI0RxkDuCqcaOxeDNp+?=
 =?us-ascii?Q?labPDTtkyfKSO47qV8WaFpdl2/DJLQ9UWVOHO6mQwrSHhkTg3cqLr92raQKe?=
 =?us-ascii?Q?BjUSLbjfZOBHhfV5LPoQ07tTtoxTg+5BsEVhg6Tc6kjD06aRt1ohmIfqx4Rv?=
 =?us-ascii?Q?YQ3UtwSXUwWh43spgbKTT4JmA9JNFDYP04l8Xybm1pDZPcAX7kLGE1KXZfOK?=
 =?us-ascii?Q?pBkmN/L5S0ZUiuI4UFSGnFhYMRFu9CRAzLQegxpCRQ91tFb+Nt4mPpVsGeD9?=
 =?us-ascii?Q?ZymzH0kmyN2mgym8NsXnkRy+MX3CzfOHZLj8RwPoi0czGyVf/tU1PFuqul4M?=
 =?us-ascii?Q?ZmZPR21odC/zs6HMpyA1z2lzfnMuQIsXtKWntVgZAq9iYGdd7iWRZtA6obJx?=
 =?us-ascii?Q?XHO2V5JbVd+EpAeXxtn9BER0OKXS+limdhoUcIrAnlBSdGifFCAFazU6fgd0?=
 =?us-ascii?Q?KmP+FsKXxXhBpskZw0LYUEzqs6Crrb6nTFGQ2rgzbuyRjst956lRE48KcUV5?=
 =?us-ascii?Q?Lfc48AhBGWCGjCJXMHNj2U/zhLTpGifS8XuqqIoizDet+NfnNLqvUZ53CMqy?=
 =?us-ascii?Q?1SwKoT8Kb2Z726kuTM4dGY1a7z1fQqvExZEiLsxQTXmVK5bnBVOrStcr7enu?=
 =?us-ascii?Q?y3INlwniF60cHFWIh9Xs8rxvyas9Nisz/P+ck28YTJ8SsJYD4VFB99/H5/z6?=
 =?us-ascii?Q?KlqADW8nPtaiYU8xGX2dfjfvwLO3gugGiu5mEKVNA9OZEYHVn3aV1gd4T0ci?=
 =?us-ascii?Q?ALqnb9PM1n1qWHPGRy2dGLfzQvpvIvR1dYkUXh+p9E4hK1k+swHUuXnJWxNd?=
 =?us-ascii?Q?IlJqc7WS56s3u3YCUaqQPSTpdipIMQc6mpNbiyUHJxqiJAWD+lXu9XxULUif?=
 =?us-ascii?Q?d/tkcq7Lwk1CflMjBh2nLHhAiFvibGyFFa9dBJQhsp6UQnBnJvrIvl3WOGIQ?=
 =?us-ascii?Q?5qS+eBNMHHZTy66YavsyQeQBLfZAQr+eYmnX9fZADuMGJiErQ14zK6yD97Rp?=
 =?us-ascii?Q?0N8PeVd0TIPdc8AnLtzcPWUwmvG6H59oclP5l5TGh2DTKuZa3e4SIcZpvkys?=
 =?us-ascii?Q?dELYC3YICwh4t2Olnn6oz7Fne0RJSIeA5u9hyDtNtza/Yqr5b+W/Q7Fkky/n?=
 =?us-ascii?Q?Wn7OgWtyy/KjhrddXl7oR8He+/fz/rtXM9Iutxt5zwR8FvtiRpljspq8gFne?=
 =?us-ascii?Q?V1gVnlE0x/6Ejx87GpANOUx0izUa0ZINSmu74T9IDCP650M4Ro8f6TCngeWA?=
 =?us-ascii?Q?RifxIRBYPU5nHwMXFXpcp6DAcooPSKCvR31qmokb0LEg/PmjmK5EtV8ArJKX?=
 =?us-ascii?Q?tD/6hmhj4xo8QwE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:19:21.4272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3545790b-602e-482f-b3ff-08dd4f2bc81c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7942

Adopt managed devm_* APIs for handling mutex creation and deletion,
facilitating automatic resource cleanup.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index d80a5b899a1d..f4768bd6b424 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -778,7 +778,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 		goto err_pci_dev_put;
 	}
 
-	mutex_init(&dev->lock);
+	devm_mutex_init(dev->dev, &dev->lock);
 
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
@@ -817,7 +817,6 @@ static void amd_pmc_remove(struct platform_device *pdev)
 	pci_dev_put(dev->rdev);
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_deinit(dev);
-	mutex_destroy(&dev->lock);
 }
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
-- 
2.34.1

