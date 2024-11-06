Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3971DE3AC
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892652; cv=fail; b=WUKBOyPVSFsIP6xpvOWp1bYYaWBWKwMg5CNlYbbsFAxKxI01hhd8ikWDZALb3Pzw3g8HP2Xk004dmnS9BHV05VkA3Uw/r5g6gGRSwwjRqrjfiS4CFBtPADmXpq3OaaZyTXjLc7JvEYKBvFpzciQW7+Z1SlSBiYNyAfJnDtfnndc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892652; c=relaxed/simple;
	bh=OX0yyBt/ROd+2pK6AUvtF9NuCQHNCAOsY7V0CNTrARg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t8rZQWkyiN6/44tLArpE5iI2eAgmdgG5ivjslOW6U4t35S/CzitHyI+pGfyEy/QHkZ6KYBrEBRh5y6nIztWadUCvk5fiJU8K9pbtwWdCYSs+yZD4eD7nik9DHf1F81krsH1EwKqdss7p318HuabvgBScOe+ukV7LrtKdLmYu9Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p0uF9Q2O; arc=fail smtp.client-ip=40.107.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p0uF9Q2O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocGEF4fdvAv//yfWvtwspSaxRIQDddd3LhGGxXecs3paRV+z4rRv2XIlr8B/vPjPhqGeAVlS5TU+F28GAGv4DyMELCGDjj0De2dYkxTU33Y8o2MP3AGDzMNEK5jGum04tNJpz/6AG4t3YiQark4jKdnCTsaDtGGAjZZMFTnJwPKil5b2oxhdZ+o/lrKr2wwJjiirdNIXZUrvLJGLESskHwQUhQx1wn5R31xJrG4o0+3JZtFZwNIRfD8voH0V/CkpqKwudYdjx1uGX0478fxMlgDpNg1mr00bfemHIoBfadzcvm4psRaemvtOpcRa7JiBbYB0xhzKWgYlhm4tN2/WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6lZ03+YnvSbn7n3iHy6j/J+ZSR/p4VuJAnxGcoGKP8=;
 b=jPrClV6AWINt6SbyXYBMiBIiDU8RmNFfwcfUWRFY97WmqB2IIs5sIPkt/Ft+Rd4dJC9JY38Ok9UY8N69XcBYjcXPMnKwixfGfIuY/uoCUAuMrSVCUlOY8YPEx7HCjvaTYB/PR/tFwulQvnsDdMOgzJ/m5mZDpH09o/DdR3K0JuB5IIQM0MmnSYtnvbXQlo9j2sb5CTPng1VfKYHUiQAC5PrriZZqgIJjEclsLmfcBbe0LgFAp21f4kBmbe71uYZcIHQleTicAlDH8X5pnSlhOraJumkfSbRt1Kd6ymJI40YLz4u0OgIeAzPNs9fWZsdOqNIQw3m+PCzjpnIJwlzj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6lZ03+YnvSbn7n3iHy6j/J+ZSR/p4VuJAnxGcoGKP8=;
 b=p0uF9Q2Oiq9TxxQxPNgvHo6b/HADmxzPIwmPjdQ8f7chQHN20iCGwghVl+ItOMI8Sa0BPNd837sWn2PvJ7rfcnp9RghPlZru4qEUtiGr6tDtJaxK+KH162nCsD6GvyJSiY29lBm4dOu57TNOPqCMT+AGCpn13ShksemZxILMhps=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 11:30:46 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::b6) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 11:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 11:30:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 05:25:18 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Wed, 6 Nov 2024 16:55:03 +0530
