Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137A5C433E9
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 18:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFC0723A9C
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 18:19:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbhAVSTi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Jan 2021 13:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36185 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729142AbhAVPp6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Jan 2021 10:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611330256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IKa/1H0k0uEX+VHVaZ8oM8RUOXh/M7cLFXqomHCTVS0=;
        b=gI+Trg0hIbk0OmlejJiiBDE7uzMpSMzOD3mpFlGIvqXqr93dIfgStOwp1KYhjoWnAzXW9g
        JgT8EVNj2lAaZ2zfs2BSiSzqxBNWuVBqCpKXPUpsb7TklEFX4mD7+h7NZAlaF17La2v335
        YgSSzomDZ0bmecyjfImGidR+ryO0jO4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-Z8-LQE1tOmmTf4vNBJG7pA-1; Fri, 22 Jan 2021 10:44:14 -0500
X-MC-Unique: Z8-LQE1tOmmTf4vNBJG7pA-1
Received: by mail-ed1-f70.google.com with SMTP id 32so3099407edy.22
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Jan 2021 07:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IKa/1H0k0uEX+VHVaZ8oM8RUOXh/M7cLFXqomHCTVS0=;
        b=TNc3eKkyMrzqjo4mqeY5JLzhuN/5j7T4iL5PWHOwDclcorbxMd8K93c7z/G2tEdTrF
         C4FcFgPyfa87oaTtKUx7UVYD6YpI9SfodXcFs5gJQfAkf8PKvnl4wA0NyAHoJxlGmlZ5
         3g1u+7m8kpi3Y9sD311KfVMjfUw0QsmglghLxTgY7iQA5f5Nx+JLsevFhRv0uNXx3kmw
         TSIdLTVX/PiU9BNPDuFVtHTQkrutJMNYWc+rPqZqPey3gFXlpsq7Yjxl02Ln0ZXyIFRY
         6l5fcmRFdc9c7p2Os7TWUJYn6IsKRsIulSASTy/Pl2L1RQD4rFOGrVVxEjsr1R9NjVqg
         qPJA==
X-Gm-Message-State: AOAM531mV5DUHkX/0wqIkl6rH5u59i3Wh7OQjJV2OstS0YuN6FfsTewY
        AHJOYJIZwFioa61ALBMnyQZK/HrBVcngNuAoAlqvV/kyYfUUxL3ward7zD7p8ByEy62mDuOo2+v
        44Kn2Vp7TffC3HR+5yXd5OPnUw7R84e5X5Q==
X-Received: by 2002:aa7:ca55:: with SMTP id j21mr201776edt.172.1611330252808;
        Fri, 22 Jan 2021 07:44:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwecJ8vFpbfXBlVcD3MFsSC/LhqHJpqXTwA++0faUJ7fHU2arwc9l57U9YQDkYWmJwGWqsszg==
X-Received: by 2002:aa7:ca55:: with SMTP id j21mr201761edt.172.1611330252615;
        Fri, 22 Jan 2021 07:44:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id l16sm5618565edw.10.2021.01.22.07.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 07:44:12 -0800 (PST)
Subject: Re: [PATCH v1] platform/x86: intel_mid_powerbtn: Remove driver for
 deprecated platform
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
References: <20210122114145.38813-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5b7a5176-225a-22e3-e5f0-1de255bd0f80@redhat.com>
Date:   Fri, 22 Jan 2021 16:44:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122114145.38813-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 1/22/21 12:41 PM, Andy Shevchenko wrote:
> Intel Moorestown and Medfield are quite old Intel Atom based
> 32-bit platforms, which were in limited use in some Android phones,
> tablets and consumer electronics more than eight years ago.
> 
> There are no bugs or problems ever reported outside from Intel
> for breaking any of that platforms for years. It seems no real
> users exists who run more or less fresh kernel on it. The commit
> 05f4434bc130 ("ASoC: Intel: remove mfld_machine") also in align
> with this theory.
> 
> Due to above and to reduce a burden of supporting outdated drivers
> we remove the support of outdated platforms completely.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

I take it that this patch and the similar intel_mid_thermal
patch are ready for merging?

Regards,

Hans


