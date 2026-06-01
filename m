Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824B3A3816
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312907; cv=fail; b=AVws0UyU5F0lVpbFih2s3eBIr8KyesVwqyTxmuC9YzzjcrGInZ6tgW/sIjZ6ZrpfFiBq7QC2mUUtawCsRpSP2yFaiMYdTddGwMUsc3DS52EEzukbIbB8ZW4jJScfTcuIXoTCDGF+ZqZcquFz+3pU0H5LADKRuK8jJUsGCNrQzAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312907; c=relaxed/simple;
	bh=oZ6fgS7WNfZPM6AuYNGvB4Gz/nMx9yoByk+huUbcj2E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFhz9BXxsSJH2kFVVNCdrzG1dd8ENg3oKfpC4UF8TvBZPQrZ4bYWvzJGieD81T7oUDn5pYxXuLsIslTARRUxK1br+uhV0jTQSaI/9sRA6Uzmj9J32DCmEQGXCiCcNT3hAm3+wDPZ2H/sPNQS43alGLyekTJDQVUyC4R+g+zVXg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rwJPQDYU; arc=fail smtp.client-ip=40.107.209.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rwJPQDYU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTTeLoQP1gmVVxXOidaYdZsonZzPn/6l8VvEAR58UyGnhct6oZsvzvJcxjboqptNjsrxg18eb0NJWuYrsP1fgsrtkhbcNPQtdKcdpTZDHCfNlRBmoFJ0S4aJrNTL7eWqmqxJfm+2WdDiGOkX220g9L9fJ6h0vsK2zwjwRGbX2wNmid46LTnOuDlicPGV7dWbEgMsHBU5worqEGr8ZNEvrGbSEhwAaU6vmeLR+/tGG5uvNgXTWr8EUgmjtAcVwxovZt66IvLHmAGyhvDy9YjWL8yJcmokM9xy5tevHPYgPn9tAt0ySpA6z7ez1/KE8NwmcRC5JYDAb6Bh6iwZYc2ljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypXEVuR1kCvFbyvVzQNVapDWTCT4ZbXx4qZrNEdg0TU=;
 b=ojuzCfPB2w5Nxi+VotptYyWBVEbDaMv43hNxfasUZJ2J7/zHejkWAG8J1j0fLluhSW4mSeC0/EHYdtYj6C+IgDknSDFT/77Fu0VWaRKGNMFBUyZ1ozjGNmg/dsOmZsi3BZG+zRyXDwNBMUd4djo7NgKg2QFePGdTRIPKmsb6iu0/XqYwsZ9vKi1t9v+m/Tf2DZFTl1Ar1fa5uyRa+1ogNaFPnhoWglkidXUQ/rnwERamx7GOwqEeBXXt5AJ1oB98QTy8q1XWoLT9L3aVPGvf8L4Mr/wN855TllTj4G0FPvZwdFPaYCANMxTpoOvK0Hi4bJzzjTFxcXvL9EBuoCZ9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypXEVuR1kCvFbyvVzQNVapDWTCT4ZbXx4qZrNEdg0TU=;
 b=rwJPQDYUhV11qHFrM5YIcZZ2eCQSyoiqNdIGprNeyB7VVCHVTg3+OqJim1EnLvBI+PSnpWsFt3QuDAwQrFnZJRZK9zvzC0Ugjg/3zav9wMrcPx63ymZJKX8p/akIujKcRNbDYJDyDRgpubKMM414Klc3BbZQ9bHQyyQ5icXcp5w=
