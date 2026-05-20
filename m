Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DAB3FCB27
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303352; cv=fail; b=lQ3x8fdAVVabq8/w29CsIi20Vmeh2Fy9yyetwOjqiTiUfSPiFp/oIj5snloYK3C+5yRAZm0fQykjsW2npgQAu6LO9yCfc8ReO4pecPFxPtt/QWQrrAlyR8hkUm59F2XwJcXhwode04Lim8uVmZBrsjUfp9n/L1jIDhusWZLd8tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303352; c=relaxed/simple;
	bh=ZdF4rxYMbOLB69BNv/21peO2+6MHHIeTMNMJ4J1PK/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sTEPCQEbeufoFsw2bhpZ5CkRBQxAwRBabZIsqB6UwRZ6tfHzpQ51Ha6UVF+C5Pc5U53UX9r16s9pLExV+PRUn8WZtepZzkwq9pLfX90/3ZjIuDQwBGbyQ5K3tQhHGe2ulcHp/wM9vN4/TSPAxQhhqdgCetGoydJT1w96HiUySWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cVJmlu6b; arc=fail smtp.client-ip=40.107.209.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cVJmlu6b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX9wpraRoNMUAxLXXRL+b8/Rco/xKv1TaByCWJw6AGU5/Z1KlKOPpYrRhKDD9bUcT3GihQyoQUszxhDBhaEcc2bw68PShyd38tqI7Z7+AQlQQmx0tpuXfvrGp5IEVLe97CqZgLo9rn6pWskGVmh4kJglfNB/Ms6fyQiywOeDbqmW9Ns/eCzDuL4KBJuZm5f6aQNFR2PN6Y168kdIJqzotLkdgjEXWPPzO+Pus0hYqG7PfFJxcSdd3vtFKKo5gCzkJFp+fY86Btn4alhDKKPTXcov7WLBjxNlfTiDRC7PvLROfChS6zwNO6pS40wATf1UGWpd6A3Wnd6hjrasTq4I+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KfpME7E9R+jJ1SyikPxroDI6BhYb0rlRts4KD3U8BY=;
 b=bjnb3+AlrQhW+q7nOEJ3glnlGXU5LJMCyvYMRm4jn6md5qAFPthQnwiQ5wbUNtDaa6L2E/t/X5l+yPJVvIhrYjwuNrWDs1me/mooRPl2ZzbUT3HyNLvIQ5YlzMcTwpPD5xH73Mu5RSVCBrS92m26fjOAgIM1+IqtswPZA7rJ+b9AAwjT8nyfR5eaiBP32vex1mFIwH0VgKYiFLBM7j4g10rXpDOP06gKLRAeF2EXK7GmlyMKK6RYhtzlDBomMDaPCQa8w07sRSBSh42wHg2ZFoY63zr0Ie3KUaFzpiNTxN6LCVG/uVy1DWPrHBya8tYsJe+oF2VE1btnDRljYCwkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KfpME7E9R+jJ1SyikPxroDI6BhYb0rlRts4KD3U8BY=;
 b=cVJmlu6bWDoE1THP+1oQjGz7+4uEUjp7BXJ9Ovianjn3r3cehtPfwMXzT+OT5rg3ohg7dBhnaiUqWAGd0tmJaE9vsb8u5GgcFpWGe/bDRc4AsbxmOodYeY8ko5EjJULaq021s/2ccABV6IXVFV5kYc+rpzU2/qhW34/CmsjNy2A=
Received: from PH7P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::11)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:55:45 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::36) by PH7P223CA0015.outlook.office365.com
 (2603:10b6:510:338::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 18:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:55:45 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:42 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 0/8] platform/x86/amd/pmf: Introduce PMF util layer with userspace interface
