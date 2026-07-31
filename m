Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C544BC87;
	Fri, 31 Jul 2026 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514565; cv=fail; b=StIDQGx/nwlj/8RBJuGUwJwA6qGqZWqmBnQKvMB7Mw+1zhswpa/UwrR/PT6jKL1r6R9AHBVgGCYE+8yWN81L7Em8P9fzjawB8kFfNEUfndEoXMVybdmORoJe3EsIOQM5XK9xr7EIgpgjn+Ue+doSf6NKb/3gIzU+gtBOIGt9DQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514565; c=relaxed/simple;
	bh=oh3DEUZcHttAvAltrBnviD3KTZIG6Z+TFUo/3Og0XGE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g/PFH2KPBE+4RSSqaBshvv19xM4H02HKIzePhooCU4lcGxV3qcZ0pNMEqWjtjoJ0dNSQclkAAdptIpn80ADOYa7NxLYK1DphzOIwaaORTrj1nIM2ArDUZ+nKCT9lXxRYi8Zr9lw+skhKqEv2CRapNeOluSIds/U6OkgGpWdrC/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lxWBh8zt; arc=fail smtp.client-ip=52.101.53.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lxWBh8zt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjtiB9GCFAQ60UmYYvvS/vLyyibShw1wpQb2I+7K88cShZL6riLzjVrYW4zYSsti6C69QccUmme5ConDetQ2iXVFJZHlPIJ2BsOkvxnSt3Bvf/qdVMbOdJdpS56AgzCQH4oHE1DuzUHCFylBqhTNOUmOz+F8ZHLc1wnfYh682GpWjsa7OxyNOemMC0vQN3KVKpUXECD5l5hiUhy+Ek4kbz0tdeL0WSZrIeY1plRCqJQYSH6SObcOZzAUyu4i0Scet7zUrI1IgIR72vgr//b3A/8+PqGGGOstWh1IzlC6eQMbugJKq/r/cfvuqZ/0KaiYI6HyIC3h38PP32QbnhIa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT0OiG3juvXBGBSQQoP8C7tTzlzZ3Q8Dwp/he+eot+I=;
 b=yT5PR5tGI2dp5O3OT6XjPldsfsZZlvypRFhTgmIo9h8oNt6qENPyJxAAsIHYuPFL1WquLmZGNLyC8qaGj7ENQ11kReXX4Ex7MplWUAmbtrCq1VHtXho+FrxT+NvJWE9i70UlUiGrKmj1DOdBnjx3ddaUGZXjm3DzrqrDQgK9TUHtFxc+Qy0UWfK9H3ZumGB4/shUQxRhJrOrY+WK9WMUWj288ayO1Nh1cmcveFYdxQTxe+nOHK0u/VNXeIo7/+ibx+kLlpjWqIW+Ewlwq+jOMauvZNEtYTIi981eSjDDab4oN7RRmB9g1sDztV21wGHWVVw10Bkcx9LwRWwuicFWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT0OiG3juvXBGBSQQoP8C7tTzlzZ3Q8Dwp/he+eot+I=;
 b=lxWBh8ztyzTZGxSq/PUHZKn/6TtJJgzCEj+7IkGsdkAR/3WNyO57ONht1NcPikpupLPqfX8/R0bpzMDOHRSUobJfqsusI6Rnw30fZnk/7ab+vaaNqKI70l6fV+luQnXnI5TGdoewlOLachgRDF4L/7xynzoMSA2NTjyq00tB4eo=
