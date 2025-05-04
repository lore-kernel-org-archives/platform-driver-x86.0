Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FEA70807
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 May 2025 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377752; cv=fail; b=nM2bGTEveSoC87c6SySl/XjjIF6AXgvWH3qNIC41k27Mjst3fB+u7gs98mGk3CkCTGvcIMpUC9fagOSoIrf4SaHajYXa8WgJhe6gQsKGIaXpTOEAZvBDG5X6FmePuTEfBM6YEQj5GsW32I8vEfelbTUJdUZAmWlZiZ2ftMxEKxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377752; c=relaxed/simple;
	bh=KDh9Guwcyhbic+vlSxlOdhYMphsTw7b35qLM1KQdqVQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vra6JXuGxCtze7eKU0pozIiBr/CSbA6IygzTH54c4YFjkuGhhggRSr50GgkK7H5OH/VfWLLHEt5yuLu5sCFhko2Mppd7hla2E4w8bWDeQrBTDcufNn5n8CqGUWVMxrkVcEiLWcr/WmoxHaLUjz9j5ii5tTKgf0xadMDLczsBnmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sQMXMAzA; arc=fail smtp.client-ip=40.107.236.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sQMXMAzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEeXYtqXJvJtIlUpQP0PH7GZg7zZhW3DM0NQ1S7Ihp3NB1GY6DcaaLPTP7pfDjZh5rJywe19cWevfHqpTZnDg1T+R68ejF3IbabE0ZFvv0rSNk/yRksaB53EysFANRmjqchXLU9CJrBw7FfNmnDyGw3lqM2X315p4fdIx8VQp4ODRB8Tax+bXdScATAKQCp1kURb28UmFPt3oSuJY2PcQleQgObRgTaTcr/Nln2LMqNJ45WB+SIHSEdZ+bTx38Pj01ZhX7uBiyNWizTBp23K7v4867ruhtaK/LzUat/Z1j8Wcy50ehcS+DU/td/2M2j/rGdEvyjGq7Zzj2yTK2xvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdB2uqMaPQhmgbnXi6qpYOjiIqPdG8kLjmeHkymkbi8=;
 b=s0WwrwlAVV963SfsfVC6o2F3hpEt6xFNAA3l/IzWkpvR6OCrBsRgj++k+tFXuCPkb0v95xDYV3uIOgg/08UHOOYOiFb1qu/7wSnNUluBzLb1GHXvwgRj6fFHOCv8yD4YV5BPNlrRZYZnnKQ/y+iFGYwl4NOaIFwN3DWo0U5PFsIJQyZiZbUQ6+2tGpuFTz9bp9I3cWGlkjFQ6WGKDaC60FkgllmgmPZkwkOnzipKbZwtldjmuwe7TLk9gU9zyULUx/cbctFHZV5H+1SHDlYrnLsoMYigLfq3Tiv4ICF27x6J/AqgFkDhC2FTiEAkoV820NJt8+XvwpNsY+giFgQOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdB2uqMaPQhmgbnXi6qpYOjiIqPdG8kLjmeHkymkbi8=;
 b=sQMXMAzAowEzcUcbylA/beBaoAhaMNgeZCD0/z4PIpEE+fD1W9eIkH3ykgsx1B1CwWMd8KArLaXkIOKYOnOEMks+041vKnP2lhmDn5MYyLHZ5e8E+zPOv71MAF+0VeXLkONea21XAYuiusx2RxTmRq0y2BnKOR8EpfPSDOhnTzeR0sv2vMGGiLjOXepWvQNkW5POGovCzfPRV+ILEecjjCEXysZnAPqLI5yEUHpRY1pkpQtNgqoz0zKNT97XFwxVPXtEJB6hDlk4h3mEDWdQrSGtrQqhvI/n05QufD9xDnRoBOxm0xVpQ4AFcv4jkD1lfmWWrjOVkaXrrhPpyYpRpQ==
Received: from BL1PR13CA0219.namprd13.prod.outlook.com (2603:10b6:208:2bf::14)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Sun, 4 May
 2025 16:55:46 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::e1) by BL1PR13CA0219.outlook.office365.com
 (2603:10b6:208:2bf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.13 via Frontend Transport; Sun,
 4 May 2025 16:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Sun, 4 May 2025 16:55:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 4 May 2025
 09:55:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by drhqmail202.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 4 May
 2025 09:55:30 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 4 May 2025 09:55:27 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <alok.a.tiwari@oracle.com>,
	<platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v11 0/2] Add support for new systems, documentation
