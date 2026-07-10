Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013026.outbound.protection.outlook.com [40.93.196.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B633C370AE3
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705363; cv=fail; b=g4LXoIo1vKpkOg4i4nNuIInkYlhemfiGBSz4acb/osMoYj/WTsfZn/CZsnlql8fotCLRhtjN4iDZAYtrn+b4JMoMSkKdWT1LvEU1daUvaRdZBXyUSxFTtsthD57uPA4WW6INabzNdyoI+sx8XoNShPM6hDMAS1Pu/8yNItFaC2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705363; c=relaxed/simple;
	bh=SY7l04BdSHcHtnj23D5gJ7izfsNittsT8D1dP2baMy0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pFdE+aPM31JnM9oq2GJeS19JeJhBj7PJVvp/lU87ROkhQqGF4p6zAnitQ/5re0Zx9JdQoRsA64FfJw+NZVpMTZu6kjC5VDxN4wn+GEz5S9Lc3H8zVaxmFYAoDxIMTPoBQXDTxIwJPamVbdSpvG1sdmCYIa1zmBBrUUGQ0/QI84g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MjzIZLfg; arc=fail smtp.client-ip=40.93.196.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MjzIZLfg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4JCogyFLJJlL7OpmA+SHub7asMIVZyHuohVNbbW5Et0hb9QyeHYgY2wN0ra/MNvEuSURLQwyox1jjzijvKW2fbMRc9B89PzHciF/glbV2nVzAN49qtpHd0y537tbgbylFMsMA49RBY5qRXfUktgKjM4Kppq8xZTFtBcpUIzPNI9+G5rxSWFZfb2A9C35LFIdzvpqxiIImJ3FrNb18ydbJwaZcGcIDXqrciw8jxu5BhBg8NqKfgudexeIUQQNgtCi4vhpUT1CdM5bl/LxQRY9zLe7s/E1ItrbehyUYuTFtStjbXuc475cAeejNbqQIVh7gelxysCgCFUHomCdJEpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO6jNDZBhsGJ1Xxnfc+HGV9W5EyKiJoUaRM7dFsENuU=;
 b=b0+N2g6AoZ/Noz0wf7qp/rMtbKeCBWdhiDWAoLVeyfRrbol1f7mWIxn5kDMggKmDJTfzzYRZw/BkTvQjX8NthXXdCquilkODtU5fFu5P9U3T55tgYBAGo9PksoWdgj4qOZlrpQHySRaKZL7+RsZ13/NtfUY5xyS4Ho0BOi4yT6NQjbdZ4IWpCuTs/vQCR27EEm7SUjKB7n7CgrWscY5RbAQOVQ04q2QhnKdZDi301U+CN155m/vkexvhjyJhUcY5d3Hunuh7RQN9t8Ar40DRkEGXN0corrEVNEY0OzWxa0qPKJetP0MgFWHNKn65F1Alkh6MVPR68Lo46SW+MA1prg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO6jNDZBhsGJ1Xxnfc+HGV9W5EyKiJoUaRM7dFsENuU=;
 b=MjzIZLfgiHn+X/RvhBj9nSzFgCluAOyZwZSizn9X+ifJVpIgJLVwQ9NhRsrnH6YRHo0fWHiY0pZFWLqzLTALOS4PVgF9YXHuJvEn0h4+amId2I9hZE0ZzrmRQ/n3i9svYlNYuJcg/bKdESOJdGAW+jCHIOAhpP+iuFopmTlyQbA=
Received: from SJ0PR03CA0367.namprd03.prod.outlook.com (2603:10b6:a03:3a1::12)
 by DSVPR12MB999193.namprd12.prod.outlook.com (2603:10b6:8:496::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Fri, 10 Jul
 2026 17:42:38 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::8a) by SJ0PR03CA0367.outlook.office365.com
 (2603:10b6:a03:3a1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 17:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 17:42:38 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 12:42:35 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/5] platform/x86/amd/pmf: Add 1AH_M80H support and accumulator based NPU metrics
Date: Fri, 10 Jul 2026 23:12:14 +0530
Message-ID: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|DSVPR12MB999193:EE_
X-MS-Office365-Filtering-Correlation-Id: 812d4b08-ec48-4cdb-10bc-08dedeaaa251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gilNvQ8ys21tQqhdEx7UfPqHUpkjZvCsNOgDMRbEgNdOT9+CujcBHS5yseX+wpD+lG4G9yHC+X7dQeiXzy5QGIBvP/5npJT0YFQmhE58EjnCw+LITs5WBASrXNxYlOtiRLlmBPFLD+c5BaCdCUIgni8frJVCjeySh4870Slyy5NIWR0vC0aJZAumXviTk9Hdv6rvbHZZ3fhN6OAokqRsyIwIXdLJeoJMMrCh8tRCrn+Y6aLboGSyysHhtEBXmCm7UgBjtLKhTooLJuqpO+SGWFd4SnpEWkAaTGWu0nmkb0AdAHDvjEHbptHJALcgP67dX2csRFTc/0DtzfdH/zzUs6jWa9ylLi/lYb5LjthviT+S5yGg2BhK6oUGFPz8gAKBju/P1+5N29tJO7lvzLpZWAantKj+zFC7MwjU2N3gp785VlsPTZzgZXZX4JjHOZhI953K8ybuuwjUSRH+0zDNRpUhIJbadZH091xLPe3TbkKTMV6B1cQQ9Wh775b0RSDn9pjGthHcwilOkzr8iGrRBu9wUkkls1Uf5lRXf/8Sb3mHxD8TjEKPhyGuWxoStq0Wcn0zIx81WDwLlp2dAl9thm1P8BluEygc5D5lLvdyfMg3FCxPVTkJc2tUDh2MAI/bq0PO/Hj7E/AuM4VArxJ8zHbCqKZDgtdFv7f0XRDOXcEySzU2eFXtylEUOAA2/bvAnNe8CmNuZjP92L+EknV1sA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s99iH9lGbYtZNr1ST4n6R0lYngn/f8LvsXbqF9HECpzxuSDqsxO/XACThHjyi6+H2Tb5B7NX4m0YW8Q6DaSI5iBYHHEz7k2tDLpnZX2rTvBd1ixdEowyI3ak2OfNROAxNNRMeJgSfAgXnQ2wU64pCiiVKhNVe6IlPeCoBzRu1qaa+k/R/17s17e8nbfgqZsYVaEnoNFbF4UEX7ZvIYu/q/ST/h+gUGA/IqgjAARYrUUkPgeU5zDczesrCtRy1CC6ldmQ/SPI4INgJi2F2YwCY/vLnyJE0Jw+2fnYY7pmuNgEy5hG4PxBQJ9hJl1VsBMdqS0P74+lSnaoEmCGXrRRi/TcWdc4wrRRFn/LN93c99C3eOX60Az1SjnOl7+lvXqtl9z8s7Yz8MpGuF/fJLuym03OX8ZHgSGD9veKUVKAwIp9eFgU2tLHTm96a6S0iRgJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 17:42:38.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 812d4b08-ec48-4cdb-10bc-08dedeaaa251
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999193

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
f6ee11d77d15 as the head.

Shyam Sundar S K (5):
  platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox
    registers
  platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox
    registers
  platform/x86/amd/pmf: Move metrics code to dedicated file
  platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
  platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics
    support

 drivers/platform/x86/amd/pmf/Makefile  |   2 +-
 drivers/platform/x86/amd/pmf/core.c    | 251 +++++++------------
 drivers/platform/x86/amd/pmf/metrics.c | 327 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     | 234 ++++++++++++++++++
 include/linux/amd-pmf-io.h             |   2 +
 5 files changed, 649 insertions(+), 167 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/metrics.c

-- 
2.34.1

