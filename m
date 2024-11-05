Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629051E2619
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828285; cv=fail; b=Rcyws04+OKz4lC15g8PTxppSTKfQY/FkMOhipLJpqfiDCSHo6klhVK03Oh/oQ2m7rGzXsVTYROmdgbuzOPbURlSAu9P7zgWmd2A3zrmgPgOQwFWVT0aeNK8W+J3v9wat2hvOD9G88TUdFp2GLzUM8Kz0TcU4hLXgXoAuNQjB4tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828285; c=relaxed/simple;
	bh=FW+jB6twZ8bO7ZK+ijJZRvdU1rimFg+3b8rlupxsufg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvUk7Pe/j8AyxH2EB7C5ublqkpwPu1orztNeMTncOFeQIH3j7RwWzOaYqvMe61tmS0DxUC6JaySNmpw9p/HucjteiLqiWMWRJdZO7uE2PuztTLVPcjR4gs9r8GuF+Qr/3bmiX+JimnI5IB86CgZ/3emSwVTIG8Ymk4A6CRCLphU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Awxapdg7; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Awxapdg7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cbgn82R2z92eApNom02p6U2UDUvKl95bbKL69fciUcGSBoYzbQ1MQkbEzzKIL4mZgaoIkvU8LCMJJXLdbr9PbT6IWlTEGN7dR8u+4nB1l2PpzjF89McMj9UoJQf+3K80ArQpJ3AAsJeCaAzgbcRtmbxWqjl4F5xTrFgYxpnFxps/LMr5WtIagxGRvkdsooz0uadBr42cV+5CX8nvGMpp3lYkJkIXzZwno7g7X/yONLYiSxMQcbe1ehOwIIGxZWHFeomNeXtphTHBXSgXYbvBkx5Dc8gRefireuSkzOCzYDGtBfKBF9PgMpDWcIMVLUJgCpt0SuAjSlMjGzgEkRKcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmmzjZy7ORcoFQT6YwnT2S36yrEl9AWdfP1P2rtNd+U=;
 b=DShLjLL2r3ILKrafcQW3C42b76BHA7abrfP/jZ27sl50NMoGO4seHdM7MseiYp6FEnpebHOwJElUpEOwTgcX7tz8fHcDgI9SI1L8omvP/bYoukygy0KK/OU0j0HScq3bEza25tlCMNFevqX5KB4XYW+2ZCTGc1pV2ErROHsDM52yq0toDhbS1SkCzzT+sl1lzDMZb5hvfge3EjHTSe3zForZzI/enX+wDIxlwLLZc7isG/e5PudpjluUMuKa/T02WnZrbQHxrxEqsdsYW/5bk+uh43ys7bWiandnUkr5DfM2Ym4wFN2RecSxlqIXG9y8CullKuhUFfDHf5wdH39OZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmmzjZy7ORcoFQT6YwnT2S36yrEl9AWdfP1P2rtNd+U=;
 b=Awxapdg78BVogvzNADUfrSsyvgA+hM+CMvcsCXNTEl+Gcu8SJ4owe1MrNSbXz0J9408Jux2XUqmOwQhpPujiLb3Fz+HYoNqjgVhbhP1DjTbOwdHJtOC/UdEJCTZ46qrTxXq7QT2C2uJThuXsLC0mtzxljWdsErPKdgcFjjW6ERE=
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by CY8PR12MB7364.namprd12.prod.outlook.com (2603:10b6:930:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 17:38:00 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::13) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Tue, 5 Nov 2024 17:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:59 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v3 07/13] platform/x86/amd/pmc: Isolate STB code changes to a new file
Date: Tue, 5 Nov 2024 23:06:31 +0530
Message-ID: <20241105173637.733589-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|CY8PR12MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: a429cb22-d7ab-4b63-7e7c-08dcfdc097c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H7GKUlBwgcBwQ1ejYtGQwgAdNiK698QcKk7eYQYHrkOZrPP/fZcJ1MHD9/38?=
 =?us-ascii?Q?N4SrKv5/vBs2YAD6OG5NWbYIeNSwEbJXp76m6MLV+aemywxw5SboUimj+nvk?=
 =?us-ascii?Q?LJRUXKlgPwN+BAEbqPgiFPKiQfzJhljPzVZ8rQoMNFrgl6w+NM8fpJmtfb68?=
 =?us-ascii?Q?dB//DER6Zv8B7y542eUskebVQ+v/imZ4YmRWjU1K2we3YbVNEx0+Weso+ME5?=
 =?us-ascii?Q?z86+Aucl8s3mXT4xvr3mLGwshoqTNEZwPHjLwVBxe4b6DCRrZI4DlooRWnPA?=
 =?us-ascii?Q?p/8cLOgYEuNqJIaGcux8bbTU7plpE/XLkHvVrt+gFQ6wOPRH0aOuxktk39JX?=
 =?us-ascii?Q?XmlyfmRk+hhwAn/MeTTtWFqqCNio2F3QeVCXTEFG2GSwn6zUtyF1TmIUIJJd?=
 =?us-ascii?Q?grlCBH1ln5AOs0uu7iMBzpCpbZjJyJk2BlqDqkLnOL9TG0JuBji8ZdJSG8td?=
 =?us-ascii?Q?usEnIclCDNpY6slgVcTyM5qUQLkBeYOl010CHjx0HKnXMfE8RGpTBPgbzgr4?=
 =?us-ascii?Q?ZSi4aCrJB/feVCRIN4uxbDBgE6j/UmHG+xLzcSYSL9Xch8frZUpkleuK0YO5?=
 =?us-ascii?Q?xoFaH7mcoqyMijn+yYSbiEAuyMwknzhhem+pZ7Qp2lcgdItB7apfu6JTgfwE?=
 =?us-ascii?Q?TJ3alaTlGoIaXCSRxXbUoR0alOe+LCYXbrhzyLBlBHxxFHKbBQEPRdJpN+bW?=
 =?us-ascii?Q?jjnD/j0mn5fPUPsMMaL33hIxELhHu78eCUj++FLcR0BtCmT6B4OgwI104UFt?=
 =?us-ascii?Q?SUS6sPaNp+PZA7/IEIsCLw4WaetfNsjKX/jpkKt9U4KSgfZNQXOuHPAkaQWs?=
 =?us-ascii?Q?h9001wiIrXOGRzIQNxju+WZ4aZCrDEFw2/sc4miUWnQc+7rIDAojU6LhVCzH?=
 =?us-ascii?Q?H9ZNFpFWIv2LY+sqEMqXRT03r7chEuTYVjk9QI8l46hY63jwKt81K2ymv0dA?=
 =?us-ascii?Q?aqSe3N/ImQypt6tGZVU9RCIgCcijN6+xdYnsxPm7GZl7w/AlRXllkAS1ehy1?=
 =?us-ascii?Q?AG4tlMQhVv71y2W5Bb0FcDXAbyRtEslytYCTMOvaEh3tiQBwwdbCtFEyiHZr?=
 =?us-ascii?Q?+VEJCwjIpcsZClUN/sUl9XygeOpf01PoMc3PTeRPzMOpPoFReMd2oJvZRbRs?=
 =?us-ascii?Q?I8/c3ZV4joIZTuKC2zUtXvo31UhGHGfCzq6TirjG3WcE6pVKrzvRLbGRsBdK?=
 =?us-ascii?Q?SIVGqkhEBic2icvfJEix3DMevezFPGD2ZeSz7sd+7IDPdmWWxr4dtAE6zUwo?=
 =?us-ascii?Q?tMuuqS9VU3FrGqR+72HTHVPW6qMrySqYDMVJc/w4urcp6nOIBqdk321tELiv?=
 =?us-ascii?Q?z2Lk1Acq8GrrNdutRyRu0g0PrBKNquFRnHKhZ5acePrAWHk+xrydeCjd6nqL?=
 =?us-ascii?Q?XK8biqIbj8Ub+1S5PRBtMehU6nFHjLqnGJoiejEPMtRXbiRbqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:59.9340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a429cb22-d7ab-4b63-7e7c-08dcfdc097c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7364

