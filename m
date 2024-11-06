Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EA8646
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892528; cv=fail; b=XlqLWWmevS55gKxnKQjo+HG2dDczOaXp/7ZF2TSU2eUHhHseOZJIZpwdvSaKTRKqDhL72WTWdtHemK4sa9WuQKwb/lHYFPVcgHp/vPY+SpB4DqgCrK8sQdjuVzwnvtQi4zA6YkkyAmiTGtlzxOvgMdG5/tdD0TLTW70gRTH0kb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892528; c=relaxed/simple;
	bh=OX0yyBt/ROd+2pK6AUvtF9NuCQHNCAOsY7V0CNTrARg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rgZL7+U2W2PQlepBmvybEKDJPQ6beiNm61b+iUcDS6AEuf32OUyMeVetwWUcnpWcEQXYypNDVROBLhGj5oqxlbtTbp4plo/KTd2U7+PGcmLHMtZWAPDp2NNqBjJ+VHt9I33ZQtDU0622unw48ft7aHpcUJiVt/hu3X/LlPj6CLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lDY1UxJk; arc=fail smtp.client-ip=40.107.236.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lDY1UxJk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjR45rSyXFJtqy9t0/uXjLzggUU7isBr1mFCP6uLFzIPTvV6cD+lMwQbdPatX1CIdpKDT8RuNvy0IFwdJGw94YOtj9m3ulYsWMUF4LZkVRpQ57/IqwTSotO9+LLRgU8yK7HlYVUVKSRxEm760TlQ/MZ3ta+0Jphq5k2r6kKh1wAuKU1DL3HfU+hO+GHgzlLaWIEn+0fk7AwemJUuZH6Gjjddsoej8n2ddnjcOu8fmtNujNdOWwfgt9aBOcQZVx7fOlXOMISFUyLxiD042fxAmUKHqpI5iRy+05GwnsvCJ4TdLUxO151D+qUbiNPe0p+iIevljhyLgzMcdCloY7jWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6lZ03+YnvSbn7n3iHy6j/J+ZSR/p4VuJAnxGcoGKP8=;
 b=SjB15WzD1gg1e5PD1ZQacC2bm3zzDYvQRyd5Y00DjzICuLzGXHgd0KAPOSPdjapQ+e5bVLJTg8GSPRPIoCPHxAe190HEY9Mi56q3cIhbYjuntewdPoBb+1+meT92hagN1APcU9ZmDwvOpYG8NRbDGMoA0grX2/3RqaUfc/2l+fQKKrmPvInlnegunZJRr8xo94hffEwQD6vRsNUK1uwukOU/4+NIFvlAAm6jgkysAMtzhn8LHyfw/dl1AFzOxpMPvdSotJ+TsUbm53N5ZQ+TapkirXDGmdfWmglcR5NLyEPIu4+6WCS4Aixtp82C0xQ/2X5h41M73T3Cjpz6ZNigjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6lZ03+YnvSbn7n3iHy6j/J+ZSR/p4VuJAnxGcoGKP8=;
 b=lDY1UxJkakJj/h5FTxVqLPYxm3N+8LJqsn9yJmt/+MVPFQhtKqh5lCQUArIQ/UMyPcMRv2hYscNgA8AXfIrrJ1Q2f0hdm6vU5hr7GYqv1mIUojRW0GO7GqgU/Aid/tVEyxsguOF2LWMNaMSdZ4H+Rl2fan5BK37qpeQQSIVLeHY=
