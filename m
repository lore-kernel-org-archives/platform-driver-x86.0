Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A018E047
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099117; cv=fail; b=A9tO8dTP/LkQxEiZzdwEq0pqGPeU6J6RhZVDURgsB9KXU4p+2EG9PC+0nOw0Zf8iYAHDZCC2644sWxk/5hHhXLb4Eu+B5U0jtsrF2SibJ/DLO9Mw0ZRDb+cg1krNOyYvmgkAYR3ND55EbnlVBMcZGM+qUnM7PIUPOrZs1JDo3zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099117; c=relaxed/simple;
	bh=G4LcT2tQX5DF0ur2VNPWmfsfU8PsSWOJSxEnnzoN/Ro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXTEGTLU3IsfXQ5V1dCya1e8MS3wuClwhUDMLrd57HHlnduqQ1kcjRnSmnq39AUunF0WfX7/a7slsG4E63VmJD18QRramGPHC6l+GLeLbcF+v7Ph7nk7pJQHqggqT1dSRu2YLteyFTpfLhmB71ho2icp4+pCdFW9wJivwezfqdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zJFcRcjp; arc=fail smtp.client-ip=40.107.220.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zJFcRcjp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+ckVIJP6qO/yiqz1/Te8UTkNpK+z3GhrwcAhmp84ab53FJPCPpeER/POgSiRc/NbTozOUkpfyYayFhDtKq/VFY61BtCF/Q+fTdHKWGM887UEy1Yc5W+jbBy6awuyqxzXkv82GM+uJaFra4yI5C1xOc8QGuE57BfgpZP1QzB8pt6PuAKST532uYRoXB/pPD7pv/a9EcgzAgZQJywVs3N1cmUJrk+x9e8TtJYcXBCHnHGwT+qJLuZiiaUYbof8FppgLAuBkhaeS/KhmWKgtd+S5pG1qysXGFuxE7xsMaZL1u8Gi47gMwxsD7XKxghLG9+0lMfuGpjuIB8c09v/p/fqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDgoRkwlU8VQJMwAOkUbdHafnhGo2SlZg/zP2plwvWs=;
 b=hfcvTxmXKMLKyojrOva1wGMs5HRhJ/AS+3X148n5ZBZ2qpzNAii2VWspQWX0RzmY0pJO9b7uJKozEswiOmiAzRqjxc/2LXrpHwg1Aa0mhyLiHFP4Fi+0rbeW1nawOKuDOi46iXFPEe1FrL+x/NMw7+xRAXBut5rbWOiH4wlhp1u4lp9669lEWAsP7+DGsqigo5SFNBjrH7JilE2BhGqWwg+1WkiHQD1Tcpt76nZC9FirguMhU7ppr/1Da3cJjw3LjQYPcWVTlKARqY+CC0+VyWQ0hpZDVlqBn5nuBSThV6L08p4Ee0ZjuUdvlu5zVQ2n+yU7GY+/D0tIEEuzFaRyDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDgoRkwlU8VQJMwAOkUbdHafnhGo2SlZg/zP2plwvWs=;
 b=zJFcRcjp48gzwKpfgYl8TY4nxvj9MHBrjuW8qBRQwRMTWYcuSLlvxCuKUsLe0qT520hbo7tD2c9CtXXGf8UoaTP504VBr3Rf4KaKf+sv86ykMB+hhofRy564f24sJodAF6VL568R9nAelmyeCxbODXhMPGfsCXUXyJ15e9M/Rmk=
Received: from SJ0PR03CA0125.namprd03.prod.outlook.com (2603:10b6:a03:33c::10)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 28 Oct
 2024 07:05:12 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::b2) by SJ0PR03CA0125.outlook.office365.com
 (2603:10b6:a03:33c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 28 Oct 2024 07:05:11 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/8] platform/x86/amd/pmc: Isolate STB code changes to a new file
