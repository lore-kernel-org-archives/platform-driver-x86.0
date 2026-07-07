Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB4E420861;
	Tue,  7 Jul 2026 05:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401366; cv=fail; b=qm2NK3Q62zRNP6G2wtkFZUKfywOK64JKWtEH2FGm7HCrP5sB3ied0ktx3oAg/z6DUwDIGpjsTUn4JZmAlyqbwohrzlGUFI5iaFwL5GlfI1hFemZQqNvV/QHYYaIug050ZYOnRocgU+iUwZ62w2qq9KJH5HJ7AWikNtoCt/8mgE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401366; c=relaxed/simple;
	bh=1s95H4IgshmzK1jYEC7h+RY6YLAizGiU8NGvLGrtZu4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mvvgu6/8q0TkbmmQTVfy3l7aQwKZ1yyI4CSJwBbKz3xPGSUeC9gJFbleDdmZoVZZVw1djy7QC6IqH9Mz1aezbBZo49wdjcaWE0l7jb7TbYwRSoESEsMvrQncDBauoKPxZCIT1Gdk92Acq4YojR6G3VoUEp4R5dWn4ofNdUqwzqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J4baNBWJ; arc=fail smtp.client-ip=52.101.56.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J4baNBWJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVb6TAVgLw+eYOVBXswSNfLr5zDJFrlVXPBBVjfn9akyzxl5Dan648XmceZyXTgakSuSltUh6mKUroHk2f5CzzrfHI/37DfT+G7VIK9j+J5KtSbH2g646ISBF/n7PcgeoAC1FszDl3hXpIfGaKqzX8Qciox+Q79V+f1uogBwAMnFsaoETYYC1ur0mi/suCSFaRNkOwI42WeQTE8Z/TcPMzdKJp9EwSAlMU8EeReB7kAlRhwjY+jeK1LsKJ49kp3GyHGwYGYsD0dpNwgc/4rNr5dZKDCGK1QYkgq+n9Go5o4jO1C6mwajO7451GPckoFPeWeTOXjMn52ITJSK7lcvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXUre6caHqK+fqFplA5A0w8c1vvuq+5rSKg9AqIo0zU=;
 b=nd15fMvkCZyTE+anjVcHOT2tuf0jdy3plsCU/tvGwBWvu0okoXqTcQ7Sv0d5Kzrpk98SCq47JP5vYP88PJd0WNWWZTsi08d5mJRDT/wb5O2UJ74v9OANjTp6gCbvnwouzPam4zaBqxWjY1re9P9G76bTcriJQ/uXx+ZuHwCB6LFwXg36+bsisuXXFkkdqYOMaCZTKwxuKsJnl/azBZVs3sczIkCmKUj8PtaLDq+AU9SEVQ3gPdX5D1nVPRaPp1wgbm/85kkR7AijPbJbo7jgmAq+G0b6mLBKkNUuLr4FmYpjGgliM8ghUws1EjADBTCB0Qr2rmja3R+YJE9RnHqoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXUre6caHqK+fqFplA5A0w8c1vvuq+5rSKg9AqIo0zU=;
 b=J4baNBWJO+44zTULvaNJisEXuvhM1vghfVatCC1MHFVuvmB6DnqskhyRX4FjtxPr/99QjUkF7rkWB9KVsR2StqZ2/SEjSfBx/ASRepsvp1aSdnPdLJ4b+rAXOShxEhKASD18/c9jybbDx/79sgdjuQDQVV9gSTqRaTPff9X3P4g=
Received: from MN0P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::19)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Tue, 7 Jul
 2026 05:15:57 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::2d) by MN0P221CA0016.outlook.office365.com
 (2603:10b6:208:52a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 05:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:15:56 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:15:54 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 0/5] platform/x86/amd/hsmp: ACPI/platform HSMP concurrency and lifecycle hardening
Date: Tue, 7 Jul 2026 10:45:34 +0530
Message-ID: <20260707051534.3381387-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1a3ae8-73d3-4ba1-ee31-08dedbe6d361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|13003099007|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Wo9Qu6ivQFPMFkdL0IKohLMZzRR0NkRL2SyutpVjKv8ot9fTHO8uBsNdHMxVr8tfsP4V4Vc4COidVFL/NZ01yb0REUUPg6qeyQ9NPXJH5LdcU1tdwmNCOOD1bcwqrpCZajFOdV/mrBncM+a1Y1us/qCZijBl+LY9FoU23Ldpw+zNPwIdAyRaIrtU886OWQ8Hj061s1bqfUBYbhN9/kVQBVtFGebCRe8HKmZNGFhlJwH9pPQsGWfAG5nJk54+qAYwWOIa1JACLSR5845ikd/TTGITP2olsJwcyzfSMSCebQO6jv+0IVBfXK3ewVAiORDuKQppTRTjUfoyLw/Ek1HNlSoCIvGw5b6vSP7PyJT75sPBbr4smIxveakTB/xFl5G0P0PedA69b9VC7ZjiSM2cXByzafQ99k3aICwOR8zKZzvcgd0DipjPNrP2tbnHDyb06q8vOIKnt2OT387Rc7fCr3DDyM7uu28XaXl8LGPF/xNYuM70lCtx0GOB90QtOO/dbV5Tm28wMvg+/x0AqroH5xb9+C6G53VHCZcEARbWkiVZDZZOuWiPZATIsHLF90BelRooT1Tp8F9sawYABnike1CFBuMFHlbg5no94Kq2nCq5VyljhFXagOsOZtwGBoV98HVrEeo48Icxax3ui2kiW+x2C6LxQ+8Jt3S5ZvbrD1A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3BiYbKsPiKXpx3aA61azhFi4bUwXLSySpx+zwfPYb0YnIdb0LG1PmHiL6fMJ6qw6yfs8KlQpS+IWSkkqm2oSxKDJoaOvOdMph6V7xmUMqhSrcgSXNt7lAnaSekO3+GKZ4yllOU7EwFrQLDM9cT60Do+ZFPVlVwxtd/tIyOLFgdmzaqfgQSLwLNY+XZBJs/uzduGJduck4UJGplIHPm5rI1lN0ogdW/OZZZVd+iwg6+etrOHv0lRmdgb9MW5hIX5UisBvS9F1grQQJfi0jgpmExR+P7EDlO7Le95G5p/FHE2RX0TEoJhnTrG6Gu/VXg095ZLihloGd0Y31lo1rtkVqip8WxXuR8xMrqDSBHDTLvDWoMqt/5zFbVXR0Tp2TPcCOA7/D9coF+k9OFAr8r8zO0I4UfoALwjDaufZmYC3nY9+/+oWnIhwC2HZD311pncH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:15:56.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1a3ae8-73d3-4ba1-ee31-08dedbe6d361
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627

