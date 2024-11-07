Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD30198831
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964471; cv=fail; b=bT4tv5HR03joqmF4uW2XvovetWRCkJNRBMDgFK0CasE/una3RFAbeGKVZ+M8R6E23hcCFFItRzkxqpn5a23+VeR37MarqqjxpiouHbPfKLwb5Cy0tDw34l1HYmXpwlaI3g1eSlYau3eUCbTc2dV28jfbJ/cKYuWtxXj5wzg2FyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964471; c=relaxed/simple;
	bh=6C4pfXDa7JNWWV+DmNcqqOUh/bPcKoZqIuHIwIjh5z0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZcctPUuGlVnoO22qacpaWieb/PxHnKZhQUtjcUf1wHjTlz0kDrKxxZg/tKZrPJgJykDNuF1YnFrMIIJoVthGrmMZD25sUM/rRKiRKVOLINjdyNWBPRDAMM2vYjlCrwCXlGjuzTeKYaDvSwxGjx0yl85GIcqzEfLcVTCu8gTDGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QVPdPUtq; arc=fail smtp.client-ip=40.107.96.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QVPdPUtq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFrY8HOozY16/dGMYJSleU5rfgXPxK3rIiS0dwfjJMCHF2Le7sv0qMvP84H2nWW+O99tp2ZcJ7+sxIjOTVGepEZPPVKrw2aUI9OhVLMuivHVZ33fGWQdojUVf06jw1+3Ih0yeQ5XluNYu6MBtSDJZJ8FIfQysZANz1xORcU1OkIJ7K2Qxjenrl2LMEAp1l31+QGIpWhS0kQpMUtc+iPoWpK/KNyxBUZOp+GdO1HqimU/rZ8Gk6snRLEeDjHfiHEQwt7MZ0pR11do6b7FEsUi0j8M6DjZOSFkJEv/qK9kg/AMVmysnPsbBNYAsFesaSMldw0soSEwc29iw3Qu0Yq4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jml7J/B/HxfOV41OOnv7IhR2gemZrOl5TDeiVE9asYw=;
 b=Ab73x6fHgEZGdMC/uFYFdK1hL4gMm+I8yXwT0AX+OO8vhCN3JVCoYrR94wfeZJJTJUDBfeRivW/s0hAjZkxOphgZ2JjgceDPBgE2bvjhZnVP2QB3FRye0GHtWCBkSMz9UaUnVNkdUAJi8GDHKnI6fdYyWHjeJl/iFtvl8WnW5Jj+ystMyoxXKmpTPc4+5Qdi7CU2chyIYE+ymgtbMP40zHl7OvY244kx+Fj7pD2gxa1eKTCnghasZpGnkZ/ROuivn9iuajSyo+F/sh7diiubWVGz4+zSuWxw/7bjYCMj+RGgoHOmG+I1ZTcYQJPcCiUs5MNmfXMS0/Gox+BfSqqlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jml7J/B/HxfOV41OOnv7IhR2gemZrOl5TDeiVE9asYw=;
 b=QVPdPUtqFsU8HWtAU17gxr7voi1np41neM7ykS5Ct1CFgbwjJgUu3o7v24pgmj1yv4eOSJhgG/vpWKqyPe1CUaptBOPgSLg6rvr5mtCn7EECx045Xzt6YGR04XuRPng1npPN/ykpkWKV6t6l8w+MX/Fa4X3nS52FplXyaZGuXtU=
Received: from PH0PR07CA0023.namprd07.prod.outlook.com (2603:10b6:510:5::28)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 07:27:47 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::95) by PH0PR07CA0023.outlook.office365.com
 (2603:10b6:510:5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:46 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:43 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 07/11] platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
