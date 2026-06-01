Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012027.outbound.protection.outlook.com [40.107.200.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155DC281525
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312904; cv=fail; b=U/8qWCKftzMS/g6a+Ieyx/xf/fCWkwSvOaEXFOeldnPcVPPR/Aw+RpoDUmi8EuO+qIVIh7ABPEBTgjiMCDATkcXeEI4ZVSUAiptCfiheExBjzR29ey/+wvweLSegvZTeLjvwjf59ZdqzmDX97InpQBFn3XxdZRcod/UTjN9lK48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312904; c=relaxed/simple;
	bh=r1b6O9X1nHu207dvB5xmTIWgDIDQJNntfIwZ1scaHMg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W+TN37yP1oC2bbru0zG/xDu73v5pMxeHNMto6HUitiV0i27faMRHHeX6/9hrRj3uMKfBzDI2/3JBlMIn3wNr7rvuJ+lNLP8pVT5bRFM1g/vPmHvN1SdTojFCxHTmmSmYdnfQ14bA4Do3qxpiAwca2vL55eXuNtJ6ahEFiv3wHpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jNJ7wLMs; arc=fail smtp.client-ip=40.107.200.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jNJ7wLMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osPjK0LGPBLUSsTurWjXCeO8nfhg5vGVDVngDLCxYnZaGpnrLv6jvl7HlhvLkaKU1/moxyzvloQZxymtThUTm44qI2YZPu1JFkrrcKrJPXkAmlum614bUMjpEM0zlK4FzsgbLBw4jyy6y5kpz1IqM6Mi7lm+q74k43gZUrMwCMNroTvCdgk7SAgLAB4ikz64eKHul31NBWqy0imjn4mTQgpE/6UWirbs5WseXO72p+7HcbttsK+KZRwIcyEP0KWkMQYtfG/GJCiF0rmIEY71OxMfRHIopH2YFyX3B5JdeaKA5k9Q6u/COh4+xEmPBH2C3vn3zHGgnfi685JaA83kFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J+f+aC+VsFHgM0/7xda3van8JjKUEGzdDkm633YvcI=;
 b=pbX164gddrQ0bZBoLzN4A0tGL+qu5VrAUwz01Yu4eECV0i9FyV4454YVDZ309Qq5yu4HPiqzrIakTuxPvAFoRUp6FwF0leyf6qLIlZ6viUaRbjKi+cLfhti4z6Q9va3Uz90vCNLNWyAg7ckJiIQPZskC2gc97Oojq+Nkuh6wV8eLADu6ivN4ngB4EXpqxCGZyZ940tAkaBpesYn0l/7Iuzo5XvbqJZQX6sSFwdj8XfqIe67KY7dHo9Nc94yNsQmU2ElxckTDP0rDicyqWw3BEHy2gR9oNrAu3v2QO2w9jzmHVcFugxfdWaTb+aWgf7LJEvBKIbeNY5/HwgI0PVCg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J+f+aC+VsFHgM0/7xda3van8JjKUEGzdDkm633YvcI=;
 b=jNJ7wLMsynX69/pIJXxYXffCrG3WI2aAiSGFa/HWjnRwEofmqZm7Lf6Er2dWp8turCBZ1uSI57AYlzDny38moVD1hcBjxMA2g3q6f2asEy2LOvKmhwvCrT75WJsEGxf98wgVTsj7grApWQVxiVd48i6Zcp2kP7K/eh4zprvltGU=
Received: from BL1PR13CA0379.namprd13.prod.outlook.com (2603:10b6:208:2c0::24)
 by CH3PR12MB8851.namprd12.prod.outlook.com (2603:10b6:610:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 11:21:35 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::45) by BL1PR13CA0379.outlook.office365.com
 (2603:10b6:208:2c0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Mon, 1
 Jun 2026 11:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 11:21:35 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 06:21:32 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/2] platform/x86/amd/pmc: Add support for AMD 1Ah Family 80h SoC
Date: Mon, 1 Jun 2026 16:51:01 +0530
Message-ID: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|CH3PR12MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb65e12-b38f-4701-e051-08debfcff0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|6133799003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dj0710b0BS71YO0BHfKnNCTcIWAmEaPofLqJm97GT5REkFyt2EIfVEbdlA887V3gK3Hb1BbNZjrb5n7vXpTNXeMnR4aNERMnF0xCb89Clhyi9n8k2QfEnje70kK4fm0aptCR0mtPeLXMpXEZfoXQAo4dUauguctNcShw8+U1uI+s78b1sQFWQ56+yCol5pv17wZFN4acWl+8l4S4c+hS20jyO2q/4Es3gUKCSUbOx2PxaPrNANFtrJUd5129onF6NpPw7wJdccxC8Xt7rHSYuTlmodITE/oWc0bHH0u5AwuIaxqmcb52T6V4A1rEg/dYoPg7rAh8+9np0MJUdvjX0DsyhptM2VWZj/j0JBA5aXmNsRHt7WErIq3TjuS29/Wqo9lgIAzV4ARngGn48xyUTtYrCdDLKQgsIaaH1abzJI9J4BVNg6rWye2sucfMpqRvZ9ZqGaZ8ka6S+r27gWgg0SM6JI8MqHxrvPQ5tGzgegE7Du1e/uWchbo8PZnoqNpHcjPKOigOMbO3GHIQHxux8rZnBCEJdYHIjFDojgh7NpHTrwN1D5UXuTxuY1F0IcYGyOVhdmst+Nr8vdFHjIXevYMjJcZar7YccDkV0Wd9UTOwh2xlxoXjRt9pBOS9KMXE+eB30aBbZptS/w9XEQPFixpEf5oGV3BwIRktVFmg3KV9LXNxD2kXhv8pa8+RI1BiNDzrnoRwoYPonPjOOaMBJBd3fauBBME7WvVI8rKQjbo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(6133799003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OoGSAvCbBIyn1F5rrCAY/La6h/ItZbhsTUfU57zfo/WWO4pzVMnz/g/DGVQhCdfxIeQAxDPtMHltGZhhKyY5EUCy9YKjTUBW7Rda7kaifAvDZ1yEIz6XpEOzSRxt6MKhvCKCG3ascDEtEjv6dDbHAB0GRf0LG7R3NVHDVhzq6u4n3WQ461NTqPDMHalBacdzixGrlpG0hoAb9NxsWukOXBU3pvP03VewWpEOcnZ16N0qgU9o/IL4j5cqDeIcRHVzi1t8ZVF5Y8yiwVRCQ5aXqMjkP+RSdkOf8j0BPcP+vWhQILNJxwV2A9mph5Ymz77JD0wwUcqVPL/lZYsXF4roIWmkkWtX2+dGr6GYmRhbxnjJ65seQ30Mn4KC7aIagS1dQHeagjT3QLKtDObbs+rZQxMfzK7vrbZ4MmjC8F0bz3viWCKzqOw/cnrgVV7QDnl7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:21:35.0615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb65e12-b38f-4701-e051-08debfcff0b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8851

The series introduces the necessary device identification, refactors SMU
mailbox register handling for better maintainability, and configures the
SoC-specific register offsets required for SMU communication.

Patch 1 refactors the per-SoC configuration by introducing amd_pmc_cpu_info
struct that consolidates SMU register offsets, IP block table, and OS hint.
The individual smu_msg, num_ips, and ips_ptr fields in amd_pmc_dev are
replaced with a single cpu_info pointer. Per-SoC instances are embedded
directly as driver_data in the PCI ID table via PCI_DEVICE_DATA(),
eliminating the amd_pmc_get_ip_info() and amd_pmc_get_os_hint() switch
statements. The AMD_CPU_ID_* macros are renamed to
PCI_DEVICE_ID_AMD_CPU_ID_* with compatibility aliases retained.

Patch 2 adds support for the AMD 1Ah Family 80h SoC by defining its
distinct SMU register offsets (msg: 0xA10, arg: 0xA18, rsp: 0xA14), adding
the amd_1ah_m80_cpu_info instance, and wiring it into the PCI ID table,
amd_pmc_set_cpu_info(), and amd_pmc_idlemask_read(). The corresponding
ACPI ID AMDI000C is also added.

v2:
 - Consolidate 5-patch series into 2 patches
 - Use PCI_DEVICE_DATA() and maintain per SoC data.
 - Address other remarks as per Ilpo comments in v1

Shyam Sundar S K (2):
  platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and
    IP info
  platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC

 drivers/platform/x86/amd/pmc/pmc.c | 176 ++++++++++++++++++++---------
 drivers/platform/x86/amd/pmc/pmc.h |  75 ++++++++----
 2 files changed, 177 insertions(+), 74 deletions(-)

-- 
2.34.1

