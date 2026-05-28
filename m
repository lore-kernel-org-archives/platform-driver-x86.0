Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDB53AEF45;
	Thu, 28 May 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961222; cv=fail; b=F1Dmb3ORx8r348lk/NYPyuj/qbq9/vJjKJJ2aZIg5rsY+k3e+kI7ihUNR+lO/EO5hrsjYVf3aJyeilP4Mp5hKKmqZPvOcdn0N06OrO8TxGpHLHhcZPlgMPYUxfWMp8mEy9AfO28Zi4Tw2hB5VIdp6X0eBeHJKvgtFxWP3J+lEyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961222; c=relaxed/simple;
	bh=xfbW1VgT7qCMG77Xkgr9kLeRfLjjcTOj/5DZ6Az3+Js=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ah2gCnvJmdcnrEPbTPsTWZZwe2rfHRVPLV10nfz153c1hORJPtuKsDM2xHy5H/2nh4C4EokAzEVHAqZaASMJPFX6lJdCeDU9Abjukf3U+tpcqP4n9ttWdUVl7zK7L2C4XTWv5Uo/2LVR7KvmLv4UaIkBbXpbHH94+SmtVsIDJdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yc0T8swL; arc=fail smtp.client-ip=52.101.43.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yc0T8swL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJnr8VzqmwjnckQQdij5r4Piq9d5GpguI6EIULGcsNju5FU+E/azezokulAnvhW/My46rPlBIyl1lPnHM0wvERAKKygTN1ur//SLnV0L7ldbqYLgUzml4jUQnD1vwmGc3/BldT8o2WWo4CL6SwctaRCQZKJEpOP9W9Lq/rm4do/RaFxSGmql4u+0/PebJPH9HK3qXEY74Z0+0rFsDvHar24jJ0ollbgRMFWY27vC1TCsr/EaL90KIp/vq19MhZmrFRyxwOH0Q9RITmPVw1nWZ5Tk0yTwNlW1pekj+LwUWCEZAW2ANxOgSbUllx9YwpfzRJjxyZDYXSZsO9PIodVQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Nz97iudSHtGX8YxdsK4E/NIhZa4jOMbdVHxkA67fL4=;
 b=eNEbnxJ7X+TTKFD0nsUUPioezfGd4IBWj8UjRuWMAjgNOxi+TamCDS4THqMdbaD0pFzo7HFINTEY1kuTzQDUmhTt0aZHwroOJgDQ49mx/9J8pX2BydJiZT6fw5auVJ45kCt+GSpfQffEZ7J7/qWk/WxX66mlgizxySQqzJa1HciDK2SM22Ilr+kbkEndG1xVzidhTQ11OFOS61R5+aNMhJ3iRRgeHqBzh8PvacrdsTypkKwExTzKNOjKhodxEOVFAO8unB35vH3gBQ1cLO9Wn/Rl24x7sg5q2Rb486vnFN0jJkHqglbeivKppBJqFDZeMDiw540O1wGjzU2J16tyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Nz97iudSHtGX8YxdsK4E/NIhZa4jOMbdVHxkA67fL4=;
 b=yc0T8swLX2tVudel8rO7fDxmvRcfQtyMIZCr9TTztv/r+Db+/bBCVQ6JQUMBN5TuVdBsco4FW0bMICg5qxL27jtFbW6FjTexU58k5yqzw3UpZtkcKFR0fN+0bws+CVPFBV2FbYdiTyZ8NyyXNDPSGm2beZ63Ebx5zYatg42E3xM=
Received: from CH0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:610:e6::25)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 09:40:16 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::7e) by CH0PR03CA0290.outlook.office365.com
 (2603:10b6:610:e6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 09:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:15 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:13 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 0/7] platform/x86/amd/hsmp: Support Family 1Ah Model 50h-5Fh telemetry
