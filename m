Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A706196D9D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964462; cv=fail; b=i6mIZBT/9pgNR1SJPFNZotzgWxwrzKW+STv0DtulA5Bv3Ws/CO3turE/bgXGdgjOPDKPI71WSa10BfTYOr+s4dHAE28X8wgzbSGvbPqX6dQIAeITQP1Et5xzGJ1x+fDLQyDcUZeWVEaDHrj4P310tIklMhKcoGaSG31CWsttV90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964462; c=relaxed/simple;
	bh=TFPxlAjTBYh7DGCXZiN2fsqx1BOS4dmEnKhJL4zMLKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4yOaVuqQMxhr282BDKmG+dqqgKe6uxt1rnP7yiOny7ZX6cYQ4gxgiBf1gpF/CFjXvyq55UiRnTc70wX6mc6UikxdfWeG8BpQ8dNIDQwf0AdlXAoFIxXGCf2uisWtRSthepyjy8JU7ZCpXmBMzs28Y9/UC7b3VHk6SSkG49u8KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fko0oc4g; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fko0oc4g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUDRoN2o+zz88/xfS8BwE5BNUW3Mi4uuojeCPBGe7S2BLXLCd3etMvirrgQ2f+pvETAyirS1/1eNBHbkv4r8CD9fxspyCil9EjlW5oFUAbHKcu5cmwlpBdwujb2pJ25Xuyzy+3/IUytOee+HOdxC3Knuu1jYPIb8lL88I9yo5ckWphtju2AaUkJXroEnVejddxtz4dFxNTy/ZNGHjxZHLcW+cbOTOrn3KanqF4TZKGDu7mE9ezJF26G4IGH5MSdRJXNWMEEkCKs45dBHLCW5+4yIDU3uWgGmWhpKEtVZTXevpGYvaqP6NInKSa32K2wuHXVk0oOeF96PLZFjonPzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbOhr9kKC1AGDIW3MkDsLHXeNzD2TtxWgzvhzQA3whc=;
 b=VU+ru4ZwtJajViJhyEESaf+SEVlCvIqQMXqdHu6SzNEgIhGSHlSv0A/zabrOnpR+inv8BPhkBndFuo8uObsg30fvtFu6vVkMc2B4+ijXtpHZx0mLK1B0vCX5MFpMpov4kj2Ct3OrI79SuB6YPU494Y5pkFUogmBKpX7SQ38YO/NUxiV4CM6HMRwb35Hd9Dy8mNS/kNVYwSVG+DOzN4V6KyxG2prnYerqP65049usa7m6n5xjds1/XI9XrXLq+EiTQeJU3K645m2f+oG64K6tc2ekaS2C8NkuZ/DwqLefls5rc/G/4I1t7CjRkAdCf1yrvmLfzl+y4kxA8Dph7bYdLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbOhr9kKC1AGDIW3MkDsLHXeNzD2TtxWgzvhzQA3whc=;
 b=fko0oc4gPwv5PqjeFeEk7kBJcQqGDuan2pRSQs1wggZscVsDdmjtk2MuJ4+F2WiLGOCOwO87bMoPINomf7JbGsk8g2iHcgC1UqjF9LNAwQ+4k7Eu/D8oJlRfY3fot6cF42LWuslxN86+Bmu63wEVCz46BO7CryZOhWLzxprXEoY=
Received: from SN6PR16CA0040.namprd16.prod.outlook.com (2603:10b6:805:ca::17)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.33; Thu, 7 Nov
 2024 07:27:37 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::3) by SN6PR16CA0040.outlook.office365.com
 (2603:10b6:805:ca::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:37 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 03/11] platform/x86/amd/pmc: Move STB functionality to a new file for better code organization
