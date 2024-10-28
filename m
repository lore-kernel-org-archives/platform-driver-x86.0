Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1354F18E374
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099114; cv=fail; b=ecoHOUVXt7Eql7AqR1+IlAvMdXp0kuEehkpfehmb9XpUsndRAD0b59UqnVuiJd2tfQqUdRyxkeeJF/25AUJjiA9EEzGVwQEc7IVW/rSPTaLXPkuyhPv2h43lr8A4QBWZiJDLR/5CCUpxn4mpGqEabArB3mqMElMbx4fdBuGJkcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099114; c=relaxed/simple;
	bh=eQZ42rWF6OcBZJOgyvpJn984jj3MYzJAXOAc93uNDH0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJHVLebDcv78osMmNqKvHflMOH8NCZiT1J3fP4d8oj/SRwd83/V7PdKdkXfszsEKxaDuShHrqXjg1Az9XTMVqFTwmuBsLYUYmM+XDB3nxZA4Y16dHYqGf+b8p+T18yvvl24PBHcrl1Szoh8A4Dd7UxldVzQR5fxJOYxZAf/6tHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vjrw7o2l; arc=fail smtp.client-ip=40.107.237.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vjrw7o2l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7FW4rVvCTCYCkA/SnlMidMceWQcQUn1UA0M7ZVzCYVizSmDYlxvKIbu8t++4hd6G61AsU91Jlyx9XmZOsUGKH/0BJYSsVBfAFO02WgRhx+J9rb0c7x3LseCzG884JGgd/QwcVFWv+tNKb920CZ1Anfp8LeaHpaMCqiA1DpQlq2Pv/mQVoHNDJ8omi/tyujf9na956r3CUSjgW4Kj1wTTnHJmQ8LoQXVyZv+0Mc30SuM1DrHgzU5LezBGh+BP3HgA6gq1ZgHZ9KgnovnzXQXWLODO1L81/Y+t/sD6cMNyHUFCbY5SMCDddYt0qTmg0MqmPTKMFaE8sLtymuMX/qW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/gPCmVVY+sBXOAvvkV7T0Qkjna3kW7+ONKlg9CJDaY=;
 b=zPFJUVvgQlUOS4wnsSjVNKHbH8hIOQUrSfXXeboZrbn5jyjUpnm3PWVwnJyOjGOgZKWOqhLiL6suHZpsB9rzoJTrLw4VoLytuM2r8i1/osUCTz4SSxBAl3j0tIP/jOYE0BnVfozkqa2wo0mM+TkVNy/ZspC3EE/mNXhxy1SxGDfAnZo1hYjfPheyWK7iyqLWitYfM57xGqFOKV45jLk3Cm7wyY3WaKKEGfhvLtCBB6zoOHhbjyTQMAjRv1WH6kMCx6peHeCEQNiswmiUvmiBpy//pwnqatF0c3lrr2+4ltpb4R/uf0DoL0fD0V2APRHP2HT8PpXU7ChVEdKpk/LAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/gPCmVVY+sBXOAvvkV7T0Qkjna3kW7+ONKlg9CJDaY=;
 b=vjrw7o2lInwi0y2bt0SuFVgcjTJ4ZUtYc43qJWLaRF4ahdHtyX2eg0LWYaCbcEK7CtUXIvQ8dc0hen7ty9upZ2bxd/s+RhZZU9i5oL+4g0tFCH4YnIHCWfmlGzejbgF3hhDzHE/AWYEJ4f9CXH4eBUA5pW04RW3iiw7/bBbf6pc=
Received: from SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 07:05:05 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3a) by SJ0PR03CA0126.outlook.office365.com
 (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 07:05:05 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/8] platform/x86/amd/pmc: Move STB functionality to a new file for better code organization
