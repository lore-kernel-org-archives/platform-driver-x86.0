Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E049196D9D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964470; cv=fail; b=Zt/qyBHnInogsJj1uF1O3uIyApf4VkrxhJleS/AHAVgBGd8ozbkO2v/2DvSdWg91ln8IwInN29L0Fok8Y/NpPRtMhGjMlHHNzQhQOfYotGL4BgnkXvgWoI+qZcI/VM26MvkZ7PaDtFc4g1Dqamjvvee1YVf5IWBY5z0ttUD8IAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964470; c=relaxed/simple;
	bh=+SV20//5/2FSCa70rdlb2J0x8rJU1agb1DWSUbjafkk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IU6MN5YX0JG9IXkRSLS8ZQWQx4zf8xkaPvcr3iur9ew2PVemkmVvTr+7M7L/P+skwf9Bhrpyo36BoFfVCDxAukKZ6xqiJSeInEvTaiPb9tqGzYeCsQKNmvSmqfOWK+CaJj/EuvdssDes/BE42pCZbP3GH+JCRmO1tmuXIoVYoaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fdA8bz8n; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fdA8bz8n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3vNTiYj3lCmbIufz7IhaAkdr22tlkLO48B01Xwv+F4y3oG/0CAmynRjvnAe8XLR1exK40nZgx9Egq8bHuuHAOEHTlSOOhOJK7Zo7CvfHE9Exn24XY5WheLdZx7QNNbfKcmjKZmsJLX2v8cuNmPWhI8u76grGnyNNNk+wuc1IipCZE/+sTJZ6jnwWD1OmbyNFbQMOcYJkYqbBQS6KenJojx0vIYjo5bskMjs1j4gKP1470nfMzb2+czJpKXdjaOYDNXyfvmtzRL874oiaXF9XEKh230/WE1a4ARGCMS6xBO/xf30agkJvnzeZXKaDSBT1/G44e9IZQNKeFNTPV9H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Nfs1iPRop5rBgboI5kCaKWCFGYohKwWE73GHr/0E1c=;
 b=ByX5TPhFbWBRkM+WfGticP3d2+69dboiVYrHP7oGWQlO9UTysslgS3N0cC403eAnAadnA0h6fUDA+w2oyKZ5nsFEwcYK58ksxKQtsWowfEOUbYoodXZdgB2QrZGng9EkYTES9KjIbuct1FIBx74qHes5f+MRFQOdQal/dPpJmkovOXBFNjswld/hYuFq1ybBvzAIgHbvAKn51tmhgucje/iqva5yTWdwODUQ372hQUPUtYe6Mf/+PlReV229u9HKepDam3xzwsWto3MhStZr8w/WtieSu1NwOm5SY8lzlMKNfLTyZlF/dSQLEA3RxOf9Glm802fZ7uZb17Q6Qc+Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Nfs1iPRop5rBgboI5kCaKWCFGYohKwWE73GHr/0E1c=;
 b=fdA8bz8nZq7fMiNurimDgG1HBe64kkezlZZDybYsxIWZYDT16zi2uKlatOlLI+Ujtcz+OVmzuP4ZzOyayRxdA7ddQIZxXhiBg99Z15kXW10uahtOZIsOoqLAmMhQYn7If7ajRbEoIlDLzaC3mv9kFGwXrfFdM6u1EyDrNNhAWoM=
Received: from PH0PR07CA0009.namprd07.prod.outlook.com (2603:10b6:510:5::14)
 by SN7PR12MB6932.namprd12.prod.outlook.com (2603:10b6:806:260::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 07:27:44 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::c5) by PH0PR07CA0009.outlook.office365.com
 (2603:10b6:510:5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:43 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:41 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 06/11] platform/x86/amd/pmc: Isolate STB code changes to a new file
