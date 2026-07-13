Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06512224F3
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968009; cv=fail; b=jCD3WgqqP91hdrGWTrWK5l6WIDf4O2pyLqVmL4H920dZ2+xYelxken+CX83ZEIBBbTXfX7oKl4y05M+kCeu/I0u2HphxE64Eqq4kveyAGbYarXvNw1PDlVBWirOD0cRWp/R56tcKGLLhf3RphbDe9dP0PRlUJ9NiOjSmqqPIJ4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968009; c=relaxed/simple;
	bh=ZzWf6HNXKOREPy8nou742mCbFwf/iHRjDqnfrFyrdBE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hm25DgcYpCQtyp9G2u2OklM8ST+MixNkFJdBhQIirx4JUyFuWQ9khFowdMMqmiWlUoCjiC/10vE6AibO/9wSXI+UjWtdy1yjEqjS2HYOAtfpnmyyzCSJmdPxBj5iqwlmWUb/K3dMSmKlBOjFDc/3jz43BGulDBf9hvwwHMVc0oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hxz26pLz; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hxz26pLz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABNQjOmGDx2YaeoArfTdp5RGTAAgJ4DpjLsNdkElwUSU6Nzu9nfM5fgvUV7GTxgBj9mMAe0JOKeFObCd4ZhOI+37Sfnt6yrAmMobwJ6vszWW2QKn/DNjZQJ6e9+fkIt0RK5YJkTGlz+QVeAfiujhMbTOTRM4BcPU/A/hJDJCmii/vFkFyspGNd8gxeBoZZ/fmKmzbCBe3KS9lwo/g4lb+U7cmxV37UinPq/plUhnRoneQiUXeBG5UhZqjYwVc1JaRHxj1HHyty00EjI3ShMpErHXwy/zYSGf2jpevUUhePireRBiABMS5rP6EehmTDEI8TfAAyjHX1jXdCIfQwiaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ+NfJqQFGsodaokyQyZd/gflx3NCo2kfswgWaS9K5w=;
 b=jNIHQypJH5nRl/gTIZqOPCClWjr5KMDBQTnA84Irtwfkh1p/JynLiZZS1J8ogICjHTfG6jioJWOa5uZhS+YEIT/NieBrE4Bu4zUK83er/2+2Uadgow/b79TKKEo3Er0QkFZ96haPvuvJkhsSmV4VLkXTXu6c25uLq4+YwSbP/B3UWSCrH6x8MwvMNIQK0HIc4lUlJArk/Y1SJ3bj4ymAGOkm6psWrbg7vlcgWCi7x5KrSBQF7K4B2g/xhsaM6mUqfanFVF8ZcgPE8xVYIxWlYzOhXauw1DBjgq0AHX/KCqgkxG9GtPvD3SN7VL+NWYPrdVEoLTcb8X3CD4ZQSuUfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ+NfJqQFGsodaokyQyZd/gflx3NCo2kfswgWaS9K5w=;
 b=hxz26pLzSyyDQpP6t9bWc4caH8x0bsdy4twmplJ2DnGQPPW2cBlKF9goP9qU3LCtv6LY0LsDGiR42LMUs7cv3a91XWOaXJ2O4KsQDryZXR29ptT7+na0jcQtZ4inYLN6EMml+KOK4uAVsiSydjBYSrQQod+sjamyN3VsTf3W/GU=
Received: from SJ0PR13CA0167.namprd13.prod.outlook.com (2603:10b6:a03:2c7::22)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:40:01 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::10) by SJ0PR13CA0167.outlook.office365.com
 (2603:10b6:a03:2c7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:40:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:40:00 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:39:58 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/6] platform/x86/amd/pmf: Add 1AH_M80H support and accumulator based NPU metrics
