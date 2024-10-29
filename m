Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09854802
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217323; cv=fail; b=hsLin2DNCxA4dl/UBwmvCxdUcb8pWrYcsKmdK7OyMupyhFY4e0my7EV8Mwlb1xnrroerylxeiuZyEeyUhXBriUuTFJ6/fHdFcFHBqCDOZK8OtKxlOZd0dBAwdowWu8gQNzOTAfW1bVbh0XUR2KT8oJsnsmjb+9LGhDPUwRsHS9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217323; c=relaxed/simple;
	bh=FXxWys5x8lTzO/pQ9HwBEheyS/1hDRR0Rc6bikv59e4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BoB9wK2CMBPbgpisAV/j5dYqoclpPEzofwfCmai2pUDj/tx6CXsahaFrtsmFDJPFZhr1prS0tP0407GMEXyeIV8RVgUVnmiVWigQx8rtLmsOWjMi2L7wcz0gYjVbt4y/nt7VJP4j//h+ssBesy5oxtHdscJSC2UJbIDkly20bYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iAvyNcw3; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iAvyNcw3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZ40QTs3m0GHnsvsQs3HHkwFleDA7l+vdhqfue2+ly+NePHtfYqg+NqLVJLp2kbYTdAQxDmLcqTtal2LBFLqGZZ8hOlPI/XkgcPChbV2NMbA6OefrcELPfYP97FyiGyNhO9PFSezsSslJM/4yxQoPU9BgnGkQxP+asph3YH+lfPv6gN2OTwheC2s4K5dhMwnR5XtpTYW7g0yh2VFG5Bjw6dKimu9hkF2hDUD7P4mgk8Fx9BPEmApiz8AC7AjVqt+cDyD+KoE157p7uTINwMqsoheI9eVeHSFrB+3cwhsxiUHOqoAg1Y+89Jj23N2KwmW1AuJ43sCAdiRwB6FYiestg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HoVtWk96I+dFihLzuCaX6Kk2V+RdxKiCQbGWTB2q4I=;
 b=u03I56XiJjtnkpAJB/8bC5Tqh8MVvb5jriq/bpMzxiStgtSqvocg5Qr4OWGBq84DTZnPp+nTpnlKLTfaj1phCYZ7s1IJ8Zb+lxUr7BsSK+xh86Rd4SUD8p8FKVngrLf3OK2gKArB6dh5wSJENiLnShQp9g0HPqWxxD4PEgtvol3p4d05A9ccQQKwHytQ8IijkPPwVnCB7XmjYloa0W+8vxrF75r2izuJQsIaAIM8nrCyNEvCNtMsaUeMXV3Wo3O/hhDwRFldCeftbQPxCCsdgJbVPuxHR3+iPi/3wbWE0LAsCv0jy1EWrSecnU1CZjqQKY4vcUT34S83DSl1BCIc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HoVtWk96I+dFihLzuCaX6Kk2V+RdxKiCQbGWTB2q4I=;
 b=iAvyNcw39S6SPwlZs5Hw9DN8S1W9QoVbbEnLz3ItkLdUgV9Fr0zSRAU+uYLTJ5j9KwA4MB5VqCwBusexSELZ8HGSMaKCLSb5Y97MPEaewx8UfyttY8pcAAE1NG9cyi+dUz7U/T0OqEGgYUD8XNm/0yaT2wWseGueV4PRWt1r0Yo=
Received: from CY5PR15CA0150.namprd15.prod.outlook.com (2603:10b6:930:67::9)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Tue, 29 Oct
 2024 15:55:14 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:67:cafe::c) by CY5PR15CA0150.outlook.office365.com
 (2603:10b6:930:67::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:13 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:06 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v2 1/8] platform/x86/amd/pmc: Move STB functionality to a new file for better code organization
