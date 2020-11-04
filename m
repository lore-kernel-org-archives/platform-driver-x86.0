Return-Path: <SRS0=p7YD=EK=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFD2C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 15:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B3662074B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 15:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="c4A/h0FK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbgKDPbP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:31:15 -0500
Received: from mail-eopbgr750070.outbound.protection.outlook.com ([40.107.75.70]:23837
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726919AbgKDPbO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Nov 2020 10:31:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjVbootKWGZNUbvMngZH2QG02MRLYuDBOglxoTsPRjeS7acqFAoDKpnilVhZWoGNN3NMFc2kj26b8j4RBokxwhXuKYJ901knRjEWmEJS6CAyrp3eDrI27tWAoLCOQsgFkijA0W7BSxG+q3C6UQgTL5dsOiwBwxi6br3032H8Hl9DqQt79Da66Z8oHkEZMLOa7Wb4gktYUnLAMxlwMyDQmEnmD/A0K1XCGjT0+vUopts9LbLPdlI8suCN6dB+Wu/41etIm69Rfd5gQCZj89e/LpB5QgMJJDP0F7orQRYVeRCyJNm5pJfx2chi05p5xP2n1p999HfzSy0SlxixpSKFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FBQiSxDRjPjKGYBtxS85sKOqMVWKYMARdtP+WFd77Y=;
 b=ltngM6QBiuMDFNCwhDy4FXXnRGVApt1aRvpvX7PbwTlJUZiWv+yRdiHL+X0kpavtSOPAi8GO6QTaK4a70I2GnO0G1V77DKod4mG5+cGAF2qeP03l2vjC0fXV+7oD9aTWIzYM6jE9H/C3Y8VkNdg5VlUtq3dpE0PGB9BjcI+vErGBePEs4VhGcrCUsqW43cjQzWqzkHk9SKzo9oF1LFN0/9P82wdWBFI5hW2k2YACiYeeb7HzPF+yKTcWsOLS9jqcsEvicg+2SagzSWFpENpFuUoojpaS41p038oYqWqHbDHCkKmoyBwBMzHdSenfk9UbUJlFgsC5kiGFsrULyCn1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FBQiSxDRjPjKGYBtxS85sKOqMVWKYMARdtP+WFd77Y=;
 b=c4A/h0FKMMbnQ8K8Qa7UQSjmoHKG0BrS9HJX/cy7u1Ge6AISv3ObaYpA0MKkR/bjnMQ5NErcGET8N7uyd29Ko/L1bsZxA3IsO1oen+m7AEmh5oytjSiNn/bdTgZ/cfEtEoJAAExlPXjzAjLIE6Dd1z/VTx8Z9o8AVwKJEkZ+nmM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0013.namprd12.prod.outlook.com
 (2603:10b6:300:e0::21) by MWHPR1201MB0270.namprd12.prod.outlook.com
 (2603:10b6:301:4f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 15:31:07 +0000
Received: from MWHPR1201MB0013.namprd12.prod.outlook.com
 ([fe80::f8f1:2f87:d2f3:c83a]) by MWHPR1201MB0013.namprd12.prod.outlook.com
 ([fe80::f8f1:2f87:d2f3:c83a%9]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 15:31:07 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3] platform/x86: amd-pmc: Add AMD platform support for S2Idle
Date:   Wed,  4 Nov 2020 21:00:17 +0530
Message-Id: <20201104153017.1916621-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0085.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::25)
 To MWHPR1201MB0013.namprd12.prod.outlook.com (2603:10b6:300:e0::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR01CA0085.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 15:31:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 034971f1-3b8e-4265-da30-08d880d6a5e4
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0270:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0270B785CF2B431513C007A39AEF0@MWHPR1201MB0270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ut6UysdhXFwpbuoZtfiA3QgMihzFsiAYoyPGwnocNthslX5phmwWdjiBiT0FA8EvLWxZqhe2UoUn0xI/JiPnElht/t4uK8s80sac1knYfaFJiMOHLRcdwdlYDmnWjRrwsO8wqIbGcG8tZQxaUGcO2P1GP0S/A5LgaCQm4sw057Dbjo1N9D+Znf31RmPlLbhdGCD+fwEdOjCUcakcA0VGW60mEik/pIVAhdMHhEfIAJD1cgSxtYSOv4EQlmuKa4wCD4xW5LsmXH9lVtkzV3eam6iz9aaIBX20M/1RSdIOaaqi1U91jhWZY7J1EGkX/pGRyz+aF6CcS7LB4r83Oqg93L6m0RkNG1RJAF2wkPEikVGzqU883Rw6+4+Tc6s0kg2hO5trhvkzXrL1vkSRN7rwcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1201MB0013.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(16526019)(66946007)(52116002)(7696005)(186003)(36756003)(26005)(956004)(66476007)(86362001)(4326008)(66556008)(83380400001)(6666004)(2616005)(478600001)(6486002)(316002)(30864003)(8676002)(8936002)(5660300002)(2906002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: b9g5KSVAAjFkD1k3qqPKfpNs15srcdyotcjAibPJwLMv7okIiYXuoZpOwhSj+2p+p4bOnGl49AdGQHWG866lgW1Nkvb5PpRrvFTt0l91lTsaPKo4ftmdLIaNgxvb9SOk2/cPQyl1Uni9n7DKhDBk8MSHtalOV4+2h/IKatZ8X3PIT+QOLQ5NCAjC3m419NcpuflIelTHgmJYWl8e/JlvozO103fwfZsl/CCDaSu8uhw4k/lYMPwjTV6T4r3YEyB6b9D6YKUZyVZIh4PX080f0Nu85jDQwqQ7HDXpRvzj9cxC+O5Rh0iOB0v9kgcV6VbVIncYfOogyMcRZ1iSmfUzWEJ1JzY4CnmyDbNZfRYICsYa7NVdm/lNDVIZxxm7xrkYRPTtLVm1GhJSDIVAXLx98rU8bpwfOl6ylN1u2ruiWEWgvsV44K8JooQt/mhYGy6bSaNADwyKHeQaTpmlNjw2B3tmZVdlfxy2bHodWDmSN4WSt6ZHVdwakSMhCDdTchzKdGE75LyOq967UpJZh8Zx7Fzv4DTeql28ZulMMAbOGmSho7u4GduB2rd5bKMDLlYUyYXbJAkDu9jyP/+RSRmkITCgSN3Z5dgQy4f/fF8291on99wIm6o5WADcG4DVKcDbFPhEb3XVlgqchECj1LumQw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034971f1-3b8e-4265-da30-08d880d6a5e4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0013.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 15:31:07.1418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CQWQJ24XCNmuWvXWUxWCtJWZKzBVyCCvWm3wA+wMdY/79PkaqU7u4WWvtr/cUEROlfb8f5uck32NMPa/vW3NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0270
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

AMD Power Management Controller driver a.k.a. amd-pmc driver is the
controller which is meant for the final S2Idle transaction that goes to
the PMFW running on the AMD SMU (System Management Unit) responsible for
tuning of the VDD.

Once all the monitored list or the idle constraints are met, this driver
would go and set the OS_HINT (meaning all the devices have reached to
their lowest state possible) via the SMU mailboxes.

This driver would also provide some debug capabilities via debugfs.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Changes in
v2:(https://www.spinics.net/lists/platform-driver-x86/msg23269.html)
- Remove duplicate code and make a common routine for polling SMU
- Reorg Maintainers info
- add missing iounmap() during erroneous case.

Changes in
v3:(https://www.spinics.net/lists/platform-driver-x86/msg23413.html)
- Addressed cosmetic problems like redundant assignments, blank lines
  etc.
- Moved to readx_poll_timeout() and pci_match_id() for better handling.
- Removed the header and moved all macros to C code.

 MAINTAINERS                    |   6 +
 drivers/platform/x86/Kconfig   |  14 ++
 drivers/platform/x86/Makefile  |   3 +
 drivers/platform/x86/amd-pmc.c | 297 +++++++++++++++++++++++++++++++++
 4 files changed, 320 insertions(+)
 create mode 100644 drivers/platform/x86/amd-pmc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e2a8ad69c262..0925230a30a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -929,6 +929,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-amd-mp2*
 
+AMD PMC DRIVER
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/amd-pmc*
+
 AMD POWERPLAY
 M:	Evan Quan <evan.quan@amd.com>
 L:	amd-gfx@lists.freedesktop.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0d91d136bc3b..bc312844c01d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -180,6 +180,20 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
+config AMD_PMC
+	tristate "AMD SoC PMC driver"
+	depends on ACPI && PCI
+	help
+	  The driver provides support for AMD Power Management Controller
+	  primarily responsible for S2Idle transactions that are driven from
+	  a platform firmware running on SMU. This driver also provides a debug
+	  mechanism to investigate the S2Idle transactions and failures.
+
+	  Say Y or M here if you have an notebook powered by AMD RYZEN CPU/APU.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd-pmc.
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
index 000000000000..7c359c187f6f
--- /dev/null
+++ b/drivers/platform/x86/amd-pmc.c
@@ -0,0 +1,297 @@
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
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/suspend.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+
+/* SMU communcation registers */
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
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RV			0x15D0
+#define AMD_CPU_ID_RN			0x1630
+#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
+#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+
+#define AMD_SMU_FW_VERSION		0x0
+#define PMC_MSG_DELAY_MIN_USECS		100
+#define RESPONSE_REGISTER_LOOP_MAX	200
+
+enum amd_pmc_def {
+	MSG_TEST = 0x01,
+	MSG_OS_HINT_PCO,
+	MSG_OS_HINT_RN,
+};
+
+static struct amd_pmc_dev {
+	u32 base_addr;
+	u32 cpu_id;
+	void __iomem *regbase;
+	void __iomem *smu_base;
+	struct device *dev;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *dbgfs_dir;
+#endif /* CONFIG_DEBUG_FS */
+} pmc;
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
+	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
+	debugfs_create_file("smu_fw_info", 0644, dev->dbgfs_dir, dev,
+			    &smu_fw_info_fops);
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
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
+{
+	int rc;
+	u8 msg;
+	u32 val;
+
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
+				val, val > 0, PMC_MSG_DELAY_MIN_USECS,
+				PMC_MSG_DELAY_MIN_USECS * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "failed to talk to SMU\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Write zero to response register */
+	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
+
+	/* Write argument into response register */
+	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, set);
+
+	/* Write message ID to message ID register */
+	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
+	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
+
+	return 0;
+}
+
+static int __maybe_unused amd_pmc_suspend(struct device *dev)
+{
+	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
+	int rc;
+
+	rc = amd_pmc_send_cmd(pdev, 1);
+	if (rc)
+		dev_err(pdev->dev, "suspend failed\n");
+
+	amd_pmc_dump_registers(pdev);
+
+	return 0;
+}
+
+static int __maybe_unused amd_pmc_resume(struct device *dev)
+{
+	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
+	int rc;
+
+	rc = amd_pmc_send_cmd(pdev, 0);
+	if (rc)
+		dev_err(pdev->dev, "resume failed\n");
+
+	amd_pmc_dump_registers(pdev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops amd_pmc_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(amd_pmc_suspend, amd_pmc_resume)
+};
+
+static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
+	{ }
+};
+
+static int amd_pmc_probe(struct platform_device *pdev)
+{
+	struct amd_pmc_dev *dev = &pmc;
+	struct pci_dev *rdev;
+	u32 base_addr_lo;
+	u32 base_addr_hi;
+	u64 base_addr;
+	int err;
+	u32 val;
+
+	dev->dev = &pdev->dev;
+
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (!rdev || !pci_match_id(pmc_pci_ids, rdev))
+		return -ENODEV;
+
+	dev->cpu_id = rdev->device;
+	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return -err;
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	if (err) {
+		dev_err(dev->dev, "error reading from 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return -err;
+	}
+
+	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
+
+	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return -err;
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	if (err) {
+		dev_err(dev->dev, "error reading from 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return -err;
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
+
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
+		.acpi_match_table = amd_pmc_acpi_ids,
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
-- 
2.25.1

