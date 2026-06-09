Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD52E3AF1
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990580; cv=fail; b=EBbORulg1l15K1AqiOKOwds74zrIOCkI8A1LGAA3lCnmq6UjTLkOi4CzQkcAc5BsWhe9bQrktlasFMP7pWpSQJktFYbf4yuOEd2rkZvRe+O8SW9Xwm21vs8ssPSerJWTc82CbBoPJ7oLC+AiXznO2SLvxNkGs3jIkasy5o31hEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990580; c=relaxed/simple;
	bh=LHe5hklY1XlJ+ItdhKth1i2/SYnLM32lxAQVWyAaQHw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUXo8mn0y5qhq1oIdyDJ5A+ZrdkPzelo8OL33zE5Ju5xsfhOwPQluo4fyyTMQaqUs7odv738C7gY4KwMtnKb/9j1Ta/B9VMVr4oXLUxUTF0zxJMEHuVf7xw0uLz42TOe3cquYzc1vo3wWoE8WKxXARLmMxn0OAQGaKUAvLajXas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t7MAbk93; arc=fail smtp.client-ip=40.107.200.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t7MAbk93"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxjLBCjdw0DRVxuwrY1tDWkIrzwpHgKN9NHmhbeRmaQNY3PdYHkNng8h+ug9MYJAd7Ox4AaPDDFfsX1ce2PYWiYzTCbfp+uL+xeu6gi/RMsCepkvx7BBGBRDeQVYdDvrNS3iVJWHNZ/JKOR36cXBU7j6NdWnLl/nbJ5963Zl65hQlM7dbrLS9cSQ/l2YbhTM4sOF0BnQCPM9pIYe0t/6MmFkDELT6ROsZe3htHioGF3z2W0GTUUlotyDe+s2wPXrCDTRNNJmO1/6C6KEk7lvpPOfgh03aZNdVjTQz6XnWmT564RF7x+lzWSMSg4G7YPiENxjA1zSYqEPyX7dAs+Q8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmlTwDPx8pJ8Mq6PVlhXdsBpwVpE/7wALc2ang6SGfI=;
 b=nUCzIcMthhYTh+olYwXzH4IFYYLlniTJw/5kbL8/zOZckcM5fAiB9VsW92Eot9P+G9gYAsdAPoaWeO9UcJICM4ab0Bnjm1iuolABKYV8WZYCEAscMO/NOPSAIJ0dEp9kF1PvGrJWEpu/fF5gUFtLXZgyq0ySJm0kgYyMQn48Ve0EvYUaPhZlvozGoi8gve9vsEXWSRFrMOp/H8iz2hSOatjmRn4IAZXomK3McyPvDENKkdAPaaRvf97t9rfztbxbqAqGaO+4VRHq9Wt+hKUG16wmC/9pASg9aWZpu0Kj316trsna6UUGq8ujvW2rYmGBwdxBs4yxtcJtnezHiUkYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmlTwDPx8pJ8Mq6PVlhXdsBpwVpE/7wALc2ang6SGfI=;
 b=t7MAbk93KNZakXakDBcCxHecQzTLry7iuIfaRsINiw9jt1+3mcWtkevPhecVzDyyU7e5UnSK8J/NElR29EOa7Cie3cuezuYz+4E1u3X3voT/d5l3ZySGC0bIgEFHEwJE4YMIwfgHp6dfQRnOfmegWo3f2Q/NX9AuWu8N6OfppOk=
