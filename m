Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B046345CCD;
	Mon, 27 Apr 2026 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305121; cv=fail; b=U2o6W7k1smpiXoGERAW/rG1xS3q2cbkdaGEi/qTQhR+S7Dao1SIAzvxrYFoVyfvg3mkAWqQycChSJbQnm5pyPhFCq+F5Ak9km6cY5CY7JsXy8qXZ4DSFfedjNwYp98W4CiyvqkUcgKi2qhhP4TWIZFZyTO5ynMf4FB8ao+IRTp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305121; c=relaxed/simple;
	bh=RZha65un4UPMK3iqSaV8ZXt66IyUmuxu1SNvHBLRSvo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IQd3kSeC8F63qfe+e/U7FYz2RPP8GoJu/Xv0YHMMEo5Dt/7GdwSypYfvoGZy1neLrvbZ0yrEvDVvZpcoRu9sO38fkb1gSP5n0hjhnM8IxGiM201aPYdr4oho6aFyYLbNMWKPV01NZaZtUmQEsR9ELE0+A0kb7YyeHwMsKg1G63I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M010bgNJ; arc=fail smtp.client-ip=40.107.209.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M010bgNJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCDKn1lk08URn9vR/k10dG79tQtNsjr3T635wR53jTUJ1RzGtBWeHbe0y36beO6n4CEXy3U+xH45ppsiF8n5yYK6xs0Nwo2In3Z5JGKKGqva7lFxr+stgItpywvnjl5vleQ3A8B5ugv77+F+WstUgKw14rSfD3r4UgLVgycs0n68PXa27A71uSOX4YefiEun3Ms69zaRlwVfCsOfOwlTwo2df/Hjd9yHDskY5+8589R44on2t0+3JUV+GhMfT4QGf4HbVFneJY0K+fOw3ldMplF29HjD606AIH8oCq3Ucaa0biie+6i2Ge1JzkqCxKr3oJrIFa5C2JgI/e6B5LnYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y674wdrxwPa4iww0o65uAw5rUVc9L0hw0QCyCphhCBU=;
 b=Yms4fv7O5+YysELWHzxQ9+IED17uoBPUIr2xo9DLDJJJoTgKCTkUBnvkQd0UiNcYmIa1VAoxm+EjFo5Y0AHjk5JlwhupJnJ+9QgUb2NRaIaLEIh6hxhgpH2p/RBLoN6J1F0AXvjWKkurxykZ37TdhycZdiM5fKD7AUbHfeXm/lGe/tmEODpnzOrlZb68ot0ztELiGtDyU9Akbtstgy6vP6uDTBInzPRB5+BsTOmM751Bi5gp8t4+7QNkQ707rP9FM9qjP3HsX9l5quWm+VAMcai6mwzXrjzHZCLiW+DYgSp5SOUgd9pXChosU1I13yWnt75i7uNDUJory5CPdgyAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y674wdrxwPa4iww0o65uAw5rUVc9L0hw0QCyCphhCBU=;
 b=M010bgNJzXK7k39fbbnHaS2wjrf+N5gbO6mDkB/sFVJrb4dxsvd1QjjbLk/peVV0/69s7Jrh2S8ePMQml1Hh0UpEFy8ztYv6VMJqaafOWgWv35EjvEu8YqG60SELC3Gc6ZR52E6MnqUmbjKTqMu3DgfP1WL7smtUUAAel2BXTWM=
Received: from BN0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:408:e7::24)
 by CH3PR12MB8403.namprd12.prod.outlook.com (2603:10b6:610:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 15:51:54 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::1f) by BN0PR03CA0049.outlook.office365.com
 (2603:10b6:408:e7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:51:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:51:53 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:51:50 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 0/7] AMD HSMP: metrics table improvements and Family 1Ah Model 50h-5Fh support
Date: Mon, 27 Apr 2026 21:21:22 +0530
Message-ID: <20260427155129.545327-1-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|CH3PR12MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a088432-57cc-40bd-8f57-08dea474e716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|56012099003|18092099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	pOiJ29TmldXwSl02sGoKxKoAPxog/6RKD1ospUJPRvnx1ys4eCfjM+f3TKX1CKCZ7saxknILxc0XA2DBWGVskepIdiwpLRUkTFTqMlq5y0rHHY3G34FK9u1jmxh8ZoNKsgVP+MEmBbgMSm//YGUlBYv0/z5IUKEG28wlJk7xSBKcQbpWBeIq+ZTxoyJ7jEae3kamcYWzUzlCqRw8ffhoer9KKlzcnVYObod15dM7Yyq4b/L+8zhh6F7mrgdzKKiTE3JHH8f4I09FBwnlVGSUvupTHamo4ZTinGug0s0ELFfN9nBjujrJL8ErtQDHVB0olJmDdk+q3ZzmWs9/e8S88CWFr8UxbINaRMkaNg8dBm/AQ0GqfSDRJp8Pww0t1DFmG1yNqABnRPxcT99mmFaiaFoJaeVJunr1FjXuRxVXBQBUaEHwkhOaBJyR7NvGGiuIo04DkGunwP5MkNMP0D0OPy7lDHQ/N1sdgH/K1yIgKkIr24gdTRVd+plwniU8AhdOcjJWJ9E+8cpXgdme9zhX+3wy4erS43e+XwwszlyH6r/1ZyDigIcZnteb2+rxt3/TfWaAn0Jm65M32U9XcxiKxV98ynk8w+wpuVsWWgivS3lSjS+pNiNPhRrKB9mxKSPLyi94lkV7Gzza9vQLbObNlL76eeb/8FKrSDzE/Vo+tez9jXxgK76qjMEjwNVp6OEws0GQkq00NASr8DyOqHyXlxqRylnnHpq/N8CotBAHz3F+syj/yvWWxe6Srk/DTI9ZWdqpE76B8USWyqvRZX9PhSw/RiHX9c8FwvZyk/CZCHE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(56012099003)(18092099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n/hG8//k6nFdxWgF9ltCFFpHzZ8ZSkAOp+NtCBvy95QTY7jr1hBvpb8jDHLmM5yRu/MB/8F9ksVyTHYjlll4e3KnOIU0B1ZrZszzETDJRdQwcjUm9iUWCLei+uDWiofHM2RyPUMGsqUIade4Y3P3M4ToRUC+tilLZ8l1gEfBCu8QoCZYkXih+Kj3KjDWiFtXfaH2oxlY1HsmXxZ0jC+5z3TQ/nLj5VszjwPNqh9NMohpucO/7r0oAuHAXATffRWAioIXroDwW8jhsl2zKaOJbxObZnX89R6fxTcIH8LYaEBqDQGvHtILyzZ8eQaGe2IQ5Rl71YGO9LDJzH74e9szcDB19KVru4ske/MbcpdqW8a9HnYYlQMwTP9fm+rAsPjrmz25EUgU1QkCfKTqSsOPuo5tEH0MIM5uShSNc+kotfTATwOIjYgWiOyYK9uBqwxV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:51:53.2927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a088432-57cc-40bd-8f57-08dea474e716
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8403

