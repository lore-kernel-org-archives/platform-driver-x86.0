Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FC255F59
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775675; cv=fail; b=ZrxpUyaItf2azlsaearnWWYlAU4YkdR7msjLBr7ApLppURUcs9+R76Bbc/YUSA3DDe1gJRbNPndSafcXQnAhU257G5YI3HZwTvHuGKGRYDvVMsdlxFPR8eGPPPfvMN77goB8SqoleclTvdJyL21UsQDhY5VNa293q67gvpAkpus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775675; c=relaxed/simple;
	bh=TbyVB6TRErRjYd/K9dr7rV2uJ3jYnHYTzOdsL4ZkMJ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMl4AAw7pvCizMIjFHUmEDhQY1DzNBgl4eLkVtaCTvMrrbg4LShw2/dwBE4KTx/2zhCbgFEw5MFiurYXvy+wY1Y6MPhlTD5C7s0oThRnRSD+yoZh2UhyWUOZrB+zal47m4Q7Y0PrZ4Otxdymq4SNuXWb8ZkxOUm8ET/W7JUArEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cYuP9R3u; arc=fail smtp.client-ip=40.107.96.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cYuP9R3u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwFSm9SjreRa9Bm5kUsIVR54RR2a8NCzLMW3iJ2zPq0Y90XPZfCIjow3JsQROr9mdTWXRvKkfMj8z5710ZKA2MaP5Sz7NI6KaDlQKvsVkHuRZkJx/DAYxvPJkgD3t6Xtuofc4gVQ8veUJb5yTHKMriLNM1HXiFXYiHpmSGIheryoermSmcfdTO6boIsKQCxRFtBAvX1Z/CdCq3sAJGTkSOxGSzLC/igaddYjaxdj+RcqjWLJRijHf1VjwrpiL3c+O6CvXtEQ7cAi0nGHZn+PKOXna8qa3o4i2bUjPAxU6Mp7GGmqlwoukNMYOW+LVzQacbKNDG14JPgOmhVYdCd4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZBwEn0DtHSpdMCM9jlFfX00rqRY0oQ3xNM9cZQosCQ=;
 b=vXwLECTHI7RIUA+mAgBiB+e/5i0YId6yhdEPV5DOoMKj/RJZGozbTu3bg9P3BQTPlsmQk9lt3q9qnG+n25vq2bnttNZxPKj2xZBJ2/OJTyh2opCTrWAOjQ4Vs3XghduokaFJqMvMLl9EcLcNdbX3ujd+T++dFaudMgB/9dR5fcKr456qq0/W5mLP8TlE/569CfiggbQqbUVf1N6i82boYzNqumel+w0o4o3l/NynxwAtCy9lSil/A+VQ9GSzKZ5RDrKzf2rJlSM8EqHzzs9p68roJgDGd7HEbKsuDv4ONGJdHzLIVojhDLWhHczGkTIMFGlTm3bafZF5kHmYuUgJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZBwEn0DtHSpdMCM9jlFfX00rqRY0oQ3xNM9cZQosCQ=;
 b=cYuP9R3uKf5i0Kp4XdbYRMTvyTaPNx18jC5bliuoQQzgJ/pjWX5T0MG4/01yT4z+ukp7wv6cv158UcehVLr7+djzO997hTIsRsWNOnm9oNf9zjT1oOtiNDCVKa0SLQQhL/XsKsDewPoYECktCjhBhm//cWHWRYyXu6qARhC+/Y4=
Received: from CH2PR08CA0007.namprd08.prod.outlook.com (2603:10b6:610:5a::17)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 9 May
 2025 07:27:49 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::8d) by CH2PR08CA0007.outlook.office365.com
 (2603:10b6:610:5a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Fri,
 9 May 2025 07:27:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:49 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:47 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 04/10] platform/x86/amd/pmf: Update ta_pmf_action structure member
