Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A071EF0A9
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265597; cv=fail; b=B/mbeBzb5vBFm/nth+CNmicFebjizgFmNhL2e9gyj9qMavulSZGnfSSc3Q7eCJFAOBNemmIYXWaO1nkj4Ewn+Ctcelec5vFi0cK+pWBDWGrtT+VhY11ZZRWfidWJ/PNa1ERu8NMOAa/071m7EwFGzcw9pBfqUZ4nLeb5tGkyi3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265597; c=relaxed/simple;
	bh=+ammnAsuFfLFxI4Ktqx1eF0Gg03sTciVAii0WPd+4AI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dIAdYFuXqWvHoYIr9tcEn+zwQdOrFvlH4p6f/hdC9ThBUUfaFUNe/accP4OR32BzQQdmPqHXBqZ40k+zsoshR2WgZLpNlxkk8DiLaJiMKBXNfhv8t8GwnYJWJCEAfybNdpNkQRSk12jOCIROaBaCY5YmuOWj8lJCVMR6j3T5WzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vhakozbc; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vhakozbc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHJks4zdxbogDUECU1gGZ7H57IRE9n/kfy2ArHv2JUZKjr3f5uEks8mjMTMU/RMRE/3gu62r4MqSN55RGyEz3XKb2DlaIdI0fsbDWXvVbCe7BNadVQEV+3rZ28lGgEZ4iZaigSFTAY+ms96T+5EwkiJ0pWbJMyTzK96SrmQG6jtPlD/VaJsA0NqomqB5S0m5ZpH1Nit8K49P28Fl5tHu/9aLJmUuZ7JaGUstXdFobqysZEBHtp+05xx1Yh7mF5Q2YnFYjJRCwPPIii1OVpPqeBECYuUmEaKhJ1bOANRw9h31FUuR4vSfTfUsZhlP1CcRZAacafxLwCWaUqYLnRX4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MLyXqJFtxvLmTzaf0K1HRAhT0A/AMlD/RZ6D8r9vX8=;
 b=s0YDloIKg1+xnIyJvhLQkW0PBoBxTaHLHcG+q33RIi/A58LMzhZPTrusBQa93f2s59Qi/CuseVccPTZ0jdt7vc5tGdt52eRW1yWgzZvxfAAMf2mzuGjPQ/aIcLh5gM2PQx9yITxF8McwFK+KiiQJBk2Jv3Lc4LhVsRVSNILCZiqnxvIxQayChWTHF9vHm+8v7OSflrlPebbV+euWNIr9DaL36PoYw5JcDmpMczbdpXG93EWjJ+iiLiXBnTbPqPJzRxgN0+u+9qV+aVht1xuDE2Bz1nQrNg0cqP6cQ3ezViaZD7fByvorrQDTvA5/fcEpRZwDvNXC2nTTMCJWla+7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MLyXqJFtxvLmTzaf0K1HRAhT0A/AMlD/RZ6D8r9vX8=;
 b=Vhakozbcy6oOuCKFKOR3cn+BA5kPrxxqxle8q9oAK4Ma7mZ9r1jcmqop284yyBCxkPw8LHhxZ9hRbVHAyP0SUwhWSR0PC/2paw2ySg2rnAQYztDtORbEzKYmctDNFx3ZOU93plp4iPUHxA0jnUdXSv2rO/RgMaC3dXz9ls6hwfAqJ9/PaQqmmwqhdCxetoCD7+Dx0W2t6TnF1BvLSdBkmW5UE5ZS3z2PesCC6l/KUoOSUCyL5RgGS3ZeRmt3TbJ/7TpswCt2YObet/DnsUedQbfjjoIKHId1tkKtYG8MvCkzBN9lU5gbdQ8F/CbaBfpxlIY4t7H6kufYbXRAhNKC0Q==
