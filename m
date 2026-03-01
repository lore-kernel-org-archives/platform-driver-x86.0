Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D28317171
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370715; cv=fail; b=TW3D66T0PkXibZqgGC2v07KQy6iK/AoA6Z/D3d1Iveb+8/rxgkcwLw5t5NAm1KDFaWCCX4mQGFi67RSFKGMqH9cO8kPX8VuliJ1GQjMdRlk8PYF9makTxs33fFT1XQchrU1ftbLFvw0kgYhFViFYd+zXtMpYeRy187KJsio1nt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370715; c=relaxed/simple;
	bh=3XtjqjPfyobRcpULNHF+Vm5iJU06aIcJ673HhxsSW0g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cnHMuypW/SQsL13pt728ljPtzyZDZY9s2o16gTXNi1AEi1iKcejGMwXSIYoetsRuaKqm52/hVT8zT2a2rmbBwdWV2BKxAYHafbncIs+DWuGlT51MnDCToDpZA6pWZ749A12/jD8lOTwJihs4o+XJvKP/n+YVH35LuqK2QtJXMzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qN6t6FVW; arc=fail smtp.client-ip=52.101.48.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qN6t6FVW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa2rMfafbE9bMq7mRDcrV/f9Cb74U5d0EO9A9U5oCsRGWgqiA5F8x/vGV0fkUtKdxozxx65sveAuPVSF+KBKWcGI0M4jLQd1e6buMhcTxjyc67u028Pyn0fY4KBqDdMr8D4Yhd2AJYWN2Q5BQwc2zmnCFBpn99KEUABp9V/KGL8FDAOia+D1GsR/lYMTkQfdwqxs+ZRkyXSmi4KLMUt6l7GEZ3zVfon9vYFu1FDSFDdqY+AoCQt+PNxiZNzKl5Hphgnu359syK5hJHVDpnQwKEv9L7BGMJHIiRJ/H60tk2IuvCS9oGWEWwtPg59iTIlgonQ6nJBhFkHj1BW+57OhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wocGp/xycn/n4CEPdIqCnljC9XAzCLw8jFqFTuxFOo=;
 b=JdKduqWYuXcZCq+jwBu/rWtPhDDc9Y33Zy6aQ0vlWxTm46N1T3eQvDPk++B9WyfXX9DwFUSl/XpmjWrYeYLJ2frGM7XyHoTSGq/ZBJ3miO+0OQFPYErelNX8jIpaLnHluMx9RXShxYOLNm4Qxide+rwT6+YpwNSkITbF+tkGY9+IuqgaLhFYFyqFYTwAHP320LWqmKOWvWUu0nK2qgC6Iku1BK7Tm5qrrB+jZOBHcXhqtr41ALcVq4N1mpdTlKicPMZ0XOdQXa/EcSTeJq5u7lN/Vl1yyCMd7lTt7TR6bRxBPi/ZTdk0Kc7ivm+vuFzdJumCfr5YrklFRX41ENmiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wocGp/xycn/n4CEPdIqCnljC9XAzCLw8jFqFTuxFOo=;
 b=qN6t6FVWp0UQ4UXjFfVm1q/LRc5mihGfmwXdrK5PwM3UxJk7GnaXMPYHK5ddDUSj8xQGMF2iE/wzwGFAdtgCq/9QGl3GNZTlb7vi6CNuTWb4hyC0OT+5PY9C/hy2x3onOQ1QiqAi7+wwxBy0mylh0xEOlTqmDOnN9MqX4dCRdYI=
Received: from BN9PR03CA0768.namprd03.prod.outlook.com (2603:10b6:408:13a::23)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 13:11:50 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::40) by BN9PR03CA0768.outlook.office365.com
 (2603:10b6:408:13a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Sun,
 1 Mar 2026 13:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:11:49 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:11:47 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/7] platform/x86/amd/pmf: Introduce PMF util layer with userspace interface
