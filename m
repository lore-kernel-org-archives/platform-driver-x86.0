Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62B3802
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217327; cv=fail; b=t0SOLG4Jp3lnEeQHDG42nYk3ADe8R5hOAmSg3NoGTSBfO/z/4zuN0YuPqGRB2ltw7ANipTtsjBHyAhY8r8ERax7/vZnPdW4kZTWPP97I/qtHZwY/MRMI3fGxh0flcNV2n82uFq5YEDbS5pRYImlCcOjJr5d/96LFpXZ2shHfEZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217327; c=relaxed/simple;
	bh=VH4xdiiV9HQdtuwCZ0TwdsVRZcAFCCUNRmGQWyiXqH0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XRLJXhdZGXDyTKyLc/CTsCgBsA2ZT+4mArN62GNBDSoEdOqHCdNZUIEnOEP2P8GB9+M2HXXncEs8R35zQElz4NQ2nxqdCb6PENXKfMYm/qWMPvUpa6grl04JC/U51eTZ88/hEZK6NyrmCcfs8/AV6CBjjGW8AzJSBV2jr8bgVYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EEhITiRQ; arc=fail smtp.client-ip=40.107.100.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EEhITiRQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDjvAXaAj0oNjambHZfQMwJjd3zaDtIY3Llr2wMe+QMlDDHbUNSE1FLKxC/9ocOLufmLtBAOW5ViRVhpDDui9qnlSZhSefg8TtgqGQtywE6uHZLJ9sRGfN3e/5yPHq0kJhWHDicQo/lYoQs0RouJKMPrYJ75HkXE2rPMD9oIBSKI0qsRpf7/ebPzqaAznQOxg86nbBM3l/7YIgDPObkY0hIaSk9WE5p7P97jBILiy1X5K4wmUs4yoKYjtmi1MwoMrGws5P2JNGSKJ8dctcwvj7g3hx2luUKglUpTLncD2hI+1308tZ8lalD650anAi04zIidu1SdF2sY3PrbUOnFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9cDw22g+j8TAc4a2qDEm7CgN6AcCwu6e46PXzoizFI=;
 b=M73pohLVWWPUtDbIu/svcfQXtW4pMOw+tVJQzuhfh+O/FhGJy16869qjK+lrix8w7IY60tCtGLB5dHFHBBVbvS06sU0W9O3srRYN8s6jATNlkaxmp8TpHLZo91BSEE12KLkqYVIGsNgVtLTlme9tx/6aNp4eoVo+uhsL7xqjuXo2Uq4Kp3u105jQZw3lB88tqhdGQB9xEjXRHcj88RZI7Gj3YXmla5kvpx9XPau5caUsE3jSLNLTLUGPGHahzyn3iX/GfYdzY2/HZF5Sme9mkY5XEad5KvxAF7rmAWW20+z8Bz8IIEVUfSVV56BDpZ6FPQIvqdNEWpK24scGnBwB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9cDw22g+j8TAc4a2qDEm7CgN6AcCwu6e46PXzoizFI=;
 b=EEhITiRQZsknroWEk2MVWEt9mPl1ZtNphCFCY1e0sX39JmBAQdKWh+WgwIUrRTXE85M5zSTQp1g4Vqgs0MEEkOYWpbL+08O5I3vb/BYYXMwVlozBJfHDNz49V2N8aD2NPATwhBzvleDXkDZWYwRjXMp0YSjZFYAo0vUA+mZmOjM=
Received: from BYAPR08CA0001.namprd08.prod.outlook.com (2603:10b6:a03:100::14)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 15:55:19 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::7e) by BYAPR08CA0001.outlook.office365.com
 (2603:10b6:a03:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:18 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:13 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v2 4/8] platform/x86/amd/pmc: Isolate STB code changes to a new file
