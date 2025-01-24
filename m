Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C635C15CD79
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739639; cv=fail; b=VTwv/SX6h6IP8c9nsQq9KAntpmoJaEvkqO87DkvfOo0aKaHdkG9l3nRBXJmRacDByNbA6L/iPAT8h3QAalpWfGrEOUduouILkJMqNbPDagpLwbSGIwblg+rZ0U/8UfzG6aa3uiGZgohBrT7ScX8g6WiPWpRA0ELj82MGWPAp5Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739639; c=relaxed/simple;
	bh=xKJN1JkFHnCehi32Z8c9kkHt2Os7KHdznP1jw0oy1uI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sA3fiq1PVKrBodlHp69vOe7nQC/1npXV0XyCfsh0Y6VrkJI31YKVMUbNxHI9cQxX3CmiY/ddD+PNClsIex2xTvh3Aznx2+YZIAyEH2UjlPYQeVcjPGPr0BsaKjRm6MEwxTrEfXghf+KLd4VgMP63FWrTbvdGpjbygKgkH1n/A+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RfTUX5Vj; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RfTUX5Vj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeEHL/LkTa2Bg3sD/OxgAXx3UGIKKxnpGjpyQWR8DldDmhV5ixH56EIKn0tEAkzGX5ayZBMSyvrdEUsZfV42T4gMckgigurqZb6YAqqzbojq0/BidBnly397xqLH6k5vo32zOYSLfXtP5JvD/bnSTDOlTfi2IdsMNHiwbNfQcrk5hjJNI4YQM8y+4PuuwoCSDv34h9wNimEQ06OzHf8uVZjJINvGmxt3UNnWdbViGYnfAPssdUJbwtLCduLGILcjsN/DnJkYil8fPOQqlBxl32QqsvWEIEjbiAaMiP/Ci0h11x3NPt6m7Z4tT+MjwTIzeziU0bVsJyH1QAuw3Xu+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DK6+hr3v7m0kyoWMdGV/yJHfCaQLP21ppYvpvtquE0=;
 b=CEXZ0XMCdkV6HrgX9pRPJrqdtLhMF7eC3pNHrUPy+ggGCaft88YFi6Hc1WHwEguT1xudHIcB+xrjihS6GuKhshkZB9Wmkqq6Iejf2Td86RrZM+2ZBAF5VPZsXFXdyz951npi+3RO2b0HAj5um6s75eNkVeZXZCm1ajCZ5pMLq1ejPoytzUArxQyfugoSkhUNf3DvOYUtJ8FazbBW9gOGH9+JqcVgayW1E8M3+CE1IHngA03dXjDOJzA1hOMH+I929Udhx++qW6Mp0Wfi3f0BbksHOYW3OixUIbxy7sHJ1XNugPXwyTNFCeWbNG4fn6BBMUYMUzSy5x5fUEFvv4ZZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DK6+hr3v7m0kyoWMdGV/yJHfCaQLP21ppYvpvtquE0=;
 b=RfTUX5VjpYYNkUqa3qoeyNFcRYAM+Z8DOFnYevOngUc9rwHyhmLYMQHAGhsO2IgUBdoTfS4U8hvXBm2XcelrR3KhZ4BIzuN8Q/VwMlkY+c1vxtOh4ee0SSDrbto69k/fb4raOjWCFWro56IeKaWjMCs8hNAzyl+uw7T+FD8cHSh1flyblUsrnJ4qLrmzKXh/GotoCt/m1zACQfWopkeWgTiYQKg9hepgjgvGYZNEwztyF9NWVR8fibHYWAFijRxVtIjomZ9amfQ0HDOvMArHqRV5r2qIeHVJ9gigv+RgIWnz+Ea3hZfhQ2kFc9yVYRwb984sBO2TrXWvqTSkpGR18w==
Received: from MN2PR15CA0006.namprd15.prod.outlook.com (2603:10b6:208:1b4::19)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Fri, 24 Jan
 2025 17:27:11 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::d9) by MN2PR15CA0006.outlook.office365.com
 (2603:10b6:208:1b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Fri,
 24 Jan 2025 17:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:27:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:26:52 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:26:50 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 00/12] platform/mellanox: Add support for new systems, amendments, relocate mlx-platform module
