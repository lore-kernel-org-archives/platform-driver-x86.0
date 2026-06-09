Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684DC3DEAC2
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990577; cv=fail; b=WuTqndtpKyMCsvgWfWjUk5BUdeKYjhybKY15/FT3yN0DMrt8FN5zXNOS5oRiXWN+haXhdfLU5Pp6IyKxDDJzX9IvJjgpOCk85xLBLT6Rzi70G9YX2ltlGUlwnvycb7HSIqB7aXdpHD6Fok3GhExNZNOF2eXbedA2s58f0oL21vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990577; c=relaxed/simple;
	bh=2kVYoPGI4h7rMZLeq96KhyP4aJWy9CM85ED6rKUA33g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YQLKi9a2+To2M/5sEunVSTdSnOjcKWj6jg8BDtYdM/odrKuo9m+u0R4rBzRbRhhqO2DyWb+Nyd62dsmQPEIaxNpzxW0LQrfNe2+sqdMBaPxygzTBjB4Wazv/CH9PLIDy0UGa7Oq8W5HPr700LCA/0gq65pknhddl6vS+YOjcRIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pr8xGNJN; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pr8xGNJN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9U3RYWRaDGE6z54bjSRc0OdipdhJtR3qR7ip85Vd95W4tvV+y7UkwwOkxd40NFjvsgKNSXc6tQHwT0XTZ5POH8O3/vo/6vqawn2ugGSDQkHN3tn68g3nAbC8baSB3JqonDQixPwGf7aT5q4SvHn953vSseTKzo2tTnPYIeVHSd1DHwBO/FGXucE9xPcf1EPNm8+K9b0IvboYvAew/aUvpivQGEOJkG9DtT9NUJWst2nduZzcorS6QY9Faqs0Bw5lyZDV/zel0gUmQcjoz4V3bQKCS2R8kFIKAfijragZmxJtkEyxaKdXds4dgG0mo5DKm+2C8fn7hBoMgJ9Mc+OYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCQx5r2E1m4crAF1W0cbclkZkBhcC6aFI32JyAnewmE=;
 b=Q1IbeiPC9lHN/JW2FlCOWu22CbZb+cwpZz23zrHbxQ/qGDMvPa+XzicO5C3/PJkKfeIuLkEKGNa8uZnKnjPmFMv5jpvw53lBulY/hGB9Pkyat5/CGyoVABTCu6UIfKrbFfKeCUNeC2LYKIVRQwJ79eSQgaZwr7dCe5Y2UfcouJZxe45DMx/jOTGLAr5+x8JizHmNj13ycvyx48R96i6RaYHL5Ufx+jKtGxdEYMz4mC+EOgWoaoOukty10faQJ9+8f7wPIpDchvcs6jjfL3WpUO19/RrmNQ8XQfXXovIYfBAHBgPKChNeiJgOwg+ZbjXiqej9ttYGFIAEtP6tEU74ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCQx5r2E1m4crAF1W0cbclkZkBhcC6aFI32JyAnewmE=;
 b=Pr8xGNJNPQ5fVnBN2bhL5YxXI1Vg7An+LMOGYxhtjBzNvbMpnwcdczM3JufpUHVm0dJ1S7dqXUQVl+LG/4E7UtDcWceiB9W440a3WFZM6Zd1oM2U3u9hLJLoRAXiGzWkN7E8apOjrAfEEU3h0p9GV0snOrvsL23vtqj0mciiccA=
Received: from SJ0PR03CA0098.namprd03.prod.outlook.com (2603:10b6:a03:333::13)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 07:36:09 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::7f) by SJ0PR03CA0098.outlook.office365.com
 (2603:10b6:a03:333::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 07:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 07:36:09 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 02:36:06 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/2] platform/x86/amd/pmc: Add support for AMD 1Ah Family 80h SoC
