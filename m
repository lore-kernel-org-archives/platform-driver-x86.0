Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98A2374E57
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705369; cv=fail; b=aMbJEXTF4yv+V75xnA5Ojswutb609fxbPV0oRZRr9tY5JupmQDMxivHUpGaW16e1l65ti8MO9HH38OGDTbhXQr7AJ2X+a7xFLqXoo3IiYi1Xy5VMdNGvlgEdENh/q4FFXC9GF8w/milx8IkQ2OFHUKlQPBY/xZ470dAfQ3S8eBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705369; c=relaxed/simple;
	bh=8ChtpXBdSisokkz0j/XHxnFIYhJBzzH3vSfhk8bp1eo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dcNYc5qn6QaqaVbJdJVcJ895jWz+xAgSFHxN5q85/sCB3WNGtFZKO9PKjMpcqpUkJuTDLv/kgYbvWTDo6jAMop7eZsyYtqxTKZBkJ+VvcQwVXSUuXrMwiahV5JVoHFjK5lumFmgEOAr1c6YcI5GAE/BcSfd8WgmrH5OXEIInFF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zDX4xy02; arc=fail smtp.client-ip=52.101.62.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zDX4xy02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZcROwCdjh9FiKaeA/jYujea2KfdTAjqpefEemlJbMbmXyNw+XHUarvzZtg7jSZjeG9aHRZxlEMKHWBF7EtupTsPunO6zUxVvJnq2yF4A7ULJdc2j8Dfdg4AfRVaMsqm6zepGD+sKIvhfJu6yalBT8BfCZMaLXTw6H0IncM4qcJhE6XKC3AbqRboxUEODJn3I1jysXbUk1mmRiq1hFIY8vvzo1QP2tpl0Oya9xd50mqh4ePAWcktsF6pUgocDMlKQG/nMPFbeAIuJK9WUDhg/e5ZvuloC0pIiMoYpRS51hzYbrvRlao8n98BRi0HEffrOfYrIMjkvUZLU4LtMj6sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbBGqF4ZtS7XKu6WWfoLzbFNvZTU8ihwKSwV9GKBBBo=;
 b=vLyo6PiDqX7kkF4xdsy290fwZoUW5/iUGMGtVqhNJz/MUVInF7Q60fkmQwUvq8WZ7opw11TYBRtrxU3HuqTDhXc0SuzNlPW5HL21AePnXzq4f9H748+Vvi1ZID4SlDp4Rf2lKogDduaDOsEo6eHw3EqLDWHr/lGBDU9hq7H3wdyEvZLo0thbYld5DpqKhKMMg1Ras4eUXRKbhp5INljiy+h47AdhFdZfjc1QelAC+S2RonVfyz5EVONFhLIlcCiECYNYAtktcgUg+uK1kM0Hxj34Gg0/R1MWwv/dP2QT1momTuPJ209qhE1ymLJ5v2O9NIk+USfxNCK70Jzv2WCVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbBGqF4ZtS7XKu6WWfoLzbFNvZTU8ihwKSwV9GKBBBo=;
 b=zDX4xy02JfqvHJD2IL8DQ16DWVR6J5Vx9RxZl8BCuP77S/Ib0duqz2U3uhXzzf6DOVfxPRB/Q2gvchsoLhWiP4sXbwjQOlg6MhYIJi0EGO+tTb8khE1a1qlTW3lPgokGEnntLc29Jejj44VdCUz70SoaDCZvMP+w99rMMja/bVw=
Received: from SJ0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:a03:333::23)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 17:42:42 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::49) by SJ0PR03CA0108.outlook.office365.com
 (2603:10b6:a03:333::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Fri,
 10 Jul 2026 17:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 17:42:42 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 12:42:39 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/5] platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox registers
