Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D646D42254A
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451811; cv=fail; b=eRepx4/iuwgZO+IHmXoq1m6MZwaUzypBZax/yXQW4f+H4C2pCbIXpJlQYMIuGzuiKlyXTGcAErRQsnZWR5YI9Y6IrWk77Rf1MzbJtnkgkgM8jUfgUrx5kHwz8Wp4NvU5tueuvrIERoriAP6WzFw0dEQlv3JtU1//Ic3V0adSKF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451811; c=relaxed/simple;
	bh=XMYyXwLqPF01ZSMiC1bFfBzfI1bbP8xuC1UI5tDMfio=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LloHqZ/fm0nes14FiiXQW3/bVH/DynqPcxTPw0vThjVZfl+xrxkYexFWuKLE8EDwyvYYbDAda1MwunCdA6VxHhfFKL7uOyx+hvZwB1ni2/ciFZi2Wq4JE3DrMhLWpg0eE+RLV6YBQrFhUJGKN2PLxPmTpagZHT70Gic39920zB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iInPAEi4; arc=fail smtp.client-ip=52.101.193.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iInPAEi4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0r0qND5U0sEUZEPfTTBSGyAkL4WbxbkOfgQNQEukAhHVXjuemRsDF2O7ic05N1nEJPwhfAUOqVCIl1q1zRCqSGqzG73cq2xbIZLdrji6l100r1NNs4KOMu+dMJ3v7WT3or3cH/OywD7yRUiP5xFhOwTGH6elklJkuh/yX6QbFh5eXZTsB9/0QVw1Rl8gL/Lofbc3lLa26PxPfjy1cLiR/XJ3IS1E1oFb8crWZ4W5nhT1mOjMjPBEsbf52xsPCoAxcXlJI5wvZOJN4QiJprgt7z5CBZ0yiSeO0gjsLtrEWAdOER56GFop5wn1rHbJmIMd4RQqDA09ZpEODVDLZIoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HlDsG1gqYMHaL3END/8vhzNyMHT85ygt3PuncueIN4=;
 b=gbnrAglytYFjIclotJq5Qpm5Vx93nwqyP2GHjuAAmDqXcQCn9YDpDW97CT+6dc/G0a0fO1JUxY+gWlUemKnIVFPJf+IgwqlLJZsaZgIclrA3EjUH0cys3cOo/0jOyMRz0mxJxqTA3H1sDH1VcaN+kQzwlsQAJsMw9vrhKxMNlGfG0FxIGAi1zbPWW/0FClro+IS8XcTHvW3knGBCSNnAm+bW/IYx1jsNnYKZg0rlHWdHSZ0+7zf6HRqpqT6YYzw3ws9Gvf27v/tes9QsCFiXq46JOwxOXiNncpIqY/xOoctFNRlQ2YlbypSCAIrl+ixGBVV7m4yXUjEJPf2afM0y4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HlDsG1gqYMHaL3END/8vhzNyMHT85ygt3PuncueIN4=;
 b=iInPAEi453yRjipKeIoR3Vmy9pW5tvQEnhFBuxZpnVdAAXEgEFLugUxf8SugkLCgUYH6yKy4JSOIFOZidUEO/4305D+TmajKvX5gLz2AiLj3K9Vmm7hIzbNp0+aS7PBIoaZcDCYAbk2J/t+8BhlX7BaRa562BfhHnVZ3ZiGVD1w=
Received: from BN9PR03CA0694.namprd03.prod.outlook.com (2603:10b6:408:ef::9)
 by IA0PPF7D094C5BF.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:30:04 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::8a) by BN9PR03CA0694.outlook.office365.com
 (2603:10b6:408:ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Thu, 8
 Oct 2026 09:30:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:04 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:29:55 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 00/11] platform/x86/amd/hsmp: Per-platform enabled-message bitmaps
