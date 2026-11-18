Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795016164;
	b=35jTbsGavgN4TKXESCSoIjFZkbjgeWnx0ICA8a/pf9C6CsuiCYP0SzBx+9ruAgjpKX7G
	 BNTLJLtVk3fFMsrQIHVb/T0lbSufV641WqOKeWh3VJJs40gmfHX56RwN9JVL1NhbgjYRO
	 bYtoHm/lNsCvmJGL08HObD6iEmoC6rjLlOM+8KK9AslLXsHHWt8cEC4BZHpICB5rt1UTV
	 4rLWs7Dz1krqXSHtzmZTTLcCMcgxvrxth9aYzO2QrpSDxzktOESAproiidz6u0OHjmj/g
	 XVKEpYqb9lBOXqKRQ1k73SiOC5JE/wPEWLjIWHbMZ6dZyj6H99aKZx7r1iE0LQvP/MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016164;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=noQGNKrGijPzqA7T7JfNGDvSmmPuVAWhNuilsqU2TOg=;
	b=WEd1SJaF5OlBLwoeH2TXwFKfuNvv9FVzxPaFuE8eDDcM9hhSpzrxUln98SHtlCNckJBW
	 5U/ho0umgn7eQQncUImVTsEuUakwGce/yLuGqzPgaYV2eXUSwDLlVTxUlCu9TaNoYrwkt
	 y9KSKFncQIzU3kufFBa30KTFnhvKh4bG0DNiWm/U3I4/VPaOLQEZu1LCM1PT6vG3kceg0
	 fxyKmN+pYDQA2f3GqOfHooQIE2L2gIYnNJzRmX+7i1AKt/oLihGE/gHVDdub5ODSc/rDp
	 FBii1209D47+A13Xq3daK1IRUAiW2LkyzqZvB0P7WUBtlPRdrx1J0nOBZe5i0Fgwztg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XJXhHuqD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.35
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655C606A320
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 15:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2655C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XJXhHuqD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z18L0yyNfnuP7048xwnrCYaVp3JLW1nCVPASN7r2C1VGGLfUnplrNzF09Cy2moc0Zw8TrEX4qfISbRP9XR62RT/YjeQ9bj3E611/Md2u8fODrWCZWtM6aUXUTGSEoM2yC5SEvI6c+ydv6/AsI3WSD4ek7P35gFcEQBntZpBL24sFkWjnWaSmmq61G0lSQciW61ltpugXErtQLkWzAnQUbVzADlqvu3tN5t3AQu50OlB20lUYEKDOqmOxiXhVGy45b/aSufqx+QaJEygCvHZiX6QHgCccVWkddwDkLpAaeCxTR2H93iSwDpeyZKfxValnQrZgkbtl/GxoZBHdkstlbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noQGNKrGijPzqA7T7JfNGDvSmmPuVAWhNuilsqU2TOg=;
 b=bHMcMkjM2NVGdZrUoOaCbV6hxoDXwBgM64qHw2Qkb1gc2xT6Gaod0rXmzTY4BRuVfGrZiZOnS/7ApZRNN1NlynmgcgKJp6FJIYaoHt/voByjwOyXq6bGk2uN3ntRnLxKTICVwPaBW3W9vY57eIasMIKqcIEwDnzhOmuw4Oa9ruPzu7GutrPTIH+eJbOCA7DTPaxIvrkcE4BaBsJQ0cVDRXLVFCuuSgilxEdcgDmfD88o//KjzVOwbmGL3Jnw5LFkF8y3PAseWFlJioH8wRi4UJssuYKaKExyJAcVn9k3119JFkqlZdx3wPsnDagpXihKWhNLzNy5qcaMqZoumurDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noQGNKrGijPzqA7T7JfNGDvSmmPuVAWhNuilsqU2TOg=;
 b=XJXhHuqDNIsnREWEk6doGUesSTPBa8j7V/Vm2nXGqsrv4FtLzFEKerkHj60aZij5/FYkdBjpw0ugjQT55d/mBrXb5cItBIf0dVmThyrupUulNNvwIiKHDzfhnJvXLUYltxOtwprKiB4QGLyjICG8aUguw9UcHMi0TWslFQCD0Y8=
Received: from PH1PEPF000132FC.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2d)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:35:50 +0000
Received: from PH7PEPF00000008.namprd04.prod.outlook.com
 (2a01:111:f403:c95d::5) by PH1PEPF000132FC.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 15:35:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000008.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 15:35:49 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 09:35:47 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/3] platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI driver
