Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376552DB798
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992707; cv=fail; b=G3S4Yge/1SVGFp+rrK5hBtwI0eLPnap5aFBVCnmR+EdCvsj0nNNzBzpoySJWtwClO/MBEKGlCPsMxhGI0pIfkuVnNcIikcSLgBIyLM7rAIVrNekJdOj/Lp+rt0UWeTODEwhdgBonRJCm5Egib4CjDDQMH0KjQ8HrD3ybcTkTfo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992707; c=relaxed/simple;
	bh=wVqruEPlOV5O2IJbx8JV1b77noXaIO3q9h1v2DcR6EQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aG1qs4NnnMSB8uqGKIxv+Qjam2tJ2crnV8vqAucar4yDnXr41AcOryH8HFr7ywDC/2j9lJm4dUuZk3osFb99viPRA27NkLKVBLqZ0uti4bfqx6LglYsxY1n4Ebqd3ymJITgBcqQUKaTONmiBmJVGl/WgnwkYoFbtGt40JjVmu98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xfi+g163; arc=fail smtp.client-ip=40.107.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xfi+g163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQZ9RxQTIRXJ+ETVcHnezg3TKT5KJ7r8PxYZRqkd29EKMMoHDvGGWiguXBHMlzCMN+axPuti4lPHuSYCHy6kIL4Z4sl5c+qu8454gznenw6VORecAfQNhnjZKZebFTn81uzh5+hRHdz6NlnrP0zN6RRGxkQ3+roZxCYelcX+99gYqtxStDX5pymRvi/0NViKKdpU00cO+zFZZ5fTfxW6MBWf16rNV4LcpXkNg0Y0UJFljUIdKBxDJ2AA5hxJ7C+GJH7dxKP+F4g3laA+5cKASiwnumYGwOTeV6KtuYkw9WU+tMZXRvKNcEseIbF3BQh3ReZWlL2GBWTv4JjWbfGpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjDIXTX3yQMybySd8wBIAUjFULEP8CDFApbzcTP2Ib0=;
 b=dpNw/y47fVsu7S/WwOHnnyH563gGtD1YoTQfqAzA8938ki1l+iUXES4sSmH1L1wbLwtgUIswdWSn6UwvA5/n/c1MYZj1JF9SfXDZou8puR44zYpobQz/+41GUat0hZxWcIVpKFT7HtRrORjyHsG3sCbZBgdcaWqzcU70VH1KDqc+rIh69JYNi5eHVqMEHO5Pw6J1c6HYa3Zu2frNyXfTptIPR4VZDzoKzX7WlINQWaAz3pumKlkUUfeI5tODjRBljDo8TDaj+bpqXGfayY45PwDjmOQ87RgC/6zmQKYHKImIDlUUHezPbOjLSDD0zoUpdhIz11xdxoZHiPDl0K5Phw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjDIXTX3yQMybySd8wBIAUjFULEP8CDFApbzcTP2Ib0=;
 b=Xfi+g163PR/A/VyGp603gRID814a4P+af9TEraJa+nDfjOp2kki+CGSqOSsArDQgHW5vV8oTfwjNMb/dOi35R3CzJ8jfcuvUNjqFw4f1Zkczc2aKAE5gOyi5HItyk4NutQMtaqKoMBny+yhOmtgl12MbCBDs+sfSXjt6KNmumE0=
Received: from BL1PR13CA0106.namprd13.prod.outlook.com (2603:10b6:208:2b9::21)
 by IA1PR12MB8517.namprd12.prod.outlook.com (2603:10b6:208:449::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:11:42 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::ad) by BL1PR13CA0106.outlook.office365.com
 (2603:10b6:208:2b9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:11:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:42 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:39 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 0/7] platform/x86/amd/pmf: Introduce PMF util layer with userspace interface
