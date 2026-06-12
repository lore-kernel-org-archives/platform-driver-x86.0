Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0943806DC;
	Fri, 12 Jun 2026 04:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238399; cv=fail; b=Ve7DlB4WA9peVxTtwjixHNjzLEZ9Pc5ZQDJEAcgnSr0/IBSrWjlWfodXDXvLZElGD2IH+07Dlfgi1q6KeQ9vHAifGKkUaO0m1jSSbjrq+Y+GmuovSO2Ht+nfaVkuy/ZWriuYQ7e65eWjTM2nLTxMpQl4lPk9XxfhrfS6nZMugyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238399; c=relaxed/simple;
	bh=K/sw7Fv7K2f92ugcH7swoF16poL094RZmzH0YYftbkU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jopoLWJmssUKA8f9Cw7bGHN66XwarLxHC+vVoPGMwt9VmGxHRhiDCE5Ad6xNPW62oETSnltc/1otnf8V/Txrsu+UHsJjsZ0od20s1meyguzLS1cvTHj9szAjB46W6vv/RSuXDoMvbQ3+3YTJ66K73Hzw9k0vFEjRMxT0rTRkoB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aflL5/XI; arc=fail smtp.client-ip=52.101.46.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aflL5/XI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUYskz2xR5ltF3DSYkcPFrU1BSt2eTTzhZUAAI7uPHVo3cTTn9bB4dlzN4GmOrzoMSj2pKf3sbjhFz0LdE2VDGvykTY2MEZve3w7jPCdrzBCf4SHcHS6MdJRDLK4MZj2DcNUcYlNka8lgjvOnM6pdEUlUddxCtzVjIW/atALSa4qQ+elVEPpKQTVqkxACuGXSBrJfa09yQlQ5KaVhYegxS5rM3yg8bC6MB82goU2IvL6bB9F0bvsIF4vgJoMcv4EEkX6yiLXLv5fgS2JsrQVlRD9wvcDUGnIiV9cEz6L4jGo6+NL8/43DodX0M9XA+1uTFXs0m9zf0CCvHrGaDR02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnB8tyN25J8IR8lnXdKyc2MiV0VCP8oSPCXh1IGfVek=;
 b=jKpZS8XbjFbHDfzv1mYqzPJToo9qUdwbxg3A5/+sSaT9thuJLY0pZSbdvaY4Xhb7AcGUFi80/Uq95oNMsZI33aDv6WRf7C24NUpGMIWS8u7qvt8V8fntKNDfh7lId8ru0e0RWvWiq0xZ5MCTX2PwJ1amxv2DS8i4YViI6HbYELayEqrIzy8eHQxPPNBteVBOGYvwn6KuZr+zBTzXYUJ1oqRsNjam4QW27/B8KmdPn+k/V1P+rYUPuAy3TeOW7BCPs474DfOD/dF1VPPvXuvFHKUsCy3YqhTkRgLc15cWP0QFQt4VxylehrDDpzNd3P3NiV8EQnQJhReA/g3eJTnO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnB8tyN25J8IR8lnXdKyc2MiV0VCP8oSPCXh1IGfVek=;
 b=aflL5/XIWaE3zYupT509NeZybpIycYbejNQ5P1h+D45+LIAEKoykESwlLh7ymUkpJphlc4blMYsIkxH1mBU2B0USOmF4hMRztjCYzzfwMbRSNoEjWpjWU0VOashG37JuLkWKVx2gifGeDfy2dM8emXAMCDsjiYhCfNVlVM4S7ak=
Received: from SJ0PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:33f::21)
 by MW4PR12MB7190.namprd12.prod.outlook.com (2603:10b6:303:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 04:26:32 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::80) by SJ0PR05CA0046.outlook.office365.com
 (2603:10b6:a03:33f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Fri,
 12 Jun 2026 04:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:31 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:29 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 0/8] platform/x86/amd/hsmp: Family 1Ah Model 50h-5Fh HSMP and metrics
