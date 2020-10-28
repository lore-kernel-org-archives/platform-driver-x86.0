Return-Path: <SRS0=JE7e=ED=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992A9C388F7
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FFA4206F4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Oct 2020 22:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GSM1S/1p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbgJ1WVP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45976 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732511AbgJ1WVL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 18:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603923668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F0u2dNZXSSNdF0j1mxzdCZxMP8lZHVvRHS5lu1ydFqQ=;
        b=GSM1S/1pQdZb2FaUoOCtF+0qXSbhMdK94iCFYj/OR3HlFz9iJtE9MB3N+snTeSQ0IxLkXA
        cfV/daaSABNNNTxo22u2fZ4hKmRsTOBj9LCxiz13JqJnJdogCdyvfvPIzdkOKbkL+UXoTD
        R3jPMI8khufcGbYqVl53NO94YYr7gfA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-wbsaQWSfMkWW1nOvxMERQA-1; Wed, 28 Oct 2020 08:19:01 -0400
X-MC-Unique: wbsaQWSfMkWW1nOvxMERQA-1
Received: by mail-ej1-f71.google.com with SMTP id p6so668040ejj.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 05:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F0u2dNZXSSNdF0j1mxzdCZxMP8lZHVvRHS5lu1ydFqQ=;
        b=N0y6M4dDODduG47wUQDuNcAxyQM/8sULVJpSxXcpHD72egNdsP6rWPRlI5UWJy/txc
         p+2v2le/3z43GnEwCPkrHBre/94/xr4GxVL/VNsDl9/F+V68ZywY2MemmXnypP+l+vcx
         KQXFcloyjA9lPPE7L0t0SCWwf+X3qmgnmH2USgWHE6AxWlKgxYyJFrrxrvtIBq7bhFiB
         RtZyol6rcoVs8uAfJfO4ZB8A+WDd01icR5gGi2vCIGNy0/9WIqbs2qmQSDmFRtMnqBKO
         8ggzBeYRngJRuRZJp2CteivZioQrwDNjEUi73VC/tYGT3gxadb3xkTg6+W/R+S1r91Sb
         CkYg==
X-Gm-Message-State: AOAM533zRTDSHATWFBdTMYa14O8CgmX1xX0HxJyyVlfz/EXO9WUaxX2q
        6r387knO1wEKK1I8+q8T4aWIoWEx3FlYdsnC3s0bAMiZtyfcCE2FVC2slpOjSR2gKWfTA9Pwxyj
        61050HIFnRouL578BQ09ne1a63gzR5ObV6Q==
X-Received: by 2002:aa7:c7d9:: with SMTP id o25mr7703351eds.318.1603887539402;
        Wed, 28 Oct 2020 05:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPY2zR5X06d4QHF0kFfn87o+VYqXUaEn90roxcMEeGmlB7X0E9SfYVDVMbW4fdzMK696ov2A==
X-Received: by 2002:aa7:c7d9:: with SMTP id o25mr7703328eds.318.1603887539141;
        Wed, 28 Oct 2020 05:18:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id d11sm2810539eds.83.2020.10.28.05.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 05:18:58 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20201023080410.458629-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c38b017-edec-9c1b-3dfc-18a6a2000998@redhat.com>
Date:   Wed, 28 Oct 2020 13:18:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201023080410.458629-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/23/20 10:04 AM, Shyam Sundar S K wrote:
> AMD Power Management Controller driver aka. amd-pmc driver is the
> controller which is meant for final S2Idle transaction that goes to the
> PMFW running on the AMD SMU (System Management Unit) responsible for
> tuning of the VDD.
> 
> Once all the monitored list or the idle constraints are met, this driver
> would go and set the OS_HINT (meaning all the devices have reached to
> their lowest state possible) via the SMU mailboxes.
> 
> This driver would also provide some debug capabilities via debugfs.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I have various review remarks, see my
comments inline.

> ---
>  MAINTAINERS                    |   7 +
>  drivers/platform/x86/Kconfig   |   9 ++
>  drivers/platform/x86/Makefile  |   3 +
>  drivers/platform/x86/amd-pmc.c | 273 +++++++++++++++++++++++++++++++++
>  drivers/platform/x86/amd-pmc.h |  64 ++++++++
>  5 files changed, 356 insertions(+)
>  create mode 100644 drivers/platform/x86/amd-pmc.c
>  create mode 100644 drivers/platform/x86/amd-pmc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e2a8ad69c262..c1119d3fde8e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8992,6 +8992,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel_pmc_core*
>  
> +AMD PMC DRIVER
> +M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/amd-pmc.c
> +F:	drivers/platform/x86/amd-pmc.h
> +
>  INTEL PMIC GPIO DRIVERS
>  M:	Andy Shevchenko <andy@kernel.org>
>  S:	Maintained

The entries in the MAINTAINERS file are alphabetically sorted,
this entry needs to put together with the other "AMD ..."
entries near the top of the file.

> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0d91d136bc3b..c73c2495e1bc 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -180,6 +180,15 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> +config AMD_PMC
> +	tristate "AMD SoC PMC driver"
> +	depends on ACPI && PCI
> +	help
> +	  The driver provides support for AMD Power Management Controller
> +	  primarily responsible for S2Idle transactions that are driven from
> +	  a platform firmware running on SMU. This driver also provides debug
> +	  mechanism to investigate the S2Idle transcations and failures.
> +
>  config APPLE_GMUX
>  	tristate "Apple Gmux Driver"
>  	depends on ACPI && PCI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5f823f7eff45..48203e87240c 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -22,6 +22,9 @@ obj-$(CONFIG_ACERHDF)		+= acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>  
> +# AMD
> +obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
> +
>  # Apple
>  obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
>  
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> new file mode 100644
> index 000000000000..f5f77e565d2e
> --- /dev/null
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD SoC Power Management Controller Driver
> + *
> + * Copyright (c) 2020, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/suspend.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +
> +#include "amd-pmc.h"
> +
> +static struct amd_pmc_dev pmc;
> +
> +static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
> +{
> +	return ioread32(dev->regbase + reg_offset);
> +}
> +
> +static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u32 val)
> +{
> +	iowrite32(val, dev->regbase + reg_offset);
> +}
> +
> +#if CONFIG_DEBUG_FS
> +static int smu_fw_info_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_pmc_dev *dev = s->private;
> +	unsigned int value;
> +
> +	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
> +	seq_printf(s, "SMU FW Info: %x\n", value);
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
> +
> +static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> +{
> +	debugfs_remove_recursive(dev->dbgfs_dir);
> +}
> +
> +static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +	struct dentry *dir;
> +
> +	dir = debugfs_create_dir("amd_pmc", NULL);
> +	dev->dbgfs_dir = dir;
> +	debugfs_create_file("smu_fw_info", 0644, dir, dev, &smu_fw_info_fops);
> +}
> +
> +#else
> +static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +}
> +
> +static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> +{
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +
> +static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
> +{
> +	u32 value;
> +
> +	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
> +	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
> +
> +	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
> +
> +	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
> +	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
> +}
> +
> +static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, int arg)
> +{
> +	int rc = 0, index;
> +	u8 msg;
> +

### begin this block ###
> +	/* Wait until the response register is non-zero */
> +	for (index = 0; index < RESPONSE_REGISTER_LOOP_MAX; index++) {
> +		rc = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
> +		if (rc != 0)
> +			break;
> +
> +		usleep_range(PMC_MSG_DELAY_MIN, PMC_MSG_DELAY_MAX);
> +	}
> +
> +	if (!rc) {
> +		dev_err(dev->dev, "failed to talk to SMU\n");
> +		return -EIO;
> +	}
### end this block ###

This block is duplicated 1:1 below, please put this code in a
helper function.

> +
> +	/* Write zero to response register */
> +	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
> +
> +	/* Write argument into response register */
> +	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, set);
> +
> +	/* Write message ID to message ID register */
> +	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? msg_os_hint_rn : msg_os_hint_pco;
> +	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> +
> +	if (arg) {

### begin duplicated block ###
> +		/* Wait until the response register is non-zero */
> +		for (index = 0; index < RESPONSE_REGISTER_LOOP_MAX; index++) {
> +			rc = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
> +			if (rc != 0)
> +				break;
> +
> +			usleep_range(PMC_MSG_DELAY_MIN, PMC_MSG_DELAY_MAX);
> +		}
> +
> +		if (!rc) {
> +			dev_err(dev->dev, "failed to talk to SMU\n");
> +			return -EIO;
> +		}
### end duplicated block ###

> +
> +		/* If message register is OK, then SMU has finished processing
> +		 * the message, and then read back from AMD_PMC_REGISTER_ARGUMENT
> +		 */
> +		rc = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int amd_pmc_suspend(struct device *dev)
> +{
> +	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
> +	int rc = 0;
> +
> +	rc = amd_pmc_send_cmd(pdev, 1, 0);
> +	if (rc)
> +		dev_err(pdev->dev, "suspend failed\n");
> +
> +	amd_pmc_dump_registers(pdev);
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_resume(struct device *dev)
> +{
> +	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
> +	int rc = 0;
> +
> +	rc = amd_pmc_send_cmd(pdev, 0, 0);
> +	if (rc)
> +		dev_err(pdev->dev, "resume failed\n");
> +
> +	amd_pmc_dump_registers(pdev);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops amd_pmc_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(amd_pmc_suspend, amd_pmc_resume)
> +};
> +
> +static int amd_pmc_probe(struct platform_device *pdev)
> +{
> +	struct amd_pmc_dev *dev = &pmc;
> +	struct pci_dev *rdev;
> +	u32 base_addr_lo;
> +	u32 base_addr_hi;
> +	u64 base_addr;
> +	int err = 0;
> +	u32 val;
> +
> +	dev->dev = &pdev->dev;
> +
> +	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +	if (!rdev || (!(rdev->vendor == PCI_VENDOR_ID_AMD) &&
> +		      (rdev->device == AMD_CPU_ID_PCO ||
> +			rdev->device == AMD_CPU_ID_RN))) {
> +		return -ENODEV;
> +	}
> +
> +	dev->cpu_id = rdev->device;
> +	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
> +	if (err) {
> +		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> +		return err;
> +	}
> +
> +	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
> +	if (err) {
> +		dev_err(dev->dev, "error reading from 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> +		return err;
> +	}
> +
> +	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
> +
> +	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
> +	if (err) {
> +		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> +		return err;
> +	}
> +
> +	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
> +	if (err) {
> +		dev_err(dev->dev, "error reading from 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> +		return err;
> +	}
> +
> +	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
> +	pci_dev_put(rdev);
> +	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
> +
> +	dev->smu_base = ioremap(base_addr, AMD_PMC_MAPPING_SIZE);
> +	if (!dev->smu_base)
> +		return -ENOMEM;
> +
> +	dev->regbase = ioremap(base_addr + AMD_PMC_BASE_ADDR_OFFSET, AMD_PMC_MAPPING_SIZE);
> +	if (!dev->regbase)

You need to iounmap(dev->regbase); here before returning an error.

> +		return -ENOMEM;
> +
> +	amd_pmc_dump_registers(dev);
> +
> +	platform_set_drvdata(pdev, dev);
> +	amd_pmc_dbgfs_register(dev);
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_remove(struct platform_device *pdev)
> +{
> +	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
> +
> +	amd_pmc_dbgfs_unregister(dev);
> +	platform_set_drvdata(pdev, NULL);

The driver core sets drvdata to NULL itself after calling
the remove callback, so you can drop the
platform_set_drvdata(pdev, NULL) call.

> +	iounmap(dev->regbase);
> +	iounmap(dev->smu_base);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id amd_pmc_acpi_ids[] = {
> +	{"AMDI0005", 0},
> +	{"AMD0004", 0},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_pmc_acpi_ids);
> +
> +static struct platform_driver amd_pmc_driver = {
> +	.driver = {
> +		.name = "amd_pmc",
> +		.acpi_match_table = ACPI_PTR(amd_pmc_acpi_ids),
> +		.pm = &amd_pmc_pm_ops,
> +	},
> +	.probe = amd_pmc_probe,
> +	.remove = amd_pmc_remove,
> +};
> +
> +module_platform_driver(amd_pmc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("AMD PMC Driver");
> diff --git a/drivers/platform/x86/amd-pmc.h b/drivers/platform/x86/amd-pmc.h
> new file mode 100644
> index 000000000000..8cd7821af505
> --- /dev/null
> +++ b/drivers/platform/x86/amd-pmc.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * AMD SoC Power Management Controller Driver
> + *
> + * Copyright (c) 2020, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#ifndef AMD_PMC_H
> +#define AMD_PMC_H
> +
> +#include <linux/bits.h>
> +
> +/* SMU Communcation Registers */
> +#define AMD_PMC_REGISTER_RESPONSE	0x980
> +#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
> +#define AMD_PMC_REGISTER_MESSAGE	0x538
> +
> +/* Base address of SMU for mapping physical address to virtual address */
> +#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
> +#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
> +#define AMD_PMC_BASE_ADDR_HI_MASK	0xFFF00000L
> +#define AMD_PMC_BASE_ADDR_LO_MASK	0x0000FFFFL
> +#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
> +#define AMD_PMC_MAPPING_SIZE		0x01000
> +#define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
> +#define AMD_PMC_SMU_INDEX_DATA		0xBC
> +
> +/* SMU Response Codes */
> +#define AMD_PMC_RESULT_OK                    0x1
> +#define AMD_PMC_RESULT_FAILED                0xFF
> +#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
> +#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
> +#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
> +
> +#define PMC_MSG_DELAY_MIN		100
> +#define PMC_MSG_DELAY_MAX		200
> +#define AMD_CPU_ID_RV			0x15d0
> +#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
> +#define AMD_CPU_ID_RN			0x1630
> +#define AMD_SMU_FW_VERSION		0x0
> +
> +#define RESPONSE_REGISTER_LOOP_MAX	20
> +
> +enum amd_pmc_def {
> +	msg_test = 0x01,
> +	msg_os_hint_pco,
> +	msg_os_hint_rn,
> +};
> +
> +struct amd_pmc_dev {
> +	u32 base_addr;
> +	u32 cpu_id;
> +	void __iomem *regbase;
> +	void __iomem *smu_base;
> +	struct device *dev;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry *dbgfs_dir;
> +#endif /* CONFIG_DEBUG_FS */
> +};
> +
> +#endif /* AMD_PMC_H */
> 

Regards,

Hans