Date: Tue, 29 Oct 2024 21:24:33 +0530
Message-ID: <20241029155440.3499273-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: cfad00b9-835d-4344-433e-08dcf832137b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?85NZUhpnJexiVgzW/Wjl9SWtDzRPbFAhEPV8F/gg+dtdAR90kw5nHIo/hvEP?=
 =?us-ascii?Q?D8CH1bjbP56k3UQc3UaWLlrRoge4ZgI3BDFf8eMbPZrU394Vqf5+ChUJsyFo?=
 =?us-ascii?Q?7kaykHXUR9J6cZ2mT2B1l+OgDRElWPiC5P/MBvEkfmgilV3ttP3NPrZhQLfV?=
 =?us-ascii?Q?tnmEwxKxzD9ROAV8V7//y4NkM3olm10b+f1j5xnQXetE3hyJOYSgsxvCLJMp?=
 =?us-ascii?Q?Jtzlli5gah7CZDTywW8CaFsNFeL/OxOVxuiQEtom/6ibEscHk00/qYFOJv2J?=
 =?us-ascii?Q?R8qjOo4kjg3iL4H9lxMg1VJfIbSLW3tRJxDJrqza/GwO2GhocK3Ye7tcXolD?=
 =?us-ascii?Q?DpXrPx9ccHN5ZGRirOWQlODIAAFUrmc+J8b2gAWszw6SuNL8T47AtdHKp9ub?=
 =?us-ascii?Q?2Vn+ps/CpgRTmT+KVPv88a/xrAGe5u/Q7osIf6Bxo9Bf/7mxk+swCoH4v1B5?=
 =?us-ascii?Q?sSVpeSPnUlQNpWn+zyNAz9lxcGidZJaLMI5RG2pj+lL/Qqzq64oWXYVClWaP?=
 =?us-ascii?Q?TsSKj17m/ux/XLu+GDXscRqb9Adtr0uo+PXvgiUej18VVATkrxD0zYDdSFth?=
 =?us-ascii?Q?NNlDz5Bj2XEATNVnudcAPZuAUPDOhtXkaqWWeecVj+PClISV7M6bBgqAHJHa?=
 =?us-ascii?Q?KGY0EyVcAii9tI+rDN6ADHe+Nv/11IjvODQ1x4hxCrAS+cq7aRHt9DB7IYEo?=
 =?us-ascii?Q?WQL9TfHxJ1BnTmdylYR/1YoWxuzdZepG5jikiKh1ug9uXkh9kdXgwmVTo45/?=
 =?us-ascii?Q?b1n91AcSvClDAZ6td0MMWkS/LDZSM2KFeyEbCS9XBJP6EwKJWzEO4kv9dH5a?=
 =?us-ascii?Q?YkT9H7x7YZOsew/flglI+69gVCs8kiXJUMg5o3XkKfZR9nGzztByBlA6anvZ?=
 =?us-ascii?Q?IiNh5hMdQ1Qz4s9qYb1R6+ny6/n5LhoYIgsZmi8Ds71u1Op+BLxugqU8bkBL?=
 =?us-ascii?Q?eaHvB6zsJnoUUHp+7Q9xppV53f6zu6bQt5Duj8Os3zRIi7y18CDpDPEmRpto?=
 =?us-ascii?Q?Jac7SE8+MbGwFkdMKUNUxF+ALz90P23NMtUWoOTM1mXkKs+yeJEyCFO/5dSu?=
 =?us-ascii?Q?vtbEQOwrX25rNWa5hU/2173I/K9bAAnQFjYGoY+kZm8tg+qDYxkqtBPtSnE7?=
 =?us-ascii?Q?hYrmBvgjK44Ks47QX72E0uKQDbs0Palr0X7jS4PAgvVlyF1nIbK1JioLocPJ?=
 =?us-ascii?Q?T3WkDsAk8P6ffbTVxc+DvVXVGtUFbA1OZ7dzRceTCNdZb1yIfNXMfOnUnqI6?=
 =?us-ascii?Q?wSKbZUmdroOEavWATjHAB6O89QWUp4fdGQmjc4VgMOgmQXlVTSp0FIxL3p6R?=
 =?us-ascii?Q?GD3MxZ0zzdIlCCiA6XB3sfId44FTkqoo1EY2ZaQLnCuTmj1bNzlF28JDqxJQ?=
 =?us-ascii?Q?k108NbK/VbtITf0sXkJ4RIHLlp46yqeRXphUNCFURIplNgyX7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:13.7260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfad00b9-835d-4344-433e-08dcf832137b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

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

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/Makefile  |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 295 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 289 +-----------------------
 drivers/platform/x86/amd/pmc/pmc.h     |   9 +
 4 files changed, 310 insertions(+), 285 deletions(-)
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
index 000000000000..9a34dd94982c
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -0,0 +1,295 @@
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
+#define S2D_TELEMETRY_BYTES_MAX		0x100000U
+#define S2D_RSVD_RAM_SPACE		0x100000
+#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
+
+/* STB Registers */
+#define AMD_PMC_STB_PMI_0	0x03E30600
+#define AMD_PMC_STB_DUMMY_PC	0xC6000007
+
+/* STB Spill to DRAM Message Definition */
+#define STB_FORCE_FLUSH_DATA	0xCF
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
+static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
+{
+	int i, err;
+
+	for (i = 0; i < FIFO_SIZE; i++) {
+		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
+		if (err) {
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
+				AMD_PMC_STB_PMI_0);
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
+	if (amd_pmc_is_stb_supported(dev))
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops_v2);
+	else
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops);
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
index bbb8edb62e00..a977ff1e52b5 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -44,20 +44,6 @@
 #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
 #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
 #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
