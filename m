Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0E1E008A
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Dec 2024 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392637; cv=fail; b=nmbpweZ8Nn0/ZBIc3G8svaS1T5zsQqUOyRPayF4KMq0gdWWwezVerzhW4/Ne2DugMG7eju25Xjhz23xZdwPok8xnt10a+j6FP/6VxhX4ERDjfktSI3wCvarJ6xn4BWHn+KJFZpQaCRMA3cFWHN02be5BBBOgWxnuE3JqXHOcIOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392637; c=relaxed/simple;
	bh=sBIJGOcAJ8OTNUp4Z2A6Ih5BxOSbNHY/eTrLSP51MA4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gKBCrqRDWC5DC0ZQG20PmA+dmTP4TKEG3T1QbvMtHwQEsoMECAbL7adoXjjNftAbD4k6kT12O3bca+FH2AakTFvbtGuYLi4DnbtqIEcC+eWXgL83cFWVpkFg5D3L94MRMprqGP7FHdHz29ee2Gu2m2lKtij/H0pAkGGCqzs7dTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z1T0UA1B; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z1T0UA1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlOKbRZA1bliCYKTby898eUCBL0TVSS6LeEvMkQJ4nAQlDOBb8kEGq3iMD+5RJvyHqGrzCK4OP7FpBNfgxUZMOdV1ZGi2QZRAg03AIxKs4swgcOg6nvjSykTSStMounhWLabf2ofy1D6NQb23xINzQjVzwW+KEqKse0IPvvIRKOot8pdTb0y4R7/KzyqFCpl2nEPXC7ymwqukCJqsxP5/9+YCTim38gw/9IykwsJgWR0Fcfp4ppUtWr9XomAFZnwACtFnBZioyWttyBr+1eEXzhMYdA0nBodyLxNrSO19ycHPQLIjSOsyeq1yQ6ctd9ywc2mxgVJNuOmd1yEZiMF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMBHlHoJBZb0UcC5bROpuI78jlzYGlLWmO72BIci5AU=;
 b=fdLqJopts2ZvzFD76laveFI2Tm4qyLRLqq4JR7DmKkFAKDP368imWiHpT+8h3EOsTuTrL5az/WcJ0oKXHJ9XueFUPpWHnpv9ZGT2dD1Y9YRz7GmUboIUMBr+dG/1goE0E8CLCfeIr8BfSx+bSRNemzvX47rh1QC/P54haMpa+9kaC9ADKoATIktJWwnM7MUZZGX4T9803rF8wedjrJZ4b2+bGZMFseI8pIXAZZRJpHmH3Z6M31ThZP8hZE9QIYFY4S1SU127cZyFKEiMlRDUPRRs21dmG2/PpixGZwf8SbQtWEJ84WQg/plCmyFEt2jd7eISq0QHQB9LlPS0t/drOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMBHlHoJBZb0UcC5bROpuI78jlzYGlLWmO72BIci5AU=;
 b=Z1T0UA1BN9YpfMFBB9+TPTnRkzbJOqX66banQOWOMpqga7w0IPIp9XkYEtwJzw9IaM6XpO/H07xvmau2K3WS4kcTBTabH1fiF/d3SKR2eNNDox7D7e5Amdc+9pBvA6S6vO8bJqqiR0pqT3gGNKMdryEr3+GX17tOGep+8pv2Ho8=
Received: from BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35) by
 PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 09:57:12 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::a2) by BYAPR01CA0022.outlook.office365.com
 (2603:10b6:a02:80::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Thu,
 5 Dec 2024 09:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 09:57:12 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 03:57:06 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH] platform/x86/amd/pmc: Fix typecast warning from Sparse
