Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58245C4741F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 14:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6DF020759
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 14:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="O8Koi5Ak"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731013AbgKEOF7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 09:05:59 -0500
Received: from mail-dm6nam12on2082.outbound.protection.outlook.com ([40.107.243.82]:52864
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730461AbgKEOF7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 09:05:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuiypvszNvJYEovcsPJm0z2N1tR1Ws8+bv6ww3U0E05wkHDYwHmzPo2srLc9sCP57oHizqV9rXH43b50aDVDIcwlrOGSzE2+sioOcnXUoCsoKK1fMjo3dB8rZmTEQeCA62W2TdcOIwyAB1gA30/TnOaoRKndq4f3DYQav2zTHsGHK8G4cvPQHEha0eqvaIbB8LeTCn8I9Jokwo2mjBF8QBEkPVq8joICIADxlQWLzRY2oyn8zd2Tr4S7NKvgtTj+8QaUa9J//6qAidtuQaeFeU8yXj5N0b8IkBjKHkvu7CnWKUWiApWZAvNA3Kpj1mRYd98cd+cTXSS6Tl3Pm1gc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvOFhzPpW8fuCXiPNGmkzwKGrpBk8dbpdttr6TZDSNg=;
 b=lO4uJZHKCeTdmMCRUrmGfQnli8xYm1jYTMo/m9qzpv02MQsEJj0KOkYQzm/vnKh+dD7zGw+tlZ6Ei+cgHU61QVKWRGkx4roUhECnWgUKyHh7855BxdbmsLjnFan2UBfMcuvwjjNVfOthT+hqdzviJz0rGXGTBnf4PxUyD2PnnnXUty916yFxmASPD07u7Yym95dto8leeedMMuEMiqL/c1B99J1sJ7wE7zTAMP7GWqIjiTMwifJ2YR8lxbFp7Z02lZHMLZsVazGp6nNjINvOlfxGzXsLl5sg6XNlTb8Kjw46D1TF/CCixRVUficnmu2B2jdurTMwYxpyV8izkmO9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvOFhzPpW8fuCXiPNGmkzwKGrpBk8dbpdttr6TZDSNg=;
 b=O8Koi5AkSmxFSbWvNK2kJTR6Qsfcpbw0XMW7KUNzlytXOz3OFEBCxBdyig7uoAfrEwiUCg2sJGCMEwY/Me2PFbN6t5NtyA6IvkL52PBAbyUsXB3rnmppexLNB7M21qotj/ImQQN/dOE6IJ/1cmxLR92yQEJjZ+0pecZxjXtboVE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN6PR12MB1762.namprd12.prod.outlook.com
 (2603:10b6:404:fe::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.24; Thu, 5 Nov
 2020 14:05:55 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::3cd9:1c02:b4b6:104f]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::3cd9:1c02:b4b6:104f%9]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 14:05:55 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5] platform/x86: amd-pmc: Add AMD platform support for S2Idle
