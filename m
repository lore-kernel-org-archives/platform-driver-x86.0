Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1BB194AE6
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890552; cv=fail; b=lZCuwEEdhZwPVBV8ixvaLfxjMizmcdXfyeZbLrvQGh6yfvqnuWTzt3rhcW97spflKAsHYFiLNEojIyt5fq9ofXEcMVx2ckJrSpjDqPx/WWLtuidSsQVdJJ5VND0h1KroLUqnnmmBs5sOc5/Gagdp+j6nSnWahF6GUKdnC8TKwoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890552; c=relaxed/simple;
	bh=4HTw1MOE4gtwvETK5Ey5z3oZGil61eu+w+xBzM6LJ8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HIcgLixIrE4QfxzkA3DxHm4I4RY8/TlJ3HslaYvxc8wuN1uSHu4/HrzGqr8Dy3Ea8Al3Lfd7YZk0gjAKLVEs6RCLTk0c3DJo01IGqY0T+T9ELi19+Mcbwfo9Zf/Sm1Ux//I0Y3lGpgJlgtoNJvjWKeFNB5MiCl1FJyCySxA5Jyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sG6Uun56; arc=fail smtp.client-ip=40.107.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sG6Uun56"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+4CbQ3RRwCJVbw8aTpgt7d5eSRdq0KXWlheJSRK/RmQPlfNcrwNVwssXBHjCcWigsMkgTYfiFYVSEv96PVtG5xAv6KUOIJh9eh+CAZz/MdD1UO14v2HCC+fUpnUNl4H6eIsBVCpFQW8gaW7xCeAh5IheI59vZA7pXp0kz0be6I+lVlKU6gkW9XdK5cV1cOi0flyS9wa4JWcJReMZq2korgLNufJGCff1byr1YmNdKhWV2kR2wwb0n2nb0DZ4gnGx5RApi1Wj3z+zKHHCgoAH13pRVWUnIuCOoYLPpyn+Yls9CBYifaPlWBtklRouT1LSqMw4fzYaixoqIoKSuAEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUF3EpqvbYPKAEMG1zTK2onBkYWLoXRh7KmrgDmw/3c=;
 b=GpxL5axpjfON7RrNxcJ+eJ5OX5+fikysZLYixNFNOPiPN+1lkgOWQAcTvM8ooa5hIyb3W4+NOcYHRn57efzvgN6jHPJ5ejOReU4EAtxb+KxiWYWeNh9fJrqRO5jCnyDspHgxbL1qI21aUWS6wn5D99RxkGTCqZKVCSgzRo7i8VlxZM46Qfd5i1GmKoG7gk0FJT5EC210f5F/1o1nPLAahD3If2GQXGpoTBTQGiVYwbT20U77mjn2m7/83lshMXZBhSLTswxTUAr1V2znLJ6KyLj5hvy4CKzIIUmVgg6HFROvG3aLWatM9TC+gaCU/R+TbcP4KWnURV4ObJlkCWtBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUF3EpqvbYPKAEMG1zTK2onBkYWLoXRh7KmrgDmw/3c=;
 b=sG6Uun56GjPv44PpdDuCIY1DwJ2hPj8sfupO7WgKkgF6bphGvYNpyOsAJtey2bLFTW5FfsgZOh5NBNO97rMSjUF3r873jGxtfJxmOZvfSFtCvOFklfn1BZn/e2VzJfDgvskkurL5+oulF6fmupMp1RSqhTBnbf4Gn10ZbCUT+Bw=
Received: from DS1PR02CA0003.namprd02.prod.outlook.com (2603:10b6:8:452::10)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 14:02:25 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:8:452:cafe::36) by DS1PR02CA0003.outlook.office365.com
 (2603:10b6:8:452::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 14:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:24 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:22 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 0/8] platform/x86/amd/pmf: Introduce PMF util layer with userspace interface
