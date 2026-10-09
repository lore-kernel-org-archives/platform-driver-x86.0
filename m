Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012012.outbound.protection.outlook.com [40.93.195.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399D438010;
	Fri,  9 Oct 2026 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526463; cv=fail; b=Mm/S1mCVCmyIPFJQBHYXjtHXcRkZaiHBYzoue/qrOmpVw9Kxx050kV6dppk8WHTbRhLFW4qGUHwYMJEO4jGkZA70cw/tOUH1mNodxjF/ONlkezjrBT7YvhRwUvK5UHCsLrIeU7xzE+9NEjcwUbprXJQxBxIeVDtbsIQ3V0dw6Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526463; c=relaxed/simple;
	bh=7X7cfsQCt82QUjqzEpkRo9wHhWWHKVRiWW9tu9qtbD0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bhhCsah/mdPp/bC2VulJ1b8xB+H09vbT648sSptXEAEjsA4xEYxheAq0EylqBmhp/3FmUwnQtntJO9Jy0DVMy7Lfwy1nW1TUwl7MeD0gF+nEHmUa/q5ByVQEADi0ViSevBLavEuv2oCBuLtcMqPpUrFrR45HwdIxRjKLa4ujtLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gC0wKJQX; arc=fail smtp.client-ip=40.93.195.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gC0wKJQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YduRG/Hs1gx7KtHQpuuqiruj4gOQLhte9C7gQJ+kYw1HHMbfFdhQM2xpFs/y6kwPDUzIAKdLCrv/ygPrpH5VQnkUqr4NiQV3CEGx5HQAqYICjG6j9KVx8s7uFjde9z3+/5FARBOz0CL9bEfdsVbVnQA8niTrbsS4yav4/P6wGcpbXw+z6Y0k2tmDInr2yuQ35TU9VYgfeJ6ujc68PoMdpXbSgitzdbZ7nVsUMEaGwoCU8PJj6rWRiSOA0f1CS71q7QObvvcAM+fejGAlkwU+RcSXN4ZAXmJeebxsbQDCsbQmYAQwtIQYk/f2nxhPf59XEyjWmekEyNsa4IZz+jUuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6qcYXoVGaI35O5JgmmvwP/Zc++RtA/KrzHeCO8PU6o=;
 b=ilTOKHn1VdiG2gp6+LLbYI8EONt4HGVetYOyPdz2bwHM7QXMmV1pK6KVcnP4kHkhx2uF7LGuho33g4EUpeeNTdKaaTOMIGD0iBzwvNIU+3uPxmOmYdZj72vLKRI1ZAPLuIIcbQp+aDA5TX+qxNDe3EQ+aP8k12DaE0ssc07GjCUhFR20TXPDWfGKWL+bQygN1UpiK7IVNrpQV+yq1NsLphTIfWO+jEQwwAP4UJRQkXHbEwLMUA6FiW40D8ph3ruHKFP7SooQXPqyG9lGHEBKm9f7PcVd70wAmbcHbtcRIhes/IKcl8n41aQsHvXwcezUYFUseQ7zP0BGGDvRHtarQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6qcYXoVGaI35O5JgmmvwP/Zc++RtA/KrzHeCO8PU6o=;
 b=gC0wKJQXf7ZTCfCZd47Qdh9wT1DAOYD8bYC+nk5djtqsqQ4c4zIDyfiC3g3pkRZcSLO0MOWX7d0ml6mMfj6tHpumVittF39V8Hyx5U5ZymgM4BNnuFkUc5VO/tJhLN3OBRGEHGxE0/aTcijsMqeJYR9ikhgaaraM8yIAm1Lz/8E=
Received: from BY3PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:217::22)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:14:14 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::21) by BY3PR04CA0017.outlook.office365.com
 (2603:10b6:a03:217::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 06:14:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 06:14:13 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 01:14:05 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v8 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Date: Fri, 9 Oct 2026 11:43:52 +0530
Message-ID: <20261009061356.3234513-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 497e2c6a-37b7-41a8-0e30-08df25cc8a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|6133799003|18002099003|10067099003|3023799007|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	k0JHeX1LqJyqLUyYsyLX6oAMaCGCogHNJrbr9VYvYpEINIFNMzr09ZedyO4tmws3rT7Gd+yJWKJgk9rr3QcuP5ig5L2Ct7+jhnfSrtEfry5d+RjuzPqg1lJ1sFXnj8mDixRkPjns5oBtmOmu89fbMCrzXd/q6mkwjKACqERIM1rKC8GXyzws0GLYjQ8OxwYH8Be6ie4ctAuToCGLA32I8ufbS3+pqR03Mwc03wYj0NypYaCUEUVEdsIl++bHSyks4NSEj3uUuUvXOc34eliFTf5LlrBVR492Mx1XFkoh3PkzFuCzRRqP9i40hgfhiLnQi2vQlty00ugUfcpS613mKETtbZw/0WY6kUdnXGhydy8Xoso3PIUJmASSeL2+J2409TwOaOTW6wWxAi8UxsES5N0QGhDSQaG/9L4nmkR+i6cs0kH0H2hQCb81cMBPbc9IXJ5QfmsdfM8xEOwLmwxvDPcDQ46EvG9ch9Xr52MZ61AR+C4EqQd0C1rUVNa3K/EfLRcEGAjnJAxIDdWQFcpWipMAtP+EtePmCzlydwOCyfwfhoHrIHlO+9ayrJp+dg6jlrhBs6mJYCgJgHgEZZj6RQdGiXol4ijR3tjnFG6izBSyZ2sdowWLx/YvNbIB1b4ktQgpPSVjlggz8U2DLyCC/yA16OI6xUzObidqSBnmeY9VBB4LT7bu3OgVjJLdBPjsQUAJLaLPYrsHfRn4rCs2Dg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(6133799003)(18002099003)(10067099003)(3023799007)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oVKmW5lHsIJjXGIDs1HvwcE03Pw45KaZekF5c1MrOPUq5ucE0N+EFKPDSv4xEY1dDeW59p+tRGX9nQo6ZY37PHBlzEWDULp0vZOa+4NKCG6QMzzHAU2DaBXqUAgwL7JeZKAnpiNOZHIIQcVnlZ/k7qvEoAw3z0mq53HW2ynqjSjLiugmOsDgTYCYa4pnPToZFHoOvq2Q+RUFDOc5eSP4i9Q+fO748RTXxoqT5cL6QPcUhwr6sHj+Xb2lGsdRmafgWTcivaNZN8hA7X/8+QvxX8eCmpCCZemOfYWOJV7y4bhslL4d8GWb70Rn6IrbiJeR5WgO6Kqz7/NyoQ2oYfhKNLDQ2KB4C1h0Q9Z+yfG/8k0u0oE96jFTzSrMsAJri5Ezb+Y6eC14hy1dtYmDHKCNnoeVVnPNK9ZCUvxnxGKZW/sFluKAjC0K+JXJrBbGzztx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:14:13.4032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497e2c6a-37b7-41a8-0e30-08df25cc8a61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

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
 drivers/platform/x86/amd/hsmp/hsmp.c | 250 ++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.h |  23 ++
 5 files changed, 681 insertions(+), 67 deletions(-)


base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.34.1

