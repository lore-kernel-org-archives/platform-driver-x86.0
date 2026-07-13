Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55C3353A65
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968015; cv=fail; b=WnuIwHN4Wo0NKjNhouvamt3HBNRdEsCNNybgP9yZnajbhTo0LqipYNhTNlieU1FeTVNAe56usgjvlSFDKHtKMNogbFCTDve9Gcbgf3AKeRu4XD6C8lAlMmtin/2j+WE+nlg8pLKLGcG0IlgeBynSnfCtsfsDtDTSNGbhAhkyEYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968015; c=relaxed/simple;
	bh=XXUYi0VOJDvzzaK4ae2CahvVSmW6ktBsNH3/Ysx9xVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NrT5AqkKLlCh6bzRupHi0IFRxXyVewCuSps2W1TQ6v09zbBOTJ3+pyP7aZYXbMbY9/TdPShPb+9GrY5Quh4bFv03HCyOCViIKH1IjczXAR7DZBPQ8SHdrwKYl2X/bClouLi3wTbZ/A2/G5SAxnfNPRQ5KjN4e6pRfun5WfevdMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZZ0Ij3SF; arc=fail smtp.client-ip=52.101.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZZ0Ij3SF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRdCDZYjYZd290RlpvVVAXnHw9ijjuDlEhiqnrdZByM3yhAvJBsWTnFZHPTTOY1Rww89KW5OAi7Dnsdj6+VAhCbyKBMFhKXw0TqM87GYU3e1sGoqInVcxCID3Ib/GeB6lERcyS8nSuXzpsLiaEkqQz98GMvBWtZhFiF7lRuUK7js9VDA9grLyWrYauakRpKUbFAl0sWMKkn7jiZLr+cfng07pvzYN1Ek5GV631tz+0kgzIRb6aQdsohw2f5boDfCEjRLMWcTpF/7Bhu6mk1ljAaimnjOx+Ct2z8EQ+6BDBVxGy+2Hl5LXuYyBqo86aaAr0b01CWE/r+emo5Ooe/ZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my/f8D9n3QC/IiNsY7ATGMeLI2DkCxcvGpWLO2zSLhc=;
 b=AL+wXd+by9FY+2OjA7ATJo20iD1XOtFYxWaHOGkZEVlbU4g8Dvxl6Z/HnWmi0DviF8++eskfY0Rmg/vEPZyFRVmJt3TTxZ3VyE7bqnYDmyveoa1mdPHKqvxMkhkaUjc2iChAmNYhA5uTY8wIPVxlXWbIHNEUjiOWiTMSRM2QJVksNM03dnxEvngtsGfXJW3jLBXkVUm4RLuLiM/J3POkQX0hWp4OCzdgvBulS7TwJn8lbqlkuq4FmRthCXNsUAuS1N91Sn1oYIegMBCH8CCj5w6tAaUHFfGiIJ11rqtZ69Lkag8lA55dHK4XEQ8pnkNkiAHkgaq0NAS7LKJzZYIvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my/f8D9n3QC/IiNsY7ATGMeLI2DkCxcvGpWLO2zSLhc=;
 b=ZZ0Ij3SFUvvpZJ24r/EPg9hy7+2lvI4lvxa8ZFzUHK5GjUG8XwXxpQNE3Rf/Mn97taPCsP1KMKLr/BxPnobfhcHj1XQLE1XMvtsDPFCfHD9NwXLemi+gpV/Ivs5bsb6gL/oPb6IxFOrr1t186sDL7TfbGKNjQs3UH1JPhDiJH9g=
Received: from SJ0PR13CA0167.namprd13.prod.outlook.com (2603:10b6:a03:2c7::22)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:40:05 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::84) by SJ0PR13CA0167.outlook.office365.com
 (2603:10b6:a03:2c7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:40:05 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:40:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/6] platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox registers
