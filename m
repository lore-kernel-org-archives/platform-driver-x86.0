Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF532E36E6
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690679; cv=fail; b=fbjwM1f+yQXl1I/0LXLIg6cHT2Xrz7ppvomAAWTSQs23n85Kww7ddPY/wou3OMmcpQKf5IezMvPfJ4DED0dhK+SnLrozTMSnlatDVmPm/mCVUTVTCx/8bjyy9c5PzKexIijMi2UjzC1dBxMifZCcy2WViieV9OZCP5W0301Kdp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690679; c=relaxed/simple;
	bh=1ev/wlmuboGeCCA+fv6n0tjnMwc5tjH7zV18CtRNcZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JpglC8DF+vflBG9Iv8yY8/XBAdenbCq7t6aWOwRcrfDnEwuAX1llaTNLWjpvyg0frv31yMmr0IgNzBBzuEO+2q7+suDMlF5IvhCQz52LhY+RV4BBRbGDXPTQmsr2yhtV1TvvSG2XL7NiNFaPXgJv/3tSvDoRQOCVBM0rUk9Lryg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mO+ww6RA; arc=fail smtp.client-ip=40.107.95.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mO+ww6RA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a34Ut1TbrvO2eejLPMGZwmEK/UyVBRSauGC1dFD66Hj0WlszGU0RmVwWmccmkH8FjQqTw+w75MM7p196KsWPdwxdTlRPzVoU6e7TQRuClNINNrka1xSynG0hvZxjzD7y5rYz6xoJnDJ6FAgHoXRj1mLKhfUxBdDm7AKW4uOGvYddaDWgvV/ScUxpFxdxH7ynnsGQY1S6YU4MODMU+aunmOcXZNTyGgQb75MkHFtrrLsM8RW9EvGz3PMLnlfTw/E2zJDIMt3t6F/5FPJ1a493mfxiiQj3nc/f0Gyohune+fVZauVJ0rmxptpi9kQj0GdsuXG+Kf2jdRP80CAoQBicJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShUx9T4AvQY1rMWEM2hjpvgmCd7wgeC/wKNvUW82s1M=;
 b=bbP7qs32isIL8/IInbE+MDUKya+pwa9Ph4u8Dy/F6kVn2wGye61pRYQHP3V/qHYqwvT9K8z+9yb+SAf4SuvJkxh206HATKxxOOdtYfsM7Yn62ntHpty7xXCqoeFD0//zl8Z5bdxT87go2lckrn08r39RaBhLirzDJb+ZdhNQoO1vHM57RTU6NWqswfvUOHoiWahgLP3odLl961qefDCCKSbI9efja81D53/RPB531A1IoReiTBxVlL2nL4VoGJEn+LR7BaTnizSL9nCgKmFCJCPmpJ9KYG2zwSooMQOr93JmcA3BeKkfUw1jCy0IgcEctlivutFbQFBjBZBDtzmo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShUx9T4AvQY1rMWEM2hjpvgmCd7wgeC/wKNvUW82s1M=;
 b=mO+ww6RA0F7yqA4Fmii1DXNtML8b2DEJgNIUXuOLnKjagVwoGJYdck+WsTJlccwzBbZ/B/s3HgC01VWC0oegqSK75BwFUPqlOainB0M8AzpmW7aUIgTahETSER2Bx/mks52mGNFPglPy7puIx9GiASNWTRJ8WMaie9a47mmXc70=
Received: from BN9P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::34)
 by SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 11:51:14 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::ff) by BN9P221CA0019.outlook.office365.com
 (2603:10b6:408:10a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 11:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:13 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:11 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/9] Enhancements to PMF Driver for Improved Custom BIOS Input Handling