Date: Fri, 10 Jul 2026 23:12:16 +0530
Message-ID: <20260710174219.2522269-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: abab9f00-3a62-4da1-5c26-08dedeaaa4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ldhvcZvlSAh+aaP5xk6Yq0ntKdgiAfKUa8iblpEMujXU67DYkmWFjDyrHrUkAJlZAJlXtDcQH7xVE0zVqkkufdQsge6/HBHgrZCgG4ybxdVd0q3d5/M/bMgS0yknUdqVvftiapdz3QCNH1lRxV17q4nQAE5qd+q3rm967tVzCwJGfRd6kILknU+Bnev/cR6h5N4/hLU0c2kr3etwtuYoo6b71+hKeBae96ujujPVMppyf4K18h+LucXqWBv94eZATXIzSWk/LbEQTTsBtqvuo3xua8eKT28dtQrziVTDdYoEh4eaxZPy4LLmhqBv+wL+EUDK3wbI+PRyzTdp0dGcwabszy7oUS2SDMDaxO9RZm70TJfbrukVYMq9rhTWxffIjYrwni9iryxn7jAeIqh7K4bonJJYFVGWID9knrXNc5Kx0HPqf3OSLLoxdke40GXOOpcnEXDprdmKqXS4iDBrnE2APRB16lPRQVjr8qvgjIGjJB+VdRKmHYsX9VWubtyJN9+SULcsaQmSoVgIOHmWpJEnUs3wyE52xKWx2LZhg8vndl9igHzdvJfZtDKIJhfQnRPdtnMeqoaUp+Fj4/iBABu8FpAjwxrT/ovmFz1SGr6SQhWvQAEKOi2h2pyW8MLqHsGJbvR1IU8VgFzHVdkdzt2oc7rjggMxOmV781qByarOOUGTDVG6NlTiCoorETCXnUQou4ENhAQZX5rSKB7YWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eMaAXK0lRMbOCrI4p2xR7G3KRidXyCT/XNGuQ4dwwQLSxR+gBo6s2wOC2sWA+81JjvWFDONk1pXzuDgmqjRhP3ojJIyDU7RyGRlOB3WtXXKG5jNxwQYki7jIVrKDVm5EuCiyDDXcUNSfZdL4BJ2zORz2bcjH5vDlfFx7JVAUbyXZOeQpoMD0BxLLOdOazxrs7KKkFRevtQBMfiU1ukS+liyaUaftwPVss++9YJDtNU/6Rgq7lJgMeDiQUdgAsH0v+pb7HuEobWWEu7l4M7lC6l/8SGy5dbJ5OOVef16FX187sOoThy2Q2YHW0x/2GuOohLqQWykzeN5TrY0YqJEsnTyZAVRRWpk1YCuhqD7sNA/A/ASXo7sOwz91L0zCgkQx3F2+dqmDsqi/avyhXuSSU0g/NWcX+pyG2AxAjY1RwsZiOxZlCZ7HRju1rW3g/xfE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 17:42:42.2856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abab9f00-3a62-4da1-5c26-08dedeaaa4c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

Add PCI device ID (0x115b) and ACPI ID (AMDI0109) to enable PMF driver
support for the AMD 1AH_M80H (Family 1AH Model 80H).

The 1AH_M80H platform introduces an extended SMU mailbox interface that
uses three argument registers instead of the single register used by
earlier platforms. Define five new register offsets for the 1AH_M80H
mailbox: message, response and three argument registers. The extended
argument registers are required because 1AH_M80H exposes metrics through
a firmware managed DRAM region. The GET_METRICS_TABLE_DRAM_ADDR command
returns a 64-bit physical address split across arg_reg[0] (low 32-bit)
and arg_reg[1] (high 32-bit), with the metrics table size in arg_reg[2].

Define amd_pmf_1ah_m80h_smu_regs to capture this extended register layout
and register it in pmf_pci_ids[] via PCI_DEVICE_DATA(), keeping the
existing amd_pmf_legacy_smu_regs shared instance for all prior platforms
unchanged.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 29 +++++++++++++++++++++++++----
 drivers/platform/x86/amd/pmf/pmf.h  |  3 ++-
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 1826fc64bf56..7c5a1ec3d7fc 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -26,6 +26,13 @@
 #define AMD_PMF_REGISTER_RESPONSE	0xA78
 #define AMD_PMF_REGISTER_ARGUMENT	0xA58
 
