Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8848021B18B;
	Thu,  9 Jan 2025 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433587; cv=fail; b=B/vORNvdxGBoE6aSAOD4zZchbTw+jx1LTATxxEd2UnHry+x8DYXwuQiBkNK14xqEf2IvO17+RipkiCHIdqec3nOy3ugzh4tBdQK2o1/utmJBYFIXhgjhTUCAqs+V0+vEEnrOjYJ1dCt4vaCef325UuSIiBDHqgY9YCAHTkHxphc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433587; c=relaxed/simple;
	bh=BY8PmJRf35N5QCPuaR9pKZoFjpF1cOgnrNfdBi0VIbI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aRIql6hlc9gw35+kawWWCBJnF7TVwWIGPmIdF1ZdVkpeDW3OQE0zHxx+x+GCluFgjFsclRvNFLJseo2h0ODB0x2nGPwzwVft1TuTeS6LmJwY8Dm+ESoctw5CWnJos6FTyqVFvFyqORA7z4Rnz7hoj0/N6IHd/YwSq/h3uPvV2zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PXEaaWJb; arc=fail smtp.client-ip=40.107.96.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PXEaaWJb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSSVkt3oYTe8wZgyjJgVdg6+TzgrEZAfOjkRtqjBpxkk5eYlb0Kkap6uyzvusj0q2y9M4TG/3fsO3LNxCqMTVXHgzW+0mYUAb5koxmq/Q18+t2dWJgB3LJq1+fawChzofPS1lGrXp40Eoc8l0XGOriwFutctN9Z7A3NWanzYUyEV7P9h1qRKtJA/Z2R79LPkizKFRU9fL5vFE3y1NHZJIbVSNlr4UgBIbzh/K0ka9MtPtQzF9+DKJdWm3I36jkxeiRTeCC3MZpY70Jmru+At7AjEiqiXFkFc9f4JJgWcap1UU8XzIJNR7JkIsVkn0X2Q/A5ZjvsEpAfuABoTWUpFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7uUZegjqmsXnT1uTv7Y4pK8ZG3h3xZ8UvzoumzgLYM=;
 b=nr1CmtIdwTevmDz8nBXxHxOdcZ5p0VB1LJOI63BKQulgutugAIHB91GSdtwGtEtouomBxE6i/FkjtaQCfdoqwjOv4XQXvyRSxAUK0VSXpbDwIPe9+IMTSoOcwp0LX2WRRYKkHrAVjTk0XIyuHZbdEKqkhjodfKxiAjzxI/aITcdLrBUs5Zss6iygbUr4E3yJ5Me+zkz5wcpmfOc/bZ9YpMmhnBm6ALoFpfYQtHf8AeXJnT9hRTz2P/CavrjccJdAHypZjCvoWBP7rM0vFqJg7gtsMykEI45tkOFMtpvfLvZfEvQ9wCE7GA4K1ARUCXJ89jZGJr1Nb2xRfouC0IBpPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7uUZegjqmsXnT1uTv7Y4pK8ZG3h3xZ8UvzoumzgLYM=;
 b=PXEaaWJbIgMEUpYQxG6/uplEE3oMg3Ej/BzWwXdDcOk++h3imTjSXa5HcbGqjxOSN/8/+H+FMFsZ7RwW+lvK7h9LevnOf6SpvrAfzSq0+bcA0XJqOLH9g5G+D3kcbJ7TkqeMW0k5BYMM18k0iP51VjP68P2WZAHe/X+tJ4mJqURH9eeCPG7ETKi4Fy8xz/8E7bBWP2sYxAKZwykFGgd9nPUoKwqltjPqYi73Nba5IVuJcYB46KJBSOItDTIEh4XTTwq9F6zom4bE0vRCWmz2u8UM+TRBQxEtD2+IqKcvYEl9B+YPVWv2jPoMcDG/b5eiK5KUHo21dTMQLZLY7JqkUg==