Received: from CH0PR13CA0056.namprd13.prod.outlook.com (2603:10b6:610:b2::31)
 by DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 16:15:38 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::62) by CH0PR13CA0056.outlook.office365.com
 (2603:10b6:610:b2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.9 via Frontend Transport; Fri, 31
 Jul 2026 16:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 16:15:38 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:15:36 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Date: Fri, 31 Jul 2026 21:45:12 +0530
Message-ID: <20260731161516.2242993-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 2332ef57-55b1-4162-dbe2-08deef1ef5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A8kpZCt2XKwxCVXfsHRo4Ffws6y/ncnikcxmhAsGELtJAEUomFcXSt99zE5TvRggZZ9NPUZdF3NzbiuYPBLWiLaVFzOSbMiAw+II09aXEw2G9siSXZ9+qpd+RayXVvV2xGL+2WI6euWLeH3dZNdfwN/nluJHNd6HP+wl98EQEJVTFU23sYphl7Oe91ObX0SGbmHrZnRv4qZvOMiSL/FJZPUFEFM7kV1UH3aT9ohLztRnVmwk+PrTWINwiPNJ12g2Bf/yxMe1vpY6Sr7pNon9WJmmCGuBjVOX+yWiKdVwXSFlZEqwtRxSaIrJa5z/ca4SJ95yon+SyxwgzI3+GylVD4diUoCFHmSJL2hQCEsam1CiB5acvDn8hcd7zd2gnbDH5wPKnUMT5NGIjxmTEWuALmgyn0Yb9+PLSMdjU42Npuf0CrGEDpuiNUudNF1mhOT4MbFNvZ6Ar7muVbJ017q05sCnPrVCdpyVQdH/O0jAkbDKb30Ff7ZfoAyk5/SzBM915T0+4PS/kN0KdDOHBA2KVNpHY2aFu6AT50GFLfAP+7reYqIYOcOhUOSpsS9mQJFGVYqMi4m9g2bvrG4uv/d5KBTbNMNviEWoCLxxcADkbWlmGpBUHleo1YF2jhUhFjugghXeSsaJtby8M4eBS1p14qmaacqWcBLy97PhkswVO3F6YtUQ126dX6iF6vNMX/0YBewjXdbNEfXe4PEqtZUMhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xsQ7/PArSgDhRo1N97H66AgE6EDsNnbf+xGHoTPUWNZy3tQ9MEp51lziMaMkTpnlOhCl7AMOoncImIYGualTO85/FhhNiJaI7AENN6O8RG2E1PXTeCWgRFPp6bTBYjdAddcK9YfBCmM6eRu1ogiJ6uUIJi/8PjgNO2vsA95SdMrPnDVxzEE2wxfW1HGN6pRhgB2Snk8nJtWBAIt0l+AMCnUhRZBwF02Kepks/ap+WkNQ3Ogf5b8sPnx6rD3Mxfr7pp6niZDaz6FOtwzfV7edOPvrv+Pk12PAMB9YGPLK/7x0QTHWR7urO5hAe8N47IL4CZqxi3ahWf8WWPhJOfpgm0JpbbVEbxWh1Taf8M+82ArtdkQqVCof+xSmdo/IkKnqMIMz6auVarqw8Ij64A3+jQSMSwEjZhtzmUhekJ1Y7sPCZWEPAr+jeZ+rO83Po23m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 16:15:38.6841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2332ef57-55b1-4162-dbe2-08deef1ef5ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815

This series enables the HSMP driver on the Family 1Ah client platforms,
Models 80h-8Fh and E0h-E3h.

The client parts drive a different mailbox from the server HSMP
interface. Its SMN addresses are fixed rather than discoverable through
firmware, and the parts speak the Ryzen Master SMC message set instead
of the server message IDs. Patches 1-3 teach the driver both, leaving
server behaviour unchanged, and patch 4 documents the telemetry table
those parts return. Only the ACPI driver probes them.

Changes in v1:

  - Dropped the SMNR ACPI method. amd_smn_hsmp_rdwr() now serves both
    the reads and the writes the client handshake needs.
  - Dropped the SMN and MSR read ioctls (v1 patches 5-7) and the
    DRIVER_VERSION bump that came with them. Point taken that a generic
    SMN reader is the wrong interface and that bring-up does not justify
    one. If the values behind those reads are still needed, they will
    come back as purpose-specific messages with the access abstracted in
    the driver, as suggested.
  - The client telemetry table layout is now in amd_hsmp.rst (patch 4)
    rather than left to the PPR, so a tool can decode a snapshot without
    collecting a PPR per part. It is written as the Telemetry Table RM
    structure declarations themselves, not a paraphrase of them. The PPR
    stays the reference for units and encodings, which are firmware
    defined.
  - Patch 1, from the review of v1: get_msg_desc() now rejects reserved
    IDs as well as out-of-range ones, so validate_message() and the
    ioctl no longer repeat either check; is_get_msg() takes the
    descriptor its caller already resolved, which removes the
    unreachable branch; the platform description is resolved once in
    hsmp_common_init() instead of on every get_hsmp_pdev() call.

Each patch builds individually at W=1 and is clean under
checkpatch.pl --strict, kernel-doc, codespell and the htmldocs build.

Muralidhara M K (4):
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
  Documentation/arch/x86/amd_hsmp: Document the client telemetry table

 Documentation/arch/x86/amd_hsmp.rst  | 287 +++++++++++++++++++++++++-
 arch/x86/include/uapi/asm/amd_hsmp.h | 289 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |  77 ++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 169 +++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  75 +++++++
 drivers/platform/x86/amd/hsmp/plat.c |  19 +-
 6 files changed, 857 insertions(+), 59 deletions(-)


base-commit: 775f2078b38ff2121410a35302497a1e81b8e459
-- 
2.34.1

