Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E664499AA;
	Mon, 12 Oct 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795270; cv=fail; b=plNo4mTedgJb9nLTnH4uvhT4YP9pihwkHSGMoCG1dLKjlaYOWspxWujfnPJVMyBi9EVyaPd0cQNyrpYMcNuNKgEMYWAClsLGwgpqWNPs+KBDFTwgZfDBDCK4L3Tku+aRN1egVTqmRWIW+1G62i1dggU1aoVD27Pzzqv0azAcKlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795270; c=relaxed/simple;
	bh=PkCo6CFVIO2yZ1K09yDVPCQcWpK9/uAWZ8DBCp9lZsA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oLqrDXFXKdXgjMCs9odA8UTHwKZIqCgB11h178hnU6ZEH+9SoGMvHPLCmdbuX/g1rzImr8mViS9aMlVunaD6o8yiRjqHaAULnpXF93WQBWA93v9kRx1U79IJhlV5HdzZX4uUrPf5kwRcX+N8QzmS5DBjB/kg4clPYeV2vAdqncM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hw1bQ77e; arc=fail smtp.client-ip=40.93.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hw1bQ77e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JS3gRs4ZOwhP4agz05lbidGc7dqCluBQ/5+w67ycZoh5DGk2O07Ed2qCn5t0ihS5chnbJkFD5pd7gu30biP/XYhbC5x0faiiRKEVQiRg3XMNMoZbopKuqLN5WOaGatuieQ7MKl9+CngczNjl0dsQ25NxsZPcr0XsuEXvEeMcB0muF4ZRyKY/7K9fyH7z9ft+s34KBml7wgVL409I03HHGR3HZjzHyq+1vBiy7RszuhRaUxZskUePz4f5WqWB7ieN0kxQ93ULmsMRPlsYkfxRsTUgWFet7toM+lfV1n5gyodpyynohqW/u7PW7cjDhb2SqzaBLwa7F2ITDhiCFSoLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oi8E6aNwlSdH3FD8iN8wJD6RDo6MYFlq+xlrLk4R00=;
 b=jocZo5BjjLbmbBIqhPR2I7CxtW7kkcjW5yutmpSYEjDhVHSzxmEryF8pbxaUUb63TnPl6w1sWyYVDK+garpeWwGlzGtOJosgdu7BSIUrdGoK96F18oA3sios6F9BOi09H9f3KmNQG6Zf/4zmFpHkr/4GQJQ1cJlX3FDuVQE8U1HJMZFULMrRIr+cF/0nVvWdKyyGycis8LfEoLo6aUnyPRBzXiAkp7uZeCHLVYjFcYTK/45EbPwc/PdxGLR9aYHYHJuWV0PahTKpLm5LCfrVwVEcTGgvDo16ua6cbWI70aLzNfBcbEDH/MRvEpVg2UtIGKPHrPZ/T/CLsIG/jolcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oi8E6aNwlSdH3FD8iN8wJD6RDo6MYFlq+xlrLk4R00=;
 b=hw1bQ77eTjRha0XE/fiIONY66Vd/8rHn546E8zmk7G/Wn9eRFE8Xs1lIT5nwnb2ikorLBGWdrTJhv8v7S/mGUCxsynW0TXCF99g1lZTOYPTZAT8VHWOrWJv8lsq/Lg7TMYL5/87yPCVoVT1878cDE8vc70PWwJvOGCl0tXlRsiU=