Date: Tue, 29 Oct 2024 21:24:36 +0530
Message-ID: <20241029155440.3499273-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: d5668ed6-17b1-410d-f662-08dcf8321620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cmahMn+ofYs9XDYPs8VoTW56qoPjluGpw1dgFamlXpBr5upkiYx1ZaUX509f?=
 =?us-ascii?Q?j9vbX2p+ytuOZM+PHGudGb+j9JiycA84sVXQiGKLdiRfatPVusLwG73uzKD1?=
 =?us-ascii?Q?+3yp8Lj+Np3eUtJVrDd+1HdttNVrA3Aub0B5PZbmr1wLHMsL640zncpxJ/5j?=
 =?us-ascii?Q?SmjAakLKtaxtR/bRog3GqRgXNOpHJJhCAe5fjs4rChfzG5qHLKqMsIzgkbBT?=
 =?us-ascii?Q?KfAlJINdMgH+QddcCjFPwH5xngDyV1bKxVDCVQfHNQNcQ+oF5FTWQX3C+GOG?=
 =?us-ascii?Q?u01bh3h3lbtRzArRd7jraOcrZYY5fgWqC9yuTR0B5JUcCwgGJQmfE+FbkehM?=
 =?us-ascii?Q?QR8ZhQp78bJbXdZSD4/4Ea4KNaHVpnc9XMk7FikoQ+UBwoMZz7Vvd/Jw6fJ8?=
 =?us-ascii?Q?+Ev2Li3C+gYd5CdpYwNEH7CX5yM4nTKuo4HaYzTfuEoUBLdgCJYWhcqB4MHg?=
 =?us-ascii?Q?3tjDYX5kMh1rXHoeijDFtfVkMljAmop5bEF49SvjoJFw+9clYFm+GUspP49K?=
 =?us-ascii?Q?1Wg/jLW1uKQPnVZW2hna+mk9WGKRZFl5m56tHJRWPTQT3PWybdxVOyOKUfxs?=
 =?us-ascii?Q?C6VxUQQ+tySvhNTT+/zt1ocEKe11oZX0r9W9aGUncxsR8WpmZKC1NOLk8ekk?=
 =?us-ascii?Q?Y6iZ1SFiT5yGx56pzCvLJ2KYwnWwPJsuIq2GrOWvzs3K8bwiCmeQzZVKsb+8?=
 =?us-ascii?Q?rtg+147SoaN3ejDzutEl3z5/TR8AJmxR+dxo67N9UShrtKbuQJxu6RaonhpS?=
 =?us-ascii?Q?57xzZvr0k/c4HTp3vQmiomh0fCedkwlOdgsDBUkDyM39qLZNnlLrhxZu4MC0?=
 =?us-ascii?Q?dqiRpX5SOOkyLahZdnXHf4qMyyRV3KX92k5iCJDuRaD7G/BWPZHZzrF8IhYn?=
 =?us-ascii?Q?VOXbXZ2c3z2amZn5IagXvSMInVwcTWOc0ePA3GwvhXR1Z+XEpNNHbN/+fHEQ?=
 =?us-ascii?Q?/5i6drU9gdtQu0+QSznRk+vRyfWmHN/w6i2u2w5KDk25KUnwN7QliVYdk2a9?=
 =?us-ascii?Q?2NnGOK41Ehbay8RpnRGtM3s/CcQiGPDepw9u/NhewcnUMoIJ7X73d15pHp6W?=
 =?us-ascii?Q?/T3K4+Ot5xSc05KLcQZOzCMwgOTlJl2knn/VgoaNe31GqNz26CAzendCEh+R?=
 =?us-ascii?Q?zZfVFjSyMhzCG82WjBTSHapjc5psVv2653q9WoRfWzYAgW/8Du+KnZy/7XBk?=
 =?us-ascii?Q?Ggl1Vb0wsqf7LWireclYW+ULQO3PN+uSdxvVCn+UAI6HjMdUcvH3b13fnqfP?=
 =?us-ascii?Q?VfH6wBT1mqA28Uce+DX64VkORcnODaGC5LpbT5LOF/YhldPU27RtN0ssm3n0?=
 =?us-ascii?Q?4wZznafVuZaMEoZ3ScdSyNGdDnKSHCE/49Gy5/g3KalN8NHLeebalTZp0PYS?=
 =?us-ascii?Q?y1ta5J5yeCjRCv+XsC4IsdFfLp1mHBUHH0GWHvB6pvyZuaeQyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:18.1204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5668ed6-17b1-410d-f662-08dcf8321620
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805

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

