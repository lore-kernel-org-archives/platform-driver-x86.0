Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF65223DF6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 05:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001674; cv=fail; b=KN/FLgeJ7tQsiBEXmCRy3C0AmJAlCyLUFD2sFqZnzND181l5vY4x3HZRZbRftKcVjK2XkjXcJvfF2S0K20w1WINAFny/KWZzCAz9tF2PCo1FCoBjpfIZKIQ7/pv9PwZfapJxOjFeTFXUwPRXq94mBLAXHqnmRqILcQhORxctVwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001674; c=relaxed/simple;
	bh=6Eu3qbMtK4VkE60PevYcJfhvJUmRGE3uELePE7hb1rs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNSXrODooyYI+z1lMgPE6hXaKeqSeBeDcqThdwuTieVnjND++mWkE5vMBiS9ITI6nzsmUER/oIn1wCuzHou0+VAlvXkek+27ixRTNjPf72cyZXFuPTNuVvQIwKYqXkTA2vLNldq3RASGvSZ2w1rKkWdmBdzd54hbxeNmxbD6MB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mu2G/h2L; arc=fail smtp.client-ip=52.101.46.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mu2G/h2L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtbpcv+Ev4+Iqmd869HS3t0QcWKMRv4LX5UmIDjE9odaNu05M8kyHnSK9jZZy96ktiwnlM8qNDVtsmRT8FU4w+ZuJZEN+8Dbsj0TO/rhO+Vfqa4WV8kNyqbmM2ORCyLPq7MmlBAMV7ZujctBHg9CnELSXL/nlo0ijUWkqe8VbgKuzDPGN8A0zD1SiaBObdsJnfHtxsg+lDlTotbAx7YXnPFhmxLPohk/yDYG9AtaTCNGUN9hln+NfL6Pn4wLCYgXp3gpMUL/bfO1fLqWLKMNEYt3JLZEgvMHPMol0XCSr9ODAIiWuKtAl8MPFDTuq/kmZF6gxm7Vm9IvnomTHFE3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qc/69g42tBGdptjZaegG+hgtuIeop199GehqalrCxVM=;
 b=iB8eF5+QCiyvo7s1SNckl5E0jdYp4gKUa0ZzPtimsLMTIyKnAQ3CBniNG2aMxkVt1rWHJGYhAl4td7qP7aXf9vn9+zktYLOSZo4OsYcxaX6H+6Hk5gwbdErCh7/I/AMdPqIQdFg6uj+HnWkHfX3kuirWq+VAZAn8TonRptB6rEBmnyczrCYeyZpMMnvH58RhPQIoYtdJiOvyG/w+qJ2L5bSO/5BROFyBf5VqmiA0MGdEQ7ddEKf+L9RZguP7vkYEshmJL+hUH5R3tnt64QvbHTwmLjDKP2aqUl6b2CRF0zaRfk4tgy86bJ2a8JH3zzcizy/00jN9KAtYpAfyGnJ7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qc/69g42tBGdptjZaegG+hgtuIeop199GehqalrCxVM=;
 b=mu2G/h2LH3hNBz7GATacdAQCQuOP097P1bduY7sioG9UlCjA1OZC7SascG/WQta/IFht6G3iSGQ+7mVxiJ1Cjl6dKq0CP/urT43FC8YwFLLsW0sqj7a6b935pxsNbQh6ZR1yPNhu7Zm3r15dKUe7DaxFV6z5pcKu+FuM8mbHTbgQpIMu4GWlMQjFNojVWYvmJPLAI3R/oU5BMDYq6VFG5rz8okP0RHCM8XdxfFNmD/5h+boy2b59+Tysus9WoxokQ6SdRBfeEOx06g7K6v6K4fbo66Zwt4SL/0cD9vHnPvJj6+H2JBJlVrFMJMMofUTFUSNWMK3LhrzNwvTTNdYTVQ==