Date: Tue, 9 Jun 2026 13:40:37 +0530
Message-ID: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|IA1PR12MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e261ddf-4e9c-4c39-31e3-08dec5febd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|6133799003|11063799006|5023799004|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	M7tb10pDjBy11rFlJTRTiWBkYJYs8nVXer26B59b3eoTXQHybLgRzTNnpBCsCqiUtoTT9iEUjQ25by0qd6+upK/PXs0D1sAVS0hUAZNG43ANXOJN4X8PNHoHsbjlvSEhQrm33HLRWCngCoAKTGtXmEFIX/+qTW4kmMfF75rX4ok2WRmljlHC/fIxrveb0RSlVeSnjy2JHDQzCHtLoT4v0nQbfq8H213lhPumVL6tUPh9D6gh3Ynq5gKiquzIdyWFCMhF6kDQH6Mq8iWL0AInygsqlPkLX/Mbsg8HUnfhrKsfN47ILfs9ZtNlTkwS+XAmuqtcTi5J7ia536M/R+zpL82uuvkNXZxzwyEbidH6EqDDegDhskmkhOVbSKfrhSjCldd4Z2UXxguVShiREBAWXGeBFnOxjbLDNWXYaVGD062y0Gi/9AJY/oW0ehYgoLu4K4j5D4gJa4XP1D2L8hcwKesVYmvLF6vqmxgio+uhyEt9dz7JtAuhl2D5TsMO+sMkhorSeGZX4Rp7nzHd9SJaA8PzyTy9J5l4D09JBv9aLalAHj3I1AomrKTtRu4Xs72RZl72lxppyT2lFamyC0/8ZlJeE745Eh03Uxb/BKcBYbiklejF98fpYK3CqO/OQxNLluVTUUNekJgulASlgCe5RH60pbg2tkZN0Z8q51UH1ck4Wqg5CA49z0sIGBE91910OLWnOctDJH4x5SLbG+DSa4C3UBjEZbWeh3hzB6vzZ9c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(6133799003)(11063799006)(5023799004)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pRUZskXesZqLWW2jpC3KFXT7ugk8FEFxz0BiPdZe9TZFjURCp/tZux/mMK+lWmtNEzFCIp/vi9MYj8P4kMjlVRM1gDc+cXOunUvbZ7md3rm3khzGLev8SQqCn9E0EubxgVypaRWaUhAqZ9ZDFonIfQV8BNGJM3TNM4aeJ8BCq+OVfFJaxqJTPpuc6YhIc9wzLazpuJAMy7YSHDoMxU3/h+qyjkOViSSGkA6gycZLxcWjqZFCP8/dyan3fwEfoyldSjK8NOsybv7SIXLP01hl5RcO3KMIZRJB+ysCZGDZPQZfkyJPcp8HMlk/SK3ikQxC4GEWYBCI1Rehq1hc5L86MpVZdUKfNVaQ8IUfx2jUSQlF3rEGoL26uD0VSol2+GYMlm3b5FioXSpZJw+7Aq2YTUv5JMTvcDsB8FwpdEpPgWvedz/W3Fzp2zMJWlfyvq0+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:42.0501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e261ddf-4e9c-4c39-31e3-08dec5febd45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8517

This patch series introduces a new util layer for the AMD Platform
Management Framework (PMF) driver that exposes a minimal userspace
interface for metrics monitoring and feature discovery.

AMD PMF currently manages power and thermal policies internally through
Smart PC features, Auto Mode, Policy Builder, Static/Dynamic Power
Sliders. However, system designers and OEMs need visibility into PMF
metrics and feature status for validation, debugging, and integration
with monitoring tools.

This series addresses that need by adding a character device interface
that allows controlled access to PMF metrics data while maintaining
the driver's existing automated policy management.

The primary use case is integration with userspace tools like AMD
SystemDeck, which are widely used by system designers to:
- Monitor real-time power and thermal behavior
- Validate PMF feature operation during platform bring-up
- Debug thermal issues by tracking skin temperature, C-state residency,
  and socket power metrics
- Verify BIOS input/output policy values during Smart PC operation

