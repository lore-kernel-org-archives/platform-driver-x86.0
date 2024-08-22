Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951C213A3F2
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Aug 2024 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724320497; cv=fail; b=azmpR+QRG1R+gVn06FSkchw7CMrT1q1top9x+7z1oa68gX9JKXcyQt6fyt+8faqkzUTSXB+UCwp0fjX7fWqDm3Udg580dVfANNMFKew5QQflnExmfvUIATLNv7aU0UKEw5fKWsSL2q208YeMZUaIbbWMOAFwBx8OLuOhymwU08g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724320497; c=relaxed/simple;
	bh=h50vtsy0w5oaFbqQDJiazqj8kiAyJyKKo6Wq1Sd6UaU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tzNMQschyZJ+a9vZrCpbyPUY5UnIaMcdz/zZLquXwjnYQU314vGfJtPCucBTrTr3IOLjTERwZpr1iR4DVgSjblhO93X+zMgF7KtSzkKKRLzup5kz5dLgpoKJojtI3/TIe8fT205wg0GBzMPqhh/80FvX9SBEapVRG3yTn+vFF7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kdI6xgxN; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kdI6xgxN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maoXe46GS+kotICQVRDI5v3D+mZ80GdE9UnAeJES7ePhc50Q1kmnaqjIksvSjI2BjQCCbMMYAq0Ki+ClBQl3YWw2FG7iCAIGIpj7okc8sCrFEW+D68qT6/1fhvCUANjTC85hOuCWMCy+xKtvnlA8OiaP/Et2BJH3fyxckhYQtvmtIu+ezrfZxFmQMYDxUU0Cqc+RGr2F/x2ISe15D94ucg2JPhh0leJ1+vpE06eRNqmXUpcdEkaynn5JJ8PDzUZSw3Ha/Is9QsY1qIa8E0/Jk2qXRNebcfipAMXe2aylDdNm1rJ8FgEFXHOTxFW1HxFPqn+w9HkiBx4YLnuXYaE87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hiM4UPrdMZVHtv5T6ETywWzyy9CgyAuksclnN/UiGg=;
 b=KBLqqI2Le/lOtne9K7Ll8U+achd9fIL/xy/4ua/ALkEjUP4/gN7M5TDEzAixUQfZJGAoNZ82sd0GGKolP62GugXCv77m05L//q2BGCl3Y3KkOqNGbltOab7fbIlKZomtN6ng4mSxHu4ayDec+NUZcDbyve7FokislcYVu7XJEaEOWMEHhrarY2rn+vS73pWr9tMPjgcRG9ZoiuttHWPgIqMKnXVXkZDLx1qEU0NonYXNwVJ80apUdByRNdrX2o6BoB1tJ7YLOh3QmACHWGTtncpcZsLHBfMDqpooCCKiJY4U9diV5xhwpQk8EQt+ECtraI/dPOVm18nWg6D27xeiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hiM4UPrdMZVHtv5T6ETywWzyy9CgyAuksclnN/UiGg=;
 b=kdI6xgxNpJiPQPYkrUOVB1OtAcl+kSeFV9fL92UxVyWb9LIBbPaZBSHM/Kod8OptbnnU6NKV4v+BfMAsoVO9aAZzZDJxnGTZoXuCTaMUHKDSOjVyQHdYYUN4kr899Lf4Su04qPPyFdG+Bxt7YmDgp7CAbriY+xRq8XB1QpXyXi0=
