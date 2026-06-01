Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26E53A3811
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312907; cv=fail; b=gn6na39FS8EEBK86UgZhzBr4RkxkM0hpqCwxo7It7C1wPOZze3Xivt3VQDc+3LoQUlSZlfoOHEexv6v0gwitbnjUbTkrgknNrDZCFR37PP7EqJOWZNtBmwOo9UgQMGZy2OsfoZmtNF3hOfNHJkxC2k8ziqzoWHWTYsVOd+zQCS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312907; c=relaxed/simple;
	bh=jvDT47HoVm5fKHBPi9svS4Avd1H8lSHa9PF6cWkVoIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUCKo8589X+kH1hlzkgyLgU6yVKwy0r4sF1Yz966AYfTdL4ssPNnvZLFbK6Q/SeYAQFvnU8zQHWaRwXP0R3nlvk89eB8QaO1ZuwZZhtvTCtjdC5GqprO2dTkATQmLMzyqhNIg673YwwNzG8JDaxpL8HrpnVH4muos6wmMwg3F6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qrcoe35X; arc=fail smtp.client-ip=52.101.56.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qrcoe35X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZ0Oln1avMAMpQTRVfDCnbDBGYuMDu119bHl1kV18P5OiqcgC+bx6kBfBqAx4PwVXy9F3SymFcmXg9mUV7ufHDX/6nAXKFg8k/qxM/QJ2JJ+LmYRPkfWxrrCFsLN1MZcp7N2rQFyCuvLjB41L/QG9gWcZLy58ET/gYgcJtXfzvvPKAPZUsjqpN9ntUDtOw7NG/atfNXtdHQTbBpxICONo3Lm+4Pb3PVxZQK5fJQmAaWpr42A1P2FNz+JOirmosaMSWxihPtDWYwGo+a50AVTfVe9MyxP5uGIyxA4c6O9LkUFl1gOT2vmKHeiwljDuuLCVEOVr8IqKoz8QC1uWbjXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSHMOeAEDw3dzQ1y0RqCeu9mJH0B0Wg2/ciPxfDNUdY=;
 b=qBxWVGiZ+u8Sew9Uqsen7Gp8SU8T5x/B8tdLWTdRXbK4ex4raj3I/TVnOq/HTeZXd1vthslDH27N0tP12y3Slz9cd3gQVNChEYOBkgCbe27r1rARzcMQzCBF8irWofkPHrRRv9SOkwro2MnVFBq9z4LHaB8ssyeUeZqDn0AZ7GZeaohYwz3PWj7+6wui18Vc9m7MvYnBoo7YbOpaK53QA09OsUJenb4WL7rkD0sKZ5GGyl5toOnKZwUr0cguhyf+82mFxRKkXltbphoiNB6CjWFDmxSNUFKIpzXCQW7YyP9pBSZbFzlzL/mFoOzjILjtjoVj1+Rb+/pptmyvibqhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSHMOeAEDw3dzQ1y0RqCeu9mJH0B0Wg2/ciPxfDNUdY=;
 b=qrcoe35XjraVfALPQBEs+JRMw/1vzuTBl0FQTPi7uRMgU3PrhT7dbcALt9JEhOivaWef+iNyy6k2eFC8Rr3D3tdw4yjuQXwW9xnyR+0LC+8kfSQsLVFq30qEkxokHxT5EZeViWHPrFXXavljhAjkJoSTyIrlB6LcxF3pLWhuIL8=
