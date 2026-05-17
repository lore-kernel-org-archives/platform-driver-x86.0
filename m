Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0848C1C84A2;
	Sun, 17 May 2026 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030763; cv=fail; b=FDAq+mPvE+bhtuvFW3EAyBUyGg4a0NMg6gmFjmzqRwm1vg7XnHsJZvlG+RgIjGhpSkxhIv5H5WIvor9UjuKikRRTFnbqxYOAwFXE9135r4I97z85CUsMYb5TrmqFwZF08IRCzhxzhVJS7IBX3zsg28tyKpaykB6hfOIw8Dg0xy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030763; c=relaxed/simple;
	bh=q3vSaNQfqFWU4FD+7jcdHFGcWo9nNjThb7AXsf9J40M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eppHrP9seDAYNgylebPSTP8HKjRN52xfWU/aEvBzigNlCc2Ci2uM+eFIYR1Zmlu/qaUOiZ0zF1CsBqKEa9T9G37T0wbo7yAUseRIssmZpB4DeqOEuPxijcEczP3wuXHC82ZU7anLQVum25L/7Rpc5loVz7guO3es0Sl1JrkZv3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IOM9nPJl; arc=fail smtp.client-ip=40.107.208.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IOM9nPJl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uivQggc7deKEeu9jq93SBjXQkxXXiaRYaQwaTjlT+dm008uimqdZ8Sm11ftQbShORBHWwtKsEYqh0wvfS6MXRNxLUez+rajphms3rv/rO1RMu9JJYlfFpZfRRIPVFGzod9s/p9hfdhifNEVmrkcwdalMBpw06jKND9lWw/qJwMGY/uDKle7dHosSko5U4If4YTBT8a/4HjE6KqAaNTg8nR4gUBf0aQ3Sm+YHRjpggTooCMJDTq04+9JLWkaytcjzvq0u72/oj/SSejHAzFA+jTSzKx+m9Unldf0xn/lVVp9cHQkoX7t9HWnUkQgyE4WnepsOrJgIe1b//vQN8t3XCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0KJDSADaXGATlzDWV1GFJhP57fRn0qfC1c31BWT1y0=;
 b=kd3kR4JuUW1DFnaBsQeYKCb+OIw7aroy+yxEwtVaBL7DiyRZs+cRAGfA4cfykbC3dLQp1NCZFVjlyRGpKowO5kPNGzRBnCmE1L1oGVl7MklxYIj5YXg69ALcat84jT69ZcxZSPW9J+t3s4NXBDTo9Fu/bABzkKsl6JRMd3UuD++LOb4HGZjGl6WZNrFsaZbMWLFOrxpjwssLF1u1f2KZcGI3v43o92A353nx6ULSR94c4nj1AKknXVNu60QZGCoblnt8WSbkMFLasIuwG9umRBvKiq8gzrB0DpRByIN0NKOefADQUVZCPidzG+4AmTubQbfZ31NpWRPZBF1IT7cJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0KJDSADaXGATlzDWV1GFJhP57fRn0qfC1c31BWT1y0=;
 b=IOM9nPJlZWcruXiwHpdx5Ko0Hg6ajmsa0EtE0cUQD4Nys1UGgYn17maDKHH9f5+v25G7jHFYdAOURAAhZ6g399wI3BXD5JCWbTfQd4cnWV9HPaImCNlrixGM5AQruknk/nF/eNRyExoRABOK66DaL2GjE+ypcj/Y4Zcyh7Raa/I=
Received: from MW4PR03CA0254.namprd03.prod.outlook.com (2603:10b6:303:b4::19)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sun, 17 May
 2026 15:12:37 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::ed) by MW4PR03CA0254.outlook.office365.com
 (2603:10b6:303:b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.22 via Frontend Transport; Sun, 17
 May 2026 15:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:37 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:34 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 0/7] platform/x86/amd/hsmp: Add support for Family 1Ah, Model 50h-5Fh
Date: Sun, 17 May 2026 20:42:04 +0530
Message-ID: <20260517151211.415627-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 777a71d2-e330-4240-1865-08deb426baf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	vIGD2NMmpaG+H/nXJb8PaQgHb1WIaLw79WLsOkdr72B9rjWHdDPdWhsUkKrpKXIEvNZnouoQUD4+qH70bvddMAP1LB+Fq4YkgJhloms1a19tsFc3PGqJBZwL3w7hACgjSs3N6xKCQQmC3gS2ewraMJK9jVCxvxKfJ76sOZdFjIqY/f/0AUBjgH2GLColyCsvm1iv9U/oJ4CmIGR7j41t+NHQKLDLyt4L5wm9KLtSpMuOk5kkQpAU+z9m2IxdZimQMHf66jfnJLuMuY0a7kcJoHpSxfzxxRMmqCpZ9ObGjeETaxcqCOmJTzHVH0WIrSq5r9HMfWW9LqhcAAYgMLnWMjKyA0o1ry93AGdTo5Hou1DwBk5cmgOXX+de6FO889nO2+J4eh68QXSB8fQ8T0mVD4SpzqFTLD4EH7Mi4MQKJHjJZfUajtUVbfqOIAZEnoqbQIp20dPQm9W/66CREtTXNmpa20LdLwjQmsAioc+9/McWMFZ0PThYkaCMk09T3TdnkEb4RR5BV5VA2JhE7cbEiZM/Y8j6P0ctSey5NaVOT4t9grz1ydu7Ey62li/IopdfZqJAb/UnQeWg5V4S9ZU0e9TQbPqWu4fmaL+TSWVv9qrp7mzCqao1keAZAR2L9NOBgh4tB73X/5fPPnXpFLyo7rveSnHCOGgjb9QZgm4yZYaOUswVKPXXi2g2+FTdT3xRYfyVjvZ/uevmn3kgLiAZ8Gp6R+1m6nzV0urofq3a2A8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bu6n9pegDL8XbIvLe7ORWWZM6VEqVH0wdj4QGm4D7BfNyPXhJRZvJC8GsFKJjbOP8Kqv/NEVMh4Bmiysi2pvnn6ibMtc7mADHUVhtCApHp4z4o0OexdfLaq4Qq1MjRF5YhIEwgBSvYqrwhrC2yMByBFOv53FYfdsnl7vNdnWU45vLLat/7iU3v9X9RL4DK8RgDvuTbJjwlTQXv1ZP7cr+2D/AV/wm7TPMaZBtZqhxZbNnaF5h/xap/D2jSyyMEftWEFCSYPr8xoKZsDt+15F+FLdRNQTSXYMhGX5ZI5r0oucNJ8zPa8+GjQrDW4b/zYnRNJZEg7WtR8tX/aBTtqG6y0b5PV8rcw5PXKN4iF5cJfEclfQLV7mJ/IT48ILIqxh5VdRN0KYU+z7TDJg9EYg1WHL5HM/rJ5t2UMgjKT84bIN0WdoR2x4eCfU9pcmNasx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:37.0273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 777a71d2-e330-4240-1865-08deb426baf6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928

