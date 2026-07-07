Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695330D407
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427353; cv=fail; b=lioTqBVYCSgxmr+wiFo9e7MnSyJAyT5lfJdtC5DDoZF9yODrEmSGm+qruG0kNj/8SCk3bwBVGm/9FCdEgWoNwrsSRy/ZssnX+FpsccfSNi8PcLyGUWcE+QGvznmWEBwCj/n4/o4fLDJf4mwzPwjd/DFc14yCy9HufSLO868KsX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427353; c=relaxed/simple;
	bh=ZyOLF768ntUohHvDGBhdI6owtJgIbCdgAJWMy95rmVI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k13X0pENRRslD0qpaDyJT3BBzRJMlqzlbJDwIw0HS+UIsYLEhUywipUP1bmbbN1wuxNm2cLSDiznu8VfTR2czovRv3v535G75+q74DNi2oe9DQ6t297i6JEfnSI379fl1q+ii9pVf/s+crJ7TzifT/rWN/MOV2481e/mNZzFYsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zH+Lfsnd; arc=fail smtp.client-ip=40.93.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zH+Lfsnd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bapCKHZv9wjEi++w/6guYSeAU5lQUJ53XJmv9chyYoPFjjLIBMduUECejh+Enn2L3ieY5olZvvkR6kSm/SIM+2QBHbqZ14KwzWQOLWkvKLe12s8A0BcHRX5vYfU3p01UhPCoWMkCtn9DHsuaB8EpBhTvRkkMUfXZPb9hIPEYt8CppxpIA7INQOyw2sD7w8G0GfdIY53PMow9gwY7Hv9+YTcGsh8xHhmbzpELMTwOXdJao+BG/yEIQkSwuPjU/RPBAXLYXBplC+X7Afsyl3sCxBKEoYyjE9spPXkY/cdbD8IQ9WtSSWr7eT8zHCpTUgpCtJ0h0LaNfBHJ6aAPvbr9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvUItjMyLopK02NKOCxsryxi2ed1gcBLUGwa90tr7dM=;
 b=CvYolABKUAsvdIa55qvAD4iLCqX739Q/CJJo3WCrIVZSEqojBL9TFnExU54J4QuTq/G4i0yDyClLmCLl1TV28myPVGpdoyMpbR7xcvmziEgc9ae7xo68RpBIjfwI/IqRVy4rhVbaVSPD4eN4bVie/9OqI/JGN0FX7pMEGNN+zzwReHGq3mxAtr5Wtqa3t4Gej+oXAnLvDO5mkvVTYajdSXaqXN3HbRcXUTDM9v7cDWMirBZsnPnhuuyKUP9gtfbA0weFTVC9qSSqSsA/usYar3QLoqapYCGmwMW4hZAcC2sApwCmg7qxR44WOypxENXJ4Yu+0RfsXi1wxyh9LjXxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvUItjMyLopK02NKOCxsryxi2ed1gcBLUGwa90tr7dM=;
 b=zH+Lfsnd83Mvcd5dhwR1JETHxPPqIBIrvsJ+pryqwsqIEpgpP7TeDOeu/6Ek3xuDCkiWUejK1yXtFOjhUuzAQ3Yx2HrqG3OJzQ+lEyWOnehTxNVVFFp9BG+WmQqSApSJagCH4XWXubZTM4gIMop+Wx4W2legda8eHHedUFYL+g0=
Received: from BL1PR13CA0351.namprd13.prod.outlook.com (2603:10b6:208:2c6::26)
 by DS4PR12MB9747.namprd12.prod.outlook.com (2603:10b6:8:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 12:29:08 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::4a) by BL1PR13CA0351.outlook.office365.com
 (2603:10b6:208:2c6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 12:29:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 12:29:08 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 07:29:06 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2] platform/x86: amd-pmc: Use correct IP block table for AMD 1Ah M80H SoC