Date: Wed, 27 May 2026 19:31:57 +0530
Message-ID: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbcff37-03f1-48db-23b2-08debbf8948b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099006|6133799003|11063799006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	NLvvHDWRonbg0TiYSRdeCswLlLqk65tzWRfHGDY7vBwKle1gA9w6WrFbFBnEwH+ZIYcY+Avb3INaY3A+qG7WuvPeXRCC36Ij/wOcZERH9wfnA3kOO7foyNdmDrvex4nwNm2cwbWtFlpW08Wss9GoaJX0Pqp6GjmDJ7HVp/EwEIHwLGSG/IN5iz4z+fxvg8DhJEGGZ6gi9OEDY+0bnBhh4c8vrVQvHtwSeKNn65zXPrkULHFkhFr+uzvLVwSg7x87M8WuBS2HyK7mw5BAzBK4RhinjBT2R730XHnzrrDsRo+S5pGcxeN62VtQLfbuaHs42nwgOctJCXVhlVQMdkvQOAAsEhFAOvE+xNsav8w2oWjjyX37o+4X25Pe8pYg3Ss5YvbbmL2C3836lZWJbpin/HWLGUE9kRa1sxLSFTWHNxD40fmg2lfyjmQDXd6eDyE8OBQ70qi2PLKF1AEbdAp7UaO+brf9H8utqWA9JR9I1qKCzEPTL92CHiJBJQYEgpdLbKI/SciJwk1wwdCnrVMoUy7dyPG91nJtonZuFbHYSV9Q0+n1+ZT/MOHRXMTOiMdiZDPy+DINxm8sINoTjzrI8eDYtASGW/8tRVusG83m5Qv7INhdJsVaNr7kjzoYEEt4be6vg+6Pgw3wdXiU3v1OIYFL7tcY8b1OmWTmhkkZcYJQc2u1OYK7KzHcJpsu5oc8TlfSPw7H1KWYAwslnL/ZOmdHGztBhHcndPIZYdsYhSY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099006)(6133799003)(11063799006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	neGD3NbFNHIcTwhRmI0n1AQ0LKMJWRev34aR7HuTy5pNdiwMUp40mz7OwThHDhP7MaAPI09ZKbNNM4jpI0laqEMUUQ09O81Gfu5DmunutExTdkQ7WVLffJOjNdJcbWCdetPU0HXOmg3T0l7eNgxDcHoFlZ/MPm5Q556kxqM4xsAOuHSRf3wH6GaCWvunlI23bgffm+AuzZOjg4yCA8Toj+P/TlycpRtelgIaxFpmPOwjvd3XlqAM1Q+EehpfblBzVFAQ/yUW0QSXiFF8ElEMIZq9z8EMx1nPPZln2neImldD3dJjpnql7mwFFrbmkEu60Fu0cC+WKEj2UKjqsaFCiFbHUcpY2TSTfK+Ve49aL9z2pktE2iHuAgljpOfchCNOBcrQ6umQmdcrvqw1UTETjy0wFWnkjIeQEL8xphNEMVtVjh7kHaDTAtybjpcUghZl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:25.0846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbcff37-03f1-48db-23b2-08debbf8948b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829

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

Shyam Sundar S K (8):
  platform/x86/amd/pmf: Add util layer and userspace character device
    interface
  platform/x86/amd/pmf: store BIOS output values for user-space metrics
    via util IOCTL
  platform/x86/amd/pmf: Add feature discovery support to util interface
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
 drivers/platform/x86/amd/pmf/util.c           | 171 +++++++++++++++
 include/linux/amd-pmf-io.h                    |   9 -
 include/uapi/linux/amd-pmf.h                  | 204 ++++++++++++++++++
 tools/platform/x86/amd/Makefile               |  60 ++++++
 tools/platform/x86/amd/test-pmf.c             | 142 ++++++++++++
 14 files changed, 709 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h
 create mode 100644 tools/platform/x86/amd/Makefile
 create mode 100644 tools/platform/x86/amd/test-pmf.c

-- 
2.34.1

