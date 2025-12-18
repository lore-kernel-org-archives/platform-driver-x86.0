Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2AE32ED50;
	Thu, 18 Dec 2025 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766060337; cv=fail; b=p8btnc7RcvTd6F3CJczOfZ30gy7Im4apxvV1KdffYlXZgCoH49MUqMXDo68xd70GXpySdiiTHLmvGmyBer+nwC84yrNjPDr5IZN+VKzOsY6gywOikXBXUmjE1108pp4B1PgFFWvpdE1hyBljv/Ybrt50G744k9cj4KpxDDQr5gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766060337; c=relaxed/simple;
	bh=ENNXiLPXkPl96U1JywQXftj6t1CX4YKc3+/HyCSI64I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s5d5IGYikhkqyVKHK9PGszSGz0L4Vp/E17oZx16SP06azCYu8keXYLptKvhZ6P1fYY0JiGq2glh1FT9L1InHpQJk10vsf5koWRRShwwmb4myXNAx3kIWa0OcrvUaheGXDOZiJPVN3ec37reuzgT8McnaZBLZ96mHCVT9yeNn58w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f7L1gsqL; arc=fail smtp.client-ip=52.101.48.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f7L1gsqL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUo8oc4Siqwe9UP5UPXf+A03J0WvMj8GS4q03HDk7W13B31JSQcdYTwpcALTBPbx64GUjS2jO082MmHEF+HAssntinhrIpcxISwcmf0+BoHTvwyqICTC4zstN9iZnDrJmpalu4p+X4GkhXt4iT2xNBLoIh9isTE/gkurqvjE5IObB2EzNCvfJHJ7pOIy3E6FyZ/yCtpWkaIQIO8xJiMtSuYIa2W0pGrhiYVeu0+ZOnKKekSofPvGpZ8zUlTyMev9Mgcfd5WSjqa53Cjn5MLmxrsAGwGGX0QWSv6iD0QO424hGmWFz02cSqCnkVBvN/BplrD536JZKHx45LDlRMdfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unsKYn5h3mV12o3nHJue3JrRFaNIeBoP9N49P5FsaVw=;
 b=b3tmnZIFo0OnO0b6c625IEh2rBVQMHuzda+y7oF7MWT1AO5vsWJ44niJDA6G/8h+a1E4R/mYSDx+OW7MUycAzKpW2fJWrfKXy+ZxYDQY9ZcaXLWfd0uqK7yJVsdRF4uRfuCp1W3hlcZOvJgs4JPzBqLwBjUdMuhMTvX+sHYihVX0nPoEHOYMpSxLukFh9d/GL5F+Ffoz0WkJ2zJnpjToa8aSIp7VbH08ANk8OZbFhl+Qzpxwz1wDf0U4TtC0eO5y8NFQ0ZQV/BTmrTOp8R8CvmH5MPS0EPF9DHRAcrgI+muNbAT6I8iv5oTPA5/54rJZTdUwRHvhUaBpTc1BY1++2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unsKYn5h3mV12o3nHJue3JrRFaNIeBoP9N49P5FsaVw=;
 b=f7L1gsqLxLh+RIZkvjwU5FdYUFj4INPF89UfFyXijxo+PTlO8BDdT2xXhuhKVv/HuofY0V8FgvLetK5Quyagp2J9SnVQwvBiy0Uc5CRcpEEtKjlOp9tA1nbqgK1OKlLUQZCyhbF4dTSp/f1GmUsVEPCh2VnkouGre0G3WAtCyChz54EJtdVCvrBx7YC2K/8b/KDkrnQjEXpR12QbTOlMPFe2KwKa1XZJQ5oW2zNdnwlUKqnK14tLEzXhTihOTtiApTb0RkV0LlJlWPeNSbde/NGHUabNjFj0gFQmN6qGE1CvW2Rn6oFl765A4Sf1c+VgueSGi5OQ+oeqlMOH1guZcA==
