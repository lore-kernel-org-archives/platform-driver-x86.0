Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CD446D2BB
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805372; cv=fail; b=tB7uKL+xFVSkApcYIw9zt/recWilj41DkmApiCC+XR5r2uU288zYVX9ZDmo4/P98OEISH/KjVYz4LdXRtGqLn/kaeaTiGznaPXXdnqTLPyXF2PEWyLdO2r1opxOoJGX8XGZ1INIo4pTyWhkOR9yXvCEenx1Ocx0s2pta8ihJWQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805372; c=relaxed/simple;
	bh=fyGQ35XRPBS+wfpPjS4A3JT3WgkKYE+FcUbF64DOpOg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HqcOd4qSEgqLcFtFgMFvviaoNUJ9nqc9iSkWnX6gcDnl8OMZ34FQY2TPZvU3gZ5nFKZE/AmYxxPv/TDnVEpkuAD9O7EqlyhTOxk1lqBJiaMxCjXuBMWiVHLk0X5dfWVa2HD77CDtDbyMLa7Nzoy/fFkCVRUfsGkIBtEny8Zi40Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WxbCaC85; arc=fail smtp.client-ip=52.101.52.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WxbCaC85"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUGhvoKUMbEcHmOIusWydlyOZ2R+husFOS5xKsVuwFlp/g6xK29t38JKYitC2tWuAqXk5MvO1ve0a+R2ZC1KQ4JmQaG7fdSS5BJe9LZjB3TWqXx1XL89xIbWNSsAbwHTZPxGfnU7PQmqh1sVeudBhgrybs5IHnqQgW6GNq99LaVDuxfwk+j3BSkMf6WNLohvnWYpgPiXu0fre9X5H6GTF8mqvCQncLBU/bxjFIZkPolUTu8HUGxHt2RB7hKNLBj3jkCbhFopH/WzvpzPKFY8NR/gbX6Mal/HmlCac33O3UnQVKFC2Q7kpf+d3piTerboZttxd++XLpaZ6Dx+OoBvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72xdUscyq2PSvSErUaDpjS3hUpcb86kpnbE5H/iDhZg=;
 b=Fn+D2qVv+BA8MtiTzpjMq7NR+43OOiSEvoGqXMXD28xDF/clQRegVKdyXD74S4v2SCyQoKuWe/1uH8RHILnKn7jTVimp5rXPdlioWkTo3g/52XuQgzknoY5Sp5l7uPAuvH/i1kgq0rmitys2EXrz85IhHE2L2keSWpLQ0SwSyFdm3uu+U23FMM+44fXi1DCPiSwIPjgG0nZor+w5Acna4EFW9GrYbTB31/3g4OTv+gtDPiwbyjY+E3b07CDe1bCqDP/dvP+3dgC7gr4rmooRc8CpldbZradp0I5TAQoL6Hz0z8KLn2lhwvXsqMhSz6aqOTGFEQddinGS/1F9o/YP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72xdUscyq2PSvSErUaDpjS3hUpcb86kpnbE5H/iDhZg=;
 b=WxbCaC85uukiOCQloPkfQk8rs9VeBloZ4q5pYGlbLSNSDhf2Aml9wJU/inNXg+EMGSe6fyTYqtBZUkcgKx+UeZHUxsTksUndx819SMvR6UCR6xCuYFSH0+U8pY8/2dGRKjbuMw6FM1//H1IUbn0x/GgRTjmlXjUy0sMChiSw+6U=
Received: from BY3PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:39a::21)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:16:03 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::36) by BY3PR03CA0016.outlook.office365.com
 (2603:10b6:a03:39a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 11:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:03 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/7] platform/x86/amd/pmf: Add 1AH_M80H support and accumulator based NPU metrics