Date: Thu, 21 May 2026 00:24:16 +0530
Message-ID: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0552b0-c0d3-4b30-76aa-08deb6a16651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|6133799003|13003099007|18002099003|56012099003|3023799007|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	HHEdkJXf25U6cwgSjayxOBI4o0wYgFPMIQtMMPVpK/WZnfD45VS+yb0Ouw1yS4XWzmjlRz+5ule6hbtypN8GV/cy9cpSqho/BSMgopXdsMkBBmuIKKn53GA/Mf9H0JiiUrCUkreEloZAomsmnC/hCNvbw58LbBCGKEBJOh/SgOF6U77/HDxM7cKKvdtvjiu0nUR7U8r28xTjSK1IMVx8l1ksxJ9QiJNPjQw3oj88o4NAuuo68Ueg8A8GYHDpujdBt0FHYyLEE8DkHk5ko52lmza2tdDMBNAV1B2ffXmx5SICBZNdDw8SEIYthyk1g8jSm3KFPwiDhM0uojNir0HMkTLub4jY5WnzkIcLXN7UumTsvT5m36yL+c1G6E/eAeC25KMel/6lfwywwRyMA/hiYif9ScbVeoU/CeXcFdMtnJdarLc6pocp9DrdqV1fIk47Y23GO9ury83rbN2jl/MxsV3tGbEu5dZJvN64sGMahNZmLcEEIqSV8vVpGaKPjZpEZqfLYF1ym8oU4oWu3+88RPsiajGrfoI6uuPVkC8Cz+8eWH1nlXU+cqrX5ZaosszPReRXo0b6ATNH51wb3/4458syQeGHWYR0TVW3ODp/dwZJ+J6nWx5p2bAbolAWWWXs/ixvWUVkvAQQx+DNi/0XACX19AFuZiWKbTYjyr1WWUzV87K6U3XBD3/s4YFaHCG/QyA2zZ3bsV9EAdZmPrFIIa5hT93se+Lt/RBl3DXdyrU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(6133799003)(13003099007)(18002099003)(56012099003)(3023799007)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XtTUjjQSxZxaRStPJuvV/kF6CK9E8DKVW5YmB48uO7NX89Qr3fjQPJr+12UUza8l7HhJwlym158u1ZBc548Q6sY/gW85aS/q8KeM0rSC8rSLeg+slQeMIkTCacQUbodBJoARyGsMy8139aPxB3FVybNk9j750cjePB5GGZB7AMvgskgDRhcwx1Ubl7j1cnViNHKEEKpSKdTUHuZ+Go+Kx0tGGA0+zoMHWR2PzEtI/kL2q0lnCuRaOXPmH+dTZp15m7xu3YlPDAZQV6t1lTBfzOVsF51hbs68QI0svETH3tsqjoqOStxSg8KzlJz/Jj85Q5MD8pzeNR6d49/gK2lQ+3gGQMBxLbNM1ayeWICx3TkEA1SnhDH55GH+20yk7aKnUX290bzcpD7btSEAmOYSC7JfrAP24okaoh5kSHTvkB3kwCYE2smDNYKPjIbHF6Vc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:55:45.4920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0552b0-c0d3-4b30-76aa-08deb6a16651
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170

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

 Documentation/ABI/testing/amdpmf-interface    |  74 +++++++
 MAINTAINERS                                   |   1 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  13 +-
 drivers/platform/x86/amd/pmf/Kconfig          |  10 +
 drivers/platform/x86/amd/pmf/Makefile         |   2 +
 drivers/platform/x86/amd/pmf/core.c           |   5 +
 drivers/platform/x86/amd/pmf/pmf.h            |  33 +--
 drivers/platform/x86/amd/pmf/spc.c            |  68 +-----
 drivers/platform/x86/amd/pmf/tee-if.c         |  11 +-
 drivers/platform/x86/amd/pmf/util.c           | 155 ++++++++++++++
 include/linux/amd-pmf-io.h                    |   9 -
 include/uapi/linux/amd-pmf.h                  | 202 ++++++++++++++++++
 tools/platform/x86/amd/Makefile               |  60 ++++++
 tools/platform/x86/amd/test-pmf.c             | 142 ++++++++++++
 14 files changed, 686 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h
 create mode 100644 tools/platform/x86/amd/Makefile
 create mode 100644 tools/platform/x86/amd/test-pmf.c

-- 
2.34.1