Date: Sun, 4 May 2025 19:55:05 +0300
Message-ID: <20250504165507.9003-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef20df8-319e-4a8f-2576-08dd8b2c8392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UfSs8x9hWiH1wW6pGu0YPj494HweKtZBPd+GETqQBdz+qcKuo4M8vTD8M6gC?=
 =?us-ascii?Q?TyQJSlxDt7+8ru5CrJoLnltNWe5GPq/t7AmnkpvFVC97iDBQktROk4RkfKyQ?=
 =?us-ascii?Q?Y0oTI0hRCNWYUs11spmyPX83OfvtdHGT2UcdeD46zFggNlwzVRi5gY2dsxvX?=
 =?us-ascii?Q?8/CTahM0xsh3e7Rjcmx/8OfqgF0fjnR3+YzPxDpo583sPwv650X2j1eJjAkN?=
 =?us-ascii?Q?PGCT1WYsExJz9Ocm4eN1dJgantH+K6cnqcDc7IARIJV7O+ifGRMtXEvgh+s1?=
 =?us-ascii?Q?ITqgd0FYgXKJ+TgCl1yPgB1Dz9hw7yWerDGyCB3I08aPYz1l6CowBt5E+22r?=
 =?us-ascii?Q?YK1rMsLPjRn1xVvHirWJ62o7EjWc5WYF9A0PhETL6kwgAamPCMlljkwULxMM?=
 =?us-ascii?Q?S7y2Xn6wrEhWbQP1THqdak+fbkpJgXht3cpX5d1+oPkq3p3m93yQRU+cXbAr?=
 =?us-ascii?Q?KnNuo6KkzrjnMpNv+sp5oBvNzfb8f3SNtQsiligOpzxzpZTONlueRzQD9XoR?=
 =?us-ascii?Q?Etav+MdsyG0Zzwph7M30p0QrIhShZaiLSGSfR7rFmZ5L/iQ1Igr+u2luXtht?=
 =?us-ascii?Q?imQoTm6dNogooomhMMvAboBSC4QVuilrjKJqibjSe75ZC0GBX5VRrBfOhSCf?=
 =?us-ascii?Q?XqmnK9P4pTYW3YGIeMmCAWQ7CGQ6P4XF+GILtqCq156P8aFFsLMk4Jav16XJ?=
 =?us-ascii?Q?VdSTFqmbG0KxlA0bP+fi1K8UI4JJeUVKDyolQeP6Avaq04zybG4bR6lBZ/I6?=
 =?us-ascii?Q?OhgU76KwIfFd2Qd3pdtep60Vz0rY4fYBHCQkxF1hCZ79CkWr9fn5kiyWRucC?=
 =?us-ascii?Q?Y92/bvACYct1xLf9YrK9nFuakdMMlQLPY757CaArQPAc05sKQJYhvmmBPfGa?=
 =?us-ascii?Q?zEczVNWCCec/YZ01kKJn8DE8TgCwzjgMkanpVRq5SODAi6wEZOTi6uXgO2nU?=
 =?us-ascii?Q?vEhS6B/vZytN2UFWFziH/4kJHQ8pn3uDut7u8isHNvG9o5Ss04rY0LSJ81wz?=
 =?us-ascii?Q?ipkm0EffGYaGRgqOsp6+C8fqRP7hwsJlwrJr1m4tSLbBykktrY9U8j1LRLJd?=
 =?us-ascii?Q?O39i0ar3Aii0oCg4y/NL7Hep7ATFnF9tXH47RFftOijG6xwcOArKOAkg2GGe?=
 =?us-ascii?Q?cxUwDLt96eJKWdA+qTZYzDSGSDiHYzRZHy8DrHK0GSQApx70FKBFm54LfbTJ?=
 =?us-ascii?Q?vcH6Wg4RsmQzBa39rntqeOTk8T5N66Ve4QDRsTWw8dH/3hMSzNW2DNLrJBWy?=
 =?us-ascii?Q?j6R/iNl0VOEpp9f1h1aciI3Nsn0Bf+GMFb9MfooIyRTAuAw4nTeiAuP2czvH?=
 =?us-ascii?Q?xweHj2FL1nI2ZEjXNTwVoEkETkOmoCggAh4WTu6eHBE9p/XpgmgpepxW02wV?=
 =?us-ascii?Q?lcHaVu7JUA2WVUIJkBhiIx+/zdaKBnqFkE52BqarOW0/3MZWvMPKwek+E/1H?=
 =?us-ascii?Q?Xh67EtloU6Yuk0qSAQhkAnZZDiyBW8c58EUoeLU8eWiNkaVHhwTdn3jy4ACa?=
 =?us-ascii?Q?c4LVJBSxQZT3kubED5scqz9IKmFX1oQvUlVP?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 16:55:45.6781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef20df8-319e-4a8f-2576-08dd8b2c8392
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960

Patch #1 - new compact system SN2200 OCP rack complained.
Patch #2 - Adds documentation.

Vadim Pasternak (2):
  platform: mellanox: nvsw-sn2200: Add support for new system flavour
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |  98 ++++++++++++++++
 drivers/platform/mellanox/nvsw-sn2201.c       | 110 +++++++++++++++++-
 2 files changed, 205 insertions(+), 3 deletions(-)

-- 
2.44.0