Hi,

This series adds AMD HSMP (Host System Management Port) support for
Family 1Ah, Model 50h-5Fh processors (HSMP protocol version 7) on top
of the existing platform/x86/amd/hsmp driver.

Highlights:

 - New HSMP messages for Family 1Ah Model 50h-5Fh: PC6/CC6 control,
   CCD power, Tdelta, SVI3 VR temperature, DIMM sideband, Floor/SDPS
   limit control and an "enabled HSMP commands" capability query.
 - UAPI structures (hsmp_metric_table_zen6 and friends) describing
   the per-IOD/per-CCD metric table layout for protocol version 7.
 - response_sz validation is unified to a single upper-bound check
   so older userspace built against an earlier descriptor table
   keeps working as new response words are added on newer platforms.
 - Metric-table region size is sourced from firmware (args[2] of
   HSMP_GET_METRIC_TABLE_DRAM_ADDR) rather than hard-coded to
   sizeof(struct hsmp_metric_table), so the driver can map and
   validate the larger ~13 KB protocol-version-7 layout (and any
   future growth) without further code changes.
 - Concurrent metric-table reads on the same socket are serialized
   with a per-socket mutex managed via scoped guard(mutex), so two
   simultaneous readers can no longer interleave the SMU refresh
   command and the memcpy_fromio() and produce a torn snapshot.

Changes in v3:

 - Switched the method of reading the metric table from the binary
   sysfs attribute (metrics_bin) to a character-device IOCTL
   (HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp), as suggested during
   the v2 review. The sysfs binary attribute is capped at PAGE_SIZE
   (4 KB) on the standard read path, which cannot accommodate the
   ~13 KB hsmp_metric_table_zen6 layout used on Family 1Ah Model
   50h-5Fh; the IOCTL has no such cap and works for both the
   existing protocol-version-6 table and the new protocol-version-7
   table. Userspace sizes its buffer using the matching UAPI struct
   (hsmp_metric_table or hsmp_metric_table_zen6) and the kernel
   rejects any size that disagrees with the firmware-reported table
   size with -EINVAL, so a short copy can never silently truncate
   the snapshot.
 - The metrics_bin sysfs attribute is dropped from the ACPI driver
   path (AMDI0097) in favour of the new IOCTL. This is an ABI change
   for ACPI-driver users: userspace must now read telemetry via
   HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp. The non-ACPI plat.c
   path (Family 1Ah Model 0h-Fh, fixed at protocol version 6) is
   intentionally left untouched and its per-socket metrics_bin
   remains available for existing tooling on those systems.
 - The proto_ver gate that enables metric-table discovery in
   init_acpi() is widened from "== HSMP_PROTO_VER6" to
   ">= HSMP_PROTO_VER6" so hsmp_get_tbl_dram_base() runs on
   protocol version 7 (and any future compatible version).
 - Per-socket metric_tbl_lock is now initialised with
   devm_mutex_init() and taken via scoped guard(mutex) in
   hsmp_metric_tbl_read(), instead of an open-coded
   mutex_init()/mutex_destroy() pair.

Link to v2:
https://lore.kernel.org/platform-driver-x86/20260427155129.545327-1-muralidhara.mk@amd.com/T/#m9f1a19ba6e037e5a7f30441620f2fe4b2c3cf0fa

Thanks,
Murali

Muralidhara M K (6):
  platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model
    50h-5Fh metrics table
  platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
    check
  platform/x86/amd/hsmp: Source metric-table size from firmware
  platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table
    reads
  platform/x86/amd/hsmp: Drop ACPI sysfs metrics_bin in favour of the
    IOCTL
  platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)

Suma Hegde (1):
  platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model
    50h-5Fh

 arch/x86/include/uapi/asm/amd_hsmp.h | 278 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/acpi.c |  34 +---
 drivers/platform/x86/amd/hsmp/hsmp.c | 125 ++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |   6 +-
 4 files changed, 373 insertions(+), 70 deletions(-)

-- 
2.34.1

