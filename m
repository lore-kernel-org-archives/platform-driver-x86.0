Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82B18A6C1
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014401; cv=fail; b=cliybp8uyLmAItsdh69TxLb25L6QzgoPcnk1jmtFAp31tixVQlgXmNZ2uZS2qlclGaOpVedtCCB4H5hU1xbrTQteXfmDwYhzglhMVqhMOtjfwHhaKchnDD7NJcYRNRjOQG/dJhBjz6Kijdv9RJtkgjv0DqbgCX0Ypd3LV5aJ27A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014401; c=relaxed/simple;
	bh=md67oD0gO1JfayBz3tihET+e1mzxivScfHMiXNjUXLk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=akpQSW3eQRQ1mdgRcmoMj24obJ7QTfEyryQNOdzjLY/NO1MIkLkxYiEfadY/I1np1ROyhWerKVhC40k/sK8N7Ef1jGA6aJmTa6hyBfxS4XCfkwwqomTiOJp6l496FTXas/mbea4gOs/4i3+l2Vj9pGN3VhXYkR4ZM10XuZ1uOmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fGdp2Nyk; arc=fail smtp.client-ip=40.107.100.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fGdp2Nyk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aULEjY1ZBRpqfuxoyrr5tduUMLcjX5Q5ShuLdnSd5DwdCNKTgb/7rpbqCc0kwyJUUwJ+YFxX7FEo/v8QIYViCHfOOgFv27ccrUS7uQtWbmEJiHvcJgy6RNc26LoYbN+zWlMMJ9e/axGkvXosClq+tZ7Z46UCBdh3fvTiC5il7NXIkPF5/34oF7MGkKnG91q3fwypsHiXoyITuktjBIwamR2qW3oNJAy8JnFt9DC1dlEpcmFsCSqTpKNbkkoBJcDPrDTEHT6c4sMjRI1LwlxcN1NqYyFKK2eSf5JJydOwsbZsxqYLthCn/TbcdS2HbIRmJ+Gcm05/nPTLHj5EtQP+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROmEHM8iRFVdo2Xo72RNRaY5OHuNBts9ImAnUvdX5XI=;
 b=S+3HYmwk8UnqClwcUg5ljlzWxBj1YVQDIy9p40AC5N9fV2zYoxtomc9RG0sVOuL3jNtMZtu36KGs4rqlkApznQv7YYU+OQXrBk3JAP33c+AduB7SuToPUh5Cd5rzGzsnY9jpon4k0kHVZWbxbYgHTrD9pojRPrKNR1urtj9R7XciWL/i+UWtGWuufpRernIDNYJ6apFZCoKdm+j5QMN3I0v4edbggvynTsXd+SN6oudS4YrQbzKfOoGyfSwaysIVneCQ3VoUm2RcQb77xlixPq3Dm6ONJFzc8cd85YmRCkIREy+8mKe+ubyIDYWhL78N8J8+H6VypU+9WQ5weo2Nvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROmEHM8iRFVdo2Xo72RNRaY5OHuNBts9ImAnUvdX5XI=;
 b=fGdp2NykD1a2AuEdqGTGYw2Ka2xWysGlTzEGPMYRnCClDBK0VooRKr8POr86TXIV2fZ3s/QDc6tAApilf6J/ts3kpnexujswjmRgwbmyPfxvlhxrIuOFnFxYDqxFHswZPn/Xoym9EUt6JQVPXDeIqWxIHeuH1RhL503gYWH2/BSPpz4yz6GQ7AbrO3vseVmfcGUw/lBus5/BE0PibeRndV0//JHerpIMOmwTzGaIVp+QbzWPkR3oydvBSNk0RvuBclu1qIz6tBGRViZhbWh/LcGo2Z9pLwNUtwF+63hktYprsvLXse4ED4opUZ78kQR4r6LE230Z5P9FokRjqH4w5g==
Received: from BL0PR0102CA0050.prod.exchangelabs.com (2603:10b6:208:25::27) by
 SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 07:59:55 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:25:cafe::60) by BL0PR0102CA0050.outlook.office365.com
 (2603:10b6:208:25::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 07:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 07:59:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 15 Jan
 2025 23:59:42 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 15 Jan 2025 23:59:39 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 00/10] platform/mellanox: Add support for new systems, amendments, relocate mlx-platform module
