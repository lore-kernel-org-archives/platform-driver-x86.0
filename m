Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC6BC388F7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB2582076A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="wRBaTt9r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJ2CpY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:45:24 -0400
Received: from mail-dm6nam10on2053.outbound.protection.outlook.com ([40.107.93.53]:38880
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726238AbgJ1Vdo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F76uBOr06zLcVG17Sm8o8JUOn8WS51FZ8RpuauH97tFfsMrXSnibXlavc82OHJ8CHnLn1CsBzRkdOAaTHCbYRGqiXkKVidfuJnqfkyXukoj+DzeVQ9+O0dXDDXLyvft/1i55aoC4JdnnTYHKXfN48APYWmtzndU2FPXIC132DWbGVFtXCR5oQb+1yZ5lAlJUOjP461XiLKvBaaW2AzW4Utv/x5+zIl7Jr3PwEwU9eTyZnVRV/iiJU1rVrh4+a2SST8pj7Zyibf8ZlMcid+TXdHhin7sD2wW01N4cmn/J10yJpN42vgzSlaXrjxLZLi+8UsqREH/05T9o3dPMQ3gR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaQMam+5BrEFaUKV3Nd1WavNMKnKcs3OIDkbmAAiZ60=;
 b=XI85mrecvO8pAYMh2VdnBLBF8dAjvdVXaSxtSOspy2j5FU49Ikt7fxz2qOxdRMdVmMWr0rwWNyG+7p3jQxp1+NdoRov5GaJoykHq3q1usK7jwt8c6f+w6RrY4fxrMukSOJ7rmgWXfySGqM0mI61Exksq7gfR/3E2/fsfQQe4G2P2ENdnPpmNp4z9I2Fd7k+Mm1w8uYvniRf8TIH3qgDQ4pzy8nD8nwBhDZAjeZvtepfU3IfJ7GhUYgbzRMr1/10TaqX6Tjb9LxA/ZCBYtieAIPa+sSJIi15nLN6WtqCx4KQCOoUAACZO6GBNyUlStR2Fza8udi4x1CeMGtW9XTg4uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaQMam+5BrEFaUKV3Nd1WavNMKnKcs3OIDkbmAAiZ60=;
 b=wRBaTt9rtGLr0q+9hzG3RcIU8gnQJp8ztQQjWj8/AZpdF8sSwHjY91GC6uGx1X0Q6gMFOWIZqKzHKtL5lNYtrq93ekLBRh6axVBengYbvTJKzGWtVgqAnX8WcN1l3BqWS7Jnrg2p5vidlJB1FpxwumiFb04M4VnPzBBbzSY2AoM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN6PR12MB1585.namprd12.prod.outlook.com
 (2603:10b6:405:9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 18:57:58 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9%5]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 18:57:58 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2] platform/x86: amd-pmc: Add AMD platform support for S2Idle
