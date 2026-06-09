Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8CD38D400
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990579; cv=fail; b=SijCehcQE1U0OyWgwd7fLJu9zmh4xpR3pOnF9n+rxVj+C4VuqMS7Adi0blB38UEVkmc2OqVnhHbWP8x3tRUNv81E/Pcv5Ilhqw01EJ5Yq93HUc+BRlGRT9bQgITtswZOPW0cBm+ZBlcqW2hbAEM0m9hyXJmZGQmRKSLSle/HqDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990579; c=relaxed/simple;
	bh=sb/7dLtGl15Csq09c0fbrbUystxFAEi1rShX0yhzgm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mh7CsHG3ewqRVGRRZgUejppHPnYSDL9EmLCtVaA6RkrcJU0zWeMGCiqv+ZTBTKRq/IGRjFnSnjytc9nZMWkz04XrTEMhTtiT5T+/XydJvV/88yQLYNPcBrukbfk+q11EX2E4ZRhoHhNzexj8chS85CFPV7ENNkP5uP6YsUY7b8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p5TQMg8G; arc=fail smtp.client-ip=52.101.48.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p5TQMg8G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3UUj5eK7kxtv42IykTM9dlfc86dfz9+KsGFCtIPdwJyrj2jU0Nom/3dfWZcbCl/27ppixXblWRjBZLK74J7VHkT0sJogocBrvbh2k4Mbi5dw+pohOIfnQpkSCMnFv8kAMu8WCpl6wjcXbNO14RrtXoniDOtyc7hyEWhM4mg95dOquv7AoHTXIRe+bTyJUP2z5ohl16XnwpfRmSCybEw1AY6F5fwem51f+IDzlcHo8stsbUvxe8B+UcvKUZQ5D8flUvK125CR6yrVtLjSGoXFhwFaLHF4yrweg5QXJ1IUdAHYucBUa2Ffn4BRRYzG2UqSzTAnHILxw0LLsoLVFeNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=327rIoY0k9cF890g6M2JDFSz8X2iOuOxFItH2WWyrTw=;
 b=ZCkMptwY3gvWke5X4KKrgPHXTkt/9lfWSCVG3jBJppZ32kNjUE3yot2aeaUXI41XvWehru8EgP1YXsAo2yXS4YRyqtSHXOsdBiDHoZqdPM6TOBZ9KXcKXednBgtPOu9Y/f7fKSQMzJFJP/O095bUDaEK1Ji9IJz2VzBkcf/2+Kb74hZ0Z9GeFUwbkmhiBj9ba0WdnSTKPjlA7xBfEHcY6cl5qV6Hmb9qjdklVuOmaQeexq0D4Jmmn7ZogbFUKr4Yg2ZGsMdFDcdbo8UZJTXEQWTCoyp7wG1WW8dEr3LBrb3p38KNHKOb0mGNW1XVQ4608Wgla8ma4CqyfCccYXBltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=327rIoY0k9cF890g6M2JDFSz8X2iOuOxFItH2WWyrTw=;
 b=p5TQMg8GdRkI64Yz6DqRHfiseGbqesTLgPqtkir2iOZ1Ox8Z2aYVMfGuxorqbgo6XO4MrMY1TKv9mo/XbC1I1LqCklDVfydEoajqPpSbY4amAI+0iCY5uHM2I+fM33ZauKumbXmSQgUIePnzfQtV/R+vlAFtDXoZZ8N6yM7h0DE=
