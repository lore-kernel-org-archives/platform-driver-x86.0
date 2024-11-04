Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F118787C
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 06:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730700213; cv=fail; b=cakTMsKHKXTOtDun4/tCBHmLGiF2XyAfdLCJbF3CU3hs6Xw4Y2i9nULK2cvureHHgIWkfzNxhaEH6jNfCMTpIBJ8G0DuSw5osVd6wuQ95pqjXd/qSYkisY/zM43cYkgAKGxKgleMt3Dfh220nC4Qk0JcDOEr3VMSD6BjJxFX6ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730700213; c=relaxed/simple;
	bh=ItW5utDUGv/PCLdFfctDRvtrA9potxJI/S0dgPBaZ4g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/AzUbL6k0G8PiuR+5myL67v0wZz+CPfEHVUrBCL2BHrfC2UyqSbzcdzgFJdSXM5XlfIaEct4RxR5d1uCurIi0bc4znFbxFRsH9PlSGBfx1kH12SZPjWnQ0T1GvGf7lbbAGB1KIiwI8F/p7cz6XA7Q984t5Uh36CfDs1JEjc1eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QEgYPN7a; arc=fail smtp.client-ip=40.107.94.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QEgYPN7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNjzwdS2rZKq60xlil58qGiBCnZAyijtodnsED4Shvt4BTViOmB0SKj45Uc/hHsHAweoQkchdP9aVyIsovcE1CYgBFZbPnikOx7j/ojAnraxprFXkU/ahCjfhOzJ4izpO5/nSw0M7ddaDmlMZ/6Xj+FtSKoJqyiGczXfCNu9tB4LQPs1K+eohB9LK0wRV7viO1m00c6YN9rpYPHFqAiGi3oeHvBtMWq2TxhtwlL3Ufvw7VFPHtwGIl+cJ9WheosSoI6uoDIwc9JDnwjc14HPg02xKvFqbTpD6EqumYXtn3TpFGdHvKJ6AEX00Wq6nboOv4CVstu6FiKcg4VofA5yjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmZFCE2fbom1Ithev7IUDq1fhChqMuJCyI+0iix+qTA=;
 b=DNS8aHL53DYhLLno41VayJCabz38bIpOqnPfgHY8TjfawWucs/8xwcx1tO8QwMXPJyYWINGag05pMTB8f1yaIPjhIxswJ7uBgpk5WR9M8fuqDe7N8Ij1fKlqJ5YcHAq0zMWcwrUUWiLPHGo2qIG/oOtejLrNR/BbAZd2qgvZc1bovfAC6135Ot9CoS9ZrJbK0a7/Qa0vgM3adlxR8cKSBIGs+HeatmhW3bxO7RLsEoyYD3ZMAkYKt2a1nAZwsvhwfkGk7QBp4kZIg44wtux69JZW8IJZ4hCulQhqbMN1zfUKkpjJjI7iXG7GAM0paIsUqHdrhvfpeprMh3A6Yuyu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmZFCE2fbom1Ithev7IUDq1fhChqMuJCyI+0iix+qTA=;
 b=QEgYPN7aKCvP+8jNIY7ROwx5SklFInPEWLsFiK0fio0ccI8hTuihCBcxx3ll6tzjSPciYu1d0dtoMRAc+F2yg4HunTmoHX+AvxYA3ThDzp4Izg6XktTSIduxMt0r2lHgSrdvheTKWtEUiQRvL8V4H07fmtzcvRUSvhZSjSoKaJs=
Received: from MW4P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::8)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 06:03:29 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:114:cafe::ed) by MW4P222CA0003.outlook.office365.com
 (2603:10b6:303:114::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29 via Frontend
 Transport; Mon, 4 Nov 2024 06:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Mon, 4 Nov 2024 06:03:29 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 00:03:26 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 2/3] MAINTAINERS: Change AMD PMF driver status to "Supported"
