Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809415A85E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659359; cv=fail; b=gnsBKLqa4vLwzMsFr6/TAAutQA3YBHwMnBvSLvsqURsTO3T95/tPucebcYnZh2q1MtS5BXcpaiTvvpB68zxjxURGg38zUDmT8vvAyAO/SVaLI0b2i7wDFEYB5/N9zOU0pcWxwzkLU6oAtAjub372bWW/ZsZQYDNP2iZGzUM2XZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659359; c=relaxed/simple;
	bh=67Kzs4hbM6GH/F1cHitOcDbje/kTVRrKd1hP6rgPzBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxGP4Mq9bSIeJt6BwBtX9/vjOCkV9/M+FRmGd55l2tg1DUDUZj4568V/ZWu9tNizd2PM/HWlA3ty4cmdX8JrpvGqYB0b3jauy7ZzVUtJ5LaCQP2E6vWpAXctNDsK8t7dOqFfO87ILtXCFPsvPz8kxZxZQCHyIAd/y75dgmQxoMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=feHHnwSx; arc=fail smtp.client-ip=40.107.236.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="feHHnwSx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnTgIGSxm482TSRPdAS5CMFGDKt2kvwXz5omYamKEVFGs9Zg/WzGYy8vZyAIN9f2pvMMFFnUh5SbUi8UE09Itz9kqechTpAWuDCxbyA04oFqloOKbmZgBi9nYs6s1PmSwDUUdN3DcDukQK0hG5NaZJbA4uzEOy3A5u6dVkT9H2bPrF15CJIqdzGEU5IxA1PGX/mlTxGE0Qrn6x7SmoEw7EgaTwA3yOGh5cwtk47Et6PDHiT6w9Q1XqOcHcgoaboBDiz3C63XcMvNuj2dtmXmvzF26sXqBeCjHpKQ4botwQztkMxzNW4o7BpKeLsPVG9WxKyVT4x8/MlUk3PcGuvvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=nAVS5aJiyzyNmQmGe9WqqYxUN9GssjZw/rrQZIxeFSe3uPK7efJN7818m0R4TEfW/uVIy3+2usfqjPKhKLNMCgzXpydnvDW/9vhFhtalKF3z7EEuRjnrmr1J0+Vcw7Rqs0Oq02xJTy6Rtzs/rWpNIPexpwEaAxx80nXJLSMlDUJTOo466Yc82JBHRbLEeAMBwS1CiwHkoiEJFHa2L7ILgeolu7Den2EHm3puVriao8xOXOsBJQvpBDa68dPIoZbZRXSvBE46HEPltsxT1dZQahM05BmXveaUBfSfzh+hDcEW9Jh9+A6X4D/kFMOQDMLDbspWfbZ/WaW+nUYvA6HMCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3s/5943YPllt4mq0NYheL/grPLWxI1/6HbAyx1QBFI=;
 b=feHHnwSxZe35BlDwkODJwpkMLBaKS4PfxoSb6xUE8OhwGD3KUPDxsxzt4LfsOHqLMcyweyb2Op4FLdThUl6HeF2viLuOY0JW/VuXha4OMS2XB2wVN9uuUr9vXWl5YRrABAfSFYbCqPMf+6jR94F7wp7Ocmp/lnKiN9qk668y1F55KUMXztirfHHHyIPb5JrHCMDoNjMC6SSLCmQILCKGTQJxiKK9M/U94a5W4UCXqq9S+qEeDBguFNih47mU2Piw/kIiysmsw8Vohpor1JR88RQHV39XDILmSdKnPJ23M6eHb1UNexDt+dOfP9L7ogagIPbXVs8CjptkbPgtr3nGpg==
Received: from BL1PR13CA0340.namprd13.prod.outlook.com (2603:10b6:208:2c6::15)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 19:09:10 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2c6:cafe::8c) by BL1PR13CA0340.outlook.office365.com
 (2603:10b6:208:2c6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Thu,
 23 Jan 2025 19:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:09:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:08:53 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:08:51 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 04/12] platform_data/mlxreg: Add capability bit and mask fields
