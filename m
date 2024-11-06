Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6C1D415B
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892651; cv=fail; b=Ki9watSOre976f8j2KJkldKbGsc19CSND7oWxtWDSCzyWd10pnxNdnmiltDnmIA7VkbEWTYx0tOFEPYwc0pvXoDYvtlOT+bxDrmxPdSQ1mMVx7dNYvVunqXORZedjYLgelr3wxCTfiPyduyzwak0lhTi0u0jIHivEnNmi5/g4v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892651; c=relaxed/simple;
	bh=OX0yyBt/ROd+2pK6AUvtF9NuCQHNCAOsY7V0CNTrARg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EQdWdfbbZBqB4PMvIP8SzpHdsKoOnXnYkiMdZ7pY9uqYZMAqUItVCDvcEtoLp2vHKOfcK17UuJruFwA26cVfX7yhxSIdgluK6P6chBRcIExcAiXHv9fKTdZItj8IVDDoTkFEqixn2bU7jMUdUvBrHk188k4VbFvm2qaJFgWBLQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZvoK/YVw; arc=fail smtp.client-ip=40.107.244.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZvoK/YVw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3XBUNE/nD5XNdeGqzcfUpgCTzZEIiWlq76Q4KPbGpoGC6NwV7GoU4Xl338Dxu6HdtyfUfL0DbZISELR7gd5AfPtbqMdFQDswkCkR1XmKICKd+QJYBkpXS9Fij1wgNbaG7RWvUPFiL4colAk8RRmqYE/zGCOSrpWLSQQCrA4ddl11DCeYZJXo6JA4ZrbIroopxCfNMTPsZwGZH0eXRDoG8hNbKUY54wbIgaXJvwMNt9CggXDcaxd97WAuaYcdK0qpD6ZBSvfojJAM9IGGYvi7frv9vsYkyrL9swlRHNwHG9fOaUidTtSwzTyr+8Mj5bxtPp3bNEQmP1s6cVPrhT9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6lZ03+YnvSbn7n3iHy6j/J+ZSR/p4VuJAnxGcoGKP8=;
 b=u8bf8x6xcvcqKuVHn5A0bHVAFJCcBR+J8a2pYT2n6Db4eZ9aG8TxWa/3pWzpmh2cRavHsiYnXr0ZBdMW7xBGEziiJ5MBEbikKgxBAjJtRCkiPfHTZOGSp+/qDDsD4rytFbvjlZwXG0PDMHileJrILBYYy406U+UP0E8mO83AnswHEEWCzEvlcQJfKGxrSU6s5cE8GQyYr12ch2rrOak361Zn0UM9hsFSSdkHoPKyFsCl5O56nmb1WvUc1KCqm20efSwYNjVqqAu2g01ZEgaBSkS7T8KFZkgMMOVmijhzuRHPIAh99G9yWfXfHeQ9Anh73BgcRe0ukvl6zp7n7bde6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6lZ03+YnvSbn7n3iHy6j/J+ZSR/p4VuJAnxGcoGKP8=;
 b=ZvoK/YVwBjqdY3UIcsCLGZTk/DDtzzEQveEtvgtfpvo44eYO7ntUTD1i2iqezdUwa08I9VwyOQzhI/xLTd2pPtzroRHzZDxJB4V89NyE1G1x904Lwchgx5RZI+SAMqXYHvRuq0EgGOmzeFaMND+jpJ9tSoEw/8lA8rHoEFKpk4g=