Date: Mon, 28 Oct 2024 12:34:31 +0530
Message-ID: <20241028070438.1548737-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 29107d80-2294-45fe-b7c8-08dcf71ed9b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?novUboPVsxuVUEu0m6bBIiRVRCC5FBBvuEJDp+hCzFNZvyWNhRrr5oEHUtfu?=
 =?us-ascii?Q?xNf1NlCXgl4sY5Z1ED4/o+Yes/LBp7mh7uS//4xUdW+b1bX3TTN3Yg2VYX+V?=
 =?us-ascii?Q?TJTfcsZy/ki0ye4kvU6/mcxm3IPDbpunNyCeaKC/R7ZiK9XhC8F4sutrKduw?=
 =?us-ascii?Q?d51ePcpLaWUy/5v/Ivh6QCflhOQnBY8XzYYShbkGqtJY5Af00vGYb7MKm/HW?=
 =?us-ascii?Q?H+HfPRaimUvEGTukZYELgRmLVqzYH1kScF6fRFGCM0QzB8YaNqEvIh/4PrvR?=
 =?us-ascii?Q?5R5MuJIb4qdrM2yTqDNb7sgKfbOsBYUP9f1jGtWOjkIeTImpYMusArREeBGu?=
 =?us-ascii?Q?eRf2h16Lp0hH6fq9tvmkrbUQqtjFRK2JL5CV1WQHcwDQFse8AgPyo0TnE63j?=
 =?us-ascii?Q?pnjSzFfYwHLSM5aUpyXoS61aASX/IRBSkWUYYTsMCi7Igbtpr7LNKMfcizub?=
 =?us-ascii?Q?0Lq7evmpa8IvKF69AImzJs9gJkHMsrKUHg4t7W2qEzjW64gNd0HGVbrWiLW4?=
 =?us-ascii?Q?YycXURBbn9htkdKXBHvKUmOUcNlG0ci9exRXX3cUchtg+8RFWUQ1Hz3Zx8eD?=
 =?us-ascii?Q?2U0zc9CewR6XfWvfdaUQu1FDzUwJ9ny0kUhs/GEinH0uIGb9JlLlMgV5Ywfz?=
 =?us-ascii?Q?xlY+SIqW+fNFqoFesK4/rc+zm8lVWJDlJ1FDZzVcf4jfwbDYIsZ//kKckPuT?=
 =?us-ascii?Q?Jl9N5JlgB59SfYrngNpqba/cYY3iMn5OpluElzjV43f5nUo6dILLw4uhHeC8?=
 =?us-ascii?Q?lyqlgTDrFi+Av2XN6wJNdRNb2mnZoLqdCgSMlS8u+5NetWOhIon3dR0M47+B?=
 =?us-ascii?Q?Yq9qK2PqBedzdcuxMEfbJEquYbi5KC2Krpp+cO0SX1wpGkDJa96LJP1hwPZO?=
 =?us-ascii?Q?rpxv8l78QMasJK5Zgl/cZMpm5r74fV2e6wCSs29gBkvXza6dq77zDz7XVnB/?=
 =?us-ascii?Q?Pb3Mb0FYb462bh8wa0800/E4aMacd75D+O1jIC78MYcE1zXd2YcOyLo2/8L1?=
 =?us-ascii?Q?wk6aZXTE1D9SMzzq8uECnZ1uMrXBKp3vZNpNJyAYS4hEX+A6BHDT4KUbmlWo?=
 =?us-ascii?Q?sQQmsTPwaBQIfWInDAhG4xUiXoXrBfwomrWMzzBHt/PxPjAzP4ffb+wbawjh?=
 =?us-ascii?Q?dUyAv7vh+BT3Qv/5qNBzMjl+AqhyuZ31H31VW/YTNAO7eGPhGwDOq58zUvo7?=
 =?us-ascii?Q?PXFuReIccs/dZIPVAGX29kPEdTQTDu+JMfUpo6KMnb1hYjqcaX71M92NI+mn?=
 =?us-ascii?Q?/3fg7qTlcv7EndZAAApl8Zt95EwEScQkNUJd478rqF3esafSrg5p010/jcny?=
 =?us-ascii?Q?JB1S7NHrhQIIk5qlu+hdZB48XOUH1CgtBCkZv9NY10cpzFTvkwvauIigdC5b?=
 =?us-ascii?Q?BVtXQldSv+CBxSxA8Bylwas4kdwhmYAFikuBV1338y+XTPm0zg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:05.1849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29107d80-2294-45fe-b7c8-08dcf71ed9b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291

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

