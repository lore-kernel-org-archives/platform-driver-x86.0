Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79638C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233914AbiHBL1g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbiHBL1f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:27:35 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEEA29CA4
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQivabAhHnBJRCvz9BoIUmNNlomoFVAQ0hwmahl2RFC46EKVKRmG5RIYl5N+mKhFV+z5+SNSx5GGmeySQQMH30DeKHjM/Shh6Q8rhfr6gEMpoaNu1nSy51PDYJe9o+v5NTYD8P9Usy+AyhdWTViUWfIEdMKHP1C8bcvGq84s0Je3ow8ra98NicbtbDZ0CLjqR7eWjTMrVSobtlsRYVPe9koXiuwXMOmcOW5WfAkpOTX3ZZHqHjbgKOeswS1KZCVKDlaijrtwpwsJmu1bZLJ8AgIT9LAtcKDtJIR5MPgUXwTozKI5u02VBZDjznPKaPcI8J/2izsBId/sOOH6AR5b/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gW/L+FNdJI6KIY6poPeUBcKuDxWAuv2jDnBAPezxrTo=;
 b=W/ED6xzPE1bbM7xdHO5+aw4ZteSDLMX3HPBtMOm5BPjO+YzgSM2We/h09/VPDJZgiqR4k3xv5WxNm4b3Zkk2trFwDy0MvjL78ez/aDm/8i0asXJdFWNWGDJEbouLbQinbk9fmK8DVndlfdO2NHwAYBVXIRAt59hIukOkB+imwabkD6tbPyUTHy21Jjb5c7noqx3CXlPZSyJ7JksQEgTEGkj0DzxRfWo+2Y5bYtl2Tdl7Mcg3YzljOhNCNQD0eSH6JYbG+emdJJuHqeX2vleP5678gqSnMprWi56kByFbH5dm2NECA84KHO35lmRGFIjOsLZtIiKcyq8X/H8aUbdmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gW/L+FNdJI6KIY6poPeUBcKuDxWAuv2jDnBAPezxrTo=;
 b=3tS83sYiNafnXeKxgnJ3Ooe026EQFv3mzoq/A1FQdwI6HH/YAHbDvcl7WFa7Kfj4hEtGlOWtU3KGZv/nIA0JskmbpwSWxHcbgAmK9bwWt6yytzm6+yKjGAABgZRJW8nAWPPkbqdrDJARRLaFG30pB3H3prIFEOpUWJL5nHPKAOs=
Received: from MW4PR04CA0184.namprd04.prod.outlook.com (2603:10b6:303:86::9)
 by BYAPR12MB3286.namprd12.prod.outlook.com (2603:10b6:a03:139::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Tue, 2 Aug
 2022 11:27:31 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::61) by MW4PR04CA0184.outlook.office365.com
 (2603:10b6:303:86::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:17 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 01/11] platform/x86/amd/pmf: Add support for PMF core layer
Date:   Tue, 2 Aug 2022 16:55:35 +0530
Message-ID: <20220802112545.2118632-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b122b1a-6dda-4965-39a9-08da7479fd11
X-MS-TrafficTypeDiagnostic: BYAPR12MB3286:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uS0c3IvWOYnKvhzFDCx7aitIUnVGBhTJk0dvPpk5QNYBf+25mvw9NcWrpNnFluyzJh9TXmy8XN3ANv/4aKbiRyUgDUIrrsmHOFynYD0nPKjuaEBi/1PMclzH35fKI4XGQNP+WBh3Qg4WLHSHQ6QRlC5EM1ddOmeJtnxZDnnYlNsmdanHdBqwwxrrDDTBZ0+KLGqAby9pLXmg6DGDj/ieK/5XJvC/k8mQJ8G5Dzitsvsh5zyPqk/O9fvIIA8DAoGEeurB+bgu9ixegG2oz9sFYw3WhBFc3fQScl6wb36+RX3lHdjBFQhd9kc/O3wVXejjgGssw55fb6tQaS7UTLVXtapd+rTsjY1yLTlPfdajauIG1lCzq3IjozqfOHjgs/LWlFp78mqj7kUvU/Syfiwxn+HDsj4vjTchL05lyokm6gjsn//g1VH7jBgF5unjhGvpJ84DC+/EvTnE5pl35TdOzhJepvqJrFZyhBF0lidE0Jbgd7r44tq2rtWNo6b/vVoXMY1WkPHpa+X//hIGb+i1ASJWlDTg/6gQkLZ1CA5ddldZrt4931qrBEm9R/NvbkNnw3irpRkLPCyhNqEJjz9pe/OQCe+5mfjGGzUFDsg1ZoFiN12ODuhdYYnv9ygZxf7Wvx/C6mxZVjI9HqrOAB8c+GhTjiOwO22jglk6CLcZrKLx2x3Z3iuri5SqhU3KqugLzmgAc9KGUrQ1Q9htNpEE2PnuepLpchNzma936OaHDVJzt8qfLr5OCQflXotJPCch1tNLCCHRNaanO+t003gpHMyhyNDgDu5la7Enk0D/HZLgJHp1t7ujt2oelKbrBUTn+H+BBTKfs9LImqsXWX70UA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966006)(40470700004)(36840700001)(40480700001)(47076005)(2906002)(8676002)(30864003)(81166007)(356005)(5660300002)(86362001)(36860700001)(70206006)(4326008)(82310400005)(70586007)(82740400003)(316002)(26005)(478600001)(8936002)(40460700003)(41300700001)(7696005)(36756003)(6666004)(186003)(110136005)(1076003)(54906003)(336012)(2616005)(83380400001)(16526019)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:30.4632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b122b1a-6dda-4965-39a9-08da7479fd11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3286
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF core layer is meant to abstract the common functionalities
across PMF features. This layer also does the plumbing work
like setting up the mailbox channel for the communication
between the PMF driver and the PMFW (Power Management Firmware)
running on the SMU.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/Kconfig      |   2 +
 drivers/platform/x86/amd/Makefile     |   1 +
 drivers/platform/x86/amd/pmf/Kconfig  |  16 ++
 drivers/platform/x86/amd/pmf/Makefile |   8 +
 drivers/platform/x86/amd/pmf/core.c   | 235 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    |  46 +++++
 6 files changed, 308 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 drivers/platform/x86/amd/pmf/core.c
 create mode 100644 drivers/platform/x86/amd/pmf/pmf.h

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c0d0a3c5170c..a825af8126c8 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -3,6 +3,8 @@
 # AMD x86 Platform Specific Drivers
 #
 
