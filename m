Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3601D0E2C
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049738; cv=fail; b=Yraf0YVIOWZmXbn97GoPRrFWUoG0ldGMKb07vCKxakRcMXjzUZJiYV17EyIO20zTBDhrT8V70c7c+XC1WftAokB2MiAr9Mq73DqFGv+4RZMhoRmHx6xqLeX/HF8gIiZ67WdEbXrmwDC8e2jYlh2gzm73k4UKYUT9hHEbTWn8x68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049738; c=relaxed/simple;
	bh=3r8GcfWwu3fUA1lt8rCocrLluEqLQeMBG/H2UphS2ic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/v4+VW0rT+HAVQdk0iiMeF4YHNXrQA/Wpxym4PP4AztiWiscjbEUqa/RidRKc607TOGccGOW1IWRIIst0u/p+gnFRAj4Hjq+5htqRrkaWrIrlJr5KcqTNc7m/9pi16yq/KG0ESb+s93zQsaVoWk+3ocw25EojdNC1h2L+/Xpq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j8TD0g26; arc=fail smtp.client-ip=40.107.243.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j8TD0g26"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZLQjHkOuIMfW/a1sJaB9ZmD4aKQ0qQ/G4wVTsWFpGgPNJgv1zALJpagwCObj8yyY0UTqDmkn8p2H93epg51JtUNsQAjTh7lyuJwoYbO3igKZ4t+cTATo0DtUdNWBPwrw2RDSLS4ZBralQ02XgSR5uWsvlIfyJUq6ryvXr0zBNuc6WzZnQo9ngtoQKBE0TnVntqPFOYG/rV633ZgZD7ks3bMToFpu6l1yyGtz2acvUXV+wWR7nrUfc8a1UjdfdOe0tIh7c2os1ULaYARwH3WXvxACiPsY6ygx2BpqxyCX1uCAYwHBBwkvOCTug5Hh/qUbYV4Vh0uhOiz97b8O6+4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skXFnzHh3FqHehyB3eciR27lMER7sMYXIUcxhvBmr4o=;
 b=PcW5MCdntdLhQc75hYWh4B5vew2BghKwWVAY+CT5ear6OH8+kpRxxLF/Ea+iMGikfissvUO3HPO72iS0N4dYQxzrUbDcpVXSYf7W/+T8cnhbyHyhEpcbir7tELdsUaQd7205dtk8jHbDZ+0ZT70U7w8YXl/vjuF637uJipnyI/Q2Q3+ZD5iuLFDWpYFE+ErsbJL6+D9qx97cOB8Rx6fjbdaIfGsvjRixzMQfRWkVTLvX/bYuWUTbnwv4yTwlZqp++uFv4WJJd1OGODig8lk/qfzcN9XffEXMdrJjmpqODKvOMpqqmRIhaleAhN6Mswqd97xBHny7E9xduVozJt5nmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skXFnzHh3FqHehyB3eciR27lMER7sMYXIUcxhvBmr4o=;
 b=j8TD0g26hoi4RFM1p4LWSr+6+rgkih1q+419AfPTqfusoG/iCejQXUjbALXLyLCzyWlHRl6BKkpVY0nk/88ieUibQaNUy5Qxr0KZo2vMCRUMchHidrGOdYb2xcwl48nErHuuwAAEO7hKyPw9VVMUh6QENzn0C28AS3DE7nlwAlA=
Received: from CH2PR05CA0068.namprd05.prod.outlook.com (2603:10b6:610:38::45)
 by DM4PR12MB6301.namprd12.prod.outlook.com (2603:10b6:8:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:08:53 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::b8) by CH2PR05CA0068.outlook.office365.com
 (2603:10b6:610:38::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.10 via Frontend
 Transport; Fri, 8 Nov 2024 07:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:08:53 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:08:50 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 02/10] platform/x86/amd/pmc: Move STB functionality to a new file for better code organization