This series hardens the AMD HSMP ACPI and platform drivers against
probe/remove concurrency, use-after-free of the per-socket state, and
resource leaks across unbind/rebind cycles.

On multi-socket systems several ACPI platform devices are probed and
removed independently while a single /dev/hsmp and the hwmon sysfs
attributes drive a lock-free data plane.  The existing code raced the
global is_probed handshake and the one-time socket allocation, freed the
socket array from under in-flight hsmp_send_message() callers, and leaked
metric-table mappings on rebind.

It sits on top of the ACPI mailbox-parsing and data-plane readiness
cleanups (base commit ff7836fa, "Gate the data plane on a fully
initialized socket").

The patches, in order:

  1. Serialize ACPI probe/remove/init_acpi() with a dedicated mutex so the
     is_probed handshake and the one-time socket allocation cannot race.
  2. Map the metric-table DRAM explicitly with ioremap() and unmap it from
     the driver teardown paths, so the mapping is no longer pinned to a
     per-socket devres scope and the ACPI side can coordinate its release.
  3. Serialize per-socket metric-table reads with a mutex so two concurrent
     metrics_bin readers cannot have one trigger a fresh firmware fill while
     the other is mid-copy and return a torn snapshot.  The mutex is
     initialized on both the platform and ACPI probe paths in this same
     patch so no bisection point reads metrics_bin through an uninitialized
     lock.
  4. Replace the global is_probed flag with refcounted ACPI socket
     ownership (a probe-mutex-guarded counter) and run a coordinated release
     on the last unbind: deregister /dev/hsmp, unmap the metric DRAM,
     destroy the per-socket mutexes and free the socket array.  Also drop a
     stale metric-table mapping before remapping on rebind, and stop
     parenting the shared /dev/hsmp to a per-socket device.
  5. Add hsmp_sock_rwsem so the lock-free data plane (hsmp_send_message()
     and its MMIO access) is drained and kept out while a socket is torn
     down; wire both the platform and ACPI teardown paths into it, nested
     inside the ACPI probe mutex.

Testing:
  - Each patch builds individually with no new warnings; the series is
    bisectable.
  - checkpatch.pl --strict --codespell is clean on every patch.

Changes since v2:
  - Split the old "Add explicit metric DRAM mapping and per-socket mutexes"
    patch into two single-purpose patches: the ioremap()/unmap mapping
    change (patch 2) and the per-socket read-serialization mutex (patch 3).
  - Replaced the struct kref ACPI socket refcount with a simpler counter
    guarded by the existing probe mutex, and folded the coordinated
    release, the stale-metric-mapping-on-rebind fix and the /dev/hsmp
    parent fix into that one patch (patch 4).
  - Decoupled the metric-table unmap (hsmp_unmap_metric_tbls()) from the
    mutex teardown (hsmp_destroy_metric_read_locks()) so each helper does
    exactly one thing.
  - Wired the ACPI metric-read mutex init/destroy in the same patch that
    introduces the mutex, closing a bisection window where an ACPI
    metrics_bin read could lock an uninitialized mutex.
  - Reordered the series so all hsmp_sock_rwsem writers (platform and ACPI
    teardown) land together in the final patch.

v2: https://lore.kernel.org/platform-driver-x86/eb609912-1c42-6354-22e6-5ffd1f097e9f@linux.intel.com/T/#t

Muralidhara M K (5):
  platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
    mutex
  platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap
    it explicitly
  platform/x86/amd/hsmp: Serialize per-socket metric table reads with a
    mutex
  platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
    release
  platform/x86/amd/hsmp: Serialize the data plane against socket
    teardown

 drivers/platform/x86/amd/hsmp/acpi.c | 130 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 118 +++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |  16 +++-
 drivers/platform/x86/amd/hsmp/plat.c |  42 ++++++++-
 4 files changed, 286 insertions(+), 20 deletions(-)


base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
-- 
2.34.1

