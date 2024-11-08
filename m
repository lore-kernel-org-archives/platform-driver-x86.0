Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4EB1D0E2F
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049744; cv=fail; b=fMrv+EvS6vkdG7g7yu95zG4xRMc9l6PBYiW4jcsW9A8vkjk/UzlRy7rK28geeNoCZVXQEX2WotpzFeNAeOTfZ7dplXsBWGMIoVRriSNDrPmhITh+HIXTjhgXfXVf7IcdI2UP2chqfXSUEo4nNfwZclFBM7g6Jk2PjVkH2BnBMtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049744; c=relaxed/simple;
	bh=cmxhhm5I8WSRfwWfSg5onh77TGOSvExT9jrbJ7FS6pI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYqDLUVe0Y8x2e+PqS2dGRnu7K+UTXvQEXhQoFODpyiouc/YcQ1mfOwxdvJ8fbp0i1hjTH6/MwxKxC62wpwN/tfIzjHVENiK2bhwnig6kraOU7f1+AegPoDyAoph1O+8zP9uS1EKOEVEoyUQdzkmZZCCNhHoUGQkYg3G/+M2Xl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mciiuvyh; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mciiuvyh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viMmb6JzNcWOgJ/+IW0PylGNR0S0suVj2JgLhxRI8YCPjPYYDGB7aF9iJASn4IHgNysjSJoFb8TJXydToaoCQBek5qxtDNxfsyCMlb/gbQYy7jcBmcUWPJMC2dVljfT26EvMwcY7UztAydQwy9IbryMu33s7F6AYR84TWDXvOOgYPita70jl08Gs3BNLuntoVCkciftpnaJb+SUG51ch0ZFBfBJB2BFG3GZoH+4+BeKrwH9jRFtEe/z/qP/PQ/Q10CeXvksnaHjeSJmwhD9aTVNclmQEsWOBdhXt2PVpOc3AsRcK22Aw+srQcLWItCp5mwNBN2gW67HzZEAAY+E6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaQAaqEW0oHhkAMYIpBsYundX5gY1aZ6rf8VCXrzEsI=;
 b=pHBFnCUvg6XsOfv8vrZB/21UkmaM58mZmLFZ0P2xza2XZyiF3jIJ1sOthgYZuKdVMqTuy1wxN/YNWI0JWGXx4TxIq9chO9k51S+0B/TxQngDe5XNuNSKualDZuOvdnp3iczSpdpqcXRHoRMJi2OMjO9uD86w/kWsdc6D3V+e1gAjw4GlRVsPS5jwhWZ1Zyw9lpD3ZzY96W7uAB39nHrctwrd20bkj0YtvX+/poOkj9s3oeU4fGCp+zyUD3lYolhTpOw1NUyGPWkNoRgthIylARNPw8jrr8eY8ReOZOpcT3JCN4Cpj9b/kKQFAZI34gZzu8i9zO9z+jlfSX6t2uQlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaQAaqEW0oHhkAMYIpBsYundX5gY1aZ6rf8VCXrzEsI=;
 b=mciiuvyhTTL7OPReM4MpDQu8p2eTI4fL4zYaKRPPgMbvHixLtuqdCI6XgO4D1BTUpg+epuLcAJFO/QZtCqIdEQOknGkyPCcKmzzz/7JgfYcQY92OkjVD8+fFxGymba3HFVk3m2mX7TyI+wAe/+0gR2b0bbEjZHdBiwGbC8p/k1s=
Received: from CH0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:610:b1::22)
 by SA1PR12MB8948.namprd12.prod.outlook.com (2603:10b6:806:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 07:08:57 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::74) by CH0PR13CA0017.outlook.office365.com
 (2603:10b6:610:b1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Fri, 8 Nov 2024 07:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:08:57 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:08:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 04/10] platform/x86/amd/pmc: Define enum for S2D/PMC msg_port and add helper function