Date: Thu, 23 Jan 2025 21:08:08 +0200
Message-ID: <20250123190818.3834-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250123190818.3834-1-vadimp@nvidia.com>
References: <20250123190818.3834-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 5875c602-4e1e-402c-93b0-08dd3be16af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZbVOaUvubpdFVYY09efpeLIWY4SQE6awDwU06CkM3pgH1ayK2IyIpzpW8Luc?=
 =?us-ascii?Q?O+NRzWbJmEsT9SjdY5LOs3frwT02s7a7AZ5XgOWCZTEWZn6Pnidd2mVrd5XL?=
 =?us-ascii?Q?gC8tZoLO8KzdJKhCK62XIjjlhFS+42ax0ytlvnP0qJOcmaA1mv2zh138zvGO?=
 =?us-ascii?Q?e5SY++lpLDvGIm+RIqwhrxC7aFwcCUxzB2vqGr6ogBJAkTMYFVL/fi9icuIJ?=
 =?us-ascii?Q?nPqDFkWvmRn5ODZdDe15I1F2XAJxJv11HE6OFB8FVz2x8kB3zsvJy0l4ZaUq?=
 =?us-ascii?Q?BEfVeA4rF3QH6aptpGwIAt1PQb8thd+rGUKcEWVUzsIk9lfdNznN/AXnzzm3?=
 =?us-ascii?Q?G2n0lInKrDRnwVxV95vcV3J10ixi0WfXH5LBZHBautiLo37YVIybaCu+jnUd?=
 =?us-ascii?Q?8gl5k8wjP1pNJotxFaI0Z1L/srQv4GTuQelLw0W3ISQFbvR2gwH/amYO+s65?=
 =?us-ascii?Q?3jZlNHfIIg0jQEbfhMwQJEG1G1lP4J0cpGn9AS+H82d/cbiI86B65T3bcjor?=
 =?us-ascii?Q?bQyW3+2izOVM7FYJ27gVvP2NHdO2XmB1PRDeUe1JpihB0FvTZugn3wRtmPVm?=
 =?us-ascii?Q?aONIyHE6jDLSnuSxX/4Lo59ZSJF75Sauysyl1q60xJS4c3DJPWb3GV8zUUeh?=
 =?us-ascii?Q?Mt1UWTMXcbjY9Rxqp60k3FwFet0umd9vpxQxzyQC00D0rxeeS7cT8FsmJEwz?=
 =?us-ascii?Q?uhhR/akrjc75BtaXwV0dBEhZfjdpWBa0CdpzI4WXwBN6oBWukB46zOi4Dg0I?=
 =?us-ascii?Q?WsuQmmVdhNUkKOrX3GYlG5wV1N8YNHKkJm5r+99rgqy5/nyPKJllK3n/8LZT?=
 =?us-ascii?Q?YfJACzZh8DP3MSJXz+2uaaSQsL2qzMySgOzbv8fn6SYjVwj/sYObhkkM3MFx?=
 =?us-ascii?Q?XYfROHF2T2WzCAIT1vsEfpPEpNfQOKGcJpGhJckbtqwKVHteZHoKYieTOhCJ?=
 =?us-ascii?Q?JwW3YrwdGiDoz54KElgZlpmQv+MPZJjxqssg/2M8vcy4LBL3McfBX+6BPpGt?=
 =?us-ascii?Q?+IV14fXuJUk4bYIJJWT1cmwlyGBbag79xGGlZDTir4uraeNI7tic6Q63JYby?=
 =?us-ascii?Q?XBeyf93QwwoHhY6LrMvHa2jo9O0x+1H8Lp8lE0XkNURyHFgsvvs90ftiXe+Y?=
 =?us-ascii?Q?j0M/fjArfyw+LLm0/COk6G1ho36Uglz07fVB8S53owYVOkREVubrjPflxFBs?=
 =?us-ascii?Q?0q/2OfLefEcoiBe9abLmeAv3LPixCHyos2A/JJfz4KatU6QeZ5xsc4rl3umH?=
 =?us-ascii?Q?4PxEc5GAUFlqh28VKUdqmKqv0ebv0a9p/GYfQd88dk4jT/Xw1i9pjiRAxdSg?=
 =?us-ascii?Q?W/8WrSMUPIOEylKkw1MP3GlBplpklukRTYyd83MCbZ8ojzGIqv4nwvI/cJFw?=
 =?us-ascii?Q?h6hMR//TnirjB3Fo9nU58FKLbdY/8DW9s1PVUCdGj8QEv6jPYFUwcsx61B/F?=
 =?us-ascii?Q?HIBc1FH4FFqRoYFQHNMfL/5RIwR+Yd864R9Ag31fpPR30PbQVfmTFibO5xpE?=
 =?us-ascii?Q?N8hJyvPL3zArbhU=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:09:10.2712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5875c602-4e1e-402c-93b0-08dd3be16af9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081

Some 'capability' registers can be shared between different resources.
Add new fields 'capability_bit' and 'capability_mask' to structs
'mlxreg_core_data' and 'mlxreg_core_item' for getting only relevant
capability bits.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 0b9f81a6f753..d9f679752226 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -118,6 +118,8 @@ struct mlxreg_hotplug_device {
  * @mask: attribute access mask;
  * @bit: attribute effective bit;
  * @capability: attribute capability register;
+ * @capability_bit: started bit in attribute capability register;
+ * @capability_mask: mask in attribute capability register;
  * @reg_prsnt: attribute presence register;
  * @reg_sync: attribute synch register;
  * @reg_pwr: attribute power register;
@@ -138,6 +140,8 @@ struct mlxreg_core_data {
 	u32 mask;
 	u32 bit;
 	u32 capability;
+	u32 capability_bit;
+	u32 capability_mask;
 	u32 reg_prsnt;
 	u32 reg_sync;
 	u32 reg_pwr;
@@ -162,6 +166,8 @@ struct mlxreg_core_data {
  * @reg: group interrupt status register;
  * @mask: group interrupt mask;
  * @capability: group capability register;
+ * @capability_bit: started bit in attribute capability register;
+ * @capability_mask: mask in attribute capability register;
  * @cache: last status value for elements fro the same group;
  * @count: number of available elements in the group;
  * @ind: element's index inside the group;
@@ -175,6 +181,8 @@ struct mlxreg_core_item {
 	u32 reg;
 	u32 mask;
 	u32 capability;
+	u32 capability_bit;
+	u32 capability_mask;
 	u32 cache;
 	u8 count;
 	u8 ind;
-- 
2.44.0

