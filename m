Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3B72D595B;
	Sat, 19 Sep 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804134; cv=fail; b=IZYxh0gQJPN5dmno0VcF5CPFBwCicp6rdkqhlXuo7Z6GxmmAfMai5lp1h0t5a44HOaP+xb8pCgLDq8v/bAZ0Tk0v5wta5rqmrI96Fpt+98QIgNS+p52IUaokwNWzwY5ugTkf93DtUSh7yQ5Nmn6UdM/OSn3jHUvFo5qgY1QxaJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804134; c=relaxed/simple;
	bh=pGxJEAbKS8As9acD7S8SCbSjsjVt4/v/bMl5uFtsuo8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=skKDrQ5DuXwi9tp/SzdpbscsI7AriN8dVR1M8KfjLFhOfVhrEcdcxRmAkL61QdnQjuwJkci0Dk+NFnmWpVepR49UFjk60HfaKF6D+nunI0ErsYVV7foh/NdON+6ZcN3fmnTAbPjW11BbVslsamIFr7zE+LmvpRj6DSehejw5sDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jTIb2dGn; arc=fail smtp.client-ip=40.107.209.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jTIb2dGn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQUPESuJ2IHLWETB6t3yQiGmxIX73zzTwzeeHCHZPRIKgU0Rbi71LmJgmovSfikxZQF775RRMFIxUGy1/r49PrL7BYFbP8/1ikF7xvLcoHPbvCvguixDCOfozwfAc/oS+Wgd0p2EMrMYpPcovBvKVoFYq8jTI3uwWkHOU3DFi3nsT/G2UyBWErXUS60KL/+zSd/abktSw5JCOaCnVCoGKdOEC5o0m+8CJuayEDsZ6VXOoSuev4cchjGiX08WE72RHO8VA64oN+OQLcVhvimyg/ujfmuXIi/EwXQr2g8TUIE53LROxYRGBAvKNecDHdHF1IGCqz4lQPF2Pyh+ldSXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtabUCyormA8zZWfWmI+Qi2Ten7khmA22clbDt91JKs=;
 b=v+7qhoHu0gNnNEijrsNslDTM/nru9lYVpA74djS9WJuVnn7bT66qR8S4dGLr1Jaz8/sDSJ1XlnPCrIJsKK7Xfma2VUOMbSiiyQxd/NJIq/UVhxauE/n2qb9hUnz5TcPcTAkOAEFvLNgb3CB0i7wTGBfrLNmp2YadCXYhQPKBsCvOCSKieXDF2MKj6EvABrID9OrXKXqJ2+exxp/97iRcMh54N6xN02aQr1LokTK95zDfwb77fBXZg8ezdfTyEQk1MXOFy2e5I61BpJi1G8neJul55d6XGsTnb+lP2IUPfaxw+HWBZfM8LW+fVzZ6j9ZxjzwN7KYY7MFXlDjVj/exQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtabUCyormA8zZWfWmI+Qi2Ten7khmA22clbDt91JKs=;
 b=jTIb2dGng7znsGaz3ZFkw8/HRO0gXkHK/IGgzfYhPDg2T0jDp1vxJRkbrSenLz1w1fAmBOLSjd+fJhqJuHXfB/u7KiN1oO/miO794pJdU8wVC8FMNal0vXVsBkCYI7OCmaz1NSUc50udJNH8R0hniINwDVUbj5RwqKOmHlfjw1Q=
Received: from PH7PR17CA0065.namprd17.prod.outlook.com (2603:10b6:510:325::9)
 by SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 07:48:45 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:510:325:cafe::64) by PH7PR17CA0065.outlook.office365.com
 (2603:10b6:510:325::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Sat, 19
 Sep 2026 07:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 19 Sep 2026 07:48:44 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sat, 19 Sep
 2026 02:48:42 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 0/3] platform/x86/amd/hsmp: Family 1Ah client support
