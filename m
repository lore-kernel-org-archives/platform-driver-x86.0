Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8EA12E1F5
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708960411; cv=fail; b=bdRAc3wbeTSIEXUCFPvBuKHtat58dGqZDDeUgUqLurCd+q+nV9fP5VzdbfKOH+qxWetXxZTUazKZwNSMo79dbyDjI29ru9gy0G5GWx0y2UEzSY0sMjEBQ/nGurj8ReqSVonG4UQvrj9GT6dMC+MXGdNpwc7k7LrljqstoHBlIC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708960411; c=relaxed/simple;
	bh=jhr+A1pxa7GmJmBJkKKL7aqnK9fE/rCli6HEBOfLAuw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hsLFhWWwObdW9B0TxAc17c9UiFYX4FyQwykAS/3mGIE1OLgjJWkS9jzzUkZPIkBHh7prW7dMmYwLdd/UHjFtTf2TTovuKokyk3mSRS/pCMI9yRGVIh9tN69hBa/YqP4RQByyj22uPsciZpz1NdpNsLj30gsy76cz+jJtBUYLlTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2KjcDMfK; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2KjcDMfK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TymWQopU5pVjUOpnjS3UU70OshjOpayQASCVWQZ+RymAA/ZBU33oIadGM6NhHughpGqbdJl3gA4ycKgnnqMov5qpVXkI+nB0WeagKVBvFWOnCzNBYzupotOpT5mKUq26RsKjmW58TL3iABAktsG4xN51UcAv9BX9ZJmJUYVuujobZiinXXqaiQhPufmNvypCnl9eWqrpDofcTekAVnSOVajP4Gwvd4evn+YCzEN00l5RyBDqhmFsiGY/Tfaa3qO0m3qj0kusSR6YGzBPCa49yPoUjTyTdozW8d4tRdEmyPh1/wJHaowPa8u8zUlci95CcR8Kt8waioyZP6oemx/LYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUqsPTujMBnoOnvg6pU2K4rLpn2fCF0C7Mln+n2w7E4=;
 b=WCrjpT9lNG+NkiNFt4KfguVpMOne2OqkMMGU3ZSI/qZGrqcpuMKPR+0r79EUHjybtJe9ICMorKCXbgtrn1yW21DOI/4gaFDt6/DVafBPJr7XdrM9vqk9aqocUOjK1kdVTc8bjomTpEYOSl1dzlfCQ1xfSzrFr9E1+A0lzRoZ5HpkJP3ikdDELw//ifjcZwi+tsb25p5ldSouk5NokvaZHgl3+Dxm4N9XVtE0xG0vc3XueXXMxTCmIokIfyxbhg3U1+6hM7pq2A6FGABws693r5rQu4yVbn+AF6obbCykK814AqSmAvfGDLttPUp49y7kpSKuKyeHm+EOEm0/ie6+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUqsPTujMBnoOnvg6pU2K4rLpn2fCF0C7Mln+n2w7E4=;
 b=2KjcDMfKIhNjId1ukIpkjjHuorK68VufUJi6FYGUa9QswZojB/NDtLR757n3OS9zuL98VuTCCB5VYLMXXyAlEhnZRAMsZJGlO50dltdixqnzK8s7nHA9bSsDuNtrYegSYWLxy9cNFYq1DJHYdOGCWPtkA42dkqQvGtelgqRd21Y=