Date: Thu, 23 Jul 2026 16:45:27 +0530
Message-ID: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 369e857e-bec6-4b25-33a1-08dee8abc861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|11063799006|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LvfVePC06UwYpnxsov6XESlt9cIjvk79wUJX5TaqOLkLtwoZnGxURGbn057ACcne0GoRSPJwUtVIAJbo4yXejSyei4wVuAzAuqhc1cQAkdKxzbvZnqUjM5on+V7FJbgRnaNAXKR0lfi1jU5T/g6dcufoYGnxB92GpUZWR8rxQV0sqP1ITyXqBBcXksJeZEFSNd5pQcE+MSyKpEy33Zrqvp3Hq9hHNQnes8vnty3+Ro1vWg4yrwi74y75hyLWDmA5XeY5AABLRVgd54dvpsbWEX1zP5sZp/VoUFoiVInX0N4yXf6H4IkHFcOWvv/aMRE7j3YFYwf16o69Qm/CSiDbB3Qgb3pxEVaOwCuBYNOmfwHZVQXAqInmd72YsyyfSa8qi9MVVcBIvFT24wvWALQIo+7toPfT9Hhf4fOkrB+UsFV/B/HOFDG4IfYouFLBy2FDSee2cp6kasBfItr7MrznxWqVdYrJiWVMv8xoXiJE25R/h+g4nKPh/gHc3ewIxAr8bmroZ19nlDjp7kHIUtLcZaILwOdfoCFvOs4a/atH52+Oqiz9jZmyMAWXGDfTEnCspO330oNKMmk0wCDzGx8LNqsuRbPKA5VITunxPJBuaC0EOfYxQ8lyIqcpmL0Q6gJagT0qV/8PKaQSzq70B1TULF5cKtixqfBtuDciAtUXuU9fJ0Xa0s9NQAxrhcPyNRJBIXfdTMP0Ji9HapmiA0j+Xg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(11063799006)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9IfJvLargmG4TKEp9BvQoUJAUvvENwLaFq1p5uqqN1j8lb+jH8QxEKkXIdXlwPq9vWzEUZXMa3bYhXEjuIB4UvFRtydC9d5+qAC3KT8l6tumhLbMOwN7CkjDpgDLkVBwJDyXpQ0gIdmdepDb5ftk0R/gz6WNAnn2IMIzQ7OmVpQV/GDXEH2ZVuqDO/60PU7fdF6/8ISXmdvCwGfqOQv/IfLy50TKeNxZ+ja86eEx6KseSRIqg1iHNEpbPvexF8Q45QJGQYBjxFcgvy2AvfRqvh201mahp48VclvLr3YUG3Opwqo3lqWXlAJfOSHWd3iaDOjZVUryrvTf5OnthQtrno7dT44GX7oRq7pSCBk93VyooNOYfi4kRJ8oPJ84N5QicUtQiOqkNEFMCdzeI0SWgx23VsJQBr0YR1k3wzpaAI4W/0pVybdNzJi6F57VEeKi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:03.0785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 369e857e-bec6-4b25-33a1-08dee8abc861
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404

This series cleans up the PMF-SMU mailbox handling, adds support for the
AMD 1AH_M80H (Family 1AH Model 80H) platform, and introduces NPU metrics
retrieval for it based on a firmware managed DRAM metrics table.

Today the SMU mailbox register offsets are hardcoded in the send path,
which does not scale to platforms that use a different mailbox layout.
The first two patches address this: patch 1 moves the offsets into a
per-SoC struct amd_pmf_smu_regs carried as PCI driver_data, so all
existing platforms share a single legacy instance and new platforms only
add a table entry. Patch 2 then adds the 1AH_M80H device/ACPI IDs and its
extended mailbox, which uses three argument registers to return the
64-bit DRAM address and size of the metrics table.

Patches 3 and 4 are pure refactors with no functional change: the metrics
code moves out of core.c into a dedicated metrics.c, and the NPU metrics
retrieval is restructured around a per-CPU-ID switch so additional table
formats can be slotted in cleanly.

Patch 5 builds on that to add 1AH_M80H NPU metrics. Unlike earlier
platforms that copy a transfer table, 1AH_M80H exposes an accumulator
based metrics table (amd_pmf_metrics_v3) in DRAM; NPU values are derived
by delta calculation between consecutive samples, with the first sample
discarded to seed the baseline. This also extends amd_pmf_npu_metrics
with npu_temp, sourced from the new npu_temp_acc accumulator.

The series applies cleanly and existing platforms see no functional
change.

This series is based on top of the review-ilpo-next branch, with commit
caf8342512c3 as the head.

v3:
- Include Missing headers
- Make a new patch for trailing blank line in dev_err() 

v2:
- Change the amd_pmf_legacy_smu_regs to amd_pmf_smu_regs_v1 and v2 for 1ah_m80h
- Remove arg0, arg1, arg2 comments wriiten in the amd_pmf_smu_regs_v2 struct
- Update git commit messages with amd_pmf_smu_regs_v1 and amd_pmf_smu_regs_v2 accordingly
- Add includes and introduce separate patch for upper/lower_32_bits()
- Use DIV_U64_ROUND_CLOSEST() instead of DIV_ROUND_CLOSEST_ULL()
- Use macros present in units.h
- Replace is_amd_pmf_1ah_m80h() with amd_pmf_supports_accumulator_metrics()
- Add Reviewed-by tags

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox
    registers
  platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox
    registers
  platform/x86/amd/pmf: Move metrics code to dedicated file
  platform/x86/amd/pmf: Add missing newline in dev_err message
  platform/x86/amd/pmf: Use upper/lower_32_bits() in
    amd_pmf_set_dram_addr()
  platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
  platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics
    support

 drivers/platform/x86/amd/pmf/Makefile  |   2 +-
 drivers/platform/x86/amd/pmf/core.c    | 256 +++++++------------
 drivers/platform/x86/amd/pmf/metrics.c | 330 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     | 236 ++++++++++++++++++
 include/linux/amd-pmf-io.h             |   2 +
 5 files changed, 658 insertions(+), 168 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/metrics.c

-- 
2.34.1

