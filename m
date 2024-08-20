Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE63518CBE2
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149834; cv=fail; b=UAQv8KuKvSUHmZQ48LoTNc2e82/roYKf3vWRfGn5SEUDTQu7+wmE4qo2j4w4lbok+802a0nAzJOMeO3S9C4kxN+KdbzHCikjCrHimbtMA/8fAgps8e/bfBgCQiRa7K3yiTOPXkymCxx64sikQln+vvgZHVgyZIK1KBBaKAMFI0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149834; c=relaxed/simple;
	bh=Q07qucCdy5R6dLnY/DxXQ04wXCpSdmzyMMYKvfJlanQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kal6vHgJ9Sf5KVuMy0DoHK7lPkB7cll3piBi607LgwXp9R5b0UF8guq1IqcgKVTjeuUJpfq1XHWLFY/KLykiRbEMb6WIQ0hbxRxBQ0/yziuaju4sQPuwwzBFs/svAvFoGACRLEgL0Wv7yLU0fEsvpxmF3uNnxl9sN1ihJzCr0BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4V70owjP; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4V70owjP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4ukbRe/ClxVpIGAyCoqCbOHnx0DUXs1mC44skpZWIVcMjZpbvUEoXrprsczqBBootnHdYC6Cyl7llUlptfLRdjKeXBtcd7K4TJc5rQ0rUiEm/DH8VyyjJdYC6S2hZ1kmpEzBmG7gmrxAUq5P4xpxODx4dLHxHazTanhmtInkIPeg+U0DDR65SNxzuRLCdpcnWj0Lmm717kiBXG/wwqDkzz5cnZePo/6J3EO9isZ5aIx2nl4waZxwdawIHFleTeceNbkT0KE/6YGQ0PWLOr/CBHMa0kOclZCF8a4Nv7YdfTFMZCLwxedw4uzwljvnHm1UnR8HUvvd6IBD5tRb9uBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQQhoFNBlcYK/JtDINTKFxtNxD+idWFV8oXhFz49Vu8=;
 b=EnWOnNp1RayFeA8rE2nqblvbk5Vk89LuF/KeipZmHecmfbTbb4MmqTD4q5hBtKAkDXTkZ09GxPyOuEg+KhWaIyfOueLk0hWZDLDANDwnQyKUwA0ravTEFrTUtAu+92t9ffoXv+fblikVVBZmySX+Q/9OZVxLoM3yoCwCowJOiwGhkZfTL1PVj9O/FYspO9aBLBs0Fr4JHVSJCmkCcT9sJeTYHWOvUMRv1dQzDZsmx7ydR99VPsBG1XC7Vh5uWczBbPS6j+gyrUEjZvCh6ollL76L+RgXFgEjGFfq5FGhWd1yuullpvV1ukVxut2WLDOXICUKvxs5DmCH0hbH5cY5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQQhoFNBlcYK/JtDINTKFxtNxD+idWFV8oXhFz49Vu8=;
 b=4V70owjPzc3/R99X/3arSy8QyrCjmr7rc64G6XxCdOuMXfTaNS7hP8ZoQWFp+ERPpohGa1G72GaffxseF8/eDJgGtwFc7HNEw4GiCBneI0/XrPghhHqcoxtfUa7faFp9PY/VPcbVBXReEGPkOE/XSyfPhBh2IDjAmH6vfGAoUu0=