Received: from BL1P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::21)
 by BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 11:28:42 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::8f) by BL1P221CA0030.outlook.office365.com
 (2603:10b6:208:2c5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Wed, 6 Nov 2024 11:28:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 11:28:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 05:23:42 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Wed, 6 Nov 2024 16:53:15 +0530
Message-ID: <20241106112317.1012283-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|BY5PR12MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: f80b70d9-3271-411d-c5a8-08dcfe562ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUlBejhoZW9sd3JNUWdNTW5GSmtFak13Q1RNMHpBTDlIb1ZlelVod3NCcnFV?=
 =?utf-8?B?K21Rc1FKcUFmZGdJMDZ2VDlwWExraWdpeE5aM3RHMkZSNmI2aHZkaGNrN0pG?=
 =?utf-8?B?dkIwOERLTmdyYkNheEFhZkhFWk9hRWVhVWlOZnNsaWJmcENZT3IxcjNyc0tm?=
 =?utf-8?B?RHVrbEZPU2lsZllDUkRacGNhOUs1NU1zMDdJc05XS2NnRzlwR1dkVmlUZzRH?=
 =?utf-8?B?d1phWUJXUUtLTlJNYWlWR1F3YVBUN0JoRXdjaW1KeWdiZFVCVkJHWm5JV1Nk?=
 =?utf-8?B?c3JmeHlDSkFnRGltaTgrelN4aHNnUEp3S214UmdOakxWV0RtUXkvNXNpWlNm?=
 =?utf-8?B?Z3FnZm5kUU9hczdycG1PTkg5MHlpK3k1NkExOCt5dGZ4OEdMRGU0bElwQjM1?=
 =?utf-8?B?K2Z1MWVoL2tXSHFseWxjbzlNV3dqNnkyYzNFTHRicWt3WnVuNWVsNEFoOXZI?=
 =?utf-8?B?WjNnbG9ibmY5RmlNTjNKMjlRK2p5NWdQVzRORElabUZ6UTFVNUtUUkkvQ3p3?=
 =?utf-8?B?M1lEaVFUcVA3bzdQdjhlWjMzbDNONlZOSEZJZjgwRENKbEMxN3FpVXV0VWZo?=
 =?utf-8?B?aE9QNExlczFoWVYxNFJYTGVkR3l0cnNmQ2wyMHhWeC9DS1kyTm5vUnp2SU03?=
 =?utf-8?B?QnFsUldYdGNRbTFwNWxPemRGQ2Z3ZkRaelZJRXpJcUhvczFUdVN0ZFIwUFc1?=
 =?utf-8?B?WE5vRUV4enh4aHBZd2IyK0NyQlFySXg0bnJ4NG9DS1MzK2FkejBMYkYwdHZm?=
 =?utf-8?B?SXVNRnFnYVNHajhxSjA0RlFINFV2ZVhQVVpldk1wNVpXQmJCbDB6d3NvamE4?=
 =?utf-8?B?WmVrTWo1K1Jma0JCLzNYQ1N1OFRzL0o2MjRSY21sS2pxTHEzRTZjRnZNOXhD?=
 =?utf-8?B?cXJKVE4vbHEwK0RaNHFxNHI1eGMzMTJ5S2JOeWN4dzJhNW12VXYzNFJzVFlh?=
 =?utf-8?B?eFp5bjdQelJiSGwvTW9ZY3JKelJHeWV6dGUzaEVqcUNDWUcvVjVFSDJyVGxo?=
 =?utf-8?B?TUFEbTJaQ05mK2Y5cDVBQXR2MVVTeUNuTjI0UjJIUG80THVrdk1rd3dqRUlu?=
 =?utf-8?B?TnRIL2ZnVThqR3hNMytKVC8xK3VJT2paQzRQM0pJdklxZ1dUZjNvbkhNQi9Q?=
 =?utf-8?B?U2cxR1hmQWdlNVBITTVUL1FYellFeHdsQUxLaXdYMnkvVjJzUXk0dllGWnpj?=
 =?utf-8?B?WmtlbmVSRW9RNS84QytvNnJUYU1hRGk0N3o2TEU4RlNGdm1mbVBPUkJuR2ZC?=
 =?utf-8?B?Mnk1cDIwM3R0Nno5R0p5OTFuVEUvdElIZHVwL0c4aWdXSzdEUWd2NnZKYnFS?=
 =?utf-8?B?d2FqYktlNFU0Qk1hRURSRWgwbVZyY09FOUVUM050dllsUXdjSnltM09UaFB4?=
 =?utf-8?B?ZDQzcXR6ZytNZS9nekdTVzA4a2xEZFNZRlRHUmpWUmZHdnhwdGZqM1Z4VlF4?=
 =?utf-8?B?S3RwWmVOb0FKeUhHdS8yTVBaRW8yZUl4cjZ0YTk3dkNWUTkrMTlDS1lzbUNI?=
 =?utf-8?B?VWNxSFFnRTdwSER5T1Uzc0wwYTVCTm5kZTFWanVwL0hFbzVrcFUvcHlyUnpT?=
 =?utf-8?B?WEpabkJGb2FtSG5yaEtSWUc2M0F6QmMvSURhSHl5QVFnUFVlbTRMWW16a2lV?=
 =?utf-8?B?TGRacC9rU09uZkp6OG1JRnRCTXdGa1psNStHbStXNDZGWE8zelExVjY1cEh0?=
 =?utf-8?B?a0xVWXBJN3N2NXBUYVpxdXpJOXhVWjJFTFA3OVhtNFo5d2ltYmYvbkl0b3hG?=
 =?utf-8?B?WSt1NCtRaVNWcmxYdEZ5RnNNMTNUd0xhbndJQkV3TVFyMFVVTjcwWjFCS2RP?=
 =?utf-8?B?NUJsQ3hybVlyV2ZXdENiQ040b00ydkdpVGtwUGZackZzdCtLMzRlR3g3RFFu?=
 =?utf-8?B?SkVDZTZlczZaVkE4WXU1REpUREc3amZQQTU3RklQLy9OUVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:28:41.8307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80b70d9-3271-411d-c5a8-08dcfe562ad3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148

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