Received: from BL1PR13CA0373.namprd13.prod.outlook.com (2603:10b6:208:2c0::18)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 11:21:37 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::46) by BL1PR13CA0373.outlook.office365.com
 (2603:10b6:208:2c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Mon, 1
 Jun 2026 11:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 11:21:37 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 06:21:35 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and IP info
Date: Mon, 1 Jun 2026 16:51:02 +0530
Message-ID: <20260601112103.1690951-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 106176e6-bb31-4090-0644-08debfcff22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	3UhfYuycCVmQDvVR4/3mOn6NsP7nqnWmLZhzDSOwKafRFudwXKo8F+0qXKoHXTpZjHnaI/AnLFld36iaft9rdjfdilPYd48+z07piJX0ZhJn73eES9iHXnj1LfsKfU+pgiHbLCINXCeA6e3b8/NnNt8Vdyh3RvsDf0WnPICohEi647306w/i0dz4e1+HdFOkmE0q4c3svNDwG9Tn6adWe5RBY+L2qR8ymuumhQNTg939GS4wF6KQgxv22DZEgETPXtjlX8R7T7PAFWhp390xU8RFvn2j8gDotAJlcehgnNE+zOFbKGQnHikcAveLBk3NHAalYTOBrWFSIz/xGT3h9OSeUBgd7CWA7nuv+ZopKL3F3RfDxwX9xL9UuIdFG/Q0OGWcq4rHyeDNWW+5OG0fqir6dHiY1yhW7rop5CiXisqbN3kN12fPtMqXA2FEsyDosm6eITRad6MviymIwz4SBz5ikd8X8B/aNSEMnWvNzL1Iwrg6zQWPuap72VYppjhA3dI53drN5qGbOp6iqRgCD5Ai/Um0xGtI77HQg6lFNbnbDThi26KVRa1wH9G2WXy7IAsZCtWT3dBmsnprrnKKoGHIcTaTASmusP8LDaDZB/pONWjdLK8/iWdTJqdcKlKQuN61v6Olv5caVuLxQMZubwSLMyW8wNtG+3JrY7l4VneVeCDH6scxXw0KdPVUuERKZD0ps6qotLz1WJ8DOwKD9i0qqCZDmUTCEnTID2D6mxI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/Pfb0WOG4cqD0zCBTz6DrLXEfdgSbaWEg6nhoj4xfVuwcwO9HsdXwH2MBVTSY4VYDRY1J0DHbVsMVj3+iMABGlWxh5fR6zUO9NiZ3KS0qB9oRSKVSHwnlaidFvVfSX6bqdHHJmb3dfSBEpLfPPgzB0+CqMqMdf69FL6ekM8IPUkurXBuCYPtqGDU5Fg3IJFAgsDe1C++8jDZcI9WRlOeUeKXj3ge4dogkGVdHjQxFaDDPZWCG4iEP6MhK6ncGM/nMnhoLcHQ/aNSctOSQ+rI8DPnJbzrw+dlbPTm7c5vs+uEFFZfugsBveeIYfleHjXkS6RU34OZY5MirZ/iDOnJ/oJI7pmRRvGuC7/Px9iUEveC6NW4YJE1Eq2iYVmZHP4r3n+b27NbgH8TWAFUiXcBt6cKlNMBliwMN8Sz5iUMGYqWmV6yc2ojNJPVQloRmASx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:21:37.5001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106176e6-bb31-4090-0644-08debfcff22e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240

Replace the scattered per-field assignments in amd_pmc_get_ip_info() and
amd_pmc_get_os_hint() with a single amd_pmc_cpu_info struct capturing all
SoC-specific parameters such as SMU offsets, IP block table, and OS hint.

Define static const instances per SoC variant and embed them as
driver_data in the PCI ID table via PCI_DEVICE_DATA(), avoiding runtime
switch statements. Store a pointer in amd_pmc_dev replacing the individual
smu_msg, num_ips, and ips_ptr fields, SMU send/receive paths and debugfs
iterator dereference through it. For the 1Ah M70 variant requiring
boot_cpu_data.x86_model detection, fallback to amd_pmc_set_cpu_info().

Also, rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with compatibility
aliases.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 161 +++++++++++++++++++----------
 drivers/platform/x86/amd/pmc/pmc.h |  69 +++++++++----
 2 files changed, 156 insertions(+), 74 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cae3fcafd4d7..6c7fa80c7f09 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -85,6 +85,52 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"VPE",		BIT(21)},
 };
 
+/* CPU info structures for different SoC variants */
+static const struct amd_pmc_cpu_info amd_pco_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 12,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_PCO,
+};
+
+static const struct amd_pmc_cpu_info amd_rn_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 12,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_ps_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 21,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_1ah_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v2),
+	.ips_ptr	= soc15_ip_blk_v2,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
 static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
@@ -101,35 +147,37 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 	iowrite32(val, dev->regbase + reg_offset);
 }
 
-static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
+static void amd_pmc_set_cpu_info(struct amd_pmc_dev *dev)
 {
+	const struct amd_pmc_cpu_info *info = NULL;
+
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_PCO:
+		info = &amd_pco_cpu_info;
+		break;
 	case AMD_CPU_ID_RN:
 	case AMD_CPU_ID_VG:
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
-		dev->num_ips = 12;
-		dev->ips_ptr = soc15_ip_blk;
-		dev->smu_msg = 0x538;
+		info = &amd_rn_cpu_info;
 		break;
 	case AMD_CPU_ID_PS:
-		dev->num_ips = 21;
-		dev->ips_ptr = soc15_ip_blk;
-		dev->smu_msg = 0x538;
+		info = &amd_ps_cpu_info;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		if (boot_cpu_data.x86_model == 0x70) {
-			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
-			dev->ips_ptr = soc15_ip_blk_v2;
-		} else {
-			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
-			dev->ips_ptr = soc15_ip_blk;
-		}
-		dev->smu_msg = 0x938;
+		/* Special case: check x86_model for M70 variant */
+		if (boot_cpu_data.x86_model == 0x70)
+			info = &amd_1ah_m70_cpu_info;
+		else
+			info = &amd_1ah_cpu_info;
 		break;
+	default:
+		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
+		return;
 	}
