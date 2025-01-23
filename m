Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855F61ADC90
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659343; cv=fail; b=lm013bm6cOZ0u75hEH3TBGgbRJNGc5UnluzG4+A23xtBJVtv9YoQmQbNxJzdZDyqNg+WXXejoxCg298CfTQXXR9DPcl5RGrdtptP+rX1uWwkKXfq8ZSEcoMgVKHrOvn3eCz4sA66tAdDcfY16nsKcBs0joqXMvXaq0XQfH08Bp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659343; c=relaxed/simple;
	bh=ZrLSjTUQzTAyFDnXVnVE+5ZifctxG0COs4BVnuLybq0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hiXQfRNrW4yKaBqHCtMouh6+BGTaC+io9A+qdgjRmRwScmWuJbuDg9K8ayZ8BsjFCqdNOYG4pSbQRB6jv5QFvsRd5nzoDuLDdDQqkyvh69IuK7Q0VKDUCsFCjliS1Hr/nmjaNyCpWZH+d+RYg9mr/oFl1SERGjSu9e8px78+hoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HU4mJPx5; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HU4mJPx5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkqT+379vYca+4Jx+iwxNI/C69m2zcBgWcSoR4MGkz255lQPfL67R5q+SBwveVmU4NCV5Dx50C+x+4m5vkBGCWXlPbMcZ6vlayxdUDMxKGqXWhBxsXY1edv6HS5UOTHhcg4foPApRcAEtcRJ29EsrbyI/d04aBf/VMRnTYaj7hD124RfT6Rw+UHa/nQZANUsLoI2rDby3Gz4BKPTfCdXAKnfSx5VHJsM+DrrL9SfoHy6kGgLKxoLnSvWEiSqRylBDYyrpF81KkKcnXZRKud7TlRYoa2ST9PkW6VXBFZBJ8jE9VsNyLUJWXjVFENfxuZP1FrTW4nk1qMLgPJBFHz8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8izV0uUoQKnZf2Edwhq+wrSYF4oBU2jRJQZLGtY8Ntc=;
 b=B7wgwk8WuM7GL+8qm8/xnJZnc1vq3H1+RQ4F+wbQriYUQcxRrQzPQpq028L3A7XDDMFk3xMLTbgH/IkoVIOpFv9k/Q08Vu9JrxP1bg5UJqiFjjOm4qTOxTOtFsd0Tq1GLtbUV6yrgyNvahVns5TNiAmMXCE6k22vfLuL/w1Ll+su8pzSub47T+yf6259LAkwJx6rq3ey/X+SFntfnq4Jw2Xzr9Q9eWf/NN4g3cYmI3YiAWKy6lRBq3NQz0FmnigONqSMp2zhHqYiJXSYXqfGb7pSqUbPUB9RD2AGekLW+5Sr2xv84HRRz/jXPpLT3Qb5b4IEjjCrLrG/1KsYJGrHFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8izV0uUoQKnZf2Edwhq+wrSYF4oBU2jRJQZLGtY8Ntc=;
 b=HU4mJPx5j6j5j6RzoKNQNb6SJzbATINLAjZKKikrpxgQTQ2D6hm/TWpHL0Tc+b6vEldGBM7tu91Bj6jDWOfW8xea4iS3LptM3qeJSE6A1wSzqE6MHorugIftNozaCKstgTyOjO3xTN732Kk0DDNBhxSMnJ1WQZ7xzUb05Iqve89aYMgxzt/uvPcgn9741aJi4fVoBFOY9lncetx9nuI4WUOKWTCn6vUZQEQ0DaDzL4XDyS1dloTyr2i2F5pPGX/sse0q8LhGyX0+gTiqRhjHoXGBplfPacwjLDYFrjc2p05mJWc8C2DO0E1pViscNrjp8yny7u9eQSNK+QKvhnj0jw==
Received: from BN9PR03CA0655.namprd03.prod.outlook.com (2603:10b6:408:13b::30)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 19:08:57 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::ef) by BN9PR03CA0655.outlook.office365.com
 (2603:10b6:408:13b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Thu,
 23 Jan 2025 19:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:08:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:08:38 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:08:36 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 00/12] platform/mellanox: Add support for new systems, amendments, relocate mlx-platform module
