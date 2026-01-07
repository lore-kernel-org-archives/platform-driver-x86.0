Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013045.outbound.protection.outlook.com [40.93.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4C33ADB9
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795304; cv=fail; b=qHS8NvyreVIWjRVIy96KlTePqiEn3kTRgy/+m16RHXscsnie+QYRd5jO9tmUPm6RzUVp42dU6nY7JLTU0jhfjkoVo4lBEvcfgam7LMHZY2UcIrCZXBDqiyfOSp225M36KqJ1QPhJ+iBZuCb1zuPq21dV/9dE4OC2d5Oewtm9fQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795304; c=relaxed/simple;
	bh=SrCvOMe6bRIVhXcpuMQhZAezTNTLrGaH7vOQluFzsQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NMhzRBM3/i5nMLafnAaYul3PEQr2rWsmV3VVGkwlxhI++/lg1pPrtBk9bOProPe6zVxc0fhd4dAY0p2oNzK31orJb95ZijOZD8EuUJVVAAPg9EuPpEzEzkDMBfumnbjTGaiH1pI/y20AudxratfyBXKoe9HhXhrz4qUBWlsCHbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nes4hOOH; arc=fail smtp.client-ip=40.93.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nes4hOOH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwqbugyrzSAqW6GErRfdVkqohuHjEoIB5ZXVeEcVNlDZa07V5rzPSJXdBM56dAObff7NTLmPhGtwtbcUVG8ZFLvq61n6IkZm/BG6C+SaDLSyuXw36bBixkAkLI0C6NHNAkY63bPiEqx/f7zMeq/dIdEXhcXRdkCtE7NkqzGP12xWAsQ9rEwJALev9CeKRmtfg3D0yZRV9iBx2ZgkH/tPjvW8R0YnHSvLRD+EFSIH9myW0NgIjUYSRRVjbv3XvDcKmO4CQNEG2GdSsjhirRu9SOFXU1gdY3rN5xZY6iVTpI9LM6mKvSc7KkRK39aYAI9CaKZK7oQOyalKU4XV8UeJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urNZSE2yvaxLSGSzgOqTXIq5c8f73QcXHA1Nfgj3aDU=;
 b=We/lzYDaPVfAlwRK3hdv2nsCZgTpvf7ac4r0tJfuw6R8Ecp7KH5vsQSVbVk7yW3NRioJYrV3Znj8NPv92k4zYwNJjnH4c7GbPQL9K9un3J5Uacj5v+gXBf3N5rmnHeWDOrrDEReGsc6pzU4YV4CrRZiy8Vq4WfRR1XgaLhYCxGSStb6Ubui2HuDEMsxG5nbAqNdA6ODxmnIzNoeCD7LCkEAOqNfpM9fgY/8ybPbw6k8ew1kAqdGOJiJlj79cRs0d1IYXJr18z8Q7hF28h9ejV+iA3e0j05XWv/KDiRcSD2HNparhhMmEQRLSN5BBcC1ikZ8XTB41gE8dc/TcT1MUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urNZSE2yvaxLSGSzgOqTXIq5c8f73QcXHA1Nfgj3aDU=;
 b=Nes4hOOHjKNCnpStknafnpARnzsBrg/4ZM3x/xyRmKKqr6MoYa9etT3wz9ToieKo0bXqT4xpgS+GGx6Jzv9GUvC6eqFr1r0TAWU/7B5zKzMpl+j80eJCh5Q7+jJpJywWw67vX0YL24TFXxNHhXIWLEFIEsPQix5MxbqL3Nv45YRxLKHmZzhHEAeImn9VDSN/Knwh1WOKjmZsxzoqANPzvIbeRUZm/GsT1B1XlM+DQUxc38+ai10UPyfUl261fjVJCkQ35t4vdAHJVtoDLH469zljPdaziBBXYfunHXqUg+VZ3TbmCAT69Ztlz2zF/a5OQXk29A+F8CCqEiDYBKL1IA==
Received: from CH0PR03CA0095.namprd03.prod.outlook.com (2603:10b6:610:cd::10)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:14:59 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::e1) by CH0PR03CA0095.outlook.office365.com
 (2603:10b6:610:cd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:14:59 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:14:40 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:14:39 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:14:38 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH 0/2] Introduce new Nvidia systems