Received: from SJ0PR03CA0101.namprd03.prod.outlook.com (2603:10b6:a03:333::16)
 by CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:3e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 07:36:11 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::44) by SJ0PR03CA0101.outlook.office365.com
 (2603:10b6:a03:333::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 07:36:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 07:36:11 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 02:36:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and IP info
Date: Tue, 9 Jun 2026 13:05:42 +0530
Message-ID: <20260609073543.2388987-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609073543.2388987-1-Shyam-sundar.S-k@amd.com>
References: <20260609073543.2388987-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0b0f73-2600-4d8f-853a-08dec5f9c737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|3023799007|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LBoVGFL6Uz96INWvswxVPF2y34tRYyHthKq4iv7TnMXVJuq0znbNMIGatZkbKpN7A1limnpclquScuInilWk8tqhGvahG84qhBRaYOpmGpRipRFE3QeP9RBeuRF0cPDvnAxtoauuVBGYC6C8I5nBy395Yk4GlMJ/SWwu/UxQaKs7PhZJeNNAhct7iU6mJMzcby+yGqEBcjwzMmn/xGLQh0S8grLts2K9/VajxFXcdzNK/9Rgi0cmOcq0z1jhvUqrrT64+hk8R4jvxnetQ2Q6tuktMj+UDVJIXRnR/bAiu8y3mMtXu38NcGPG6kDnsPitqH6KqtMfU7htQKN3TVa0wV3Z5iZwKTOzHk2suCMYMacxurCrF4FhbMbIQXadGf4kwDVZkTnJ5+66TqulSIKVvWZuLcPICvoIlyzdW4AQlQqjoIAbaHUc8ljNw1YriKpuP/os1oXoFcPYl7M4aVCSyxtrRDCUtNWnXbbHFn8RO7v25GQf6rXeOU2QOzNPDwzD9lQVLuK5ps9twt2qaCNc+ky/+jc8jTNtE5Gn81f24JxMATpvSvpLDBYIkFVRQDdcPQjhnjeh6FOka3yDu4LqUenjdm1kHqmexAXSfIcAzNnrJD4Ved1/P1ukx1IvEAXy8Zbpn+lpaCCfNBY+JGYK6LNITUNVhqsYTeWMXK3j0oauwJq9fMZsoy3i0QOULkQSbDKs4EV2FOxeXjVNQXQ5X2PYRgkUwbwoxJqQsL4EPRA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(3023799007)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WLlN/EBxW2VOv025mW2AMEwvu1Jnefi9ZSgxDD07BY0T9PjuKcaWHfKrPJ9q/inWDzuFdoTpCU2kOsb5k+mias7SNtxquHlCt9osFurATw4J0e5oGKBT8C/DtLg0gNi/TdDo1n/iWdLoOarszjaR9gC6tjnZWKb3XbxGwQmafM94dQ0G9G5KS0IwMyrwEiqwnx0oYtPX30IZdVtHsZ0f0F8nFAsDSXAkmS8oq7Z4vrn5XZqkpMWjYnfDzYTA8nA0k4QQzGZ0/+E3m3IqBP4oFejZ2TK01eMKICkiAjL8wPGWiaVFsgZsdNLvc5ik3xdmUzDnkj7nwwOYSCvoco1mrVmcRoO4hHy7JuYxJjA6tpS5HTzl0QZGii+36JFfY/MbOVRfXfn76b56M+MZTJ5VV8VJmWBYutuPQw0ltrH94eE4y8kV0rl/65MifXuxbT6U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:36:11.2196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0b0f73-2600-4d8f-853a-08dec5f9c737
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648

Replace the scattered per-field assignments in amd_pmc_get_ip_info() with
a single amd_pmc_cpu_info struct capturing all SoC-specific parameters
such as SMU offsets, IP block table, and OS hint.

Define static const instances per SoC variant and embed them as driver_data
in the PCI ID table via PCI_DEVICE_DATA(). Consolidate pci_match_id() into
amd_pmc_set_cpu_info(), which assigns driver_data directly to cpu_info,
the switch falls through only for 1Ah M20H/M60H variants requiring
boot_cpu_data.x86_model detection to distinguish the M70 sub-variant.

Add scratch_reg to amd_pmc_cpu_info and populate it for each SoC
variant, allowing amd_pmc_idlemask_read() to drop its cpu_id switch
in favour of a single cpu_info->scratch_reg lookup.

Remove amd_pmc_get_os_hint() and use cpu_info->os_hint directly at call
sites and rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with backward
compatibility aliases.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 216 ++++++++++++++++-------------
 drivers/platform/x86/amd/pmc/pmc.h |  70 +++++++---
 2 files changed, 171 insertions(+), 115 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cae3fcafd4d7..3ba50ebcc431 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -85,6 +85,83 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"VPE",		BIT(21)},
 };
 
+/* CPU info structures for different SoC variants */
+static const struct amd_pmc_cpu_info amd_pco_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 12,
+	.scratch_reg	= 0,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_PCO,
+};
+
+static const struct amd_pmc_cpu_info amd_czn_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 12,
+	.scratch_reg	= AMD_PMC_SCRATCH_REG_CZN,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_rn_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 12,
+	.scratch_reg	= AMD_PMC_SCRATCH_REG_YC,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_ps_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 21,
+	.scratch_reg	= AMD_PMC_SCRATCH_REG_YC,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_1ah_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
+	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v2),
+	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
+	.ips_ptr	= soc15_ip_blk_v2,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_RN, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_czn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_rn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS, &amd_ps_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, NULL) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
+	{ }
+};
+
 static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
@@ -101,35 +178,34 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 	iowrite32(val, dev->regbase + reg_offset);
 }
 
