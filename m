Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456153AE6FC
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697403; cv=fail; b=cOnQzWrwO0WnIC5T98z3oR3mAbzMKyo/1KjA7CTZjIqD6o+t7f06ol1bUweyig5JJuM5719oGe6BTBvhOOvLjqWT03C+UAK+0/zJelnPjLtTN7nKUa/CAaX26n6ihwhOe7Nh0+KTyvyG73mPiCpcZliHTzT/KoH56lIWTjyzYMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697403; c=relaxed/simple;
	bh=wYPppLtQZH5np58DfjcaFLq5MXZWaLH8brck8KTK8J8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kCvnze9pIqlJrjCmnwS33gWlNT2yKdl697DnoLnj78z0gran39J29hgci+rBON4KQgC2wkLGItXsXe3CQujEIVrEJBtW/2AJtQ2g6SS2CEqb7Ay10tK7YH8Z4xtMbcz1mm0kMnMPM9j+CTZ0iBGQVSGhgzEIWHT7FRwOpTi9c48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kHjTN8Os; arc=fail smtp.client-ip=40.93.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kHjTN8Os"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc8ueCq3p4lgNH0X1A4s6KT9/RVZAKJeE/+1A4EkzGOUi/5qmTZuXRVouVKDklSJvaxZ5k05/HosDZ+Xf0WDLg79+aXqxFrgY2jIfniVxlAEuM7fYUwuuMoFmb13oOcgjCl5ful44PC1XpKA9v+jAwRV3DqD/rdmcOIciv2u5Oieyj2Xdz6VD/jsVUCMDsGgrlKjAmqTTVe298GyqFL5zfzf3gx/Inmo4Ti1STWXULuBIMz/wKVDo6bgoPYVx+qKlbvhbxwLe9KhvTRJmFZoVwv2/euyrFWnRvk1M/GsvYOSumXNGOvBAa1nxjRJ2XBgG4jQOvtheJndBiSvWoDoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdfDiLdocz5tODE/do2bw9Vb1nEfkQmxDWEsBtltndk=;
 b=eEYMKS6k/QP5ArufbKSOX7JI0/YPKkdZr77EvinwHNTYTM2WTUYreL2KcFgdJWf/fufOcmKFFn3Huq3R9IQOa3GJMHh6rTF0FYCjbNa/Xubjs1alrlRUX5T5K8pdQ0bKoYMmPWSPu0fkkvClT7b/b4ubhhMf8zjUa+zsNY1Jlcua39ojQnbLfvyVvjZCtkFu7PBXoaLofUZdpYEurwGWVmdK0E7EuPHKEY0Jg+Wa6hVs+2Ku453OJhAkTSKnw/51LCyp5pqoLjcpt/ZK6rezqSg33Ik9AiOvrf9Q/vlhuJk01Cd36GRhg67txCA++r5cJXOc7Vek9fuog4Dyvj33/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdfDiLdocz5tODE/do2bw9Vb1nEfkQmxDWEsBtltndk=;
 b=kHjTN8OsL+Q9cUwY0lB5KlTgYJh7vHybsDmZtibNeWbxr3GUMQ66l9jNqmPsVuKCZMpUcidSW6/uYwzuN3lQWGG5TWQp6XG0bfA9OUMhiUFABjASfMQ54EUJ4YQF/Ih3wCqVXsvF7ThuVc8lYzYFDBngNC2aaBmPTWdbgD9Nbm4=
