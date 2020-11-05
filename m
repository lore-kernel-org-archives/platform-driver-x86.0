Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A49C00A89
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 12:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA27320729
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 12:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="zhU6/VMY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgKEMSx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 07:18:53 -0500
Received: from mail-co1nam11on2051.outbound.protection.outlook.com ([40.107.220.51]:2624
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725468AbgKEMSx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 07:18:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2ioVZszCoq+yeCMZS9Pmjnh5fTRZjMJaFwGEw4ZbSsn7Zl3c5Qg4KOmoqDX9L+Dff68d9PIHwHJ5G/+ZFcfZAtaaFsjcuD2FKKbKcaOr4Ukiib+3Kzui3Z+dpHaEhf+LJqX2Wx+6IlGaFaJaCpmNWGvEwPhYAvoDZsCADuZ9O8m0WAI/KjpU45VAsfFaive1FRbqrX90CqwHG2St5bw4z5ISR6v4AD2kyIlDemna/K/Hv+UPrnc2f9/+k9g8Xi3aA6oKLplkE2iKBHrzJ7/90ZAIYbqyY0lvmIMSW4djaTkJJCKfklPsEstp1oTj84+WCBWBE8fatNmpJMpaFPXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77QlqYvxiablxENXhtbdMtbcPeIg6jkZkRcFnlXiuVI=;
 b=IfX5iQhzDFwtKyiBuNTGOWWMydtt2LVWoAb2gHP3UV14sy+mIAV5rSNsIXdNZTnRhMgjURyk8ozVBBzo498F1AFy/qx4S/2QAwUHnsiXF9HPOA6ITTTy3F8KomZGM++JMCEU1tX6Kf4XRB9aOWpafEwmjAvElbo0EeMa+tQg29QZN9KLqN6iKq0OqPvQBqwgM+y1ymEOVJiZeBBsmJAXX1yV2otWWqrrfk5uzpJuKk9TJopbbeXfskH9EgtEKPfhEuBybDG/zHfw36tT2+6n36h43aPFPyKvGCB0KT3ut1ZqAQLuIPVSoBjmRD2Jl5UbSOfVd+e6fmW1tSsrL6+jdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77QlqYvxiablxENXhtbdMtbcPeIg6jkZkRcFnlXiuVI=;
 b=zhU6/VMYvBdyx0ZNas3pVTcDNNOeqhy2Ld3ttaBD14ap/+H7A8PR2k3CidS+lInS8337DUdofXGr1N1E/B4QJCSD6wgWjjeWXzBNsgtqnLYdKDwl6Jrhw/PkOFkXcNkKq/rOfZmBiEtja2k+NUPb1Zza0Bz+fVdkruTTuBlytFQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN8PR12MB3377.namprd12.prod.outlook.com
 (2603:10b6:408:46::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 5 Nov
 2020 12:18:47 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::3cd9:1c02:b4b6:104f]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::3cd9:1c02:b4b6:104f%9]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 12:18:47 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4] platform/x86: amd-pmc: Add AMD platform support for S2Idle
