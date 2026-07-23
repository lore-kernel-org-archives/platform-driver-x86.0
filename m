Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013070.outbound.protection.outlook.com [40.93.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9015F46D2BF
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805374; cv=fail; b=MFsTAam4sUHCY9S/71ORHPKIcyCaqgE872SavdPmkR3zDHtw+xQG0pbyZG7zUIEfqAQYJxtiF5Z8T1Wt3wbdTmClFdSVFou/JUpN4zoPdUuXi5FH/eVhUHyqzDk126J5OfxqaqadcryVZi1evlcgLSZxSeXFka5VFC4TXSOE5LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805374; c=relaxed/simple;
	bh=jG1e5Kq9t++4CgaCVmHQIp0XAaEnG/Pm+NWeHkqdGUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GrPm8WtIMZJ152CyMghpC1AU1vuVzRKKFJo2hPyROK1fDMeK8k7YMhS/6hWa3DQNvLVrf6oLJHErlwY9rPB7sgFkkpQWhlR6FKN3kEYeEZPqZMRFAB37/8598X7Mnm4c8d87nHUVamKVhZ+5DoLeWuHpAteMisy15kk6zGWu8jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xQzrtZCF; arc=fail smtp.client-ip=40.93.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xQzrtZCF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPn0yuouUQuNAgPjaa1JaSsXcGvHHZRa6RWNSGtjXiKNg2x3mbAOM0+GJiJ/rQMEAVvIFINESsDyLuupX14+ABsDxsFrpgJMwiX0AIaAVczboPuLGR6zJ0N20wTSVyGlYbRvpSlV9aiWaDczzf0X2imvPsm2VZ1J4ccqP8S9gvwpCRCFOLbLAd2Xiv3FcT8yt+nKuYtq3D1+F5AwIpFPMsO2PJi1SKovnW0ykIn0mA/1BRukCVoWQ3Q+DU7zh47EvSt6WfdAekS3oqX8LOPH+nsBmt5D9jIdpo1vXiaMaGVtZ44Y+21TbhyxRQsiXHWNiumypjkvjcPt4Oq29uaYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKv4rzsvnTEwveYwUaim+d/+hViw2JLXHuMdHFggz5Q=;
 b=x9zzCDUBguY8hg85Ow6diLkYZpJMTJIx2aCxVtcX5aL/vjqklEu08ihunGVbRyuwyTiFQIkwewoNhZnXLz9/RdM9ns7Stmhdy8CKALaH8VDabjKtFOwQFp+RV0Vj7seIDm01nKkJ9VScHuJnxBE0XgkGSMGlfIgyBG+uIeWmNay7w2QDbN/1rVK/nzIulEvpejKYFeR54j1EYjeXYvapEJxFrCuTo4xfRmxZ2jLJgcjARU8DKI/Sd54udsWkOTxyOSrEEK0f9pMGymgcv5wWKCqGOahGeO3ctpv67d7FkwMW/CjYOhqTJk+yCp5vcHt0vbhL76wXx6h/pc73nciBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKv4rzsvnTEwveYwUaim+d/+hViw2JLXHuMdHFggz5Q=;
 b=xQzrtZCFTqTxszN/etQe0BHXjpU/JSOrjjMXO0x/PDEe6B6Cpbcy7XZ7oSG/jy/5tJlZfoECz6seIraQ3FN6YMOftRIc7IBxhqjAMeqDNSucof6OOpZu2LbigzXUinciJJWBsr42WxLMENMg0LbyXoWPVt8LbI5hwYLVcVQC5jY=
Received: from BY3PR03CA0011.namprd03.prod.outlook.com (2603:10b6:a03:39a::16)
 by DM3PR12MB9328.namprd12.prod.outlook.com (2603:10b6:0:44::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:16:08 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::38) by BY3PR03CA0011.outlook.office365.com
 (2603:10b6:a03:39a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 11:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:07 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 2/7] platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox registers
Date: Thu, 23 Jul 2026 16:45:29 +0530
Message-ID: <20260723111534.1940925-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
References: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DM3PR12MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4f152d-d8c8-489c-1271-08dee8abcb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gLymbXir5u8sz/kweu0ey+764x0QAQOU7UY0S+KbARP+yj6XRAsvuy01wVC5Ol5wqPB5hviles+FmrEsbGloGKS5kSdiT9tkwBJLlkVcqYPKPSn7eVnBFEuMA/coQNhs/QNNAbVlEzYXMzFh97ByQNumv/I9fNtQsOCRvFhGzQetiq/JszqGHJeXFvCPj3v+QGViBeefiL/tAH1r7FMlW+cbyB7TJJYVExfmrYbNRgW9M0ax3mOu7PweMyoY/aPnrWst+kQ8HkRcCQN3pClYZr8MbShhjLrXGN8whkU5YH3M7s1g4JA8LueGFvFIdIOPthSYakC+HPBFBeYyMjuSvWQ3Kt+LKP44QtL/e5SYx0LT12pMADe7PFAsHp3I1Njd9RdJRjEkBqIskgMhruO9nTZHK9UBJ6xQn7ptCLXeYeEwhF66RyQkssgsxNJbYtsCq7LH0uMf+7X04OGeQuxupo/cX+xGIuSEaTedfBNs5Yp1LV8Yxamztiq3QZPNGcaAzTtrQ2bo1knikS2DnDyzSnhayyLm/r6CisaZZeaRncm58s78HX13zTSY6xEm+SUDEz6RulGRYd9zIH8rXfSB0iLYPPuw9EIyk7WEpA/6mFYy+bWrDu3cuIkkyqxpU6aWMQ1o8ndwqiAkoviFqdrM9FT0i30DncN0m7R5gcGU2RQ7szaJzlsIIbn6B61I4ByB2CdddO6gVKBYVbFHAZhrkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zhVgA1LXn0ICvsZTGCoTcGZW9LxhYTQK3SfW/UeTcK1Eg77CqTOBebpZXVeCOCJuSeea9EENK1T/cCfEni9rH62OhSw9PcGUnn6dhWqp0Nkw5yGQqhr4eqrossHTZIjU+gz4t3TgyLr1bXQD6tDO7L33UfSsuHwikgT2+Q8bX/Mo8r5jHDZ4+pfqBN+/yKygFIkR2bjzjxSBLKwC3QHQbQ/22AJ42EgqWW1GDq020QAus0Fikhjvfuj16gK0BZV9JcZv09YxoUkLN+Eh232PTn+nSTb44TUIM0UJ/qcKxlvATOcG9gmHVGJWXhKS3bMrHNSKcSMRGnVzEPtpZAfZL2ZAjyX6eOz5hY7IAzBif0EzfxlS2DLstJkMdZBVsLQq6ilEzQv+4hjxktnnADmu74+kBDHqKa1YCBuRj0UYILCLUlpi/oUnszmLfrxc39Oc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:07.6780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4f152d-d8c8-489c-1271-08dee8abcb1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9328

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

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
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

