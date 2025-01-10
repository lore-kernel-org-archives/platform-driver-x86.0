Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BB20E330
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516753; cv=fail; b=kd4BJxDSG8B5ZSkvCq2bYArhrxJVEUALpkh4y44nYH/1JoKNy9V0VL30EUxQUm8vk/jU8FvPuPSgOWJteUauYu9IuF3JbREZxEnzpaFX1kTXFpuwOsCu+FKPP7SowqPcxsCkZB9V2AeHFVBPUxdfMGHROk2eevixb7VwCC00Unk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516753; c=relaxed/simple;
	bh=ije9sqx73VFxDD+Rwteuoet8D7+IRzzPh00fpYH4mD8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g4t8bpdqHpXGPzKYbwI/vKJMWrcWZ9bwu3uO8IZnVFVolEjM1jEMr0qzRxJQt+N8ttQudTytN0uTY3FGxEIfy8dDAY7ISb0gMHW7MY3sL5s5HfOAD8FLz4onezRvzuk5LDxT30u+HM2SJ5qM9+v64XwHMiQOAa36w2eGn/RXP0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YjTLOXMc; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YjTLOXMc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywbIBf2JcdLtXsfzI5XDR3XG7X1jo4NebXWGD6dEsamMwBHFCTqdv12DKlMw82XD17u9PitumZ78WRjdehhdhBeCjVKvvd0iXQLP+9yXqoNCBVVOOuKtV1tXDocmKjkIQ/wkwX7l5r2bz/p8lHlRz6YzOMdcZOs76fm1AaYKlri54JMiVpSCQhItCFlI7goKUeOkxCsRPtvzhvUL2TEYCTRKvcY9Q1kAcv+DrAY6D3V5mnYKKQC/RN9PwCWEObRBZLluCTWMhe2tC33vBo0+ZDjnt2luEf1I8NlEZASFa7+GoO5+vX7VtryTa9ScYtsksRdp8ciCXALwoF2bm+Zicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kDmyVjGRHqRBv9PWFxKoNbbmR/vDT4U7XALvXNWtwY=;
 b=mh9PrRRU+oXj6xOl0rd7haGHoMPW/SqZ6xr5XIQRRaAA1ea2q6mA/l95Au92Q9n+NQY0IHH+iTDjBi4NGU1PNWfsZZXKqT1qcFnkumHN9Zxuth2Cj6Yv7kZu8h9/4yFfJ0PrDwYlDoExrrxKE8Ynktx5foTx2gMswRgNJYFMa6Xh6zI2hLAOxBfwKMePfV4zdfHlvm7TjoaNG4XTZmltLjIZ1RijwRVfwa52YBLIizJ2jclMamgj7oIcXXv5CK8UBZwLZH4URpEc/enNOJfrncn3KEBFIiH+hSwuPkFq1uprNQuH1YAed7i0hW0ROVB7RIK9tXWbzaTIEwVUkP09Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kDmyVjGRHqRBv9PWFxKoNbbmR/vDT4U7XALvXNWtwY=;
 b=YjTLOXMcLoRHjf2Ol4i+ct9/WbMTAdfgDZej+Gw02BMidcvFDAoedjDOIdtgpAeaQjRLsktq5/wjN/ePvz96kFR+nUT+g94TTIIK/CNqVPDf3Eug/7moDfRQb0zEOW88tRqySNmxVtXfrSq2/bvK3HVuYgpstsCB65wZyJj7Q1uGeTK7z4OMkjPk4bBKHHxv3ABON8Pvld++p36vWf/o5ElbbvEI5aNXWjcEtf360iz6WllJ63FRr7S/k6tDIC1ppkgGPGKukoKGwQX66F6Mdb8ymlnDvOyIOzLYfOQ4Idi2Gtb9PUPxnUSlWgyr1y2oY17a437Hp8tHn/fQiP7Aaw==
