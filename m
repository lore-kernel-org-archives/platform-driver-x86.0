Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8586379C3C;
	Tue,  1 Sep 2026 04:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238317; cv=fail; b=P45GOtrNVePWFMabWvQUQ4cGIMzckAgcnHt0BUzhxN6pGdbSeHuwhm1HFRi83Wqw5XsyRskDsB1YIH8WWzkHvlKBEZlenYFihev5S9TOsPMZczXMJ19L8eWGdVCVh9/Vrc0htrDHSs9dBz/GUkIp64jyJSPDpUH3Wzt1UdHO/WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238317; c=relaxed/simple;
	bh=pryc3uFrIFyo9PvZU8VYXcQ7RIgkD1zAg6m+bmHqBCI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OnNdD/JToGbdzPDWGSBCiyV0B2itYHMdXo9cI503VHg86htgun2TOsyZezVmNGYwPEDJbnWgYGSrEBXcUXDocMGJdz7XFIsagYC1hLs333ACexHlklx890M8dW6jh6gHmB679iJl90jsY7ICAxbe56g6GxICMB7Oc0auw6X4FuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IVNnfy9e; arc=fail smtp.client-ip=52.101.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IVNnfy9e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amv5SzJWsKgj5SPOMeksiuazirn+R+HMh+v9efwODCn6IkvvI0zdUkacOs4vzAT2R9BRSr4+7UjbK72fIKns40NglI6dQNJR5Fb3DhOs+OeMU76DvyO7/fuanO/eCSk5o7QS7Ol3ImhmLacrPd+2jJnv6W/y8l9PDJpr6INQ5yubnDDxoVa5PFpc0Q8HNt0bYsazEj76ueSEFG1Jabs76pD07bdYQXIx8iW4t4aBEJLSjfAFOFRpwfrzKNODZjGSZVturx1rsMZPwJMEq0D5/c2qNImH90srLODjn0W0Uja5plfs76Pe3Rj9oQ116tgYk7YK3J3xnaLRr/3s29dpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbCSAaAckDKTdLHiKubPwtRO+Q5akYyp5poaN6jrgq4=;
 b=xXHFeIGEfTlmbyRhMYr3K/2Zilm1lvZnVgOx6UxjqKW6UVLHu0dlqbdzTuIr0FYroe02fud3noglQawBODdYic8x4qNHcZxCaj4lxFhG8AOzrqZpGiZiYNCP9PCqK5HzuauYWcugmtnmHkC5Z5PC+3/oo/PJGxsZWWB4DgDe+T++kdOPviqHnAswWC1otmCsYnC+nB3mzrqDEUHqM1C6AunmBHlA/n+LMenMUK25WR8Ibal//0P6Tz3zsCV2t2YK9hR8fIhgVUDgQ4VVNwg0vfgmtTcqOqe8IA3Bgd+W+jkSV1hCXpE+WMA+iMV9zAIH+30R0uaw8NtytF88Nq4pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbCSAaAckDKTdLHiKubPwtRO+Q5akYyp5poaN6jrgq4=;
 b=IVNnfy9efIifk6JCxcJ2YLvkpc/VCUjUdpBEMbgVbMytbpNJCzqWoNpTKnOFXQn6nBrmmrfB5aE+PZbKvWFRY5rVPR9zVAn6uI23rFr+H3oXj5kyLTeLphmGKC9E358KpBt8o2RuAxwIh5BLMUKdQ7pKDVuXO+cNNxFJOTZBnx0=