Date: Thu, 7 Nov 2024 12:57:06 +0530
Message-ID: <20241107072714.943423-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e107815-6939-4efd-bf08-08dcfefda7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fbUx0s5CXXnz17XlGFi7WsHVriiq4sfLw3ZNZ65FA1cS/3ZU2WWOCv7uvdt8?=
 =?us-ascii?Q?sTOBlp+HpVvrRAF0C6KdirnFm/oAfy7RVpFXUYkakPF81ZGbOnDQjhhPkAeZ?=
 =?us-ascii?Q?xMV4rtZFKrmgyqzk0W4uXGsiHBFea36nAHn+WjeQucqx0pdewnRd6Jj6Nr1p?=
 =?us-ascii?Q?VwO3d0Xfm/7RE+cvbYer7rT27Jp7sgewMJZPwYayW9PFn++mKwo0MNh5ICXQ?=
 =?us-ascii?Q?/POzYgDeuN9ytqeFOdiOzrMWowWv3XoO14hV1jXDo9uma8zrTgGTL1r5TzTf?=
 =?us-ascii?Q?jU1UMEPz0K7t4LdugCTqDjBFVoS+ngC1ZQbxRIpnVnXzDfo500KQtnXnRGka?=
 =?us-ascii?Q?PeVxDLZ/OhxvjdZQC8N3LBOSQnyXWc3fdeJB5nUNLNB9tyD/4ynsKyYqkVjg?=
 =?us-ascii?Q?nj1hfU9xVmOTV60Hvf34nQLev93aF8msf7HyG42+pe+fj/kzShf12221TYB9?=
 =?us-ascii?Q?C8TFiM/pHBpat3F+rcD+mzB78BLULIEEvFtJqRiC0KN4wgcdUaMRAKj7hQHx?=
 =?us-ascii?Q?PXd/oZ3R+vQzjW52T+8AbYEfFxq2UCfKJWoyZVm7hq6kgdA/oHY5+EXAIH3Y?=
 =?us-ascii?Q?X8WeBoI7SQR21D16LfLdVbTtZXjVQlQ0XdYdrBEaceWtXa5NZ/Bt7JOt6dUA?=
 =?us-ascii?Q?tp36rVjQrGoi7ADAhrtReJKMln+SMZXtKBBEumSgZ9eM4zhY+gZRtJ31KzdD?=
 =?us-ascii?Q?X8u4biOEDJlT+SPWRlJFBoaGCaXM015vWcynDgozxpTUDL2dflmQBZnTMV85?=
 =?us-ascii?Q?+27G+eQJKzQDPwNfvzbROv0kzLN3UCTuA49WDLfsN0l4P/7AHf2XZ1ghuEze?=
 =?us-ascii?Q?MxHrrt6jnaPxvRYQgVoBNmdTMqiVPemsnMbItqYwWDCnonrPh7ZLY7xVf3sq?=
 =?us-ascii?Q?ECkd3hiJxxDNMfNSCzv2909KGweEzBNnlITeGk0HrMP1YW4GOUz8UNa/lbsg?=
 =?us-ascii?Q?hTwTYgjfHV9sTKEggWfvV/FPKtfgWLHxVS/0g3TNSSGHvGKrstw6dwOKjeeb?=
 =?us-ascii?Q?LzFsyuWYywikDWIn3N4Pcv5YB0UuGcm92YLdHW8hQ8qszlkddhyUeaqK1GX2?=
 =?us-ascii?Q?y3yzA7MeKP/cER0Ld1QJabFiRvD62zr20Lih35SpPfSdFum57zl7iaEyp7VP?=
 =?us-ascii?Q?7Rx2cjEIlNtojNZ5ZWeuZaFibJtSFobeBqh0gOAH97zbkQsFlzMJBbV6zK5q?=
 =?us-ascii?Q?ztBj97Xcgul+KoWnCxdbWdwJ3hL+k7zydVMy5Pd47oLhflrke8LGiEsZ/Jnh?=
 =?us-ascii?Q?fdMcoUhDft8X6MF4lek8+T4UpNyJ/jAtOvFQ1MCAhdbbjwtrn7Y8aimXMGTQ?=
 =?us-ascii?Q?QPlqdrz0M9RRzDZwDqjkkGtykzHwWjUP6xTDSOOEN0acuhn2qONw8rytnQVq?=
 =?us-ascii?Q?EkIFn/5cgoVC+W4NWWnr9b6AgItRiC5pap2sEIvtVpEkdosw+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:37.3438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e107815-6939-4efd-bf08-08dcfefda7c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283