Date: Sun, 1 Mar 2026 18:41:17 +0530
Message-ID: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e52026e-044a-4c62-1245-08de77941940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	u/os9vCgJfSI5a7eAycJyjq/BNZk4CWdakdLP15Pg662qaL7OBKCPeEFWgd5Bjj2CznfrGFjFN9qp8xGaudBQ3wRyMqJ/LFhjz2ZKe9a5wzqLlRZv+sjsuIkn7LpGUNHInFTw9uvsqqNihj9YL+vuxBDAbmC1sRKuA01njtXheQoHaLekO8KEj3darx76AN/qujMj3lPyONx5pAr9A+kn//Xibq7t/yznx924IIbQYYLKS6jAu2o50r+dAms6A8sbuTJevyCqACvtKnvenIMlhwmJfHQylTe4SqRquyN09hhiKRq29W/AWAqd9G0PY50EotaeXyU/Tg3TYIBE/Kh9Ndy4KMpKK4+qJ1oNG8mDhlzb0MkfPrYMCEx+Akbou8WgmrJ1wEv6H508vY6C2Yrlvu9XG9nG28RKhGYqEvkCXUrz2Xpj0fAr1uOQksZKek1ejEudg4KftMtxXoH+MoxrSDxORAcZ31BWsqp7hzZhex2T3PyypJ2nRjwbig1nEMeBYUGOBas3Zktd01zhfdxgA5aRUv1+P/lRbTcgMUa2L8N+pA7ynJvpLrbsk9S2cznDVFLsFdzctzOH2ShCANn1RsZXZ6Mv7/xnIh2tX3Nh70L1FxoAtd2m5HP3Ipnpu3Cc0xyqw06Rp6xUSA8qDi0UeayoYKFeDRbwmATqmzR8IKUYkd142kJ3u8rYuJEte3WXALj5gpi3hbkXz3wN5aTM7YVv7/s2UjFKvuC1+0SjrpeRqodM3WymquX1wsbMYl622yrIgWLGeLwHBH1RyoS8R+F1P/eizan4BbUkmfkSNwlnNQgojlJTKzeEt3rlIaJ0lcEgNjER+2FrKptatM1WXMMLXqtH2bW5fqGsAJnORY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qEg3ulAkLQKGSwFfM9kPrsfj0w42SPpaTXF4FcUsrgZ9+Drn6Df9jk6deNMhrrTbt3k7mMhvAAe/hMBp/M7OhUR8sdr6BN/JIkVYfS2Yp+pNdWicLZQPUZi6oVPNZydvO8i5ZZ9geleeDC0NNMoKnD/b4r9pMZ7iNhO+Aj+IDxwJG0YlzuGt+/6dS9kxtjDajiMLP3+ExZpSqDuhEjdjQex7VFoGDOHdvtOrOnO0anuQ8wIPnx1KdYbm6d+5E/9ujjNCtiW0Wktv53AY7gGzawCXIF8VZXweub07G0DREcJ98/BSNuJstZVRtUqmPFiS8nr55nlJlZGpiyauGsFzEFACG74Y3unaVcM1rJv9br/sbpOihsbrCdNx22y7d5mdwlAB6MwY/sujv8EWPfoTIuyDiS93S2LBLbVdlkCLHH+Xz0Jh1uefHXwvK0601QdL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:11:49.5276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e52026e-044a-4c62-1245-08de77941940
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

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

[1] https://lore.kernel.org/platform-driver-x86/20251111071010.4179492-1-Shyam-sundar.S-k@amd.com/

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Add util layer and userspace misc device
    interface
  platform/x86/amd/pmf: cache BIOS output values for user-space metrics
    via util IOCTL
  platform/x86/amd/pmf: Add feature discovery support to util interface
  platform/x86/amd/pmf: Store commonly used enums in the header file
  platform/x86/amd/pmf: Move debug helper functions to UAPI header
  platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
    metrics and features
  Documentation/ABI: add testing entry for AMD PMF misc device interface

 .../ABI/testing/misc-amdpmf_interface         |  70 ++++
 MAINTAINERS                                   |   1 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |   1 +
 drivers/platform/x86/amd/pmf/Kconfig          |  10 +
 drivers/platform/x86/amd/pmf/Makefile         |   2 +
 drivers/platform/x86/amd/pmf/core.c           |   8 +
 drivers/platform/x86/amd/pmf/pmf.h            |  32 +-
 drivers/platform/x86/amd/pmf/spc.c            |  55 +--
 drivers/platform/x86/amd/pmf/tee-if.c         |   9 +-
 drivers/platform/x86/amd/pmf/util.c           | 210 ++++++++++++
 include/linux/amd-pmf-io.h                    |   9 -
 include/uapi/linux/amd-pmf.h                  | 324 ++++++++++++++++++
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
 .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 +++++++++++++
 15 files changed, 897 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c

-- 
2.34.1