Date: Tue, 14 Jul 2026 00:09:30 +0530
Message-ID: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ac73bd-fc1c-4877-d105-08dee10e258b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+UlhTPCwnz1Dmz8FiW4uCPUWVGeUjr40C7XAZWjqUfdTFXutQxKSdOoCnaId+oudpiGCzj2nxMvxErf91FkxvDZTIJaATlb5mETZkikVIp31Ed9qnZnAuzYhXauXrXxkQoXAQ5hpPjwVRihEbDB7t5wufSlMkJAnJywO2RN4AAZ/a2dKWjpmy/NJkl+srX4mwTN4f4/gTsJahdgV5vxK4Izhl4XeQfP87Y7e3xV1DLwSxN9EF/ZbQckfGEWOvEAGRFX3T99e+W84Ys5xi5niRPCtTzqJYAnGR6E5WYFqcGMjs3iRZ9IkE5uYd1IBsS0NXZCT0TQLn4tbaYHXpPq5xsooqnUWgoXiTzZXDdbsv8QXQKPMTpHI3Mk4P5laDzRK+7Sg5E3djimzPuHEQ1WxgMxH0vJXEXY4ruH4H4v1e4ZjDGfhr24OicHiP9n7bgsO6gFOQ5/kCAPh2//0RW429Y1sVBg4sSFKiTJKckByzM4/NwehGJvSK9JaMPzoR27kezTe5u4u9PrUblX+cKyLw3PA5Tza2ys7+rlgRRXtW4O2WK2RoWVDrTNa611nOPwUHMq6p9oMUqfjM2exflgHxEYJjezlVbciliTI/SxJtGJNv78F1igBkFW5VdhwgwTpF9h+1E1/DEndGLHaEyM9V98z9jyVqHC0C4pgcMZvM5eBS3fA064+dlz4H+25vMQocT21hsqPIx9D/pUGB7479w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OBXtbkfT8yIxunf/Ccd1HJ3R5yev8C0dNtLYL8BLmNxEI/G1Vj1ksv+3Ipc3pk52OL5fQkVYoerYqoPkhBDV6GtNrF2gnl1hCTxGgW5rlb9MmiyvmU9RyKcNDDMo4H0iSMzkaC0GtDFxGVKZRtc7DtwPWIfCSyP+q56NEL4QI0NPAmRA0FsD7rbijei3AGMZmgfvEcCjLp5U9eakY4gL0v1Xw6+N+U8XbNcYTVu7lolRMdU1An8SqMcRleXfhUeO8fxqS7XFdFPYrA9/ACoDvBYvHbhKPa++cMxTkTjo0iUGOpm8BXgeW8CNpCSsHLqvXhCaOE0oi/dhDcwle/J4mQvCYFof3D24cSTiUce8kFVIrwqOiH9ZEilNlck4hUaXOKWiAacEZLhlpHATnXFt3G6xukBm7GuwFvClaXuTthFnEx0p/2GX+SNVRGxWLeY2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:00.8170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ac73bd-fc1c-4877-d105-08dee10e258b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684

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

v2:
- Change the amd_pmf_legacy_smu_regs to amd_pmf_smu_regs_v1 and v2 for 1ah_m80h
- Remove arg0, arg1, arg2 comments wriiten in the amd_pmf_smu_regs_v2 struct
- Update git commit messages with amd_pmf_smu_regs_v1 and amd_pmf_smu_regs_v2 accordingly
- Add includes and introduce separate patch for upper/lower_32_bits()
- Use DIV_U64_ROUND_CLOSEST() instead of DIV_ROUND_CLOSEST_ULL()
- Use macros present in units.h
- Replace is_amd_pmf_1ah_m80h() with amd_pmf_supports_accumulator_metrics()
- Add Reviewed-by tags

Shyam Sundar S K (6):
  platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox
    registers
  platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox
    registers
  platform/x86/amd/pmf: Move metrics code to dedicated file
  platform/x86/amd/pmf: Use upper/lower_32_bits() in
    amd_pmf_set_dram_addr()
  platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
  platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics
    support

 drivers/platform/x86/amd/pmf/Makefile  |   2 +-
 drivers/platform/x86/amd/pmf/core.c    | 254 +++++++------------
 drivers/platform/x86/amd/pmf/metrics.c | 330 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     | 233 +++++++++++++++++
 include/linux/amd-pmf-io.h             |   2 +
 5 files changed, 654 insertions(+), 167 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/metrics.c

-- 
2.34.1

