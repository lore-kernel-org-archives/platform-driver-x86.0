Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1F34EF07
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016030; cv=fail; b=QWzRuoKwJajzwYrviTz+3GnRrnlL9DnGB9PSsmgINrmrlWUakqKlp+ljHHiVWQHPRT5eTpM33lGc6lfg/YtHPTYo2rkhfEmOcI7os78DOTfMwBYfnT48J9hWL237LvobOeYzeonz6JnxbDee9Cp7PELd6CkoAguxfYlqeisuRDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016030; c=relaxed/simple;
	bh=L+6ZnLhsgxK0zIWWNl77o1bOgoMfcpe3Rw6j4O2KUKo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FjrnqnrF+kfOPfirGJFpAxVdcH93wid9K4QibRDWNAI7QrdK1sQ5V0AnDUnsmO1hfJzoNkEtEkjmdhcpvliKAugaoIZLiF8dQEBCFO5zg5F+Dd6zeiZy2/x6YDGzEAKdRMJ99fMomCX44YyjKymXlLYvtCrGY9SZyNN8sdIbxog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ntLiOMFr; arc=fail smtp.client-ip=40.93.196.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ntLiOMFr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAdb20Nzj2D7Tc2ycPQbNXUt3ivRJ1Bo55DqNeHvhrAoS44Q4JY/VgElH+znHM0r5oPXsYXIFRMD4mTAihKde2etUSARvmSj3VcZBlUDqlc6VOeR/o96ND70RzUxJGZIf9SAP84hIpuQbra7jjF6ww9Phi7tdP98+2xLMNhHe4kzPoi67njtG2dPfPcaoJpN+oPjarft151YUX+brCLGektY1yGt11etPYLrnmWK1a/jqQNMzVta0vVpD+dH+emPbc4c9zX+ldB2iylsxJxl12he+WTSpKi2lw1MHJFoqiJOXPLafQx/hlXw0/oMfrqjJzv7e47cKYmaySCHksAqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXfNKWhzRR4yhCkzaWMWEsW+nIDjZUYz2Z0AVDEUdMg=;
 b=ooRQpX6Np2fGMlfJ2EEI8YIvzEUOBZomr9nCk4Xqo3kk9QIjbaCiShQEpIXQtvcm1uVY3hwIzLwHowTLM3v2mJDpaLkqANOel15ZcDXgyfBA+VIVCmg0bpzkuuUtbn6QCaWCmgW3f1oEC52lkLOvShiM/rdFhYX0ZtoPcjekp5cYbwPzLDY0uonUGWLtjK9kBElEtVcnRYFpBtSv14/Lv3c4x9hceOdY2Jkg8/N7dO0VN7XUkBKtQlrUrHEDEnYrCdBhLizcs4WKXSzHqYc+HXDs1O1h5DJcynbFrjHj9wwji0Cm707Ui0YLEC8EsxaAtv+ohAEQM+zQVUFxdqmj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXfNKWhzRR4yhCkzaWMWEsW+nIDjZUYz2Z0AVDEUdMg=;
 b=ntLiOMFr4PrJmiYf6N5PicFibMOMRHH/n/h+aR9q4vLLPjpgiAzQfzgeEcp+aI5jA8RVVvdpazFehLWHgpNz1VkKrmJeLAu9U9caEXxd9K2AftDDdJ8/GKEDjwy5hhH8/2n75aJfOnxCSdNTJQewtD9T+WFm9jKOe8uzQnUetwg=