Date: Fri, 24 Jan 2025 19:26:18 +0200
Message-ID: <20250124172632.22437-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 273f4113-9e83-4125-00f6-08dd3c9c558a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmwvbXJhYUNqMmRnQWxuUjY2a2E0WkFMTm14QkdjRjRkdkpBUlIyT3ArWTZs?=
 =?utf-8?B?VkZobDlZSG5YTzh2V04yeGFNTVF1WkV2T1hab1lLRGptbEticjIrUVluZVdh?=
 =?utf-8?B?dUwvb3lQOTYrRk5UbStyUWx0bUV1ajB5dkpmSGd5QXQvQVpSbXJnajZIelNK?=
 =?utf-8?B?MC83elBqRnp1VEoya2YxTWxzNitnenNmQ1FzMjFGM1VuUUZOeklWVWpCQVVG?=
 =?utf-8?B?K1Bkcm1MOFNMVkpVdFFmaUc1cm5FemcxdmVJdEZMTmhEeXEzYmRidWY4WWZ0?=
 =?utf-8?B?U0hsT3N0TmlKWEt2OERaV0xmMGVKRi9RbUMzeHJsSHpLd09vRkY5UEc1S09I?=
 =?utf-8?B?RlRXT3M2akRzOG1aSU9OajZBUUVRUm9LUEduU002VWQ3NERBT3p1VVFlNytj?=
 =?utf-8?B?NE5vV0plZFBSNnA0cEtaQkJ1T2ZCeGRWTElMTVJybm5RRlgwelJKcnZobHhD?=
 =?utf-8?B?NFovYzNYbE1VN0NHUkVndmU4L21SWGtqSXU0RTE0aXZ5SkF0RTdsc1VtVzVT?=
 =?utf-8?B?czRrN1o4Rzd0WjFiVGR3cGpheE5NZFMwN1ZVdlpoWXhhUjNMcHEvRysxV25H?=
 =?utf-8?B?ZDJ5Z0J4U0RJTFd4UXlQdDMzNmlObnh2UytQYUlra085dzREY3MyTU4wMTV1?=
 =?utf-8?B?aXNKbmRpWkU1RnBnSWdDSXlTMDhxTEM2NlhIYWRRWEc0ZjNTVnNtWUUwUWFk?=
 =?utf-8?B?VCtUZkI0LzAyZUI1ZDBoZWlrTi9STnkvQWlUNFZBV0lHYVF1MUV1NzNROEFX?=
 =?utf-8?B?N0NYM29ZNm1UdDdNVHJSTVpUTlBrOU1XVkVnaWpON3hoSnpFSkljRk1XcnRt?=
 =?utf-8?B?Wis4K3hFaTJBN0pxb1ArOE9wUVZkOUlCNkhjN0g1WnFjejhSOEpSWGdQcnJ6?=
 =?utf-8?B?SFd6T0VEMUtJWFRCOHNkQ0NMRUxocGc3MWJNcVJET3FkN3pxb0pIQllhK1h6?=
 =?utf-8?B?Sm05bHlrYUx2S0NrRTdGc2NqTHpTREJnUVZuU21SR2hIbk5LWU15WStnSHdy?=
 =?utf-8?B?bjdrcTBjQ0Rkd3N4NnNYbHgyVzd1eDdiY2ROMWx0YmZnTDRjbGtrM0NlVmZx?=
 =?utf-8?B?Z3ZkQndWMnhscm81ci9JRU5TL0JaUTRSKzloVVZXbW9WbGxxd3p6ayswdGVz?=
 =?utf-8?B?WGYyVzR5L09xZ1FNdE14V2YxUzdWM2RXT0NyNE1KV1Z1cjlYTlFqVGp0ckY3?=
 =?utf-8?B?N3djL2EvNkgzNm5QZ1RMRmh2QkxhQ1ZDY1dwdnY2TFl6QzlEV2wwWVlJUGtk?=
 =?utf-8?B?ZG5hNUhqWUQxZklvUEFoazRWclpNU200R2RXVFdPQkhPeEk2WUticzRCQkd0?=
 =?utf-8?B?UktpejIrVDlzNXZKRXM1elJYd0VKem1YTWhma2g5Y3FCcUE3NEk0UWRQa0dv?=
 =?utf-8?B?L2FqSEhXVi83bTNZdU1zSmxSTE1kZU9kcHJTRHJRMmxpQ0kvTnQwcDdWM1lz?=
 =?utf-8?B?cnJJNFFFMFFKVXkyb2ZWUWUvSncvQm40REFSKzJUVEVZaXBrT0JTWDY3eGtK?=
 =?utf-8?B?anU0NGxNT2NXRkUzNU5lK2ZvRi9wMzhjMDBzVldrWDVXVGdmRFBTZTc1YTdY?=
 =?utf-8?B?d1dZL1pBZ0QwSU10TkZTVklqOFdLZlgvbzFwNzY4Yk5wSjUvQXJQenk5R2NY?=
 =?utf-8?B?YnR4MmQzZU5sdjhoeEVjSFN1Ym9aSWNmVGZNb280YXhaRnBBQngyRU1JZThk?=
 =?utf-8?B?TXo5RjRtUnlDZlNUWTBOL1o2ZnljeDlFQnczc3BMOVU2dG5rbzI3UnNQdmlh?=
 =?utf-8?B?aVlFNnFWdzlWQ3FheDlBbk1zVEFYMi9meFhLMXVWNWdVZFVtcVByem9ES2RV?=
 =?utf-8?B?WUFyckdRSW9abWk2QzdZUzBKd3ZOTUNkY1g3cS9LUUJhQmthSEZ4ZzczOVFv?=
 =?utf-8?B?NnBwMm9uWEVnRDNXcGtNd0ZURUx5eldtSWZuaTNIa2hwdEYxdDlnVzd2NlhG?=
 =?utf-8?B?Q0ptUzBCUjhtS3hZMmo2V2V0QWZoTE5Fb2M3ZWdwUWhHMjlHcTdhY1JBOTM2?=
 =?utf-8?B?eGRuazd1bENBPT0=?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:27:10.2119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 273f4113-9e83-4125-00f6-08dd3c9c558a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