Date: Mon, 4 Nov 2024 11:18:28 +0530
Message-ID: <20241104054829.620858-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com>
References: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 7915826c-96f7-459e-a824-08dcfc9667df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mxxCBpcEjHOgUzlC9HoZ1nIofOqIH64Qohe/eDsvp1MhaIhu5RWTKudNHkjg?=
 =?us-ascii?Q?VsvtLJItkqT4XiOqqxmoaB9qyAbdcc7mFy68ayRP1mv+yRJNpQJ1AYYy/BZx?=
 =?us-ascii?Q?TK6behYoeeHuNfLS8AS/We8FLHNhVCPmA2AeJLZKTg1bHAa6LJDTGBMd/3AS?=
 =?us-ascii?Q?fr/XVPXuGFCQ0VtGLX5y820IHBSpVO71xcpBupg2R9v2yS96Uu0fCa1qr8qU?=
 =?us-ascii?Q?QM+7ekbRiqx21zw5XHyrD4L5C2MCktkTg8cAI3XUXTLp81fLVykHxUoQqHmV?=
 =?us-ascii?Q?56JKf0PqDO7Co7HvdeVqqPpf/jzFRIZ78xv+JPuyECxTaTLYowdLhqJiT+0U?=
 =?us-ascii?Q?QRX/WwBEXiyEoi6uMuORhI/gFZBP1eMjWMtyhxWor4bKrPJpDFogLVId3cwe?=
 =?us-ascii?Q?Yma7r/rKmX1qQnNbm4c+j54MZz5nkWow2+pHL9bGIMz1aU3roNYlhrWd6bTm?=
 =?us-ascii?Q?+YGJ7eYgr1/re8eZOoTyACcnjrlzQa7SUmojA29NH98kj9NiAN+VkTXHvVLd?=
 =?us-ascii?Q?4OnqZvye8rMk27UKStYY260BVdqodmyGdqfMBWPat6G97jo16hQStFNauetW?=
 =?us-ascii?Q?+b5kfVNVwkS4vCKRGgpZqzH9WDuVQCCKLHq/H5ZWKeYftJ9VZ2c0ztTsM/mj?=
 =?us-ascii?Q?lx2TAMmWExbnIbYo7zm1BCHK4T+bzhv6OJCz/YJZZgVAHZUZLpMdHITl+pwK?=
 =?us-ascii?Q?7HhOYILBhIvQXp7/bFzcYe6ImlwWSeo0NJYOssiZLw6pRauFsIGIj27Ydftn?=
 =?us-ascii?Q?KqLjoqicSCtPjIOky7NUHXnrM+IUdlnm9SIZSYQN2EXaFbJs/JV9KF5OPlaY?=
 =?us-ascii?Q?wBag5Pp1rrslkfRlOeR/qwaN+/8FUsOqi9htDuf7/vBQkDNa8kHc+B9wni32?=
 =?us-ascii?Q?B3FFSeZgoFYKQloJjokS4hW0MXLTw7IX3B2eRO8RMMvv886eKWGpBTbTI/d8?=
 =?us-ascii?Q?bQ4v7S/MTp7gYE7xMghQ1t9tnncVDm8SiKry24yaBCxzgC/ozithXgUSPbzQ?=
 =?us-ascii?Q?NrXN/8zK73PcWre5fC8WQo/Rr4gIeLmOMcBcSBIlm3+v6WBqmwVQMrXTgh6b?=
 =?us-ascii?Q?itbXEbxIw/mO32Ma4ddFuZ32cBQkWTSTRdxj5y0y4ULnNvPVL149SE1lDJ0P?=
 =?us-ascii?Q?SLKxjhqDexBoN8EdIZRAA4LJDG5fNaaO8nYFLJmc3wkqKaeCQarwF3XVf5oB?=
 =?us-ascii?Q?dE73OCPy7vGIWaKfOqhU+FspFnt6NuCyi1ElK0cGy4jtBxPJLzINCdyiucVC?=
 =?us-ascii?Q?YnIaXMbURkx90gfmoRtMKNS1Hcz/5zriBQTY1qg/NRDY8Wv499BQKjemOyvK?=
 =?us-ascii?Q?X1ph64KLqC7mTAjphwN+TZIb94fcxpA00S8UeJhBF9EaNasBxdCBz/mYCfbU?=
 =?us-ascii?Q?InstEA4xTiwdEhH/jEfav91N77XN6AdYmt6whS0wCC0jsJZTPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 06:03:29.6210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7915826c-96f7-459e-a824-08dcfc9667df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921

The AMD PMF driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a27407950242..87f67c52d68c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1124,7 +1124,7 @@ F:	drivers/platform/x86/amd/pmc/
 AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
 
-- 
2.34.1