As the SoC evolves with each generation, the dynamics between the PMC and
STB layers within the PMC driver are becoming increasingly complex, making
it challenging to manage both in a single file and maintain code
readability.

Additionally, during silicon bringup, the PMC functionality is often
enabled first, with STB functionality added later. This can lead to missed
updates in the driver, potentially causing issues.

To address these challenges, it's beneficial to move all STB-related
changes to a separate file. This approach will better accommodate newer
SoCs, provide improved flexibility for desktop variants, and facilitate
the collection of additional debug information through STB mechanisms.

Also the additional checks for entering s2d_init have been moved from
the PMC probe to amd_pmc_s2d_init(). This adjustment makes more sense
following the transfer of code to the separate mp1_stb.c file.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/Makefile  |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 296 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 283 +----------------------
 drivers/platform/x86/amd/pmc/pmc.h     |   5 +
 4 files changed, 306 insertions(+), 280 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c

diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
index f1d9ab19d24c..255d94ddf999 100644
--- a/drivers/platform/x86/amd/pmc/Makefile
+++ b/drivers/platform/x86/amd/pmc/Makefile
@@ -4,6 +4,6 @@
 # AMD Power Management Controller Driver
 #
 
-amd-pmc-objs := pmc.o pmc-quirks.o
+amd-pmc-objs := pmc.o pmc-quirks.o mp1_stb.o
 obj-$(CONFIG_AMD_PMC) += amd-pmc.o
 amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