Date:   Thu,  5 Nov 2020 17:47:59 +0530
Message-Id: <20201105121759.2954548-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::14) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 12:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 650372d3-dbaf-4225-fd07-08d88184f249
X-MS-TrafficTypeDiagnostic: BN8PR12MB3377:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB3377D1E15049625189FF26C79AEE0@BN8PR12MB3377.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zsSOKlyVj7z8QX1QPBViTFKPo/Wk8g64QB7J+PQtu0CKBffnaDwGg3j8ORbtIxp1E/dJOhNvVvsCYbcR0Zk5way6uvqmeqEh6KEuUf8TnMshzKRZqVv+YrfYN1An7jjs9vUw71mVey0Ah5PmoYOEycgDyEoDClhB01+XLJKKd+wNGnhj5+M4qczdi5/0eBDn2x+NjotbrthVTYmxDVt7PyQkrs69G0FKCovWAOiWXJGFruvB3Ra0j8yYCcUUx3xha0XZXHOCZPg64wID8hrwhRY9JQZ/wK0dnUfD69vCor0ahSdlnppkJXBzTH9kTbmS5iYMiLv3jXplZpqP968zPWZ68c4hk/HNrsFtgHNGtBOs0KxuxmkGHWgwxl823sJxPENCnuJeU5oh4zXdtmmBjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(1076003)(6666004)(8936002)(2616005)(16526019)(8676002)(26005)(956004)(478600001)(186003)(4326008)(7696005)(5660300002)(52116002)(30864003)(36756003)(316002)(66476007)(86362001)(2906002)(66946007)(83380400001)(6486002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: labwsqnpz9mARYTRjQqbkXHwCfDrOk64FnmiMqAlD4lr2I0geIqgTXA5Y8iIq6+s3paogfYl5eBsIgQAHNKB+2rLnqFCljXLuIUUcX6dLz44DpSqQgeFuRvfathAvrPlFlCW7yjFY6AY29OHKoAMthpDLoJMQ4ADHIcMLcgu5YbJX6pqT/CkM1UD3zCMveEysa94/GbWYUpdu33tujKPIE+R8G+JXLZHYFHpdEU5BRb6JQIjGFVvBr25JkoRi+spQdIXi2JyPdcC2xSO7FOZ4XbgVywIb33xzouz295naFLaOPgw5kGJbQVZzh5LROPU/NbFYJsuoQWLHNUeAnispAV37c9VshoO0sSGB6FIP0zKhL8cSwORYvygLIg4j6EWSFfKDXBNhZFsPVcHhg5tx4F50T2+RGgDtMFPrelKeQeybkWDyeTWJHLAJK0k3/P/a0+2NP5JiPvSFI7f1XM9UNhqylcNTP5PtKbECGoExUZIfVh7AJZhBv8EnKZeHnsKB8/QJ5h/oNspQUfN1B8QbQT2cu5eRrULoYkAU1xcfMTDM3TCIyWO9liq0AunwZJr/2QK+y3D9EWOYVYzs7sjhD32u/cjdS8EceX15eKkdyxmODdLOGjrDFKoxrqVSLAi5Dz17q0+vUr8h9+Kc4tLgQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650372d3-dbaf-4225-fd07-08d88184f249
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 12:18:47.5880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94hasdTkoBmCOQv389VwX2wmgeKAccaTOGJRDTheBxhh9iVmXdJCZb1u1VTjMLlKiNCBYK3L4/48jhKh/Z1JAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3377
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
v2:(https://www.spinics.net/lists/platform-driver-x86/msg23269.html)
- Remove duplicate code and make a common routine for polling SMU
- Reorg Maintainers info
- add missing iounmap() during erroneous case.

v3:(https://www.spinics.net/lists/platform-driver-x86/msg23413.html)
- Addressed cosmetic problems like redundant assignments, blank lines
  etc.
- Moved to readx_poll_timeout() and pci_match_id() for better handling.
- Removed the header and moved all macros to C code.

v4:(https://www.spinics.net/lists/platform-driver-x86/msg23421.html)
- Used GENMASK(), devm_ioremap() for better handling
- Corrected some spelling mistakes
---
 MAINTAINERS                    |   6 +
 drivers/platform/x86/Kconfig   |  14 ++
 drivers/platform/x86/Makefile  |   3 +
 drivers/platform/x86/amd-pmc.c | 293 +++++++++++++++++++++++++++++++++
 4 files changed, 316 insertions(+)
 create mode 100644 drivers/platform/x86/amd-pmc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e2a8ad69c262..fc7b556994e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -929,6 +929,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-amd-mp2*
 
+AMD PMC DRIVER
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/amd-pmc.*
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
index 000000000000..a820980c8e3c
--- /dev/null
+++ b/drivers/platform/x86/amd-pmc.c
@@ -0,0 +1,293 @@
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
+#include <linux/bits.h>
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
+/* SMU communication registers */
+#define AMD_PMC_REGISTER_RESPONSE	0x980
+#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+#define AMD_PMC_REGISTER_MESSAGE	0x538
+
+/* Base address of SMU for mapping physical address to virtual address */
+#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
+#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
+#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
+#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
+#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
+#define AMD_PMC_MAPPING_SIZE		0x01000
+#define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
+#define AMD_PMC_SMU_INDEX_DATA		0xBC
+
+/* SMU Response Codes */
+#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
+#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
+#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
+#define AMD_PMC_RESULT_FAILED                0xFF
+#define AMD_PMC_RESULT_OK                    0x01
+
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RV			0x15D0
+#define AMD_CPU_ID_RN			0x1630
+#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
+#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+
+#define AMD_SMU_FW_VERSION		0x0
+#define PMC_MSG_DELAY_MIN_US		100
+#define RESPONSE_REGISTER_LOOP_MAX	200
+
+enum amd_pmc_def {
+	MSG_TEST = 0x01,
+	MSG_OS_HINT_PCO,
+	MSG_OS_HINT_RN,
+};
+
+struct amd_pmc_dev {
+	void __iomem *regbase;
+	void __iomem *smu_base;
+	u32 base_addr;
+	u32 cpu_id;
+	struct device *dev;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *dbgfs_dir;
+#endif /* CONFIG_DEBUG_FS */
+};
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
+				val, val > 0, PMC_MSG_DELAY_MIN_US,
+				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "failed to talk to SMU\n");
+		return rc;
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
+		return pcibios_err_to_errno(err);
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	if (err)
+		return err;
+
+	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
+
+	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
+	if (err) {
+		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
+	if (err)
+		return err;
+
+	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
+	pci_dev_put(rdev);
+	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+
+	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
+	if (!dev->smu_base)
+		return -ENOMEM;
+
+	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
+				    AMD_PMC_MAPPING_SIZE);
+	if (!dev->regbase)
+		return -ENOMEM;
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