Date:   Thu,  5 Nov 2020 19:35:31 +0530
Message-Id: <20201105140531.2955555-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::21) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR0101CA0059.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 14:05:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 209c1840-ccce-426d-50b7-08d88193e974
X-MS-TrafficTypeDiagnostic: BN6PR12MB1762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB1762A55742BC84388C4063699AEE0@BN6PR12MB1762.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEN5CXsgHp1rFZ1xh3Cdh0hQ4+U7O4E2cMDwaIaC95HHISXIV6dY7lEg7zTj8OLcunqw0Nbpnp3yMmWwZww9S9O90LHDpCkXtUTzy+xaEin5tPXcX3xhxM6MYGZz5bPxNQyg1wmIwIHnYFvSFNe/2jZqoEzQHWvnfg7sIwsHKqm5XdwVhpohRmqORElXe8HDQhZNFWom7aVkMU9H/UoEnKKqxjCEQLu+zT5gD76qt5ogPx3ZR+kxeudJRPI6tPQ6AJmgsJuJltndEugqQb0LR5at4Mv+U2pI6+EgMAo5aHe8o4j3qd7VN0vd6Ft0TLmkhQaasrgluPLVyxOtiwlwnJQBSb4g7FnsHsRz2BhwR68+fmZ6NYX6glmvMkfPr3jva6+U3nYQlq6fVJjoLmLEHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(1076003)(478600001)(4326008)(16526019)(186003)(6666004)(7696005)(52116002)(2906002)(26005)(8676002)(86362001)(5660300002)(6486002)(2616005)(66556008)(316002)(66476007)(8936002)(66946007)(956004)(30864003)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0dwszSXZRuRzp8/+4pj0QM8cDYf6YC+7/BhqzKRkQWBpu44syOXcwMr/9GDfxxTD56S2ZbqhX6zpmueiZqNzzTX334nsI+zTTbxQ8Q9jTkW/Vkm2cyf4UQ8qZng72Yh9meiRWAcY55u4SvxFTu9HooHWlwpV1orJuc4BCypFsvagz+xJkxZhJbgih7fu1oqG1jECiAiAFBPEoN2mopjQCOc6VrDXs78BE/4mAMojNV9qjgONzHRWWkKWPLW6v9NWHVlYgG+lGvov0oYVayef5pvvBy/CCpKNs/lEMMXqw6DdorzjdRuFinOYtp0TY5UkdsrKNDTCIrRGsaIsRERVeXspo3o50O8HHBtXQ4YLRwzdHk4fd2VWgYVmJ9Ll6SP7rsqjIH3GOp/78z2eqV/6c4Kinzudag0Pvj/ZbbwZcLVObwYQPMY86MzFt/XzoxHoAqKoDMBVMUYVaSIx8jvFFImMwNgMdEa+dVRbjCXansHo5xj+oYfZxGw6jXe50VjFl++irR2yiaojO9K13OxCQmEPv2Nc4F1JuIqn57PAFYBq7rnZiwHwSH7AaaVLWiwkjFUdEcShOmgqFUiZ/+GSIUHZ4fe2vCOBWVXevizOKmL/s4DU5vJ5GXvESXMosR19WeDLhMIftQSoUldA1nBg0w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209c1840-ccce-426d-50b7-08d88193e974
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 14:05:55.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92Nu8xXLFMWbI+lYlPCAeqKLx4GSpuKpSdBEJarqfEJhrTmz/etmmUt1Oh3PSS8luXCQwv1e/cH9dm6SMqPUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1762
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

v5:
- Use pcibios_err_to_errno() when returning errors while using PCI
  API's.
- Removed extra blanks lines wherever possible.
- Run spelling and grammer checks :-)
---
 MAINTAINERS                    |   6 +
 drivers/platform/x86/Kconfig   |  14 ++
 drivers/platform/x86/Makefile  |   3 +
 drivers/platform/x86/amd-pmc.c | 286 +++++++++++++++++++++++++++++++++
 4 files changed, 309 insertions(+)
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
index 0d91d136bc3b..58e60e6ac9d8 100644
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
+	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
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
index 000000000000..0102bf1c7916
--- /dev/null
+++ b/drivers/platform/x86/amd-pmc.c
@@ -0,0 +1,286 @@
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
+#define AMD_PMC_REGISTER_MESSAGE	0x538
+#define AMD_PMC_REGISTER_RESPONSE	0x980
+#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+
+/* Base address of SMU for mapping physical address to virtual address */
+#define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
+#define AMD_PMC_SMU_INDEX_DATA		0xBC
+#define AMD_PMC_MAPPING_SIZE		0x01000
+#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
+#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
+#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
+#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
+#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
+
+/* SMU Response Codes */
+#define AMD_PMC_RESULT_OK                    0x01
+#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
+#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
+#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
+#define AMD_PMC_RESULT_FAILED                0xFF
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
+	u32 value;
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
+		return pcibios_err_to_errno(err);
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
+		return pcibios_err_to_errno(err);
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
+	return 0;
+}
+
+static int amd_pmc_remove(struct platform_device *pdev)
+{
+	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
+
+	amd_pmc_dbgfs_unregister(dev);
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
+module_platform_driver(amd_pmc_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("AMD PMC Driver");
-- 
2.25.1