The patchset contains:
Patch #1: Relocation mlx-platform driver.
	Change of MAINTANERS list after relocation of mlx-platform.
Patches #2; #6; #9: Add cosmetic changes - removing spaces, style.
Patch #3: Repurposing of one register.
Patches #4 - #5: Add new field.
Patches #6; #7; #9; #10 : Introduce systems: new SN428 smart switch
	equipped with DPU for offloading, new 2U systems SN5610 and SN5640,
	new compact system SN2200 OCP rack complained.
Patch #12 - Add documentation.

v4->v5:
 Comments pointed out by Ilpo:
 - Added inside pacthes.
v3->v4:
 Comments pointed out by Ilpo:
 - Added inside pacthes.
v2->v3:
 Comments pointed out by Ilpo:
 - Added inside pacthes.
v0->v2:
 Comments pointed out by Krzysztof:
 - Merge changes of MAINTANERS to the 1-st patch.
 - Change order between SoB and RB.

Vadim Pasternak (12):
  mellanox: Relocate mlx-platform driver
  platform: mellanox: mlx-platform: Cosmetic changes
  platform: mellanox: mlx-platform: Change register name
  platform_data/mlxreg: Add capability bit and mask fields
  platform/mellanox: mlxreg-hotplug: Add support for new flavor of
    capability registers
  platform/mellanox: Rename field to improve code readability
  platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
  platform: mellanox: Introduce support of Nvidia smart switch
  platform: mellanox: Cosmetic changes to improve code style
  platform: mellanox: mlx-platform: Add support for new Nvidia system
  platform: mellanox: nvsw-sn2200: Add support for new system flavour
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |   96 +
 MAINTAINERS                                   |    7 +-
 drivers/platform/mellanox/Kconfig             |   25 +
 drivers/platform/mellanox/Makefile            |    2 +
 .../platform/{x86 => mellanox}/mlx-platform.c | 3699 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  620 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   30 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  112 +-
 drivers/platform/x86/Kconfig                  |   13 -
 drivers/platform/x86/Makefile                 |    1 -
 include/linux/platform_data/mlxreg.h          |   12 +-
 11 files changed, 3513 insertions(+), 1104 deletions(-)
 rename drivers/platform/{x86 => mellanox}/mlx-platform.c (81%)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