Date: Thu, 16 Jan 2025 09:59:06 +0200
Message-ID: <20250116075919.34270-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 987bed3a-b8fb-44a6-9854-08dd3603c3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ry90YmR2REJtcGtEVzM2Sko1UndaUld1VUZuYlI2OWNmNUI0aHlLVjV2VzB3?=
 =?utf-8?B?WWNzOEtKL3gxTUhIMjh3US9UNGF6S3BFQTNRaHdaL20wL3NPcm5lSHA4RnVl?=
 =?utf-8?B?SWE3UlhMOTRLMEl5M3pRUG5kZWtzdnI4bVlTTmtVekdBWE1QQlFOWjVnUWxC?=
 =?utf-8?B?RS9KZzdtODJDOU5WSnhvT3JiQ0Rlb3Rqb2VMWFJ0em0raUEzdms4QWNkNHp4?=
 =?utf-8?B?VlF5WmhHdUl2MVdaSkxIN1FRUFFnbVFJMEJWK3pmOFU2M3RtaHZTMEIwWU90?=
 =?utf-8?B?WWZsMHUrWUMxK05pUXE2SVVCcFNjQ2xzOHB5dXc5UWxaQ1lhNU9mSS9kUlZz?=
 =?utf-8?B?NlBTUHhycU14ekNFYW92OVZJSDl2cFNyeGdSU2UwUHdJQnhGZHlGelBNUHFy?=
 =?utf-8?B?QUE5UjIxeGl1TXU3eXpteTNyOEozSXp4WmFwRWIxcGRHWGE1anpQbFlrQTAr?=
 =?utf-8?B?SitOR3hsRWZFOTZ5NUdXK1liWW0yVko3ZGxLVDhaVWtwTXVudDk2VXhYb1pJ?=
 =?utf-8?B?Z0lqSVFnWlBtdm1tYXhQOVVtS1Qzekw3RERUUllkSlkyb21zSHdsUW1HSXpk?=
 =?utf-8?B?L0p1RjJWd04xRnZyNSt1NVFzSWdCVWhXTnZROS82VnF4OWNFR0gvNjVNNlFr?=
 =?utf-8?B?MGZETFZGSWZZUGwzZ2xrNWhwOU9URTkzQ1JxenJuT0p1RWU3bk9lTWRJV1JX?=
 =?utf-8?B?Wm1Ub1RIMEpKK0JKUHlQaVEvY2swU3gzTjB1VHAxaC9nZ3ZsWlN3eDdxSGNk?=
 =?utf-8?B?dGZ1d1NsTWNKcFc0UzVmR1hCTWhYaFhYczcxc1Q0V3hHaXdsOUs2cGdwa0tm?=
 =?utf-8?B?VVFpTVo2akZPclN1RHcrL3daVU10TExpMEg1enJCUVpUWWJJOFpjeVZSTFds?=
 =?utf-8?B?TXZOR25EaW5Kd3hHb05aQVJ5Z3o4RjZiYzlmN1g3T3JnbW5zeXdORGdtYTM3?=
 =?utf-8?B?bHQ5a2J2cjVHTk9MYUhLU1p1VGllalpnb2RBTDZCK0oyL1VvNHZ5TWx3QjFq?=
 =?utf-8?B?RzF5Y0NxcFJqdnJKT1UwYWFPZ0V2bFM4MG43U0phbStTK0E0Q1laQVQ5STVh?=
 =?utf-8?B?YVg1OUIxRHdlR3VpWE43c3pCSGt0eStZSlFicGpUenFiKzZzNU9iclNjTmRX?=
 =?utf-8?B?UnE4ZlJJOGJBb3lVZ2lyQ0hPU1ozNGNrT2d1aHFvYUJ4T1dva0svM2s3Q3dq?=
 =?utf-8?B?TXJTenN0ZHpuRWYzdXBFVVdJekcwajhIcmpFbUF1UDdTYVFTOEpNN1ZScnJS?=
 =?utf-8?B?cGxvVDdwMXNFZTJKa1k3VC81bVovZm1McnZ4YllMSHdkNmsyR0IwWHRnUDJs?=
 =?utf-8?B?M1d5czl0c0pwV2FXbkVyQlp0Rk40T1pYQjBTQVBDbGlqUXFsUk5oWnpkUXAx?=
 =?utf-8?B?bGJLcU5JMEUzSzVPTzYxTi9IN0NBZ2EzWTRHY3BxTFN2bnRNVU4yc2hDTmVU?=
 =?utf-8?B?V1RwVzFTZ3A5d1dUN240UG1TY3lKc0ZqaFRjR0VaUjBZU1hkdUhPUCtmT1ZU?=
 =?utf-8?B?VWZnaUdnWjFPUUp2cG41RGxlR0xCUHdiZUZsT3RFeEN4allhajVhVWswY2NP?=
 =?utf-8?B?ckt0T0kzV0pRWXF4MFZZQXo0WVlMRHFsVlJpd2h1aWQ5T25Bc3lQMVR2aTJW?=
 =?utf-8?B?Mkt0eFlCY1Y3N3RWQzE3aUMrcnloV3YwQlUvdGo4S2tJREhhSWFlS1hyM1hE?=
 =?utf-8?B?MUtHaysvMllWUktHb3JSbFpXUGU0SVoySS96WFRCblc4elYySDZmNWlMajJh?=
 =?utf-8?B?U1EyU2V4NTM2bmprbXVRYXV4OHZNaCt0UGV0SVFTVlJueDhDL3p2UG9qWWxa?=
 =?utf-8?B?SmVpU1VvNitINk9CL2lSdzJXMHBjZ2Z1aVFLdCs4UEVTV0dqb29ESzBYYng0?=
 =?utf-8?B?SmhPN0Qxc0RPbC90UHd6d3I5bXVSSXRRRml0NEtjQnRGQitLNURrbjh2TWty?=
 =?utf-8?B?czFQTTgzTGdMazhkY05ORFE3NGNTYjVhbzBhczM4alNMK2JxNlBQS3BXaFox?=
 =?utf-8?B?cm9EQXJXOWJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 07:59:55.2804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 987bed3a-b8fb-44a6-9854-08dd3603c3d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941

