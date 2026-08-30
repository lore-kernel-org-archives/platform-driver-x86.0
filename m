Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9E35C6AD;
	Sun, 30 Aug 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101006; cv=fail; b=M33W1NhJkQt7DzC+p49qltvbl42iQ4fQIsB7WcUoKNY2QHJ2+vBKAinATUA5tYAVCGEoovwTb3B7IvuEEZuXmvz9YqGIwZNHJCcqPxKMFUPt/iGb3fflfFmLTU5iRFeZAoLd5uBFJfFnj1BIOFu0tElwez5PDwoDJRUS+HPpIoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101006; c=relaxed/simple;
	bh=l+h2rk7Ls8dGzyuzOE61GWmQqku+tsqSEyP7gF3RL3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aUgZiCd6N4wQKY11JTw1Hgdyeft8sskM9XudjTQvus0nisifCjrYnBX3YRZI69/9hkP4Wa5aHEndMspz6VgNEQJ2VCf1/prt7dmYP2bdsGOcKd6VucHXcHxxlvMOkbDPvz8mjem5lFKhgC3HKNZ1b7RgkyfFfAs09XO0WVTH5jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qtps6qlk; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qtps6qlk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/AHfv4CjiibAPvyDci2+uwni7zr48F70LOk5QcApwCcgOgBTf1n46uWs2A4qs5MthJNggm7nXDQw6GzqFxMOcoqUyJzb+E1WjUTyjBF0Et68oqk3NDgXa5aa62M1CtL2qabsDpwytZHXmI7pRr8DWo7YHnkmCxi4B01z0g0dfHrIaPlyqVKv9KePLCkDiSkFgUNe7CJjxQjILzKFeIK+SC5Onq6uNcBhwmYEaSIuvDqB2hHgF+eNMQv7kPJcRPbeyunNMdHGu1xv/gUrdpIoQQFq4pt5Z7oSfjIE3zg2gqSREifrtzfHROC9JD6ACl8wLfSe9Nmd532j/5kuhqPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW94O9jdVYnBy5uF1TQzI28I+JnPSAmZVhCEUm7gMRw=;
 b=fCWAhK4IU+HSnkaE2AlZeLSjQhu48jky7qpfKt4lOVR5CabzdAFiTEwUaTjP39IqQJcU1zAWIpkrHLZRF26iKOPojYIEH+/FHL+POyVmC5NkRuwyzclDoWUv58vi7UQw42r2FC4z5bR3NSVT7+/P5Xcb8nfFjs+Ez52wWbot7gccZZXk49ll8MkrhNN7Agb6w5Fgr8wQg9zoDsLfoF3A8NzDNxPbditT96/OfVLqYoD3KvZn9tmkQf9QkvIhI0uVFbvU9fiNc8bJPK+EK08ZcryfJ4j+YUN/CvLCIvG2EaT9hAqddY8wMxvKByW9OcUq+iCNZ/Ng2IT9C0uYvBHIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW94O9jdVYnBy5uF1TQzI28I+JnPSAmZVhCEUm7gMRw=;
 b=qtps6qlkS/uNPC4UpRMuCl6GwhqbA4LS6Yj8LqGdY12OMipQ3xwKAS/gXEHHvQd7kZoWE/zbYzcK5h6nThuI1lGszCNzMS+0+JFdDuy2sIZ0wPXv8qGCFEqOaXIQY06RNOrIqGcPsA8KDjXozARGnY6oedwVzZKegnEkzRuUMVg=
