Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE02FC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 13:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbiG0N6G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 09:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbiG0N6C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 09:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E52723E75D
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658930279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C76nUvUga+hbNCZrrvFVOV2YSHtt/qxjHp6ZnEAxJYk=;
        b=ZUhl5bkcIb/c2zMM6vUZJcfFDFWhryVrSs6E6rXAurtGquU3WLqPZH+Ki5TXFNDZPCwiys
        2P1cqdnnL8C9BYR2seBAzgfTsaMOIIEjiQ2YitUDViheo75yvvynhj94UfiFSum22TRHlv
        0nYMsaZkw+dcRpkb1F07HGvR7qHsobk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-9pK9f6PHPEGtSFus8Bryow-1; Wed, 27 Jul 2022 09:57:58 -0400
X-MC-Unique: 9pK9f6PHPEGtSFus8Bryow-1
Received: by mail-ed1-f71.google.com with SMTP id q16-20020a056402519000b0043bd73ad1baso8144411edd.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 06:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C76nUvUga+hbNCZrrvFVOV2YSHtt/qxjHp6ZnEAxJYk=;
        b=dpqiTzFtllDWz6vjgU04yhho4z4c3C0qdntNa04Fb88CKrJHum4cuukCl3ZuJQpjRX
         M0OsGLTJGOOKsQ3FxKwPUG2vYz0ycIeSv96OeVg2sk6hSqgUHoWdqU/v+xu66vnSXOLQ
         MQ+Ry5YiY/N6q0uvnzlaIr2eiql2DirMq0B5uDc4Ed9oKy5qGcWGWZ08CVqRBKfN7AZP
         KcEnBt7RLzg3GEN2bQ2QpyHOmjYfExZhhSYecNwYjNK0bCMagtILX/ytJLjO2LgtIih4
         kd9/14mHyGgOpi8UU1NWtao187F/LOyFYzWk3yjhQ/P/RjJ8nR62phDqvMZzplr8EXHU
         2DyA==
X-Gm-Message-State: AJIora+BfI3QyoqB//ug9ZMIwTzy0X/5A8VqdOAMHBF2Y/qcSFJxeyUS
        G3JDBy1wcMXENzRcObyHdF66bJjVsmLBEwCVKSywXeqMvEbNSeJ4MpXsG6NaqxZlNEEl8J5vfLD
        eL8zIwkzZZ8gQPS6hyixUmeiUys2yCrpP5g==
X-Received: by 2002:a17:907:72d1:b0:72b:6da5:9bb with SMTP id du17-20020a17090772d100b0072b6da509bbmr17279304ejc.681.1658930276715;
        Wed, 27 Jul 2022 06:57:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unWSB9NF2MEvF/oOpHLvU6IT7BHY5vT1VAxuzPvNW3HGP8Izee/v7o09fRLTlLtwxTdYadPA==
X-Received: by 2002:a17:907:72d1:b0:72b:6da5:9bb with SMTP id du17-20020a17090772d100b0072b6da509bbmr17279289ejc.681.1658930276308;
        Wed, 27 Jul 2022 06:57:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906310b00b00722fc0779e3sm7541210ejx.85.2022.07.27.06.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 06:57:55 -0700 (PDT)