new file mode 100644
index 000000000000..29e0241190e4
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD MP1 Smart Trace Buffer (STB) Layer
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/amd_nb.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+
+#include "pmc.h"
+
+/* STB Spill to DRAM Parameters */
+#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
+#define S2D_TELEMETRY_BYTES_MAX		0x100000U
+#define S2D_RSVD_RAM_SPACE		0x100000
+
+/* STB Registers */
+#define AMD_PMC_STB_PMI_0		0x03E30600
+#define AMD_PMC_STB_DUMMY_PC	0xC6000007
+
+/* STB Spill to DRAM Message Definition */
+#define STB_FORCE_FLUSH_DATA		0xCF
+#define FIFO_SIZE		4096
+
+static bool enable_stb;
+module_param(enable_stb, bool, 0644);
+MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
+
+static bool dump_custom_stb;
+module_param(dump_custom_stb, bool, 0644);
+MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
+
+enum s2d_arg {
+	S2D_TELEMETRY_SIZE = 0x01,
+	S2D_PHYS_ADDR_LOW,
+	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
+	S2D_DRAM_SIZE,
+};
+
+struct amd_pmc_stb_v2_data {
+	size_t size;
+	u8 data[] __counted_by(size);
+};
+
+int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
+{
+	int err;
+
+	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
+	if (err) {
+		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
+		return pcibios_err_to_errno(err);
+	}
+
+	return 0;
+}
+
+int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
+{
+	int i, err;
+
+	for (i = 0; i < FIFO_SIZE; i++) {
+		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
+		if (err) {
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
+			return pcibios_err_to_errno(err);
+		}
+	}
+
+	return 0;
+}
+
+static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 size = FIFO_SIZE * sizeof(u32);
+	u32 *buf;
+	int rc;
+
+	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	rc = amd_pmc_read_stb(dev, buf);
+	if (rc) {
+		kfree(buf);
+		return rc;
+	}
+
+	filp->private_data = buf;
+	return rc;
+}
+
+static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
+					loff_t *pos)
+{
+	if (!filp->private_data)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, size, pos, filp->private_data,
+				       FIFO_SIZE * sizeof(u32));
+}
+
+static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
+{
+	kfree(filp->private_data);
+	return 0;
+}
+
+static const struct file_operations amd_pmc_stb_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = amd_pmc_stb_debugfs_open,
+	.read = amd_pmc_stb_debugfs_read,
+	.release = amd_pmc_stb_debugfs_release,
+};
+
+/* Enhanced STB Firmware Reporting Mechanism */
+static int amd_pmc_stb_handle_efr(struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	struct amd_pmc_stb_v2_data *stb_data_arr;
+	u32 fsize;
+
+	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
+	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
+	if (!stb_data_arr)
+		return -ENOMEM;
+
+	stb_data_arr->size = fsize;
+	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
+	filp->private_data = stb_data_arr;
+
+	return 0;
+}
+
+static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
+	struct amd_pmc_stb_v2_data *stb_data_arr;
+	int ret;
+
+	/* Write dummy postcode while reading the STB buffer */
+	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
+	if (ret)
+		dev_err(dev->dev, "error writing to STB: %d\n", ret);
+
+	/* Spill to DRAM num_samples uses separate SMU message port */
+	dev->msg_port = 1;
+
+	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
+	if (ret)
+		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
+
+	/*
+	 * We have a custom stb size and the PMFW is supposed to give
+	 * the enhanced dram size. Note that we land here only for the
+	 * platforms that support enhanced dram size reporting.
+	 */
+	if (dump_custom_stb)
+		return amd_pmc_stb_handle_efr(filp);
+
+	/* Get the num_samples to calculate the last push location */
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
+	/* Clear msg_port for other SMU operation */
+	dev->msg_port = 0;
+	if (ret) {
+		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
+		return ret;
+	}
+
+	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
+	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
+	if (!stb_data_arr)
+		return -ENOMEM;
+
+	stb_data_arr->size = fsize;
+
+	/*
+	 * Start capturing data from the last push location.
+	 * This is for general cases, where the stb limits
+	 * are meant for standard usage.
+	 */
+	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
+		/* First read oldest data starting 1 behind last write till end of ringbuffer */
+		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
+		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
+
+		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+		/* Second copy the newer samples from offset 0 - last write */
+		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
+	} else {
+		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
+	}
+
+	filp->private_data = stb_data_arr;
+
+	return 0;
+}
+
+static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
+					   loff_t *pos)
+{
+	struct amd_pmc_stb_v2_data *data = filp->private_data;
+
+	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
+}
+
+static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
+{
+	kfree(filp->private_data);
+	return 0;
+}
+
+static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
+	.owner = THIS_MODULE,
+	.open = amd_pmc_stb_debugfs_open_v2,
+	.read = amd_pmc_stb_debugfs_read_v2,
+	.release = amd_pmc_stb_debugfs_release_v2,
+};
+
+static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
+		dev->s2d_msg_id = 0xBE;
+		return true;
+	case AMD_CPU_ID_PS:
+		dev->s2d_msg_id = 0x85;
+		return true;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		dev->s2d_msg_id = 0xDE;
+		return true;
+	default:
+		return false;
+	}
+}
+
+int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
+{
+	u32 phys_addr_low, phys_addr_hi;
+	u64 stb_phys_addr;
+	u32 size = 0;
+	int ret;
+
+	if (!enable_stb)
+		return 0;
+
+	if (amd_pmc_is_stb_supported(dev)) {
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops_v2);
+	} else {
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops);
+		return 0;
+	}
+
+	/* Spill to DRAM feature uses separate SMU message port */
+	dev->msg_port = 1;
+
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
+	if (size != S2D_TELEMETRY_BYTES_MAX)
+		return -EIO;
+
+	/* Get DRAM size */
+	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
+	if (ret || !dev->dram_size)
+		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
+
+	/* Get STB DRAM address */
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
+
+	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+
+	/* Clear msg_port for other SMU operation */
+	dev->msg_port = 0;
+
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
+	if (!dev->stb_virt_addr)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c89560f29607..6ebb9123ba00 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -40,25 +40,15 @@
 #define AMD_PMC_SCRATCH_REG_1AH		0xF14
 
 /* STB Registers */