Date: Thu, 28 May 2026 15:09:47 +0530
Message-ID: <20260528093954.2461272-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a1d094-fc12-4c59-0d48-08debc9d1f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|13003099007|18002099003|11063799006|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	LFeYDlKjC9srTs7LqmwlVmgBPeLT/C0HMydiR5bujiA0I3XlD/aHhPPTvJo+0zvXZEoXcAFgP3PnlNTHlZ0DfBZnNgejXh6Dv1x9SS4xNolSI4jCF/ixzoum1MiKiaWKIIu7WSyOVpW6uVr5v3/qYsZzd2rwkK9rLPbfujc0zJ4E0n0T9F3zJmF+HDkxmS0v1UqjYk61sXcoE+ErYadJQGlprAcVFNIX4eEutNrZotaQygipt+W4+pmO7YBxfyRt2/CBMVID0NnuRy7M9ztEJvsue5GI3L1dPxPPEkBZbiiLSWEwuuvfv9tVH2shPXmEBmT0Um9sMnIJQ7ZJI4k7+zCyPeEnIeH/TWPH8EB2/YznEwshngU02B0bM7cZERjoyHvF3o7qLo+hATaTg+E8wmJSb/8T4U0ajCntPrb2hxk2ERNKcnO04XyC3hTz/8gnD2UF2h9abbMthyac1s1EF4em7ZDfyXRnU6nGf/K9qZHmFXZJmbaMhwg3/jE3ldNk303YOlTi7THQN+TVRqJgDw4ClmpLm6MwYmf+wPPjGBuVmAo94uryZ8xKzorf5hBPxkaISQtZFG8s8ZfL1buUatX7V+UyUyfHqhQK2KPuuJzdL9/pjpUWJnkFqJMo3wTYkWL3bsilwM1BN/O5rtq1BjAZZodtZqfq2WgexJ7Tj3sqFt4FeJDqqaSkPDgHBQaJJTTvptx1uvGUNvsYEMswu2krdy0ubx5eOsq8MQxItAE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(13003099007)(18002099003)(11063799006)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xdlv3k8nAOvTyfOFpjouRf6iS8kQqItGJV4G44sBdzLdulN30xi/uK8uaVfyNcH25X0qq+VojiZbATEPpLda6yKl+FEc3ktky//mpf/0swezhrymoghRWTmjBs21PY/62isMktYVzc9DyuyUcYCxL0cnYB8IypC3ymo8q4y+zyrlRsRKNKLb7fvahcU+lXXCrrZsfKbSSVsivD3xS6xsFscVgy6Yk2D5tFmtTN8NWT46El90U/NCaZbzI41lgoWd94thL8WL7ogAplP1xc4PP+oCwORkeiSiP7KiztTquzhAUtqrQ+UXCfRU6l1O1pZdUtce0uYaV3glRrH1yE84djJ3IuT2dV06ZKy2c/4W4iatsHBvRYqJp1SY9xdTOGf/g+w8XdGQqJuLj8T80B4KJTXtjU03aDBl37fKqqt+Ttf6mpKDgwPu/cWnDaHSXEFX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:15.0906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a1d094-fc12-4c59-0d48-08debc9d1f1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212

Hi,

This series adds HSMP protocol version 7 support to the AMD HSMP driver
for Family 1Ah Model 50h-5Fh systems, and addresses a small set of
related issues that surfaced while wiring up the new platform.

The bulk of the work is exposing the new firmware-defined metric table
layout to userspace. HSMP_PROTO_VER7 firmware delivers a per-IOD /
per-CCD blob (struct hsmp_metric_table_zen6, ~13 KB) that does not fit
the existing per-socket struct hsmp_metric_table and does not fit the
existing sysfs metrics_bin transport at all, since binary sysfs
attributes are bounded by PAGE_SIZE. metrics_bin also has a long-
standing tearing problem: userspace can read it in multiple chunks and
observe an inconsistent snapshot if SMU refreshes the table between
read() calls.

To address both, the series:

  - Adds a stable UAPI description of the v7 metric-table layout
    (struct hsmp_metric_table_zen6{,_iod,_ccd}) that mirrors the
    firmware blob 1:1.

  - Stops hard-coding the metric-table region size in the driver and
    sources it from firmware (HSMP_GET_METRIC_TABLE_DRAM_ADDR args[2]),
    falling back to the old size on v6 firmware that leaves the field
    zero. The same size is used for ioremap() and for the ioctl
    bounds check.

  - Adds a new HSMP_IOCTL_GET_TELEMETRY_DATA on the existing HSMP
    character device that always copies the full firmware-reported
    table in one shot, removing both the PAGE_SIZE cap and the
    chunked-read tearing window. The trailing reserved field in the
    request is rejected if non-zero so future kernels can repurpose
    it without breaking deployed userspace, and user-supplied indices
    (sock_ind, msg_id) are clamped with array_index_nospec() to
    mitigate Spectre v1.

  - Wires the ACPI driver to populate the DRAM mapping for v7
    (currently gated on '== HSMP_PROTO_VER6'), so the new ioctl path
    is actually reachable on Family 1Ah Model 50h-5Fh hardware. The
    legacy metrics_bin attribute is preserved and continues to work
    on v6; on v7 it returns -EOPNOTSUPP pointing at the ioctl.