Date: Thu, 5 Dec 2024 15:26:49 +0530
Message-ID: <20241205095649.2260654-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: af1c0638-be7b-4a85-07a7-08dd151330f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aOcm4Ek2aeibo70BPTbeQEtkt1FYdJiFtctVJmvWy/WHawEYBzavQJgpX0z/?=
 =?us-ascii?Q?AFU7XhX5QmgrXaigfC4RiuDNfnhO7gYmTT4m+5QcjecBq/SuqtJW0mWmLm0S?=
 =?us-ascii?Q?c7FAwlbX6+NNAlwSihFktoXk0b0b0/tLdiSSRjoy+rLN0wdqnG7nVV95qRQD?=
 =?us-ascii?Q?zFMADLhhQcrZfWs6+oH3O+6oVUZWIuh9qv+HB1O0wFshLjYZQegEYpw+gMA4?=
 =?us-ascii?Q?0H+ipANtjmDZ5BzhJV3zGejN6+qsY9Gyfo99WoED4n42H4K1H7ybBR6TL/xu?=
 =?us-ascii?Q?Pp4TpItkKCLPkb8E9NiOk0V4VhOnNh1hA9vifj/qxzw5n/FopTttBUNvL5RN?=
 =?us-ascii?Q?8ABADKTjv1E2s8N7gSfJ6DZKGXzEStyMBaGSNJ6R3PoUFFVAujuaFJbXAEz9?=
 =?us-ascii?Q?KK/XkeN0L+PiW8C96N5TYWYBk/pmyHd5U7by1661Z+xpUew+uuMHXSAg/P2v?=
 =?us-ascii?Q?uss2EA977vYyPttpwOJrURDB9UEXoujEXbGDWxldNNZqndxbNINV7pNAdxi8?=
 =?us-ascii?Q?r06JHB9unUal31QQzc5pBji1tRpMEu9FtJa3gRNXopLZRRgaocTOYpXkcG1l?=
 =?us-ascii?Q?d1yN30htJ/DXV8+sCPYruLfIk/pgzAOHPRTgs329o9kDurMeuvyewatY4m/z?=
 =?us-ascii?Q?ArTZj1tvzQYVPFpkMLUeWa9aCr4Nt2fh5UMPSSA3XDQ4LT8dLRdEfjY2xerO?=
 =?us-ascii?Q?tycSEvVq1tqiZl2wWO2S7aVvZnhGiixHNH3q3y3W7yo11bpQUeu0eHMdiLRp?=
 =?us-ascii?Q?/j829MkwAGrDkjaX0bhtZy/wNkOumBZyoIYUZQaewNoBEWIF8NUN/tqZFMim?=
 =?us-ascii?Q?+k5rSnRb8sk1BsKoijjb3ooY43shDuMLIni3jGw+LqfA1aHllR5yAZtUqAlc?=
 =?us-ascii?Q?168kZZUd94nkevk8CR3m7jwdR7i0cz0AEBSC3LW180S0DkFCOfM1deMQ+IyQ?=
 =?us-ascii?Q?VTt4D8GXpmMrhiMzZ/fuliNWQi9ZldYZNwNO4TEHecyr+Xxo6ekRTRg/5VED?=
 =?us-ascii?Q?8SIOvpr/Z+98O1H+Fe5IxJ5aWO5IOjAYHY+vl1CzOun/UVc1Wm/QSuLfGtvx?=
 =?us-ascii?Q?6vmwRD7KTP1aphiNpk7oIYQAEU9Pr8eoKI+vDE+LlHrnU2tKbm9oHHbjv0TW?=
 =?us-ascii?Q?VJWbISCn0tABjlwQgBs3IbXMf0xEb3iV+i4AOZAO4zTQ/VqHoGAJFDdILftu?=
 =?us-ascii?Q?vedpF7I/Uuuj6uiQVLqB+/J6v5hSngDKTDKhc+exBCra1bYC0TwBB0bpNIqb?=
 =?us-ascii?Q?x593VjiabqHmlGhA4cgqEadenUsyOUt5I/5H03dLn0CmjaSVdKgZiJmi5jt0?=
 =?us-ascii?Q?+9E5UevYH8lEGefwulHC7kUI02orLIkbR9N3AUKHaVUQ1nzuQKC6WWmWrk2L?=
 =?us-ascii?Q?4/Sliaf5v/0Ztw2BrXS2t5gWeonDR0Wws6YZv2985/ReVitDKDn047jSCAed?=
 =?us-ascii?Q?rMHGNXUDXrz8YfE55DU/0iI0XrOzwMuu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 09:57:12.4817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af1c0638-be7b-4a85-07a7-08dd151330f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203

Sparse reported the following problem with typecasting. Fix this by doing
an appropriate typecast during assignment.

drivers/platform/x86/amd/pmc/mp2_stb.c:105:30: warning: incorrect type in
assignment (different address spaces)
drivers/platform/x86/amd/pmc/mp2_stb.c:105:30:    expected void [noderef]
__iomem *vslbase
drivers/platform/x86/amd/pmc/mp2_stb.c:105:30:    got void *

Fixes: 2dc77993cb5e ("platform/x86/amd/pmc: Add AMD MP2 STB functionality")
Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp2_stb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
index 9775ddc1b27a..2014435dc989 100644
--- a/drivers/platform/x86/amd/pmc/mp2_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
@@ -102,7 +102,8 @@ static int amd_mp2_stb_region(struct amd_mp2_dev *mp2)
 	unsigned int len = mp2->stb_len;
 
 	if (!mp2->stbdata) {
-		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
+		mp2->vslbase = (void __iomem *)dmam_alloc_coherent(dev, len, &mp2->dma_addr,
+								   GFP_KERNEL);
 		if (!mp2->vslbase)
 			return -ENOMEM;
 
-- 
2.34.1

