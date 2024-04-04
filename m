Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5633D96B
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Apr 2024 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712221651; cv=fail; b=Rx3DPm9zo9pbGMZqo2nUx0JYgLptMafqx+CUr4HIK+MAbUTvheMULakz71fUojsmp2ZiGsYSSux0YGiNcGfMA4qvmFF+6vkvAUqBUhuHl3i1lAec3w3FtUe/ZoLBmCJG302RLa9k1ddB34TF31FDI1nNMbRot2mdl7uGd0B7Qqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712221651; c=relaxed/simple;
	bh=F0xDKU0Xc29F/t9o9pXJ1Od20Bl7IcTErogqYX4WW+E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qi7w0skrZLTBDGQSKISpr7xJT8mHZw0EUstfbtKPigBQ8C/omQKI1aQxcwJOFM8LnMXTXYjzMLeAdEgPzaUy8O0SQhIQqrrnVJ6rsJmWqnOaYSoS9ak7Af1pvM277V8JHwrQakfXC3oLjkBzO3l08GgPC02nYBYs0oMx5YfK0Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aAtwtzfB; arc=fail smtp.client-ip=40.107.93.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aAtwtzfB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9Bsm6eHN7NcYZPumsxiRl1cYBhHbCMK0iIB1HzJRJ6/CSdqcJ7MDFupSj5VdeA9OvLExtpJAj7yj/d+5daFX1suY9J+ZulQWRbr3MAvyGuamStcS223PcvRdZ9bAa2aokE4Tlk/tnSomOmGG793vtWwZRAFBNzRnyNKoDBIdqXtBbIhdxxJXzoUZFL9oxLoCC674kjYzEN6p7GS8u0wCLKagaj6OR6P0PFxxY0e2NjqqKQ4T9rOcpR+0vJpiK2rR4JVNVaDnR4ZEqX5xsGCO+twtMpVqcUSxBz/grITUPJHYxhP02k61Y0DqdeBg+Bgd3PIybIADwPTqLniTi7LTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZlqt0wbaZkyebLVOoUKIZ+8yzEofg42s2Qb4gPkb3Y=;
 b=Ol4R0v8zfUpIAj8Zghn0fKJaMKSMdB+ugXfCxq6lMYHP1G3drPZekDQrKhuXL+9Bpp0j7aSs3XQHYPnjgRXHY6rU4VIDo7bPlT7+zJqnw+/84EAsqFmNuJZelkbr4SejX8wJg1YpABoCY224VXS2xuFsFe9JCL8nfJ494nrcChAhI2x8cv6ZjMBZBjGqdHjpB4Wyed/B/bURi7A1D6GmahM0HvInfFfiSOemEQukZT58pkeu1vUYOCtnSxFebkV5BZdo9Fviuul7adrqawid14QZnhsf/euAHJRwjwBUeAqeuVaRf0lQElorLSwzuLUyrXlFE5tDjp/3hLznp3D9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZlqt0wbaZkyebLVOoUKIZ+8yzEofg42s2Qb4gPkb3Y=;
 b=aAtwtzfBFcAwBDK/E+W17M+jKwKpfscNP7WJI4ZW8jL1HjyJOxTCurqLOvppBc3lssL/Mf32OWT+2kervZpELOuyxEJImaCbKeSC4KBaIoFBQE6v9TPSwRIUbW5NKwW00WLz5P1NpoZDQ/Yu/aMw6yPuqyQuFQSc2ngWQgJhpvA=