Date: Wed, 18 Nov 2026 21:05:20 +0530
Message-ID: <20261118153523.3627870-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000008:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 62917fba-ff38-4226-69d1-08df45899f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|5023799004|261022105027099003|11063799006|261026140227099003|261022075727099003|10067099003|261021121427099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2dkohTCHxHD4DheBsmjD2gbHaGqBmDCnksEYFHZW/mmYnO/i0rFaS7Owz82xoZkUjxeKkYVwM+j/sWeXuWQ1PWTA6/RucoUBNkd3eir+bR82jnH7f7UqKq5RppJKxxJiWBjAO2pDD0qkH/D0Y/aj53CEg/GVdCtG7zyi7At217RnBVhvmLGFtZExSJE35GTD89Rqb5qYEzOwTTki+Znp5Jp85uGvgjwWUqHOXyQ690MMw25pCuuK6J1/yxv8JdfuZazVaVwyFzVJ9Tt1Vtt41rR23WEKXZt4hhBschTYH4Fwc1htyzLAo9OZ/s+xiTV3yjK/iuxHPQ+ihhKCY0o+MZW8WG8JhvOgPlHyJGQXSLgI6aK/VAM39X3AFfFWaTkIiePMxI0bw+wEGvEzi0E9m9LpfGs7ngpIr7Cjltspo8OkppCjTqza2pixFpjbSK6YI4gtqqX0mTdprYuAySX1TereNWQXUJyCBVR9yba2+kDXZyUkTmX8NSH2GDRqJlXM9Kv2ncQvnaZooAc2ayWT1AHbvD8K+iX+arCNt4cC4bmhQv2biae706/CGlXHQghlzpYHBxoA4zGag/dJIbAZGM4yGKVYLD7VX56IGcFbgqRp2ZaR4UZj2+4v7EfnOdIgp3e65Uq+vGgtlj58Dnrur9q4kKCQNT/kU4Iu6dd0rCo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(5023799004)(261022105027099003)(11063799006)(261026140227099003)(261022075727099003)(10067099003)(261021121427099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	74hwtMlk+OK0pXProPqDIZJFGwRDAXV4yk57xv2eVsUb4bltl+KLA8jm19yzzQCf/I3F1ddH6P1w1Erk6PJCJULGUhLNP9uEf/YADgwXeD8qRacIyWeKi6yr8nP91D0ogZCrSHq1skALsg1RGYuXQzNvfZpux+pWST5UsJ+Kv0fMZW+she+PFpUfMLNxA5AIqWkuMrZKFENTTo/9SSVA4Ab2TPj+NUejFRzAM2FdzIx6Je2LrKfAvuuDYApvsNREePD0p4IaDTKuY+BYK7CHXNTRqKevViCjrLYq9WQ7doOsHqlkUr2XUM8A6ynyzjIlnXMCx2ny52gqQG/SfxqRolGUPz0gorELHbfzYBzC5Khx4fDxQMhTGBvdAOORNeHeZploCA2J4ZBmSySC3X+7mYKabH2K6V76iINUObPl7mI1f3JbIDY8gFQxsWIVAyjg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:35:49.8723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62917fba-ff38-4226-69d1-08df45899f8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000008.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711

AMD Ryzen platforms implement the AMD Overclocking (AOD) interface in the
platform firmware and expose it through a WMI device. On Windows, this
interface is used by AMD Ryzen Master to change settings like the CPU
power and current limits.

This series adds a driver for this WMI device. This is an initial version
of the driver that exposes a small set of settings through sysfs:

 - PPT, TDC and EDC limits along with their supported range and step size
 - SMT enable
 - current memory clock (read-only)

The firmware applies new values on the next reboot and does not report
the active PPT, TDC and EDC limits, so these attributes are write-only.

AOD and HSMP both touch the socket power limit, but at different levels.
AOD changes the firmware setup option (the PBO PPT limit), which is stored
and applies on the next boot. HSMP changes the runtime limit in the SMU,
which takes effect immediately and is lost on reboot. This driver only
deals with the former.

The firmware supports many more commands, and the sysfs interface can
grow as needed. The raw WMI methods are made available through debugfs
for debugging and platform bring-up, this is not a stable ABI.

Patch 1 adds the driver with the sysfs interface, patch 2 adds the
debugfs interface and patch 3 documents the WMI interface.

The new drivers/platform/x86/amd/wmi/ directory is meant to collect the
AMD WMI drivers over time, along the lines of drivers/platform/x86/lenovo/:

 - one driver per WMI GUID, with its own Kconfig symbol
 - aod.c (this series) is the first driver in this directory
 - amd_halo_led.c would move here later as a separate series
 - shared code goes into a common helper file once there is a real user
   for it

---
v2:
 - Call Init() during probe (Armin)
 - Add defines for all WMI methods, use an enum for the command IDs
   (Armin)
 - Always parse the command names to detect truncated buffers, move this
   into patch 1 (Armin)
 - Keep the Getdvalues/GetMinMaxSteppingValues results and the interface
   version in struct amd_aod_data (Armin)
 - Drop __packed from struct amd_aod_oid_package (Armin)
 - Use const attributes with .attrs_const and .is_visible_const (Armin)
 - Use u64 for the values shown in sysfs (Ilpo)
 - Use kstrtobool() for smt_enable (Ilpo)
 - Use __free() in amd_aod_get_object_id() and amd_aod_detect_settings()
   (Ilpo)
 - Taint the kernel when run_command is used (Mario)
 - ABI: update the Date
 - Doc: add the complete MOF and describe Init()
 - Rebase on pdx86 for-next

v1: https://lore.kernel.org/all/20261010190543.563161-1-Shyam-sundar.S-k@amd.com/


Shyam Sundar S K (3):
  platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI driver
  platform/x86/amd/wmi: aod: Add debugfs interface for raw WMI access
  platform/x86/amd/wmi: aod: Document the WMI interface

 .../ABI/testing/sysfs-platform-amd-wmi-aod    |  99 ++
 Documentation/wmi/devices/amd-wmi-aod.rst     | 412 ++++++++
 MAINTAINERS                                   |   8 +
 drivers/platform/x86/amd/Kconfig              |   1 +
 drivers/platform/x86/amd/Makefile             |   1 +
 drivers/platform/x86/amd/wmi/Kconfig          |  19 +
 drivers/platform/x86/amd/wmi/Makefile         |   8 +
 drivers/platform/x86/amd/wmi/aod.c            | 955 ++++++++++++++++++
 8 files changed, 1503 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
 create mode 100644 Documentation/wmi/devices/amd-wmi-aod.rst
 create mode 100644 drivers/platform/x86/amd/wmi/Kconfig
 create mode 100644 drivers/platform/x86/amd/wmi/Makefile
 create mode 100644 drivers/platform/x86/amd/wmi/aod.c


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.34.1