Received: from SJ0PR03CA0267.namprd03.prod.outlook.com (2603:10b6:a03:3a0::32)
 by SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 14:39:41 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::12) by SJ0PR03CA0267.outlook.office365.com
 (2603:10b6:a03:3a0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Thu,
 9 Jan 2025 14:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 14:39:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:31 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:30 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 9 Jan
 2025 06:39:29 -0800
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>, Ilpo Jarvinen
	<ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, "David
 Thompson" <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/4] Updates to mlxbf-pmc
Date: Thu, 9 Jan 2025 09:39:19 -0500
Message-ID: <cover.1736412537.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SA1PR12MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cc27ce-72e8-4efe-2855-08dd30bb73c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cdOvMNNcYBypEkWvBw9BhSUZQMYsW4LjXxi0fjAhMFm+MMBBo8Lfes8KnW8o?=
 =?us-ascii?Q?dtLjBgmwiaMeutmL7eRaLx4CwNbHoDCV/9cG6ZnMnOIcPjzOBxvbhAEUlwV3?=
 =?us-ascii?Q?LtN84bUm84a5o2wytDOtkvFkfQW9CSKXr4wfg1f3wR2gW22P1RB00MejURrv?=
 =?us-ascii?Q?ipAd/0neB+ceu96sNGVWn5VP+clD/YT5LofsMDxbVqsR30WNpWc4QYe8Z206?=
 =?us-ascii?Q?f0+0xRpUf0EfBMRtaf7pMwMHID6GxPtRg5zsEP3awT6X0qiHr6/KmsSftdzN?=
 =?us-ascii?Q?b7BY3Q83mgAIagXaNQHk4DgbiuWOpDs3vErn5khGCEZbpkFh4MX/woll1ljo?=
 =?us-ascii?Q?vGzVyGzI+GSjfPYOXJyTbw+exv580s0nruMWb8iUKYhuvbpTyLpIHAVMyc87?=
 =?us-ascii?Q?mIjVW8gOiBYnXBVs7p6ZRnJTPNmFGZT7kS6Da33Bml8ldcd0gNoY2COrjlHg?=
 =?us-ascii?Q?9DzLeWUbNQCdT/7sHEWl4jOavMMEPeWLNfZi2zOJXEin7VEvCbPVJIGfD91T?=
 =?us-ascii?Q?sPi2YTDVfl/I+66b1tI4/+3E+aqMLjPJxVunzJgjGxu8YzNOTZ9lleE/Iboh?=
 =?us-ascii?Q?B6K06TxRmKET4R6XiHWLl2yfRW8sRGcT3tB6ZzrPcOx+2527KxCTAUXo+Nc4?=
 =?us-ascii?Q?q/RcFqrXrpAvEo0DWLLbAEeG027W8hoUaytpVRtuGHLWE1XYstoiLt/FpjSm?=
 =?us-ascii?Q?PNKOPzLLKF1Mr98FOAcjjD9Y0uhr2zY+C8F1hg6s2LFI9Os6CCXUAfDF/o45?=
 =?us-ascii?Q?lZ6A998HV26q5tUn7tVMPKl9ZiHpDFOKm5Cuf560oWvPUdsQU4bgirn/OuSY?=
 =?us-ascii?Q?+jeT7D0kWGWJIJjuWeNvYqOq3nFERmD18IYDYSk7eRwkIFtnoKNZPwCa2Uvm?=
 =?us-ascii?Q?mAbRyj52DxkgppLAvyQ/d+Oxm+vpgES8fOGOUA4kF+U46lhpZZxEnizEna69?=
 =?us-ascii?Q?r4SzR6oggAHj5FsEEczdVUK71THZByff2D8hI6zPpNlFHd8PQF5DVvcnMyAi?=
 =?us-ascii?Q?2YLtEZ27PU7MmIFAHAwjf2Ti/Ih+KkHWjpRfC4cJGu2VMUoW51112FdmrBT1?=
 =?us-ascii?Q?odFHuPn5jVdbx3beapmO5FPIhhgucOyoseCF2c3R4A0GdhdOe22SRyRag7Fd?=
 =?us-ascii?Q?G3U4VFXZAOthL5x9+S6ywq+Fw3FaRROdG6Vl1DZcXorvOTvr0NoBJ/08OXTR?=
 =?us-ascii?Q?RBS8N3IuZI8UTNE/G3IoBjj8S/2FfkcL6WtLSiubjdBLUrOggxGb4s6g1Fml?=
 =?us-ascii?Q?HNCPfLQRAl5Gm8FTdx3rcu2LCQLCXCMWRr24LDvd04BOpqfJ9mEarG6Dp9b5?=
 =?us-ascii?Q?nCB5P3N8enyTfeI48/vRHcPlGzY7GiIrFbe2gHhRdalEGIl6pH17R73LATER?=
 =?us-ascii?Q?f7OpNyICiMP2tTFXQAqnvFwGBmu0XXp9hWjftmY2LrursUBW03PF9N451SLS?=
 =?us-ascii?Q?znrPbilS5tIMeSYjzxJXqNTzPZsFxSQ5sMMm6gFlmTlEpOMHZ6vadMR+5a92?=
 =?us-ascii?Q?rCMT+vhIWlCs1yo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:39:41.5222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cc27ce-72e8-4efe-2855-08dd30bb73c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672

This submission contains 4 patches relating to mlxbf-pmc.

Patch 1 adds documentation for the sysfs files created by the driver.
Patches 2 and 3 add specific functionality to the driver for supporting
counting of cycles and clock_measure performance block.
Patch 4 adds documentation for the newly added sysfs entries.

v3 -> v4
Removed 64-bit counter functionality.

v2 -> v3
Updated documentation as suggested to provide more details on the
sysfs and driver functionality.

v1 -> v2
Added patch 4 to document sysfs entries added in patches 2 and 3.

Shravan Kumar Ramani (4):
  Documentation/ABI: Add document for Mellanox PMC driver
  platform/mellanox: mlxbf-pmc: Add support for monitoring cycle count
  platform/mellanox: mlxbf-pmc: Add support for clock_measure
    performance block
  Documentation/ABI: Add new sysfs fields to sysfs-platform-mellanox-pmc

 .../ABI/testing/sysfs-platform-mellanox-pmc   |  65 +++++++++++
 drivers/platform/mellanox/mlxbf-pmc.c         | 107 +++++++++++++++++-
 2 files changed, 168 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-mellanox-pmc

-- 
2.43.2