Received: from MN0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:52c::21)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:56:34 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::64) by MN0PR05CA0017.outlook.office365.com
 (2603:10b6:208:52c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 15:56:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:56:33 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:56:31 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmc: clear devm-managed pointers on remove to prevent stale reuse
Date: Tue, 29 Sep 2026 21:26:09 +0530
Message-ID: <20260929155609.1712638-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0564f0-c029-445e-b44a-08df1e423c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	bxi17pL5DIbo4cvzV8/VCGsyX+zAWsddsicwM5Y3Ahpk5Ynz4Um1jHeGLJhxD2N7Rfs5X7JUzoveEMXC1MdBRHUS4pC5yu3Qfv7lqw597aEhZhqvKewEh8djAJhm/Gl1spZdpKlKIBA+COA7flAWuPeP0tNDVgtRQ6+HefA1pNhkq+M06pVIqoQUA2FuoK3XJqzvCxaPR70gs96X/o/v65qXmeV+FD20oMyDQD5vWtWW+fgcOmcvheJUuCnYn7aIKfO/gqTMb7IgWchJCHNIaMy+KBFL2NuQqLpKbAX0uYIive1WsTcK9zYuXtZy+7etAoNCN74Vneg99JP7A8VQ3ZwpAXpUuXjqxQoSK+sOl8Db6OQStHYB79BJfQYWLymBNtLsd3IhXryopM7hDb6FAoUuXff3r/JUZ62e9dcR3XbezKY2JQBKIg4YPvlfVJ0NJm01zu0+zz52NiXzOOzDBJ95usYfTbUd1/kj6pMniDrduPJeG1ZPvUqaPWegFIUwsNCdR8UcZeX4Osr2V+t+30vjNZOJcPjJTBo9uH4Hq1OCFc6G04Nw8Bt4SiY7/uB+s2Btiw/vBly1u+2Bpur1sPFxYm/Hd4DNEOqRameeHwFiy7LUSXtCpY9UsWFJFN6OmvzQw2hSiJACelXgO1iavv74ZiMLgrnRfKjYAmxqrCuDctGNtODF8C5WiTSrviH9t6jrv5ZRgjK48BFQShVTuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ATK6IFGoQMpllkfUuOhRQyQ9imzjDnLHSbgZJBRJFe3f/OokDK9+SbZFF231td1ZCbT+u8G0gjnF9wok5heOy99XifiQNMVvAtWTRJcBcV0y2+clcCpbVJmWH2Lf2cSCivSpLUQuZ3my2qYkxnQUsVHsuMukCGtYh4h9TzybMVzqKqAdge9KIXJTQ5Je+BH19DkZQF/r3gD/JZOsnoSeERFUiCe5UBIHaQkyMtnszcvTfDG1RH0pNlRmQstnZB2SWs0D6e9NtO2LVV1/hoUr1rZ0sCBM9HhffXU0OpLEt71iz1GyWOQsXaD4Fa1O5+RBI/Kgzlc/q4fCbjYAnD4diS2fwZzCWlNYK1jNO/C92ymaMPqj7xIp9twubamdFZEZJnIzjd/YR2o7h2MI0sgm0jajj+BqsbAMhUscljOsH9KD6dm8Nw6jYCw6ZOy4XrrY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:56:33.5713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0564f0-c029-445e-b44a-08df1e423c2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919

The driver stores its state in a single file-scope static struct
amd_pmc_dev, which is reused on every bind. Its regbase, smu_virt_addr,
stb_virt_addr and fch_virt_addr members are MMIO mappings created with
devm_ioremap().

On unbind the driver core unmaps these mappings, but it does not clear
the pointers in the static struct. Since the struct is not freed, the
members keep pointing at the now-unmapped addresses.

On the next bind, the probe path re-maps a region only when its pointer
is still NULL, so the stale pointer is reused and the following
memcpy_fromio()/ioread32() touches freed MMIO, causing use-after-unmap
crash. Clear these pointers in amd_pmc_remove() so the next probe re-maps
them instead of reusing stale ones.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 7ccc2caa0f2c..8c66425d4ec7 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -958,6 +958,10 @@ static void amd_pmc_remove(struct platform_device *pdev)
 	pci_dev_put(dev->rdev);
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_deinit(dev);
+	dev->regbase = NULL;
+	dev->smu_virt_addr = NULL;
+	dev->stb_virt_addr = NULL;
+	dev->fch_virt_addr = NULL;
 }
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
-- 
2.34.1