Message-ID: <b1e1c0bd-b515-c54e-f4e5-0df74d6d41af@redhat.com>
Date:   Wed, 27 Jul 2022 15:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/15] platform/x86/amd/pmf: Add support for PMF core
 layer
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> PMF core layer is meant to abstract the common functionalities
> across PMF features. This layer also does the plumbing work
> like setting up the mailbox channel for the communication
> between the PMF driver and the PMFW (Power Management Firmware)
> running on the SMU.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/amd/Kconfig      |   2 +
>  drivers/platform/x86/amd/Makefile     |   1 +
>  drivers/platform/x86/amd/pmf/Kconfig  |  16 ++
>  drivers/platform/x86/amd/pmf/Makefile |   8 +
>  drivers/platform/x86/amd/pmf/core.c   | 235 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h    |  47 ++++++
>  6 files changed, 309 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
>  create mode 100644 drivers/platform/x86/amd/pmf/Makefile
>  create mode 100644 drivers/platform/x86/amd/pmf/core.c
>  create mode 100644 drivers/platform/x86/amd/pmf/pmf.h
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c0d0a3c5170c..a825af8126c8 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -3,6 +3,8 @@
>  # AMD x86 Platform Specific Drivers
>  #
>  
> +source "drivers/platform/x86/amd/pmf/Kconfig"
> +
>  config AMD_PMC
>  	tristate "AMD SoC PMC driver"
>  	depends on ACPI && PCI && RTC_CLASS
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index a03fbb08e808..2c229198e24c 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -8,3 +8,4 @@ amd-pmc-y			:= pmc.o
>  obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
>  amd_hsmp-y			:= hsmp.o
>  obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> +obj-$(CONFIG_AMD_PMF)		+= pmf/
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> new file mode 100644
> index 000000000000..2a5f72419515
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# AMD PMF Driver
> +#
> +
> +config AMD_PMF
> +	tristate "AMD Platform Management Framework"
> +	depends on ACPI
> +	help
> +	  This driver provides support for the AMD Platform Management Framework.
> +	  The goal is to enhance end user experience by making AMD PCs smarter,
> +	  quiter, power efficient by adapting to user behavior and environment.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called amd_pmf.
> +
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> new file mode 100644
> index 000000000000..459005f659e5
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/x86/amd/pmf
> +# AMD Platform Management Framework
> +#
> +
> +obj-$(CONFIG_AMD_PMF) += amd-pmf.o
> +amd-pmf-objs := core.o
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> new file mode 100644
> index 000000000000..aef97965c181
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -0,0 +1,235 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Driver
> + *
> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include "pmf.h"
> +
> +/* PMF-SMU communication registers */
> +#define AMD_PMF_REGISTER_MESSAGE	0xA18
> +#define AMD_PMF_REGISTER_RESPONSE	0xA78
> +#define AMD_PMF_REGISTER_ARGUMENT	0xA58
> +
> +/* Base address of SMU for mapping physical address to virtual address */
> +#define AMD_PMF_SMU_INDEX_ADDRESS	0xB8
> +#define AMD_PMF_SMU_INDEX_DATA		0xBC
> +#define AMD_PMF_MAPPING_SIZE		0x01000
> +#define AMD_PMF_BASE_ADDR_OFFSET	0x10000
> +#define AMD_PMF_BASE_ADDR_LO		0x13B102E8
> +#define AMD_PMF_BASE_ADDR_HI		0x13B102EC
> +#define AMD_PMF_BASE_ADDR_LO_MASK	GENMASK(15, 0)
> +#define AMD_PMF_BASE_ADDR_HI_MASK	GENMASK(31, 20)
> +
> +/* SMU Response Codes */
> +#define AMD_PMF_RESULT_OK                    0x01
> +#define AMD_PMF_RESULT_CMD_REJECT_BUSY       0xFC
> +#define AMD_PMF_RESULT_CMD_REJECT_PREREQ     0xFD
> +#define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
> +#define AMD_PMF_RESULT_FAILED                0xFF
> +
> +/* List of supported CPU ids */
> +#define AMD_CPU_ID_PS			0x14e8
> +
> +#define PMF_MSG_DELAY_MIN_US		50
> +#define RESPONSE_REGISTER_LOOP_MAX	20000
> +
> +#define DELAY_MIN_US	2000
> +#define DELAY_MAX_US	3000
> +
> +static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
> +{
> +	return ioread32(dev->regbase + reg_offset);
> +}
> +
> +static inline void amd_pmf_reg_write(struct amd_pmf_dev *dev, int reg_offset, u32 val)
> +{
> +	iowrite32(val, dev->regbase + reg_offset);
> +}
> +
> +static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
> +{
> +	u32 value;
> +
> +	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_RESPONSE);
> +	dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
> +
> +	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
> +	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
> +
> +	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_MESSAGE);
> +	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
> +}
> +
> +int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data)
> +{
> +	int rc;
> +	u32 val;
> +
> +	mutex_lock(&dev->lock);
> +
> +	/* Wait until we get a valid response */
> +	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
> +				val, val != 0, PMF_MSG_DELAY_MIN_US,
> +				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +	if (rc) {
> +		dev_err(dev->dev, "failed to talk to SMU\n");
> +		goto out_unlock;
> +	}
> +
> +	/* Write zero to response register */
> +	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_RESPONSE, 0);
> +
> +	/* Write argument into argument register */
> +	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_ARGUMENT, arg);
> +
> +	/* Write message ID to message ID register */
> +	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_MESSAGE, message);
> +
> +	/* Wait until we get a valid response */
> +	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
> +				val, val != 0, PMF_MSG_DELAY_MIN_US,
> +				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +	if (rc) {
> +		dev_err(dev->dev, "SMU response timed out\n");
> +		goto out_unlock;
> +	}
> +
> +	switch (val) {
> +	case AMD_PMF_RESULT_OK:
> +		if (get) {
> +			/* PMFW may take longer time to return back the data */
> +			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
> +			*data = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
> +		}
> +		break;
> +	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
> +		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
> +		rc = -EBUSY;
> +		goto out_unlock;
> +	case AMD_PMF_RESULT_CMD_UNKNOWN:
> +		dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
> +		rc = -EINVAL;
> +		goto out_unlock;
> +	case AMD_PMF_RESULT_CMD_REJECT_PREREQ:
> +	case AMD_PMF_RESULT_FAILED:
> +	default:
> +		dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
> +		rc = -EIO;
> +		goto out_unlock;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&dev->lock);
> +	amd_pmf_dump_registers(dev);
> +	return rc;
> +}
> +
> +static const struct pci_device_id pmf_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
> +	{ }
> +};
> +
> +static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> +	{"AMDI0102", 0},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
> +
> +static int amd_pmf_probe(struct platform_device *pdev)
> +{
> +	struct amd_pmf_dev *dev;
> +	struct pci_dev *rdev;
> +	u32 base_addr_lo;
> +	u32 base_addr_hi;
> +	u64 base_addr;
> +	u32 val;
> +	int err;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->dev = &pdev->dev;
> +
> +	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
> +		pci_dev_put(rdev);
> +		return -ENODEV;
> +	}
> +
> +	dev->cpu_id = rdev->device;
> +	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_LO);
> +	if (err) {
> +		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
> +		pci_dev_put(rdev);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
> +	if (err) {
> +		pci_dev_put(rdev);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
> +
> +	err = pci_write_config_dword(rdev, AMD_PMF_SMU_INDEX_ADDRESS, AMD_PMF_BASE_ADDR_HI);
> +	if (err) {
> +		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMF_SMU_INDEX_ADDRESS);
> +		pci_dev_put(rdev);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	err = pci_read_config_dword(rdev, AMD_PMF_SMU_INDEX_DATA, &val);
> +	if (err) {
> +		pci_dev_put(rdev);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	base_addr_hi = val & AMD_PMF_BASE_ADDR_LO_MASK;
> +	pci_dev_put(rdev);
> +	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
> +
> +	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMF_BASE_ADDR_OFFSET,
> +				    AMD_PMF_MAPPING_SIZE);
> +	if (!dev->regbase)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dev);
> +
> +	mutex_init(&dev->lock);
> +	dev_info(dev->dev, "registered PMF device successfully\n");
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_remove(struct platform_device *pdev)
> +{
> +	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
> +
> +	mutex_destroy(&dev->lock);
> +	kfree(dev->buf);
> +	return 0;
> +}
> +
> +static struct platform_driver amd_pmf_driver = {
> +	.driver = {
> +		.name = "amd-pmf",
> +		.acpi_match_table = amd_pmf_acpi_ids,
> +	},
> +	.probe = amd_pmf_probe,
> +	.remove = amd_pmf_remove,
> +};
> +module_platform_driver(amd_pmf_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> new file mode 100644
> index 000000000000..ab773aa5a6e1
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Platform Management Framework Driver
> + *
> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +#ifndef PMF_H
> +#define PMF_H
> +
> +/* Message Definitions */
> +#define SET_SPL				0x03 /* SPL: Sustained Power Limit */
> +#define SET_SPPT			0x05 /* SPPT: Slow Package Power Tracking */
> +#define SET_FPPT			0x07 /* FPPT: Fast Package Power Tracking */
> +#define GET_SPL				0x0B
> +#define GET_SPPT			0x0D
> +#define GET_FPPT			0x0F
> +#define SET_DRAM_ADDR_HIGH	0x14
> +#define SET_DRAM_ADDR_LOW	0x15
> +#define SET_TRANSFER_TABLE	0x16
> +#define SET_STT_MIN_LIMIT	0x18 /* STT: Skin Temperature Tracking */
> +#define SET_STT_LIMIT_APU	0x19
> +#define SET_STT_LIMIT_HS2	0x1A
> +#define SET_SPPT_APU_ONLY	0x1D
> +#define GET_SPPT_APU_ONLY	0x1E
> +#define GET_STT_MIN_LIMIT	0x1F
> +#define GET_STT_LIMIT_APU	0x20
> +#define GET_STT_LIMIT_HS2	0x21
> +
> +struct amd_pmf_dev {
> +	void __iomem *regbase;
> +	void __iomem *smu_virt_addr;
> +	void *buf;
> +	u32 base_addr;
> +	u32 cpu_id;
> +	u32 hi;
> +	u32 low;
> +	struct device *dev;
> +	struct mutex lock; /* protects the PMF interface */
> +};
> +
> +/* Core Layer */
> +int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
> +
> +#endif /* PMF_H */

