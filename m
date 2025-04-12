Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859B54F81
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Apr 2025 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744449562; cv=fail; b=dxzVEVAGhrz2rKIUBjWHjT9Mh5WHwvGein9FCS9BoHAzL2PFkiohN5jo95Ut1l1n76h+LMoCnaUVCn97zB6rG9siEg4/i7erJwUeBNdqzZaHgtgAIJ8o6GYGZPj7HN9G/0yt1sUNru8mu/0TzBo//gvgATNLaHJnzwAW4uAWJFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744449562; c=relaxed/simple;
	bh=+pVKm25cQ7vTIB2THio/cvU/fxCdEEO5ZJxIaqB7jEU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DXCtkEtFwYUfzV1p6YF0xqF1zmdc6Cb+XpIFDS5/lvSu0ruHDfIjT7E68Sz1za3l0Cimd5cBWhNx4spO4Ic09GadAcChIR4MSmPWO49ABpN1iKVN9tm/cI/2Vx7NQJJ6Q97gcBkIzNWAKiZWxMw5nTau0fUj5f2DELy1B2q78zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lOZGpXYu; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lOZGpXYu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=il2h4RPpJ89hPZLU8iXEOWcuIGpBMwLbbnKR/m0/FM8PSMOnsrVnhLrdybQeE4T7n+DY3lmf6C6Og1AgKTWR+Tq18A3bNh+bF1f6cfaqW8Kuta5GCcaXkS2mBBtYUBcCrp+gJi8BlDf9VGk+eTr3FpGBhLTsOHZTdHXPu/CyFo6t1B3BgUFbNz0pBnrtVGuorT1bInUrMlNnEDMelhpHHBOOynC/EVq3G70BrNWUdFQswdV8UdQeBchoey/lJQuBMZcTp4Iq2ytW6JIWG25168aae1RlHt5mLYjMMxK/HyIY0lelw0ijQPFaOrWdaHevCWlk8VOndygK9BljGyXH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qfGEC95iZhSU/6TAkBu1d8EGIyqkNmCB+7THAjYR1k=;
 b=Je6oNkExR4Mhr41a1Qv+4OZzvK6LbhflyNtGUleMuUMwj+0nknvZ5kX+A9CjcghVOYj4Je0RYjKAPCzT58CSnBh4Ggm7q2300BSXpB80ZUn3fsd9DOGWiqAE+91NVw6F478AKwfeQsA4xKkerJg38XmNLy1mCo9hB//gyJudFuL7l4x8JO6yc5A2TXgvzWOpBaO5EjceCb6tmDOojJ6MCP2V154FLFbbEtpaI/Wd1MAACNcCfZBukJ9FTQdG6rKYoGfzj1oN5WHCo1f21Sesjzj029W/l3GycxnmT71LiJv+8AfKZsExppd6efkzm0B16FCrJDS3nlM/ME1mvkPp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qfGEC95iZhSU/6TAkBu1d8EGIyqkNmCB+7THAjYR1k=;
 b=lOZGpXYuaKsl0qUpKIrrg+3E/lepQAGQKCJb/esX6AxrmioqRIzvghTWk6HO+HpPeZxSGAhUCEPvq8ftuPJPot+E25Q/vpJAYgqF8RbBCovbYiVNBfNN2gaOIdSi7VzQXEuGebK8JxlUelfvLq9OlHIY2xYETpKF7Je6d9kncq6ZiS8foknd/YqJx9cZreohIJKcmPXlN82xCP+uPTBhkjZna32VeFt6IEknK39PzZkK9UyDi87BcgfTBhf5rer0ADJF0MDUOVKmUM8i1rtqXx2yxA3tvcL2H5ivmN81r2PXYtmMZ8BZkhmHkELvDKHgMCTsFc2v+nKqDm83JmEF2Q==
Received: from SJ0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:a03:33e::31)
 by DS7PR12MB8346.namprd12.prod.outlook.com (2603:10b6:8:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Sat, 12 Apr
 2025 09:19:17 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::80) by SJ0PR03CA0056.outlook.office365.com
 (2603:10b6:a03:33e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Sat,
 12 Apr 2025 09:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 12 Apr 2025 09:19:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 12 Apr
 2025 02:19:07 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 02:19:05 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v8 0/7] Add support for new systems, amendments