-static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
+static int amd_pmc_set_cpu_info(struct amd_pmc_dev *dev, struct pci_dev *rdev)
 {
+	const struct pci_device_id *id;
+
+	id = pci_match_id(pmc_pci_ids, rdev);
+	if (!id)
+		return -ENODEV;
+
+	if (id->driver_data) {
+		dev->cpu_info = (const struct amd_pmc_cpu_info *)id->driver_data;
+		return 0;
+	}
+
+	/* Special case: 1Ah M20H/M60H needs x86_model detection */
 	switch (dev->cpu_id) {
-	case AMD_CPU_ID_PCO:
-	case AMD_CPU_ID_RN:
-	case AMD_CPU_ID_VG:
-	case AMD_CPU_ID_YC:
-	case AMD_CPU_ID_CB:
-		dev->num_ips = 12;
-		dev->ips_ptr = soc15_ip_blk;
-		dev->smu_msg = 0x538;
-		break;
-	case AMD_CPU_ID_PS:
-		dev->num_ips = 21;
-		dev->ips_ptr = soc15_ip_blk;
-		dev->smu_msg = 0x538;
-		break;
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
+		if (boot_cpu_data.x86_model == 0x70)
+			dev->cpu_info = &amd_1ah_m70_cpu_info;
+		else
+			dev->cpu_info = &amd_1ah_cpu_info;
 		break;
+	default:
+		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
+		return -ENODEV;
 	}
+
+	return 0;
 }
 
 static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
@@ -296,9 +372,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
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
 
@@ -347,32 +423,22 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 	u32 val;
 	int rc;
 
-	switch (pdev->cpu_id) {
-	case AMD_CPU_ID_CZN:
-		/* we haven't yet read SMU version */
+	/* we haven't yet read SMU version */
+	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
 		if (!pdev->major) {
 			rc = amd_pmc_get_smu_version(pdev);
 			if (rc)
 				return rc;
 		}
-		if (pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37))
-			val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
-		else
+		if (!(pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37)))
 			return -EINVAL;
-		break;
-	case AMD_CPU_ID_YC:
-	case AMD_CPU_ID_CB:
-	case AMD_CPU_ID_PS:
-		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
-		break;
-	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
-	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
-		break;
-	default:
-		return -EINVAL;
 	}
 
+	if (!pdev->cpu_info->scratch_reg)
+		return -EINVAL;
+
+	val = amd_pmc_reg_read(pdev, pdev->cpu_info->scratch_reg);
+
 	if (dev)
 		pm_pr_dbg("SMU idlemask s0i3: 0x%x\n", val);
 
@@ -425,9 +491,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
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
@@ -452,9 +518,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
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
@@ -512,23 +578,6 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 	return rc;
 }
 
-static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
-{
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
-	}
-	return -EINVAL;
-}
-
 static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
 {
 	struct device *d;
@@ -602,7 +651,6 @@ static void amd_pmc_s2idle_prepare(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
 	int rc;
-	u8 msg;
 	u32 arg = 1;
 
 	/* Reset and Start SMU logging - to monitor the s0i3 stats */
@@ -617,8 +665,7 @@ static void amd_pmc_s2idle_prepare(void)
 		}
 	}
 
-	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, false);
+	rc = amd_pmc_send_cmd(pdev, arg, NULL, pdev->cpu_info->os_hint, false);
 	if (rc) {
 		dev_err(pdev->dev, "suspend failed: %d\n", rc);
 		return;
@@ -659,10 +706,8 @@ static void amd_pmc_s2idle_restore(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
 	int rc;
-	u8 msg;
 
-	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, false);
+	rc = amd_pmc_send_cmd(pdev, 0, NULL, pdev->cpu_info->os_hint, false);
 	if (rc)
 		dev_err(pdev->dev, "resume failed: %d\n", rc);
 
@@ -709,22 +754,6 @@ static const struct dev_pm_ops amd_pmc_pm = {
 	.suspend = amd_pmc_suspend_handler,
 };
 
-static const struct pci_device_id pmc_pci_ids[] = {
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
-	{ }
-};
-
 static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
@@ -736,11 +765,15 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	dev->dev = &pdev->dev;
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
-	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
+	if (!rdev) {
 		err = -ENODEV;
 		goto err_pci_dev_put;
 	}
 
+	err = amd_pmc_set_cpu_info(dev, rdev);
+	if (err)
+		goto err_pci_dev_put;
+
 	dev->cpu_id = rdev->device;
 	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
 		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
@@ -778,9 +811,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (err)
 		goto err_pci_dev_put;
 
-	/* Get num of IP blocks within the SoC */
-	amd_pmc_get_ip_info(dev);
-
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index fe3f53eb5955..4c3a4410790e 100644
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
@@ -90,6 +94,22 @@ struct stb_arg {
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
+	u32 scratch_reg;
+	const struct amd_pmc_bit_map *ips_ptr;
+	u8 os_hint;
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -99,9 +119,6 @@ struct amd_pmc_dev {
 	u32 cpu_id;
 	u32 dram_size;
 	u32 active_ips;
-	const struct amd_pmc_bit_map *ips_ptr;
-	u32 num_ips;
-	u32 smu_msg;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
@@ -116,11 +133,7 @@ struct amd_pmc_dev {
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
@@ -151,20 +164,33 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
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