Date: Fri, 8 Nov 2024 12:38:14 +0530
Message-ID: <20241108070822.3912689-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|DM4PR12MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 74acb249-ef31-4f2f-eb97-08dcffc43459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q+Bhp+Q9Uy8c2RmlNWw55Gk4wLcYZ2nuCFqFNFw4GDhEveQ7OqrFZ1E9ERw+?=
 =?us-ascii?Q?z5c+W0lJhfp50WfFFz7D8m+Zfo5zAdkCmpL6XJkTL0wd3zYSdeoPOLUyCRJY?=
 =?us-ascii?Q?tFjMjfo9XeQgUmATm7cEpFPvnMFFT+cwYGsTNgkayBN8o6btlYdh/T5Q73tW?=
 =?us-ascii?Q?X4IakqsbQMbOFjCN5BL9KdnJoWRwZVObxtglRDP7xF5PxcA3U1H9fAZvuZ1d?=
 =?us-ascii?Q?5nF52LoxTJtusWt9K4pJFlcoo0CfM64lCZXxmDqKDrWJVoPBHW82+ZNp9f1q?=
 =?us-ascii?Q?eVDRJI4GJC+F1B5FlB//cfmykj8ScapbQorN5koqGe/j4EMa5TVNFpc+GSdL?=
 =?us-ascii?Q?n0rieLzHdFBE0I9Y/swHHSx6HeNNJnbHEy8EhM5lJrOOUxA+rijZ7tPmkN/Y?=
 =?us-ascii?Q?1BhJPMQ/u+CCn1Cd6vIX4e9OEACHCDTmegtJxfAVnaonskMi0drL0pxz2l4S?=
 =?us-ascii?Q?jOAGM/xNojo1hJARrkffIo7iQj6F33lCEIryG5FIvHyWiHz+a0eNnOC6QkjY?=
 =?us-ascii?Q?azv7CD3VwwxFcL8rv3XZj8qc+lFD36OO+G/rXPsRgBjAM8qOCyhiFsaFq4bX?=
 =?us-ascii?Q?HK84EChx9mTY715uf/jwvaWIPwpPiuQBQVrOClArj2EXSq2nBO9PvMOf8WIg?=
 =?us-ascii?Q?jsheafPF/Af0jdWApU/DADv8ZRZ6Sz2VNBIfx4dtFiryH+A1T0rhgCvvC5lL?=
 =?us-ascii?Q?iMXEtCCDZbVdFLmZyo+NcmfZ86PRIMtZ9LjN7y7T65EXODDkGzvbGt5Ijf/D?=
 =?us-ascii?Q?NFQ8ylkBA1MxbLHLh5q05k+5+KLj0zlfhk5oPz2QLMYRd9T5FsMIrAGBnZQT?=
 =?us-ascii?Q?8Ef4910C+FTsKqJM/pMDB7MY0TxCzzunHb90MV/dK4FgvH+tppuWxB673sX9?=
 =?us-ascii?Q?hXXtpuxRU2W0z3Li0nrw5XUrFzw7/p5wLFVdqE8O5RTlodKj9WSlDwCEYWUO?=
 =?us-ascii?Q?tTnEwMRmumvbbP3HbyIpO23dHmixZJ3cY+da2hWdpAse8EK6cSJjDMOnFrX7?=
 =?us-ascii?Q?Z0B9Jm1op9KG+rQPB8X5LDwtfms5aZu7o7T6ugrqGQrLckCs0bEIfE9Ir9o2?=
 =?us-ascii?Q?eknZa4tNHA/K0Z5FuUafuR2Kf9Xc8jTVLU62S7ft+IXmFYvUFt9WJJvHV/qi?=
 =?us-ascii?Q?yy2uCAhiJ2g0wOn3X9/Qtpg2HD7kQGSNdJQvo7Bfvyyqn3Vw9uGAHxpke1LT?=
 =?us-ascii?Q?NoRuG3heBdbQ9YoIMQ9Z6gwb+mSSnflsgTY4Ugs5DC9rXndn+PZo6IsJ2+zl?=
 =?us-ascii?Q?jhM5xK5BHmKA9TB4urPp1oyh4tAhy/YnZXu/kzv2ImdFWDQcKNrF/FJV5XsG?=
 =?us-ascii?Q?YHyMpeRgedi3XIulqQagRKw1ZIl+CpV19akauqGoYK0d8+evfQJzZXiBbz1H?=
 =?us-ascii?Q?30DsbQkwxYM/EvGgCrzrDHv+QkgbBH4Mj6XmBjGYGEsaYzZ9FQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:08:53.5811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74acb249-ef31-4f2f-eb97-08dcffc43459
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6301

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
 4 files changed, 303 insertions(+), 283 deletions(-)
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
index 0c089174b0c8..6ebb9123ba00 100644
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
@@ -966,86 +765,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
-static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
-{
-	u32 phys_addr_low, phys_addr_hi;
-	u64 stb_phys_addr;
-	u32 size = 0;
-	int ret;
-
-	if (!enable_stb)
-		return 0;
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
-	if (!phys_addr_hi && !phys_addr_low) {
-		dev_err(dev->dev, "STB is not enabled on the system; disable enable_stb or contact system vendor\n");
-		return -EINVAL;
-	}
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