Date: Thu, 8 Oct 2026 09:29:28 +0000
Message-ID: <cover.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|IA0PPF7D094C5BF:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d015f5-5e1d-4cd1-a00a-08df251ebbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|56012099006|11063799006|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	9r4wgdtowAOGdoVgQwsdGo8mwQvTJkg+6+iqxTd8DyiP7C+hQc7wq7KBUxtSC0Vec86/nMfH0N9QJCkslJ7PXzc5bpiFog2QtFECdoRTXe2FaEcWkJHdMA71bEcTrjl3JUU2eR0du5b5AtFj1Goq4PoNPJgbqkBiGVERLLqPQlUeqNUnfd9wFapufc6Ez/GtGkPVOgQ6bTXMCSkVTSmklTxQcY8JlBqQnyJy7QK21Op2zTU8GyTFq2ZG4iAZjGg/C1q4/r60ybAdQtTgeMSTUoVhJf2chyZdRjADXwv/larSyrYmj1R37/ISoEmsJgjQ/AbCx1EYv3eVtvGxPMIpLwSoDla5pJ0PIMeje/zW4yB4APzOd+dhx9/zD3h9Mtw5gGUEDctVSUbot8V6OA7n04fymWxFFqckhA17gi8EfaD19QEODwJ8GmcoZAHYxVyj04ML9NI+U4SlzMFPiGf65tIbCB3nwb5O7BWb0rY8935HsJi1v0zPF8OmgRUi8AITh0cz14zkTUH64cJbjcNR0pPWtA2nd9RhBvxfMXrc7qxEHFvOW++OvZg2ttwTboRTj7/Xr/MJsJlhqwtNRSqBXUI6pPndrDj9KMF9dOmMQ6+OLoAssmoRhnDXrlaSKj1yg4AaqZ1KZ5iZxUr22UUOz/kSdjXWUJY553vD2OWvnF4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LzSGrqusEDQtCNtbUQ6Sas90MTifYMKtnDfIuMA2H4MwoYjOD3znAFIBA30/+9lExa84obqcmesFDgubcPwbhxmQRcZBP9jLGBfjuSvAc3rXCDrX8Bl/wbpxryeWJ13jB99eb1VgYtFue+NUT47gJOYwep9KdVBwUPQUP8CZ/Ine1eYL99FZ6wvtd1wvyjnUQsToP62rzJ5qUigNb9zdT9BqLZHRY5TOAW7QAG5m1PWHR4qm+XEK9LoY/wpIfTHacsj+e9fF3BNrpzgQMzIbH6nFmD0REc1PBfXOiNi60U+HtIRbyX6KfJvO/ZKH+paaSMRiyaZhegiu5twqSVOobv4QMxtFqz1kj2ANIrI60p8HThZwFbuClhusOHFsrFxzjsGEDv5wFJYoJ6OkuX6jMihOpPs8mIptaKdX3CLPHdKboVueooOJa1FGtaBAeAaa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:04.0127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d015f5-5e1d-4cd1-a00a-08df251ebbd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF7D094C5BF

From: Suma Hegde <Suma.Hegde@amd.com>

This series introduces per-socket read/write enabled-message bitmaps so
the HSMP driver rejects unsupported messages before they reach the SMU.
Prep patches fix sock_ind bounds checking, move proto_ver onto
hsmp_socket, and reorder helpers for the validation path. Later patches
populate the bitmaps statically and via HSMP_GET_ENABLED_HSMP_CMDS
(6th Gen AMD EPYC Server and future platforms), and update sysfs/hwmon
file modes from the bitmaps.

Client platforms skip bitmap init, populate, and validation until
dedicated client tables exist; shared smu_fw_version and
protocol_version sysfs attributes remain visible there.

Patch summary:
  01/11  platform/x86/amd/hsmp: Fix sock_ind bounds check in is_bin_visible
  02/11  platform/x86/amd/hsmp: Move proto_ver to hsmp_socket structure
  03/11  platform/x86/amd/hsmp: Null-check drvdata in hsmp_is_sock_attr_visible()
  04/11  platform/x86/amd/hsmp: Move is_get_msg() before validate_message()
  05/11  platform/x86/amd/hsmp: Use local sock pointer in init_acpi()
  06/11  platform/x86/amd/hsmp: Move the sock_ind bound check before validate_message()
  07/11  platform/x86/amd/hsmp: Add per-platform bitmap to validate HSMP messages
  08/11  platform/x86/amd/hsmp: Populate the bitmaps dynamically on 6th Gen AMD EPYC Server
  09/11  platform/x86/amd/hsmp: Populate the bitmaps dynamically for future platforms
  10/11  platform/x86/amd/hsmp: Relocate to_hsmp_sys_attr() macro
  11/11  platform/x86/amd/hsmp: Update sysfs and hwmon file modes based on platform capabilities

Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>

Suma Hegde (11):
  platform/x86/amd/hsmp: Fix sock_ind bounds check in is_bin_visible
  platform/x86/amd/hsmp: Move proto_ver to hsmp_socket structure
  platform/x86/amd/hsmp: Null-check drvdata in
    hsmp_is_sock_attr_visible()
  platform/x86/amd/hsmp: Move is_get_msg() before validate_message()
  platform/x86/amd/hsmp: Use local sock pointer in init_acpi()
  platform/x86/amd/hsmp: Move the sock_ind bound check before
    validate_message()
  platform/x86/amd/hsmp: Add per-platform bitmap to validate HSMP
    messages
  platform/x86/amd/hsmp: Populate the bitmaps dynamically on 6th Gen AMD
    EPYC Server
  platform/x86/amd/hsmp: Populate the bitmaps dynamically for future
    platforms
  platform/x86/amd/hsmp: Relocate to_hsmp_sys_attr() macro
  platform/x86/amd/hsmp: Update sysfs and hwmon file modes based on
    platform capabilities

 drivers/platform/x86/amd/hsmp/acpi.c  |  92 ++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c  | 203 ++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h  |  29 +++-
 drivers/platform/x86/amd/hsmp/hwmon.c |  24 ++-
 drivers/platform/x86/amd/hsmp/plat.c  |  26 +++-
 5 files changed, 339 insertions(+), 35 deletions(-)

This is rebased on below patchset:
https://lore.kernel.org/platform-driver-x86/20260924154947.1706669-1-muralidhara.mk@amd.com/T/#t
[PATCH v7 0/4] platform/x86/amd/hsmp: Family 1Ah client support by Muralidhar M K

-- 
2.34.1

