Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52F34D38B
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016027; cv=fail; b=pkSYmQoa+S994H0T+x2MIUZPsHEqw1k7sCZsjYJpTT5tfVIFSc+fczjWdtEfsDCkQTARmP5pIvcxssehVJm7+QD+L5FwNmaizZMDZvahulaIeQsTrfOgX1P6MELDwmz1SHjCoFFs+T5dj38LIsR1zZoqPrTnCs6KbwceaB/cKfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016027; c=relaxed/simple;
	bh=T27TtNDV3WKdOjtl06i3vL1UPcy4cMH1QfJ1LJd99ow=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BEtLr5cnXKiC7re/b58Vd0DAHBxJAZuyvGP+sCQmGKm/LQLb0J4trf6raLCW9IGlhwvfmrOiBGW3EgLxsL006F9GwjrWb3aKdbUzK9fdBpJENkD4OonILmNy1xF1WoDrRNTzArVgQZzXJ2kXitC1xTi2Somti/1qaUGPyXKOmQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s7b3Ld28; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s7b3Ld28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtZWfKfDxRQ1O/5UoV74ZHPGq2sN97IfK6MJi9OTyOgRoj6R1Q6+1KZwxjV1x/nUdS3KoO1eJK8vSwK5AV1VJm5/rnVxZKYjZKI/oIMa6huuGU/mzyDeoMIp75vCpduCFCK/kMzTmzV/jUim8G65IHxgwvnaBbQxwcrBd/9GNDsE6HIP/RCApon5/LqWMhov4Agu9S3TriN5iv2qNHg9yIvOJ89/QXQMG66SqTUwxVOVG3nLYz7OtPlOqgA98LLGXp2vNLd8bOI8pMhveR1iIVpG3gtxbBwTk5JceUa+oTpoXJMJzSSLvrfzwnowtcLnyL8X8zFR7Ws+maAIivkjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxCAr7sqeJ+sLqAgSp6om4Hs5X2UDnr80VG4Pu3ps1g=;
 b=cc/TRX8dQp9QoNF9dKmTs/GNmyqCdPCUn7yuIXgnVY6BR5FhN61FteRxG7t9yNFohC0pnrlE7A0GQhUOqGmd2PEqlxx5pV+Ky+PIUE9AiR09fKYjqLnozkgTJqGku6Ehkie47V9fiR4wfb+i1slM5/l81tjWZWsgsu386QevlVzNBPoMXHmfJGOTWX2aT+VV/e8LX+yvg+fHsxNxi0tPF4Xw0oKsyJEWCFJY/7Pcl5ijkaRpF7rOjMriGG0/WI91Rs5Lu5F2RfXfxNDSgSLxXuM3jCmZ4MoVZ5fAH5QY+3GPBKq2tNWbAV4Qv2eZGMY7xhFlSp1n3la3nIH66XAk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxCAr7sqeJ+sLqAgSp6om4Hs5X2UDnr80VG4Pu3ps1g=;
 b=s7b3Ld28s5UgxuBrGCBZTvEIHDKvVW72IcpunFPzCTmRrkkHj/Tqi8zfZpxLYD6Rh/1R+C7mFwnN7d8LBs7ckImhQ/utV6ujGa52HhQGEydPWyqAHNwKfaEb+M6dGQPKDkoATwY8lvgFSeNh15OaHYt2F+HTk3StBFokZez3CD8=
Received: from DS7PR07CA0019.namprd07.prod.outlook.com (2603:10b6:5:3af::7) by
 MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 14:40:19 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::4d) by DS7PR07CA0019.outlook.office365.com
 (2603:10b6:5:3af::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 14:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 14:40:19 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 09:40:16 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/2] platform/x86/amd/pmc: Add support for AMD 1Ah Family 80h SoC
Date: Tue, 9 Jun 2026 20:09:50 +0530
Message-ID: <20260609143952.2999707-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: ceabc537-02a3-4fa8-2c77-08dec6350746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EkMJxsD98RSBi6ejyjBMkIybA93/hBbtAFmcF0FxzeMPudhpZMiL0z35rzR4tEDErsQGnOwNeDO2ACAgUVxlhbok2HAr/5ZfwWgYpbdLtxW92fF5GZxB8ZimpyuLfXB8BaJHQDeVHedhGFYvJEq/S0AB4C7e4b1pozvf1MOAOhOq7FbL+0jfiMiSJxAzqvKzcPDpinG4+C2QO34LlnE8P45/loO0MH/hatX/+3nGs55ZQO/eTXm6reKHdrdBjBcjB3gfM6V5KrSa1VcqnzY/ICk8yG52ksyGVdxRG1JNjbwcPBsynNl6Mg8dC1QY6GICvFUAkaHJZsqC4XxUjdQ5og1QN3ECY8kr+/yX/CFNOIHW43IZNvtv4k321H1H3YcS+j5Mh0hEjr4XjJO3MjJ/a0/Ph2UmH/EcS5GfnXcHkcCLesGYItBA87PFXr4TwzNrQ9MSnHuFSK73bbwdSEBppsXzjZG9t/a15ee+PgLADkM8aWTtT5v21qoqvWrzZfk+WQiA+knlLIsnXUKtnY74JqvghzbpqR8TVM00s/vIbvkMNFdiHSPDJ7pTyhaR0AfIVWUihjrsDEKcuskIxntSLUS8X2ABh6fUd/RpGO33xF1owi0ogHPCO7WLQ9dZSbUm8XldNETqChC2lBf+n/8Dimt7BxGIzBOQSw5Qn+hu5oNzmMz2uz7Ie4uKQMJr8gGOpTDw9CCpnod6I+8QUetk6qEdESqtrVNx3wVV40iyuvY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9j2VACEHUnZbMsytFM6BPHr3FfIcIZgFaCxpbdnlEDfx612r4Owi+WbHdPa9Rq375ReuhGBpIZpUHRyAGOXq59qV3iqvvS1zxc1aHtPfLwwT7erlRMajGV3/t0B5/y4K4bl9mbZmT0HTVyJDZUx5CsX/AERKQi65gjon3NpRijkI18P+HBVLrnHEzGf5AI4pDPMlFtg5Dyf3joI3R9FlN7/5WUYqNlYJ/DOhJ2gCrlMFOYF5BUqDmfhq9gYpribFPt+e1qP0WnAsJkgVCMnvkYyyjJstjUZdZP8WWJp7FSHFnehtengOJwbFRJKepR4DDymzUoBCEgaTtZ1nAJvaBrr/QHaCJUd9HOU62kzseFa2O5ziMXmwg8rF/zHD7/Nfx2tZJDbnfKJTDr4MrWpgKWvuhsBBz//+ssCt9ZbjFTNUxPPyo4FUHZBFBUb38WKK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:40:19.0173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceabc537-02a3-4fa8-2c77-08dec6350746
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

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

v4:
 - Drop explicit .scratch_reg = 0 as static const structs are
   zero-initialized by default.
 - Move dev->cpu_id assignment into amd_pmc_set_cpu_info() before
   the switch so it is valid when used.
 - Handle SP/SHP in the switch directly since NULL driver_data
   bypasses the early return path.
 - Remove duplicate PCI table entries for RV and RN which share
   PCI IDs with PCO and CZN and are thus unreachable.
 - Address other Shasiko remarks

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

 drivers/platform/x86/amd/pmc/pmc.c | 243 +++++++++++++++++------------
 drivers/platform/x86/amd/pmc/pmc.h |  72 ++++++---
 2 files changed, 195 insertions(+), 120 deletions(-)

-- 
2.34.1