-#define AMD_PMC_STB_DUMMY_PC		0xC6000007
-
-/* STB S2D(Spill to DRAM) has different message port offset */
-#define AMD_S2D_REGISTER_MESSAGE	0xA20
-#define AMD_S2D_REGISTER_RESPONSE	0xA80
-#define AMD_S2D_REGISTER_ARGUMENT	0xA88
-
-/* STB Spill to DRAM Parameters */
-#define S2D_TELEMETRY_BYTES_MAX		0x100000U
-#define S2D_RSVD_RAM_SPACE		0x100000
-#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
-
-/* STB Spill to DRAM Message Definition */
-#define STB_FORCE_FLUSH_DATA		0xCF
 
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_MAPPING_SIZE		0x01000
@@ -97,7 +83,6 @@
 
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
-#define FIFO_SIZE		4096
 
 enum amd_pmc_def {
 	MSG_TEST = 0x01,
@@ -105,19 +90,6 @@ enum amd_pmc_def {
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
@@ -149,22 +121,11 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
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
@@ -193,155 +154,6 @@ struct smu_metrics {
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
@@ -350,18 +162,15 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
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
@@ -625,20 +434,6 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
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
@@ -648,15 +443,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &s0ix_stats_fops);
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
-	/* Enable STB only when the module_param is set */
-	if (enable_stb) {
-		if (amd_pmc_is_stb_supported(dev))
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops_v2);
-		else
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops);
-	}
 }
 
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
@@ -683,7 +469,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 }
 
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
+int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
 {
 	int rc;
 	u32 val, message, argument, response;
@@ -975,69 +761,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
-static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
-{
-	u32 phys_addr_low, phys_addr_hi;
-	u64 stb_phys_addr;
-	u32 size = 0;
-	int ret;
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
@@ -1095,12 +818,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
 
-	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
-		err = amd_pmc_s2d_init(dev);
-		if (err)
-			goto err_pci_dev_put;
-	}
-
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
@@ -1111,6 +828,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+	err = amd_pmc_s2d_init(dev);
+	if (err)
+		goto err_pci_dev_put;
+
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index f1166d15c856..07fcb13a4136 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -70,4 +70,13 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
+/* STB S2D(Spill to DRAM) has different message port offset */
+#define AMD_S2D_REGISTER_MESSAGE	0xA20
+#define AMD_S2D_REGISTER_RESPONSE	0xA80
+#define AMD_S2D_REGISTER_ARGUMENT	0xA88
+
+int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
+int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
+int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
+
 #endif /* PMC_H */
-- 
2.34.1

