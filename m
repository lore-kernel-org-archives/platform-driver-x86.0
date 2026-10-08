Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4A48986D
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451831; cv=fail; b=H4bOZv/WvU5yAhSuG0KGJ43vmzmCr5GAOtGAA0kJnziG18ffvyNtYE50onze25e3icxHxVGfQ+bhi+wBiHoLvPtKbRMA3vhOC+t8//car7BpAV03BcVYZcxbsZXyjx1lG/eoSDAa14OgF2pR5jiDJtFOa2vLFaqRSwFI4RUtHfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451831; c=relaxed/simple;
	bh=Sw8+ecTEWqhMwOT/O/iAx+E0D8t4rQmQCU1o3HifuRM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+gwAC2zakiFIDQ6DyBScrlIm3ygwOtRH1zgxvmdIYxK/0H8PY+mctLuyi4JVzhyNaElR2q+fNIy8T3H+WwrKIF8ylXDqNCd/9nAN2kUlu9uyusdr8rtxOLXyGmGwTtDKOCRij1SuCs83eyJ1Dkr8xf/lLbqPLz84VjDZUupjlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QTNG+aia; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QTNG+aia"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpeZIePObsEgB4ZYifgXEveXU27YW2Zhe2Rg1B7bMMefEB63DCCOug6Q4E+Dk41u6D7bb7oq7+kpKsga7obQcyRtb6IN09sEHQxl/1410PiPF2Ci3qJWwlBlgkueLw4lZRd7ctZe+pcE2KkYLMQ9iNgUoEaEO/JJIp+zzOGFQM5x2B9pdBdiKqE9Xxq9JsMRT3p2BGreOJ37m7CjjM0PjMOKhr+bwfOBflrp1OGf5fcWqhLqgUrtseLPl8k2AfTbJd2GrYjIaCdDou+qKy/rYCdGtzLE80QyP851jw6RLmaGxZOBe5ChGCI/waVb2jFBs0vj8ZcVAQk/AbcCwUZ13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr2c0837WsF0zJAaGBu+3lxBGuRht6tyfueTuD/92GY=;
 b=M7He80ZKteGjvaQyAih+7y6k/KtGpzNLmI72YPXdPXrZKZIWZ1sqOI+TJ2ll7duyohMvk7OX0aJTrrr3+Q9wQVr8keIAVFvuLLq+0wQBDvCFuxYw9P08rO09XzkZDOKQFjuRmhppahguGqiBtbA0nj5uOw0ULQcQwsn8KpiKya+QTUpuHosq48HexMsvIuiJ4DCCYoFMUHlPDZ3e9Ty6V8B5nv91aNey3eh2UcnhLoibMCAWw2g2tslix2j6L4A025mLrPVppjLDrAwcNEm7F9Z7KdsdtcGrSxX717/h22DXx7h3kMc7yeA0hnHJk6Lr5hdzK1Vu1ck/eQhRqx+m2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr2c0837WsF0zJAaGBu+3lxBGuRht6tyfueTuD/92GY=;
 b=QTNG+aianjQe/j741AK9c1aqVYrIy7c31RLc+R0AB3ov44osRnfll7jZmc6xDJHCtF/GR5mKeOgbAX+f//03eltzLl6Y87ElJ8lB8D6QNJc2YqZTuK4DN3txG3ukT8xm9mMB7AL5MpORhUu2LJiPMUCUCSLixROkWpcyg4ikOmw=
Received: from BL1PR13CA0167.namprd13.prod.outlook.com (2603:10b6:208:2bd::22)
 by PH7PR12MB9201.namprd12.prod.outlook.com (2603:10b6:510:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:30:18 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::88) by BL1PR13CA0167.outlook.office365.com
 (2603:10b6:208:2bd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 09:30:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:17 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:11 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 06/11] platform/x86/amd/hsmp: Move the sock_ind bound check before validate_message()
