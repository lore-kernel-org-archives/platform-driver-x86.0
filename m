Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BB73E2754;
	Thu, 25 Jun 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390853; cv=fail; b=HDIjxuEbpjtv3+WoUnFd7luHeXynumZUR+Om6iM5PDFA5zfDvscZ08bg1NzyAzxZHj+8aRWnCwSqYTN0xv3OlARdJ5f3Sgiv9krrTl4wamlFQUaFR+aN/ZlzpGCVSCJN0zmW/oH7UtOpTUCSJ6L6oG5F7s7Nnj5ZEyKaN6Xav3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390853; c=relaxed/simple;
	bh=7V08Y6c71+eMMiiN2T0wM/OAAi7wRb82XbP8FqAir5A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rgPJJjdTxDTLo/RQO4HRP2R+8QXTz5hq7QlnN4gDEtXITwTGlbum9QWHOTQ5CtaEJX5ZSuZthbN3wdrlXzJLpMxJ4u4yMNjYF5Lh2J0KyRnXXFoLgzc+CqE1tQTHFWk6J1r9gZpPn/tsVE/iG6gcBKseXydHFrRN+IkxjuSdAKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bY2TcAeP; arc=fail smtp.client-ip=40.93.194.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bY2TcAeP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaKLc4ue4ZJkdUtTtLKBMaLMXVbePcS1T/HsP/GUdwlcbmKECs6XktL2dy9FDIgVjWs3UwX69HoVKYRu8QVfudBmjsK0B4UG3O8vVKwTI0eEvFlTHigi6f37Ost0get1j1Ccmx3idvlmbU9/0xxRYNZ4fbbl6IY/2ZPFlxFcnF8q4NTKWB/bj1ym21TsvyE+8x7O8j+nlJM72hUvzcMpIJOI/94AHdx7PEnx1p/9lYNcHR6tAMDiw2gAju3czVwHgKe0wumkUopJejgMRWV95nnL/oOVR31rG/ch9PuwekuLXdvDs88mdS8MyvelWsBDon9cPyuS6WgSrnAYUTU4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWHEZPjBLTMcJD1tKWu9RlRVuUPPFEFeayq2/y8Nd1g=;
 b=bTYXcyzSUVw2q4ymh53Uw3sMdG/embL3NCaHRAiYuVG/QVRMRpKCl9vxWlxGsIRmBhD/nUwPhozhUmQXxlIQwyf8u4EkNuicI+IJ0lUDE6GBZVxxP0Un9CKh4n6LaEqr9ZShvvZSKJztJpRCTQlMVF8d0jZfnXXBiXS+R2dvBYourboSQStRN8iSS5/J7sdy0RuMi+6vZ2Y0J1QK8BE4bRIHPtQn+fdYKh8gn8oIxDAOAjvAqzX2V90yAJOeiYV4UhnltKLgvgimcM8+JJutr5jy/6fE1icce1VVtzKMgohOjeoJqu2CZo/iKNRnKIJdkB0IdbUCaatlZNrG8LIKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWHEZPjBLTMcJD1tKWu9RlRVuUPPFEFeayq2/y8Nd1g=;
 b=bY2TcAePC1bwgRjKaPnEoszPlh4/+TrHvIYC6TI+LSKN+bcXjzNuDwT9CfQkH6k2LYWJqFjtyvhfDAvZTPi69vlUUli2xyeP9HSL8iIayd9uWn/jY+TE+ECHLd1xCum/B0+sF9Gf71pd8PQ1uPDKxojgUevayiSugMeXQ/ebokc=
Received: from CH2PR17CA0011.namprd17.prod.outlook.com (2603:10b6:610:53::21)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 12:34:01 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::15) by CH2PR17CA0011.outlook.office365.com
 (2603:10b6:610:53::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 12:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:00 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:33:58 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 0/7] platform/x86/amd/hsmp: ACPI/platform HSMP concurrency and lifecycle hardening
