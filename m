Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33B8C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 11:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F617235F7
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 11:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbhAVLn4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Jan 2021 06:43:56 -0500
Received: from mga02.intel.com ([134.134.136.20]:18381 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbhAVLnf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Jan 2021 06:43:35 -0500
IronPort-SDR: xviFZJJCBEH/wJdDDhRxm+cnrSF389kAmmliH+24W+0fA1KL9BEXXcsBx1OCHllDBg/CHm6xld
 g0kc2R62mURQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166535012"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="166535012"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 03:41:48 -0800
IronPort-SDR: 08oUnQBHBfCuuavBHmNeDH8KOvnCBc8z9QAcHp5SB5p+Hq0rdXmtfXsnHCIBhWgGVo4mlw81Lm
 jyXvhd+sjb+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="467902331"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2021 03:41:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 78C4514F; Fri, 22 Jan 2021 13:41:46 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1] platform/x86: intel_mid_powerbtn: Remove driver for deprecated platform
Date:   Fri, 22 Jan 2021 13:41:45 +0200
Message-Id: <20210122114145.38813-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Intel Moorestown and Medfield are quite old Intel Atom based
32-bit platforms, which were in limited use in some Android phones,
tablets and consumer electronics more than eight years ago.

There are no bugs or problems ever reported outside from Intel
for breaking any of that platforms for years. It seems no real
users exists who run more or less fresh kernel on it. The commit
05f4434bc130 ("ASoC: Intel: remove mfld_machine") also in align
with this theory.

Due to above and to reduce a burden of supporting outdated drivers
we remove the support of outdated platforms completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/platform/x86/Kconfig              |   8 -
 drivers/platform/x86/Makefile             |   1 -
 drivers/platform/x86/intel_mid_powerbtn.c | 233 ----------------------
 3 files changed, 242 deletions(-)
 delete mode 100644 drivers/platform/x86/intel_mid_powerbtn.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3ba680af3ef5..4a5798a0ce0c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1327,14 +1327,6 @@ config INTEL_CHTDC_TI_PWRBTN
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel_chtdc_ti_pwrbtn.
 
-config INTEL_MID_POWER_BUTTON
-	tristate "power button driver for Intel MID platforms"
-	depends on INTEL_SCU && INPUT
-	help
-	  This driver handles the power button on the Intel MID platforms.
-
-	  If unsure, say N.
-
 config INTEL_MRFLD_PWRBTN
 	tristate "Intel Merrifield Basin Cove power button driver"
 	depends on INTEL_SOC_PMIC_MRFLD
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 6fb57502b59a..728ccc226a29 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -137,7 +137,6 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
 # Intel PMIC / PMC / P-Unit devices
 obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
 obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
-obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
 obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
 obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o
 obj-$(CONFIG_INTEL_PMT_CLASS)		+= intel_pmt_class.o
diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
deleted file mode 100644
index df434abbb66f..000000000000
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ /dev/null
@@ -1,233 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Power button driver for Intel MID platforms.
- *
- * Copyright (C) 2010,2017 Intel Corp
- *
- * Author: Hong Liu <hong.liu@intel.com>
- * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
- */
-
-#include <linux/input.h>
-#include <linux/interrupt.h>
-#include <linux/mfd/intel_msic.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/pm_wakeirq.h>
-#include <linux/slab.h>
-
-#include <asm/cpu_device_id.h>
-#include <asm/intel-family.h>
-#include <asm/intel_scu_ipc.h>
-
-#define DRIVER_NAME "msic_power_btn"
-
-#define MSIC_PB_LEVEL	(1 << 3) /* 1 - release, 0 - press */
-
-/*
- * MSIC document ti_datasheet defines the 1st bit reg 0x21 is used to mask
- * power button interrupt
- */
-#define MSIC_PWRBTNM    (1 << 0)
-
-/* Intel Tangier */
-#define BCOVE_PB_LEVEL		(1 << 4)	/* 1 - release, 0 - press */
-
-/* Basin Cove PMIC */
-#define BCOVE_PBIRQ		0x02
-#define BCOVE_IRQLVL1MSK	0x0c
-#define BCOVE_PBIRQMASK		0x0d
-#define BCOVE_PBSTATUS		0x27
-
-struct mid_pb_ddata {
-	struct device *dev;
-	int irq;
-	struct input_dev *input;
-	unsigned short mirqlvl1_addr;
-	unsigned short pbstat_addr;
-	u8 pbstat_mask;
-	struct intel_scu_ipc_dev *scu;
-	int (*setup)(struct mid_pb_ddata *ddata);
-};
-
-static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
-{
-	struct input_dev *input = ddata->input;
-	int ret;
-	u8 pbstat;
-
-	ret = intel_scu_ipc_dev_ioread8(ddata->scu, ddata->pbstat_addr,
-					&pbstat);
-	if (ret)
-		return ret;
-
-	dev_dbg(input->dev.parent, "PB_INT status= %d\n", pbstat);
-
-	*value = !(pbstat & ddata->pbstat_mask);
-	return 0;
-}
-
-static int mid_irq_ack(struct mid_pb_ddata *ddata)
-{
-	return intel_scu_ipc_dev_update(ddata->scu, ddata->mirqlvl1_addr, 0,
-					MSIC_PWRBTNM);
-}
-
-static int mrfld_setup(struct mid_pb_ddata *ddata)
-{
-	/* Unmask the PBIRQ and MPBIRQ on Tangier */
-	intel_scu_ipc_dev_update(ddata->scu, BCOVE_PBIRQ, 0, MSIC_PWRBTNM);
-	intel_scu_ipc_dev_update(ddata->scu, BCOVE_PBIRQMASK, 0, MSIC_PWRBTNM);
-
-	return 0;
-}
-
-static irqreturn_t mid_pb_isr(int irq, void *dev_id)
-{
-	struct mid_pb_ddata *ddata = dev_id;
-	struct input_dev *input = ddata->input;
-	int value = 0;
-	int ret;
-
-	ret = mid_pbstat(ddata, &value);
-	if (ret < 0) {
-		dev_err(input->dev.parent,
-			"Read error %d while reading MSIC_PB_STATUS\n", ret);
-	} else {
-		input_event(input, EV_KEY, KEY_POWER, value);
-		input_sync(input);
-	}
-
-	mid_irq_ack(ddata);
-	return IRQ_HANDLED;
-}
-
-static const struct mid_pb_ddata mfld_ddata = {
-	.mirqlvl1_addr	= INTEL_MSIC_IRQLVL1MSK,
-	.pbstat_addr	= INTEL_MSIC_PBSTATUS,
-	.pbstat_mask	= MSIC_PB_LEVEL,
-};
-
-static const struct mid_pb_ddata mrfld_ddata = {
-	.mirqlvl1_addr	= BCOVE_IRQLVL1MSK,
-	.pbstat_addr	= BCOVE_PBSTATUS,
-	.pbstat_mask	= BCOVE_PB_LEVEL,
-	.setup	= mrfld_setup,
-};
-
-static const struct x86_cpu_id mid_pb_cpu_ids[] = {
-	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SALTWELL_MID,	&mfld_ddata),
-	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_MID,	&mrfld_ddata),
-	{}
-};
-
-static int mid_pb_probe(struct platform_device *pdev)
-{
-	const struct x86_cpu_id *id;
-	struct mid_pb_ddata *ddata;
-	struct input_dev *input;
-	int irq = platform_get_irq(pdev, 0);
-	int error;
-
-	id = x86_match_cpu(mid_pb_cpu_ids);
-	if (!id)
-		return -ENODEV;
-
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", irq);
-		return irq;
-	}
-
-	input = devm_input_allocate_device(&pdev->dev);
-	if (!input)
-		return -ENOMEM;
-
-	input->name = pdev->name;
-	input->phys = "power-button/input0";
-	input->id.bustype = BUS_HOST;
-	input->dev.parent = &pdev->dev;
-
-	input_set_capability(input, EV_KEY, KEY_POWER);
-
-	ddata = devm_kmemdup(&pdev->dev, (void *)id->driver_data,
-			     sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
-		return -ENOMEM;
-
-	ddata->dev = &pdev->dev;
-	ddata->irq = irq;
-	ddata->input = input;
-
-	if (ddata->setup) {
-		error = ddata->setup(ddata);
-		if (error)
-			return error;
-	}
-
-	ddata->scu = devm_intel_scu_ipc_dev_get(&pdev->dev);
-	if (!ddata->scu)
-		return -EPROBE_DEFER;
-
-	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mid_pb_isr,
-					  IRQF_ONESHOT, DRIVER_NAME, ddata);
-	if (error) {
-		dev_err(&pdev->dev,
-			"Unable to request irq %d for MID power button\n", irq);
-		return error;
-	}
-
-	error = input_register_device(input);
-	if (error) {
-		dev_err(&pdev->dev,
-			"Unable to register input dev, error %d\n", error);
-		return error;
-	}
-
-	platform_set_drvdata(pdev, ddata);
-
-	/*
-	 * SCU firmware might send power button interrupts to IA core before
-	 * kernel boots and doesn't get EOI from IA core. The first bit of
-	 * MSIC reg 0x21 is kept masked, and SCU firmware doesn't send new
-	 * power interrupt to Android kernel. Unmask the bit when probing
-	 * power button in kernel.
-	 * There is a very narrow race between irq handler and power button
-	 * initialization. The race happens rarely. So we needn't worry
-	 * about it.
-	 */
-	error = mid_irq_ack(ddata);
-	if (error) {
-		dev_err(&pdev->dev,
-			"Unable to clear power button interrupt, error: %d\n",
-			error);
-		return error;
-	}
-
-	device_init_wakeup(&pdev->dev, true);
-	dev_pm_set_wake_irq(&pdev->dev, irq);
-
-	return 0;
-}
-
-static int mid_pb_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-
-	return 0;
-}
-
-static struct platform_driver mid_pb_driver = {
-	.driver = {
-		.name = DRIVER_NAME,
-	},
-	.probe	= mid_pb_probe,
-	.remove	= mid_pb_remove,
-};
-
-module_platform_driver(mid_pb_driver);
-
-MODULE_AUTHOR("Hong Liu <hong.liu@intel.com>");
-MODULE_DESCRIPTION("Intel MID Power Button Driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.29.2