+/* PMF-SMU communication registers for 1AH_M80H */
+#define AMD_PMF_REG_MESSAGE_1AH_M80H	0xA04
+#define AMD_PMF_REG_RESPONSE_1AH_M80H	0xA08
+#define AMD_PMF_REG_ARGUMENT0_1AH_M80H	0xA0C
+#define AMD_PMF_REG_ARGUMENT1_1AH_M80H	0xAAC
+#define AMD_PMF_REG_ARGUMENT2_1AH_M80H	0xAB0
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMF_MAPPING_SIZE		0x01000
 #define AMD_PMF_BASE_ADDR_OFFSET	0x10000
@@ -179,7 +186,7 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
 	value = amd_pmf_reg_read(dev, dev->smu_regs->resp_reg);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
 
-	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
+	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
 
 	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
@@ -220,7 +227,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 	amd_pmf_reg_write(dev, dev->smu_regs->resp_reg, 0);
 
 	/* Write argument into argument register */
-	amd_pmf_reg_write(dev, dev->smu_regs->arg_reg, arg);
+	amd_pmf_reg_write(dev, dev->smu_regs->arg_reg[0], arg);
 
 	/* Write message ID to message ID register */
 	amd_pmf_reg_write(dev, dev->smu_regs->msg_reg, message);
@@ -239,7 +246,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 		if (get) {
 			/* PMFW may take longer time to return back the data */
 			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
-			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
+			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
 		}
 		break;
 	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
@@ -266,7 +273,19 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 static const struct amd_pmf_smu_regs amd_pmf_legacy_smu_regs = {
 	.msg_reg	= AMD_PMF_REGISTER_MESSAGE,
 	.resp_reg	= AMD_PMF_REGISTER_RESPONSE,
-	.arg_reg	= AMD_PMF_REGISTER_ARGUMENT,
+	.arg_reg	= { AMD_PMF_REGISTER_ARGUMENT, 0, 0 },
+};
+
+/* 1AH_M80H uses an extended mailbox with three argument registers */
+static const struct amd_pmf_smu_regs amd_pmf_1ah_m80h_smu_regs = {
+	.msg_reg	= AMD_PMF_REG_MESSAGE_1AH_M80H,
+	.resp_reg	= AMD_PMF_REG_RESPONSE_1AH_M80H,
+	/* arg_reg[0], arg_reg[1] and arg_reg[2] carry low, hi address and size for DRAM metrics */
+	.arg_reg	= {
+		AMD_PMF_REG_ARGUMENT0_1AH_M80H,
+		AMD_PMF_REG_ARGUMENT1_1AH_M80H,
+		AMD_PMF_REG_ARGUMENT2_1AH_M80H,
+	},
 };
 
 static const struct pci_device_id pmf_pci_ids[] = {
@@ -274,6 +293,7 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS,     &amd_pmf_legacy_smu_regs) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, &amd_pmf_legacy_smu_regs) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, &amd_pmf_legacy_smu_regs) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_pmf_1ah_m80h_smu_regs) },
 	{ }
 };
 
@@ -563,6 +583,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0105", 0},
 	{"AMDI0107", 0},
 	{"AMDI0108", 0},
+	{"AMDI0109", 0},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 7a8fd9d399de..088edfab08f0 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -28,6 +28,7 @@
 #define AMD_CPU_ID_PS                   0x14e8
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
+#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT	0x115b
 
 /* Aliases required by PCI_DEVICE_DATA() macro naming convention */
 #define PCI_DEVICE_ID_AMD_CPU_ID_RMB	AMD_CPU_ID_RMB
@@ -400,7 +401,7 @@ struct pmf_cbi_ring_buffer {
 struct amd_pmf_smu_regs {
 	u32 msg_reg;
 	u32 resp_reg;
-	u32 arg_reg;
+	u32 arg_reg[3];
 };
 
 struct amd_pmf_dev {
-- 
2.34.1