Date: Thu, 25 Jun 2026 18:03:30 +0530
Message-ID: <20260625123337.886435-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ed2e64-14ec-4fe7-7b98-08ded2b608c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|13003099007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	CCEQzpmPddGAS3EJifX6whALBQNJSzuyMvuAQMp4kgRHW/rFqEtYyKs8OKmTCDHuqNpAOTE6ptEMmwmNQgQ9+iSkrWbFvY2e3z88UEMlBNgMFq81HaWXbqiq7d5TTG5I8oJP5hbjj3RQ2vz9FB4x0PipznvFlsZICRL8bMaeEWbMLk68Dmai6AJOr7zeA/UlPhCfIOHa7mPf+Yud5gXAywlKYtjeWWA4K8/OTxjRfvXKpQT5UdVaX5WR5G3wehnexDKWWkwtTWplGMfGGFSXPEPR9MkMkmzqMp8xPmHXSjEleJid14WqcqmTGdUltYAQPvaUnhLcGxJHi/18ydisj+ulWHqmN3V6sGlGe/njHN+tX58uyYrvpp6sQe1rqFZ+6PJfKv1xw31Er+hYDyIm0oIRlAodNVS832PFwvVvgDi1PsOD791aQJFnxGTNvgAIGg4ReZIzMuSiBkk9m1VH6E3o3y2eQ+JZAAL5sS2WaaJsO7VvZGMNmmAjzCsbftdL8v/pmJb2fywcKYUkifRCobolYDfP4fpIjU6MtzW3gui7cUh827bCUtmm4szuW+mJke6al9C4Oko2TF9xBbXiD/iJj2ebQktbqGeTd4M/qfbwWt5UqfD7oapWjW9sTV5VLFJEqTMEKThL+h4sYEIKcb/KQCMTBV5R5CfjKzmoqKFMHVHnq9dKMGKFvZxcuc/TOUYliXFDlB5pzmWe7EW3Yw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(13003099007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H7DVzPAXW575m9JFhn9tIq7jo6rxS8DWyiAK26evs4HqRZGUPLPnQ3LgmVUnS+HWPPHLYj90nVM+kBMgkwX9YZkhkwj1MBipYnFo8r+iFlnITOIDltBK9QQchowN46vnse1q63jB+pyRUF5jGjVq3MFxXZXzIJRYfJRoPVLLEAzzgcnMnrfjbqc8D8XfBusZKdIzAOlyl2ORzKWQhWemoe7JfG7cLFpugxf25Vd1CkrhLeNg2oFakvLXgLWbNsnNzz2ynDenuee5e6B/qr6G50cZKWoMF6ZUCzLj3MdqpOngFAbZECQ+x7tXOJkBHV5x8zKbiE/SqkwVC+D1kxnsZDmNrvn5fib0apIvpO5HtPqTLPpKoAurhcZYd9Puw1B8DejFV3fnidud56AD++rpihHsKtY0XDEwKmDVxPa6PF6TowCLCEuk6EbcTqMiVQUg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:00.5684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ed2e64-14ec-4fe7-7b98-08ded2b608c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368

This series hardens the AMD HSMP ACPI and platform drivers against
probe/remove concurrency, use-after-free of the per-socket state, and
resource leaks across unbind/rebind cycles.

On multi-socket systems several ACPI platform devices are probed and
removed independently while a single /dev/hsmp (and the hwmon sysfs
attributes) drive a lock-free data plane.  The existing code raced the
global is_probed handshake and the one-time socket allocation, published
the per-socket readiness gate before the mailbox was mapped, freed the
socket array from under in-flight hsmp_send_message() callers, and leaked
metric-table mappings on rebind.

The patches, in order:

  1. Serialize ACPI probe/remove/init_acpi() with a dedicated mutex.
  2. Validate the ACPI UID and _DSD mailbox package against malformed
     firmware before dereferencing them.
  3. Map the metric-table DRAM explicitly and add per-socket mutexes.
  4. Publish sock->dev last with smp_store_release() and read it with
     smp_load_acquire() so a message can never reach a socket still in
     bring-up.
  5. Add hsmp_sock_rwsem so the lock-free data plane is drained and kept
     out while a socket is torn down; wire the platform path into it.
  6. Refcount the ACPI socket platform devices with struct kref and run a
     coordinated release on the final put (deregister /dev/hsmp, unmap
     metric DRAM, free the socket array); clear per-socket dev under the
     teardown write lock on remove and probe failure.
  7. Drop any stale metric-table mapping before remapping on rebind.

Testing:
  - Each patch builds individually (W=1) with no new warnings; the series
    is bisectable.
  - checkpatch.pl --strict is clean on every patch.

Changes since v1:
  - Split the work into smaller, single-purpose patches for review.
  - Added ACPI UID / _DSD mailbox package validation (new patch).
  - Replaced the synchronous devm free of the socket array with a kref
    based, coordinated release and serialized it against the data plane
    via a new rwsem; clear the per-socket dev under the write lock on
    both remove and probe-failure paths.
  - Added smp_store_release()/smp_load_acquire() ordering on sock->dev so
    the readiness gate cannot be observed before the mailbox is mapped.
  - Wired the non-ACPI platform path into the same teardown drain and
    fixed the metric-table mapping leak on unbind/rebind.

v1: https://lore.kernel.org/platform-driver-x86/eb609912-1c42-6354-22e6-5ffd1f097e9f@linux.intel.com/T/#t

Muralidhara M K (7):
  platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
    mutex
  platform/x86/amd/hsmp: Validate ACPI UID and _DSD mailbox package
  platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket
    mutexes
  platform/x86/amd/hsmp: Gate the data plane on a fully initialized
    socket
  platform/x86/amd/hsmp: Serialize the data plane against socket
    teardown
  platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
    release
  platform/x86/amd/hsmp: Drop stale metric table mapping on rebind

 drivers/platform/x86/amd/hsmp/acpi.c | 188 +++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.c | 116 ++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |  11 +-
 drivers/platform/x86/amd/hsmp/plat.c |  39 +++++-
 4 files changed, 318 insertions(+), 36 deletions(-)

-- 
2.43.0