-#define AMD_PMC_STB_PMI_0		0x03E30600
 #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
 #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
 #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
-#define AMD_PMC_STB_DUMMY_PC		0xC6000007
 
 /* STB S2D(Spill to DRAM) has different message port offset */
 #define AMD_S2D_REGISTER_MESSAGE	0xA20
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
-/* STB Spill to DRAM Parameters */
-#define S2D_TELEMETRY_BYTES_MAX		0x100000U
-#define S2D_RSVD_RAM_SPACE		0x100000
-#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
-
-/* STB Spill to DRAM Message Definition */
-#define STB_FORCE_FLUSH_DATA		0xCF
-
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_MAPPING_SIZE		0x01000
 #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
@@ -97,7 +87,6 @@
 
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
-#define FIFO_SIZE		4096
 
 enum amd_pmc_def {
 	MSG_TEST = 0x01,
@@ -105,19 +94,6 @@ enum amd_pmc_def {
 	MSG_OS_HINT_RN,
 };
 
-enum s2d_arg {
-	S2D_TELEMETRY_SIZE = 0x01,
-	S2D_PHYS_ADDR_LOW,
-	S2D_PHYS_ADDR_HIGH,
-	S2D_NUM_SAMPLES,
-	S2D_DRAM_SIZE,
-};
-
-struct amd_pmc_stb_v2_data {
-	size_t size;
-	u8 data[] __counted_by(size);
-};
-
 struct amd_pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -149,22 +125,11 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{}
 };
 
-static bool enable_stb;
-module_param(enable_stb, bool, 0644);
-MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
-
 static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 
-static bool dump_custom_stb;
-module_param(dump_custom_stb, bool, 0644);
-MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
-
 static struct amd_pmc_dev pmc;
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
-static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
-static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -193,155 +158,6 @@ struct smu_metrics {
 	u64 timecondition_notmet_totaltime[32];
 } __packed;
 
-static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
-{
-	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 size = FIFO_SIZE * sizeof(u32);
-	u32 *buf;
-	int rc;
-
-	buf = kzalloc(size, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	rc = amd_pmc_read_stb(dev, buf);
-	if (rc) {
-		kfree(buf);
-		return rc;
-	}
-
-	filp->private_data = buf;
-	return rc;
-}
-
-static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
-					loff_t *pos)
-{
-	if (!filp->private_data)
-		return -EINVAL;
-
-	return simple_read_from_buffer(buf, size, pos, filp->private_data,
-				       FIFO_SIZE * sizeof(u32));
-}
-
-static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
-{
-	kfree(filp->private_data);
-	return 0;
-}
-
-static const struct file_operations amd_pmc_stb_debugfs_fops = {
-	.owner = THIS_MODULE,
-	.open = amd_pmc_stb_debugfs_open,
-	.read = amd_pmc_stb_debugfs_read,
-	.release = amd_pmc_stb_debugfs_release,
-};
-
-/* Enhanced STB Firmware Reporting Mechanism */
-static int amd_pmc_stb_handle_efr(struct file *filp)
-{
-	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	struct amd_pmc_stb_v2_data *stb_data_arr;
-	u32 fsize;
-
-	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
-	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
-	if (!stb_data_arr)
-		return -ENOMEM;
-
-	stb_data_arr->size = fsize;
-	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
-	filp->private_data = stb_data_arr;
-
-	return 0;
-}
-
-static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
-{
-	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
-	struct amd_pmc_stb_v2_data *stb_data_arr;
-	int ret;
-
-	/* Write dummy postcode while reading the STB buffer */
-	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
-	if (ret)
-		dev_err(dev->dev, "error writing to STB: %d\n", ret);
-
-	/* Spill to DRAM num_samples uses separate SMU message port */
-	dev->msg_port = 1;
-
-	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
-	if (ret)
-		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
-
-	/*
-	 * We have a custom stb size and the PMFW is supposed to give
-	 * the enhanced dram size. Note that we land here only for the
-	 * platforms that support enhanced dram size reporting.
-	 */
-	if (dump_custom_stb)
-		return amd_pmc_stb_handle_efr(filp);
-
-	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
-	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
-	if (ret) {
-		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
-		return ret;
-	}
-
-	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
-	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
-	if (!stb_data_arr)
-		return -ENOMEM;
-
-	stb_data_arr->size = fsize;
-
-	/*
-	 * Start capturing data from the last push location.
-	 * This is for general cases, where the stb limits
-	 * are meant for standard usage.
-	 */
-	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
-		/* First read oldest data starting 1 behind last write till end of ringbuffer */
-		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
-		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
-
-		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
-		/* Second copy the newer samples from offset 0 - last write */
-		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
-	} else {
-		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
-	}
-
-	filp->private_data = stb_data_arr;
-
-	return 0;
-}
-
-static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
-					   loff_t *pos)
-{
-	struct amd_pmc_stb_v2_data *data = filp->private_data;
-
-	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
-}
-
-static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
-{
-	kfree(filp->private_data);
-	return 0;
-}
-
-static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
-	.owner = THIS_MODULE,
-	.open = amd_pmc_stb_debugfs_open_v2,
-	.read = amd_pmc_stb_debugfs_read_v2,
-	.release = amd_pmc_stb_debugfs_release_v2,
-};
-
 static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