Date: Mon, 28 Oct 2024 12:34:34 +0530
Message-ID: <20241028070438.1548737-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: cec908c2-45ee-4acf-b3d5-08dcf71eddb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4ARQEB9Nb7GKYPpFEB9Q6k2gHbaM9quyBg6oYuSz9U+qyINXQ0XYp5U6KE8f?=
 =?us-ascii?Q?hnOlaI+65Fyodij8iifZIOCf2i4nbosKWsU7USp2go4lADYz3Ac99jhZgMak?=
 =?us-ascii?Q?jSmcDAsyFH57CB+nYutCIBx75vnMI5efESQ5Qi00+hBJH/THKqefXAONxQI1?=
 =?us-ascii?Q?8alnZ+xZcwZwmKHEJE7Spn9MHouZ/W30On0F3wBsp8bu2C/NL7rzjuaw66ST?=
 =?us-ascii?Q?US9WpY+KcDYJa2R0G09522uGGAKMR9E5kjgTbLCsJTnpRwTDP2Da/28IOCtm?=
 =?us-ascii?Q?i/mm37fTzokG1/rc6AGhIf8v1YIGk6jlSXU0R2pN149p4tjK002hqbAktbbQ?=
 =?us-ascii?Q?Q+IVwErRKG+dhvWRtMj3BdYlWNY6B8qt11l++uHzfxO0UZx4T5CcgzV73Rxz?=
 =?us-ascii?Q?duUurPlTwatcjJrJ+7q1lYIR54Q+zguRIGm/F25VxUZD70E5iI//Gd/QiWT7?=
 =?us-ascii?Q?PtuCaMt5fqM5qI93JKVXbU8K5mFcntFQlDVENouYbvoZSpXkCi305QFZrxX/?=
 =?us-ascii?Q?A2ScGfPXJXAsHigHkCPyQTWT2gYMMxyTXBP2yakki7wGp6+sS/czOFfJqoD3?=
 =?us-ascii?Q?KwKHMLE4ZhRMAKQB2rrZANXg9R8gWGfp8Cc5jXczppvGqGsbgOiAe7NXHsAY?=
 =?us-ascii?Q?nqEeA5NVrp0TybSMilqx4UMwMY5tCXIaE+ZWEdCoYuTNTEfTimp3Sfyf3EWp?=
 =?us-ascii?Q?ZgoP3axQ4i/eExSyEhgBe7mME9nxVkNL5Bio2OJOronyZmXkBi5wt+9s0PC4?=
 =?us-ascii?Q?x98mkyX0Ex369lU9pYL4MOiyxxtHPu4UQPwfuVpexES7P5s3P7Q7bPx5dz3E?=
 =?us-ascii?Q?WuG1M9AMZoxZc40/lUY2zLMp/PQFo6jN++DBbCMBHAJNkPJ453JUfcuVORli?=
 =?us-ascii?Q?p/pHwYPvIJGXd3ximvlYbPXipE1tZCymO9+7Yz7FX5kNZQrLNGPNyUPm7TQc?=
 =?us-ascii?Q?C9gwgFW+SL1jX0wHATPoXNv9iafek+GZ3VjyeM7i5G7z5w4jJDMjofGQwMKY?=
 =?us-ascii?Q?W7Vnoiy/VgnQXcnz+ajSINxD4f/ZuTwv+XoORhc+k3zmxqa21ARexVxg/+9G?=
 =?us-ascii?Q?aIVEOtMlbThttcXkr86SOKQTY8A7EH0sdxh6GlQL/DSt8yP6J7dN1+56+a6/?=
 =?us-ascii?Q?+lHdpqO3qzTrg7UZNxM1/Ivb8WVeVRkOcOzoenn22XIU7Y0e5k0G7zTzJO0v?=
 =?us-ascii?Q?Olk4vlDVp0Mqru16xyGAcxzgc0H+twaKHRvgk5ym9WzZJet0zfhoO2Gq4mGi?=
 =?us-ascii?Q?LaDeFAl34X44Bm5GguZGvN0HPzpaW/3IdrGCWKf+S63oPYDBxs0jx8DNubPH?=
 =?us-ascii?Q?J36Jc/ot4DcN7PBvsZrNjPcW6zS3DNeVJTubO1WoNEYiQx3ZUX3dutcc5oS/?=
 =?us-ascii?Q?rBfidBLonK9Xl7jqq9pBmrRfa+s5557GYlkJ7tEOefk4HA7W9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:11.9219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cec908c2-45ee-4acf-b3d5-08dcf71eddb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835

Since S2D (Spill to DRAM) uses different message port offsets compared to
PMC message offsets for communication with PMFW, relocate the S2D macros
from pmc.c to a new file, mp1_stb.c, for better code organization.

Following this change, it is logical to introduce a new structure,
"struct stb_arg," to pass the message, argument, and response offset
details to PMFW via the amd_pmc_send_cmd() call. Additionally, move the
s2d_msg_id member from amd_pmc_dev into the new structure.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 33 +++++++++++++++++---------
 drivers/platform/x86/amd/pmc/pmc.c     | 12 +++++-----
 drivers/platform/x86/amd/pmc/pmc.h     | 14 ++++++-----
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 2b06861c479b..1501793b9281 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -31,6 +31,11 @@
 #define STB_FORCE_FLUSH_DATA	0xCF
 #define FIFO_SIZE		4096
 
+/* STB S2D(Spill to DRAM) has different message port offset */
+#define AMD_S2D_REGISTER_MESSAGE	0xA20
+#define AMD_S2D_REGISTER_RESPONSE	0xA80
+#define AMD_S2D_REGISTER_ARGUMENT	0xA88
+
 static bool enable_stb;
 module_param(enable_stb, bool, 0644);
 MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
@@ -176,7 +181,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		return amd_stb_handle_efr(filp);
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->stb_arg.s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = MSG_PORT_PMC;
 	if (ret) {
@@ -239,18 +244,24 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
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
 
 int amd_s2d_init(struct amd_pmc_dev *dev)
@@ -273,18 +284,18 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
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
index 8e7c87505327..f9900a03391a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -450,9 +450,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
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
@@ -477,9 +477,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
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
index 7e7f9170124c..d3c6730ebcd7 100644
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
@@ -70,11 +77,6 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
-/* STB S2D(Spill to DRAM) has different message port offset */
-#define AMD_S2D_REGISTER_MESSAGE	0xA20
-#define AMD_S2D_REGISTER_RESPONSE	0xA80
-#define AMD_S2D_REGISTER_ARGUMENT	0xA88
-
 int amd_s2d_init(struct amd_pmc_dev *dev);
 int amd_write_stb(struct amd_pmc_dev *dev, u32 data);
 int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
-- 
2.34.1