Message-ID: <20241106112505.1012337-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 3088753d-912d-4cf6-4dab-08dcfe567484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akVndGlvcVVDRmV0aXg4NSttN0EwU3A3UU52a3dnUk5vT3REVFhVL29mWEUz?=
 =?utf-8?B?cGpzblk5eEFJZEVvdHVKcUpOWGliMTVHVkxEL0lLemFuUmVUQ0xCSnA2TExh?=
 =?utf-8?B?Y1UrSVBMa051MXJONk1HSG9LemVFd0JZRzRSeEg3SzlEVnFGbGF0ZGcwVzda?=
 =?utf-8?B?UDE2dnZhZDA3dkJFdEllNDhCWlhuZTFqYjAzb251aWhzcWNQRXVOTXVLbHBZ?=
 =?utf-8?B?dks2S0lKTHoxRE5jTmhjUy9wZDVmVzM4anFRc09RVFZKSWFaT1czU0RNQVN5?=
 =?utf-8?B?Z0F3QlExNDcwZG5EYldlb1VpaytSUFFPa1BrR0wwY2hZcWlwTFFybDZaMHNz?=
 =?utf-8?B?clQ4THJ4SmdJUnlzNFhZOEEzRWsyaFBmRjcwRUJOZG4xOEpQc3Z0NXh0MGEz?=
 =?utf-8?B?eWRtTHJkUzVhNjYwL2xOR2twV3hkNktNYTc1Ym5OOS9QaW10eG9aVDdGTUp6?=
 =?utf-8?B?dVdjcWxDZzl3Sk5zNUVYditFM05kdU5xSE5FU1k3SC9TR2E1UkcwYlNOdFZ5?=
 =?utf-8?B?S0phQmNPdGtkN1E1MFlNWGxuWldPaVJTRWw4dDlqZDlCZDQ4Zi9PV2laRUxn?=
 =?utf-8?B?ZE1wQWswNkszMnk3ditmUjZnOWlIWVZXSVZ1V3pGc0tpc21SWU9hZ3dzNnFq?=
 =?utf-8?B?OUNodjEvYVJreDRkSmZtR1F4Uzh0T3ltWVhGVHhCeXB1V2wzTlhhMTlhdjZL?=
 =?utf-8?B?cVh3aWx6TTVFc2sxaDdiSlRCRTE4bDFLN2d3TndXV2h4UTYrTXN5a3kvbEVy?=
 =?utf-8?B?QTI2S2o0a2pvUW82MDJQSTVGSmFGYzlnV0V4TjFYdzcrNktxcFM1bXowYXRj?=
 =?utf-8?B?aExRRUlnWmxUM1Blb1djWjhtM0EyQmtuSitZSFpXZzJ2QXI3ZHU0VG9YZDdZ?=
 =?utf-8?B?TGYvdDBhZ2JrVTh3b3NYMTlVMWN1NUM2d0ovNUhER2IzZW1HZkhFbnJteUxm?=
 =?utf-8?B?OWwzUlUzTDdWSVh3aE9NalAzZkZ1TzBCYXJPNC9CVGVVdXZqWDg1MjBwUlZG?=
 =?utf-8?B?M3ZRNDNrNDlvMlBBcnZpaGRqdUhyUmdEYzFKNGhRaW5hUDlIa1V0elYxR1FE?=
 =?utf-8?B?N1BpdnUwV3F4SjhLSm5wcVJBR2RGazJKdklMUjFFZDNSNFVLdnlXS3hVUTl6?=
 =?utf-8?B?TkprdEp2ZDZGcXVENnA5TTI1akxBeWhIOGdHWVFwbitwakpCQ2RNUWxiYTF2?=
 =?utf-8?B?WTU5MTFqK2d0c1UyVzB5YkMzaysxTHZuQTY2YjFHb0wyZkw5TGVQZVgrRkE5?=
 =?utf-8?B?T21RbjhVc2E5NTN0VnR1TmFSZjFldGMvMzdEMFp3amV5NTJxcmlHUTQxZDJv?=
 =?utf-8?B?K29uazlhMjlxbmVkVlZVMnVqZ0VpN0w2OE8vR0pGRkk2aktVVzNGTEFic3o0?=
 =?utf-8?B?UDIyNGRMOVdSRTQ0Q2VsTjhRZThrZWdXWWd4SHlRWjZySW1wdUJraTVHSGw2?=
 =?utf-8?B?VGhRN0FBSHA4azlYREhpUDcwQmxHYkJ3L3BuVjZlMWx5YU0zaXlyMHdiODhN?=
 =?utf-8?B?bm5za2lGbitVRGJ4cFE0bG11MUhQSDFwZy92Qit0RDNxTWRBa000czd6alE3?=
 =?utf-8?B?VHdFSUY2eG91QjdITUJ5SjcrSFl2UGlVcEpCaWlodzNzMlhVemdwRjBwY0N2?=
 =?utf-8?B?b1hBVXcrbk50eGZrV09QQnJiVm5VUCtaUEdYc0RwV1c1VXRaYytOSFQvQzVB?=
 =?utf-8?B?MzQ1NExLSFV0OXdUR0JNQk5VQjVsZElaZnZPangwWmZ4WEkzN2ZScGFaZGdS?=
 =?utf-8?B?Z2lrMnVWNkJFUko4b2gzc3gyVXNBQXJuQWxpYVV6QU52U1FSNDkrcmxxQ2tu?=
 =?utf-8?B?V21BQXhNaUFwcUVaQitHcDhLR1Yvb1A0QThlM3lOektHM3RFbnNWcGM0RitX?=
 =?utf-8?B?ZUFmdzdMdEpuM1FTVHhIWjM5SmxTbzduMnhtSmF3bW9qVmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:45.3675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3088753d-912d-4cf6-4dab-08dcfe567484
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378

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