Received: from PH7PR02CA0017.namprd02.prod.outlook.com (2603:10b6:510:33d::9)
 by SJ0PR12MB6853.namprd12.prod.outlook.com (2603:10b6:a03:47b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 09:54:52 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::3) by PH7PR02CA0017.outlook.office365.com
 (2603:10b6:510:33d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Thu, 22 Aug 2024 09:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 09:54:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 04:54:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmc: Fix SMU command submission path on new AMD platform
Date: Thu, 22 Aug 2024 15:23:56 +0530
Message-ID: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SJ0PR12MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: cc77acc6-b727-43db-8dfb-08dcc290781e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PKd8Qs3OQtm+dTJm70iTtEE/vY1yPRkg/Ncd8Itu60YXj9cSOwwGh3PlAA2t?=
 =?us-ascii?Q?F3H+ImVN7YtJCKYP36mtrAJhDZ7nOCtqbXjIJzNnWoTRw6LBmI9upKTgq5gk?=
 =?us-ascii?Q?goB9CleLbqT9Qnte/ihaC11aFxazS/29USXP+gIFG7X1VhjNehDV38ArO47N?=
 =?us-ascii?Q?ZwTjoqirVPyTRgPIsZRPi4M+hrcybyEpAbe9SQdNNQHwMnO6MQNfc7Lzh+xp?=
 =?us-ascii?Q?qtCv9Dcz74hjOlrtQ710FmUtFGy4Izu26+aNw3nMli8kYuPGWIVMloWJAEzI?=
 =?us-ascii?Q?cxTySg8tRSRF/0Kgx0wns2goOAOQXH055hKOcqmvcoRVGYvhk5TRFeONaUBE?=
 =?us-ascii?Q?0I8uFYD+E8SCcOOwB5S+0IzCttME9Bsx+emGZ4NFkDYY+xdPIj/KzluPgbzE?=
 =?us-ascii?Q?7GCeXSz4AQ33PwdXKVl68HYwI75f6L++hReRAGkoAehgjUx0VbQJdlv0ehgn?=
 =?us-ascii?Q?T94+ag4KOZuU6C4vpoH3cvHp0jZR9DVY3VJ5K2qgEKV7EZWN1uHh+OvpxeVv?=
 =?us-ascii?Q?fJ/WC/QXWrGNYrZ22oDJ455T3OuCB5w1aepzlRrgkuaND6VrR2ZZMfu+wvun?=
 =?us-ascii?Q?nRluGceey6xE6Jq0Wh/wWcECI0/OuOoWRCx8Y5kGQ7GFEEaCrcx+KAuOskDD?=
 =?us-ascii?Q?lnIRa7ju4zKbUrhTrVl7DRgbmy71rynjsUzxOC/3ejRL6SbwFjzRcdL+FRgm?=
 =?us-ascii?Q?/t61MnXyg//0AMADYTAn63rL4cczIbKrfmHawEiBfGKHFBDKYlbUjNY2Gfvp?=
 =?us-ascii?Q?1XGo8NWZgYSZn/+Grl/RnA4n9ApnlcTD1UkfooaI1gOhK7KhNLfER0GB873g?=
 =?us-ascii?Q?CfN3PgUw/K4pPmKKXjxtVVmZPg+xEscqk412SXc1QnK0JnNLoKyX/HhPY8td?=
 =?us-ascii?Q?SeUB+tAXmswwLWsBxlsdjDb2tfk+5FgcfUmlL3ZW3/lSfKKAxDR7xJ36pzt0?=
 =?us-ascii?Q?o7qLf1YZB1q4Sf5raaf9h0eLItM9KTHlAod6K7/rUqP0NKCK6G29NMi90E78?=
 =?us-ascii?Q?xDcVBzRh3NybCZ+PUHorVxwAnrV3TGITA2QF2ZPir0vWu03ocN5CkJKWdI9d?=
 =?us-ascii?Q?ObHmHyp3mxrRfZ1Hu+3VULGhRznfqBlveaFaDW3/XQx7aLj2MCXqCci0fNh1?=
 =?us-ascii?Q?/pTnjxb/0+ohG+dOdWgB5jSZ9cE3z4YAQLOwo12eQaaS/9cfUDA5fEkRulwi?=
 =?us-ascii?Q?0fbE3aILcDktq60CROieBO+s/iiYfzSKtMV5UGLGOpnX8HaQfzCdkbXb4x89?=
 =?us-ascii?Q?t4Gm/EHp4TYO4VXL48MrN4TtcAzs1jEhFwxtkhNnkmPjoUs/zJi2UKd1Di7H?=
 =?us-ascii?Q?KYaLVeMTTWRGvIxonz+1FYuRCmAgSJczVCVvmNs2hDTg39nA8bQakP3MsxpJ?=
 =?us-ascii?Q?oK/gUmvJWpLiKn6Upjt00Usoiy5HpTKph65F85I9Hxk6uKEVkWj2//sy8Wkq?=
 =?us-ascii?Q?mUw42SAC0AJQXtOTreF5cqWpNqMrMxt/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:54:52.5177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc77acc6-b727-43db-8dfb-08dcc290781e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6853

The commit 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for
new AMD platform") was introduced to enable sending mailbox commands to
PMFW on newer platforms. However, it was later discovered that the commit
did not configure the correct message port ID (i.e., S2D or PMC). Without
this configuration, all command submissions to PMFW are treated as
invalid, leading to command failures.

To address this issue, the CPU ID association for the new platform needs
to be added in amd_pmc_get_ip_info(). This ensures that the correct SMU
port IDs are selected.

Fixes: 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for new AMD platform")
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Split v1 into two patches to address a fix and addition of CPU ID
   support

 drivers/platform/x86/amd/pmc/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c3e51f0a5c33..f0d389cf1ecb 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 		dev->smu_msg = 0x538;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		dev->num_ips = 22;
 		dev->s2d_msg_id = 0xDE;
 		dev->smu_msg = 0x938;
-- 
2.25.1