Received: from CH2PR17CA0030.namprd17.prod.outlook.com (2603:10b6:610:53::40)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 05:47:48 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::31) by CH2PR17CA0030.outlook.office365.com
 (2603:10b6:610:53::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.20 via Frontend Transport; Tue,
 16 Sep 2025 05:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 05:47:48 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:47:37 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:47:37 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 15 Sep 2025 22:47:35 -0700
From: Ciju Rajan K <crajank@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <christophe.jaillet@wanadoo.fr>, <platform-driver-x86@vger.kernel.org>,
	<vadimp@nvidia.com>, Ciju Rajan K <crajank@nvidia.com>
Subject: [PATCH platform-next 0/2] Support for handling interrupt storm
Date: Tue, 16 Sep 2025 08:47:29 +0300
Message-ID: <20250916054731.1412031-1-crajank@nvidia.com>
X-Mailer: git-send-email 2.47.2
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: c71f9719-a20f-406b-1b3d-08ddf4e49170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ghmC5LQp6Hr55o7Jh0nRfnaXpsYYVrKya6oMe0NC/Trr7KY5/bpZHAbZSvT?=
 =?us-ascii?Q?7fMCbdrE/5N0GHWCPK7+/b4vOZr5WmALTHiklFJQIvTFpyMAT1qW4zWZ6iw1?=
 =?us-ascii?Q?Eu7u+5SjvtoPkYqWkP4snqf5iypYW3uI9VC7SsNJuodG+AoPHnfzkCRWavMn?=
 =?us-ascii?Q?ukdc9cYAvXoNCQoGa5mgxo0xJB+nHsNsShQhaoYFU/Q4Mx9Acy2PcGW+4K20?=
 =?us-ascii?Q?XXEKtujvILrv6dyLd9DJgLsFRgLp2b4h497f0Wk9T7ZcEI8GOHUa1qsVgqgl?=
 =?us-ascii?Q?4LrhsdNZP/RO9FoJU1jKBdBbyd6S5I+HLlHsSngwuf5sTZmk21xSMYQ7aF/+?=
 =?us-ascii?Q?2BAc+HBgeA4xiGysaV0piG3AByfDHxwa+2pK5W1gQeM18KTWHNt5OOrSQFp8?=
 =?us-ascii?Q?2D2OU08UzpYEW8wKftIjtvGsNZi8czT0OeGeRgS37dWJv1Z3HcuEnowf8LG2?=
 =?us-ascii?Q?P1WvPRMwm+Wo10U3ITM3CiyztI14PlXlGXP48XH4XsSmxO/1Pi5WNwbyWHI/?=
 =?us-ascii?Q?Ja8x999kjJw1BBYtMxA/kMnNyVt4DLTzQBMT76h9zCpomyt4M3gr+tQYmAH2?=
 =?us-ascii?Q?XotVlNr/jfBZYsOxYH3hjdldSMV53U5mHfRVPo9HeXlGJ7jlSLz2EY1N3Sh9?=
 =?us-ascii?Q?kwpobGyES3dXg/pNyL8hPnA/UAyKAhbS+NJYVqNssa2zFtGO+SxINOe/ukkV?=
 =?us-ascii?Q?T95ZHoDjlBE8aL+ElAD5vA3A/eBL6TfYhQnC8RI7rSkV3Mj/SV/zHSvsHhhC?=
 =?us-ascii?Q?GpUorYwGIAUgqA9IcjSnxBgdFJLmAcbPRV32q6sdGBtxV243g71r24Dj5OhL?=
 =?us-ascii?Q?rG7veQTJ79vHgLGYi2tnJtBUqo4pb1HaRcdljuOZo2uOUZZeOi3CRqqrxSG0?=
 =?us-ascii?Q?xVR00Y5fKvoKOoDpWO8+rrlzu4Lyd0VZznq+pg5mBsGRKyCWmqZVgB/IjY8p?=
 =?us-ascii?Q?/sghcZ6AHDkmrBAh7EOEECtoxgSDrFRcuuIimd4V7MVe8PbFTIFU0yPmnduO?=
 =?us-ascii?Q?yioeKG6LKv4P7IXXzd7ivBU9P4YN6tMEWU9pebhtJV/tIPvMeOcNlUXgxJs1?=
 =?us-ascii?Q?cF2xTkq6ZLqkiuAqMoVhVW5Xvx3shlBbxL5b9b3f58kjP4GJu8buDWTQJQuy?=
 =?us-ascii?Q?8bcJHm1KWKYSHoIQJGr5onLP/5dDsuLVdYGAHjGkW+1a7EBzkP8m7FS9m3no?=
 =?us-ascii?Q?yTACo63J/DMY0Rcv7ndMprYIMPNWMJlrM7NekxPHeCgPiDHbPhQdd2PtHTbC?=
 =?us-ascii?Q?hSBp0qwRG/m8XGUS2mWavuoVqtbhthWMlMYle1hSe3W89bZnQx3GgGcWUmUr?=
 =?us-ascii?Q?jbanndlSeMhY+E6jXlRq9tstO42YjUHS23KmcOy37y0Uu8LtFSybRDZLwtSQ?=
 =?us-ascii?Q?lLIGLBTa8UzqQILqegI8DI11TDk7nHOuT3tc4DTjGmhyx5Eu6vn4TiFuBgyK?=
 =?us-ascii?Q?lP9TuFzZaYBCzH908b0je19259zWZvhcN9zpyq6/0R3Qseg3jwkFZJkEZLAz?=
 =?us-ascii?Q?hvZ2iyXEOSNGizR8ePm6u56yqkp+yMgBVCpM?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 05:47:48.4840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c71f9719-a20f-406b-1b3d-08ddf4e49170
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882

This patcheset contain:
 Patch #1 Add fields for interrupt storm handling
 Patch #2 Add support for handling interrupt storm

 drivers/platform/mellanox/mlxreg-hotplug.c | 35 ++++++++++++++++++++--
 include/linux/platform_data/mlxreg.h       |  8 +++++
 2 files changed, 40 insertions(+), 3 deletions(-)

-- 
2.47.2