Date: Fri, 9 May 2025 12:56:48 +0530
Message-ID: <20250509072654.713629-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac9ca6e-350b-4ded-32b6-08dd8ecb0089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lgz2NUH9cxbsRzisP8uIfr1pk6OLQQKDmbdh9vyDwTKRGHw1uN/AoOdHtmns?=
 =?us-ascii?Q?IN8HtlrLtASpNl4JqpIu1H5IEyjE7yUPa5itKt6NeLVRrMyppBlpLgkcxSBh?=
 =?us-ascii?Q?0bJqtZR8iZ8Y4HVDUOnx3qxI+/9WkMT3IMEIR3KnJ2Cmqd9r7wc9Edb8Zz1Y?=
 =?us-ascii?Q?tujRweTm7stEEryjdobgQDCGdOULN1LgrJ1wTXtvACtnx4rrzm9CkqpjuD35?=
 =?us-ascii?Q?NFviTgUV9GPJiJo9NTCD2Bndsgm61gQPDaQvQQ5Jkvo6SYypF7/otKJ2uYpo?=
 =?us-ascii?Q?PeUspt21ZOJ8aa0zk3zH1My/cuKlDTQ2oWULor5i/I5ZUsFRpr0u6iVI7LRs?=
 =?us-ascii?Q?o4/DXX+wU3lHfEQ68PjQzgrECb5L/p0x74J4Kq5+m3auC3pwLU7dr2hunGNC?=
 =?us-ascii?Q?pVkMPIP9ADA/sjFIkDyWs1b83edOZEvLJXP7jD6tEc0gLzY9sdDOLzLuCULC?=
 =?us-ascii?Q?TJDIfZm2T0NZwpNnzpWZBGc6wBOEh6GTVy+V/ITY0TyiHzIuPPY8Omo/LjgA?=
 =?us-ascii?Q?79UvrerLPCzdkrOnFsDIx307zx/JM896yaTyEBMMnkZKnaBzRmF98b3LQ7+t?=
 =?us-ascii?Q?9Lm2NuX5D6kp67VYrRDrWrUglErkj6x8bw0Jb0o8Dpws5s60yT78xTy80OTO?=
 =?us-ascii?Q?nF5CWgRnmcYMNfUhu6CIjnQzVq8HEpBmrb55CliX6aczf1E1+M96b2pWmesP?=
 =?us-ascii?Q?9VKoBii2hbP1KdRSu6anVD6Y6rI7ws2bp0pk3aIl+MK9U715cMzBeH6hSalT?=
 =?us-ascii?Q?N/aRQFbRnMBBctrBzBMW3CARVpITPnWtUBXUuCUU4akLo8tCkNWfRheAyAqV?=
 =?us-ascii?Q?S6ZFllCq2HqflFSU2TEfY03ivRDiZNL9xcA7O6JaH108BPfpihQ/hutehYBX?=
 =?us-ascii?Q?0Ruz4gfBpxkouzxnZ7upg4n344Nii8wPJCkNCB6I3NP2ieUO8OvL+SHnDSVA?=
 =?us-ascii?Q?XLGY2RzrPny6xAESwTa5acmRET1FcNOAwTLhtJpmbxvMjPSyqH8gafLjBOh1?=
 =?us-ascii?Q?sVmC6ZSdB3myc+dIOCMNtbkmROuqBnavq4M2Te3hSaTMLL/ORi3rkyMTF51Z?=
 =?us-ascii?Q?26hV64SGepF14ZOrV41fd1p3bibiEFV/hRzfb7rONauaLG+0bhG5mDkEN5pt?=
 =?us-ascii?Q?aAqxEZIH6BHX2hfhQy4ffB+2EtVL2ovmjQ/kKZTaHCWoYY/km+CLfPz4xMdm?=
 =?us-ascii?Q?CNYDXu+C58NiNhU8EEWjNKd4mjCy74xNFNlGdCE4Fqgdj3WAOi29A6r+E0EW?=
 =?us-ascii?Q?52ZecePm16Oim+3Tu4yrWFKFIvUTnOssJa5X4+X8efB4E1yMEriS0Pp5Cwoh?=
 =?us-ascii?Q?Nr+IjcQh9rw9JYySiK65s1Fr2dz+L1QwKt4Nmc2ogMyW/unUW26q31F6nxdx?=
 =?us-ascii?Q?3jHGCwrbtYjXmQ291vN+IHZ6PlFzUSkgO/D7AbofwbBWVcivOR3/hvx0n0ji?=
 =?us-ascii?Q?TF11eJYHgNkNA2py6O7dHF7SKvs19M8uZcZySPDpcXfbAfU7QjEJ9PRq925Y?=
 =?us-ascii?Q?y9lqXPKuncXOllTm8wl8pm5pSbD05yUgDYel?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:49.4445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac9ca6e-350b-4ded-32b6-08dd8ecb0089
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784

The latest PMF TA has been updated with the additional structure members
for internal evaluation. Since this same structure is utilized in the
driver, it also needs to be updated on the driver side. Otherwise, there
will be a mismatch in the byte sizes when copying data from shared memory.

Suggested-by: Yijun Shen <Yijun.Shen@dell.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 17b46085726e..27458a7c221b 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -758,6 +758,7 @@ struct ta_pmf_enact_table {
 struct ta_pmf_action {
 	u32 action_index;
 	u32 value;
+	u32 spl_arg;
 };
 
 /* Output actions from TA */
-- 
2.34.1