Date: Thu, 7 Nov 2024 12:57:09 +0530
Message-ID: <20241107072714.943423-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SN7PR12MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd7fcc3-12a9-468c-8212-08dcfefdab90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C+3Wuf2TaRCUiCFkv27NG4i54nz3rdhHysIem4X2s+iPz54UJqcTeKFWuLjw?=
 =?us-ascii?Q?Z8LFWfzO6YC6/LeZnDyr1DpSWb3/mWW5pjeucquJS44sfGLlIcuouazJrV0q?=
 =?us-ascii?Q?tHhDCCni150EzSNXFi/hXixhcRHS0xLOFBWIvJ1TF6Cll8yTuRkEnzq0XB84?=
 =?us-ascii?Q?kAMPFmAyEXf89Fs6+2TXEfjn517/99SxYzyT7VYm0Tv9pB0tgrZZ6i58ryxQ?=
 =?us-ascii?Q?LsSsMvNCxPAn6+aWhDxoOwDRN0s8+6o+Y4gczL0bkBvRnwh02xk15B5lx4S+?=
 =?us-ascii?Q?ENFDkN4Org23YeMWohOD+UAK0ch3C6vbAiV0jX4WD6vWOrYooJQOxIh3A0+l?=
 =?us-ascii?Q?07v+mFE3a1QnDwIJF4XJzZmk5tn7lwWjAPN+M+ItjWCjo0Hq88H43JpU5DGt?=
 =?us-ascii?Q?wNeIygJXWZfKFcTKplZo5c4GJYbhYM80mFi8M70OUJBVzT0BhH2cSk4hyOXg?=
 =?us-ascii?Q?rPKQQXJ1sCqfb3mkr24I8Koz87X2eoe7kg5feP3uxl6kngzr+1pg7qUmQ1gl?=
 =?us-ascii?Q?Nkm7rK0I0CFlOxGGydPX87ZP2XJTlDV951gtBgnzU2iSgZNtqEmANe/P1Hs2?=
 =?us-ascii?Q?ifV4w98Kxh/wTQlBxiyWF96Tz/42fIvn7sFNXEy/iLDMh6F4a2jWGvL1UJDm?=
 =?us-ascii?Q?roBYlQ60vw2i0iePo2IRSPzZtKTlzOj0RaHmmu2khWzhnQiluoGgn6bvTn1G?=
 =?us-ascii?Q?Zt/6yXH9LqkRnzBOFS+gwK7C+RuIyluSnyHITnoYF3KWOkxNS8/ub54uCIv5?=
 =?us-ascii?Q?BrDvBAVsxQGHr5CLY/nf1QqW0H1nBUV238pMNxV2lxhKWLQ6hhggIrYlWunA?=
 =?us-ascii?Q?l2ebW4g7Dmyp/2CcSQQiUwjT0tNHWWLSW3OnOCLnP77oibihX3uzFPXXzDb2?=
 =?us-ascii?Q?bznpWIQQGHNRNoH9UrpVhI/K4YHLuOr7a7VVwLu6xLtXCywenyhcw93wu+cC?=
 =?us-ascii?Q?nPntSxk2TEd1yphM1Zp1yFNZaVXWIWfEf0Ddc4jF4VHZkBI8MRP9kM3m6FXQ?=
 =?us-ascii?Q?Aa8wpMuiJJXySSqFqFwNswM5rDMfnKgH/HnhbA8yZ74SGxgS4MvofEth/RPA?=
 =?us-ascii?Q?vmBnDsQg1uq5GybcjM2xTL0nM7Ub1XkJYGNa6ioTcURLTQgnKbD56mptsS+2?=
 =?us-ascii?Q?+C8bscoaRbF/VUdPd9G6Q/5mjiHYA/YJ/Fh3WyVtlihKCCwQhSt4NpKNRaF/?=
 =?us-ascii?Q?Seymvc+QcRZzjut7j8++XMUJTn0T+wcZ5czQh/z7K6oo/CmK3Crn6uH6CQ51?=
 =?us-ascii?Q?aCjJr7ZQyNkQkNq2IUkdIOFkSu4lYfQ8opeOA3jyN7fOnOzafgx8xSA/toN5?=
 =?us-ascii?Q?X/hLoi38OXOoacsNNwCCT/Xj3bVn93s2KF3/dwD7/b6svBGo33dVe2ASVRjw?=
 =?us-ascii?Q?nLCrV3nXPPUPfa1ZYbAEPcHlHxWdR0ehwoL21Wht3EAYC+1PIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:43.7541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd7fcc3-12a9-468c-8212-08dcfefdab90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6932

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
index ce0050699a5a..e03b576105a5 100644
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
@@ -459,9 +454,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
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
@@ -486,9 +481,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
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
index 8252d3a52849..69870013c0fc 100644
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
@@ -41,7 +48,6 @@ struct amd_pmc_dev {
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