Date: Fri, 8 Nov 2024 12:38:16 +0530
Message-ID: <20241108070822.3912689-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SA1PR12MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 210ca281-4c82-4298-fa6f-08dcffc43684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NZRW42xytiI7uH7xUH+eGaDyNP8Y8Y5K+RVOhOBNCwarw9ChKCxcVgnW7f0J?=
 =?us-ascii?Q?Rp9Wl7n5MZ24vFXoYogVIbFRGhScZcseN3l6HiVle6QCWPah8mf6uo6HWmPM?=
 =?us-ascii?Q?F+8VpJN2Ux71DVUCxiSdTxef1WwvEQ4mKg26CavOOJ2zdlp5K0dSrR1cCu9I?=
 =?us-ascii?Q?KiHsiDl+RHoGSquu3LpVM2iMueXNHnl045YV7VBwQUfhJ05FbJCv2NXb80q7?=
 =?us-ascii?Q?Dw20nY9bXjQ5vKdJI/SylQGInxZpckkDDRZZpWMZEgLMSKmDbar9MbnMqUkI?=
 =?us-ascii?Q?C0/UEl3W86OB3+/kLOhm6qA/R5IsB+oBg4o+hgIOPrG1GAY56G8/jORnkf08?=
 =?us-ascii?Q?NYLrZtWw/Bsn7Bzrt1J7W1fqgpNApUEqMeBvQqG+wk8U5xB+tY5LFTcQNjd7?=
 =?us-ascii?Q?6gUg7197jNVZ84/Z0t9KAzHUVM90cfeaRPQv/F9k6h5biRIlXKNnz1Qv66Fd?=
 =?us-ascii?Q?uokKYHlgexnhQJeMtJaG48qy0C4MFdlpn/kCrcbwU5C+0CVAMDBPZ1fajD5D?=
 =?us-ascii?Q?wUQD4PaVuKjidKZzIGw2t49TDI3bxUfYTbhHwe/M6TNL7Oe/3YYxsTyPC+3Q?=
 =?us-ascii?Q?uWM78NwodvdU6SfHvqTreFw1xeq3af71ugTQzYzM4bdAtA9yAnb5n/DPfDDW?=
 =?us-ascii?Q?buIwjOcGAvPThi3M21I/gCDScacN3GRAAAuX3+gkQYx9dQOVfFvAVSxFNRnx?=
 =?us-ascii?Q?PLUnpWIUw4LerEETzlN3XyW/g7746QfkPdq1Vg5x+35sVzdMFfnUHRLyB/cw?=
 =?us-ascii?Q?lLgOJQ831jDanVHiRhLzlVmfHssC7MMQh3Wry0AIP6iugU2oa9pcfAyT6C1N?=
 =?us-ascii?Q?RPvwoObNnVKzzVWUaAbBakaCl+/udLY6Mn9gBKTHR/e21kP9Hx11lcf3tj05?=
 =?us-ascii?Q?/8J4pejjTwj98wto9TCt7GgJpxCuuypu+8vMWtzrlSLc9pi1t8gj04gV+LO8?=
 =?us-ascii?Q?8UeXcgxoLqRxV2Al/tpFeEYCvQcnpD+7ehrJlxryC4dwamD5j8eBBzMqQNmd?=
 =?us-ascii?Q?1BzEEnPR+ept33DqMQm/GPrmLOZkiYICq6P9mYMK/6hSQk6WVRaW+tnHPC24?=
 =?us-ascii?Q?YmUBniDjBKdtgXn2THyBcT5ES6e2S1v72yw5N4/mp5yIIWFFhp5x10YlEm3I?=
 =?us-ascii?Q?BPdfjZGgKExfPeKIdTwQwEdxg5OYQMpK2GFsaOWrn27mIryJvjea1Pm69n0N?=
 =?us-ascii?Q?cukC38pUCbvliYQvZS2zA9yfj4Jt2+c3KYJAov5vDWGEn/61xZ7alIz83FzI?=
 =?us-ascii?Q?Z+wCQd3ibQ358pzPXLtMlnsJMZQROLvOhBxhrmNUgdXBcfo6NrI8rFTcmx1A?=
 =?us-ascii?Q?sC0MG+TPxS68Bc1p+GQkzmRKCYlKOf2sK+SWiIhaPg09nDQJ8OUZg7HBosK/?=
 =?us-ascii?Q?3auolUQMzOaxxm72IbHyN05fZtPWt5ewHgNkatZxbJ2oq/5Jvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:08:57.2187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 210ca281-4c82-4298-fa6f-08dcffc43684
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8948