Received: from SA0PR12CA0021.namprd12.prod.outlook.com (2603:10b6:806:6f::26)
 by SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 09:07:24 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:6f:cafe::81) by SA0PR12CA0021.outlook.office365.com
 (2603:10b6:806:6f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 09:07:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 09:07:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 04:07:20 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Date: Thu, 4 Apr 2024 14:37:02 +0530
Message-ID: <20240404090702.325838-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|SJ2PR12MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: b78bb6c3-389d-43a6-9e46-08dc5486a424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rB9CNwZX4Hy+iyK6IA1eCXqCfkZYKtF/6HbN2HZl+5qYxfP5LEbYQuiuLmfg4AKaMW+2zULYFwD4LoDwdsszwmI3baHfUHc7YE5E/M/SMpcyTjhHmNc4zyI89xy6nwo9C3ZAUaUfMUk0X9Mutt0+jiTawrNu35gtO3A9CViGzBYYlTJWdkai7v/bYKhoiOHSNSXclTx+U+upEJaw7oH9kgNSxTQHQ7xk0fh4yimnAcbJNA7kFEsBPXbSmMEKUg1uXIor8FS13x1rrIPnkPZCl2xaz+JE9QLrEe7QYuMBQ5/OpMNS3QVKnBlIhJlK8Gq9iAabeCIj5xQyuGbVBqUA+VvZWLTg6RSUdsdSK3R5xNICg4ZRKUlZl6qnXTbcq7CZ4FzVXiKlEwYaPuvFHlIv79Y/XRsErkWsuGFyUjuwLQtvkdHxn0vjL2LOInGZBXdO1ZpH1dPYWcan95rQyXKdd9GQ/9GFKXzBd/radDzkdxp8dC9QmGOgrsV2i2Clh151O3XCoK7j1dvB9bTxU3I2xamACm7+3FoEQEAXmXhZrjUaNzG6zWynNpAN4x6ttH5XMPUtiPvmeREA6pyqHaRGMMNg22EZbcSWxwUxqYvZcuq+PLpMn34T7xODj/Y/QTBEKa1/euO8d+46KRqYfEc37FU21jgEoPneGkP48KTKs8AzG3jshtKC+NzrOMEKApkheVRONibd7LQDe5wY0nhF4Kyq9LKHg7TMIhO6F6XTIjwP/YL2aUMs0D3NTNlTs3Kz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 09:07:23.4419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78bb6c3-389d-43a6-9e46-08dc5486a424
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822

AMD MP2 STB function provides a data buffer used to log debug information
about the system execution during S2Idle suspend/resume.

A data buffer known as the STB (Smart Trace Buffer) is a circular buffer
which is a low-level log to assist in debugging by providing insights
into any potential hangs or stalls that may occur during the S2Idle
suspend/resume processes.

The current PMC driver retrieves STB data from MP1, but there can be
scenarios where MP1 might hang or become unresponsive, leading to the
loss of critical data present in the STB buffer. This defeats the purpose
of the STB buffer, which was originally meant to help identify system
failures.

This feature creates stb_read_previous_boot debugfs allows users to
retrieve the STB log from MP2 specifically from the last occurrence of
the S2Idle suspend/resume. A userspace daemon can access STB log of last
S2Idle suspend/resume which can help to troubleshoot potential issues
related to hangs or stalls during the S2Idle suspend/resume sequence.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
Changes in v4:
	- Modified Kconfig to provide clearer messages and configuration
	  options.
	- Referenced amd_pmc instead of global variable.
	- Used macros instead of constant literals.
	- Added pci_clear_master to the cleanup path.  
	- Renamed the 'cmd' and 'response' field names of a structure to
	  'field'.
	- Replaced dev_err with dev_dbg wherever appropriate.
	- Consolidated SZ_1K multiplication to a single location instead
	  of repeating it throughout the code.
	  
Changes in v3:
	- Changed an error path for deinitialization or freeing resources.
	- Modified the macro and variable to have a more specific name.
	- Included header files for USEC_PER_MSEC, writeq, and writel.
	- Switched the data type of the 'len' variable from 'int' to 
	  'unsigned int'.
	- Used one variable for return values.

Changes in v2:
	- Used linux/sizes.h instead of defining KB.
	- Defined timeout containing unit as per USEC_PER_MSEC.
	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
	- Changed string stb to STB in log messages.
	- Defined literals using Macro.

 drivers/platform/x86/amd/pmc/Kconfig   |  15 ++
 drivers/platform/x86/amd/pmc/Makefile  |   1 +
 drivers/platform/x86/amd/pmc/mp2_stb.c | 279 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     |   4 +
 drivers/platform/x86/amd/pmc/pmc.h     |  15 ++
 5 files changed, 314 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c

diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
index 883c0a95ac0c..94f9563d8be7 100644
--- a/drivers/platform/x86/amd/pmc/Kconfig
+++ b/drivers/platform/x86/amd/pmc/Kconfig
@@ -18,3 +18,18 @@ config AMD_PMC
 
 	  If you choose to compile this driver as a module the module will be
 	  called amd-pmc.
+
+config AMD_MP2_STB
+	bool "AMD SoC MP2 STB function"
+	depends on AMD_PMC
+	default AMD_PMC
+	help
+	  AMD MP2 STB function provides a data buffer used to log debug
+	  information about the system execution during S2Idle suspend/resume.
+	  A data buffer known as the STB (Smart Trace Buffer) is a circular
+	  buffer which is a low-level log for the SoC which is used to debug
+	  any hangs/stalls during S2Idle suspend/resume.
+
+	  Creates debugfs to get STB, a userspace daemon can access STB log of
+	  last S2Idle suspend/resume which can help to debug if hangs/stalls
+	  during S2Idle suspend/resume.
diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
index 4aaa29d351c9..f1d9ab19d24c 100644
--- a/drivers/platform/x86/amd/pmc/Makefile
+++ b/drivers/platform/x86/amd/pmc/Makefile
@@ -6,3 +6,4 @@
 
 amd-pmc-objs := pmc.o pmc-quirks.o
 obj-$(CONFIG_AMD_PMC) += amd-pmc.o
+amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
new file mode 100644
index 000000000000..dfa55327e5f1
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD MP2 STB layer
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/time.h>
+
+#include "pmc.h"
+
+#define VALID_MSG 0xA
+#define VALID_RESPONSE 2
+
+#define AMD_C2P_MSG0 0x10500
+#define AMD_C2P_MSG1 0x10504
+#define AMD_P2C_MSG0 0x10680
+#define AMD_P2C_MSG1 0x10684
+
+#define MP2_RESP_SLEEP_US 500
+#define MP2_RESP_TIMEOUT_US (1600 * USEC_PER_MSEC)
+
+#define MP2_STB_DATA_LEN_2KB 1
+#define MP2_STB_DATA_LEN_16KB 4
+
+#define MP2_MMIO_BAR 2
+
+struct mp2_cmd_base {
+	union {
+		u32 ul;
+		struct {
+			u32 cmd_id : 4;
+			u32 intr_disable : 1;
+			u32 is_dma_used : 1;
+			u32 rsvd : 26;
+		} field;
+	};
+};
+
+struct mp2_cmd_response {
+	union {
+		u32 resp;
+		struct {
+			u32 cmd_id : 4;
+			u32 status : 4;
+			u32 response : 4;
+			u32 rsvd2 : 20;
+		} field;
+	};
+};
+
+struct mp2_stb_data_valid {
+	union {
+		u32 data_valid;
+		struct {
+			u32 valid : 16;
+			u32 length : 16;
+		} val;
+	};
+};
+
+static int amd_mp2_wait_response(struct amd_mp2_dev *mp2, u8 cmd_id, u32 command_sts)
+{
+	struct mp2_cmd_response cmd_resp;
+
+	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
+				(cmd_resp.field.response == 0x0 &&
+				 cmd_resp.field.status == command_sts &&
+				 cmd_resp.field.cmd_id == cmd_id), MP2_RESP_SLEEP_US,
+				 MP2_RESP_TIMEOUT_US))
+		return cmd_resp.field.status;
+
+	return -ETIMEDOUT;
+}
+
+static void amd_mp2_stb_send_cmd(struct amd_mp2_dev *mp2, u8 cmd_id, bool is_dma_used)
+{
+	struct mp2_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.field.cmd_id = cmd_id;
+	cmd_base.field.intr_disable = 1;
+	cmd_base.field.is_dma_used = is_dma_used;
+
+	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
+	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
+}
+
+static int amd_mp2_stb_region(struct amd_mp2_dev *mp2)
+{
+	struct device *dev = &mp2->pdev->dev;
+	unsigned int len = mp2->stb_len;
+
+	if (!mp2->stbdata) {
+		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
+		if (!mp2->vslbase)
+			return -ENOMEM;
+
+		mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
+		if (!mp2->stbdata)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int amd_mp2_process_cmd(struct amd_mp2_dev *mp2, struct file *filp)
+{
+	struct device *dev = &mp2->pdev->dev;
+	struct mp2_stb_data_valid stb_dv;
+	int status;
+
+	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
+
+	if (stb_dv.val.valid != VALID_MSG) {
+		dev_dbg(dev, "Invalid STB data\n");
+		return -EBADMSG;
+	}
+
+	if (stb_dv.val.length != MP2_STB_DATA_LEN_2KB &&
+	    stb_dv.val.length != MP2_STB_DATA_LEN_16KB) {
+		dev_dbg(dev, "Unsupported length\n");
+		return -EMSGSIZE;
+	}
+
+	mp2->stb_len = BIT(stb_dv.val.length) * SZ_1K;
+
+	status = amd_mp2_stb_region(mp2);
+	if (status) {
+		dev_err(dev, "Failed to init STB region, status %d\n", status);
+		return status;
+	}
+
+	amd_mp2_stb_send_cmd(mp2, VALID_MSG, true);
+	status = amd_mp2_wait_response(mp2, VALID_MSG, VALID_RESPONSE);
+	if (status == VALID_RESPONSE) {
+		memcpy_fromio(mp2->stbdata, mp2->vslbase, mp2->stb_len);
+		filp->private_data = mp2->stbdata;
+		mp2->is_stb_data = true;
+	} else {
+		dev_err(dev, "Failed to start STB dump, status %d\n", status);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	struct amd_mp2_dev *mp2 = dev->mp2;
+
+	if (mp2) {
+		if (!mp2->is_stb_data)
+			return amd_mp2_process_cmd(mp2, filp);
+
+		filp->private_data = mp2->stbdata;
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
+					loff_t *pos)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	struct amd_mp2_dev *mp2 = dev->mp2;
+
+	if (!mp2)
+		return -ENODEV;
+
+	if (!filp->private_data)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, size, pos, filp->private_data, mp2->stb_len);
+}
+
+static const struct file_operations amd_mp2_stb_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = amd_mp2_stb_debugfs_open,
+	.read = amd_mp2_stb_debugfs_read,
+};
+
+static void amd_mp2_dbgfs_register(struct amd_pmc_dev *dev)
+{
+	if (!dev->dbgfs_dir)
+		return;
+
+	debugfs_create_file("stb_read_previous_boot", 0644, dev->dbgfs_dir, dev,
+			    &amd_mp2_stb_debugfs_fops);
+}
+
+void amd_mp2_stb_deinit(struct amd_pmc_dev *dev)
+{
+	struct amd_mp2_dev *mp2 = dev->mp2;
+	struct pci_dev *pdev;
+
+	if (mp2 && mp2->pdev) {
+		pdev = mp2->pdev;
+
+		if (mp2->mmio)
+			pci_clear_master(pdev);
+
+		pci_dev_put(pdev);
+
+		if (mp2->devres_gid)
+			devres_release_group(&pdev->dev, mp2->devres_gid);
+
+		dev->mp2 = NULL;
+	}
+}
+
+void amd_mp2_stb_init(struct amd_pmc_dev *dev)
+{
+	struct amd_mp2_dev *mp2 = NULL;
+	struct pci_dev *pdev;
+	int rc;
+
+	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
+	if (!mp2)
+		return;
+
+	pdev = pci_get_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_MP2_STB, NULL);
+	if (!pdev)
+		return;
+
+	dev->mp2 = mp2;
+	mp2->pdev = pdev;
+
+	mp2->devres_gid = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!mp2->devres_gid) {
+		dev_err(&pdev->dev, "devres_open_group failed\n");
+		goto mp2_error;
+	}
+
+	rc = pcim_enable_device(pdev);
+	if (rc) {
+		dev_err(&pdev->dev, "pcim_enable_device failed\n");
+		goto mp2_error;
+	}
+
+	rc = pcim_iomap_regions(pdev, BIT(MP2_MMIO_BAR), "mp2 stb");
+	if (rc) {
+		dev_err(&pdev->dev, "pcim_iomap_regions failed\n");
+		goto mp2_error;
+	}
+
+	mp2->mmio = pcim_iomap_table(pdev)[MP2_MMIO_BAR];
+	if (!mp2->mmio) {
+		dev_err(&pdev->dev, "pcim_iomap_table failed\n");
+		goto mp2_error;
+	}
+
+	pci_set_master(pdev);
+
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (rc) {
+		dev_err(&pdev->dev, "failed to set DMA mask\n");
+		goto mp2_error;
+	}
+
+	amd_mp2_dbgfs_register(dev);
+
+	return;
+
+mp2_error:
+	amd_mp2_stb_deinit(dev);
+}
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 108e12fd580f..916a302e5614 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
+		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
 	return 0;
 
@@ -1122,6 +1124,8 @@ static void amd_pmc_remove(struct platform_device *pdev)
 		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
 	amd_pmc_dbgfs_unregister(dev);
 	pci_dev_put(dev->rdev);
+	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
+		amd_mp2_stb_deinit(dev);
 	mutex_destroy(&dev->lock);
 }
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 827eef65e133..9e32d3128c3a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,17 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+struct amd_mp2_dev {
+	void __iomem *mmio;
+	void __iomem *vslbase;
+	void *stbdata;
+	void *devres_gid;
+	struct pci_dev *pdev;
+	dma_addr_t dma_addr;
+	int stb_len;
+	bool is_stb_data;
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -38,10 +49,13 @@ struct amd_pmc_dev {
 	struct dentry *dbgfs_dir;
 	struct quirk_entry *quirks;
 	bool disable_8042_wakeup;
+	struct amd_mp2_dev *mp2;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
+void amd_mp2_stb_init(struct amd_pmc_dev *dev);
+void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RV			0x15D0
@@ -53,5 +67,6 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
 #define AMD_CPU_ID_PS			0x14E8
 #define AMD_CPU_ID_SP			0x14A4
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+#define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
 #endif /* PMC_H */
-- 
2.25.1

