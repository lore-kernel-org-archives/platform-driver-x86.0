Return-Path: <SRS0=JE7e=ED=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17038C4363A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98615206F4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="mbfkNhNp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732954AbgJ1WYk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:24:40 -0400
Received: from mail-co1nam11on2078.outbound.protection.outlook.com ([40.107.220.78]:18904
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732991AbgJ1WYj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 18:24:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drutVkO2PEiskkE26lrPC8B0JgPb+mTzzL7IjcZzHX8+J5YaltSKSWj3yllb5CExLL23iSBjxzfn8KMtOmoCXpKIQsIOrD65eYptTULaNVxuCoUYlKAZdmEQYwth82OejnQiIcbAmNQMSbyCAMC2O2CZesbnFHqB5xD2fGS4vUKOq2Ni+OLCDhO0PX7i7bzyFvrgGi9ixUDxNzyDIwyv12+yr/XEEnxxADnn52c4Deho4m0jyodic2D+z3jYJQV+2Fv7SLfqHi+QLrFoWw6aSsExM/PmbeuPf23bL2CG95taQIJMF3o2luxVlnNdmHfvQyxMKDjOv8kzLE6U4I4Eow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWW+HWZ8jWROeG1zTFKMUi/QgE6hp2MC83rMXyE7l94=;
 b=JaWb/D6VoFnkFF/sml7RwdynnBPRRuUMuofWXkCvmZfwKHLQgTE11NNtbTdTUdm27Z3vl6V3ohEt9PakdqMy8exhef1RmxncrQ8Hx8SlSjwFeixQ8h3WC3Agn4t3rkvZ265i9zEDnXkeDbUgoRIOqaG9OsNdEYs5Oa1hwPj/+pS+HueUomPe9NVaHkok38T9qK1vSZP0gYTTxAVhMArAwPiDUaH+RGsZ1uIshbl3vuWKXxyS3+O23Ixu25Hf37xoRQhkleutmDV8OtJal7d7Q/Glzg9m+Y4I6gS6pSmSrmlQnH6lR8EfUJEdqa7GZPwnmYY2bODzmUINnId3tsfESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWW+HWZ8jWROeG1zTFKMUi/QgE6hp2MC83rMXyE7l94=;
 b=mbfkNhNpgmcPN4lyVSCH8Rh09ZZ9S+TRoSYjFQ+mDBRCcJKz8mu8Pt5x4S74V3xPda9gKtlHAbBsN9imdifWsTJPiwY8uvWtSiA7ZN8Yy+rSlTtcvvk/6XRNwHS/k/QaIoRHvJfdVa3zw0zzquWqUu+D4bgsxuKSTaVgkKsMxM0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN8PR12MB3250.namprd12.prod.outlook.com
 (2603:10b6:408:99::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 15:52:27 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9%5]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 15:52:27 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2] platform/x86: amd-pmc: Add AMD platform support for S2Idle
Date:   Wed, 28 Oct 2020 21:21:20 +0530
Message-Id: <20201028155120.2691323-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27 via Frontend Transport; Wed, 28 Oct 2020 15:52:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 70a7e0c1-0b00-42b9-e1f4-08d87b597867
X-MS-TrafficTypeDiagnostic: BN8PR12MB3250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB325095CC129E5A78EB8F9E979A170@BN8PR12MB3250.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tulbw5Ya/ntJhBfuwbYJJeRkS1Al70Ruw/5uf82kHhot6sjdByOlVDV3Hej9o/FwXpP6cvgkucnlwbCDllRXtgtsnbfJBdc1QNWUhkztVKOtVpQfRmr8R5H/GZ2bGMrs7ir9omh3cG4rQrzqTlFRAwlk2rcsIMf1Mor6qD14aUCZjJFIlp5dmeSdLnFPGyCywt11TgGvmFRjKgAAExlWtaZJN0OTK7epuzD/70vFa36xBzg/5tPOKdjHzauWcvlnyKKHopzCxxgKKoP9gxSg0T7d/AabxoUI0n6yu/J+kVtLQf3Uyj7wqk3rXZ+Jbe+i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(2906002)(66556008)(86362001)(4326008)(8936002)(8676002)(66946007)(5660300002)(30864003)(2616005)(956004)(1076003)(6486002)(6666004)(186003)(26005)(66476007)(16526019)(83380400001)(7696005)(52116002)(316002)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ZZVhjz2eZkyoxs0zs0JGnJ819T5EiR6HHXzo/1E7doBpaXvOxg1IHO3nHKpKgCJ4urBkAFY78HU6jEirLd/lNN1SXCe2nWC5hUi7t+HIlVfnE1P1rpRxfMhL04EWWg9NntgP/shfO6bRWr/1Dj3QVBzuqC9ldiuS94v9Ofi7bpKomMnlbLtmflNHWLCmG2RyTM5gRcGvlFQtKgtnimpCPXqt4i9AV1nSmyDa1SCIjc9W7mrspMcU4GxNbiL1Kn73ICi2yd7Ljb9PjpZIbLhUcYu3o/AByqBdY40DaymbtIcj8W/dnk0Py/a8pD3tEKCGycYhUBpQ+rQ9FYSyu4N0Wz3lRIV1+HqaHPHUr6tDI7OMUA6II/VssbpnHrLyRLjG+whjAiytlwudPZw7lHxB5ML5AImFZzR9fwbqrozGi/LOTEk/spThAQNXofkG+kmNGOkiQT84r7GreeOo1dKj0h1mc/GCgsG8NUCr+3a3XL1kSKDLFDjcwUZgoHVe42zWyQTZHiXAUmN8fPmFIIUy2iIyRBuDA8JwYtv7ZeTsYWKsmQsquKiLMai2i9Y6DvR3IYwU8QuavQLBFawQaNb++HtVQvP+7o5H1IqiYzNXSM9jqgyM0iKm1yMbWtZRJFpIhXnO5U3F9H+aWfl1VZTJdw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a7e0c1-0b00-42b9-e1f4-08d87b597867
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:52:27.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6A4ajcZzPcMixnvpACz1uU73imu9Wi1Jr9vU4H41WBGoajySVyedGvK9izAR4FF39R/vGpj1mLXEyP6LSInHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3250
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