The patchset contains:
Patch #1: Relocation mlx-platform driver.
	Change of MAINTANERS list after relocation of mlx-platform.
Patch #2: Add cosmetic changes - removing spaces.
Patch #3: Repurposing of one register.
Patches #4 - #5: Add new field.
Patches #6- #9: Introduce systems: new SN428 smart switch equipped with
	DPU for offloading, new 2U systems SN5610 and SN5640, new compact
	system SN2200 OCP rack complained.
Patch #10 - Add documentation.

Vadim Pasternak (10):
  mellanox: Relocate mlx-platform driver
  platform: mellanox: mlx-platform: Cosmetic changes
  platform: mellanox: mlx-platform: Change register name
  platform_data/mlxreg: Add capability bit and mask fields
  platform/mellanox: mlxreg-hotplug: Add support for new flavor of
    capability registers
  platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
  platform: mellanox: Introduce support of Nvidia smart switch
  platform: mellanox: mlx-platform: Add support for new Nvidia system
  platform: mellanox: nvsw-sn2200: Add support for new system flavour
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

v2->v3:
 Comments pointed out by Ilpo:
 - Added inside pacthes.
v0->v2:
 Comments pointed out by Krzysztof:
 - Merge changes of MAINTANERS to the 1-st patch.
 - Change order between SoB and RB.


Vadim Pasternak (10):
  mellanox: Relocate mlx-platform driver
  platform: mellanox: mlx-platform: Cosmetic changes
  platform: mellanox: mlx-platform: Change register name
  platform_data/mlxreg: Add capability bit and mask fields
  platform/mellanox: mlxreg-hotplug: Add support for new flavor of
    capability registers
  platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
  platform: mellanox: Introduce support of Nvidia smart switch
  platform: mellanox: mlx-platform: Add support for new Nvidia system
  platform: mellanox: nvsw-sn2200: Add support for new system flavour
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |   96 +
 MAINTAINERS                                   |    7 +-
 drivers/platform/mellanox/Kconfig             |   25 +
 drivers/platform/mellanox/Makefile            |    2 +
 .../platform/{x86 => mellanox}/mlx-platform.c | 3665 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  615 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   22 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  110 +-
 drivers/platform/x86/Kconfig                  |   13 -
 drivers/platform/x86/Makefile                 |    1 -
 include/linux/platform_data/mlxreg.h          |    8 +
 11 files changed, 3483 insertions(+), 1081 deletions(-)
 rename drivers/platform/{x86 => mellanox}/mlx-platform.c (81%)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