Date: Sat, 12 Apr 2025 12:18:36 +0300
Message-ID: <20250412091843.33943-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|DS7PR12MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b5199d-b586-42a8-fc88-08dd79a31956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjcraGFURWdTWENYTnBuUDVoZFdTcnNiamJLWi93a0JYTjJ1VVYrZmp6Y0Qz?=
 =?utf-8?B?M3cydnRuWEYrTjZBSEJjMitpa0pXV0dvVDdxRGRPbExseis1Smp0RDhBVjNE?=
 =?utf-8?B?Tk42c1FESUlhYXU1NG9oRjlWdjIvYXVXaUJEYjdPcTJxMVJHUHpLaDdQQzA4?=
 =?utf-8?B?RVFSMVNZOEl6YlVJd2VmWXhLLzFKS1BtNVpJVWIvWkExekFUbFVQZGhFUHhp?=
 =?utf-8?B?bklLWG9qSEQ0dFNVSndzbks5ZGp6YzhINzM5ZGVZd0FMTkxyWkpEdG16L2U3?=
 =?utf-8?B?V0p5Y0pYcGxWNnRBQ2ZCUWNia202c3VaR05Cb1VxU0NUTEdzaFFEVW1uNHdo?=
 =?utf-8?B?TjdJSHNaSGQraW9YbFFqUThBQjRlS1JlcWI3dWIrVlNNVk52Mm9vU0FoNmdt?=
 =?utf-8?B?RituZFVsWXV2bk1TRy9jREFpZjhSL3VvZkZZNmJTeElzNUdERFhUOHEzV1do?=
 =?utf-8?B?V2FlTVMxaVdxQ0RIV0NBUXNyY21iWDVZenhHdmVyTTdTVGkvVEJ1NVd6SWpY?=
 =?utf-8?B?Y1dIaC9sZ2VaWlpSWGlicGJPbnJDcklFQlV5ZWhrZmY5K21XNEFYYWtOdFM2?=
 =?utf-8?B?dmQ1U2o2QWdUMVJQb01hYWFraXFwUFpoQ0IvQjMyOThJcytyY0VsSStwa2NP?=
 =?utf-8?B?MHZTTC9DVlR4d04yVG84VXorbkNqbjV5SFQvT05qYVZ3emtkNVFtaVpIdFho?=
 =?utf-8?B?bEhxWDEyYVp5ODdBNFBzV1l3ZzhxQTdrUkw4UjI5V2o0elZrYktIUUQxa1dC?=
 =?utf-8?B?Wnl3SmVpblVObWNqTnZ4TnRLNFJMaXArbkhOTUUvZ3JPNGhLa3lubkd5NnRp?=
 =?utf-8?B?MWFuT1B3Z3dQWWhPdi9HY0wwOHNqUEF1NVBYdE1vaFRMUHA1bld3OFhrNFJx?=
 =?utf-8?B?NTRCSHJ2K3I1UHNtQ3VUZFJIRS85Qk01cmx6Rm5HcVFIWHA5QnBEU2swNFNl?=
 =?utf-8?B?dlVablVzWmlDNUpNbHlVRFdYS0Z5bkVzR1pMb3Uxdjl5MGUwSXpKenpUVElW?=
 =?utf-8?B?L3FiNVpWL1NwSWZoZ1JHMDMxLzFOU0Q1Yi9WN2Z4ei9tRmRPWjh0KzhqNFBj?=
 =?utf-8?B?UEhXbWdIa3ZUZEEwNGhMZWp0VERJdE82N1hTcHIzM2Y5cVJBcDVZVkx1R3dE?=
 =?utf-8?B?dElEU2k0azdJZ0pVTC9tS29CY3Fzc3d0WGlncGNyVThOUmo4V1ZxMXU5bzcv?=
 =?utf-8?B?eGhydzFBcUxpQkNxbWpicUZxTDcyYlZSd3RNME42bGVHR2krQ3BDalcvK2FG?=
 =?utf-8?B?NjhLWENvekZwUG5WcFp1YkRvM2MyWUY4aDhKRFJ4VTlmMTk0S2xFc0lFcnpE?=
 =?utf-8?B?cWJ4dm5xM1hkV1JYdGdSZGlSMURvc3NkZW1HalFiOWZTK2IwNVVTQktZZ25S?=
 =?utf-8?B?cHY2cS8yRVZMTnFla3RWYW1aR2VtS1dxNlZGb1JCQ25BUnVYY2FNOWNVNEZo?=
 =?utf-8?B?bXhaYXdGcEJtUWVVN2w3SFZ6TTV5S0hFandpNUVtYVRIMWJ5elp2WmRmdFFG?=
 =?utf-8?B?VTBDdVRJdit4Tm1wUEZqKzM5TTE4bnExREhlVCtQbnNDaDczbmdTRVpTZzd2?=
 =?utf-8?B?MElCRlloZ2RXSGFCMldzU0RkV05ETVFabnllRGRkeUJ5Qm5pNDFNbExMOWdt?=
 =?utf-8?B?bDVORmgyTTdYNGZLYVF0ZExpNHdUUEVLOVhPUTBpUVJtbkR5L0dmLzZxc1BZ?=
 =?utf-8?B?Q25FWjNKWTZMNXdaZ0g1aFNYN1RTQmkyL0dSdW1mUklzS1lxTWJyS1pkdXJ3?=
 =?utf-8?B?MXZVTzJRaDBHUXNOcWZYU0ZJVXFoOVJTQzJoMTBZeC9jUXQ2ZW5KTkhRbFdF?=
 =?utf-8?B?VjZBYVFPTUpPOXRIZFZIMzB1L29VR3BhZjM2dHp6TG82ZnV5QWJrQWJWRHVs?=
 =?utf-8?B?UVdGSGRXQXZOL2Y3Sk9jUHVvcnpILzNsYkJRYUVkSzdxdHJOdWRJKzQ5UlQ4?=
 =?utf-8?B?VC9JRUpQT1k0NG9TV0EwMWY5cHhBVnF2KzRob3B4N3FMUnJWZjArQmxLcFVv?=
 =?utf-8?B?UWsvdHMySnoycjYzT0xNczMydWlNak9JbXhBQ0RtNEYwM01Qa0lYMEM3V1dU?=
 =?utf-8?Q?hsWGJf?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:19:16.6989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b5199d-b586-42a8-fc88-08dd79a31956
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8346

Patches #1; #4: Add cosmetic changes - removing spaces, style.
Patches #2; #3; #5; #6 : Introduce systems: new SN428 smart switch
	equipped with DPU for offloading, new 2U systems SN5610 and SN5640,
	new compact system SN2200 OCP rack complained.
Patch #7 - Adds documentation.

Vadim Pasternak (7):
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
 drivers/platform/mellanox/mlx-platform.c      | 3640 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  619 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |    8 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  112 +-
 include/linux/platform_data/mlxreg.h          |    4 +-
 8 files changed, 3418 insertions(+), 1074 deletions(-)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