Received: from BY5PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:180::48)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 10:30:21 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::f7) by BY5PR13CA0035.outlook.office365.com
 (2603:10b6:a03:180::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:20 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:18 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 09/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Tue, 20 Aug 2024 10:29:39 +0000
Message-ID: <20240820102941.1813163-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102941.1813163-1-suma.hegde@amd.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a37e77-bf89-441c-e55c-08dcc10317d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qWTZuDyOmoRSNP1FL62gTBMJGgvA6jWZ50nU4r3+vAeDkDilLAIyLMh62b21?=
 =?us-ascii?Q?uhMW+6ZU3GRRCJNRRaOJ06ToGWNnI5tVKMrrp0/tIl+42vXttKtXQ6Ir4p9e?=
 =?us-ascii?Q?c9v/tEt3oXAafkhbKJRT0POgcuQppzExp8L9P9k9IOqP/3HH92bg/nnBW5RF?=
 =?us-ascii?Q?BoMZBz7reVMZIQVt2TAKeH+qLuz0sIHryIiq4QD9p7MZsyMolCGYcxAL5YIK?=
 =?us-ascii?Q?s9ckEcLawXcOVoGe38J2BiGw2vUASxgEOUB0wpIJEpWPFUMbzIbruT1+/OkC?=
 =?us-ascii?Q?LOBh55pohl9BHSwdC/2AdeZ2Ka0KCUB2wdiWmyhOpx89/1aCd1Xhe9lAuM8d?=
 =?us-ascii?Q?HSCIwRXB7KmRzn39MwzeyhrSZpLvNv4p6Ka9rxnAnwy538Ta+eylH4kkiJ7p?=
 =?us-ascii?Q?oK5AWfPejtYB/Aq55fKsaux0T8fS/BLzoctmrR61HxwUU9xON02e2QksED/j?=
 =?us-ascii?Q?ruIa7PrGld+j2mwaTl6jwdmKijsPH4ZavSYrzRuCZDx1b0m3wqHAQRGwz+A4?=
 =?us-ascii?Q?83hqQJJ5MaxPbTYWsjughrmhwjchSZ9ZpyRyZJHnZ6m0fxpivInFMO3VyvOQ?=
 =?us-ascii?Q?ZOWLShmmuNjXAA9/w8MgLustvqOGFVhTkgVbeJLjg4BRk7UcFvK/NLSMREF9?=
 =?us-ascii?Q?/FfNu8cAJIiyr4fAkQlprdWXQe9mx96COU2JtFwXllW0yJPd8Wz3CBxiQOJo?=
 =?us-ascii?Q?YzzqMAqdy9Jjcsy/HbmMNmoGtdyxJdCT/bQibhNtnZjrOyGlhcUyIX2qXuKh?=
 =?us-ascii?Q?3GWEXp5NIhxtezrd3Izurbe6beuTH/b/dNTt0wNggEmlLKN0axRReeALCDAZ?=
 =?us-ascii?Q?8ALoZ4GAz5uMyxb9crMf3SOTKhId623EGYqQbAGWdb2YJZanqkVi5kvHRze4?=
 =?us-ascii?Q?e/aSuBhZ0djxcBBdQGhMxGm+ihCtU3lc8kIE1xhuloeDvLBJOHwbiJqcvSGg?=
 =?us-ascii?Q?QIds2ai3x8Rzdu7nYEmexAErvJWmG3GXWrhH8wQ/WpwGTNAiTSBmcfbE4I0j?=
 =?us-ascii?Q?ius3k6nyfaJP/ecLuevX4+tG5GO+4YUUWMfoXTGQWGZ2rVPngKrxgoQThhMY?=
 =?us-ascii?Q?dd7eFKrtNc5TmNeLOWYibPZSkQ6HkFizWEuzXb5ClUQhNqyc21fKmYonQ7lD?=
 =?us-ascii?Q?IYrQfDmHZTb/5WrOI14GjM6IibGjK+jZ2ch16wVVAPgOxINjFgprL8XGf0Pa?=
 =?us-ascii?Q?mRDO0GG/6Tziz3T6RTXErYlbrdRMojqCpHfGT1Ity+EyLoJP3MpCjWvfd5/Q?=
 =?us-ascii?Q?DJTQnrMeFIMa8IpgJnmnlXi35NbNij2ECeoYywhJ11L020YkBAvBri670PYY?=
 =?us-ascii?Q?I1nCgdX0U6dk2zwfhIxyzsWaUsj1jv8npRZlpMDx91B+hE6VgM4sWasu6WX2?=
 =?us-ascii?Q?6yBNZ4nIgaFP2aSCbSXpYMVYZEVtxJLimuULS2MWJvZZXJ9qUaHSxo8bBzj6?=
 =?us-ascii?Q?dFul/WjTkjUGX7AKcq7HholeuQxeIaSH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:20.7318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a37e77-bf89-441c-e55c-08dcc10317d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
None

Changes since v2:
None

Changes since v1:
None

 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index bbe4d9aa8963..32adf6a1415b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -190,7 +190,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
-- 
2.25.1