Date: Wed, 7 Jan 2026 16:14:14 +0200
Message-ID: <20260107141417.913935-1-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c043afc-8cfe-4691-0aaa-08de4df72424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kei0HFAsdEc8IawP0mRGVLPd+dzNbfXhMyMEfL1gHuzcpBBNRhpSGFx6zsPs?=
 =?us-ascii?Q?I6YOXyJcagpfUo/jU3Hnb6ewHIdxYxKnUWjrVI9Z8VDSh5zjLle9Kt0FT2tf?=
 =?us-ascii?Q?M+E06foVlhDn5KSOTFv7FnusicZpxEjRz6jchMzWD00OXJLl8QWg3B4E1BSr?=
 =?us-ascii?Q?AJctHsMLCwg3PhHHhFVyGorD46aJt9G/ekm+cJfZlIwH/Ulx6Umo9iXv6EKk?=
 =?us-ascii?Q?NG1U4g1BpelmmbvWSiWJm243c3HQAMuAP4q43hW9uyZQruUVsPBy0miSid+i?=
 =?us-ascii?Q?KvsPoPB3+BIXbXoBJQpaeFfSQW0Ox8o0BpRYOD3w3E7WYNVeADld9a7EI9ob?=
 =?us-ascii?Q?k/Mpk37YtE60MSToRzhm5zRN6+jGk2anwzpHA5fISkDXxk91iUKcH9DW4CGM?=
 =?us-ascii?Q?mdhlmUA98RuzlRZZp+vOVFsSSOnZ2d4NiTdcmq8kv8YWWAdMPNAZY699ME/4?=
 =?us-ascii?Q?7RFBuOaFWHWGzY4Ur3K51XOp+gALpovIbJCiHihC8FGcfB/0inNVymJwehR0?=
 =?us-ascii?Q?vIwRQpZ2hR+OgcTgOl/5Gcs+Df8Samn1YFi1BndlInnHEHiSudUz/q4vC2Z8?=
 =?us-ascii?Q?DHkp2AdlHyZY4LJUTe8agdk9rWYMzGWd6J+/nIfn0YSioV2gRJCOA6CuZwoq?=
 =?us-ascii?Q?GuLqyIfdA8CZBankrQWJOR3JQ2gmMWJN65XwwlcZYwzts7lfZxDUHCI07UrO?=
 =?us-ascii?Q?SaZb2jAZSMknBTNcN66iWqWYm1WBDPVcCw7QvWa3pwsAdbbY+qt3Z1nUumSL?=
 =?us-ascii?Q?W6WfcxbX8HTosBXksXDWPuhiWPoANkAmng1Fjv42zEL0Og6A8eutSjp29vtx?=
 =?us-ascii?Q?GKX9m28g2mV/YadewYZ5oPFiRQnxtfpmCrueneqrrpwqkBLudWCRrBvqECaf?=
 =?us-ascii?Q?A3KjGic64vl+U+PQ0wZAmz9rJQt2YnV52/1zSODEO+1UTo2dnR6NirB9wK8n?=
 =?us-ascii?Q?gcl6G0TFWUpZdkhUFvuDXIwtuzZgglyovfa0Xp6oR3u564AdmFQkGmfWerRB?=
 =?us-ascii?Q?E+4U75SAnqfnuYa7ybNzY5Gkz/Xg0Hdt6meE+1bgHubLkKBBejskLHBGUSAi?=
 =?us-ascii?Q?JYXsoC9L24s5e5pTGTNTLjJGUphF1Rr185sa+YKe41q7vo5rcjM/pNZ2KazU?=
 =?us-ascii?Q?OUPSbw9TvE1y8QeX2TKKAm+X8OD/f/OzjO6e0chCkvqxc6OWaLzdoLNQhKYp?=
 =?us-ascii?Q?eMKMSCscKm0Ms6oSL+qj0ZUAI6+2FT6WlRUIF3NzE442BqPxNziJKUM+d5p1?=
 =?us-ascii?Q?bzvUHWbT7nyyH7r+xenazj4Cv3L6dmqHkBQAwFpnLbvg10Hi6TvgRPr0Hd9s?=
 =?us-ascii?Q?GFOCZ4xj9EyfrdxBcTZOoVuEL+YNxRDi2rPeGTeWk3UG1i4Uu5E/hjdijZ+j?=
 =?us-ascii?Q?qRGP1WAWGYHc4uUZdUbGEL04aEUV6w0r7BAqeNULHOjEjCvW9Cgfgptes8ez?=
 =?us-ascii?Q?Ah52QCWU0NORpsAIwWC7F0e0wJH7S3Az/g/IrHMC9MRGLWjseIOL8eiMA2OM?=
 =?us-ascii?Q?rXQBn2uTkLRbu67aUako02nh4/OImvt6ldqrjDbAh1x+2Hq9eWLji5bkGu/h?=
 =?us-ascii?Q?pIMZ1a/KiaTudeYqTuY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:14:59.0282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c043afc-8cfe-4691-0aaa-08de4df72424
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

Introduce new Nvidia systems:
  platform: mellanox: mlx-platform: Add support for new Nvidia DGX
    system based on class VMOD0010
  platform: mellanox: mlx-platform: Add support DGX flavor of
    next-generation 800GB/s ethernet switch.

-- 
2.47.3