Received: from SJ0PR13CA0208.namprd13.prod.outlook.com (2603:10b6:a03:2c3::33)
 by SA0PR12MB7092.namprd12.prod.outlook.com (2603:10b6:806:2d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 07:36:14 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::28) by SJ0PR13CA0208.outlook.office365.com
 (2603:10b6:a03:2c3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 07:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 07:36:13 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 02:36:11 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC
Date: Tue, 9 Jun 2026 13:05:43 +0530
Message-ID: <20260609073543.2388987-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|SA0PR12MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 8420188d-9a50-47d2-fb72-08dec5f9c88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/GwvG/HK4hnLvxa5+CwhkU4Ff+z5yHUkudlVKRp1o6h0UPFQOWZzbCqkXk4SB4rrJwJsIjWDgWJLxkUNmcZdx953JOVlNXxIInFfKIfV8shdUpDHTh8VLioyAEMW3COirjZfe7rYJqaVpgahPPLMatG4Um3suRVJ+IV0L0MRho3PvcfgVS8cKWXUPoUECn59hwNsS9qdKOTlzj38ZSbgWAdwdhL9g4p2Pr0cemlsf+MmZiWI+E0B77o+sWSC+MIdqtOduvVZ3/nhz8TzJ2WYMW8Dgzq4JSi7L4HhkQzQhMao8zMu4T4es5smhcfy1leUM//cgne96NiSUa1GPpKTKirKanbaePyDsH84OvxNYIJoBaoKgS7ogIH3/XAuz3qvuNMRQagaziaErqU6IYDy6Mk2QiQziOi8CpuSgXwR5oCfmZvWIgryjFRQy/BiLnhr7lgwNIGALOxjSRO/sjiohsQTdXuj4UgMrhS2/tF8yIEydAcZkGh4aKOpzbbJ3i1f47o8zrpf39ykDQuGsmR2LXUUh7/loWNfE2FMreSpoNS5BKhyGrn1Uia+JYOUAWUCRY7hNAwSOkvZJBKiAeZLpF+I2x2AqajF/o6vdgjyaNdyrgzBiuYTCuBEqb5+Go5nQMZYxXVUiMPk+5wJ412IKRdaeBEqpdUEExx3qZnp+8AUOtkfWf4y/doMAkdN9r/3FXpxsIWrD7c03U0GA4beqgvkS0brk6X40pb9RdAIcvo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	neGU9BfdJ4pCHr7FFz2ggbVa2JWlwpOVH72t4+uNwLtXzRA3jvGETmzM8LY/IupEMK/7dL4EGUaNlWCGzTLlz4WhI9EXEGQAh/bw4LQtxcMRdmq9Qtt81C7q74sfgJLvnKkw5RL4sVYBvX5z5mi3yb4JDKO/c4dn84EKItiboYIpQcqnA3TxMaZuX6H9qdT46UVKOWnZ5Ka0m4Fu8EWzhI00tum9x1BQXL9/BuWDfYO3JEz8NCHpgX0MtHVQp/188TDOEXlf6WPeAi2leJcDf5quvxJ43wXLVXlinZMK/C4+t5fTtw5yhWzHEEc3+TXPHj933KPUC3oYYi4Q9ksW0avZdpr/DwldG/fwFnylaU32b1KJJ4gYtH8nDR2DIRhZ0X6268rVdAxwe/eBQbejzQpsl6GB/e6fa5b02z/hmxAm7O4gGtk0mLcaFl2bOUij
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:36:13.4146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8420188d-9a50-47d2-fb72-08dec5f9c88d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7092

The 1Ah M80H SoC uses a different set of SMU mailbox register offsets
compared to the existing 1Ah variants: message at 0xA10, argument at
0xA18, and response at 0xA14.

Add amd_1ah_m80_cpu_info with these offsets, wire it into the PCI ID
table via PCI_DEVICE_DATA(), populate scratch_reg field with
AMD_PMC_SCRATCH_REG_1AH and add the corresponding ACPI ID AMDI000C.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 12 ++++++++++++
 drivers/platform/x86/amd/pmc/pmc.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 3ba50ebcc431..5a43f8179bd5 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -146,6 +146,16 @@ static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
 	.os_hint	= MSG_OS_HINT_RN,
 };
 
+static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
+	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
+	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
+	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
+	.ips_ptr	= soc15_ip_blk,
+	.os_hint	= MSG_OS_HINT_RN,
+};
+
 static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
@@ -159,6 +169,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
 	{ }
 };
 
@@ -855,6 +866,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0009", 0},
 	{"AMDI000A", 0},
 	{"AMDI000B", 0},
+	{"AMDI000C", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 4c3a4410790e..b8e75b5004de 100644
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
@@ -190,6 +195,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
+#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
 #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
 
 int amd_stb_s2d_init(struct amd_pmc_dev *dev);
-- 
2.34.1