Date: Thu, 7 Nov 2024 12:57:10 +0530
Message-ID: <20241107072714.943423-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: bbee1f4d-a160-4ab4-e39d-08dcfefdad76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qw9vNuoF2YZUtnkHEH8VbtPfdQWjN6Df2Uvgk1rCgPABnNc7LDUYL/m7Vaol?=
 =?us-ascii?Q?+ARaCyLacZrmU4R0wCL2UliZqHnGEskGA87ArXOXpab0hhwsWk25zTAe+lrf?=
 =?us-ascii?Q?ZLZFKyP+Dl7BPFHPrAyeShXlMm4cFWefQB1zVRNZ/UqRjqLg0c99Q5OBqJxb?=
 =?us-ascii?Q?AmFhaRk3L34C37Fq6fNLq4mmQb/Yo/BiBoEguFmjpXQBZyUW7fROCzSE7qvZ?=
 =?us-ascii?Q?ZpIKi2wWhd4jsP6gaf+CT/Oi1xY75DUg164ptHHLQFzXhbcxc2p+KI+uzQRS?=
 =?us-ascii?Q?/gd4b2pjCD+JKJ8ImGKk92gNiC92woPlXuaQ1uCWamb9G9O4hhsqBC44le7m?=
 =?us-ascii?Q?7AsmayVssk8ufsVrEzSAoAnLNLd4VkL3J2raSePCCcPs56FhumwScmXuqNjC?=
 =?us-ascii?Q?68tX+Y/61VGJW8mDDiyQVwIvTlt8ENkTJ8sQZ/BIFlemiYS4ETARC8C+agDA?=
 =?us-ascii?Q?mkEdmoF+13M+B5secgArwVqbiLwRz3CoPVxNdqUsU3nfaOvxaJFm0+k3hJHH?=
 =?us-ascii?Q?b1GZUrEsVkCvfRL8Z5oGP6OHecErSEbEgsixL6cgAQT5Yommv9VgokpFa5LT?=
 =?us-ascii?Q?8hUg5wMsdv1acFLCWFSjYWg99EnWxxc0gGPgJpkXRA0QNYsru959MckwhOoK?=
 =?us-ascii?Q?E4q7gLuZvnqob9QGiJjxUvpukNts+swTMTMbq81kz5z0S8vXwPy4sQt0GPuv?=
 =?us-ascii?Q?LwpUV6mXBUKrkS21Ka7J2tqjb6gWIEBIEztCqPLOanQkMEq8080CJIGFW/eW?=
 =?us-ascii?Q?9hPEmBeOyQbVZJHkXcorUz7C75hrX5OARdp66P/Nq/TtclVs/TeSQp8htQ8H?=
 =?us-ascii?Q?Ou9QX78TgbYMtAoufaeyTD8M4sxBUwb9jqOhL6ym0xmcMqlqNypl2Vx5a9//?=
 =?us-ascii?Q?PyypAIigAiGEvK4viz7oerZLXhuBcyXt2/Z+fnbKfg+i6rupSOMEHJQWpR/I?=
 =?us-ascii?Q?L4UxpNgowPQaWWggNYqQPkuxffbW8lf0yyjHsmCoVumBNH1QwlxQBa73jaYJ?=
 =?us-ascii?Q?+eVx31GGHQvpEGkPn4VoKBCXMXj4I/1gnAc4dd5YQ6o/FeuDupbpbqsMEohe?=
 =?us-ascii?Q?4JgX1PBjPbQnhps+W7wrKZw2B8BRmrPk92JfoQzztSckbU9yH/TTa0Dwxu+k?=
 =?us-ascii?Q?CP2sGpt3AJ+8ZcFW4Swmj5UyeS3oTuzEp7U9gObAMDLO5ynNkA4KWum+p8zS?=
 =?us-ascii?Q?c5SrKWmE7cGbiDVGeNfOm5Q6pHTohcsSXervJDbhKXUG1TLDJns2eAVs41mL?=
 =?us-ascii?Q?z7PJnwHavGrLTEMCu6UFvVnjqnTjDaHmqW+pX3ZLF3JAGltn5LTJUP9ovAUh?=
 =?us-ascii?Q?qU+chBqIGR1LO7O1nO7H+0c8mppyggy6hXBvKveKeW4fEHb18rsZYaUg4dNb?=
 =?us-ascii?Q?vmm7vuGyqqp/fFjaihoQFASrDEF0vo813ejOzUqvHdQu2gXHqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:46.9261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbee1f4d-a160-4ab4-e39d-08dcfefdad76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931

Instead of manually specifying num_ips, use ARRAY_SIZE() to set this value
based on the actual number of elements in the array.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e03b576105a5..7c3204110bf8 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -12,6 +12,7 @@
 
 #include <asm/amd_nb.h>
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
@@ -117,7 +118,6 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"IPU",		BIT(19)},
 	{"UMSCH",	BIT(20)},
 	{"VPE",		BIT(21)},
-	{}
 };
 
 static bool disable_workarounds;
@@ -169,7 +169,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->num_ips = 22;
+		dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
 		dev->smu_msg = 0x938;
 		break;
 	}
-- 
2.34.1