Date:   Thu, 29 Oct 2020 00:26:54 +0530
Message-Id: <20201028185654.2692118-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::34) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR01CA0118.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 18:57:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 103591e6-385d-4020-3f2a-08d87b736297
X-MS-TrafficTypeDiagnostic: BN6PR12MB1585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB1585E92EB387E7110BB08A0F9A170@BN6PR12MB1585.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UzwGFO9dM0ZqLFCsgmt81OHwnHk/Fu6fzke9Sdslwyjfb4ZfZJ/xNYmBwL4tooNtMOUbiXVG0/omVq24a11RjXKUfA24bnUOU1WEXjNlHjQiU5YZGAFQ9jUSkOe+lxBThyDWngp3D3YyQ2vi39Hdd0vSKY+yk0IxFgTV1HG4JEKRLY7xOM4Mx9RyAAq859odq7x+YHnSjFCDFmNBuneE0trZYxA8SmY15qtFbU8Xi+v5CMvOHr8Wc6DndCvuqr4b9iqRoiwDFCTR+FvaUN2yZjnOD8tzI7SikxKZxjzxzMI0wE01MwU9NQnXMbRXc93wXplJS1HslQ4mZNcfnsic7Wx7DOhbKEA0Hk3Q4hVZmme441TCFxCEKPV40l9uvY9VmKQuSLYj9uIhmDvFjhsN2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(30864003)(7696005)(66556008)(316002)(186003)(6486002)(86362001)(2616005)(2906002)(16526019)(26005)(956004)(36756003)(478600001)(4326008)(83380400001)(66476007)(66946007)(8936002)(5660300002)(52116002)(8676002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ciG5fp5X44FRGUSotOgw8bmYJKmwrygdNnEUbwvedZFJlUXPAZji+KB0tL74e7aPpqfP6rllw6VMCJXQbWfpEEh6RUPq4V4FGfnHEV9WRnWZVBJIeyi8B7XVw6POEaBMTletekLlH4z/5OFO3Oz8P8Mdm+zWau36SNhMdcT6z+do18/mKwPeEVmGNLBy63smBBzxfEWbk40nERj90KcW6Y1pBNxDyEdOMMRK3937mDOltL4EEQLa3wBmTcXtFHmDwMusILnE88AjPM1m7ugOUJOeTmekhXV43+kVMlualZeslmzsmaiPDDaBaZzK8jLFslCag8nxJcRklSvp9Z2/VUpBf/2lxiloyobE93CFzL8vZzXrHZ5iO7Qi1tJ9nxYIKYDy9O0RIoRj9y0zkq3Q08MIryMWyRwfyx/reqOMYoHktytdfbprD2opvTkiFAxHQRTVpN+YPjLx4zu2HxRDv6iPT6fdn/hXZ5swZSIW6p/XhNunmGOmn9pcMyLpfuxiRlTDzFlVviqRgdWiZyCWwrT66t6a3xPptotIAdDPEHPyk/dmrRGOKorF0O1jRVYH0S8POx67Q7jrfsEX/jeef8nyUI148UucNRvrwgNA7UOTCO8h8FDjLI46DgFpAYJ/RCE+oJ9BhlIk0B2xVjFxuQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103591e6-385d-4020-3f2a-08d87b736297
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 18:57:58.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22rWrpTB7r8P1o43y3b+d75G+vUdjqyK5rqWV054XXCEQcN4tXDFZACWGtvc8ouvGQ72vXGn3p6f7rGh8U5mpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1585
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

AMD Power Management Controller driver aka. amd-pmc driver is the
controller which is meant for final S2Idle transaction that goes to the
PMFW running on the AMD SMU (System Management Unit) responsible for
tuning of the VDD.

Once all the monitored list or the idle constraints are met, this driver
would go and set the OS_HINT (meaning all the devices have reached to
their lowest state possible) via the SMU mailboxes.

This driver would also provide some debug capabilities via debugfs.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Changes since v1:(https://www.spinics.net/lists/platform-driver-x86/msg23269.html)
- Remove duplicate code and make a common routine for polling SMU
- Reorg Maintainers info
- add missing iounmap() during erroneous case.

 MAINTAINERS                    |   7 +
 drivers/platform/x86/Kconfig   |   9 ++
 drivers/platform/x86/Makefile  |   3 +
 drivers/platform/x86/amd-pmc.c | 274 +++++++++++++++++++++++++++++++++
 drivers/platform/x86/amd-pmc.h |  64 ++++++++
 5 files changed, 357 insertions(+)
 create mode 100644 drivers/platform/x86/amd-pmc.c
 create mode 100644 drivers/platform/x86/amd-pmc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e2a8ad69c262..95374000044d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -929,6 +929,13 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-amd-mp2*
 
+AMD PMC DRIVER
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/amd-pmc.c
+F:	drivers/platform/x86/amd-pmc.h
+
 AMD POWERPLAY
 M:	Evan Quan <evan.quan@amd.com>
 L:	amd-gfx@lists.freedesktop.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0d91d136bc3b..665ba3264374 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -180,6 +180,15 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
+config AMD_PMC
+	tristate "AMD SoC PMC driver"
+	depends on ACPI && PCI
+	help
+	  The driver provides support for AMD Power Management Controller
+	  primarily responsible for S2Idle transactions that are driven from
+	  a platform firmware running on SMU. This driver also provides debug
+	  mechanism to investigate the S2Idle transactions and failures.
+
 config APPLE_GMUX
 	tristate "Apple Gmux Driver"
 	depends on ACPI && PCI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5f823f7eff45..48203e87240c 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -22,6 +22,9 @@ obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
 
+# AMD
+obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
+
 # Apple
 obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 
diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
new file mode 100644
index 000000000000..8da4efeefb19
--- /dev/null
+++ b/drivers/platform/x86/amd-pmc.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD SoC Power Management Controller Driver
+ *
+ * Copyright (c) 2020, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/suspend.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+
+#include "amd-pmc.h"
+
+static struct amd_pmc_dev pmc;
+
+static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
+{
+	return ioread32(dev->regbase + reg_offset);
+}
+
+static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u32 val)
+{
+	iowrite32(val, dev->regbase + reg_offset);
+}
+
+#if CONFIG_DEBUG_FS
+static int smu_fw_info_show(struct seq_file *s, void *unused)
+{
+	struct amd_pmc_dev *dev = s->private;
+	unsigned int value;
+
+	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
+	seq_printf(s, "SMU FW Info: %x\n", value);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
+
+static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
+{
+	debugfs_remove_recursive(dev->dbgfs_dir);
+}
+
+static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
+{
+	struct dentry *dir;
+
+	dir = debugfs_create_dir("amd_pmc", NULL);
+	dev->dbgfs_dir = dir;
+	debugfs_create_file("smu_fw_info", 0644, dir, dev, &smu_fw_info_fops);
+}
+
+#else
+static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
+{
+}
+
+static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
+{
+}
+#endif /* CONFIG_DEBUG_FS */
+
+static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
+{
+	u32 value;
+
+	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
+	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
+
+	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
+
+	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
+	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
+}
+
+static int amd_pmc_poll_smu_response(struct amd_pmc_dev *dev)
+{
+	int rc = 0, index;
+
+	for (index = 0; index < RESPONSE_REGISTER_LOOP_MAX; index++) {
+		rc = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
+		if (rc != 0)
+			break;
+
+		usleep_range(PMC_MSG_DELAY_MIN, PMC_MSG_DELAY_MAX);
+	}
+
+	return rc;
+}
+
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, int arg)
+{
+	int rc = 0;
+	u8 msg;
+
+	/* Wait until the response register is non-zero */
+	rc = amd_pmc_poll_smu_response(dev);
+	if (!rc) {
+		dev_err(dev->dev, "failed to talk to SMU\n");
+		return -EIO;
+	}
+
+	/* Write zero to response register */
+	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
+
+	/* Write argument into response register */
+	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, set);
+
+	/* Write message ID to message ID register */
+	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? msg_os_hint_rn : msg_os_hint_pco;
+	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
+
+	if (arg) {
+		/* Wait until the response register is non-zero */
+		rc = amd_pmc_poll_smu_response(dev);
+		if (!rc) {
+			dev_err(dev->dev, "failed to talk to SMU\n");
+			return -EIO;
+		}
+		/* If message register is OK, then SMU has finished processing
+		 * the message, and then read back from AMD_PMC_REGISTER_ARGUMENT
+		 */
+		rc = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int amd_pmc_suspend(struct device *dev)
+{
+	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
+	int rc = 0;
+
+	rc = amd_pmc_send_cmd(pdev, 1, 0);
+	if (rc)
+		dev_err(pdev->dev, "suspend failed\n");
+
+	amd_pmc_dump_registers(pdev);
+
+	return 0;
+}
+
+static int amd_pmc_resume(struct device *dev)
+{
+	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
+	int rc = 0;
+
+	rc = amd_pmc_send_cmd(pdev, 0, 0);
+	if (rc)
+		dev_err(pdev->dev, "resume failed\n");
+
+	amd_pmc_dump_registers(pdev);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops amd_pmc_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(amd_pmc_suspend, amd_pmc_resume)
+};
+
+static int amd_pmc_probe(struct platform_device *pdev)
+{
+	struct amd_pmc_dev *dev = &pmc;
+	struct pci_dev *rdev;
+	u32 base_addr_lo;
+	u32 base_addr_hi;
+	u64 base_addr;
+	int err = 0;
+	u32 val;
+
+	dev->dev = &pdev->dev;
+
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (!rdev || (!(rdev->vendor == PCI_VENDOR_ID_AMD) &&
+		      (rdev->device == AMD_CPU_ID_PCO ||
+			rdev->device == AMD_CPU_ID_RN))) {
+		return -ENODEV;
+	}
+
+	dev->cpu_id = rdev->device;
+	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return err;
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	if (err) {
+		dev_err(dev->dev, "error reading from 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return err;
+	}
+
+	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
+
+	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return err;
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	if (err) {
+		dev_err(dev->dev, "error reading from 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return err;
+	}
+
+	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
+	pci_dev_put(rdev);
+	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+
+	dev->smu_base = ioremap(base_addr, AMD_PMC_MAPPING_SIZE);
+	if (!dev->smu_base)
+		return -ENOMEM;
+
+	dev->regbase = ioremap(base_addr + AMD_PMC_BASE_ADDR_OFFSET, AMD_PMC_MAPPING_SIZE);
+	if (!dev->regbase) {
+		iounmap(dev->smu_base);
+		return -ENOMEM;
+	}
+
+	amd_pmc_dump_registers(dev);
+
+	platform_set_drvdata(pdev, dev);
+	amd_pmc_dbgfs_register(dev);
+
+	return 0;
+}
+
+static int amd_pmc_remove(struct platform_device *pdev)
+{
+	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
+
+	amd_pmc_dbgfs_unregister(dev);
+	iounmap(dev->regbase);
+	iounmap(dev->smu_base);
+	return 0;
+}
+
+static const struct acpi_device_id amd_pmc_acpi_ids[] = {
+	{"AMDI0005", 0},
+	{"AMD0004", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amd_pmc_acpi_ids);
+
+static struct platform_driver amd_pmc_driver = {
+	.driver = {
+		.name = "amd_pmc",
+		.acpi_match_table = ACPI_PTR(amd_pmc_acpi_ids),
+		.pm = &amd_pmc_pm_ops,
+	},
+	.probe = amd_pmc_probe,
+	.remove = amd_pmc_remove,
+};
+
+module_platform_driver(amd_pmc_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("AMD PMC Driver");
diff --git a/drivers/platform/x86/amd-pmc.h b/drivers/platform/x86/amd-pmc.h
new file mode 100644
index 000000000000..8cd7821af505
--- /dev/null
+++ b/drivers/platform/x86/amd-pmc.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AMD SoC Power Management Controller Driver
+ *
+ * Copyright (c) 2020, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#ifndef AMD_PMC_H
+#define AMD_PMC_H
+
+#include <linux/bits.h>
+
+/* SMU Communcation Registers */
+#define AMD_PMC_REGISTER_RESPONSE	0x980
+#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+#define AMD_PMC_REGISTER_MESSAGE	0x538
+
+/* Base address of SMU for mapping physical address to virtual address */
+#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
+#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
+#define AMD_PMC_BASE_ADDR_HI_MASK	0xFFF00000L
+#define AMD_PMC_BASE_ADDR_LO_MASK	0x0000FFFFL
+#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
+#define AMD_PMC_MAPPING_SIZE		0x01000
+#define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
+#define AMD_PMC_SMU_INDEX_DATA		0xBC
+
+/* SMU Response Codes */
+#define AMD_PMC_RESULT_OK                    0x1
+#define AMD_PMC_RESULT_FAILED                0xFF
+#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
+#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
+#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
+
+#define PMC_MSG_DELAY_MIN		100
+#define PMC_MSG_DELAY_MAX		200
+#define AMD_CPU_ID_RV			0x15d0
+#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
+#define AMD_CPU_ID_RN			0x1630
+#define AMD_SMU_FW_VERSION		0x0
+
+#define RESPONSE_REGISTER_LOOP_MAX	20
+
+enum amd_pmc_def {
+	msg_test = 0x01,
+	msg_os_hint_pco,
+	msg_os_hint_rn,
+};
+
+struct amd_pmc_dev {
+	u32 base_addr;
+	u32 cpu_id;
+	void __iomem *regbase;
+	void __iomem *smu_base;
+	struct device *dev;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *dbgfs_dir;
+#endif /* CONFIG_DEBUG_FS */
+};
+
+#endif /* AMD_PMC_H */
-- 
2.25.1