Since S2D (Spill to DRAM) uses different message port offsets compared to
PMC message offsets for communication with PMFW, relocate the S2D macros
from pmc.c to a new file, mp1_stb.c, for better code organization.

Following this change, it is logical to introduce a new structure,
"struct stb_arg," to pass the message, argument, and response offset
details to PMFW via the amd_pmc_send_cmd() call. Additionally, move the
s2d_msg_id member from amd_pmc_dev into the new structure.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 33 +++++++++++++++++---------
 drivers/platform/x86/amd/pmc/pmc.c     | 17 +++++--------
 drivers/platform/x86/amd/pmc/pmc.h     |  9 ++++++-
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index fd7ca1626cfe..38729c9b205a 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -31,6 +31,11 @@
 #define STB_FORCE_FLUSH_DATA		0xCF
 #define FIFO_SIZE		4096
 
+/* STB S2D(Spill to DRAM) has different message port offset */
+#define AMD_S2D_REGISTER_MESSAGE	0xA20
+#define AMD_S2D_REGISTER_RESPONSE	0xA80
+#define AMD_S2D_REGISTER_ARGUMENT	0xA88
+
 static bool enable_stb;
 module_param(enable_stb, bool, 0644);
 MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
@@ -175,7 +180,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		return amd_stb_handle_efr(filp);
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->stb_arg.s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = MSG_PORT_PMC;
 	if (ret) {
@@ -238,18 +243,24 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
-		dev->s2d_msg_id = 0xBE;
-		return true;
+		dev->stb_arg.s2d_msg_id = 0xBE;
+		break;
 	case AMD_CPU_ID_PS:
-		dev->s2d_msg_id = 0x85;
-		return true;
+		dev->stb_arg.s2d_msg_id = 0x85;
+		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->s2d_msg_id = 0xDE;
-		return true;
+		dev->stb_arg.s2d_msg_id = 0xDE;
+		break;
 	default:
 		return false;
 	}