Around that, the series also:

  - Adds the new HSMP message IDs (0x29-0x2A, 0x33-0x3A) introduced by
    Family 1Ah Model 50h-5Fh firmware (PC6/CC6 control, CCD power /
    thermal monitoring, DIMM sideband access, floor- and SDPS-limit
    control, command-enable discovery) and converts three SET-only
    messages (HSMP_SET_XGMI_LINK_WIDTH, HSMP_SET_DF_PSTATE,
    HSMP_SET_PSTATE_MAX_MIN) to HSMP_SET_GET so userspace can read
    back the currently programmed value via bit[31] of args[0].

  - Relaxes validate_message() to an upper-bound check for every
    message type (HSMP_SET_GET already did this). Existing userspace
    that asks for fewer response words than firmware now provides is
    no longer rejected with -EINVAL.

  - Tightens metric-table read locking with a per-socket guard(mutex)
    around the SMU-side refresh + memcpy_fromio() sequence, and
    reorders devm_mutex_init() before devm_ioremap() so the
    "metric_tbl_addr != NULL implies metric_tbl_lock is initialized"
    invariant holds on every probe path.

Documentation/arch/x86/amd_hsmp.rst is updated to describe the
metrics_bin / IOCTL_GET_TELEMETRY_DATA split and the protocol-version
gating.

The series is bisect-safe: every commit was built individually and
checkpatch.pl --strict is clean across the series.

v3:
https://lore.kernel.org/platform-driver-x86/20260517151211.415627-1-muralidhara.mk@amd.com/T/#t

Changes since v3:

  - 1/7 (new HSMP messages): Tightened the inline bitfield comments
    on HSMP_SET_POWER_MODE / HSMP_PC6_ENABLE / HSMP_CC6_ENABLE /
    HSMP_DIMM_SB_RD / HSMP_DIMM_SB_WR / HSMP_FLOOR_LIMIT /
    HSMP_SDPS_LIMIT. Rewrote the commit log to spell out the
    backward-compatibility analysis for bit[31] of args[0] on
    the three SET->SET_GET conversions.

  - 2/7 (UAPI structs): Added per-field comments explaining the
    num_active_ccds placement (in the IOD block, matching the
    firmware-side aggregator) and the ccd[] sizing
    (HSMP_F1A_M50_M5F_MAX_CCDS = 8, hardware maximum, userspace
    iterates [0 .. num_active_ccds - 1]).

  - 3/7 (response_sz): Rewrote the commit log to motivate the change
    in terms of forward compatibility of older userspace against
    newer firmware/descriptor tables.

  - 4/7 (firmware-reported table size): Rewrote the commit log to
    document args[2] semantics and the 0-fallback path that keeps
    behaviour identical on v6 firmware.

  - 5/7 (HSMP_IOCTL_GET_TELEMETRY_DATA):
      * Added array_index_nospec() on req.sock_ind and msg.msg_id to
        mitigate Spectre v1 on the user-controlled ioctl indices.
      * Rejected non-zero req.reserved with -EINVAL so the field
        stays repurposable.
      * Tightened the UAPI struct layout reasoning under the
        surrounding #pragma pack(4) and the size-mismatch handling.
      * Trimmed the long implementation-detail paragraphs from the
        commit log.

  - 6/7 (enable v7 on the ACPI driver):
      * Restored the legacy sysfs metrics_bin attribute (it was
        dropped in v3) and gated reads by protocol version so v6
        userspace is unaffected and v7 userspace gets -EOPNOTSUPP
        pointing at HSMP_IOCTL_GET_TELEMETRY_DATA.
      * Removed the ABI-break paragraph from the commit log now that
        metrics_bin is preserved.

  - 7/7 (guard(mutex)):
      * Reordered devm_mutex_init() before devm_ioremap() so that
        sock->metric_tbl_addr is never published with an
        uninitialized metric_tbl_lock on the non-fatal init_acpi() /
        init_platform_device() error paths.
      * Rewrote the commit log to document that ordering invariant.

  - Documentation/arch/x86/amd_hsmp.rst: Documented the metrics_bin
    PAGE_SIZE / protocol-version constraints and the new
    HSMP_IOCTL_GET_TELEMETRY_DATA path, and cleaned up whitespace in
    the embedded struct snippet.

Thanks,
Murali

Muralidhara M K (7):
  platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model
    50h-5Fh
  platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model
    50h-5Fh metrics table
  platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
    check
  platform/x86/amd/hsmp: Source metric-table size from firmware
  platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table
    reads
  platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the
    ACPI driver via the IOCTL
  platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)

 Documentation/arch/x86/amd_hsmp.rst  |  30 ++-
 arch/x86/include/uapi/asm/amd_hsmp.h | 294 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/acpi.c |  23 ++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 169 +++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |   6 +-
 5 files changed, 485 insertions(+), 37 deletions(-)

-- 
2.34.1

