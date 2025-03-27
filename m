Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3531586C8
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093574; cv=fail; b=o22+X//MUepglBDNdg+kGJIFixjsVp35mHwCHZRRzQ4wlM+C6zIySe5YtE9B8LOXI/qrZxzMEN9eBBW6ILNpcYEOTjwSkOOOkdNZn4Mbej5x0Y0ZtvR2pF9WYNAhw90ALueNaNw9V+1QDa3+vP1bsXHsjWCwnL1r8IeMm5lners=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093574; c=relaxed/simple;
	bh=emd2ABLMOMDDHGMIO0JfTKYD4ynA9FKgKohJHJi/YMU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HxMdM0qU4D9NCzHyBwueiwnH/SVHEIDrBLSK/8lvAo1R6RIRXG/+m2fGByyjtRx7lIRuNQAmOPNU1+6z9CHzq1Nw7rSqyWIxDGPLxvVqmYb7deHDJGgVOMAAIh4DdKbAvMGPM/ueqlFrsTA3WzOWXtXiCj4m9X0NfrBASywx2lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hr7pXAv4; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hr7pXAv4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBXqY5UkgdA797d2wJCHkGL18zHmumIm87/M9OAfmbNiDrA28mqhaq0AkAL6tTqtT73taST4ZR0sJ0bH7Qt/cjN1LyabV5uP0XOzIoSXvSRI6geJdiILU5/0i0Bk3tLUlLL17JdQdsHkOx4tDzV1rH72taMSph3XC8Hyd9VMHLAgq0umf3pbltFD2imYtUfkZ18RF06ay39Zy2gqQbIMLHgcQ7c8+LStt76aTd+uxRV9O3zgO1BN6Kc2UwgmfWyxP5PcyqeWL0dGfD2iKyczzfWJprXnHt5ebgPH4X6PErK9/jAE3Jw/W0MNTv/NIc6HuUIF27VTxgDdnf/I+pCwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgchAJQQtlzBcpXd3rE8skmifyR1eIVfTUse3lzzLSU=;
 b=kzZd3rRxcFYW0PPNZYAMcgKc8dQLla1oBYhFT3UQh3O5m4eqwPQEM0gCoPeOLx9EqHaKuv+SoJv08nhh5Z7XPMM7osmi+ilmHIxqg1Zrq2x9WzMkagHC4I//zljN+HnMr35yxOnTR8xAwlJ4VVbc83R++CFTNMtlX/0dqasxqWmXxL3B1CKNBkXx1dxVNj18as1D1fWAmlKIXOHf2HwdX6dhxSfHyGI0+vV05KREirU+nqqk4GHpp2nSET2+69ePumKex8ZUcJ02hjEPNz78TZ8gf9ZcZLso8+O7cRlTS+LiW+g9/+Bmzqg1F0yCTz8grTjGhqmas95Wb3SJECu9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgchAJQQtlzBcpXd3rE8skmifyR1eIVfTUse3lzzLSU=;
 b=hr7pXAv4XdIatMbmSj5WdOS9gytouHcjL4D1EaEj5gVKN3PoOnFrXZFMyDnlqNoalFH8b6IORQjQUGiWLSiJpt7MDRzZJgIRcMmKEAEEV4kAphaGc2mU55cbCp9e/UjLJVJF32UKjpipW7irYx5Z43S69OX1eiUJDCeS6WUsykExGS/X0g3QmUDPLnasLrJnqmFOiB03KuBQIe0PK3TiPeFdF9TDg+mZ0PzO+QBtg7Ewejg4gt7AcIFytgNG4xJ9hucoRUeRarbLT5nXnHuTlK6lAlacyesoAcnr4QGtte/BFNDgUo5+lFr28IHz9sw63jqy39/9qqt4lnvafzkt+Q==
Received: from CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49) by
 SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:39:28 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::d0) by CH2PR05CA0036.outlook.office365.com
 (2603:10b6:610::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 16:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 16:39:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Mar
 2025 09:39:21 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:39:19 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v7 0/8] Add support for new systems, amendments
