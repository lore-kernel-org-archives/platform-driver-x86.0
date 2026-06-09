Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D934CFC3
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016031; cv=fail; b=TgvMeWeXT1beHlNYO6bN9ipa0O1cf1dGLrdaLNyws6GR0et1yy5dWMRizBAWi6anHW2lRq/IyS5f8Ms/HwPj9AIPOTDPEvQo3yqmJS517W4KRdt3+DrpMPcstXVVh1C2ipSx9GXSEjBigCwTnRiCPjkE6RaQD+1acdkTDlf1C0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016031; c=relaxed/simple;
	bh=vTetavWj7kqiolFDDJkgGNk/hv8nOnaRr8+gLNjoRFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4QGElT62Wo667Gd3V9PzFvq2548rMP9bawKb0v9WaZeCysizOCdNJTz56pG6tjrYepHRXjwqXZGwCCx3Uz8U5WPF1gHNLn3HmAsejzUHUqhxxgiELadlhktcwE7mKUD7xEJZKkfMMnx66e57tUu4m/bKyFO7zk2ts+XwHF4l6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tOEY1ZTS; arc=fail smtp.client-ip=40.93.198.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tOEY1ZTS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5/X/VheHedbBpmeyYRdUv5npaN5slykH6U6qIJlcUf0SATwgjDYX7RwPeQXT1oxf6CBXgL5oEwQw5xvtf0VxZrd1YrEDAFdtxmJeRnDhkC2ypwH8doPjyC9+z0MZoqkfmyHodnT6GDXoOB7loTSoIKOeLm1bQyAZq8XvOC+xzIqwwkjv5LQ5MvhxYjWWd2h7t527aegG/51d34ME6MsAiK5byoJkunMWA6ngf5CXUDVlzFaICpp70M7W984kjfyvfMH6SA8e3QkZnyGx6SAyc/mDyjZH0QIFJCfgNss/usZP2GU6gnCvOgzd4ITJST7K9P/Dc9SiYXeU6YkOdf3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmvQ0LERMslm6jB4AOXrfALIzxn4AEVKp6e6rwmGei8=;
 b=LcipscriLEF85VBhQJXifJG8qzmls7uGZmYnLaMJfRl+OSQmFsYWo+GMqQWqGQaTAnocajNe6x/kdMJwlGu4VkJ+8qhPKQpWRqcscMCxleh4+khYJVgIP/+KBQ9bxIqSvadZDIg3qmgOwYsQ394PZ5/I+FT1dGOPo06W8xqmJjXR4pMbFoUuID2xJOxEV3xRAcwJKrZv/gyRWn+rqKGgVlelhY5hWYmmogvlbGP9OTjWN+EAgU6tGiLaPOZNIA06kgJAIvYwPz55DyDtCjl+PBoqmKfDDRsp4/Xo83/fEIbLpgI8ZCluIRSOKmmgSA+PWNgapRgIEWBP16LEfpDbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmvQ0LERMslm6jB4AOXrfALIzxn4AEVKp6e6rwmGei8=;
 b=tOEY1ZTSQ+EDFZt131Fd1itLHKeLfXRO8047LnqHsZr6qLvtIiz04SZVl2hzmq62j/ZVeCixB4QdItz2sTcfp3uzOkpgTJ8a2ftMDoAorJcoOG5U9utyubxpUQYfcg0XdvvKWNuv0UG9H6jr2Zg0SIhTU34FQ8dQNGmXhd6KRWI=