Received: from SA1PR05CA0001.namprd05.prod.outlook.com (2603:10b6:806:2d2::6)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 13:45:48 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::f6) by SA1PR05CA0001.outlook.office365.com
 (2603:10b6:806:2d2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.5 via Frontend Transport; Fri,
 10 Jan 2025 13:45:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:45:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:45:38 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:45:36 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 00/11] platform/mellanox: Add support for new systems, amendments, relocate mlx-platform module
Date: Fri, 10 Jan 2025 15:44:58 +0200
Message-ID: <20250110134515.8164-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a69ed3a-9dbe-4a40-7f8c-08dd317d16c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm1xMFY4Y3ZBalFsaDRzN2IyUHUzdEphdVRPcEVaeVVWVFVQVU5SeVlaMHVi?=
 =?utf-8?B?ODQ4MmdYc09IT0pMb0htZ21vSGlOZXNPTHBySTRiOUZzUmJINVFMZUZuODdn?=
 =?utf-8?B?dmNIOTBiZ0xNL1phd0laR3ZLMEJHZytUUHpYelU3eWkvL2pwQ3BJejhSOENw?=
 =?utf-8?B?N2lvYlZMMzg0TGJZYWhFYXErK3pGcVQ1QmtuSnUrbnlrZVlFZS9yWVVuNjc2?=
 =?utf-8?B?Nm5ha2N5eE03Y3VIZnkrUG9TbGFnZkdtbzRRVDlLdUJETzY3aFpGazlSV1lh?=
 =?utf-8?B?Vk55Vk9QVXRoMkdoQnhMd0o5eEVjVHk0Z0IvZkFLLzJ5aXk2UDdCUDc5YmRI?=
 =?utf-8?B?NVFSMjJnd0RBbEZrNytkUC9meUtVaTNSQ3FER1p0bWgxbVJhL2MyTTNwR3VJ?=
 =?utf-8?B?MUhyelRYK2h3bGxtTnVqanJmODgvS20xK2xJd2xKUXVuOEttYXBmaXBFNW80?=
 =?utf-8?B?bk4wbDBTZHpCOWppV1JucFJyOWNJRDh2Q3hoQ0N6dXd3OWhXVGVkcUZGU1NR?=
 =?utf-8?B?cldBN3N4U3ZkWmdseDBDTFcwb3RVUGFwWUhQZmRNWHdXTHN0WmpNVUF2V2hh?=
 =?utf-8?B?djJTMEVCblA1UmxoMHRpSE0zbzVZZ1F1aVZ2QlQrYUJlRk8xZXJ4OEFoZ2FC?=
 =?utf-8?B?SHpReUIxdnhpMUZpNHFNZGZWRHR3YUlVZFJZeVVTN1V5bHI3ajdHcXh0N01G?=
 =?utf-8?B?eW5DVFI1WVQvVTNVdm5KQkt1azc5S1dWQzhtalpQbTE2TWhqT2g4UVJ2Y1Zz?=
 =?utf-8?B?ZUk1TVVpTk9WRU9WVVZWc2VsZnhab2xqeXJodGN5U2x0bWhrSkZOTlF3azl3?=
 =?utf-8?B?cWNFYlRSUDV1WENZTTN4QnZzMGZjdDNGRStWNVAwZTduSG9KSnJQSmNzWXpi?=
 =?utf-8?B?dnR1QnN3MXRnOFJNa3oxSklFeDhhNEVWb2RJSDNxMXE5RUxjWVBIVFdDYUlF?=
 =?utf-8?B?MzlVWmhDZzhtWlNTVFppVFNhKzFsOFlRZVB4anhoNUdaZHdMV2ZFbldzNmsw?=
 =?utf-8?B?RmtMVFZTWXlaVmZDbU5RaXBGZnFWL3BPbU1XUFNLUERlRFVISXJENTVHcGQ5?=
 =?utf-8?B?cDdJK2F2UUxBTFh6SFdWMmJMSzdxK2xnTmdLdTg5bnB0RzZRZkNpc1NPSnFl?=
 =?utf-8?B?ZkR5NFUxTVFrVE0vR2xFZE9IT3Y2RzRhL2cvWE92dWo0L3crMlBzSHBuMFZv?=
 =?utf-8?B?NnJwc0h6WFBmT3ZMODJZRThsV3pKVzdOYm0xNkxQTVkycjAzSjgzWGM0dlR2?=
 =?utf-8?B?TWpoMmJ5aVc2SmFDZzY5ZXNyMlVDd3g5LzFkMmpPaVVlRjhKaTY0d3d1S2tU?=
 =?utf-8?B?WE90YkdxNDJJcEdudjBOUWRtV1pvWk5mQTdybjhmMWFmU0JqeEMvdHVzbVpw?=
 =?utf-8?B?SXZwQ3ZaYXRxSzkxYUpYdEpGeFhkTXViZ1hSeEo0c2d5VitES3ZGcThwOGVU?=
 =?utf-8?B?QzE3RjJPYWh1S3JJai9GdVlJVVIzVGVLRXhsL0ZKMDY1RUFrckw5SjBiMUFh?=
 =?utf-8?B?bHdDZTQrOFVLZWVZSW9ISlVpV3d5RkpOOER0TmFtMk1leUY0TTdxLzh5SVBr?=
 =?utf-8?B?dy90M2JwbDVCVStJTGJOdVBlRzBybHVJOW91bllNcXQ2MTg4MVZFSVlReVhh?=
 =?utf-8?B?WDRucm5DUG1PVkl2cDE3RHQ4bnJmaEZma3diTi9YcUlleU80NkpsRStNQU4w?=
 =?utf-8?B?L3lTVndlOVhwTmd1dWxRT3B1RWFlZFR4TXFOTVBScWxKS3oyTGZ3VGpGRG42?=
 =?utf-8?B?VXNSdEpXc3kzamkzdjVQUmFZTWVNcTR0QThScXpKQUNYY1NsYTErSzlvbjBM?=
 =?utf-8?B?UkZwWVk4L21hVVJBQjJ4Vmh6VldnNWd1aWtwNGMrNEVudGxlNEs0OXNxd2pQ?=
 =?utf-8?B?djBrZXpvSWllTnh6K1JXZmFmK1ZmL2NhUUZwU1FWSUlQWFVGWG5UUnhSN05R?=
 =?utf-8?B?WE5aYm40OGdTQzNDcEpoNzBsc0UzNFlqdjk0ZXhldVpNRklBSGlBUjB3RE9K?=
 =?utf-8?Q?saZqGC8V5PyvtEPvR0AFlvelEKtJ3w=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:45:47.7788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a69ed3a-9dbe-4a40-7f8c-08dd317d16c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597