Date: Thu, 27 Mar 2025 18:38:47 +0200
Message-ID: <20250327163855.48294-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3813ed-0539-45b1-037a-08dd6d4df13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjhlZzFEb0hFZjUwckVHdnVkSHZWbmkveWNuZGE0bWdWRUNXb0xXZDdWVkt1?=
 =?utf-8?B?c2ZGV3dSWFUrN2JKRWJuL1BXYTFibGs1QmJRdkZmVUZVNHVvUFlTRzVxaTZS?=
 =?utf-8?B?K1lCUTNYdnJrazdvREtXZ2hMT0hUY21DdkNxOWtJOXBWa0RyQStUUEZmZnBo?=
 =?utf-8?B?NjVZdXFrK2JGbDZaV0Q4aDM3NE9od3B1Y3lpekpBdTZXVUZ0UFhycUpISFdw?=
 =?utf-8?B?SDZTMjFwUG94RnFkYXNVb09tSCtMWTV1K20xYlR4QkNlMGQwdExYaW12RUpH?=
 =?utf-8?B?NVJJd3Y4WWJmSkR0YktweEx2NWtVQk1PRzlYRmU2bGFtSzNLT29MMFMvVW9Y?=
 =?utf-8?B?c1lxUWM1cXpNTStEc1ZJb2RVTEE5M0dKUGdHYmNoRmRvWnJiZjJvcGpGRERF?=
 =?utf-8?B?RjFFK3pzNFl5NHhMdEZ0aTZ0c25qeDRmSGhOcTdKR1h1ZThjZlpQYjRjcitQ?=
 =?utf-8?B?aDhNcTkwVWZOMVJtanBOSXZEVWZ1SFlmU2ZLUjRYNDFDZ25rdlJhK216MVRL?=
 =?utf-8?B?YjlBQmNHZ1FYNGNheEt1b2pUTEM3dW1laVBxdUZqUVY0RHNENTJ6OEdHMXZh?=
 =?utf-8?B?U3JIbGRuTm1lcnRlQ1RIamdGYk1Kcko4WkFrSys5MlNoRy9jNERtK0FGb2Mx?=
 =?utf-8?B?YW9ad3E2ZldsMnRqa3RyUVQwd0RydmR4TklISnZORElyM3RyZDQ3SiszNm5y?=
 =?utf-8?B?S3pSN1pSK3R6OHlaSEkvYlFGU1p2T1JUbjRnUWE1M0RBczk3OFJMMCtyTW1l?=
 =?utf-8?B?b29Ob000L05KS0s2aTIraEt3eXp2Y0VnVVJ6bm5MSXhtRGM5c1pGYkhLak5s?=
 =?utf-8?B?UjlKOGtvZzFDVWRIbm5wdTV0VEVPNlMwWXhtdnVFdVR4YmdSRlVXQXo5aDEw?=
 =?utf-8?B?TXJxMEVIa2FaTmNucWhPWXo4TGdic3FmdllSUlByODZFY2RGZkhNSk5ZSlIv?=
 =?utf-8?B?eDNScmVDS3d1bG1lejlPYzZ2VjFvVThYYWlGRXFNc2M0aDVBUG9qeGpuWkU1?=
 =?utf-8?B?QytOSFlZdlBES2MzRmtpcHpBcmlhOHdHZzNzNlp1WWhoZm15TEhKSTNYeTdR?=
 =?utf-8?B?RUwwTUZRRThJSUlTV2Frblh4UXhDcmdIb3NpVVR3N2dtWnB0TG15Yi9JSEdB?=
 =?utf-8?B?djJFZ01SbnprbGphNWxOeGRMWE1lVXlTOXRBOVlVTStMczZGUWRmSHNmd1NC?=
 =?utf-8?B?MmhMUGRBWXYvQTZOZDBCSG13NjVIc2NXTnRGclN5ZkZHSnphUnkyZ0hOTkVV?=
 =?utf-8?B?THNGbjFhdStkY0s5QklCbHdWb1cxaHFuNjhKb0dhb3ZMMVJsUjhjYmtIb0dP?=
 =?utf-8?B?ZmpVL2xURHp0c0xtUWVVYjk0NXhWa3duTXlMNEhyTGhDcVBCNkJXVUtyUTFW?=
 =?utf-8?B?UXRmd29jMHZ4Vnk4MnozeGI2aDZEVE5oZWZGdTROK0xNb0ZZTHNFYUx0OGpz?=
 =?utf-8?B?Q0RGNk9hUDZyWEJOM09PdmJXOVFNV2MyNjJvWGpwTWJVZzNTQkF2ZEtNQlE0?=
 =?utf-8?B?ZGY5allmaDNnS1M5b1o5MUM3TmlkTksxaGJaaVErOFJrbUpsU3BIVTlXb3Ry?=
 =?utf-8?B?S2JtK0QyZDBlRUh2MC9TR2tLU0kyTWJienM2VnNUUHNNR1JKNWdQZk9Zck5J?=
 =?utf-8?B?c28xZHgyQWZHc3J2RnRsQUFWT0NhSU80aDNkVTA1YkcrdFk4ejNmY2duRWE1?=
 =?utf-8?B?Wi9lZWdlaHVHQTIzeEh5UURpL0owVjZHTzVCT3RaYnQ3ZHhVdU9Qb2RURk80?=
 =?utf-8?B?a0FhZE92T3BzeFJ4K1NDeW9nSnRveWxwYWdrNlR6TlNyL3ZGVmt4QUVQWVdo?=
 =?utf-8?B?MCs4VnAzc2JEWnUzTnEwQUQ0eXVSeUROMFdiVXMxMTFJL0lsQms2N3lha2x2?=
 =?utf-8?B?TjdmU25Ya3YzMU9Ca21nTXlaQ1ducGlQV29GUDQrTXFRdWJlaUs5OUtFTjk0?=
 =?utf-8?B?WE1mYU52SWRUanNSenFUSmw0VVJuVlNLd2dMbm50WnNmVXVjb0VrM3liYmh3?=
 =?utf-8?B?MmkvdXNSM01tSUo1cmsyTzRwVnlMY2d2SlpFa0ZHS1hPbitBd2VoQnIwMXVa?=
 =?utf-8?Q?6csLUB?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:39:28.2470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3813ed-0539-45b1-037a-08dd6d4df13b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597

The patchset contains:
Patche #1: Adds support for capability field.
Patches #2; #5: Add cosmetic changes - removing spaces, style.
Patches #3; #4; #6; #7 : Introduce systems: new SN428 smart switch
	equipped with DPU for offloading, new 2U systems SN5610 and SN5640,
	new compact system SN2200 OCP rack complained.
Patch #8 - Adds documentation.

Vadim Pasternak (8):
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
 drivers/platform/mellanox/mlx-platform.c      | 3640 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  619 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   37 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  112 +-
 include/linux/platform_data/mlxreg.h          |    4 +-
 8 files changed, 3444 insertions(+), 1077 deletions(-)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