Date: Thu, 8 Oct 2026 09:29:34 +0000
Message-ID: <609a6cef93b17793f8b3cecf637e6802a577344b.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|PH7PR12MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 9851beef-60d9-4f39-e1d2-08df251ec3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dQa6v2QlQQ/3ykwuXxQHHvkYZnVHykcR0VpV9/LMRb/8R/86hmSLj1jzPgjqkWjwl9lSdlAscuGaCmrDcS8GiedqpzW4eG1R7Ge7VZnCdwhg+HBViikIicwO+jSIBam7NeSjdtDEPRgKE+8tAoqDbsvwo3S+67eg/noSiDpJxZCyKc1HSvrDZSPmLpR1ED0c3fDXLSyZ0bvvj6sUHBxIp5gmUmfm5GFKTiIUgVGQGWcOwe+CTWtoETBGDS9RTBwiB2jco//oRmNAR8FBl2T14yRuaKCmaXhtGK1FQjEtV13ANlcx44jynWen++SXiFBXatsPHuOqFBmce0gbODYGQEZwo5GEW8klDstGqvoADSkx16voOp6uA6v3f0b6Oav2ugqcyPPk+DQypk3L2vkeHTWAG+F1/DU58Ev9vnnzxgl5dq3XkRF6ts6hvTXbRPRY4bdmSXnIwxogHzKdlxb0SdfqAUF9BNTBN48uaJC48uvdsRHtozb1zqEMyoYNndisry02jhb1Aqk+bCjEvjkmgz7eDMGUnjJq9J3nlx7JaWhvsXEjsVM9J/xbSd0aO1DsfnFDjhczHG8P5n/TuEQwd58QTk3YvQ4ggcFaMQi9UPmtf8UzKeuOV7OIJXEEMzdUWzYlNfRSF4x4J8f23rJmYhvL20/VHr/a2bCecuAE3/fbyCea9ifhgUCg+MW5dQ8qYdF7L65xWW9vdJ1yyBGWYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fu0WxkY/gFLV+od45jm5mX5FvLS2drD0MBhF/OGyJ5QE9DPH7DTwAEWP+wGBxmZnXmtH+9ia85c7Ma1NAo0L0pj5ja2J7bMhNM3bNJlCN9GOhC8T8ZxkzvPvsh5W/S66aMmF4aqjmmMoVXp6x5KLYGl0rv43KWqBr1gV72fYd8GkvWz4GkG/t5RPehkPI0C5SRxtGtA39LrGtGASRlgv9eqnSrJZN0xbox1RADAuympG8aIAB/xWBI+X6pAZ/n8yiyxS6HiTRRDNJTa6kjHdOlq6cQkCas5oHc/NfU1ssW7YO9S9b5wpzLJsF3UhSJh9er4/2m/wOZ85PyiuK+pjdKJHihvlRiqFp5M0Xq/fAvaC//IGIq3XflUCH3J9ZUb7mMkmOmrz5ktrqL8LmjO6pvsRmuFi6NEs8ffor/bOKfGp7RmYx5mi7ip+whl+/klf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:17.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9851beef-60d9-4f39-e1d2-08df251ec3f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9201

From: Suma Hegde <Suma.Hegde@amd.com>

Move the socket index bound check and the hsmp_pdev.sock NULL check
before validate_message() in hsmp_send_message_locked(). This ensures
the socket index and socket array are validated before any use,
preventing potential out-of-bounds access if validate_message() were
to dereference them.

The subsequent patch uses sock_ind inside validate_message().

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 788a49404875a..8dc1fc75bd9ba 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -344,13 +344,14 @@ static int hsmp_send_message_locked(struct hsmp_message *msg)
 
 	if (!msg)
 		return -EINVAL;
-	ret = validate_message(msg);
-	if (ret)
-		return ret;
 
 	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
 
+	ret = validate_message(msg);
+	if (ret)
+		return ret;
+
 	/*
 	 * Sanitize sock_ind after the bounds check.  A mispredicted branch can
 	 * still let the CPU speculatively use msg->sock_ind as an index into
-- 
2.34.1

