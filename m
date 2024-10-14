Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A764A1C
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881914; cv=fail; b=UYCAE7LuqH1u4ndtkG3rFpfrbKFpQF/eH0nt7+2GYaauBEI4M+0+Q5zhx35huZ6/GSdD/36t4JpCMJuXYRoUDItZpuziZLm+Hzbu1YbymCci1n+vx2SeiSSuIsGJsERK51X9OkGMvIHAJC/FZE1POW/Yg3cuYMYQT/YhzdX+HOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881914; c=relaxed/simple;
	bh=/5jzwhdMSqme5oXhAUXxCaArEoi04ZiPyeQuP8l1zQ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rSvu33MAdJv9bQ6Rw6FwuTXLqKo20AHuUJe3tGtyUGAzU4KCLMIcSCcBQLSrwX3zGFv3xF+tKpaU75+gTYMLGjlI20u3znpsYrM9Wdn0RsJUJGEIK9H9Jc35plPl2u7b91k3TmOw/IzrtFPE7w+Nxbj+6yCf/VufVYMGPM4Or1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ihlNz4Ra; arc=fail smtp.client-ip=40.107.223.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ihlNz4Ra"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPX5x2XL4WhAHdMfmKvsr/iDxuJT1AaCxgH2LsrDwyOGkGdq/I/JrEbI+mqkU/OvJLCMN2ruoLKipHUQdf5Ck1iHYc0jx/1mvEU5g/NuN/un4HzSCfbCwofLVwCwtnSkNrNCYTEj2M4YdfJhRZa26uSKI2tj6osAeUXLNblT/+m3H+jnCwDf2jFzgF6wiXj78YRXFq6kk5Z/plYnadObHzBrFoKePgMnlPjNIi7Zo6PXqqdfJY5melUBtnA47coeNS+3hXSWDLvtyXsRm7YsXYvqq8wxlvqWN4/HX4l81dJv7cmYJAzFhS+hc/QtX5YAsRGFcQN4Of9UsIYPCpTt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0mmeRksuHl0WiGtE/LuqqrJ26V1dmQDaH7nkafBGEo=;
 b=cGG+yDbjaDyg1wvMw+Vli1u7LTzOrj4qIwdq8GzTgv5+uGWnK3c7pKZxjdEjhTJDoFZ0ai3y2kywMpGQClbYO1LSp95TEGKJ5+xvebb1ctI9/tb3/bs4v4X77mXdyghb6DyOZomqVa/+dQ/CPX0TzwznRx4aEItKWMX3ad69kvikQYLSS+vS8ToOpEDqyA+WJVsHL7Qgp41YwMKqwX8A3L31w/Lv5luvS48lHkiItIy3tw5fbgeUzEAz5VNT6xxpbdK6lYoumj/KGTjkGkM+DeaWLuDBiGdv+hXQ/ZZ8J+nmFlQC4FhOTBY2Rm90JOfiBp6+sjqyAfte971L61fi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0mmeRksuHl0WiGtE/LuqqrJ26V1dmQDaH7nkafBGEo=;
 b=ihlNz4Ra4IUuTQDOZFzXZC3O3dTIgMm4gl7mHo1hxVHLZeBTgK3lJUSzbY+NbTkEYEgDq6NpVGWbNkGedZUUoPbKd0c/vikjtfL3KALjod58iuWqU6h3zPjPZEhBab/yDJ3uQWszGmCHwo5JaxrYmkckYePmKmxwsU9QBOauDr4=
Received: from CH2PR19CA0017.namprd19.prod.outlook.com (2603:10b6:610:4d::27)
 by CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 04:58:29 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::92) by CH2PR19CA0017.outlook.office365.com
 (2603:10b6:610:4d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 04:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 14 Oct 2024 04:58:29 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Oct
 2024 23:58:26 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/5] platform/x86/amd/pmf: Updates to AMD PMF driver