Date: Thu, 23 Jan 2025 21:08:04 +0200
Message-ID: <20250123190818.3834-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: d27b67b5-e8f4-4be6-a860-08dd3be16270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2lSSTVhdXNNRUErY3dQMDNqN0FXWUpVVVdPTFBPM3dEQUVweGxlVzFtRlFr?=
 =?utf-8?B?UERkd2hmM0s1Y2pTeGpqZnIwenNBaVVUbEhiNzdsTGZxNHdNTUNCUXNkTFIv?=
 =?utf-8?B?ZEN2ZXdIemppNVkvbXNKSHN1SkZDMEQybWtnOG5iQTA4bk44TjNveFZ2ai90?=
 =?utf-8?B?c1hCTWNzcVBqTzdHa0o5anZXV0JDendUeUFhMEd0aEI5ZzJaZ2xXc1padnBw?=
 =?utf-8?B?aWlWcHRDaTdmMFgrQW80QVBFWXRqdzE1UnA1SWtjYnpyY1Z0a1VDQVBKRE05?=
 =?utf-8?B?ODJvclZXMHpUM0JGZE43TG9CTG4yUEpqK0U0dFVHYzN3V2pTbWVnZUoxUU1t?=
 =?utf-8?B?UWlFS1gzZHFoa0hzb1lCWms5UzVEWSszMkZpS3ZtZk9wc3VZOHJOSUVERGZQ?=
 =?utf-8?B?eDJNM1VJU05HZEVYaVFOQUxrS0E5TkRoMElCL2IxMjVBQXNhZStIUDNmVEtN?=
 =?utf-8?B?NVNNYjJYWWhCU0xqSTlCc3FGeXc0OGdBY3ZiZXBzOCs2WGVIZWxZazVFMG9L?=
 =?utf-8?B?Y2U0dERleDYwa21uM3R1cHZKek53UWpsZVhpUU9yekFab2xyd1R6NUZyekVM?=
 =?utf-8?B?dlM1dk8vMmZJQ0ZnMlZsdjUrVTI3dGd6dVFKSFB3TzdiQTRBOGRQR1BicndE?=
 =?utf-8?B?QkE0cVVXdW02ZThCQlR0TFJvcnVqZHR3VUk0N0NZWkQxNHlscHd0eWZwZEl3?=
 =?utf-8?B?Z3JHTjNGQ1RsKzlRQzQ3Sjdxa3ZsUjBBUy8vNGtOQWFnQmhqNGdjYjFzS21u?=
 =?utf-8?B?dUJFQ0VZS21FbEt0YkZoTUZ6TmQ1Y2d4WnRtdmZ1Yy84cVd3WTdQZXVkWXBk?=
 =?utf-8?B?Zk9Za0RxTlZ6L29JQy8rWFpGeGJGandzR3gyckova1VFdlRBeU1rSDNOYXl1?=
 =?utf-8?B?NXU4MC8wbjlJdWdqb2dZRVpaM3k2dVdPLytyRHdheXdCbitsSkFONHYzMk5y?=
 =?utf-8?B?YjBjVFVjV3BkbGx2TnlYeEE1ZGM5ZVBBa2pYdi90bFVhRDNKeFdVS3M3bWxG?=
 =?utf-8?B?WEN0MUg2NlBIQkIwOFo2WkVRMkpBNU5KejluVDdJdVJsMzAzWmpQcGU0SFlQ?=
 =?utf-8?B?VjRMYVlrTDU3TEZrYm02cVQ4MWJRaUhoajcwb0VNRUxDWUEySjNqeFE3MWo4?=
 =?utf-8?B?MWZIYkJXVlI3TWkrbW1WdFhyRitOOUx0TXBmOEZwOEV1K21ma0hreFJDMDha?=
 =?utf-8?B?eDNDb0dyZ0ZLaUlHbnJ1TDEvWkhVZmVzZlcyeUNwSit3dDR2bk9QeFlKR3Rl?=
 =?utf-8?B?OCtpd2I4VU8yNjZMY0tDQWVSekZzUGw0TnhKQkV1QkZqcVVJbVR2K29jZVU5?=
 =?utf-8?B?L1dvRFRTSldkS05QUWVIa2ZhbUFVZEg4Tk5uRkZZUm92K0VOT0N5YkpleERn?=
 =?utf-8?B?TUJIZ3pmSG80YlhicjVyQ0hIYlpyMDBhaUtIZUZReThhVXV2RFovb3N2NFdT?=
 =?utf-8?B?eFVSTldVNG1CeUZqZnBUYVVjUHg2MDlyd1JIVGlFVWxzaGlkT3dQUGxXcW9F?=
 =?utf-8?B?OVlUUzc0bUp4Z1lZZHZPaFZwZkJyeXZlSkdaQmxvcncvMW5vSE1FN09QMUF1?=
 =?utf-8?B?WjI0Q0lKdkoyQ1g3M3U1RWtLbkZqVHRUNmxIWkdBQ2czbXhNaXNUUHNjeFR5?=
 =?utf-8?B?dEVFdHJEbFRHZC9pNkkrQUtIRlREaFJsNjhPV1drREtIQmVUem9OVEtJeHFl?=
 =?utf-8?B?aGFlWVQvV2duNkJhbldEQXMyUndoRnlHNFNXRHpUdmo5cExGZUx4Ykx0N1ZK?=
 =?utf-8?B?M0RzNVJBQnk4KythdDR4eFBpSVYzcTl3MGovMzlLcU1ETm1nY3lhZ0FFUGZB?=
 =?utf-8?B?NGRJcWJDNHBqSkptWkpSSWtUSE01ek9odksvRzZ0NWJndzlPYm1oU3M4V2h3?=
 =?utf-8?B?a3YzMnU2b1UrYnhJdW5Fbzhsa1cxT3djZTB6czBzSGlzbkRtZjF4b3lUSis2?=
 =?utf-8?B?WUd5Wk9QQklENURtTFRKL0RvV0FpbkRPQVdiMHdlMlh2S3ZMK2FhVFhDbEdX?=
 =?utf-8?B?d1dZUmlXUXdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:08:55.9365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d27b67b5-e8f4-4be6-a860-08dd3be16270
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290

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
 .../platform/{x86 => mellanox}/mlx-platform.c | 3769 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  619 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   30 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  118 +-
 drivers/platform/x86/Kconfig                  |   13 -
 drivers/platform/x86/Makefile                 |    1 -
 include/linux/platform_data/mlxreg.h          |   12 +-
 11 files changed, 3550 insertions(+), 1142 deletions(-)
 rename drivers/platform/{x86 => mellanox}/mlx-platform.c (80%)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