Date: Tue, 14 Jul 2026 00:09:32 +0530
Message-ID: <20260713183936.690228-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
References: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beef6da-024d-4b23-10cf-08dee10e2832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	evALLoO57NvYUAy3wv6+7jut72tuBbRPteDQL5+WGj8hDIzngknw1NMFmHf90TBQRvqyqnjrNyAKvVmFMqVjGP0KteCL3O4EIKgVqNR2GIpevoVeii93jMk2dUkpu/y93y3KKq1sNR6mG0UZ0v9VfuQKKvNLrMub4wsutyEtV0ykThAcDkbWn8ob9jKBHvHVATcr+1QuoVCH2l7KXgrONCOw4H68B8hbg+NU0Am6bGnMU2u3f6eGrcY5rZriBPBWV3XBQAHZ4FXohUX8tvmqMkOUwN1GCav/33uRGwLGhg0FLxR2/R4qTR1hbroCo2PjK8S2h+DfviLyEuRkDjEgpeKlMAu5d3JTmGO46VxyeBNcQF1XupjmA/y8GQH8zqqOBiWjd1tLGbZ4Jk8ilzOzg6JpMyheRtr7eUsGH+47HzpVG7ryDLxx4YgpofsrQkyZLISkaJgleVEOa3zgyQgPBgtdGuA9+nUFpAKqyJEdeyCT2tqzAWprN90a7gUgnYkQ5dtC+g3jFsqweAN1SRnrxm9Pwc6ZkmFnX0TW0udRLyiMk1ydbQccZMSUjGUYX4ub1UIYXIHVwVc6iodxgPfu/io8wuXg5tFFQGnZNTI3JiDH+gCNsUgZ1FJE+BJrtldSOcLzF8u8W8dd4XhWBQAIRInwW7KNhRu0GYNmWq28ctOwGnS8VRpJ/gLLgTJkD6yfIHtQGPk6wrnM6LoooFQBKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xiU7jNRmAr/MhoZ3MES6pGMUm1QFviX+dJ6vNkuUil0/qbEW8EJH2K1rFGmypxeaPYWBUQkobWipi+4/I+WPVNrtqpoviS5dhfSm7O70xO1tbtSjnl7mz76muHZQHDGtG9jb/tsGcrzKwBpk02hE9GERtrRvKVPmrrZ3ra9oFqfUX/3wGvlM6g9NSzuiObuUwdoD6cCwlANjzZ73cKB5HGJa/7FtZNoOBkCKR0ExpGv15jA+SxrJnniQ96eBjuZzkA0ZCeSDlxomr+oCucYHsVc/GkESVQ05VslTE8db3X7qhLG3y15z5BgPXgf8acf/83zEDQ3qzp0NHiRr0inQE7b6wZKVTm/c8iiroB84Tiel4q/L25f2bKT9A2smL0v+Fazc7CINFa9/o++LtzYjxzBknHybzOygJX0ElyPlzdAl1GUYJl1Z6xtHEu782y5U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:05.2607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beef6da-024d-4b23-10cf-08dee10e2832
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838

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

Define amd_pmf_smu_regs_v2 to capture this extended register layout and
register it in pmf_pci_ids[] via PCI_DEVICE_DATA(), keeping the existing
amd_pmf_smu_regs_v1 shared instance for all prior platforms unchanged.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 28 ++++++++++++++++++++++++----
 drivers/platform/x86/amd/pmf/pmf.h  |  3 ++-
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 3018c861776b..0f85ac0ba803 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -26,6 +26,13 @@
 #define AMD_PMF_REGISTER_RESPONSE	0xA78
 #define AMD_PMF_REGISTER_ARGUMENT	0xA58
 
+/* PMF-SMU communication registers for 1AH_M80H */
+#define AMD_PMF_REGISTER_MESSAGE_V2	0xA04
+#define AMD_PMF_REGISTER_RESPONSE_V2	0xA08
+#define AMD_PMF_REGISTER_ARGUMENT0_V2	0xA0C
+#define AMD_PMF_REGISTER_ARGUMENT1_V2	0xAAC
+#define AMD_PMF_REGISTER_ARGUMENT2_V2	0xAB0
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
@@ -266,7 +273,18 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 static const struct amd_pmf_smu_regs amd_pmf_smu_regs_v1 = {
 	.msg_reg	= AMD_PMF_REGISTER_MESSAGE,
 	.resp_reg	= AMD_PMF_REGISTER_RESPONSE,
-	.arg_reg	= AMD_PMF_REGISTER_ARGUMENT,
+	.arg_reg	= { AMD_PMF_REGISTER_ARGUMENT, 0, 0 },
+};
+
+/* 1AH_M80H uses an extended mailbox with three argument registers */
+static const struct amd_pmf_smu_regs amd_pmf_smu_regs_v2 = {
+	.msg_reg	= AMD_PMF_REGISTER_MESSAGE_V2,
+	.resp_reg	= AMD_PMF_REGISTER_RESPONSE_V2,
+	.arg_reg	= {
+		AMD_PMF_REGISTER_ARGUMENT0_V2,
+		AMD_PMF_REGISTER_ARGUMENT1_V2,
+		AMD_PMF_REGISTER_ARGUMENT2_V2,
+	},
 };
 
 static const struct pci_device_id pmf_pci_ids[] = {
@@ -274,6 +292,7 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS,     &amd_pmf_smu_regs_v1) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, &amd_pmf_smu_regs_v1) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, &amd_pmf_smu_regs_v1) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_pmf_smu_regs_v2) },
 	{ }
 };
 
@@ -563,6 +582,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
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