Date: Mon, 14 Oct 2024 10:27:54 +0530
Message-ID: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|CY8PR12MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 866b3057-7f6f-4740-6e2b-08dcec0cd848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bp+bjpYL4SCiIf5V6+Ukdgy4eDpe5RDduOicyQ2rYstYx2CrqBL8CDFmX23+?=
 =?us-ascii?Q?g/UwoNfOK+dJJ4Fi84iFtzgy92byeYxyo2QzdJyNMC2koD5vnzvg9rU8Mm+B?=
 =?us-ascii?Q?vsAojSwxUMDB4tQ2hEZ0aMEsVIZn8GQfh7Oe1Uxd4L7Q3mLhGIP3kkcNWTWU?=
 =?us-ascii?Q?Ts3SqtWMLexPsCoHNGAw+bQ+HXdEHMfo6DqSF9GjUoO/loSUnUUjTs2SRykW?=
 =?us-ascii?Q?P6Dsk4L7nfljaJEPyAQZI21f7XWecwCMAnPkUm1RNTug5dOf5fbVm9JdI4cK?=
 =?us-ascii?Q?a54BeA8YiwJ6XVAcTrlyfPReoltjs2Hx3JeP7YlsH5SfOfGHY0TwkqqzHtGF?=
 =?us-ascii?Q?61RRQ0cdBzDy6/Mhwk+qO3l5WgUQl8Wa9DXBhDsdwnsBTQuN8jfokprSbcFn?=
 =?us-ascii?Q?2v59qnVsKcw8KxYL/kBPHzdm8pHumV3FeWZaeBhvPiA88Z29NO0fSaAdnvUz?=
 =?us-ascii?Q?kE7pAAY1hOUy5YxVCMKHSL/qT3WAV8NCVVPHEWvwLtGIEdlAgVWLuV14zF3C?=
 =?us-ascii?Q?L9Sdstr6LonWm4PSCBZ3BV3nrBk4ayLYVCSqs9beVhDwq1OqDn3s8Ki5e7kc?=
 =?us-ascii?Q?DWGA2qYGV+3mEFVM6f9gSGG93PDQibl5vm1vafSjypC2Duq3WQAr86L15C6/?=
 =?us-ascii?Q?J1m7+/vaHMSYIGpmue1PNN0FXVscYZfAYBVjHS2gmpJrIYndpILDa41PjFFi?=
 =?us-ascii?Q?/L+7BcCTPmX61NiHmJ8UVPylcJ3Ql6yflpgwY/caSDd9zWQ1NonRfQ7EP/ft?=
 =?us-ascii?Q?cO3Dglmn3NvmIbK8fblJSd95u8ORkbm2SERdCg6hw3O1orzh5KqnO3v1fuUy?=
 =?us-ascii?Q?Tqd5eRmE6nyi25svdxUY1zvGKrnGGOmWf6n4jdKmy7u40EggausxzzH5vMus?=
 =?us-ascii?Q?q+Z+rUA2FeRc8HkGDDMsnny0cEh6JiwsbYbW2BqrVTRHsstV6l6tPb4ol0jm?=
 =?us-ascii?Q?N1kizUuset3EOv1kEjFLzir69n3Ze9E7oy75hQuFGNPo1oIzDZ+3TwDXXlJv?=
 =?us-ascii?Q?rfdnb0+3q1AWS8TmOhTVNWgS9huMcKMNDEVvW4xW5jx4BEO/7W19aanV7XHk?=
 =?us-ascii?Q?2hcyUxMIYRalGHmZTDBVOsfjwPLgLBLo2m3MzW7c1VdBn63/yvuMeey6YSDc?=
 =?us-ascii?Q?QzztNZ5ajI3aJlxQCQex+B4ixouHRMnLa/I02sRJ/naMAxgL70+02RmHAn3o?=
 =?us-ascii?Q?hLONv2f8yZib2j8jgSk/5ATpkYGEgZADquHsyzA0gk2e2tGh01luSKFvSP8N?=
 =?us-ascii?Q?JIzGgLjfqdTiz+G9YsYbQzwvm5Q+GSDN/nZvtNmo4J+XJ8r6xFu4uyZ+Uu9L?=
 =?us-ascii?Q?QdfWYzR2UiMucKjLIlo3pshUFCFRiQQppsdOtqLNDhdJ3eeJNmZ/3fXAJPda?=
 =?us-ascii?Q?GVQQBHkIZO5gUYPYzCJhnRDuuluC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 04:58:29.1374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866b3057-7f6f-4740-6e2b-08dcec0cd848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7289

Updates include:

- Add support for newer platforms
- Enhance the TA shared memory size to adapt to the updated TA
- Update the MAINTAINERS record, and
- Simplify certain code handling.

Shyam Sundar S K (5):
  platform/x86/amd/pmf: Add SMU metrics table support for 1Ah family 60h
    model
  platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
  MAINTAINERS: Change AMD PMF driver status to "Supported"
  platform/x86/amd/pmf: Switch to platform_get_resource() and
    devm_ioremap_resource()
  platform/x86/amd/pmf: Add PMF driver changes to make compatible with
    PMF-TA

 MAINTAINERS                           |  2 +-
 drivers/platform/x86/amd/pmf/Kconfig  |  1 +
 drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++-------------------
 drivers/platform/x86/amd/pmf/core.c   |  9 ++++---
 drivers/platform/x86/amd/pmf/pmf.h    |  8 +++---
 drivers/platform/x86/amd/pmf/spc.c    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
 7 files changed, 28 insertions(+), 38 deletions(-)

-- 
2.34.1