Date: Sat, 19 Sep 2026 13:18:15 +0530
Message-ID: <20260919074818.2541775-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 649dd769-f4b5-4202-621d-08df16226e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|6133799003|3023799007|10067099003|11063799006|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	VASk6KLFN5kg087ttAvpA8TNqd3Lav9fEifjF3WhqpoOCFXFMcwVm8Zvjn9mN+yLcwnfLwbVsN9GMVzL4jFvn0lEg31f6Qyqnwoq6eIKMYpZxBZsFPrZHmzqe8LzGIVeo5r+CRpZYfG3f6s5H1XyNc9r9Do0hhFkJFXmUOVSlf48wHvjk41798lubd2d4LQ+7Zz0sKU2kUuj7zF1iWowmRdnLf0z2TFzDkQpnyXdR/huTxkaDHlMeusg8wAGGwf8dmaMniMOEiVvaNzFcVQzU0ximfqxR+iuHGsoIm8ux2uGXvdd6l0daIdGT0Qrj4vsB366Ex/Pehb/DRhka4hHlbifCgNdny7+IyXyVlRSv/ZJq/yFa+/Kuujsks56IdW48ZVMkD9ZaMryoV0XQ1HB5tQUDFW4vBvxoofEqTlFLxoQgFnKAYPUYHeNjAbFEwJUzb0pEE5th6AvYxZStR2FuzRVlk6IEAsufTZ0oRj21Qliz/97FCYemNfy5VuvNuBztMXZ/DNlmc4WAMaA1Q9aM7BIcgu3hdgasP+BsyjWnfC3mJuDyWc1kaizzNWDhPyfgnGr2EiZ/ax5vB3kC12TiOVoFapZTkps4iD6I97jI70n8xzWMoYhDp+Mcf+2MThl9zNNQpr4Z6yt9EgZ8yGE8sc8AAMYe3o2CfJw4Ktn4HZgPnQ46pJpgvWIJdwxjR6vQ9ijcxaQF11dB2WH1q3JVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(6133799003)(3023799007)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	37NDicHe044z1AMLb155d2M7VUvigeZXZBaq8tQ968aT5NxWw5FYdtr5aZMtDGdyVDscO+IChBhT8n4coMw9bwx9v7IFqs0TZOU3jSFV3hE379covDJH02vAVrpPL1dgDGm7M7Qq/b3AH4eqsLB1OMZskYbDCL67gQene+Z/uj2VJ5Z34sxY7zcwU3qLj/VlPgHsGOkQss6ZwnjLySlNxm1EyouISQqWaamdeCn7RN4UQcrHOxNIO/Uozcos86N+sGzAj4lAfjPpx1mka3r9qhVLYjUU9pP82ntXz1qtHkkP5vO2MCLlHpec/Kr52BdagBBZZgxyJrvZ5sm6opHH681Ot23JcOupIAmLQVcNKB1GPYFaGbuU9tS43A5538+miAPW3w4Xd6/nL/XAHpIBKJbjwzDogFqat5VlSvCv/y1cnmy3wVnEse6QQPo53cT4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 07:48:44.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649dd769-f4b5-4202-621d-08df16226e68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347

This series enables the HSMP driver on the Family 1Ah client platforms,
Models 80h-8Fh and E0h-E3h.

The client parts drive a different mailbox from the server HSMP
interface, but the latest BIOS describes it through ACPI _CRS/_DSD the
same way a server socket's mailbox is described, and the parts speak
the Ryzen Master SMC message set instead of the server message IDs.
Patches 1-2 teach the driver the message set and let the client reach
its mailbox through the existing _CRS/_DSD-driven MMIO path, leaving
server behaviour unchanged, and patch 3 adds the telemetry table those
parts return. Only the ACPI driver probes them.

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

Muralidhara M K (3):
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Document and expose client telemetry table in
    UAPI

 Documentation/arch/x86/amd_hsmp.rst  |  24 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 409 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |   3 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 265 ++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  23 ++
 5 files changed, 689 insertions(+), 35 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1