+source "drivers/platform/x86/amd/pmf/Kconfig"
+
 config AMD_PMC
 	tristate "AMD SoC PMC driver"
 	depends on ACPI && PCI && RTC_CLASS
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index a03fbb08e808..2c229198e24c 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -8,3 +8,4 @@ amd-pmc-y			:= pmc.o
 obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
 amd_hsmp-y			:= hsmp.o
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+obj-$(CONFIG_AMD_PMF)		+= pmf/
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
new file mode 100644
index 000000000000..2a5f72419515
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD PMF Driver
+#
+
+config AMD_PMF
+	tristate "AMD Platform Management Framework"
+	depends on ACPI
+	help
+	  This driver provides support for the AMD Platform Management Framework.
+	  The goal is to enhance end user experience by making AMD PCs smarter,
+	  quiter, power efficient by adapting to user behavior and environment.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called amd_pmf.
+
diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
new file mode 100644
index 000000000000..459005f659e5
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/amd/pmf
+# AMD Platform Management Framework
+#
+
+obj-$(CONFIG_AMD_PMF) += amd-pmf.o
+amd-pmf-objs := core.o
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
new file mode 100644
index 000000000000..aef97965c181
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include "pmf.h"
+
+/* PMF-SMU communication registers */
+#define AMD_PMF_REGISTER_MESSAGE	0xA18
+#define AMD_PMF_REGISTER_RESPONSE	0xA78
+#define AMD_PMF_REGISTER_ARGUMENT	0xA58
+
+/* Base address of SMU for mapping physical address to virtual address */
+#define AMD_PMF_SMU_INDEX_ADDRESS	0xB8
+#define AMD_PMF_SMU_INDEX_DATA		0xBC
+#define AMD_PMF_MAPPING_SIZE		0x01000
+#define AMD_PMF_BASE_ADDR_OFFSET	0x10000
+#define AMD_PMF_BASE_ADDR_LO		0x13B102E8
+#define AMD_PMF_BASE_ADDR_HI		0x13B102EC
+#define AMD_PMF_BASE_ADDR_LO_MASK	GENMASK(15, 0)
+#define AMD_PMF_BASE_ADDR_HI_MASK	GENMASK(31, 20)
+
+/* SMU Response Codes */
+#define AMD_PMF_RESULT_OK                    0x01
+#define AMD_PMF_RESULT_CMD_REJECT_BUSY       0xFC
+#define AMD_PMF_RESULT_CMD_REJECT_PREREQ     0xFD
+#define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
+#define AMD_PMF_RESULT_FAILED                0xFF
+
+/* List of supported CPU ids */
+#define AMD_CPU_ID_PS			0x14e8
+
+#define PMF_MSG_DELAY_MIN_US		50
+#define RESPONSE_REGISTER_LOOP_MAX	20000
+
+#define DELAY_MIN_US	2000
+#define DELAY_MAX_US	3000
+
+static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
+{
+	return ioread32(dev->regbase + reg_offset);
+}
+
+static inline void amd_pmf_reg_write(struct amd_pmf_dev *dev, int reg_offset, u32 val)
+{
+	iowrite32(val, dev->regbase + reg_offset);
+}
+
+static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
+{
+	u32 value;
+
+	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_RESPONSE);
+	dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
+
+	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
+	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
+
+	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_MESSAGE);
+	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
+}
+
+int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data)
+{
+	int rc;
+	u32 val;
+
+	mutex_lock(&dev->lock);
+
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
+				val, val != 0, PMF_MSG_DELAY_MIN_US,
+				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "failed to talk to SMU\n");
+		goto out_unlock;
+	}
+
+	/* Write zero to response register */
+	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_RESPONSE, 0);
+
+	/* Write argument into argument register */
+	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_ARGUMENT, arg);
+
+	/* Write message ID to message ID register */
+	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_MESSAGE, message);
+
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
+				val, val != 0, PMF_MSG_DELAY_MIN_US,
+				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "SMU response timed out\n");
+		goto out_unlock;
+	}
+
+	switch (val) {
+	case AMD_PMF_RESULT_OK:
+		if (get) {
+			/* PMFW may take longer time to return back the data */
+			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
+			*data = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
+		}
+		break;
+	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
+		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
+		rc = -EBUSY;
+		goto out_unlock;
+	case AMD_PMF_RESULT_CMD_UNKNOWN:
+		dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
+		rc = -EINVAL;
+		goto out_unlock;
+	case AMD_PMF_RESULT_CMD_REJECT_PREREQ:
+	case AMD_PMF_RESULT_FAILED:
+	default:
+		dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
+		rc = -EIO;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&dev->lock);
+	amd_pmf_dump_registers(dev);
+	return rc;
+}
+
+static const struct pci_device_id pmf_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
+	{ }
+};
+
+static const struct acpi_device_id amd_pmf_acpi_ids[] = {
+	{"AMDI0102", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
+
+static int amd_pmf_probe(struct platform_device *pdev)
+{
+	struct amd_pmf_dev *dev;
+	struct pci_dev *rdev;
+	u32 base_addr_lo;
+	u32 base_addr_hi;
+	u64 base_addr;
+	u32 val;
+	int err;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->dev = &pdev->dev;
+
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
+		pci_dev_put(rdev);
+		return -ENODEV;
+	}
+
+	dev->cpu_id = rdev->device;
+	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_LO);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
+	if (err) {
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
+
+	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_HI);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
+	if (err) {
+		pci_dev_put(rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	base_addr_hi = val & AMD_PMF_BASE_ADDR_LO_MASK;
+	pci_dev_put(rdev);
+	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+
+	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMF_BASE_ADDR_OFFSET,
+				    AMD_PMF_MAPPING_SIZE);
+	if (!dev->regbase)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dev);
+
+	mutex_init(&dev->lock);
+	dev_info(dev->dev, "registered PMF device successfully\n");
+
+	return 0;
+}
+
+static int amd_pmf_remove(struct platform_device *pdev)
+{
+	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
+
+	mutex_destroy(&dev->lock);
+	kfree(dev->buf);
+	return 0;
+}
+
+static struct platform_driver amd_pmf_driver = {
+	.driver = {
+		.name = "amd-pmf",
+		.acpi_match_table = amd_pmf_acpi_ids,
+	},
+	.probe = amd_pmf_probe,
+	.remove = amd_pmf_remove,
+};
+module_platform_driver(amd_pmf_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
new file mode 100644
index 000000000000..1c2e942e5096
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Platform Management Framework Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#ifndef PMF_H
+#define PMF_H
+
+/* Message Definitions */
+#define SET_SPL				0x03 /* SPL: Sustained Power Limit */
+#define SET_SPPT			0x05 /* SPPT: Slow Package Power Tracking */
+#define SET_FPPT			0x07 /* FPPT: Fast Package Power Tracking */
+#define GET_SPL				0x0B
+#define GET_SPPT			0x0D
+#define GET_FPPT			0x0F
+#define SET_DRAM_ADDR_HIGH	0x14
+#define SET_DRAM_ADDR_LOW	0x15
+#define SET_TRANSFER_TABLE	0x16
+#define SET_STT_MIN_LIMIT	0x18 /* STT: Skin Temperature Tracking */
+#define SET_STT_LIMIT_APU	0x19
+#define SET_STT_LIMIT_HS2	0x1A
+#define SET_SPPT_APU_ONLY	0x1D
+#define GET_SPPT_APU_ONLY	0x1E
+#define GET_STT_MIN_LIMIT	0x1F
+#define GET_STT_LIMIT_APU	0x20
+#define GET_STT_LIMIT_HS2	0x21
+
+struct amd_pmf_dev {
+	void __iomem *regbase;
+	void __iomem *smu_virt_addr;
+	void *buf;
+	u32 base_addr;
+	u32 cpu_id;
+	struct device *dev;
+	struct mutex lock; /* protects the PMF interface */
+};
+
+/* Core Layer */
+int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
+
+#endif /* PMF_H */
-- 
2.25.1