@@ -350,18 +166,15 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
 		dev->num_ips = 12;
-		dev->s2d_msg_id = 0xBE;
 		dev->smu_msg = 0x538;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->num_ips = 21;
-		dev->s2d_msg_id = 0x85;
 		dev->smu_msg = 0x538;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		dev->num_ips = 22;
-		dev->s2d_msg_id = 0xDE;
 		dev->smu_msg = 0x938;
 		break;
 	}
@@ -625,20 +438,6 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 	debugfs_remove_recursive(dev->dbgfs_dir);
 }
 
-static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
-{
-	switch (dev->cpu_id) {
-	case AMD_CPU_ID_YC:
-	case AMD_CPU_ID_CB:
-	case AMD_CPU_ID_PS:
-	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
-	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 {
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
@@ -674,7 +473,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 }
 
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
+int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
 {
 	int rc;
 	u32 val, message, argument, response;
@@ -966,78 +765,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
-static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
-{
-	u32 phys_addr_low, phys_addr_hi;
-	u64 stb_phys_addr;
-	u32 size = 0;
-	int ret;
-
-	if (amd_pmc_is_stb_supported(dev)) {
-		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops_v2);
-	} else {
-		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops);
-		return 0;
-	}
-
-	/* Spill to DRAM feature uses separate SMU message port */
-	dev->msg_port = 1;
-
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
-	if (size != S2D_TELEMETRY_BYTES_MAX)
-		return -EIO;
-
-	/* Get DRAM size */
-	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
-	if (ret || !dev->dram_size)
-		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
-
-	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
-
-	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
-
-	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
-
-	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
-	if (!dev->stb_virt_addr)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
-{
-	int err;
-
-	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
-	if (err) {
-		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
-		return pcibios_err_to_errno(err);
-	}
-
-	return 0;
-}
-
-static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
-{
-	int i, err;
-
-	for (i = 0; i < FIFO_SIZE; i++) {
-		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
-		if (err) {
-			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
-			return pcibios_err_to_errno(err);
-		}
-	}
-
-	return 0;
-}
-
 static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
@@ -1105,11 +832,9 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
-	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
-		err = amd_pmc_s2d_init(dev);
-		if (err)
-			goto err_pci_dev_put;
-	}
+	err = amd_pmc_s2d_init(dev);
+	if (err)
+		goto err_pci_dev_put;
 
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_init(dev);
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index f1166d15c856..8f939ab32510 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -70,4 +70,9 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
+int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
+int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
+int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
+int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
+
 #endif /* PMC_H */
-- 
2.34.1