To distinguish between the PMC message port and the S2D (Spill to DRAM)
message port, replace the use of 0 and 1 with an enum.

To avoid printing the S2D or PMC port multiple times in debug print,
add new routine to retrieve the message port information, which can be
used to print the right msg_port getting used.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c |  8 ++++----
 drivers/platform/x86/amd/pmc/pmc.c     | 22 +++++++++++++++++-----
 drivers/platform/x86/amd/pmc/pmc.h     |  7 ++++++-
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 5c03ac92558f..9ee629db9af9 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -155,7 +155,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
 	/* Spill to DRAM num_samples uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
 	if (ret)
@@ -172,7 +172,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
 		return ret;
@@ -267,7 +267,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	}
 
 	/* Spill to DRAM feature uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
@@ -285,7 +285,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 
 	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 7726a05091a5..4fca507e0417 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -449,11 +449,23 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &amd_pmc_idlemask_fops);
 }
 
+static char *amd_pmc_get_msg_port(struct amd_pmc_dev *dev)
+{
+	switch (dev->msg_port) {
+	case MSG_PORT_PMC:
+		return "PMC";
+	case MSG_PORT_S2D:
+		return "S2D";
+	default:
+		return "Invalid message port";
+	}
+}
+
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 {
 	u32 value, message, argument, response;
 
-	if (dev->msg_port) {
+	if (dev->msg_port == MSG_PORT_S2D) {
 		message = AMD_S2D_REGISTER_MESSAGE;
 		argument = AMD_S2D_REGISTER_ARGUMENT;
 		response = AMD_S2D_REGISTER_RESPONSE;
@@ -464,13 +476,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	}
 
 	value = amd_pmc_reg_read(dev, response);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", amd_pmc_get_msg_port(dev), value);
 
 	value = amd_pmc_reg_read(dev, argument);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", amd_pmc_get_msg_port(dev), value);
 
 	value = amd_pmc_reg_read(dev, message);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", amd_pmc_get_msg_port(dev), value);
 }
 
 int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
@@ -480,7 +492,7 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 
 	mutex_lock(&dev->lock);
 
-	if (dev->msg_port) {
+	if (dev->msg_port == MSG_PORT_S2D) {
 		message = AMD_S2D_REGISTER_MESSAGE;
 		argument = AMD_S2D_REGISTER_ARGUMENT;
 		response = AMD_S2D_REGISTER_RESPONSE;
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 188284feca72..f22256db8290 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,11 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+enum s2d_msg_port {
+	MSG_PORT_PMC,
+	MSG_PORT_S2D,
+};
+
 struct amd_mp2_dev {
 	void __iomem *mmio;
 	void __iomem *vslbase;
@@ -30,7 +35,6 @@ struct amd_pmc_dev {
 	void __iomem *smu_virt_addr;
 	void __iomem *stb_virt_addr;
 	void __iomem *fch_virt_addr;
-	bool msg_port;
 	u32 base_addr;
 	u32 cpu_id;
 	u32 active_ips;
@@ -43,6 +47,7 @@ struct amd_pmc_dev {
 	u8 major;
 	u8 minor;
 	u8 rev;
+	u8 msg_port;
 	struct device *dev;
 	struct pci_dev *rdev;
 	struct mutex lock; /* generic mutex lock */
-- 
2.34.1

