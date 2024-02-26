Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A8A1BF2F
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708934155; cv=fail; b=ZiHGucuw0RxNgO5aLn5aQjNNmLnepL2QESNsip9WxVSr3pRkl9T2UT3gcJOz/i/SQ2EgbWFTVZFdelcEY/WPldE3csyY0/mJ62+24YLcaYWCFytyDXghOovUnvVhOd/KWN5ia4rq76uNK9WaDg2k8/DuuytPBciwL0922dP7NDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708934155; c=relaxed/simple;
	bh=8Vf4plGQ0nqW443146JDHJdks7LS4d1xgP1eb0XLPbc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SqYi338k5S1adEx3OqJRTTE0VzSxAzY2589ALg6WLa0eiQjSvP97C6GxNADiRdgpof1xcLwa6PEoiZePT9mKy3Hh3DbFDN2gkNvxfEjFNwswwkj4Kv3C2yQrAY3cr6BGskc0v4lWIjc0zTm5GhE47CTWcsg6JmeLgBbXhe+q/lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nnZJK7Yo; arc=fail smtp.client-ip=40.107.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nnZJK7Yo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKh9qzRu4Mjs8vYOa6o4CqknY+U48jfF0YzaxghVz2WiW947d97NF8fYFMbJb1ETNcUv1S7p9bTPiRl58c/j0LGdkDXFzcLx+np29weAMa/AaIOI+VIo2rO9gRsABVjRRwCEDWusS1SI/Cj9BL9pPk8cbXbl8wI4Y0mgWReF7uJv2HhihcpI1ATeN3MTrrVb8sAzEfrcvHi1jw7Wg87oTYTfB4aUhzFeHyqZ/l0DAuapywXSLc1nOWNa6rBjxul2MDpGsb797q54/xHGwylBS4gRGJHKwui6phMJnS/043muOXh8DEbI5VpNTWeONtcSLV+R9iksv2hhc1RjLJ3L7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XKLhuRVPv9AefUQxZJQXOMueHJ4z/c+sRgNHFf64XI=;
 b=mw883KQhZPxY1eaC5h78Hd7FEJCbeuIGY+px1MWLv/qn9m1ayvgqeQzIGPqiXP1YGB2BQ5SYhhREkp79HPnCOkn4AhEcCo9BZNsR//U+RC1VI02/3vsrq2rD7nAStKQn3DiK4r3l9x00KaZU1uE4+h/8iTvnIyJP9dn+niHEYkVV8qvxVfmzyIEHUDtYJ0vOdwoISi+w/th4hAPNs3ID3/VSCS2YDYCIA9FixEcuwU8sjTxOqwIW/WUSGycfTebWhlfT552kXMw9yl2Rrp/qnS4EzMyTwiqQPdPIeoxAeO75oqqimBhjvtISRzPFL5UmI9yKHFCmRZbzgHxfaUnECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XKLhuRVPv9AefUQxZJQXOMueHJ4z/c+sRgNHFf64XI=;
 b=nnZJK7YouMTH2Fw9A0yBhACoZrYQHAluK59GCz5M+VdJ+drkHsaLpfc9QgaBHjp2JT/wh/1AszAvIxWxps8mDGxdxUeGE9xypLTzV6mFuz+0JzmHUrq5evYxeM9UVP/LkLFxajxi3VUiFTd/LOMEJHlX3Aqvvo7d/S45fjdS6XU=