The util layer reads from the existing Trusted Application (TA) shared
memory buffer and cached BIOS output values, adding no new communication
overhead with the TA.

v7:
 - Merge patch 3/8 into patch 1/8
 - Use _IOWR(..., __u64) to keep ioctl number stable across extensions
 - Clamp copy size with min_t() instead of -EINVAL for forward compatible
 - Drop IS_ALIGNED() check and features_from_user read-back block

v6:
 - Guard misc_deregister() with pmf_dev_handle NULL check
 - Move amd_pmf_cdev_unregister() to top of amd_pmf_remove()
 - Fix bios_idx type from u32 to int and add negative-value bounds check
 - Add missing #include <linux/bits.h> to uapi/linux/amd-pmf.h
 - Rename amd_pmf_get_pt/lp/sp() to descriptive full names
 - Add missing enum entries in platform_type and slider_position helpers
 - Export amd_pmf_get_ta_custom_bios_inputs() for util layer use
 - Fix stale/incorrect entries in Documentation/ABI

v5:
 - Add actual ioctl implementation after all struct fields are defined
 - Move features_supported field just after size for early discovery
 - Add 8-byte alignment check for user_size to prevent odd-byte copies
 - Add AMD_PMF prefix to all UAPI enum names to avoid namespace collisions
 - Use size_t for loop variable instead of int with cast
 - Use ternary operator for checkbox output
 - Add empty line before Linux kernel headers
 - Refactor banner to const char * for cleaner formatting

v4:
 - Implement single amd_pmf_info structure which can cover all members.
 - Add amd_pmf prefix for enums/functions within the UAPI header.
 - Keep test-pmf tool outside of selftests directory.
 - Include necessary header files.
 - Address review comments received from Ilpo on v3.

v3:
 - Stop exporting battery information via util layer.
 - Optimize the core logic for fetching BIOS outputs.
 - Update the documentation patch to reflect the current util layer design.
 - Consolidate amd-pmf-io.h changes into common UAPI header.
 - Define a single unified uAPI structure and IOCTL.
 - Address other v2 review remarks [1]

v2:
 - address remarks from v1
 - add a new tool that exercises the IOCTLs from PMF interface

[1] https://lore.kernel.org/platform-driver-x86/20251111071010.4179492-1-
    Shyam-sundar.S-k@amd.com/

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Add util layer and userspace character device
    interface
  platform/x86/amd/pmf: store BIOS output values for user-space metrics
    via util IOCTL
  platform/x86/amd/pmf: Store commonly used enums in the header file
  platform/x86/amd/pmf: Move debug helper functions to UAPI header
  platform/x86/amd/pmf: Implement util layer ioctl handler
  platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
    metrics and features
  Documentation/ABI: add testing entry for AMD PMF character device
    interface

 Documentation/ABI/testing/amdpmf-interface    |  73 +++++++
 MAINTAINERS                                   |   1 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  13 +-
 drivers/platform/x86/amd/pmf/Kconfig          |  10 +
 drivers/platform/x86/amd/pmf/Makefile         |   2 +
 drivers/platform/x86/amd/pmf/core.c           |   5 +
 drivers/platform/x86/amd/pmf/pmf.h            |  34 ++-
 drivers/platform/x86/amd/pmf/spc.c            |  72 +------
 drivers/platform/x86/amd/pmf/tee-if.c         |  13 +-
 drivers/platform/x86/amd/pmf/util.c           | 152 +++++++++++++
 include/linux/amd-pmf-io.h                    |   9 -
 include/uapi/linux/amd-pmf.h                  | 204 ++++++++++++++++++
 tools/platform/x86/amd/Makefile               |  60 ++++++
 tools/platform/x86/amd/test-pmf.c             | 142 ++++++++++++
 14 files changed, 690 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h
 create mode 100644 tools/platform/x86/amd/Makefile
 create mode 100644 tools/platform/x86/amd/test-pmf.c

-- 
2.34.1