+
+	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
+	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
+	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
+
+	return true;
 }
 
 int amd_stb_s2d_init(struct amd_pmc_dev *dev)
@@ -274,18 +285,18 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = MSG_PORT_S2D;
 
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->stb_arg.s2d_msg_id, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
 	/* Get DRAM size */
-	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
+	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->stb_arg.s2d_msg_id, true);
 	if (ret || !dev->dram_size)
 		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
 
 	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->stb_arg.s2d_msg_id, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->stb_arg.s2d_msg_id, true);
 
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 7726a05091a5..90a7983d510f 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -44,11 +44,6 @@
 #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
 #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
 
-/* STB S2D(Spill to DRAM) has different message port offset */
-#define AMD_S2D_REGISTER_MESSAGE	0xA20
-#define AMD_S2D_REGISTER_RESPONSE	0xA80
-#define AMD_S2D_REGISTER_ARGUMENT	0xA88
-
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_MAPPING_SIZE		0x01000
 #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
@@ -454,9 +449,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	u32 value, message, argument, response;
 
 	if (dev->msg_port) {
-		message = AMD_S2D_REGISTER_MESSAGE;
-		argument = AMD_S2D_REGISTER_ARGUMENT;
-		response = AMD_S2D_REGISTER_RESPONSE;
+		message = dev->stb_arg.msg;
+		argument = dev->stb_arg.arg;
+		response = dev->stb_arg.resp;
 	} else {
 		message = dev->smu_msg;
 		argument = AMD_PMC_REGISTER_ARGUMENT;
@@ -481,9 +476,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 	mutex_lock(&dev->lock);
 
 	if (dev->msg_port) {
-		message = AMD_S2D_REGISTER_MESSAGE;
-		argument = AMD_S2D_REGISTER_ARGUMENT;
-		response = AMD_S2D_REGISTER_RESPONSE;
+		message = dev->stb_arg.msg;
+		argument = dev->stb_arg.arg;
+		response = dev->stb_arg.resp;
 	} else {
 		message = dev->smu_msg;
 		argument = AMD_PMC_REGISTER_ARGUMENT;
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 188284feca72..be3e6b35433c 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -25,6 +25,13 @@ struct amd_mp2_dev {
 	bool is_stb_data;
 };
 
+struct stb_arg {
+	u32 s2d_msg_id;
+	u32 msg;
+	u32 arg;
+	u32 resp;
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -36,7 +43,6 @@ struct amd_pmc_dev {
 	u32 active_ips;
 	u32 dram_size;
 	u32 num_ips;
-	u32 s2d_msg_id;
 	u32 smu_msg;
 /* SMU version information */
 	u8 smu_program;
@@ -50,6 +56,7 @@ struct amd_pmc_dev {
 	struct quirk_entry *quirks;
 	bool disable_8042_wakeup;
 	struct amd_mp2_dev *mp2;
+	struct stb_arg stb_arg;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
-- 
2.34.1