Received: from DS7PR03CA0061.namprd03.prod.outlook.com (2603:10b6:5:3bb::6) by
 MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 14:40:22 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::6a) by DS7PR03CA0061.outlook.office365.com
 (2603:10b6:5:3bb::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 14:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 14:40:21 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 09:40:19 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, "Mario
 Limonciello" <superm1@kernel.org>
Subject: [PATCH v4 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and IP info
Date: Tue, 9 Jun 2026 20:09:51 +0530
Message-ID: <20260609143952.2999707-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609143952.2999707-1-Shyam-sundar.S-k@amd.com>
References: <20260609143952.2999707-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd7b79b-e03c-4856-7b91-08dec63508bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	7o4SeXYuobW2t+lVQFkV8Nz2TjY855wxY4PeFy6wALtOi625SOLB8qOthxedGCqFFLe0GP4935TyGabvR9f5F9a9B6ksaEuF5oy/Um7lnsIL5XScsFKMD4VNLQrHIV7t7WBKCpnkqgF6B29KBmlSRNCSuRCaZGiilvTgRCHJh/TZa8GdBFYOxujgAVuvi+nWHXv+1YyNH/xqsppJ9YkOZ/4OxmEppK71LI2JpLNR7ua23xQUm/wAbZXUMDFnF26vaYdg8Lh+wIxHfbGIZUtEXpbMfM5wy6cZa17ePilzDpSxdDyABm9xQHTo7AtqmscDB8Vu7q/XEVJmPViAHAiw83Sq1aZKbWH7MI8lpBbj2nrSEbCSLcNlJDlant5Sc7yuMhmyLCizfKonl6rJjvUZBAbbF27qS3uVKmTRTwQq6CLOgmyKdKBU4xDG8Er1Q9f/foJeBxyIl70v7c9QDNO2W12LRKnNqjjldiBrhweYACWqEhGT6VDN8rUWyHxxTcmzgRS9MTUjdKsAiyr99Pbf7MmWwzZptPgwGrM/4qRuCOKAT1D6+8PqWFfpWCPqekuIHhvN4C3yUh3bC8ScgKSP3JXOhRelfak5W4TKRzTltc8JrmgX6ETk9TRMSwuVrsp2wbji+igxb0VytQd15bXVmOVplnOUEe5uyGVBbVkwJiCNTM6P0r5wKQ7GJ+QVI8llcJSETMLyaxlsxbdR9hAathZwDufqifnyfnqJmpHGZ7Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4vI9yeT6Q2EQuWMnPwizfC40sGeeDMI1KH1F19h+oN+sdnEmccB8PWHYcWseRRvgw4g9WY4SVKId/qQVQajuT3beVXJ4UWPEmbWBjMKsTuKFQpew/frk1WIRz8dEQyZ5tR6FD4g0KXG9uSsApbgeqS68REyV1YIW/84pGDKymfTzpKYqa41zBtRASAAhj90eOEggV71zHv/JqKQP9PTak39rB8Qx1RQ3GnKmeKIrOupUPxuieQ9dQzPKlhnhXh36yCyEADsn0cjWmkY7NERGsgjYh+B0bbF9JQKahLGHA2xLOG2f3zqPJb8vxJzfoRh6nZFbpm8rGmbBDYKi+GrAC6IhmMeHHk0tA4WouGUtS39DvI2m3eNV+tNDRQoA8Nm7nQWnjjl2Db+Iu42UvfQmnbs1CjdZsiw058fE4xaW7x52EbjmLvtzmR11cmKbEqH8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:40:21.4918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd7b79b-e03c-4856-7b91-08dec63508bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429

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

Move dev->cpu_id assignment into amd_pmc_set_cpu_info() so it is valid
before the switch statement. Handle SP/SHP directly in the switch since
their NULL driver_data bypasses the early return, and remove the duplicate
check from probe.

Remove amd_pmc_get_os_hint() and use cpu_info->os_hint directly at call
sites and rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with backward
compatibility aliases.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 231 +++++++++++++++++------------
 drivers/platform/x86/amd/pmc/pmc.h |  66 ++++++---
 2 files changed, 177 insertions(+), 120 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cae3fcafd4d7..92e36a6161a9 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -85,6 +85,89 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
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
+static const struct amd_pmc_cpu_info amd_vg_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 12,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
+static const struct amd_pmc_cpu_info amd_yc_cpu_info = {
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
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_czn_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_vg_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_yc_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_yc_cpu_info) },
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
@@ -101,35 +184,40 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
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
+	dev->cpu_id = rdev->device;
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
+	case AMD_CPU_ID_SP:
+	case AMD_CPU_ID_SHP:
+		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
+		return -ENODEV;
+	default:
+		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
+		return -ENODEV;
 	}
+
+	return 0;
 }
 
 static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
@@ -296,9 +384,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
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
 
@@ -347,32 +435,22 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
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
 
@@ -425,9 +503,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
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
@@ -452,9 +530,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
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
@@ -512,23 +590,6 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
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
@@ -602,7 +663,6 @@ static void amd_pmc_s2idle_prepare(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
 	int rc;
-	u8 msg;
 	u32 arg = 1;
 
 	/* Reset and Start SMU logging - to monitor the s0i3 stats */
@@ -617,8 +677,7 @@ static void amd_pmc_s2idle_prepare(void)
 		}
 	}
 
-	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, false);
+	rc = amd_pmc_send_cmd(pdev, arg, NULL, pdev->cpu_info->os_hint, false);
 	if (rc) {
 		dev_err(pdev->dev, "suspend failed: %d\n", rc);
 		return;
@@ -659,10 +718,8 @@ static void amd_pmc_s2idle_restore(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
 	int rc;
-	u8 msg;
 
-	msg = amd_pmc_get_os_hint(pdev);
-	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, false);
+	rc = amd_pmc_send_cmd(pdev, 0, NULL, pdev->cpu_info->os_hint, false);
 	if (rc)
 		dev_err(pdev->dev, "resume failed: %d\n", rc);
 
@@ -709,22 +766,6 @@ static const struct dev_pm_ops amd_pmc_pm = {
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
@@ -736,17 +777,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	dev->dev = &pdev->dev;
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
-	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
+	if (!rdev) {
 		err = -ENODEV;
 		goto err_pci_dev_put;
 	}
 
-	dev->cpu_id = rdev->device;
-	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
-		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
-		err = -ENODEV;
+	err = amd_pmc_set_cpu_info(dev, rdev);
+	if (err)
 		goto err_pci_dev_put;
-	}
 
 	dev->rdev = rdev;
 	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
@@ -778,9 +816,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (err)
 		goto err_pci_dev_put;
 
-	/* Get num of IP blocks within the SoC */
-	amd_pmc_get_ip_info(dev);
-
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index fe3f53eb5955..616faddc70b7 100644
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
@@ -151,20 +164,29 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
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
+#define PCI_DEVICE_ID_AMD_CPU_ID_PCO	0x15D0
+#define PCI_DEVICE_ID_AMD_CPU_ID_CZN	0x1630
+#define PCI_DEVICE_ID_AMD_CPU_ID_VG	0x1645
+#define PCI_DEVICE_ID_AMD_CPU_ID_YC	0x14B5
+#define PCI_DEVICE_ID_AMD_CPU_ID_CB	0x14D8
+#define PCI_DEVICE_ID_AMD_CPU_ID_PS	0x14E8
+#define PCI_DEVICE_ID_AMD_CPU_ID_SP	0x14A4
+#define PCI_DEVICE_ID_AMD_CPU_ID_SHP	0x153A
+
+/* Backward compatibility aliases */
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