Received: from SA9PR10CA0006.namprd10.prod.outlook.com (2603:10b6:806:a7::11)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 04:51:51 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::72) by SA9PR10CA0006.outlook.office365.com
 (2603:10b6:806:a7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 04:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 04:51:50 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 23:51:48 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Date: Tue, 1 Sep 2026 10:21:30 +0530
Message-ID: <20260901045134.2833282-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 218766c4-3258-4527-5309-08df07e4bc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|56012099006|3023799007|6133799003|11063799006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	218d+fDVuMRRv3rLQkZH1L0+LHFe4iPKHkvbNu3fRnvmZ/+bF8zdYbjJUrU80HXX8gAFEw8nThjzOyALnYZt0FIi7NpdVPdjOP+ognjtvT9FPKKxaHk3MvuPOmgQt43oYIwmEXzeem6VXL5yMzriChjKvNGeU58I2aTYUrt9XwV3EBhqDF/pMz6SkhIPcKfzqwRAqsWPZNUoJbmrqo9N2/drT+u3y9qsu6PHm1SdIqXlHA+K4RgvcxOcr9j0kWdqQgoanqCWiH2x5CfQtsGkcuLwzVuANg1OvTJmzZGk/HgDw2wWRnFz6CPhDt5deU3124fhbP6Sl6AWUAHELawwStdg0qTyzdNRxEDedU68Z3FpRU58RGZAn53g2Fo1yRI3EeA67RG123A3+vpa9mq8WqDImANYFKm0RYl7weBzVNrJElVO5u6P86Bq8f7A6wGBzOtTe5iCOAGh1ejfOO6Y+CIzZxMXfdcoz0MboLYkUK9z1bhEWqs3Rej2xp6ORUFR9KuL/SRl/5HE4Hs3mN6qAUVTrA3Yb2Liv0i4zXZq/jQ7h/oHq1FYRSY7EXIeO4vLuSqo+CdPocJ3BaFiBZ/vvss33yNi/lYk4QV9rrZn1ezyyKmSyHYEJpW59aGa6hGykVOK6y7z+GWl8RB5WLt09Txs8Gv2HDmBZxDUc3M6HtxObYJ63MiMPEZvAQWtSk6hDaDa/Djc8HNqNxjfNVvAjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(3023799007)(6133799003)(11063799006)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NJEiHjNL+dHyX7IvQFqpXu53AQIRpu3Y/mxBIRIMluhpKYwVLQUR7Owmn873CZ/Q1ifh4CqTKmM2ykSpnNc9jGL8QmARm6KiyjAUojnD+vPfuXYy0fi0epk5onq1N8JIrr1yWB92VK40n0ZkJ+kCoArYpT9EvXNAZTRxjy7bpp34hsXm9qB1PYMGQJYTh/OQKk+31O+p97Q3mt1qU+ZuOf1HT3kKpcOIFKtyYd4ReamKBQHxEx5sCMmI6VqVkg7rapOnYPal+mVU0pu4eG69364aR29hBPH4UyfChE8GbgcwH6/8L9UESzSiq1u0InUvkCnulQGL3+P7uqZjzj56uPP9X8vVntub0Q9F8YWT9esje0MQcc4HnBaClA+vScvGNeRGdvsiEiinqrO1qdRfmY6hfqwyasyNxmP3Em6arCupvFvRiWLi38QyQnDj4UxL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 04:51:50.7116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 218766c4-3258-4527-5309-08df07e4bc95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064

This series enables the HSMP driver on the Family 1Ah client platforms,
Models 80h-8Fh and E0h-E3h.

The client parts drive a different mailbox from the server HSMP
interface, but the latest BIOS describes it through ACPI _CRS/_DSD the
same way a server socket's mailbox is described, and the parts speak
the Ryzen Master SMC message set instead of the server message IDs.
Patches 1-3 teach the driver the message set and let the client reach
its mailbox through the existing _CRS/_DSD-driven MMIO path, leaving
server behaviour unchanged, and patch 4 includes the telemetry table
those parts return. Only the ACPI driver probes them.

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

Each patch builds individually and is clean under checkpatch.pl.

Muralidhara M K (4):
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
  platform/x86/amd/hsmp: Document and expose client telemetry table in
    UAPI

 Documentation/arch/x86/amd_hsmp.rst  |  24 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 407 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |   3 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 269 +++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  27 ++
 5 files changed, 696 insertions(+), 34 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1