Received: from BN9PR03CA0108.namprd03.prod.outlook.com (2603:10b6:408:fd::23)
 by SA0PR12MB4463.namprd12.prod.outlook.com (2603:10b6:806:92::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 14:43:19 +0000
Received: from LV8PEPF0000005B.namprd02.prod.outlook.com (2603:10b6:408:fd::4)
 by BN9PR03CA0108.outlook.office365.com (2603:10b6:408:fd::23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13
 via Frontend Transport; Sun, 30 Aug 2026 14:43:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005B.mail.protection.outlook.com (10.167.245.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 14:43:18 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 09:43:16 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Date: Sun, 30 Aug 2026 20:12:52 +0530
Message-ID: <20260830144256.2113643-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005B:EE_|SA0PR12MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: e8af8a17-cfa6-4f8f-f7b8-08df06a507f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	MK4TFBthvOng/GilVgRzPiGWEU0XB/+YAkir4vgEAIzidhrjtcIgIr9kpJgbj0DlGEhbcmXNLGaw6+zaM9WYX+/x/5LerGKaVeZ7l25vFyoEReWyf458eexhMXirikzSDgkP+J3hWP9fdVrLoPaRCoYBqIUEoXgUvZ1w6JHO1uDLlgQUAfikwZn8WPsV4V9GEdVREoFHqQ48GJn/2GgjXK8HKILAcKzeILmNbakUsDXBDCdBv777WmmZOmr2YNGAp/cuNruM4qJgKG/JmDlUQlI5FSGf3ZyVNeafSgYit6mcEqZqaoRtWjkLZz+dCe2FELPVnL9gr+ILDvoPZVsKin2MHhQhh1oIreVBlgVQxERLlKzvUxaTxCmQXyTTMWBwS+n51nzI/Yv1fcEne3LCilbpSbQezCFNSpm0b1vuln2esooseOnThMyFGt+BzUVJUoQWxvkISn2iKra6f1VuKo0HCGcoT6Q/jVf2lJiSh7cniybGYwIoxaFlRFAD0tN4JOUZxUOCRxxUTLqx2/viuZBc6Utl4HQCTWmrKc+hKbPASr+/EaaJC9Sb3O0xE/uHj72fj4UKOt7FlGvWVGPkMf6tLMo+KlsQFxBRwFz7l+Re+vcacFE8q13V08NljTenV3vHzQDAOPGOCulKUOoUTUkf6Biplc5hS56LWtu8oCqw5VHwjsVu0qA/AF+1HIa721DSsLZTrPTodvq/gJNnmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	st+5ldCDhmNxvKBhar1elv3q626qRYi7lgijAUH5/ouTTnEn9kkiqeln6sgI1bupaCoChJx9mZWs8Gp5dUSAkp2fjBXE5PbXX/DiyxtkaVgkgvZW7UmyGBkq8z7gH3J9yTqrUeeczv16JXzeNQNsSd2wscpPPb7ZxDHWBMx2wvkFpVZKiqMLgXShpLT/fuNr5B2RgPAM9LvCORjcx2zxtuuIbcl63jHUajiJg63znfWZ+R9k7J03gutMqhQeyqnfKxHL+CV0W/JVCcuuSNJ/+vkftFnlxCgHZPJPmqY4D/w3lMTywQ/FOQfA4+bDnFRbvMSiC4MJKIcI5ZXBwdLaqO7OM5PTJkHXMLOCZxwBW1IDxGJY+Vx2EyqeWqaY2JFRF7FN33BmRRLnx7nF7gPnfemeS/scItOumn8BVpgsGMuIdxQoimmjIc7amcZ/q/E2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 14:43:18.2090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8af8a17-cfa6-4f8f-f7b8-08df06a507f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463

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

Changes in v4:

  - SMU now answers the interface version query on client platforms,
    so hsmp_desc_client.proto_ver_msg goes back to
    HSMP_CLIENT_GET_INTERFACE_VER instead of
    HSMP_CLIENT_GET_METRICS_TABLE_VER.
  - Add Reviewed-by tag

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

Each patch builds individually at W=1 and is clean under
checkpatch.pl --strict, kernel-doc, codespell and the htmldocs build.

Muralidhara M K (4):
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
  platform/x86/amd/hsmp: Document and expose client telemetry table in
    UAPI

 Documentation/arch/x86/amd_hsmp.rst  |  24 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 398 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |   2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 269 +++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  27 ++
 5 files changed, 686 insertions(+), 34 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1

