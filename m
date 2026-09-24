Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011047.outbound.protection.outlook.com [52.101.57.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854864A092E;
	Thu, 24 Sep 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265012; cv=fail; b=SMSzjfOyL3AgsHBhTICxV4+Blm7IoBVviU1wSGRbB/Z58CKqZ7S7B+FPGDNqHi96KNiq/g38qqtF+v4YFzBxGdy4pQCfmMoJaoMNdl+hMiwX6Pr2j7SkQQ+4I1Bm1Xi9qPP7ajzbs4TRsHECDDAAVxF5lhWvAOZx3Fik0VIvD9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265012; c=relaxed/simple;
	bh=LxPIu3uzfd7QLl6XbM5nCQcGSNkrFhWGu4dTa27gKhQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T+IMCnnt8750gzHvALtUdMJjoxIWp5/FQdwHHI49pKhmm1LoR/9aoLi7xjMz0iyR8dJZKfURIHS/RQ51zNG6QHEQ/xyUpBhTGhgUP9tkZ4jAUPVVAhqn8c6Wr33KuhkwsK96Q3Kte359nqVV6nsqtrcDgr9+C3G/rAgh54OAuAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4AdHxP+s; arc=fail smtp.client-ip=52.101.57.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4AdHxP+s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Auc0smO5anys4MjYGuCVf2B5LAUvk5GiB2Wk8rLfNYCjmiloSgauyymp+yEo6Hyh6Ph6QDzxiebN/kLdxCFyL6M3eUm+jG7fZsD/nP4j45eGPoLEzEBtFfDwQ6Hctbm3bb28AOteErHFqcfTgPaYHF+Lifd4hNlMBgqUggGP+lG1zF6ybQ1j7wHOkYQdXMynnSTjy/1eVNt9b4vzzkU2HismV8kKO4WnhXSMdgSiUiflMri3Qf7RjdFfvWVUJ5O/uVthLqtvXrPfiEEcSdxBLQfOcvItMLZUvDg93ewxoB0RoUa97NivUblnES1VzKolbUdn9mZK2X1CqkOO2YwjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmLxPZvDlFUCK60DcqFoZT1a/EnDu1msFlxdc5QB5nc=;
 b=M3mgFQhQ7NCeldPwS/JB7LA2FepaGUTev3v/ZcmRACOK+YfIeLtdGb3IyFkijG0MalNxIVjnXbWo7nNlwJegCcO31TRMTUgpoegzcVTXz6Y1dEp32hUvSF+9pRKnsauB+AspfI5WZGijgk1TpexAZ+p2vSkbNXxTkERjmXBziAwopwUoXwZjVTWjRgQqZHY6PHOhM8nNHoT03k//faoqG81U2c4/VJxqsBIv8O4uBceJ+CCtSRA5RrFEatvAmISX9o/psmTaSh7Dt4wNIfwQ8dCMo4i1+/oOBBYV56el6Bdxxx+7lr3OVHtzyFukcG0TBJWNcrhjPSVRGQ6gUbgHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmLxPZvDlFUCK60DcqFoZT1a/EnDu1msFlxdc5QB5nc=;
 b=4AdHxP+sFfC0ILALUH+RVQ8Xa5erHTu//AROPTvXaQF1/Y1a+nYlfMupZm0T/GUiLhKgZ3EnabGxkRRIteC3J70Qk1DWXfpkoIUQW5ICKSX1abfqfuoA/VL4YhHMuA/+dC21sriQBRN+GQ9m3J166m9wOUoDP14+Uia8x97JJIo=
Received: from MW4PR04CA0037.namprd04.prod.outlook.com (2603:10b6:303:6a::12)
 by PH6PR12MB805463.namprd12.prod.outlook.com (2603:10b6:510:3fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:50:06 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:303:6a:cafe::9e) by MW4PR04CA0037.outlook.office365.com
 (2603:10b6:303:6a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 15:50:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:50:04 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 10:50:01 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Date: Thu, 24 Sep 2026 21:19:43 +0530
Message-ID: <20260924154947.1706669-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|PH6PR12MB805463:EE_
X-MS-Office365-Filtering-Correlation-Id: 72aa9286-42c4-4b6c-5cdd-08df1a53805a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	m28vdrFCxpnfns3LGJSbyilZamjFyLe/xAmTIuWiA7nNDPnFcIgTW87oUAKWioz4jSD22bX5hs+hqSSBQ5WvbMvpIG5Q2d9RTnplf8nVLK+bMLKIfmjHBB4yQagaqXbFknqSB9D4XQYyVO6C/2HeFafiOq9Yf06F6MsEAAq62Q6ORgMHnS23oZsZKXg3yYRfxSybmlw+XZ7uY4uGg5bGvVzd/ne+v7ZPK9z86p0rQ0oRV0vWHMPH9qEQydUNYFILKMZWyq2K5YutQHpoHPz84NpAQWhxSV5eFqtans24MQ6ZNpKxGCpUKcBbWNHL+ui1TkXg2tToYVCnbZeoWA5INxX8BB5OrWg6eKLqehtcZpxVWOZ48EYo1eS4DIBHcERoJKVoVMTrg+pb6Z7z/S8OIr48msX6OLVsgozwW3Zh7EYgUUvAIEvhUhLGWcN8l74q7NJ1HCcETssEQuYD5jf9/9H00/Ykbje3xfeW0tH5eMstx/CCHx/bqtpUY6flLzc6vwGlwWnIsQK7sVde+I+Qi+N+0uQZQ0/DSkKvGcCYadu+NuCbEPhLOG81niNiw+Ls5MMUUm5g/QzdkkW30znRoBWAEBCha5L6Wk5IMlR3T9OI0kjwlpTIgec+ifZ4HnNM04SoUR8d4T7yP/m2l9RGWaL+f9PALAcPTcM6vyEX9Ec6bcD+SODip8gq/HHlm/QvRqGbQZlf+V8TBSuxcvyj3w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vsGp61dCThp6s9oHIrzB26BjqPPLAMLdR5ezVAToTN41uXxz4xzHQ+OKTCeTOefjT46yIhCTQOcXuk2RuQfb97HTU2+DbIZGpu3L77nW/9/yJ9E6MiJCoASvL47O+AUOpxGK4MWWGN/vuF/mF/s279oMSBo85yjPs163Mt0yStjUZcjttYOYUX6FGPQdH2ValgDlKPk+bLTLF89TTiyCp0+BizCjy0qf3gvzCifsS/SLnbBQg/9JvixiPaU7H42MCDrsVKVdYyQTh9+Ezzn2tqurlbUzQL0kfWRIsmzzpxIvXGbqPQ7OGI26iRe9uElbmA4finyH9xw4ftrHSJAY1ExIqTvsGU1tGGuMCn9Y08836QuHvyRg1zO/7l9hxZEwwg26ZOerM6TfgsWBTZ2+0bufoB9bvEnaYy5vRdgMyCNFpkIGmuTCnh/RAQ9jxBD5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:50:04.7257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72aa9286-42c4-4b6c-5cdd-08df1a53805a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB805463

This series enables the HSMP driver on the Family 1Ah client platforms,
Models 80h-8Fh and E0h-E3h.

The client parts drive a different mailbox from the server HSMP
interface, but the latest BIOS describes it through ACPI _CRS/_DSD the
same way a server socket's mailbox is described, and the parts speak
the Ryzen Master SMC message set instead of the server message IDs.
Patch 1 teaches the driver the message set and lets the client reach
its mailbox through the existing _CRS/_DSD-driven MMIO path, leaving
server behaviour unchanged. Patch 2 wires the client's own metric-table
messages into the existing metric-table read path. Patch 3 hides the
pre-existing hwmon and ACPI sysfs attributes on client platforms, since
those predate the client message set and are wired to hardcoded server
message IDs that mostly resolve to unrelated, sometimes destructive,
client commands. Patch 4 adds the telemetry table those parts return.
Only the ACPI driver probes them.

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
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Hide server-only attributes on client platforms
  platform/x86/amd/hsmp: Document and expose client telemetry table in
    UAPI

 Documentation/arch/x86/amd_hsmp.rst  |  24 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 420 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |  32 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 249 ++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.h |  23 ++
 5 files changed, 681 insertions(+), 67 deletions(-)

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1