Received: from DM6PR03CA0040.namprd03.prod.outlook.com (2603:10b6:5:100::17)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Mon, 26 Feb
 2024 07:55:51 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::4b) by DM6PR03CA0040.outlook.office365.com
 (2603:10b6:5:100::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 07:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 07:55:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 01:55:47 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Date: Mon, 26 Feb 2024 13:25:33 +0530
Message-ID: <20240226075533.2138661-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3c3b94-5207-4233-6b47-08dc36a05994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mkJD89I+EHzk23QWgCKeCRcTol28YiRP3pxgWRH8kDvkDGyxFpxT7l/R/VmT85X5rHU1jJ8GMjcAcwt7flL7PnlA7SUA0XsrHRhjzYqS8jbEq08600FdZcbqhh6Nmkkm5atRXBlRmX4IqKe5rzjC6SG+z5Tq4OzHyl0c/+d0A4TbjT0vhVBnLfsNsZcMfdDKqauqfLEH593MZ33bpqdpOmtKGhKmaFnMwZCCUtS7q3t0LmqtdCxNYUizaLz8U7G21FlXf9gr0TgZT4wERNNiUm3258sIFiD7MqzwyJOhmbTqSiUpbCjar1aT/nGZjTIdRhIB1w0H/gVWJa53hAUUv0Pb2m6mZpjzal6qK+Nr0tXsuieZXKkJVJ/deIdsu0Zhp5HSUoiH1kxIh4CTNBTLBPs45heTcz427XRJ/ww/7aIg2M+Qf8mMnkVmsCOqoYGoRRqagYSaJy1Pa2Kd/QfbbIc7Mz83T+NEdm5lJ8AiwNtHzYnP5uEovXNpvi+sbZUQlLGj1KG9XNroMFv8prlkjX0DXQA7dSFksM3muXrNUbnplknWKLCepX1ibfeRHMOhZpgGbwjVZkciahFA4npVZIxbDzxb5ozcbi/vB0ZUf+VF+CkwNuDdeBaEh6DyaI/s+Ex/Tnnc/fyQ6ttgZRk7bUuV0PuO0L+Lwki02+A6ZlCi/NZ6FuMJED0BbPsjgjwm1CNzQriPNkYwHBd8mDNSoHS4OjlMkdWwJuAK23Qi2tz+aW5O3e5S9kkvIjk/uryl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 07:55:50.3459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3c3b94-5207-4233-6b47-08dc36a05994
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435

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
 drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
 drivers/platform/x86/amd/pmc/Makefile  |   1 +
 drivers/platform/x86/amd/pmc/mp2_stb.c | 220 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     |   5 +
 drivers/platform/x86/amd/pmc/pmc.h     |  12 ++
 5 files changed, 261 insertions(+)
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
index 000000000000..9999b6e7b601
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
@@ -0,0 +1,220 @@
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
+
+#include "pmc.h"
+
+#define KB(x) ((x) * 1024UL)
+
+#define VALID_MSG 0xA
+#define VALID_RESPONSE 2
+
+#define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
+#define AMD_P2C_MSG(regno) (0x10680 + ((regno) * 4))
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
+	/* Get response with status within a max of 1600 ms timeout */
+	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
+				(cmd_resp.response.response == 0x0 &&
+				 cmd_resp.response.status == command_sts &&
+				 cmd_resp.response.cmd_id == cmd_id), 500, 1600000))
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
+	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG(1));
+	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG(0));
+}
+
+static int amd_mp2_stb_region(int len)
+{
+	struct device *dev = &mp2->pdev->dev;
+
+	if (!mp2->stbdata) {
+		mp2->vslbase = dmam_alloc_coherent(dev, KB(len), &mp2->dma_addr, GFP_KERNEL);
+		if (!mp2->vslbase)
+			return -ENOMEM;
+
+		mp2->stbdata = devm_kzalloc(dev, KB(len), GFP_KERNEL);
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
+	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG(1));
+
+	if (stb_dv.val.valid != VALID_MSG) {
+		dev_err(&mp2->pdev->dev, "Invalid stb data\n");
+		return -EBADMSG;
+	}
+
+	/* Either 2KB or 16KB of stb data length is valid */
+	if (stb_dv.val.length != 1 && stb_dv.val.length != 4) {
+		dev_err(&mp2->pdev->dev, "Unsupported length\n");
+		return -EMSGSIZE;
+	}
+
+	mp2->stb_len = BIT(stb_dv.val.length);
+
+	rc = amd_mp2_stb_region(mp2->stb_len);
+	if (rc) {
+		dev_err(&mp2->pdev->dev, "Failed to init stb region, rc %d\n", rc);
+		return rc;
+	}
+
+	amd_mp2_stb_send_cmd(VALID_MSG, true);
+	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
+	if (status == VALID_RESPONSE) {
+		memcpy_fromio(mp2->stbdata, mp2->vslbase, KB(mp2->stb_len));
+		filp->private_data = mp2->stbdata;
+		mp2->is_stb_data = true;
+	} else {
+		dev_err(&mp2->pdev->dev, "Failed to start stb dump, status %d\n", status);
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
+	return simple_read_from_buffer(buf, size, pos, filp->private_data, KB(mp2->stb_len));
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

