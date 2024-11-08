Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF8A1D0E3B
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049744; cv=fail; b=WtkZDYM/t3YR6mxGMTAFuYEWc7Yl/0Z5GLXfZqIQeswiS+U6v56oxD5VnmhVW0ZLDW+UTXNGeTpF6grviozL5+mHfUQfcjS0qWZHVhnwgsdUsJR8w0I+E2Cs6Gs8rrn7jexToYFmcw/wmeKPze0l1EEQvlo/BwqTPyLTlsrb9cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049744; c=relaxed/simple;
	bh=YJcJ2staMQxOu+UN5lm/ulOiwsdkym6FVRlY0RzkSbA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMD/tAjaZQQU3tVjquzioRMmH1bA3kjhvDA58FbyxGcYpQyzF0h7FWoIOR8Cxllx7IHRfMtXiLS5hfVWjD5Mqy8unApidT5FDFwK2D5JaUzHN2hoMzUqtNKmJ4q7o2u7/0cAuIhWER6WFgqMJiTfSwjZ+nn/5cO/z0U+tJo+Pe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mxi7N0wy; arc=fail smtp.client-ip=40.107.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mxi7N0wy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTNP+bM0D3q6eJGAzMjgUpwbv21fxJIlTvfVQHYkREbgWdpvdHbkVe1v86Ol8pYFMmu/3vQUyFNAUkQ+88mCNRMQEaNuxkRK0VL93pnbpI94SBBi4HtErHaOEahtOOEr3uY3M7Mh9vrMcrFLnOyzuFoqd7J0D/OEyYJWjuTaPGffkfm5jSELWCDTcP+jOpwwToyDhxexUWpLsIZ6y1Wn1JZ7ftqAdnuMAbExBkqNA1zGI8f6I4TrmpzVLjG2CQ+Z7cJu0ODr35hrZH2EN7fbEs2C03mIE76PUHQdHpHi5FBgvmfr/IFvgvT66sb/inpDWavVzLUBBLds57TOWHwQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYsJKORFbbvc0vLIux2GHwLTe2cSLFirN1JJwbSqQeU=;
 b=Js45IwmMbC3Sc749ZkmfPqIODm2qty/b5ZMvEXYTLZFCpFSRBAmJ1g3NEn2LiMmvMeXxsNMNjv7V3oQd/TWjP3yLx1VmFdD2Kuq2K2v2K69r/c8de8Rboar/pXm7Kobqnoib6pG6UFizyum8GACnfaumbrOaihow5dS7OKw1C4byimCidhisVvhVEwOxFv1pp0Ho7xs5L4woyeR8MCJOC3bph0yoNEa+3+srFDHRMU2txQzP0QjTzGxBVqVIbwC4eNTsUtHRfseADM/X4IfH+dQdEi99NoljjTYZHYFltvuV0wQM5ZpP2+rq6neVuR4LEsBGe7Qy9bPlPuJlKFj7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYsJKORFbbvc0vLIux2GHwLTe2cSLFirN1JJwbSqQeU=;
 b=Mxi7N0wyUpWcV217RjmO0RXYTSu8LvFb7rcHJq81gkpzUGjetS/ZlXl4NCSX/UTr5AHw0DgeMNdUZWCUs6v9a462XfVyEb8lC+4G9DJHTDNZaSMClR+q2GIECUDNOCUOr0ESo2T97FZ4YIfQgcNxzy4Tpe7DVqv2K/6NUypVHkY=
Received: from CH5PR05CA0016.namprd05.prod.outlook.com (2603:10b6:610:1f0::21)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 07:08:59 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::12) by CH5PR05CA0016.outlook.office365.com
 (2603:10b6:610:1f0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.10 via Frontend
 Transport; Fri, 8 Nov 2024 07:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:08:59 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:08:57 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 05/10] platform/x86/amd/pmc: Isolate STB code changes to a new file