Received: from BN9PR03CA0229.namprd03.prod.outlook.com (2603:10b6:408:f8::24)
 by BY1PR12MB8447.namprd12.prod.outlook.com (2603:10b6:a03:525::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 11:21:40 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::1c) by BN9PR03CA0229.outlook.office365.com
 (2603:10b6:408:f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 11:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 11:21:39 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 06:21:37 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC
Date: Mon, 1 Jun 2026 16:51:03 +0530
Message-ID: <20260601112103.1690951-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|BY1PR12MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b43eaa-76a3-40b8-7fe4-08debfcff382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	g6HjSpZfZNOe3iAIBqfQh/MxrtybbOefeO61A+1oP3tRybRQtFmc78KmwGdHUzLNin0cEl/i5BYpGRkFBWtIdNj56ttVfMsuXwCSvmkrLOHwsMTJ/cDOZOrkiiHxZrpWptLn0ZlNql/xjavxNOHdofqdlt2BoYifetB/HpSlzDgwYLeq8C+PFa0dXq35pyck08Rmx+NBSWMlSs6WRS4nme81fFia0Xf3TsNoJaI0BtI3b5cISQNMdCdg5/QaGzHdkAQwniI6n0B1VjcMkknAaQd3nYAcmlNI8H78yZIa4XEuvSY3/RnjCM8khfdn/Dsl7Phg9TR9YNUyWvOl/PX0/m9kcAoqSs+pxbpHuhHAfLAnPbbbme3ld3PoWYa1wkrligvlhplfv56rSnQ32I7VbIb21QBWFjx/C6UuT4WDQawACF0uG7BYfK7MXT/ZA14VWAERKQZ/qe1ctusqdnTpuTpFJQ7fBicMAwu6FMwDxMkbAuhrPlbGzWdYKsq8hND2/FzhAeTfPNRDUyi4Ag5HY9tJYvLPlUKioW7Kv6tjqKLI9oxwDX09aqO6VJZxHzHmOU3SDchGRL5qIKr1Y/nbiAZDM57qYsa3fPO3Xetr9ZkxYKl3ImfjH1Ji54lBTpV4CRAikfUhQhqrUf6Lmf4cl0NhkphQwPKrvoiFUj+Pik7gm9+QVDD6ElAfEWfKDMrOiRDWzVMRlp+DbALZBm1Q0v+bIbUtPiw8fBoD8l0nEAM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kigv/yfZ0VS1G9GaEb0R8T4NC2B2OJiTvIqaG8R8kQyUcZaNVQEnfESuT52sFWD0edojGJ+lnIeE+ZrpJANJlwwT2CU4a40cVIS6J2K4ff1d6lBZCzU4JT32xmegGZHo3hd2+moeV6sTOl0BIh1Q8c56J0gUyPCXVO6fg2g15gt6mASQz79HtzfnDDe22tKoZ5Gcjxxwok/SbSX/v91fIVCcSm8hbq4ugGvfa+YnDT6/CUhPgyeisZ88MfLsL/l9u558tPoLe+ohywWRzv7W+Q9UBYIBkvnzmzk8laQ3EWyO8Mi0DZD50BMXWEYjhjv8HhO12iQZmMKW/P5NExi9EWLjx658Sj3Jvny0NuXjZra4+DAtnniS/JPvYXALPSkpCLi4P93DgPZpIrbXu7lfAAOiEcRASBToFjKDEHnWA2b2rMKkuoc8sQT3LpRo8AxG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:21:39.7317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b43eaa-76a3-40b8-7fe4-08debfcff382
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8447

The 1Ah M80H SoC uses a different set of SMU mailbox register offsets
compared to the existing 1Ah variants: message at 0xA10, argument at
0xA18, and response at 0xA14.

Add amd_1ah_m80_cpu_info with these offsets, wire it into the PCI ID
table via PCI_DEVICE_DATA(), handle it in amd_pmc_set_cpu_info() and
amd_pmc_idlemask_read(), and add the corresponding ACPI ID AMDI000C.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 15 +++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.h |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 6c7fa80c7f09..8da988016661 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -131,6 +131,15 @@ static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
 	.os_hint	= MSG_OS_HINT_RN,
 };
 
+static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
+	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
+	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
 static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
@@ -172,6 +181,9 @@ static void amd_pmc_set_cpu_info(struct amd_pmc_dev *dev)
 		else
 			info = &amd_1ah_cpu_info;
 		break;
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		info = &amd_1ah_m80_cpu_info;
+		break;
 	default:
 		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
 		return;
@@ -415,6 +427,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
 		break;
 	default:
@@ -763,6 +776,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
 	{ }
 };
 
@@ -882,6 +896,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0009", 0},
 	{"AMDI000A", 0},
 	{"AMDI000B", 0},
+	{"AMDI000C", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 0fd0ced21831..0a3b81944920 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -22,6 +22,11 @@
 /* SMU communication registers for 1Ah 20h SoC */
 #define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
 
+/* SMU communication registers for 1Ah 80h SoC */
+#define AMD_PMC_REGISTER_MSG_1AH_80H	0xA10
+#define AMD_PMC_REGISTER_ARG_1AH_80H	0xA18
+#define AMD_PMC_REGISTER_RSP_1AH_80H	0xA14
+
 /* PMC Scratch Registers */
 #define AMD_PMC_SCRATCH_REG_CZN		0x94
 #define AMD_PMC_SCRATCH_REG_YC		0xD14
@@ -189,6 +194,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
+#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
 #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
 
 int amd_stb_s2d_init(struct amd_pmc_dev *dev);
-- 
2.34.1