The patchset contains:
Patch #1: Relocation mlx-platform driver.
Patch #2: Add cosmetic changes - removing spaces.
Patch #3: Repurposing of one register.
Patches #4 - #5: Add new field.
Patches #6- #9: Introduce systems: new SN428 smart switch equipped with
	DPU for offloading, new 2U systems SN5610 and SN5640, new compact
	system SN2200 OCP rack complained.
Patch #10 - Add documentation.
Patch #11 - Modify MAINTANER list after relocation of mlx-platform.

Vadim Pasternak (11):
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
  MAINTAINERS: Remove MELLANOX PLATFORM DRIVER item

 .../ABI/stable/sysfs-driver-mlxreg-io         |   96 +
 MAINTAINERS                                   |    7 +-
 drivers/platform/mellanox/Kconfig             |   25 +
 drivers/platform/mellanox/Makefile            |    2 +
 .../platform/{x86 => mellanox}/mlx-platform.c | 3665 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  622 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   23 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  110 +-
 drivers/platform/x86/Kconfig                  |   13 -
 drivers/platform/x86/Makefile                 |    1 -
 include/linux/platform_data/mlxreg.h          |    8 +
 11 files changed, 3490 insertions(+), 1082 deletions(-)
 rename drivers/platform/{x86 => mellanox}/mlx-platform.c (81%)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