This series adds HSMP protocol version 7 support for AMD Family 1Ah
Model 50h-5Fh processors and replaces offset-based chunked reading
with a single read method for variable-sized metrics data larger than
4 KB, and addresses locking to allow concurrent reads safely.

The zen6 metric table (~13 KB) exceeds the PAGE_SIZE (4096 bytes) read
cap imposed by kernfs_file_read_iter().  Commit 3124eb1679b2 ("sysfs:
remove bin_attribute.size") cleared i_size for sysfs binary files,
which made kernfs_file_read_iter() fall back to PAGE_SIZE as the
maximum single-read length.  This means userspace gets a silently
truncated snapshot when reading the metric table via sysfs.

To solve this, the series introduces SYSFS_HUGE_BIN_FILE, a new sysfs
mode flag that routes binary attribute reads through the seq_file path
(seq_read_iter) instead of kernfs_file_read_iter().  The seq_file
buffer grows dynamically (doubling from PAGE_SIZE) and has no built-in
size cap, so it can serve arbitrarily large binary attributes in a
single read.

Additionally, the series retrieves the actual metric table size from
the SMU at init time (via args[2] of HSMP_GET_METRIC_TABLE_DRAM_ADDR)
rather than relying on a compiled-in sizeof(), and adds per-socket
mutex serialization for metric table reads using the scoped guard(mutex)
API.

Link: https://lore.kernel.org/platform-driver-x86/81915669-87e0-f06d-7a91-eaec41ecc0e1@linux.intel.com/T/#m28341c51bcf27862ef6615414b1970d3db279fd7

Patch breakdown:

  1/7  HSMP messages    - Define HSMP protocol v7 message IDs and
                          response sizes in the UAPI header.
  2/7  UAPI structs     - Add hsmp_metric_table_zen6 UAPI structures
                          and widen acpi.c proto_ver checks to >= VER6.
  3/7  response_sz      - Unify response_sz validation to an upper-bound
                          check, allowing HSMP_GET_METRIC_TABLE_DRAM_ADDR
                          to return 3 dwords (including table size).
  4/7  SYSFS_HUGE_BIN_FILE - Add the sysfs infrastructure: new flag,
                          seq_show callback, and kernfs_ops for binary
                          files larger than PAGE_SIZE.
  5/7  Dynamic size     - Read actual table size from SMU args[2] at
                          init time; use bin_size callback to report it
                          to sysfs.
  6/7  Read locking     - Add per-socket guard(mutex) serialization for
                          metric table reads to prevent torn snapshots.
  7/7  Wire it up       - Set SYSFS_HUGE_BIN_FILE mode on metric table
                          bin_attributes in both acpi.c and plat.c.

Build-tested each patch individually with W=1, zero warnings.
Tested on AMD Family 1Ah Model 50h platform with HSMP protocol v7.

Muralidhara M K (6):
  platform/x86/amd/hsmp: Add metrics table support for Family 1Ah Model
    50h-5Fh
  platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
    check
  sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary attributes larger than
    PAGE_SIZE
  platform/x86/amd/hsmp: Add dynamic table size for metric table
  platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)
  platform/x86/amd/hsmp: Support SYSFS_HUGE_BIN_FILE for metric table
    reads

Suma Hegde (1):
  platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model
    50h-5Fh

 arch/x86/include/uapi/asm/amd_hsmp.h | 235 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/acpi.c |  14 +-
 drivers/platform/x86/amd/hsmp/hsmp.c |  36 ++--
 drivers/platform/x86/amd/hsmp/hsmp.h |   6 +-
 drivers/platform/x86/amd/hsmp/plat.c |  13 +-
 fs/sysfs/file.c                      |  45 +++++
 fs/sysfs/group.c                     |   8 +-
 include/linux/sysfs.h                |   1 +
 8 files changed, 312 insertions(+), 46 deletions(-)

-- 
2.34.1

