Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C6C1E766D
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988256; cv=fail; b=Vx+zKePmLpRWfk/E91b+jRjxo06kVZAc0KAYgJqVlWPHDfY5hVetl/9tATuw4GlG0xfp+9nMFPFOKyhRr0/g7W8Gs4WYMVP5YS/XWV0tWhgp817+IhnSz26fUFg3Ptx7LSUfFd0OFro/LpGpii5IQc0Gnl/3rAj1rBVKS0Bs4XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988256; c=relaxed/simple;
	bh=7mJ3vYPAoZktUeNNSbZcFXsHm0I9Lr7o895d5hxWw1I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d97SjkbxkMe8KdIriCmYyOEgI+kYWgu+FvsA6WuUfNyvaMK8InMWOVvlRbv+2E1PnPgH9RTexsRhxPBv/D3OiBs473tkxuaW7/5IWCOz8otIihmDUT297gzr2JPbPjSdnvkbi/cxEdBhXozlCbERkUULnysX1uvLwiR6o100sDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JlmVE7fo; arc=fail smtp.client-ip=40.107.92.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JlmVE7fo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm2FLPSlUC5AGtMc/xIaNGdHV0Y+F1drWVo3qtnSq9z314PnMHDXbtyODxm1m2x88OckdYFpvToom/QIBvWZ5P0ddh78TQe1kr3fIW4/OFSX7reKMgA1c2EIi8FA5jt/06Ir70/fEf2REKNLx/gOvMGLpu+ViVBurNgo9vlTF2fWMgKeqPe08LPseY7p3qDcTeMxfzyJnNFWC7R7k8DfPJZtUkzOTfIcihePO30XmePIHb0L+wPDf3+ZvfBLBhlTAXyETwGmSvbUliIdsmaejZnq6I68YG7CypRr0KHvdc/vhwILmJL4lwJjRhvAvomR6LmZkU3kXM6seMthVj4MaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZwhr30xqy7SGVVhjxeSTMKEesrJhYhdpzreb7jtcp0=;
 b=wGgrWNVrC8dTU2rDFZRMJOyQy0ZcdhdJkh8pL1vsJEV3E7dSbyHwGNMszoqCj9c7XrDky65FSWkF73+O1aVy+QQ/nyUJBqaV6p5NrSC8RKSDyJ7tCTMXmYyijzsDgw9JzdaDXQB3WDeO4+xMv4N9fqbCl+TyKwP2IhgLuo8xEvldYDOuCeQGEBdRJk+WqgBOjQQL+T27xvP+wFpUJOcHX6UnQ5MDry0NbiAh15/Kgex0cvsUdZ/DdY8Q2F+IQ+J/y57jCg6STu5Pt06urWn3t4dIeZEJXXjCxvYdXfx3YIs5CsLpl7axVO1CpXjggS6HRsGjzTWdwGeZlz5XdWA2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZwhr30xqy7SGVVhjxeSTMKEesrJhYhdpzreb7jtcp0=;
 b=JlmVE7foDMd57YiMpkwnxUheNfi1nc+Z7fpIUFfhN9O3uhNgQk3RAgjInAhpaNmncEnnM2zv3rtCD/M3SaNd6MdrBhLzaOKDbUVNZUC5uq+wq4RJfdwM0FdCCpI7XQk/3l3/PtR4PLkhnRNuvLF+EyuzBn74BvMMKYfetpZ3LKY=
Received: from SN4PR0501CA0071.namprd05.prod.outlook.com
 (2603:10b6:803:41::48) by PH8PR12MB6892.namprd12.prod.outlook.com
 (2603:10b6:510:1bc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 10:30:50 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::ae) by SN4PR0501CA0071.outlook.office365.com
 (2603:10b6:803:41::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Tue, 15 Oct 2024 10:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 10:30:50 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Oct
 2024 05:30:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/5] platform/x86/amd/pmf: Updates to AMD PMF driver