Received: from DS7PR03CA0089.namprd03.prod.outlook.com (2603:10b6:5:3bb::34)
 by IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:40:26 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::66) by DS7PR03CA0089.outlook.office365.com
 (2603:10b6:5:3bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.15 via Frontend Transport; Tue, 9
 Jun 2026 14:40:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 14:40:24 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 09:40:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, "Mario
 Limonciello" <superm1@kernel.org>
Subject: [PATCH v4 2/2] platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC
Date: Tue, 9 Jun 2026 20:09:52 +0530
Message-ID: <20260609143952.2999707-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|IA0PR12MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: fec386ee-49e1-420c-4f87-08dec6350a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/PbRvevuNE0JNQ6WOHKonDJIXi6ZGgkVS0YC9MsxZbTHWq6r2m2Y7oBEEYRoFW33i0UklglQW94ZT2MGWv0MpBX2ZdeCN3Q9Nd8JyPyP44Yak9p3Pkbv3C8EVJ5sU4FWwDPsUyA6YP3nRNxhcX1tRmargKOX8G06pcnGWbh7aZTluXjlktk1FzouduYBdzZ4gBsIjzpucLJ0iTxSb3meSeTNlqAp+v85dr1XA87QhmH5NmS5SwuNW1Q/4tXxjvDY5HqtP+mmwlneONz9oBCxRExDNxCGVpwiyiklu7lb53LOMO0bcG1KwTgK8t1w5+GarxeveyqfenB3v8fa13H+rJw3RnzSfk1/rOChkVGh1bmcPG0jplYmNsAsujQrcXSZp7q5WJ0tDikPaIbBDExFn54qlqNowli93cwNQ5Fa878C7WIofOArdC7LLtrV0jSCQhh9XvLiVTHp7W+Xnqy6ExYf1Wl3JbxpWWBqKc0KlzsubViffi39N9PhxmdgQNvl0T12aETp48esa1vX8pSSz7fOiivF8GlkS1GXt7oqgAkGmzw/2rkbjSA7aYgjsE0mDJmv/rQQEhllSi1JHiE/YNHqYMtP8SXFEBUynhWHmaoR+vgp+QnOw2+AHHePOdfs9UTEYE45AN9woX/joPiRnfbk1qvZasrRkbhOov8xz2O3aRQQkyWMOOOVdrTeQr6PyORB5ElUDc4neDG0D32/cb+tHtnZiRZQmeT+lHdBpj8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pQC4KDMMW4SWjDjLjqVzlHK/9PmiDJh+cKNFQwE0rt+oboBaKr2qYT0+gK0lJkxuIv8OdEVTKzMKTkia/aWpKxbEShroEgSk72/MKUD4eNRaKfsZRyQUCrUScXfy6KhEsy/NBGsjzhdMERAuxDkzYDpNL+0SYgUDTWCx6F816fHGRFlUAZNyZCCdNx54ePqU46pkswQ8IWlvdZZWX7mWrWTnE6WecU+RqdJ8vUDmd3k2sjHQi7K5Jxm5NhLOdNsrzvUbEQy6W0W7Y7tnDwhRJPlUEr1v9+BNiL9Kl6iCqpiOx0snLbXK4xxZPjtqa7X+d6a+yTB1/jsFZ6mTy4d/yyyyGfp41NbVjB1GdbQP2Xkmi9iTNuszwkJ2HN7rmN/+ZyGJSU020hpwm2zACuylOkPtYezU6SKn3up1/9PLwT7BJ+79HeOw1zDU8KT4nZBg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:40:24.3287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec386ee-49e1-420c-4f87-08dec6350a72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578

The 1Ah M80H SoC uses a different set of SMU mailbox register offsets
compared to the existing 1Ah variants: message at 0xA10, argument at
0xA18, and response at 0xA14.

Add amd_1ah_m80_cpu_info with these offsets, wire it into the PCI ID
table via PCI_DEVICE_DATA(), populate scratch_reg field with
AMD_PMC_SCRATCH_REG_1AH and add the corresponding ACPI ID AMDI000C.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 12 ++++++++++++
 drivers/platform/x86/amd/pmc/pmc.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 92e36a6161a9..ccb37383b337 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -154,6 +154,16 @@ static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
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
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_czn_cpu_info) },
@@ -165,6 +175,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
 	{ }
 };
 
@@ -860,6 +871,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0009", 0},
 	{"AMDI000A", 0},
 	{"AMDI000B", 0},
+	{"AMDI000C", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 616faddc70b7..36756e25b4bd 100644
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
@@ -186,6 +191,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
+#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
 #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
 
 int amd_stb_s2d_init(struct amd_pmc_dev *dev);
-- 
2.34.1