+
+	dev->cpu_info = info;
 }
 
 static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
@@ -296,9 +344,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 		   table.timeto_resume_to_os_lastcapture);
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
-	for (idx = 0 ; idx < dev->num_ips ; idx++) {
-		if (dev->ips_ptr[idx].bit_mask & dev->active_ips)
-			seq_printf(s, "%-8s : %lld\n", dev->ips_ptr[idx].name,
+	for (idx = 0 ; idx < dev->cpu_info->num_ips ; idx++) {
+		if (dev->cpu_info->ips_ptr[idx].bit_mask & dev->active_ips)
+			seq_printf(s, "%-8s : %lld\n", dev->cpu_info->ips_ptr[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
 	}
 
@@ -425,9 +473,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 		argument = dev->stb_arg.arg;
 		response = dev->stb_arg.resp;
 	} else {
-		message = dev->smu_msg;
-		argument = AMD_PMC_REGISTER_ARGUMENT;
-		response = AMD_PMC_REGISTER_RESPONSE;
+		message = dev->cpu_info->smu_msg;
+		argument = dev->cpu_info->smu_arg;
+		response = dev->cpu_info->smu_rsp;
 	}
 
 	value = amd_pmc_reg_read(dev, response);
@@ -452,9 +500,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 		argument = dev->stb_arg.arg;
 		response = dev->stb_arg.resp;
 	} else {
-		message = dev->smu_msg;
-		argument = AMD_PMC_REGISTER_ARGUMENT;
-		response = AMD_PMC_REGISTER_RESPONSE;
+		message = dev->cpu_info->smu_msg;
+		argument = dev->cpu_info->smu_arg;
+		response = dev->cpu_info->smu_rsp;
 	}
 
 	/* Wait until we get a valid response */
@@ -514,19 +562,12 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 
 static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 {
-	switch (dev->cpu_id) {
-	case AMD_CPU_ID_PCO:
-		return MSG_OS_HINT_PCO;
-	case AMD_CPU_ID_RN:
-	case AMD_CPU_ID_VG:
-	case AMD_CPU_ID_YC:
-	case AMD_CPU_ID_CB:
-	case AMD_CPU_ID_PS:
-	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
-	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		return MSG_OS_HINT_RN;
+	if (!dev->cpu_info) {
+		dev_err(dev->dev, "CPU info not initialized\n");
+		return -EINVAL;
 	}
-	return -EINVAL;
+
+	return dev->cpu_info->os_hint;
 }
 
 static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
@@ -710,18 +751,18 @@ static const struct dev_pm_ops amd_pmc_pm = {
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CB) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_RN, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS, &amd_ps_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, NULL) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
 	{ }
 };
 
@@ -729,6 +770,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
+	const struct pci_device_id *id;
 	u32 base_addr_lo, base_addr_hi;
 	u64 base_addr;
 	int err;
@@ -736,7 +778,13 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	dev->dev = &pdev->dev;
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
-	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
+	if (!rdev) {
+		err = -ENODEV;
+		goto err_pci_dev_put;
+	}
+
+	id = pci_match_id(pmc_pci_ids, rdev);
+	if (!id) {
 		err = -ENODEV;
 		goto err_pci_dev_put;
 	}
@@ -749,6 +797,18 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	dev->rdev = rdev;
+
+	if (id->driver_data)
+		dev->cpu_info = (const struct amd_pmc_cpu_info *)id->driver_data;
+	else
+		amd_pmc_set_cpu_info(dev);
+
+	if (!dev->cpu_info) {
+		dev_err(dev->dev, "Failed to set CPU info\n");
+		err = -ENODEV;
+		goto err_pci_dev_put;
+	}
+
 	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
 	if (err) {
 		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_LO);
@@ -778,9 +838,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (err)
 		goto err_pci_dev_put;
 
-	/* Get num of IP blocks within the SoC */
-	amd_pmc_get_ip_info(dev);
-
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index fe3f53eb5955..0fd0ced21831 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -17,6 +17,10 @@
 /* SMU communication registers */
 #define AMD_PMC_REGISTER_RESPONSE	0x980
 #define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+#define AMD_PMC_REGISTER_MESSAGE	0x538
+
+/* SMU communication registers for 1Ah 20h SoC */
+#define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
 
 /* PMC Scratch Registers */
 #define AMD_PMC_SCRATCH_REG_CZN		0x94
@@ -90,6 +94,21 @@ struct stb_arg {
 	u32 resp;
 };
 
+struct amd_pmc_bit_map {
+	const char *name;
+	u32 bit_mask;
+};
+
+/* SoC-specific information */
+struct amd_pmc_cpu_info {
+	u32 smu_msg;
+	u32 smu_arg;
+	u32 smu_rsp;
+	u32 num_ips;
+	const struct amd_pmc_bit_map *ips_ptr;
+	int os_hint;
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -99,9 +118,6 @@ struct amd_pmc_dev {
 	u32 cpu_id;
 	u32 dram_size;
 	u32 active_ips;
-	const struct amd_pmc_bit_map *ips_ptr;
-	u32 num_ips;
-	u32 smu_msg;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
@@ -116,11 +132,7 @@ struct amd_pmc_dev {
 	bool disable_8042_wakeup;
 	struct amd_mp2_dev *mp2;
 	struct stb_arg stb_arg;
-};
-
-struct amd_pmc_bit_map {
-	const char *name;
-	u32 bit_mask;
+	const struct amd_pmc_cpu_info *cpu_info;
 };
 
 struct smu_metrics {
@@ -151,20 +163,33 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
 void amd_mp2_stb_init(struct amd_pmc_dev *dev);
 void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RV			0x15D0
-#define AMD_CPU_ID_RN			0x1630
-#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
-#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
-#define AMD_CPU_ID_VG			0x1645
-#define AMD_CPU_ID_YC			0x14B5
-#define AMD_CPU_ID_CB			0x14D8
-#define AMD_CPU_ID_PS			0x14E8
-#define AMD_CPU_ID_SP			0x14A4
-#define AMD_CPU_ID_SHP			0x153A
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
-#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
-#define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
+/* List of supported CPU/device IDs */
+#define PCI_DEVICE_ID_AMD_CPU_ID_RV	0x15D0
+#define PCI_DEVICE_ID_AMD_CPU_ID_RN	0x1630
+#define PCI_DEVICE_ID_AMD_CPU_ID_PCO	PCI_DEVICE_ID_AMD_CPU_ID_RV
+#define PCI_DEVICE_ID_AMD_CPU_ID_CZN	PCI_DEVICE_ID_AMD_CPU_ID_RN
+#define PCI_DEVICE_ID_AMD_CPU_ID_VG	0x1645
+#define PCI_DEVICE_ID_AMD_CPU_ID_YC	0x14B5
+#define PCI_DEVICE_ID_AMD_CPU_ID_CB	0x14D8
+#define PCI_DEVICE_ID_AMD_CPU_ID_PS	0x14E8
+#define PCI_DEVICE_ID_AMD_CPU_ID_SP	0x14A4
+#define PCI_DEVICE_ID_AMD_CPU_ID_SHP	0x153A
+
+/* Backward compatibility aliases */
+#define AMD_CPU_ID_RV		PCI_DEVICE_ID_AMD_CPU_ID_RV
+#define AMD_CPU_ID_RN		PCI_DEVICE_ID_AMD_CPU_ID_RN
+#define AMD_CPU_ID_PCO		PCI_DEVICE_ID_AMD_CPU_ID_PCO
+#define AMD_CPU_ID_CZN		PCI_DEVICE_ID_AMD_CPU_ID_CZN
+#define AMD_CPU_ID_VG		PCI_DEVICE_ID_AMD_CPU_ID_VG
+#define AMD_CPU_ID_YC		PCI_DEVICE_ID_AMD_CPU_ID_YC
+#define AMD_CPU_ID_CB		PCI_DEVICE_ID_AMD_CPU_ID_CB
+#define AMD_CPU_ID_PS		PCI_DEVICE_ID_AMD_CPU_ID_PS
+#define AMD_CPU_ID_SP		PCI_DEVICE_ID_AMD_CPU_ID_SP
+#define AMD_CPU_ID_SHP		PCI_DEVICE_ID_AMD_CPU_ID_SHP
+
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
+#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
+#define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
 
 int amd_stb_s2d_init(struct amd_pmc_dev *dev);
 int amd_stb_read(struct amd_pmc_dev *dev, u32 *buf);
-- 
2.34.1