Received: from DS0PR17CA0010.namprd17.prod.outlook.com (2603:10b6:8:191::26)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:19:51 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::5a) by DS0PR17CA0010.outlook.office365.com
 (2603:10b6:8:191::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 09:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:19:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:19:39 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:19:37 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 0/9] Add support for new systems, amendments
Date: Tue, 11 Feb 2025 11:19:03 +0200
Message-ID: <20250211091912.36787-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a804f9-0ee1-4d18-eba4-08dd4a7d3d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTd3RkJhc0Z5SGhDNjhURitJS3NEeTFROTA4SnVtSlp6Ty9RQXRJb0RpOVR6?=
 =?utf-8?B?YjliN1dxeDhXb3NyVjNsUDIyMmhtdkFJS25KSW1aa2dvc2JTQ1BVS0VCcVRt?=
 =?utf-8?B?eWtNUUo2ZnpFN0RnZUw2NDlaOVBjQzcrTUNFY3UwQ0xJaUVEdUpNdk1hVW1H?=
 =?utf-8?B?bC9KUG81UXFnMW4yT2g3VDZMakRVSGNvOThBdktPQ0habkpxdm0zQXYyUWZ2?=
 =?utf-8?B?WmJhRXNxU0dnQzErTDBtRGJQZzQ5SnJEdjhBYXBpcXZzcTBna3RHUHlObUxS?=
 =?utf-8?B?NEtiNERTUmswajA1WTE0R1V2bG5UbDZ6UG1CMXVOaEFvOXVIY3R6dGwrVmdn?=
 =?utf-8?B?REQ1cWZPRkdVeVdwNkltWDFIcGI3VWd5K01MS3V3Rk1JQXJRTk1GU01DNy9r?=
 =?utf-8?B?UGxKM3ZlWlBxQ1pHZzNiUnpmZVNOcDh2ZUFjc1BIY0w3cmE3L2lnS0szdktn?=
 =?utf-8?B?SEVkUVd1cWxMRjJyZk52NmVrdURreGlKbHpyYWdZNDZoVFFXanBONFRMeEww?=
 =?utf-8?B?VzdsTCtBVVFBeGZmb1pUMDJEY01EMkpjVVc0aVNPMmYxRkwvUXA2c0svNmtI?=
 =?utf-8?B?UkJDL1ZZVDB1WGJvRlI2bTgzbzhEQlZONjBhendNcXdGQWhKS0F5a3V4MVBt?=
 =?utf-8?B?NjBKRFRDcC9IanEzNjBBaVJUdWl5TGZSUkt5K3FocjZrbTFmSFhLMHhHOURl?=
 =?utf-8?B?dE1EOERqcnBLdGY3MEZzWTFFeUVaQndNSnRPRjhFOWF5MlY0OW1NMHJmSHZW?=
 =?utf-8?B?UHBYRkpQZllNUDFCUVNoN1p0RFV5YzFxajh3QlJ5TWhCc0ZNeHVCY09zRStl?=
 =?utf-8?B?dmFNUk1SZk80eStYMk52TDhuRm4zTUwrRXNNTEwvdC9vM2p1ZkVCMFMzQmpC?=
 =?utf-8?B?VVRVR0FCdUI3MFdROCs5c0gvRU0xYXdVT3U1TjUycThTR0xiS3FnTVJ3UWV3?=
 =?utf-8?B?Q3hsN1pUV3VkYk8xU2cvTkNFcWoreDBlQjJSZUJpVVB1eVZMMWFBSi9hbHVl?=
 =?utf-8?B?SWlnMDIyQUE1UkRpOGl4QTZFUFo5ZHdTTTNCOWRiRkNpSkxSMStTbEVNbjRz?=
 =?utf-8?B?Wnc0Z25TVENTRGNXN1d0Ykt3RDBLdEZCREIzUktqYzJOZlkwaUw3VDhmUnNM?=
 =?utf-8?B?SmVEVUM3eGh1dVRLVENGVUZTU3NKYlQ2Q09uallVbHk5bVRtNGg4RlZnZG1v?=
 =?utf-8?B?VUxvdmdUN3BEMDFuS3Z5OHBYZ3BsWmF6bFlJZ1JOQyttWFliL3o2Q2t3VW4w?=
 =?utf-8?B?NzFtdGJVR2FPcEdWNW03akxka3I3M29FNGhPbElkQXVYN0duQXpObGVWU2Q1?=
 =?utf-8?B?K295Njlaak5Ldms1S281T0lkSDYzSVJ0WlRFZzZRL0RkZktrTkFvMDVxd0RH?=
 =?utf-8?B?bURZSnBZR3B6TkdQTWtZTXZpRVgvY0gzRHR1ekd1QkZkMTVwWWlvZEtWMy9J?=
 =?utf-8?B?SmF0Rm5oSjBnOEYvZ0s0a2xDaThlY3ZBY1JXYVpmOWMzZE1lcWF3b0Z5UlpC?=
 =?utf-8?B?UWNBOHBIV1RBdHVMc1dZWjBMNWtpUytuT2huUjNrb2NQM3c2VjhTVnF3cm9O?=
 =?utf-8?B?QXpLeDkveTZETHpYRGJzMTB6UEJzVXhHRnBjNUlMMGJrZVFqTUtBS095bGtC?=
 =?utf-8?B?SWo5eXZ6SUdiczZzYk9XM3JpREU0akxRVXlCSEt0U3IyNXVGWVFUdC93V3Vz?=
 =?utf-8?B?Mm1NVzl6U2xQaHQ0blI0K0V3M29MY2I5amRPcC9aNWlqRXdiMmZ5d1dyckw4?=
 =?utf-8?B?eHk1QitUQ2poQzRyNEFVbm1rZ1hqTXl4SUVXRFI1dDNoSmJZVFNLcUJxTEo1?=
 =?utf-8?B?S0hkTWNleXlNOHBOYTgyVWdpNnhjUjZoZWl2VUhqbjd5VE9vdGNKRTV3dW5X?=
 =?utf-8?B?bGlpRE12OXBsY3ZMOG9NUXQ0bkdUOFpwTm12ZE5oUGFhc2k1OHJPaFJFQTdS?=
 =?utf-8?B?UjFCREVFSWhWVzdwZS9IUFFoSUp3eDF4UElPc1lRSWJlZVlYT2Y2aytuQWtr?=
 =?utf-8?Q?OhxUaBlYUxf/f/MGJ/+csmAMWiybr8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:19:51.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a804f9-0ee1-4d18-eba4-08dd4a7d3d59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100

The patchset contains:
Patches #1; #2: Add new field.
Patches #3; #5: Add cosmetic changes - removing spaces, style.
Patches #4; #5; #6; #7 : Introduce systems: new SN428 smart switch
	equipped with DPU for offloading, new 2U systems SN5610 and SN5640,
	new compact system SN2200 OCP rack complained.
Patch #8 - Add documentation.

Vadim Pasternak (9):
  platform_data/mlxreg: Add capability mask fields
  platform/mellanox mlxreg-hotplug: Add support for new flavor of
    capability registers
  platform/mellanox: Rename field to improve code readability
  platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
  platform: mellanox: Introduce support of Nvidia smart switch
  platform: mellanox: Cosmetic changes to improve code style
  platform: mellanox: mlx-platform: Add support for new Nvidia system
  platform: mellanox: nvsw-sn2200: Add support for new system flavour
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |   96 +
 drivers/platform/mellanox/Kconfig             |   12 +
 drivers/platform/mellanox/Makefile            |    1 +
 drivers/platform/mellanox/mlx-platform.c      | 3683 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  619 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   33 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  112 +-
 include/linux/platform_data/mlxreg.h          |    8 +-
 8 files changed, 3488 insertions(+), 1076 deletions(-)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