Date: Fri, 8 Nov 2024 12:38:17 +0530
Message-ID: <20241108070822.3912689-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|MN0PR12MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ae0175-a439-49f9-c099-08dcffc437f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9iE0ZrkyK7KzxzCspu4MUTwkI8XXv7wGuMzXaHYy6WHTavT9OTBVH840oKCQ?=
 =?us-ascii?Q?lTvP/ypxAmCNACpUR3tJitEPHRdKZjOJJsXglgCggSNjO8a5UFA28QbgO7DV?=
 =?us-ascii?Q?Wi+sjjCBlQGWj6ErIH97b3eks10ubmTAOiWIAwYwj9LUo/v9a6cFHpIvProf?=
 =?us-ascii?Q?fSkNf9RHTZXx2fiHLmB7KjhCG8YKkOC+L5QG/Cj+f8fxsqaQ4xFih7WmHakT?=
 =?us-ascii?Q?kmB6608kZd07r9GDlilJs/adGHDIhuVOW5IQkyn3G1fLWOoR8FqhrO/nz49j?=
 =?us-ascii?Q?IzXj1MMSBDWce5qyOjbDhAxCcZootcMF7VosrGPdC8ymob4Uvf/bWv1/oc9M?=
 =?us-ascii?Q?Q3Ohq2HZnMtNRkZjZ2zdRnRwEmiOkbviN2luRgyapsuPJguuowV3Vz5NPgd9?=
 =?us-ascii?Q?jctIU2FQhTX19cGMmqD8NNFzrGR7JTlM0foYfXE98NF+1VFPkvD2FY0a82fu?=
 =?us-ascii?Q?U46YGr5KqKFyv5Khtb+J5UU2RxsBi8/aPHACiAuOVf2cdD0I2QAJztXJxRSe?=
 =?us-ascii?Q?O64vLZapJGU7zmK9QF4iutOWQ2qI67GA2dvP6UNb6i3mu+l7qOl7XrMedcxq?=
 =?us-ascii?Q?G/OCOmAl+C36hDBaG6tj272dufIWFMFMm1MqOlT2XhMy2wYC6q/TAYdlv2Iv?=
 =?us-ascii?Q?Yj7c6AjpZglYtsbpNRqPUNKAjZ+na4Xv+TDfCRsj8MJzFcig3gCEX/xeBc5F?=
 =?us-ascii?Q?859nx1imIGFRj/IlCeWGVGLgkEdl8ggx/DtB/Piq/VyqjBgwM4bS4eFhQMfk?=
 =?us-ascii?Q?hdUU63WSAtdSXNReZM7919ZGLX0ClbugXy18NvbooifuhCXOv7dHiLyuSvzg?=
 =?us-ascii?Q?QjVpgxT2hlRC2e57mc6xPo5YwntYaEsjON7VvuleBfkGc4oCeSRG4QlMANxm?=
 =?us-ascii?Q?6c7dZDEPLV6TTQD8NsPoeeamF54T8Z7dsknN2Hh2+pyUC/Wz2YXtVu02pr59?=
 =?us-ascii?Q?bIyzs+7YUQZhhR0MvsZB63dSUboUyqk2vuJ+I9GeRU3AC7Zv0Em/U2zY26PF?=
 =?us-ascii?Q?cwSCW7OOoQ0RE1tiy42Rld5PH8PvAlHorGSVEEVi3OZx9ipAyMtxFCNspFfS?=
 =?us-ascii?Q?/49FbJRBPkpqr+zDvckq4cEY62m/FylidPHXWb/Y0TrHE4CpmWuCwWIJUC4Q?=
 =?us-ascii?Q?RI4v0+GDJ6qAUyNZv3rOOGbcDAQA/0gAL8DiztiKKrLiT66sixZu2GK3u+Td?=
 =?us-ascii?Q?LOaW7pKlDqULHlY22ejCwMji6njEEVf2rLh7aSxyp6MXsubWNmLxXvLPb3nX?=
 =?us-ascii?Q?S8yPywBl6z5HtoISYyyusVCAnzsbJ49HNYVnhuwVCimi/07GCOjr2PRQDhKo?=
 =?us-ascii?Q?f/Zd63z3JZBubitlV57Um+uAUlJ+v6OB6R7yu/DRZ0z7W0eQLzwxucQvwsCm?=
 =?us-ascii?Q?+LLkhIOSHMf2pknUHs16cGPeUM+Fo21W6uxsfMILi2l/SeE57g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:08:59.6028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ae0175-a439-49f9-c099-08dcffc437f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199

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
index 9ee629db9af9..6a54dd3e7f4c 100644
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
@@ -170,7 +175,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		return amd_stb_handle_efr(filp);
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->stb_arg.s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = MSG_PORT_PMC;
 	if (ret) {
@@ -233,18 +238,24 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
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
@@ -269,18 +280,18 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
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
index 4fca507e0417..841145008285 100644
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
@@ -466,9 +461,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	u32 value, message, argument, response;
 
 	if (dev->msg_port == MSG_PORT_S2D) {
-		message = AMD_S2D_REGISTER_MESSAGE;
-		argument = AMD_S2D_REGISTER_ARGUMENT;
-		response = AMD_S2D_REGISTER_RESPONSE;
+		message = dev->stb_arg.msg;
+		argument = dev->stb_arg.arg;
+		response = dev->stb_arg.resp;
 	} else {
 		message = dev->smu_msg;
 		argument = AMD_PMC_REGISTER_ARGUMENT;
@@ -493,9 +488,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 	mutex_lock(&dev->lock);
 
 	if (dev->msg_port == MSG_PORT_S2D) {
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
index f22256db8290..2c640bd8de82 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -30,6 +30,13 @@ struct amd_mp2_dev {
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
@@ -40,7 +47,6 @@ struct amd_pmc_dev {
 	u32 active_ips;
 	u32 dram_size;
 	u32 num_ips;
-	u32 s2d_msg_id;
 	u32 smu_msg;
 /* SMU version information */
 	u8 smu_program;
@@ -55,6 +61,7 @@ struct amd_pmc_dev {
 	struct quirk_entry *quirks;
 	bool disable_8042_wakeup;
 	struct amd_mp2_dev *mp2;
+	struct stb_arg stb_arg;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
-- 
2.34.1

