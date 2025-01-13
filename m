Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604A2343D8
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757856; cv=fail; b=Zw7I9wSb5WCF/4q+SM/O0pi0e4uXRrVqwCFKDhf51nm8ywKE2P8sZ9mnvst9DypczPcAaMDQjblUjtq50cuJ/LPWI7yUtGXEU3xvPA4WKb7TkoGMB5FuKi+Dw1FX90BZX+Q8wp1GmswRwvfvVhFq7qTjFAUiRTPpGj6X1/plxb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757856; c=relaxed/simple;
	bh=SaQRsHuJjHojBonYDDhFwqLbQHqepDdyBvAWPatz/TQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DLk97DlVnSCl9aqiEoAQwDYtSN8g3HrzeHHCh3ANq/yHirl7jGzin7qeNUlTepxvvOZt4s8XrJj/1e5xsiwvNo5v2+k8Gk2vmNms2eFX1ubEfyANIMqiPJZE1Yxk8znhlEtJTlaM7a/aABfkZDYPc9FtYlouoeek2zuiDFbQSn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YjbjRPKf; arc=fail smtp.client-ip=40.107.220.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YjbjRPKf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J96RByw5yIuo5SisM1j1wfg1DtfMgIENzcxGrvfoHlZni0LgN3AmrCsKhUFOZEqYj8BUsTKcGUDVQdL1qwTgYubsysKnChMkpIPaWFlo/obZtYjZCcPapvsEH1Et8FVJXJe7yeivHUSTv8Np3I423I1hRZOugsTRX7zTMC2SueIBTGoRrV2CmH4QiIOBsOM7xj8IL9EB5J2asJPlmnzZ6Awchof3gcAQaoNcf7M3UBzNQ2lxztON9IrFjkPnH4G128vvIv7cNWsxmnuLihS/CCdk+BYjUuTByb7/ZjvYW3Ud6hyI55vWVpAgVJWQ+3DOOwm6aEoH3Fxn3f8RzE7DNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sHf5jxivzUDzf13+P8JBGoiBdC23i1iWiNLxoFKDjA=;
 b=jsc+ECmtdHtZ52BIWgedKMwCRV2t7kA0mE9dER76zHTNgRCIfeDCBJX6d94lQvH1LFa3CoNx6ApxKblto/eeT1taKfxyfclIvOQTPwivqrYj4fQLu2aSbxLgnnH+cl8I0DzkRR3WfwkJacRaCo31fcV6IH7FcJ/nOJ7LSHOVAJ0MQxDx+tF88W6h9kBh095znOGABTTJa9f4lOIbmhS4DqczoArFRjk+an+/ocTvVRcgAcC6LaTWMsi/67BFX+/wiMki/1tREmdodRW2gqKyHVuB5OLj3IYTyPbehvCLfcT/fkaC5NBepE+YYYn1kpIXus3x0seJEHXBPPvqnrgmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sHf5jxivzUDzf13+P8JBGoiBdC23i1iWiNLxoFKDjA=;
 b=YjbjRPKfkmKiJpLjDL90DREyZ9WHpmFcBoiHzpHNT/wFrDkZKDHdntwHN21Oyi7/XGTCwlRVJ+CijMOIF4FLyCG5jkPmQd6NCI/ZUhNm47cHGN+5psaQPqNDzBSnSre0z8qkbkepCBpEPXcdTNPnVfykV4Hr0KE1L9xcFKTvOS5V5nc4qoX7RzmWet9r/AYrD+SMLjymJdX8KuWKJj2EsqLr9vY0xXncF6kFeZrRFElqIKB5+i82ehpwKT7IGE2srMBesg7LoncYIH/Ha+h1VPEl7quUo6HX/1MWEkKVOxBIYSnWAxPBtJ79Vhpz16p9OJMkLCGEc/qt4Z4kIO8O2g==
Received: from CH5P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::10)
 by SJ2PR12MB8954.namprd12.prod.outlook.com (2603:10b6:a03:541::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 08:44:10 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::a) by CH5P222CA0021.outlook.office365.com
 (2603:10b6:610:1ee::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:44:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:43:58 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:43:55 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 00/10] platform/mellanox: Add support for new systems, amendments, relocate mlx-platform module