Date: Tue, 15 Oct 2024 16:00:16 +0530
Message-ID: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH8PR12MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be2704e-500d-4f7b-231c-08dced0470a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WAMeNyNBjIoqZDuk7QnhELwRnXuXi7KviLS8LPA5UwW3m0XTjSXOGNmrV/v9?=
 =?us-ascii?Q?vdgwxbpDBwPnkhhIzcpJMKdE5VfYH2Vyhf8KueWURBm3fal6gV1uEyR1SU8y?=
 =?us-ascii?Q?YFM3dzk2PZGG5xDeMFNN/GQ3X9bMMeR8Qjhtxc4KECNAtmlEBvJg0eszrvND?=
 =?us-ascii?Q?GL43J5/QIUpxHK8UeQUhI7M7QhPYX9f2981skKgTnUDNJ/tSfB8tGnhj5CUz?=
 =?us-ascii?Q?7YmjQ7bCHZoRuvn7OqRzDe3o2Z1ignEqk5WFufqfBZq42NFG9X+/+EzO9b+p?=
 =?us-ascii?Q?TQAIqar4fcHmGqxf0Smy3ptXtNZ+YIfFPhN6RUafPeb4sxFJKvwyNtIkd/NI?=
 =?us-ascii?Q?ebYBH7Vt3YGe9Nz88zG9WoHlaYjAFWerBp+qGW9zV5Nurf+mEARTwqnSnHYy?=
 =?us-ascii?Q?Rbn+d1PMlfMMazhdl8PQ2CkeSfDF6MxbdYkzB0ZLKtyva+CyupgZDr9xRZbV?=
 =?us-ascii?Q?Xmg/EBI2+UrLAuqv1A4ExDJucKxeWIS9PHTHBJ446wo45sgRFdIY612VFNTD?=
 =?us-ascii?Q?0iv+KWYczqVGrbUHE9H5VEsow/iqQzYKZ37cerwYYTZds9QsYLh1eoBQG9qg?=
 =?us-ascii?Q?zvs7+wJJOrjYi0fWlNjbcF/yr69Rkyx61zJLzZCGfj0toMXtihPqzwoxTvcu?=
 =?us-ascii?Q?sqoBE1gKVHG2+9f52q7/UWv5NyAgfi91NbgVDDjq/Df38WsSJ7UM7x51rvVB?=
 =?us-ascii?Q?DjcuQlp2YTmC20MqbloSahy361Ej6TTAwhDXkTaB9HY5H10fe9L6N8VPatnd?=
 =?us-ascii?Q?h86fc9wOsZqWRSPghdGKz0qC0WI5ncTYAwsrriNieiGk9tDpetmbTtG5ArHZ?=
 =?us-ascii?Q?BAkndddRPjthlLKHT2ZKkqQHj+jT+6kBOkgAg1by0C0j/6FW/7srRluir4LS?=
 =?us-ascii?Q?gv24X+CRKJvdlKTALs0Fy3a+qHjIL3QMPQHd6NnXfATduqkTfaXs0/0ueCQu?=
 =?us-ascii?Q?Uj2Ut8dMwsINGG4MnkPFNzV6LlteXBenZU0lVItStiwvsZS/VphZrvZ5XmN8?=
 =?us-ascii?Q?PzPDa4l6tkcXCBB/Hdw/iHALE2YuXgU0Xec/ONdFhPfQV38l4vjIdqeax6ii?=
 =?us-ascii?Q?Vg7wFUtYLX6XR6XCyVCkiEpciq0OOjV2qnMwGSNoyIpx+n6szHeWupBAoWqg?=
 =?us-ascii?Q?cDoo9mdbKeQJ3jeIUormDTes7TZ5zx3tpKw3u4ILIzXIda+RdWHnD9RT6uWg?=
 =?us-ascii?Q?BhFyvAP6ObkV9s0BajL8gnDKAxCPvZDWxowiSpcg1UjWosO4CG6SV1HBhBAL?=
 =?us-ascii?Q?6alc4uVaWLnwZX0Vf9/yflyo8my01B+zreSm+c7ppzO8ehnz5MjjIKPyzLWf?=
 =?us-ascii?Q?omXp06X2ciFLOC1JHaxAx21LTQGMVsngzqvotYKbHDyI1a9qTpxaCemM3Gap?=
 =?us-ascii?Q?6ZUe/s3KAk7mJemmjYn283DPMnvs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:30:50.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be2704e-500d-4f7b-231c-08dced0470a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6892

Updates include:

- Add support for newer platforms
- Enhance the TA shared memory size to adapt to the updated TA
- Update the MAINTAINERS record, and
- Simplify certain code handling.


v2:
----
- drop resource_size() usage
- use right format specifier

Shyam Sundar S K (5):
  platform/x86/amd/pmf: Add SMU metrics table support for 1Ah family 60h
    model
  platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
  MAINTAINERS: Change AMD PMF driver status to "Supported"
  platform/x86/amd/pmf: Switch to platform_get_resource() and
    devm_ioremap_resource()
  platform/x86/amd/pmf: Add PMF driver changes to make compatible with
    PMF-TA

 MAINTAINERS                           |  2 +-
 drivers/platform/x86/amd/pmf/Kconfig  |  1 +
 drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++-------------------
 drivers/platform/x86/amd/pmf/core.c   |  9 ++++---
 drivers/platform/x86/amd/pmf/pmf.h    |  8 +++---
 drivers/platform/x86/amd/pmf/spc.c    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
 7 files changed, 28 insertions(+), 38 deletions(-)

-- 
2.34.1