Date: Tue, 9 Jun 2026 13:05:41 +0530
Message-ID: <20260609073543.2388987-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bb1cc4-1007-4e4e-8f93-08dec5f9c5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Yp6M9/29D2nYyZFwY1/qQ2GHCILFELbUUxmkRANH+ViFh+ofJKVGz+m11jNI5YFzQzK9rmC/KWVK682s6sprSPfrpT4pPbGMvA/+g8jfplUqUdXhLlgwSiQB5oxdU1kYKW3278cyrApRX/sMBVzBtjQc72m8Q+y15mciHbxgr09aEM5ZCvSHCeb6/il9qhQYXnO44/CmuoS2PWiF/t5evPuS6ll8JBSQuoCG0xqp+QKQ4C7Ap/FUDA0n3kC0niIYS61kl2omgd0r8HZ8lpkGrVDBgLiBxujMWP8iCnXpfL3nMnyyflM7Vk0ILLz2aWrtfQxUviOvTet3UTERmAAFaGyYXZnmrhBRLJz791jnBQYKYu7tdo9pCDmjPCkQo7ft9Z7regAwAM5DYyxyoP90i05X06SOivthEnHGeUC7PW3ekaCxgpg0Pl9fFUEQGRwpuLYHkDgGlpt7O/h3nRBREXRPCv3AGGOZ6mh97ij/gU3a2kICDfG1WdWn28ty8C6wH+ya7zOcgiNdZdnvzwKQqoWi+/TXN+CfCoe/f5OR3n39EF+v3VaPXRqRMnm9vjMecz6o3jVOCwJI/N4ZGIGC9XupzP2wiuLgBJ4QrSTAlkEyqjuIMBaM3T8WT9DdMMGUJ9UHJpzZMrpo7MHv8AnFiOl4GnHLaaizY1570SQlNYXQJRDY0/RvRPvXRQKLg5peQtLfiTlLG+1C+y95bFvNQJVgWONJa/5746m3V50I9Wg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cPrzRnDhU3MHcvxELzvtLzbTechGv+mDJHokHLevlMYi7Y0pv+JvZ7vM2Ajte8T+GCVyztpzvX8+FsvwmTBP1jCJJizZDf12xwahr1KZh8mKFA+RZ3+4WqxUI352bPCSgpzKVRCy67bZ6oh8AXRQ2/G12w2sKyZB9UYxgpxnq+vtoDiubXVwdV8sF8ENCGGOtGY4IAq64uGBj0SfmDiHPpZD7dQBeGUQXuXV6pDZgTrz8dTRwr4ftihLEf21N5UP9BSe8IfEFRsPGoM0qvjaCfmqI9L8/f5OWGmLaFPjf/1IYBkQV1mZbTwgtJWA5UtxKr99mrmYxhhVI8af39FPsq5j+I0lAaAk9iTFxH4Pqmalq4Sq3NA9Hd1yBqgOQiLgWxSPGPWcfYV2I8j80mfRbEeMoiCWfE5tHCs1yMd789gH6Mc8upPpsGq+o8T0n8mt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:36:09.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bb1cc4-1007-4e4e-8f93-08dec5f9c5f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456

The series introduces the necessary device identification, refactors SMU
mailbox register handling for better maintainability, and configures the
SoC-specific register offsets required for SMU communication.

Patch 1 refactors the per-SoC configuration by introducing amd_pmc_cpu_info
struct that consolidates SMU register offsets, IP block table, and OS hint.
The individual smu_msg, num_ips, ips_ptr and scratch_reg fields in
amd_pmc_dev are replaced with a single cpu_info pointer. Per-SoC instances
are embedded directly as driver_data in the PCI ID table via
PCI_DEVICE_DATA(), eliminating the amd_pmc_get_ip_info() switch statements.
The AMD_CPU_ID_* macros are renamed to PCI_DEVICE_ID_AMD_CPU_ID_* with
compatibility aliases retained.

Patch 2 adds support for the AMD 1Ah Family 80h SoC by defining its
distinct SMU register offsets (msg: 0xA10, arg: 0xA18, rsp: 0xA14), adding
the amd_1ah_m80_cpu_info instance, and wiring it into the PCI ID table,
amd_pmc_set_cpu_info(), and amd_pmc_idlemask_read(). The corresponding
ACPI ID AMDI000C is also added.

v3:
 - Consolidated pci_match_id() into amd_pmc_set_cpu_info().
 - Removed redundant M80H case from switch in amd_pmc_set_cpu_info().
 - Moved scratch_reg into cpu_info, eliminating idlemask switch case.
 - Split amd_czn_cpu_info from amd_rn_cpu_info for correct scratch_reg.
 - Moved pmc_pci_ids[] before amd_pmc_set_cpu_info().

v2:
 - Consolidate 5-patch series into 2 patches
 - Use PCI_DEVICE_DATA() and maintain per SoC data.
 - Address other remarks as per Ilpo comments in v1.

Shyam Sundar S K (2):
  platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and
    IP info
  platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC

 drivers/platform/x86/amd/pmc/pmc.c | 228 +++++++++++++++++------------
 drivers/platform/x86/amd/pmc/pmc.h |  76 +++++++---
 2 files changed, 189 insertions(+), 115 deletions(-)

-- 
2.34.1