> ---
>  drivers/platform/x86/Kconfig              |   8 -
>  drivers/platform/x86/Makefile             |   1 -
>  drivers/platform/x86/intel_mid_powerbtn.c | 233 ----------------------
>  3 files changed, 242 deletions(-)
>  delete mode 100644 drivers/platform/x86/intel_mid_powerbtn.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 3ba680af3ef5..4a5798a0ce0c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1327,14 +1327,6 @@ config INTEL_CHTDC_TI_PWRBTN
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called intel_chtdc_ti_pwrbtn.
>  
> -config INTEL_MID_POWER_BUTTON
> -	tristate "power button driver for Intel MID platforms"
> -	depends on INTEL_SCU && INPUT
> -	help
> -	  This driver handles the power button on the Intel MID platforms.
> -
> -	  If unsure, say N.
> -
>  config INTEL_MRFLD_PWRBTN
>  	tristate "Intel Merrifield Basin Cove power button driver"
>  	depends on INTEL_SOC_PMIC_MRFLD
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 6fb57502b59a..728ccc226a29 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -137,7 +137,6 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
>  # Intel PMIC / PMC / P-Unit devices
>  obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
>  obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
> -obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
>  obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
>  obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o
>  obj-$(CONFIG_INTEL_PMT_CLASS)		+= intel_pmt_class.o
> diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
> deleted file mode 100644
> index df434abbb66f..000000000000
> --- a/drivers/platform/x86/intel_mid_powerbtn.c
> +++ /dev/null
> @@ -1,233 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Power button driver for Intel MID platforms.
> - *
> - * Copyright (C) 2010,2017 Intel Corp
> - *
> - * Author: Hong Liu <hong.liu@intel.com>
> - * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> - */
> -
> -#include <linux/input.h>
> -#include <linux/interrupt.h>
> -#include <linux/mfd/intel_msic.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm_wakeirq.h>
> -#include <linux/slab.h>
> -
> -#include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
> -#include <asm/intel_scu_ipc.h>
> -
> -#define DRIVER_NAME "msic_power_btn"
> -
> -#define MSIC_PB_LEVEL	(1 << 3) /* 1 - release, 0 - press */
> -
> -/*
> - * MSIC document ti_datasheet defines the 1st bit reg 0x21 is used to mask
> - * power button interrupt
> - */
> -#define MSIC_PWRBTNM    (1 << 0)
> -
> -/* Intel Tangier */
> -#define BCOVE_PB_LEVEL		(1 << 4)	/* 1 - release, 0 - press */
> -
> -/* Basin Cove PMIC */
> -#define BCOVE_PBIRQ		0x02
> -#define BCOVE_IRQLVL1MSK	0x0c
> -#define BCOVE_PBIRQMASK		0x0d
> -#define BCOVE_PBSTATUS		0x27
> -
> -struct mid_pb_ddata {
> -	struct device *dev;
> -	int irq;
> -	struct input_dev *input;
> -	unsigned short mirqlvl1_addr;
> -	unsigned short pbstat_addr;
> -	u8 pbstat_mask;
> -	struct intel_scu_ipc_dev *scu;
> -	int (*setup)(struct mid_pb_ddata *ddata);
> -};
> -
> -static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
> -{
> -	struct input_dev *input = ddata->input;
> -	int ret;
> -	u8 pbstat;
> -
> -	ret = intel_scu_ipc_dev_ioread8(ddata->scu, ddata->pbstat_addr,
> -					&pbstat);
> -	if (ret)
> -		return ret;
> -
> -	dev_dbg(input->dev.parent, "PB_INT status= %d\n", pbstat);
> -
> -	*value = !(pbstat & ddata->pbstat_mask);
> -	return 0;
> -}
> -
> -static int mid_irq_ack(struct mid_pb_ddata *ddata)
> -{
> -	return intel_scu_ipc_dev_update(ddata->scu, ddata->mirqlvl1_addr, 0,
> -					MSIC_PWRBTNM);
> -}
> -
> -static int mrfld_setup(struct mid_pb_ddata *ddata)
> -{
> -	/* Unmask the PBIRQ and MPBIRQ on Tangier */
> -	intel_scu_ipc_dev_update(ddata->scu, BCOVE_PBIRQ, 0, MSIC_PWRBTNM);
> -	intel_scu_ipc_dev_update(ddata->scu, BCOVE_PBIRQMASK, 0, MSIC_PWRBTNM);
> -
> -	return 0;
> -}
> -
> -static irqreturn_t mid_pb_isr(int irq, void *dev_id)
> -{
> -	struct mid_pb_ddata *ddata = dev_id;
> -	struct input_dev *input = ddata->input;
> -	int value = 0;
> -	int ret;
> -
> -	ret = mid_pbstat(ddata, &value);
> -	if (ret < 0) {
> -		dev_err(input->dev.parent,
> -			"Read error %d while reading MSIC_PB_STATUS\n", ret);
> -	} else {
> -		input_event(input, EV_KEY, KEY_POWER, value);
> -		input_sync(input);
> -	}
> -
> -	mid_irq_ack(ddata);
> -	return IRQ_HANDLED;
> -}
> -
> -static const struct mid_pb_ddata mfld_ddata = {
> -	.mirqlvl1_addr	= INTEL_MSIC_IRQLVL1MSK,
> -	.pbstat_addr	= INTEL_MSIC_PBSTATUS,
> -	.pbstat_mask	= MSIC_PB_LEVEL,
> -};
> -
> -static const struct mid_pb_ddata mrfld_ddata = {
> -	.mirqlvl1_addr	= BCOVE_IRQLVL1MSK,
> -	.pbstat_addr	= BCOVE_PBSTATUS,
> -	.pbstat_mask	= BCOVE_PB_LEVEL,
> -	.setup	= mrfld_setup,
> -};
> -
> -static const struct x86_cpu_id mid_pb_cpu_ids[] = {
> -	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SALTWELL_MID,	&mfld_ddata),
> -	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_MID,	&mrfld_ddata),
> -	{}
> -};
> -
> -static int mid_pb_probe(struct platform_device *pdev)
> -{
> -	const struct x86_cpu_id *id;
> -	struct mid_pb_ddata *ddata;
> -	struct input_dev *input;
> -	int irq = platform_get_irq(pdev, 0);
> -	int error;
> -
> -	id = x86_match_cpu(mid_pb_cpu_ids);
> -	if (!id)
> -		return -ENODEV;
> -
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", irq);
> -		return irq;
> -	}
> -
> -	input = devm_input_allocate_device(&pdev->dev);
> -	if (!input)
> -		return -ENOMEM;
> -
> -	input->name = pdev->name;
> -	input->phys = "power-button/input0";
> -	input->id.bustype = BUS_HOST;
> -	input->dev.parent = &pdev->dev;
> -
> -	input_set_capability(input, EV_KEY, KEY_POWER);
> -
> -	ddata = devm_kmemdup(&pdev->dev, (void *)id->driver_data,
> -			     sizeof(*ddata), GFP_KERNEL);
> -	if (!ddata)
> -		return -ENOMEM;
> -
> -	ddata->dev = &pdev->dev;
> -	ddata->irq = irq;
> -	ddata->input = input;
> -
> -	if (ddata->setup) {
> -		error = ddata->setup(ddata);
> -		if (error)
> -			return error;
> -	}
> -
> -	ddata->scu = devm_intel_scu_ipc_dev_get(&pdev->dev);
> -	if (!ddata->scu)
> -		return -EPROBE_DEFER;
> -
> -	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mid_pb_isr,
> -					  IRQF_ONESHOT, DRIVER_NAME, ddata);
> -	if (error) {
> -		dev_err(&pdev->dev,
> -			"Unable to request irq %d for MID power button\n", irq);
> -		return error;
> -	}
> -
> -	error = input_register_device(input);
> -	if (error) {
> -		dev_err(&pdev->dev,
> -			"Unable to register input dev, error %d\n", error);
> -		return error;
> -	}
> -
> -	platform_set_drvdata(pdev, ddata);
> -
> -	/*
> -	 * SCU firmware might send power button interrupts to IA core before
> -	 * kernel boots and doesn't get EOI from IA core. The first bit of
> -	 * MSIC reg 0x21 is kept masked, and SCU firmware doesn't send new
> -	 * power interrupt to Android kernel. Unmask the bit when probing
> -	 * power button in kernel.
> -	 * There is a very narrow race between irq handler and power button
> -	 * initialization. The race happens rarely. So we needn't worry
> -	 * about it.
> -	 */
> -	error = mid_irq_ack(ddata);
> -	if (error) {
> -		dev_err(&pdev->dev,
> -			"Unable to clear power button interrupt, error: %d\n",
> -			error);
> -		return error;
> -	}
> -
> -	device_init_wakeup(&pdev->dev, true);
> -	dev_pm_set_wake_irq(&pdev->dev, irq);
> -
> -	return 0;
> -}
> -
> -static int mid_pb_remove(struct platform_device *pdev)
> -{
> -	dev_pm_clear_wake_irq(&pdev->dev);
> -	device_init_wakeup(&pdev->dev, false);
> -
> -	return 0;
> -}
> -
> -static struct platform_driver mid_pb_driver = {
> -	.driver = {
> -		.name = DRIVER_NAME,
> -	},
> -	.probe	= mid_pb_probe,
> -	.remove	= mid_pb_remove,
> -};
> -
> -module_platform_driver(mid_pb_driver);
> -
> -MODULE_AUTHOR("Hong Liu <hong.liu@intel.com>");
> -MODULE_DESCRIPTION("Intel MID Power Button Driver");
> -MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:" DRIVER_NAME);
> 

