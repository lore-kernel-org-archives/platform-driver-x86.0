Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64846AF03
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805378; cv=fail; b=E41Uy5gmx3xwiX07w9kxfJ6TbahfeT+mYKl3lw1GKi7W9i8YEBzzJuMSvWWJEECQYLrF9ZrYoi6C5BQuZzPzFNWAfYQ28I7H97O2cl6OzfAbeoDTFlE7Zt+6YcqDw4rUpzN6kEysr6R2CPZ/WFPV2cQ6e2zHE+qi4v5FCTkGSQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805378; c=relaxed/simple;
	bh=aUYsicX5cCiSwi+u/jcOlOa+jS3edtGC3z2PP/e0Vl0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPUmyG1RS006n892ZA+iaetEGbcugXaUX5cW/XIkgpNu9OBBYbBjnPqyT+MHRKXfRULT2temMMUS1otfU2xRLJC2qY3L45yFgXA8YuOlrHdnn4TDJMrF2trHWkQ5XFGSSZzKZWBaefDS1cM88UTLvyb9FmCFlQnEq8FWLM8af/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=33MY5tUu; arc=fail smtp.client-ip=52.101.53.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="33MY5tUu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4kSn4OebOuplLWGEWKJFbm9oTL+ZLf7UQdrQw44yNKvP2Vxk8tzzii8lZHqMelOlJcu34tiWSgTYMompwEHGvckjlMcCsV1w4HtqmNAdP3zSHSTvXFzVTEpFoS2aQTk5nUL+wrD2MvhZDzkEZVIgVNNZHijSdUBeKtltqUsVBhOqQVMZ3MCMiALpC5NNa3BLWrIc/gXjG188kO/iQm3JirqGVMcA/NW5OSRO/wxPJZYXp7XC3UE3ai5Z8CBuBabC5cXPOzz/Kc6pseZYVZRJOT0Q/wQHJmIPE337b/sCyeW26FQRSkOZD9GC9DlLt99MNLDscolHp8kHcYpL7AhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhqKh6KcOWXUbR/dc4yUuCe/n3RZiryQ6eKqGr8pp2c=;
 b=OHFIaZkcLwPiu1doKt+CpsZEJx72t4BwKgwFkdPDkiMBwiOR+VgdHuwH1CvcM2t7kjlbl7xf3ABhXrD14pxhcjBbUd905yrcsAZFLz5DnMmb1gRqtvf7Jk0twb/+v0Uw7Exu4efKfGv7JHW+hajtvGRYgSub4TGlKYb73j8FFdbOUA0ueeTd4tWjXHatpRNbn6sZ4MCIFJ1oY1/w61cgXeqEX41zOa2id8QYQKdCf/DhMSY0Yrn4yA+l7wHnJA9hg+Ycyb2dS3wpdxyUXiaDK8w+Nm2jLjtTKZGCIlTURyqSYtJynnlBRDOAoKe41Z3kvkJaiW1hG0wx80CiZmPZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhqKh6KcOWXUbR/dc4yUuCe/n3RZiryQ6eKqGr8pp2c=;
 b=33MY5tUuPbzdQCrMgDB96CEkelELq67u/gjoKAssFzX3NFPTYcjrmOYTeud+5UILWyCzbq+Jr3tzja5moPcnk7TmNLW7CsmaBJbxA7+K+1g234wSkEjiqpC4qUbDvjI+QB15KgDPcxB6S5F/CyQMSlTGzbcOfUvMFbQcLR2TfTc=
Received: from BY3PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:39a::17)
 by LV8PR12MB9408.namprd12.prod.outlook.com (2603:10b6:408:208::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 11:16:13 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::99) by BY3PR03CA0012.outlook.office365.com
 (2603:10b6:a03:39a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 11:16:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:12 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:10 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/7] platform/x86/amd/pmf: Add missing newline in dev_err message
Date: Thu, 23 Jul 2026 16:45:31 +0530
Message-ID: <20260723111534.1940925-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
References: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|LV8PR12MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f7e197-fa1a-405c-a3db-08dee8abce00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bGAhNkGODAjuLznY3qNgAKQr/UKymDD+FunWrklQ2WSAHluNZejl0oUX3YkC6zD0nBcyEwkqiVMkWEOVwxdNdVTUaDh5C1W12BoNX8vMuc1rDrAZbGYSYzvCeHZFWwLlyfM9yhmec7Wu/lRLF3lbKfJJ4mwWboKNc+JDgqDc2iFHyT3npTlL0WR7igMtCsCP7cHNpmXMy1nhOGj/pWuEGQ8WS/HlNX7xsRq+f4sZ1BqTwdryQb2SLvOoWXI1R0b0WaaeKq5+ZFibqBk8lDguJQuXNgbELLrYjN1Js2pqP5jq2Wnq86Mi99fayAwe5mMNgfawYGxz8KnEg8Sl9062WlRVa5aVEySM2BEhaJmW3gO0J/tUk9+9YL1Pf7SrK3ynsbmQBj+REf6ihRmDCfB6dZ5S0OyjwN0e0+Ie4XwuZlcPRbNwooahFYkGlejSNj0EEN/L8vBsOlwpudM1sW4jir2sZE+E3Tn6xKcpNdlXlqHWFi4LBxS7ooxqfWEKOAPm5BCgSyX+9i4IXPRCU6Sm0EdPbj0EOXypzTAC7O52bVQrsRMMxxuPjJDcFq7naWdDJ3kK3AJG3qi9h7CTk1BByU14H/vfeUuXLlVWkcaDn8R+LVVFIQcmzXypqCaTVe6FV+R/x5nkF5dCQJbtq8Zj/67+qv4DqV46u3ZC6NwEB+LVPQsm6ocnEwGW+gdVxqRQgCyIiSI6wPvxIHgfGRMzDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0FHXLNi98VDl4Pgf0tgAHL1g0UQc7v4lJ+dNGnnTFUv4EIQ2TqrJdLeV7u3iwJvpdiTvn1W+gsPshPS4HpCzDZBsafrdz/EmDn9s+jnJ2uZlr7qobKl8Ikfe0O7seqBwaiW2MPxY4b1fV8qdiSHzK3zAlovyoRVW1rhbRmEGn2V/mCxUTE/yaSrjACHY0rHeQzA64AyW3uYYUPknkrnmOLC5RFppvbqreF4AAMi77ymEHRqXrp1iJrcQNzN+rNjzUHU//xm5ljqVlVE88yLrM91KP+FqRegRHHQVkDmik//fvS65SkfBiuPBSKAB58X8GSV1c1a1LI76w/QRFKwU4NjFYmZGX3q9fJTDsbsdEq+G1uTf/P08YufGcRTtbNzfrL+vfbxb5hHofX9PT0Gxcdvn90Gw4raTUlVFo52/fAWDbrulLmrX9PngPUR14H/D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:12.5119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f7e197-fa1a-405c-a3db-08dee8abce00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9408

Add the missing trailing newline to the dev_err() message printed when
an invalid CPU id is encountered.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/metrics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index e457bcf490b6..a5444ad52cf4 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -73,7 +73,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 			dev->mtable_size = sizeof(dev->m_table_v2);
 			break;
 		default:
-			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
+			dev_err(dev->dev, "Invalid CPU id: 0x%x\n", dev->cpu_id);
 		}
 
 		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
-- 
2.34.1