Received: from BN0PR04CA0200.namprd04.prod.outlook.com (2603:10b6:408:e9::25)
 by DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:18:52 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::37) by BN0PR04CA0200.outlook.office365.com
 (2603:10b6:408:e9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 12:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 12:18:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 04:18:35 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 04:18:34 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 18
 Dec 2025 04:18:34 -0800
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Remove trailing whitespaces from event names
Date: Thu, 18 Dec 2025 12:18:13 +0000
Message-ID: <065cbae0717dcc1169681c4dbb1a6e050b8574b3.1766059953.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|DS0PR12MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: e15e3076-57fa-4dee-b9ca-08de3e2f9ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VmARcnGU4jOMHt/kbz1438kVPMLpNmda57qbtQC6jnQACQGrzm7bz3PB1k27?=
 =?us-ascii?Q?E7cC1Km9xx7ZSfqbCHHZsX4JVmcCGZUQ9Rms8tdxOgCi3hDGNNDPjJ2yUkAj?=
 =?us-ascii?Q?xlhIOeXlo4kyA9zcSCm7S6WjtCby6GvDstrrq87JF0UX5Hk28elpugGNCPYL?=
 =?us-ascii?Q?g7BJM5Kx6X2Vyh3BW+gMpr5i8r8migMszK6zi5WX3+QjenUIuLomqeqsxvsq?=
 =?us-ascii?Q?XuGQluGkBiuXdBxoCj0V3Gm8fe8pj93a/A2KAjPBCUSEDAMzT/T1bMOmvLMs?=
 =?us-ascii?Q?7zLOCO3jV5y2pZ3wEtsnpzlNRaeV3unvZD3dKlQ/DX/3HVK24rJ7uO0J04y/?=
 =?us-ascii?Q?/bfbpE3g8FeQAfDeI6jxTtJei+kBjCu4BVQtYKj9oOg4PIP2oUSvhG2hrNvF?=
 =?us-ascii?Q?IfOGDGoGsUSgQwwzIgUbwbQruLksPRM/QZKKWIbYiPJT8gsE1/uvGJKb2vNX?=
 =?us-ascii?Q?D0x2ri9nPsweRnr7oK5I7cGZXYC/7mxC2WbL2L+9VQzcZbRow/4ml+qNAiVX?=
 =?us-ascii?Q?P5u3MiAonwCS4iAA0OpwZpYHXwRj5OntQURjWsdUoe7n6n/H6ATaw/fvplmg?=
 =?us-ascii?Q?0Q3yTJg/rJD0epUGgmOP/uoXlpF1QGoOaVgHDw4yQiWflrYXfDlzFoLaE8Qd?=
 =?us-ascii?Q?CW6PLr3iwZmBUbRbrel9u2UmLOvmAjZ3+1hnYVfJ74s0Dl9T50sykqXSjK/m?=
 =?us-ascii?Q?fYfVLfDAFciMJX0o8IgDSY1HNsedJexXsqu3TrbvtZXlMw0sRfXnzRWsXh6I?=
 =?us-ascii?Q?FplKOI3Qk+uOkQLqtgt7XVS2lJZ9xjkTAGVhSRN0C7vT+N6qDm1nxCdbhNNI?=
 =?us-ascii?Q?WGti/5otTWqjDjiLniKuP2VE0OiHqY1aVEpw8bOkGdvBjoYy0KwL20nEWC4H?=
 =?us-ascii?Q?dDUC6L5zwd8z/9EXYMTQySljNhOjYZiaDlihwPqmF34qF2g82JUp2ThaYFxR?=
 =?us-ascii?Q?RU5tr8OdciMM2iR3KMH5wGdisYliSqOik3/y9SwpPPeBZWQjgc2fc7WlbTPi?=
 =?us-ascii?Q?UMejLGa6EZl749r8YU7bXUCRD4bCKloJe29eWrRe+mT6MLt7ILSp4PNsXzig?=
 =?us-ascii?Q?ONwaCiK0pf4KbssLBe/1wc1rEGlGzK0N0ZhXzZwBkgN+M/+kO5NTxbBt76Oj?=
 =?us-ascii?Q?XsA69Ksfw1rZ9F6BI5uFlq2UBj7pxhR6rJWKkwhAiEdZYen5irul4ZYujikz?=
 =?us-ascii?Q?+Qj/6ScZ4rOrs6ScWJC4AaAzQ195J+Vd9zB6aKHmfAN7bJ08M65IUOOhp4I3?=
 =?us-ascii?Q?6fawwiKXxp5ABzPs4rDzd546MqQS9fogL+es+sxpCUCdZFxz+MkpMEvx57KR?=
 =?us-ascii?Q?XXxixVr36kCieAEc9ziP/r7Uqcfv0oQKL9tjjeIYIAhbhjz6cK7bvSYGu++f?=
 =?us-ascii?Q?/bnZ0oMRjsH3I0C6gL9k4sbIthMPXAlPG+wFUEtWKQcoulmSxd9WKpHVRpk3?=
 =?us-ascii?Q?E0S0XE+fOrr8c8EKBk7QNaSfDf9U7AaX24JsGA+QGFpySGY087sFAJXxUNu6?=
 =?us-ascii?Q?+Ja6MuJ1LOQKynUJI0fhWaq+eDrvH91zDbenf3QMZ6Gxq8SEMIfVdmWcST7Q?=
 =?us-ascii?Q?EiM0fMW2J0RIIL5kB2o=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:18:51.2391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e15e3076-57fa-4dee-b9ca-08de3e2f9ac7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6413

Some event names have trailing whitespaces at the end which causes programming
of counters using the name for these specific events to fail and hence need to
be removed.

Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 16a2fd9fdd9b..5ec1ad471696 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -801,18 +801,18 @@ static const struct mlxbf_pmc_events mlxbf_pmc_llt_miss_events[] = {
 	{11, "GDC_MISS_MACHINE_CHI_TXDAT"},
 	{12, "GDC_MISS_MACHINE_CHI_RXDAT"},
 	{13, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_0"},
-	{14, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_1 "},
+	{14, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_1"},
 	{15, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_2"},
-	{16, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_3 "},
-	{17, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_0 "},
-	{18, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_1 "},
-	{19, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_2 "},
-	{20, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_3 "},
+	{16, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC0_3"},
+	{17, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_0"},
+	{18, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_1"},
+	{19, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_2"},
+	{20, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC1_3"},
 	{21, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_0"},
 	{22, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_1"},
 	{23, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_2"},
 	{24, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE0_3"},
-	{25, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_0 "},
+	{25, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_0"},
 	{26, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_1"},
 	{27, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_2"},
 	{28, "GDC_MISS_MACHINE_G_FIFO_FF_EXEC_DONE1_3"},
-- 
2.43.2