Date: Tue, 7 Jul 2026 17:58:52 +0530
Message-ID: <20260707122852.2066987-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DS4PR12MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1c33a4-ceb7-4941-f340-08dedc2357a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	mhxw0kWP1YnBT+rcgHEx+B0LEjWDrNYw/5AjBI1gOtIlG84bvSs92Uj7WKcXXdtPK62PonoWk6KWHQsOMUxg9oUUQ7SzLxmyQOV91qAIym6mq//nJWPHWQtzW1i/o0dR2UHb/pD08TYD5xMOS1J+B2Ln2s2WFpid9Jj+1vIrGhyvhSoF2pcW6w+8xS2XA1k+EYRxqVuEVTN+m2qUvzgWPES1tXaaEBeDAlOmatUA2J4u4diIplzIwgo8UrxOcFiJs/ITP6kQc2RGQETrOMYuVCFZpgZDDj54Re7qyq5i0NBzi0gzDfeld2zn6deTKa03vY8aKJSuArc9KpTjPGZs+lBPyTxe/GEaA5JIzmzvgGdjE95byLEvXm6IwbMVcmOqQBgCh2FDP7fcC71ajeEMM4THfiort6U9ZginvwkDFW9Z08O8n9QNUe4TZYyfe8QO/hCEgpDTNOa74ADflpcUvvuVdbVX0TwJpo5Zc2EPBSjgIRSULF59u4KCp8OZDSkhukLTsmUI/3qrInKSO4m7byNisz4lk95dmmq/zTO7R7cUQM2F72iJ37uq5XTKif3MClleu08iahJlbuXLLOQdc+W1ruAySzgqGtfs1f8ISJoIVsHD7qtTzwIyKUJiJkVsXE6gIY84ZPJWYMTMk4+zFyk/6oDvph9y7eEZjtPdpQXetQWGUJVlepqA2G5ivI+1OBKLAh0DU4DPXnE7XALhSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8gLTYbvAF1QEUiS/TDNBwfIpk6Ca/PYmx5CJIj8HCmKfcoFZDH+I00mbfypTfiMz5VDVTsYDN+raHIfEwsl0WAJdpQTILGs6PHQNprtSYQoJ5VOgL1PV7vHT2M8O+xwNLSl6Y1Fx9vKtzmN5dmcn4eUF8imF77ZpA7BYDP+VyyXuPUzsvyTNyltK1/WIW8rX8x7cs7bhKMgfAHMyiH/XRXtocdLYYGppME+5z1KFP/put7KVEtJ4Zxa1JpkoHo8LtiX5AViYShMnHzsOXDklDTncYke6srKnw3ldFK2ex+8jLA2kV68LYycCiV3FCvwuv01sH+OuzxVz5S4vhQta3eVEMIXBZBfHVeAr2i92iB1x8JF+wul0vj+ZyvA4JU+zcnFy45l9UA0t0FXKp2pB5gG3eJdZOZmOKZVXu8fVm4Km7SbpwxSf/XEEnjE55IXN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 12:29:08.4971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1c33a4-ceb7-4941-f340-08dedc2357a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9747

PMFW reports the S0i3 subsystem accounting per SoC, and the set of IP
blocks and their bit ordering differ across SoC generations. Family
1Ah, Model 80h accounts for a distinct set of 19 IP blocks, which does
not match the ordering in soc15_ip_blk[].

Commit 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for
AMD 1Ah M80H SoC") wired amd_1ah_m80_cpu_info to soc15_ip_blk[], so
M80H has been reporting incorrect S0i3 accounting via debugfs.

Add soc15_ip_blk_v3[] with the correct ordering and point
amd_1ah_m80_cpu_info at it.

Fixes: 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
- Clarified the commit message: the IP block layout is tied to the
  SoC, not to a firmware version (v1 wording "latest firmware" was
  misleading). [Ilpo]
- Reframed as a fix for the wrong table wired up in 043af31c8d30 and
  added the Fixes: tag. [Ilpo]
- No functional change from v1 in the code; only the changelog and
  Fixes: tag are updated.

 drivers/platform/x86/amd/pmc/pmc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index d50ea62fa2f3..4a5650f1a3a8 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -33,6 +33,28 @@
 
 #include "pmc.h"
 
+static const struct amd_pmc_bit_map soc15_ip_blk_v3[] = {
+	{"VDDCR",	BIT(0)},
+	{"VDDCR_LP",	BIT(1)},
+	{"LSOCV",	BIT(2)},
+	{"DISPLAY",	BIT(3)},
+	{"VCN",		BIT(4)},
+	{"JPEG",	BIT(5)},
+	{"UMSCH",	BIT(6)},
+	{"VPE",		BIT(7)},
+	{"MPM",		BIT(8)},
+	{"NPU",		BIT(9)},
+	{"USB_HC0",	BIT(10)},
+	{"eUSB_HC0",	BIT(11)},
+	{"RT0_ADP_HC1", BIT(12)},
+	{"RT1_ADP_HC1", BIT(13)},
+	{"RT2_ADP_HC2", BIT(14)},
+	{"USB4_RT0",	BIT(15)},
+	{"USB4_RT1",	BIT(16)},
+	{"USB4-RT2",	BIT(17)},
+	{"LAPIC",	BIT(18)},
+};
+
 static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
 	{"DISPLAY",     BIT(0)},
 	{"CPU",         BIT(1)},
@@ -159,9 +181,9 @@ static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
 	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
 	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
 	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
-	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v3),
 	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
-	.ips_ptr	= soc15_ip_blk,
+	.ips_ptr	= soc15_ip_blk_v3,
 	.os_hint	= MSG_OS_HINT_RN,
 };
 
-- 
2.34.1