Received: from SJ0PR05CA0118.namprd05.prod.outlook.com (2603:10b6:a03:334::33)
 by DM3PR12MB9390.namprd12.prod.outlook.com (2603:10b6:0:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:54:25 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::30) by SJ0PR05CA0118.outlook.office365.com
 (2603:10b6:a03:334::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:54:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:54:24 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 03:54:15 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v9 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Date: Mon, 12 Oct 2026 14:24:03 +0530
Message-ID: <20261012085407.1202295-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM3PR12MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d266d8e-0a21-4ff5-43af-08df283e6a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|10067099003|18002099003|3023799007|11063799006|261009223027099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	/k0+6G9qrDju1qT9qHnxgz1mSRZ9EJ2Xl2e/UatwUF1z9UGSeqNyenQH4m1FpZ02jR/QWFt12QFifr66OF4JavtxbwA1f88xGeGDfCYtTiS9htV1RaQErEjs5HlXOwjJ5pZ6AHmDMSxSFHXoZ+wMDYYlfn0pgi7DDWpLoLF5pE+oTPnZ4ZBoQFs3Of5ggE0PkV/FCgbWnaNl6ugrYKbR+wxmbCMwvnInNnc4WE6/cTvwYPUZExxHN9OtOBBp9mmd/rXna7dnaiY6bzZvtU/X2F4pLPthjhto17WQOzypDpEY7jSi+0knlgKOMduAxRqRjSz2knxSYqlx0ZKlQEisPVkkmGRmViqyrwwVF5ek1/28w5pgyCByGb/MOhI71UrILN6P9OFuixMhwWOQzzbAMV3bC0bHHxcW7x3ygL4lW/s7rsSaDTIGaNKVrkmsY31gRp31J3DJYLCdYgpD0qAGZ/77h7Vw8JJK4IYZZLRwC6vqEsEzn9SkWnBE/14mxbm3SQ10c/rUq2rbi1eLlsExk02rj/lbbPDEJwvtVbWv88t7oDT210+qTzxZHlYWck0CgQ9ASe+/kxxeXk4FdeAagj9lAs1ejMuq0QBVms8TJgeSaCAydHTrGGJvQa/h9Zc+60axcsq6ICzj5J7JpGhLweh1BGbaMZ7CbQWALO3uz8xDw8Z2GrrUb2fk+Bm1yY5jZne823OhesYCG696sgsyxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VDtFPkWE74EAKt97njRqllX4O5sE2UQQm5/k4pW5CLgXUZSm4MGWnWGKJUoDywhpgpgKPN/ubAcB9qgqdF3QlOpn7gYWYKiGLP6KaBxMJCelO5EW9jQBuin3Yr5NwmktBNmgCtDFEmMX8iwWtwXXy9pkoMsYTgKu5wH3NUjdqAUWYfpZF8WF+mMq5VKUi+roFlJgFmAwDLugxQQT1h6XSlyR4LKtjxUmUuw4a+kJsKZPIueeE02cdAXcEukk8rnbcYL7Bu5PqR1Fa551SfLP++0xiWlCrNAEa7uzbdGvHXjFUSHpMRePe2I0jOvGnduvGj5Umfx0pWClJ61O0U1WGIgvThgc7dlAhcg43Y0ruD6bmaAznQhXq3M0stejOqZF0vNR1qoXrgdSZdboGpLvAEtp/TbxtIUCirTEkoOUS0vY0tmCa2MCJDlKKwoitnHm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:54:24.6916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d266d8e-0a21-4ff5-43af-08df283e6a68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9390

This series enables the HSMP driver on the Family 1Ah client platforms,
Models 80h-8Fh and E0h-E3h.

The client parts probe through the same ACPI _CRS/_DSD as a server
socket, but drive a different mailbox and speak the Ryzen Master SMC
message set instead of server message IDs.

Patch 1 adds is_client_platform() and hides the pre-existing hwmon
attributes, ACPI sysfs attributes, metrics_bin, and metric-table
DRAM-base lookup on client platforms, and restricts /dev/hsmp to 0600
there. Patch 2 adds the client message set and routes it through the
existing MMIO path. Patch 3 wires the client metric-table messages
into the metric-table read path. Patch 4 adds the client telemetry
table.

Changes in v9:

  - Patch 1: fixed a build failure on CONFIG_ACPI=n configs reported
    by the kernel test robot. is_client_platform() now gates the
    acpi_gbl_FADT access with #if IS_ENABLED(CONFIG_ACPI) instead of a
    runtime check, which does not stop the compiler type-checking the
    dead branch.

Changes in v8:

  - Reordered the series per review from Ilpo Jarvinen: patch 1 now
    adds is_client_platform() and every client-platform exclusion
    (attribute hiding, DRAM-base lookup, /dev/hsmp mode) before
    patch 2 adds client message routing.
  - Patch 3 upgrades patch 1's defensive DRAM-base guard to the full
    RYZEN_MASTER_PROTO_VER1/HSMP_PROTO_VER6 check.
  - Patch 4 unchanged.
  - Tightened commit messages and code comments to an imperative,
    concise style.

Changes in v7:

  - The client message set no longer has a per-message descriptor
    table (hsmp_client_msg_desc_table is gone).
    Validate num_args and response_sz with HSMP_CLIENT_MAX_MSG_LEN.
  - /dev/hsmp is now registered at 0600 on client platforms instead of
    0644, since hsmp_ioctl_msg() has no per-message GET/SET gate there
    and any opener could otherwise issue a destructive client SET
    message; server platforms are unaffected.
  - New patch 3: the pre-existing hwmon registration, ACPI sysfs
    device attributes and metrics_bin visibility predate the client
    message set and are wired to hardcoded server message IDs, which
    mostly collide with unrelated client commands on a client
    platform. Guard all three with is_client_platform(), keeping
    smu_fw_version and protocol_version visible since they report the
    same data on both message sets.

Changes in v6:

  - Patch 1: dropped "inline" from get_msg_desc() too, for the same
    reason as hsmp_desc(): it does a range check and a reserved-type
    check, not a trivial accessor, so let the compiler decide.
  - Squashed what was patch 3 ("Add ACPI client support for Family
    1Ah") into patch 2. Patches 1+2 alone, without the old patch 3,
    would have left hsmp_metric_tbl_read_locked()'s new client message
    routing unreachable: hsmp_get_tbl_dram_base() never runs on a
    client platform until the ACPI DRAM-base gate lands, so the two
    belong together as one atomic change.
  - Patch 2 (now including the former patch 3): also guard the
    pre-existing server proto_ver clause with !is_client_platform(),
    not just the new client clause, per review. hsmp_pdev->proto_ver
    is a small Ryzen Master interface version number today, but
    nothing stops a future client interface version from reaching
    HSMP_PROTO_VER6 (6) and making that clause spuriously true on a
    client platform.
  - Series is now 3 patches instead of 4, following the squash above
    and addressed the review comments.

Changes in v5:

  - Patch 3: hsmp_pdev->proto_ver holds the Ryzen Master SMC interface
    version on client platforms, a separate numbering space from the
    server protocol versions in enum hsmp_proto_versions.

Changes in v4:

  - SMU now answers the interface version query on client platforms,
    so hsmp_desc_client.proto_ver_msg goes back to
    HSMP_CLIENT_GET_INTERFACE_VER instead of
    HSMP_CLIENT_GET_METRICS_TABLE_VER. Patch 3 is back down to just
    the ACPI metric-table-DRAM-base change, since that was the only
    other thing it did.

Changes in v3:

  - is_client_platform() now tells client and server apart through the
    ACPI-reported PM profile (FADT preferred_profile) instead of a
    hardcoded Family 1Ah model range, the same signal amd-pstate
    already keys off of. Future client generations are recognised as
    long as firmware reports the right PM profile, with no driver
    update needed.
  - hsmp_desc() now resolves the running platform's descriptor once and
    caches the pointer behind READ_ONCE()/WRITE_ONCE() instead of
    recomputing it on every call. Concurrent first callers are benign,
    since every one of them computes and stores that same pointer, so
    the pair only needs to keep the load/store from being torn or
    reordered by the compiler, not order it against anything else.
  - The client message enum in amd_hsmp.h is now documented with
    kernel-doc, one @member entry per message describing its inputs
    and outputs, rather than a block comment plus a same-line comment
    per enumerator. Noted there that not every platform supports every
    message and that an unsupported one returns -ENOMSG.
  - Patch 4: the Telemetry Table RM layout moved out of the .rst and
    into amd_hsmp.h as real kernel-doc'd struct/enum declarations,
    giving userspace one authoritative definition of the byte layout.
    The .rst now just points at struct hsmp_telemetry_table_rm. The
    structs are now also packed to a 4-byte boundary to match
    firmware's actual layout, and the trailing NPU/PMF counters and
    spare padding firmware carries after the overclocking fields are
    no longer missing. Verified field-by-field against AMD's internal
    metrics table header and end-to-end against a live snapshot off
    Family 1Ah client hardware.

Each patch builds individually and is clean under checkpatch.pl --strict.

Muralidhara M K (4):
  platform/x86/amd/hsmp: Recognize Family 1Ah client platforms and hide
    server-only paths
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Document and expose client telemetry table in
    UAPI

 Documentation/arch/x86/amd_hsmp.rst  |  24 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 420 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |  31 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 248 +++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.h |  24 ++
 5 files changed, 676 insertions(+), 71 deletions(-)


base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.34.1