Date: Wed, 20 Aug 2025 17:20:02 +0530
Message-ID: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SN7PR12MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 995b2810-0b5f-46b3-c96b-08dddfdfdd36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qGgEIGOJOgioWtENhjB8FVDu1AxqTZpV3zRlkYdC5AbrvZcRlDnpx54edktb?=
 =?us-ascii?Q?Q57dJdyDBWszD2sx6Znc7anq3opFCoyAMyqASScaC+bUPOGkm01R4UrtJg9x?=
 =?us-ascii?Q?pYhd6S3uShPON6TAsc+MVap3PvOUdVAVDnr0P2fyZDzOlpbBPpTSwVLs6vRr?=
 =?us-ascii?Q?pVlBWHRVtCsKtp9XHB/yzWWjwCJ9ySOjRE1ePjc+NGVx2CtYJ3qtwSCK1J4i?=
 =?us-ascii?Q?aZiTO7yxT4v3ccARu+BohzichePVR2lya9LXWf99IPQCPoTviaK65s/0Tv+F?=
 =?us-ascii?Q?7ZkT55cUiMmsmN4xH+4Cr/CLw41jK2do5JPdWSuwjG5uiOm2lEbC034xZ8lD?=
 =?us-ascii?Q?thyC4X6eynzEqXh/Jg9QQrphRHOwXujY5NCsqy0tU+Njuw4aGI3VtkQbt7pw?=
 =?us-ascii?Q?JpUEmibACErhiZkRR/95HKaXVoJDdCLvpVNFIZZjyFupp24yO0qHIpzHQMuy?=
 =?us-ascii?Q?Q23gRIl0WWC6iF0Iz/1j5hg0UFXZKHE4PLtnbxCSdCnxtclbgTcjv9Fb+46t?=
 =?us-ascii?Q?DJ2zYTP7LyABoNSr5cHbWL4Tl4p0mc1g25TK3cLe1Y3GZIVsnL/oDEHMv5Fy?=
 =?us-ascii?Q?5zIXOHpg0iHbRwR6pymWNLakA5giwimvePtZokWCZqZi5hNGIda1U3fsrmKo?=
 =?us-ascii?Q?uU0+AVcjsySLOhZgobN7VPr0wmXGJ5qWgi+xmjBa1FQPAs03yb6YYt1gDclO?=
 =?us-ascii?Q?rZ6mrgRMx2tHYlg72DbEXqxoR4Di6e5rdGwD14lb67qZhBIyqC7pgcJhE884?=
 =?us-ascii?Q?axpLRWVDG/Dm8ixOY7b9/ImELQ31pE5rCGzg19igOPvvwVsdIaqH9BSC8fiJ?=
 =?us-ascii?Q?4Ge9p84ekW9S3qVdMg5s74ZF58qb5hMMlbYenrv4/VKEtiu9C5POsIokQ60H?=
 =?us-ascii?Q?nPpbozg1QUVqyEJ8HWbPRbX49V5Dkyl3Q5xdpVBRgOJtTkLP3LQpjt4Hmr8g?=
 =?us-ascii?Q?KRHOwiZX8wt3UJZdqxXa9iifKByiJRc507ca7bwIYxfRd0hbV3Xo55XIZEsQ?=
 =?us-ascii?Q?OjCQULLqcl6mKljeZgYR0lG6N4ZuWjivi4RadWIAFvXA5vZHAJkyjTG5Jgfh?=
 =?us-ascii?Q?y3sicd0HciqT3tGDpk8icB3vWviybYNY0WuhDe9sYZcsGRjLppIKx8hGhPap?=
 =?us-ascii?Q?geHw4NQ9AjIKUMTMbMyJ7iUwwCqh6CesdfIPRrp3aE4J3qBPTkfxJFvCwm5l?=
 =?us-ascii?Q?4tii03jToJAWVxYAUMEGPxGcqeBrR4TmV7FwTSzP7PcvbtXa5JKUjrxDJBEH?=
 =?us-ascii?Q?MptRcQDv1DZ0wqPdlkYC3cPY6ghQ1EuAt8cpLXXU8+rEF8JshX99AJmyIwAJ?=
 =?us-ascii?Q?N0fYcI0PUyHs6gUqOfCwCo3uXZzsBSm+Mn7Pyyhd06IdVKu84/XQYak0sMcr?=
 =?us-ascii?Q?ml8RNFS2DqAB7jco/+aBlIdgv3Ms3NAtbTQAPUhtmO2q8oNAQDoS8lHaVaCE?=
 =?us-ascii?Q?kPS4oIkpvV5x7jZOnxxF08m6lZOdkTlETVTDgrw/C/zn1MubA5foANxHvKsp?=
 =?us-ascii?Q?uRDh2uZ/gVHjbs7jm6pchT3TErEbSgW6Lm1q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:13.8104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 995b2810-0b5f-46b3-c96b-08dddfdfdd36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770

This patch series includes the following changes to the PMF driver:

- Implement support for modifying PMF PPT and PPT APU thresholds
- Enable custom BIOS input support for AMD_CPU_ID_PS
- Add the is_apmf_bios_input_notifications_supported() helper function
- Correct the handling mechanism for custom BIOS inputs
- Maintain a record of past custom BIOS inputs
- Process early custom BIOS inputs
- Initiate enact() earlier to address the initial custom BIOS input


Changes based on review-ilpo-next with tip
'commit 30359c239ba8 ("platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms")'

v4:
-----
- Rephrase commit messages
- Simply the code with loop + helper functions
- rename variable names for consistency

v3:
-----
- Add amd_pmf_set_ta_custom_bios_input() and amd_pmf_get_ta_custom_bios_input() to simply handling
- Address other remarks by Ilpo on v2.

v2:
-----
- Use array to store the BIOS inputs instead of individual variables
- Remove additional spaces
- Replace GEN_MASK() with a meaningful macro
- Merge patch6 and 7 into a single one
- add amd_pmf_handle_early_preq() common routine for early pending request

Shyam Sundar S K (9):
  platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU
    thresholds
  platform/x86/amd/pmf: Fix the custom bios input handling mechanism
  platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
  platform/x86/amd/pmf: Update ta_pmf_action structure member
  platform/x86/amd/pmf: Add helper to verify BIOS input notifications
    are enable/disable
  platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
  platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the
    policies
  platform/x86/amd/pmf: Call enact function sooner to process early
    pending requests
  platform/x86/amd/pmf: Add debug logs for pending requests and custom
    BIOS inputs

 drivers/platform/x86/amd/pmf/acpi.c   | 62 ++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/pmf.h    | 76 ++++++++++++++++++++++----
 drivers/platform/x86/amd/pmf/spc.c    | 77 ++++++++++++++++++++++-----
 drivers/platform/x86/amd/pmf/tee-if.c | 22 +++++++-
 4 files changed, 213 insertions(+), 24 deletions(-)

-- 
2.34.1

