Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC850EC07
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751069; cv=fail; b=hsdxR1U8lVN/8pEut2z3U+2ER+998xLUdEKqOw5t637f6Ki2EWbbPl3fGkWDBiY16gPYaFPgYWYA3eUI3CQqyHi7HH8xDFb8Wuj8tWqEsPPj5ZPBTAYfesJlDlgYDmQRB/srZ42OD7x0q19x31V1Lsfs7iu/Fpjb8T0X0Zpd+90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751069; c=relaxed/simple;
	bh=5PIyYaNYbE07p26AM9CiRgYBifbZvYOiDBlE9RXQN9g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgLo679IZDW6mCcE0gE2otKRa3MaTUWrnjGp6vhrZ1igWK8CA3AV+md5oRlKmFDTMQM8RcVoIvNbtoEeJ3DHfhljrE6cWgw37dzckxupgQf0TPgZ0cGcdShz5buybX1wt1rBwLCaR9gTowRIppbbfLhbNmV+1sSBW/urlGQTRl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XQ46U55j; arc=fail smtp.client-ip=52.101.57.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XQ46U55j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecRChVfWN6r8OpydKINN0axkj+ZHJ/RllaOCAswGuaEFYKHvehibF7YnPdBEvBaTBJMr5sG1RLkRjUqK6FJXX0Rbc0IJSpkBmVnBy97qNYQ3efKuvsckJwZ7LccSLZW0VUo6TZLuNrgcQYPbDzuTlsczeKfLxg+IJx6Z+VRxD+9TjeFTZnTZNP/sfeaIkyyYLy6savgOs981NBEgWph1aLqLsVpfCSraQOhJreIHAJTkM9O2im62srORQqlihdKtzG0A87KFmP+faeeVwMye2LDm/CQNmImOzHEaBZVvV2j9Glp9oErJ+zztQy8Hr69wVquhF+RCgy7oLookc1+3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JcfpOJjmxL6QESh9XSICH3qT34nGRkBoRu9S1Wx3pE=;
 b=Sx2F1BYZ6uuGmtHoo6yR63WXZaY2yLTzM0ZD4fvazSmL3lwKT6QP4/8jC1BB0xLriqsjyWSbUebcL46qsQkhcwMmDMcef+YkQ5LcFZyGoshAmCYH3URM/Q4k8frJYsUaqdFk3BIqvvqi8LgrKv55JBI+AFw64awPKoa7gIgtJcPuxoEwhEWOMjTULZpBBIiHFPHCoI2qOT+OEJwe7SangZRsdhZoQ4Upq7Gg0QdOgUnF019dsDk/XNPQIDIxfBzLVXDbV12IB4K/PpzpFPMFdoeUvfedcESJ4iKovWs95GcnBPNUFwNHgXWIae6+F3SrX+OUSUvsv4+DX2+UF6CxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JcfpOJjmxL6QESh9XSICH3qT34nGRkBoRu9S1Wx3pE=;
 b=XQ46U55jUFb40tiursZb/blEt641fmxOhT1/SqaHJCNPYdOydhGtUfVpW4C8O7HOECL9Ot3hpKGjlv/nfR4VsPM5NIC62OKcM6UMH9xpb4kcTjdRfdD2y1sFg0kNzz04W02qWMTFNoq30jr7cSGTAeaE4Z/FwakomeAr0npQdQ0=
Received: from BN0PR10CA0015.namprd10.prod.outlook.com (2603:10b6:408:143::33)
 by CH3PR12MB8548.namprd12.prod.outlook.com (2603:10b6:610:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 17:03:54 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::67) by BN0PR10CA0015.outlook.office365.com
 (2603:10b6:408:143::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 17:03:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 17:03:51 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 12:03:50 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <superm1@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH 2/2] platform/x86/amd: pmc: Drop scratch_reg from amd_1ah_m80_cpu_info
Date: Fri, 18 Sep 2026 12:02:16 -0500
Message-ID: <20260918170302.352054-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918170302.352054-1-mario.limonciello@amd.com>
References: <20260918170302.352054-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|CH3PR12MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0d2fbb-d815-445c-c24d-08df15a6d09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ihSJVVIg3pX/R4Db51kT8VzMZm+Q4v2DbnuvsYzHAI14RFmdo4SnO9v87VM4I+rSkW1gH458WzI2ITEyuAOfKw9h7sVE/Uu82w6Wy8KpjpPof/RVrwRIoYnfRw+5F+a3rq0rt7f+zvIvm597nY4q+qKGDt0Hvc3TINvK2UT5FNTUkeWo3p9aaZZHbuktea51tklPGIW8RB8yQhWbmj1uQyQdh0amoD781qr7nFIIcPT9kUxyM2h2f2uOz5W+zg+hK63irWOpl2aEBOYR7pxfBLiGECHZ0sGnftudhmqTytJ3YgYO3WouTnR/qP8WmLEJYmIQPQk5XkwrsypWOe/0rNoHLnNAWh2pePAdEPZGVFyDFZvqRes80faD4nW1czPsI9VptE9syD4K/Dp0Gt66DOjkEA41igeDcjRETW2/qNLD2ciZobJ/z5sl45vWlD8jhcTIPK+/l7oiw0Xi+mpvRhbj69iv0Yy+wYecRrYf5b8BA5QYC55GHAG2zht2CsU49e0bLstZQ3Q9UqGzz0GJFDVXaTACZDbdKd4bEfRiUSnDtPw37MrDSmaBSSwA2e2FeoP5ywx6+/1D1VkuClw7+e+KF/oNF1bu3asLPU9Jji9ibleK1n+KUs1pBBcNcGhKzSH41whJwTJdgSxeDzXjdrS4JpNoE7nYQIQEtF/Plw50DBsxOo0qqfHCh57xSKwNa1YZjbQKJ4bed+bZCWBB9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LRgWRBzJrTrIK6GVtiOhVuea8GVi1PVT9GF0eIIL89/s0YNE+sXVVDRICNub5cQeZbntuHQSNextQr6TaD7klpb85ZsRPdPSn9Pnatg2VXIFqGqnKyIwRy+V33vFjsBMijeFf7KULsKEk8w6T0pSIr2siqW+pd8OM5nfn1UPRRhlAzhWVTfdzkYHc/xeWN1ZIGW6qRwKsAGTTL2x8cPj6NHENquMom779Oj0QhYVqohW9GQAvw/5NHcYnS/bbgiUVF8S9c+IRVNa1VsnTJ2rwIzHOhUjJ1oKcWwstSZf++ymWpJTaYstIZu8QdwD6aYtEmsRKEOzl8gJTSdLF7DInzbQT0/KTXZX3qqbceyrDAtdmh05VHtokpR82aUOAcwsvW1afcsJN17HAizhi/TO0SjB33B/yAp7iWg2g3nBf5+8IyIWXBJPg09e+kwTxSBO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:03:51.8095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0d2fbb-d815-445c-c24d-08df15a6d09b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548

This platform does no longer populate this register.

Fixes: 2726b5758f80a ("platform/x86: amd-pmc: Use correct IP block table for AMD 1Ah M80H SoC")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 666ecdd8888b5..2bb61a65e1cb5 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -182,7 +182,6 @@ static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
 	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
 	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
 	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v3),
-	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
 	.ips_ptr	= soc15_ip_blk_v3,
 	.os_hint	= MSG_OS_HINT_RN,
 };
-- 
2.43.0