Received: from BYAPR11CA0077.namprd11.prod.outlook.com (2603:10b6:a03:f4::18)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 11:30:45 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::ab) by BYAPR11CA0077.outlook.office365.com
 (2603:10b6:a03:f4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Wed, 6 Nov 2024 11:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 11:30:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 05:28:39 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Wed, 6 Nov 2024 16:58:19 +0530
Message-ID: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="'"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: bd61e8c4-7787-4cef-8ac1-08dcfe567456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MbNemO4frY6ZryF1yzRMeanL+cQpxcR8By7SjrNqLiZoQu62nDaagIlJmRtH?=
 =?us-ascii?Q?2J3Ph4blwzNUsS2y5ZORYPPCavCa0SNIlI10/n9cpTnNFZjuuLPV9B60eQME?=
 =?us-ascii?Q?8lBjVdPmG+8+dnaqEmXGYYMQR+NI3nBhagiq9Bif1ba0SzUrWO8zt1UKNKwa?=
 =?us-ascii?Q?sKe7V0hqiVGYG6XfB5uCufJlx/6qSA5KjtVlACAtH2zTEFyOdajWkISR4J3V?=
 =?us-ascii?Q?JOOIxAlVIBExlbxoJ5VEJFj79vUUunU1k4jAUn6VNVpNzD3O5QdoR31H41GH?=
 =?us-ascii?Q?CruyqzhwNuq8Dj+rRtLf3BQj8m++0vetCcWCwJ3cDoWY3RqmJtS6MgKZsfpD?=
 =?us-ascii?Q?bqiPr2dHXeRZ6q2x6P6Fj/garOd+cNijLlcUFDGztClQUyL+XDceXPqPgbrj?=
 =?us-ascii?Q?pd4KnPqcCptN2LEbEX5uL0HGm50n0XDUJgLbS0tiKmxG9970ZuZMtJYau/m6?=
 =?us-ascii?Q?USTQpo7xYuK74Ae13rcvS7pVq3iJUWq7FkxTYl5wzETnhQ9JzBGzITGuQJSf?=
 =?us-ascii?Q?ndwBI20RTs73P8eLMB3pNhtg7kX2RJFb75q4xYeayuaPz739ReqeDOT9KFNQ?=
 =?us-ascii?Q?gR2G6+8iIdqNRnPDIzGwisMlRQsUe6MAWx66Qo9V8iob59yuACReV0pjKdrW?=
 =?us-ascii?Q?GGJDT06fsG0sqNzLWeo4gbbkkVwz9pRXi5AmFkv09m4e7U9O+Pb3QKDgfCe/?=
 =?us-ascii?Q?0DvOFvDUWXMTdIN+St3+FUzBN8mLlIeaEkr8RBq4aT91sgc6O7V5WGRh/0Z6?=
 =?us-ascii?Q?sHY8TgnZjc78mIj8xVEN/FPZFqT0SXkCjl2wtvrOYm/Gl80qEofLNyJ+0mNP?=
 =?us-ascii?Q?xRd8W8J6764uoL7jJKE2nJn8lPNFdCi27lvUbgrUGTrjQKNZ/JlYjFdiiGcP?=
 =?us-ascii?Q?i0LPuxT/KyH8o8wAPNo7ALCJZ6l/F/xUFyTZaPgPc8aAtGe0xf/dY2Q2hO0T?=
 =?us-ascii?Q?TYTZgaI3uoUV++loURNkNe1qZpis3T3GrS+Pr46W82766FM/3KiIw83rYByF?=
 =?us-ascii?Q?RjY0sIwVQY+US+aKe85jA0xcQMy759fF0U/n1r46NCcZ+QN+n0ZGtbhtvxB7?=
 =?us-ascii?Q?Pt46JjvqeS6JjdBTcIEY7dZfrBPM8BztOWDaSCyw6/QWMrCa6fJviXPWCAbZ?=
 =?us-ascii?Q?7QZlJVWUb+wdKjiSWYkUYma5LE+hiWhi+kdeefz+bWHiU/iVmv+E5pGfomC3?=
 =?us-ascii?Q?4v53Dol/CvXwgF92/Cm53LrDomLKaN5dysHNp0+vT2mdzkhTaG2PON9ba7ec?=
 =?us-ascii?Q?vnPbL/GAUdhG/X1MGt5usLm7sh4aWNbhGVPAuYxkGssxIEn6ex5L5bdAzdpO?=
 =?us-ascii?Q?gq4htk/N0MuFQ+pDGIO6tZk+CM0dAPEuP1zr5jFYqax9KdNJW1bpICArDGFg?=
 =?us-ascii?Q?guv8It3Gt4s0gH0ipvvOJYm3/iO0ewQUstyL5NH1llRkuRP9tg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:18.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd61e8c4-7787-4cef-8ac1-08dcfe567456
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138

AMD 3D V-Cache Technology significantly enhances per-core performance by
increasing the amount of L3 cache available—up to three times compared
to traditional architectures. This large cache allows for quicker access
to frequently used data, minimizing latency and boosting overall
efficiency in tasks that depend heavily on rapid data retrieval.

To fully leverage this technology, the AMD 3D V-Cache Optimizer has been
developed. This patch series introduces two distinct modes: Frequency
mode and Cache mode.

Frequency Mode: In this setting, the optimizer prioritizes boosting the
clock speed of the cores. This is particularly advantageous for
applications and workloads that benefit from higher clock frequencies,
enabling faster processing of tasks that are less reliant on cache size.

Cache Mode: Conversely, this mode focuses on maximizing the usage of the
expanded L3 cache. For workloads that are cache-sensitive—such as
certain gaming applications, data analytics, and other compute-intensive
processes—this mode allows the system to take full advantage of the
increased cache capacity, improving data throughput and reducing
bottlenecks.

Changes in v4:
	- Directly returned the result of function.

Changes in v3:
	- Changed the module parameter visibility to 0.
	- Removed the error log message.
	- Removed the error condition that will not be triggered.
	- Protected the data read case.
	- Moved the acpi_check_dsm check before allocation.
	- Added PM operations.

Changes in v2:
	- Used kfree() instead of ACPI_FREE(). 
	- Changed the ternary operator to an if statement.
	- Used acpi_check_dsm().
	- Used devm_mutex_init().
	- Removed acpi_match_device().
	- Removed the string format.

Basavaraj Natikar (2):
  platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
  platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation

 .../sysfs-bus-platform-drivers-amd_x3d_vcache |  12 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/x86/amd/Kconfig              |  12 ++
 drivers/platform/x86/amd/Makefile             |   2 +
 drivers/platform/x86/amd/x3d_vcache.c         | 170 ++++++++++++++++++
 5 files changed, 204 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

-- 
2.25.1