Date: Fri, 12 Jun 2026 09:56:02 +0530
Message-ID: <20260612042610.1629037-1-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|MW4PR12MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d6f8b0-394a-4ff9-64de-08dec83ac7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|13003099007|3023799007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	OVsPbDkVsbiU3B+E+rLbO6sNqV26L2/2ktLW7saqKDxVm2+D6V0lfbu3b22qLLeSmiLma0YPFkqMfFu+0Z4/30GavpY3srh27mkBa9ZT7Yy0FU/bGycaj9hlKFG1W1gbOL1qiiDipAAfPUwz1k96jucZbQj0T7lJAPkMm/50gH3v6vf0Ekuf9+Whjfw7U6ufNgrny6QX1St9m7MSzE5oq3zOCvdUZZwCKskVSMR6oAg/jJurQfUDGgp88cEsToM3bS/8q/6UA0gc9CI4Y9GqTYsAqkJcZMn2hXwd31iTFPCLbhUVstGYkv79QZsumKhwkd/JTuRmsNB5A2ZMCOjygvG0ny/vAQFxmkbKCjkgQJe7uJIbd0DaWzCsrsubbRbJ7tCQSzkDpKdNCqf6jIuR469HTxJBAGBTt9i8BQewEANT1/O+yHMeLLLc9lLLl9kHh+3m/C+4eV+zQc4p77D2zcuUYiZFn/p8nOAfYGUaJjYuAmenPnySleshNGVtxM0qXcrQJnZ3kH7Hs8TOakljjmA4vx+mZSTUi4t4fP2Zh8IYxXO0pz60+IMlnISbnmvbC/O4eKBeRPjk3XhFtdk8VkIV2ehb+uOcf7QKniWGIKKGDbgEQ0GsfH4mMbfx02i2uHH2kabKJlLJr3TG8SRR2xeuIOR0g5abzYr5W1PyhFJPHecd5lId7OYFLQxuyjW7kRtUfD9Ivl12Zi8xHIWqNNrvIh0Q7SQhaUklP2r2dmw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(13003099007)(3023799007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P8qf1Kmm7KCE6G8XZcCPjs11Gxo4lrgBs8B74y1gphIKjFE0ED0vcFuxi6bAwLONjJCxXyGVV+oS87ZA/syTXxQ7Pf4kfiiotGXAo9p645HQPQUbQfw1WQH+sLAxPqmi4nY4j13bYD7r1+Ta24Mgf+oHLqbQZgMSGveYG1WgeO5/seHbHMsxdTF6CCQe2JeNKsM+rzg0+T5hX4+tyG/uFAQRtO0Pe9ZRo5Z+VMB/osZowRwYjxFSb8LMq6d/4YTTYYfuUTp8XotsKyuM5AcPCz0CCXus3nLtnN55CUzy6iIJw0AXNiBycw0OiEndFbZ9XSIkhdHXp5HMyIDj9N1SjsOUxuYt4rShmsLu4rsgritnPp4jU09lQI1Bw5/kHguBoDpJBPkUOCVBe2wK24VkELlOjLam9SdKFvMggSJf+zSxDS36pWpHoG374BPNgWh6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:31.8881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d6f8b0-394a-4ff9-64de-08dec83ac7e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7190

Hi,

This series extends the AMD HSMP platform driver and UAPI for Family 1Ah,
Model 50h-5Fh: new HSMP message IDs (including PQoS-related IDs in the
first patch), Zen 6 metric table layout in UAPI, relaxed response_sz
handling against the descriptor table, firmware-reported metric table
sizing for ioremap and reads, HSMP_IOCTL_GET_TELEMETRY_DATA on the
existing character device for a single-shot full-table copy (avoiding
sysfs PAGE_SIZE limits and torn reads), ACPI enablement for protocol
version 7 tables, Spectre-v1 hardening on user-controlled indices, and
coordinated metric-table access plus ACPI HSMP probe/remove lifetime
fixes on the shared global socket array.  Documentation is updated in
Documentation/arch/x86/amd_hsmp.rst.

v5 submission (lore.kernel.org)

  https://lore.kernel.org/platform-driver-x86/20260611052919.1095549-1-muralidhara.mk@amd.com/T/#t

Changes since v5

* Patch 6/8: Tighten the Spectre-v1 changelog and subject around
  clamping ioctl and hsmp_send_message() indices; wrap the commit
  description so scripts/checkpatch.pl stays quiet on line length.

* Patch 8/8: Broaden the final fix beyond sysfs metric locking alone.
  Serialize metric table refresh and memcpy_fromio(), refcount ACPI
  HSMP sockets with a probe mutex across init_acpi(), misc_register(),
  and refcount_inc(), replace devm metric DRAM maps with explicit
  ioremap()/mutex_init plus hsmp_metric_tbl_unmap_all() on last ACPI
  remove, add hsmp_acpi_free_sock_alloc_if_idle() for early probe
  failures, and order legacy platform remove so misc is deregistered
  before metric unmap (matching ACPI teardown).

The series is bisect-safe: each commit was built with
  make M=drivers/platform/x86/amd/hsmp
after the previous commits, and scripts/checkpatch.pl -g <rev> was run on
each change (0 errors / 0 warnings).

Thanks,
Muralidhara M K

Muralidhara M K (8):
  platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
  platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model
    50h-5Fh metrics table
  platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
    check
  platform/x86/amd/hsmp: Source metric-table size from firmware
  platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table
    reads
  platform/x86/amd/hsmp: Clamp ioctl/send_message indices (Spectre v1)
  platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the
    ACPI driver via the IOCTL
  platform/x86/amd/hsmp: Serialize metric table access and ACPI HSMP
    teardown

 Documentation/arch/x86/amd_hsmp.rst  |  30 ++-
 arch/x86/include/uapi/asm/amd_hsmp.h | 310 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/acpi.c |  81 +++++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 214 ++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  13 +-
 drivers/platform/x86/amd/hsmp/plat.c |   1 +
 6 files changed, 594 insertions(+), 55 deletions(-)

-- 
2.34.1