Received: from PH8P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::27)
 by CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 15:13:26 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::dd) by PH8P222CA0017.outlook.office365.com
 (2603:10b6:510:2d7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 15:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 15:13:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 09:13:23 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Date: Mon, 26 Feb 2024 20:43:09 +0530
Message-ID: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|CH0PR12MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e313dd-1f3e-4c7d-df08-08dc36dd7af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t1NhiFJ9JvIwfn3zNmhfTvJv42Qc3RAne6E0q/BGOteF7exCvndBpGz3tD7VzyUc4sfAVx1ffpssn1uiMqS2q+2SYxbugutQaXT3z5TRvZnE+yi4Hh8DxdNt0RkpAV1qmCxe7DGoTOGyxjcXLKgHMeeMNVdszwFFFnTN8ZH1zDDdhbVyNwf/opRIrSf3bY7wjEOj0x+oPpGCypcSp6j45Fj6wEIIA8/tgJnEjdn5OvUnG5o9jcOPPRuJGC06kE30KM+Xy96VpwsDYC8HrPUcuu/GTdHlUKYypJYa19AUmIgFnQw2N9Pqxx4ED30Av3knoD9i6yYLnNG2pDybkCmCmEHeoZ6BO7oPtad0n0sJjcaBghtKOYYBMhRPauvHFcaC4iIvT+/5KibSAvYf2DwUe21wlWeoYXTmvRuCe3ne+xKRgzMrxJqFgtqZSgAfsNq4+c+f4wR8v0HUy3Gg1v3wof8EXpzu27IJ53FeZbT8R8G/1X9UcT9W/eVmW7KYUdC3/7XknkTHth3fJE9aMVgo+d06z9AmRsrDmGOCMLixXeqgBow+ts8JnC7/OMpEK7dekEYq2giPCAbcmvhwIluG+TXqnQ3EuDrsEtFzplCH+l/gz0DBckVTwP87cjDA5s20bAjDC/+i3/c+aDfrcXeaDugfO1bTbLnJl7q/kxErgPwNlgUo7cdGCClmp/j5gBgZ6uLzyS5X9rZOO+b3jUqP65b1diEd2ibmwBVpcTT0ugIap15j7PZSMMr3PztHp/Rg
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 15:13:25.7421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e313dd-1f3e-4c7d-df08-08dc36dd7af0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5372

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
Changes in v2:
	- Used linux/sizes.h instead of defining KB.
	- Defined timeout containing unit as per USEC_PER_MSEC.
	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
	- Changed string stb to STB in log messages.
	- Defined literals using Macro.

 drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
 drivers/platform/x86/amd/pmc/Makefile  |   1 +
 drivers/platform/x86/amd/pmc/mp2_stb.c | 227 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     |   5 +
 drivers/platform/x86/amd/pmc/pmc.h     |  12 ++
 5 files changed, 268 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c

diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
index 883c0a95ac0c..8177486babf9 100644
--- a/drivers/platform/x86/amd/pmc/Kconfig
+++ b/drivers/platform/x86/amd/pmc/Kconfig
@@ -18,3 +18,26 @@ config AMD_PMC
 
 	  If you choose to compile this driver as a module the module will be
 	  called amd-pmc.
+
+config AMD_MP2_STB
+	bool "AMD SoC MP2 STB function"
+	depends on AMD_PMC
+	help
+	  AMD MP2 STB function provides a data buffer used to log debug
+	  information about the system execution during S2Idle suspend/resume.
+	  A data buffer known as the STB (Smart Trace Buffer) is a circular
+	  buffer which is a low-level log for the SoC which is used to debug
+	  any hangs/stalls during S2Idle suspend/resume.
+
+	  The current PMC driver retrieves STB data from MP1, but there can be
+	  scenarios where MP1 might hang or become unresponsive, leading to the
+	  loss of critical data present in the STB buffer. This defeats the
+	  purpose of the STB buffer, which was originally meant to help identify
+	  system failures.
+
+	  Creates stb_read_previous_boot debugfs to get STB, a userspace daemon
+	  can access STB log of last S2Idle suspend/resume which can help to
+	  debug if hangs/stalls during S2Idle suspend/resume
+
+	  Say Y or N here if you have a notebook powered by AMD RYZEN CPU/APU
+	  and supports MP2 STB.
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
index 000000000000..258de76cddce
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
@@ -0,0 +1,227 @@
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
+#include <linux/iopoll.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
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
+#define SLEEP_US (0.5 * USEC_PER_MSEC)
+#define TIMEOUT_US (1600 * USEC_PER_MSEC)
+
+#define LEN_2KB_BIT 1
+#define LEN_16KB_BIT 4
+
+static struct amd_mp2_dev *mp2;
+
+struct mp2_cmd_base {
+	union {
+		u32 ul;
+		struct {
+			u32 cmd_id : 4;
+			u32 intr_disable : 1;
+			u32 dma_addr : 1;
+			u32 rsvd : 26;
+		} cmd;
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
+		} response;
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
+static int amd_mp2_wait_response(u8 cmd_id, u32 command_sts)
+{
+	struct mp2_cmd_response cmd_resp;
+
+	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
+				(cmd_resp.response.response == 0x0 &&
+				 cmd_resp.response.status == command_sts &&
+				 cmd_resp.response.cmd_id == cmd_id), SLEEP_US, TIMEOUT_US))
+		return cmd_resp.response.status;
+
+	return -ETIMEDOUT;
+}
+
+static void amd_mp2_stb_send_cmd(u8 cmd_id, uint8_t da)
+{
+	struct mp2_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.cmd.cmd_id = cmd_id;
+	cmd_base.cmd.intr_disable = 1;
+	cmd_base.cmd.dma_addr = da;
+
+	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
+	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
+}
+
+static int amd_mp2_stb_region(int len)
+{
+	struct device *dev = &mp2->pdev->dev;
+
+	len *= SZ_1K;
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
+static int amd_mp2_process_cmd(struct file *filp)
+{
+	struct mp2_stb_data_valid stb_dv;
+	int status, rc;
+
+	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
+
+	if (stb_dv.val.valid != VALID_MSG) {
+		dev_err(&mp2->pdev->dev, "Invalid STB data\n");
+		return -EBADMSG;
+	}
+
+	if (stb_dv.val.length != LEN_2KB_BIT && stb_dv.val.length != LEN_16KB_BIT) {
+		dev_err(&mp2->pdev->dev, "Unsupported length\n");
+		return -EMSGSIZE;
+	}
+
+	mp2->stb_len = BIT(stb_dv.val.length);
+
+	rc = amd_mp2_stb_region(mp2->stb_len);
+	if (rc) {
+		dev_err(&mp2->pdev->dev, "Failed to init STB region, rc %d\n", rc);
+		return rc;
+	}
+
+	amd_mp2_stb_send_cmd(VALID_MSG, true);
+	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
+	if (status == VALID_RESPONSE) {
+		memcpy_fromio(mp2->stbdata, mp2->vslbase, SZ_1K * mp2->stb_len);
+		filp->private_data = mp2->stbdata;
+		mp2->is_stb_data = true;
+	} else {
+		dev_err(&mp2->pdev->dev, "Failed to start STB dump, status %d\n", status);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
+{
+	if (!mp2->is_stb_data)
+		return amd_mp2_process_cmd(filp);
+
+	filp->private_data = mp2->stbdata;
+
+	return 0;
+}
+
+static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
+					loff_t *pos)
+{
+	if (!filp->private_data)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, size, pos, filp->private_data, SZ_1K * mp2->stb_len);
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
+int amd_mp2_stb_init(struct amd_pmc_dev *dev)
+{
+	struct pci_dev *pdev;
+	int rc;
+
+	pdev = pci_get_device(PCI_VENDOR_ID_AMD, 0x172c, NULL);
+	if (!pdev)
+		return -ENODEV;
+
+	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
+	if (!mp2)
+		return -ENOMEM;
+
+	mp2->pdev = pdev;
+
+	rc = pcim_enable_device(pdev);
+	if (rc) {
+		pci_dev_put(pdev);
+		return rc;
+	}
+
+	rc = pcim_iomap_regions(pdev, BIT(2), "mp2 stb");
+	if (rc) {
+		pci_dev_put(pdev);
+		return rc;
+	}
+
+	/* MP2 MMIO is mapped to BAR2 */
+	mp2->mmio = pcim_iomap_table(pdev)[2];
+	pci_set_master(pdev);
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (rc) {
+		dev_err(&pdev->dev, "failed to set DMA mask\n");
+		pci_dev_put(pdev);
+		return rc;
+	}
+
+	amd_mp2_dbgfs_register(dev);
+	dev->mp2 = mp2;
+
+	return 0;
+}
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 108e12fd580f..8baab1c3cca9 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
+		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
 	return 0;
 
@@ -1122,6 +1124,9 @@ static void amd_pmc_remove(struct platform_device *pdev)
 		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
 	amd_pmc_dbgfs_unregister(dev);
 	pci_dev_put(dev->rdev);
+	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
+		if (dev->mp2 && dev->mp2->pdev)
+			pci_dev_put(dev->mp2->pdev);
 	mutex_destroy(&dev->lock);
 }
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 827eef65e133..be0f6b674133 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,16 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+struct amd_mp2_dev {
+	void __iomem *mmio;
+	void __iomem *vslbase;
+	void *stbdata;
+	struct pci_dev *pdev;
+	dma_addr_t dma_addr;
+	int stb_len;
+	bool is_stb_data;
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -38,10 +48,12 @@ struct amd_pmc_dev {
 	struct dentry *dbgfs_dir;
 	struct quirk_entry *quirks;
 	bool disable_8042_wakeup;
+	struct amd_mp2_dev *mp2;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
+int amd_mp2_stb_init(struct amd_pmc_dev *dev);
 
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RV			0x15D0
-- 
2.25.1