Date: Mon, 13 Jan 2025 10:43:22 +0200
Message-ID: <20250113084337.24763-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|SJ2PR12MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: f766d708-32ad-42df-2401-08dd33ae72f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUFIN3lkdmRJT3FrbUFTdjJ2TVc1QndORms5RkliYTJpZVJCZTVXa2dnL2tn?=
 =?utf-8?B?aGNtM0FZMW90SXpwVWJrRkNMYmRBUFEzcTZsNkQ3MEc2elVGVU55V0N3VHVS?=
 =?utf-8?B?YXlDNGU4NDB2OEp2eGd0TDNtT1BVWWJTR091d1RzL05HUkRQMS9Uc1hQcUxk?=
 =?utf-8?B?eWYxdWVIdloreG5FcEl1Rk01bG55cFlnQlVxRGNkVERvQml4NndGODdHWm1W?=
 =?utf-8?B?NWpXNTNLVWgybWVkOEk4VWQ0R3BPQUpSb2pYM1YzMWQ3ZjhPYTJya0xnY1U0?=
 =?utf-8?B?RGV6SjZ2TUFwR3l0SlRJMitWVlVDdVdTM2RXbmFlY3Vka1dha1I3VXE2Rlcz?=
 =?utf-8?B?akNXZE8yMTNhS1czRG40eitXSldDNzdaMkZpOXgwNUZ6T3M4Y09LdUg0Tkor?=
 =?utf-8?B?aFlINDFqSitFa0cxNFJOWUM0SXZpb1h3ejFrSUlNVS9kbVNnOGdPTCtZdzJU?=
 =?utf-8?B?U0k3WUtGc2l2VGRFRzVDMXBMVkxRVFRwUUNpUzVOc0VNcE9iM2poQUpFWHVz?=
 =?utf-8?B?VGNublQvMUVZOVdBUUtBeGlqd2dieFo1cVNOaGh4WTJXQkJwS3h2RmlDUldG?=
 =?utf-8?B?VjNZbElDcGVpTWFWTjlic2pWaXJtaTN2MkZlcVd3OXdZRWNQRzhoWDJVTE5X?=
 =?utf-8?B?dVkrUGJ0a01CLzYxSHYzc2l5cU9GcTlKblN6SStMVDgvakZFZVpmS2FEeFVX?=
 =?utf-8?B?YjZwczhCYXNMeGlsZVZ6dXM3MmFrZFV2R3NMZU0zdnFaUHhkbFJPc3FCNkNw?=
 =?utf-8?B?YWFOMDJqN3dOd3ZJTzRaTmpxS0NJSHVsVW13dElqcGszeWsvd3pCTEhGV1RU?=
 =?utf-8?B?cm9ITVpIMHpYWkpvTjRuc0tVeFJYak1LS0JPMFQ1WW5XZTdReG5YNm9VVkVr?=
 =?utf-8?B?MmUwOUtkaTQxNGkrbnpJWUJEV1k3V2E2ZFBsenBGMUJDekJxOFlqS3Z5dGd0?=
 =?utf-8?B?d3I2NjNGNVBCSncweDFhREVjMUpyOGkwcjcyVHhUTHRWclhnTEY3S08zTnNs?=
 =?utf-8?B?OEJUV3Fzc09hQWFLazZ6UFdCbkVpR1BnbXpCb0Fmb255WGlIeGhnRGpJMmpG?=
 =?utf-8?B?UWpLbkR0KzJEUGNzeE9CUUVXdTR5Nnl0NmVxbStqdEJUNTl3NXBLN2krR2Nh?=
 =?utf-8?B?dng0djIzcnloTytjV2ZXYnh4N1N2Y3dDemlvZEROZXZKTXB6ekZzZ0U5VEZM?=
 =?utf-8?B?OEdDYnVZYWVQc3hjb1ZMaW1UUHNUL0RjOVdISjNNK3N2dGhsWko3SU5YazVG?=
 =?utf-8?B?a05LTU9QcXBoNDhLSVczZ2pjYWJ3bmJmalFxeHpjWUhBa3NTMkNlK0VnaUFU?=
 =?utf-8?B?bHlBVGJsak1EZDVIU0psOEplMTFCM0tpcStwNlNRaXMrbkg2RkFBNm5RanUw?=
 =?utf-8?B?Z0MxcFFYZ1lTZ29TeVZ3ajV1REx4V3Vudkh2b1dJT2tlVG9sY1RjRGJjNm0y?=
 =?utf-8?B?UDJPa2k5S0ZRMWZXRFJDNldGdGhIblhYRGlrQllBWVZLaE85dlJNa2dyNW1U?=
 =?utf-8?B?bEJRcGhxQ0RMVWRvME9mZ20zNG5iTHcxT0EyUHRJRUFJeElycjJ6clFMOW5l?=
 =?utf-8?B?OUh6b1EzSVZzVGVsYTZZcjI4YllNK0pXYnNDSnVIY1htcGVGUmxiemhzMDZO?=
 =?utf-8?B?eFI5eFM4Z2NLRXJQdHVML2dGdm8rQkxubm53b2pobjh4WmEybm9vR3VGb3lZ?=
 =?utf-8?B?M3VINzAxN3QwYXdMMDNuY2pkV1RmQlBFR29DdVdNU3lTNDFkekgybDNxVHNS?=
 =?utf-8?B?WGp0S2Q1SVJMQi9sdDliOVNVQ3JJYlRTdGJrQUNlczNCdWFLeFVPL3R0bU9V?=
 =?utf-8?B?eGRFM2x3a1JzeHJ1VTlTOWRFS2dTZXFjN1RHa09UcnY5QVdrQVBTc0thekto?=
 =?utf-8?B?UFVrQk5ENzZNUmhtSkpNZFdGWHhIcXhVWlg4SWVkb0MzVXVzbjhkaGNWQ3dz?=
 =?utf-8?B?SDFyT0RyRWNKM29WOEZmNDVVaHAwcFJLSnZld3ZNbDRqbUlySXhVZmVkN21O?=
 =?utf-8?B?dGR1Qi90RHJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:44:10.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f766d708-32ad-42df-2401-08dd33ae72f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8954

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

v0->v2:
 Comments pointed out by Krzysztof:
 - Merge changes of MAINTANERS to the 1-st patch.
 - Change order between SoB and RB.


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

