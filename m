Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B351CC433E6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:32:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72D0822583
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732277AbhAYUc0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 15:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48662 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731997AbhAYUcT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 15:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611606651;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bQoNhMPfZB98VNGD+MvdHYw3qVbuKuod6qyrMS6hPxs=;
        b=QOvLH5yNfcdB0tINDWuP9Bsk+tV83+vIFkYoZkZlyKd+wU/5K3itK0d2YTAVAvbF+CbstT
        owKkkrhGBLMOKO9rTNZTMQEPHD3PoEAo8LR4UvQhnkAGOyT5i6Tqe10794W28iK0Ij5f81
        N3iai3SnADrVoVVBfXZpVLA6mzenJuo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-8LQoYHl8OwiuqWsNPxaJvA-1; Mon, 25 Jan 2021 15:30:48 -0500
X-MC-Unique: 8LQoYHl8OwiuqWsNPxaJvA-1
Received: by mail-ed1-f69.google.com with SMTP id m16so8117241edd.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 12:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bQoNhMPfZB98VNGD+MvdHYw3qVbuKuod6qyrMS6hPxs=;
        b=TYD12NFGGRdatz040rlxoKY57c4v4q1p3iC6wgMWR5NZvkBHL0CFgaRqIDKvGrIM8o
         cEQG+t1dwoHxhwnHMQn+AIvIfYDzw6jaOr2C3JBpl0uBdb/APEEj0ThK6xQhyHmP0kM9
         q0j9j83aDMQM7rcWt2BR18H9Vv5pHCwPXkZ7MRxpky8LUKR015FK3N1643bmBMpE7pO8
         L2ypZrp4HePJ9JKL9i5VeV7sT/icPJur50HT8pTsXb7znoA2OWHFAuD8mld1Q15WtMOi
         OxfA9mZ3FfZ6HMk0kiwbAj9OVhSiYXCNWi2ljC9mAQHSOVcaeS3g6wsMkBHQ1XUl5RXA
         yaIA==
X-Gm-Message-State: AOAM530VEpYC+CEz+JsoRHkHQLcm59kscAYPknCo2YzmOqx7uRBiAD2N
        wRNQoz/s+kg1iyNxdVnh8KogVlsh7lT/TzNedp+geaRHnbBuklbN5Hb9eBpGKNR4WwPJ+D3fHZt
        WcnxQ3IZjiVhSjrb4LxNpLA7tf+ARQVHezw==
X-Received: by 2002:a17:907:a052:: with SMTP id gz18mr1403266ejc.15.1611606647186;
        Mon, 25 Jan 2021 12:30:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy97qvdXY7UHgLhxeG1nno3PBNeQJP7Nqezru36oqJlPy+X8FeGl9oBDrbkuKm0LJ1ya5MRng==
X-Received: by 2002:a17:907:a052:: with SMTP id gz18mr1403254ejc.15.1611606646866;
        Mon, 25 Jan 2021 12:30:46 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id f22sm8833583eje.34.2021.01.25.12.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 12:30:46 -0800 (PST)
Subject: Re: [PATCH v1] platform/x86: intel_mid_thermal: Remove driver for
 deprecated platform
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
References: <20210122114227.39102-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <588cbe4f-2d74-6763-6510-a38fe6e71d9c@redhat.com>
Date:   Mon, 25 Jan 2021 21:30:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122114227.39102-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/22/21 12:42 PM, Andy Shevchenko wrote:
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

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/Kconfig             |   7 -
>  drivers/platform/x86/Makefile            |   1 -
>  drivers/platform/x86/intel_mid_thermal.c | 560 -----------------------
>  3 files changed, 568 deletions(-)
>  delete mode 100644 drivers/platform/x86/intel_mid_thermal.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 91e6176cdfbd..3ba680af3ef5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1327,13 +1327,6 @@ config INTEL_CHTDC_TI_PWRBTN
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called intel_chtdc_ti_pwrbtn.
>  
> -config INTEL_MFLD_THERMAL
> -       tristate "Thermal driver for Intel Medfield platform"
> -       depends on MFD_INTEL_MSIC && THERMAL
> -       help
> -         Say Y here to enable thermal driver support for the  Intel Medfield
> -         platform.
> -
>  config INTEL_MID_POWER_BUTTON
>  	tristate "power button driver for Intel MID platforms"
>  	depends on INTEL_SCU && INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 581475f59819..6fb57502b59a 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -137,7 +137,6 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
>  # Intel PMIC / PMC / P-Unit devices
>  obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
>  obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
> -obj-$(CONFIG_INTEL_MFLD_THERMAL)	+= intel_mid_thermal.o
>  obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
>  obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
>  obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o
> diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
> deleted file mode 100644
> index f12f4e7bd971..000000000000
> --- a/drivers/platform/x86/intel_mid_thermal.c
> +++ /dev/null
> @@ -1,560 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Intel MID platform thermal driver
> - *
> - * Copyright (C) 2011 Intel Corporation
> - *
> - * Author: Durgadoss R <durgadoss.r@intel.com>
> - */
> -
> -#define pr_fmt(fmt) "intel_mid_thermal: " fmt
> -
> -#include <linux/device.h>
> -#include <linux/err.h>
> -#include <linux/mfd/intel_msic.h>
> -#include <linux/module.h>
> -#include <linux/param.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm.h>
> -#include <linux/slab.h>
> -#include <linux/thermal.h>
> -
> -/* Number of thermal sensors */
> -#define MSIC_THERMAL_SENSORS	4
> -
> -/* ADC1 - thermal registers */
> -#define MSIC_ADC_ENBL		0x10
> -#define MSIC_ADC_START		0x08
> -
> -#define MSIC_ADCTHERM_ENBL	0x04
> -#define MSIC_ADCRRDATA_ENBL	0x05
> -#define MSIC_CHANL_MASK_VAL	0x0F
> -
> -#define MSIC_STOPBIT_MASK	16
> -#define MSIC_ADCTHERM_MASK	4
> -/* Number of ADC channels */
> -#define ADC_CHANLS_MAX		15
> -#define ADC_LOOP_MAX		(ADC_CHANLS_MAX - MSIC_THERMAL_SENSORS)
> -
> -/* ADC channel code values */
> -#define SKIN_SENSOR0_CODE	0x08
> -#define SKIN_SENSOR1_CODE	0x09
> -#define SYS_SENSOR_CODE		0x0A
> -#define MSIC_DIE_SENSOR_CODE	0x03
> -
> -#define SKIN_THERM_SENSOR0	0
> -#define SKIN_THERM_SENSOR1	1
> -#define SYS_THERM_SENSOR2	2
> -#define MSIC_DIE_THERM_SENSOR3	3
> -
> -/* ADC code range */
> -#define ADC_MAX			977
> -#define ADC_MIN			162
> -#define ADC_VAL0C		887
> -#define ADC_VAL20C		720
> -#define ADC_VAL40C		508
> -#define ADC_VAL60C		315
> -
> -/* ADC base addresses */
> -#define ADC_CHNL_START_ADDR	INTEL_MSIC_ADC1ADDR0	/* increments by 1 */
> -#define ADC_DATA_START_ADDR	INTEL_MSIC_ADC1SNS0H	/* increments by 2 */
> -
> -/* MSIC die attributes */
> -#define MSIC_DIE_ADC_MIN	488
> -#define MSIC_DIE_ADC_MAX	1004
> -
> -/* This holds the address of the first free ADC channel,
> - * among the 15 channels
> - */
> -static int channel_index;
> -
> -struct platform_info {
> -	struct platform_device *pdev;
> -	struct thermal_zone_device *tzd[MSIC_THERMAL_SENSORS];
> -};
> -
> -struct thermal_device_info {
> -	unsigned int chnl_addr;
> -	int direct;
> -	/* This holds the current temperature in millidegree celsius */
> -	long curr_temp;
> -};
> -
> -/**
> - * to_msic_die_temp - converts adc_val to msic_die temperature
> - * @adc_val: ADC value to be converted
> - *
> - * Can sleep
> - */
> -static int to_msic_die_temp(uint16_t adc_val)
> -{
> -	return (368 * (adc_val) / 1000) - 220;
> -}
> -
> -/**
> - * is_valid_adc - checks whether the adc code is within the defined range
> - * @min: minimum value for the sensor
> - * @max: maximum value for the sensor
> - *
> - * Can sleep
> - */
> -static int is_valid_adc(uint16_t adc_val, uint16_t min, uint16_t max)
> -{
> -	return (adc_val >= min) && (adc_val <= max);
> -}
> -
> -/**
> - * adc_to_temp - converts the ADC code to temperature in C
> - * @direct: true if ths channel is direct index
> - * @adc_val: the adc_val that needs to be converted
> - * @tp: temperature return value
> - *
> - * Linear approximation is used to covert the skin adc value into temperature.
> - * This technique is used to avoid very long look-up table to get
> - * the appropriate temp value from ADC value.
> - * The adc code vs sensor temp curve is split into five parts
> - * to achieve very close approximate temp value with less than
> - * 0.5C error
> - */
> -static int adc_to_temp(int direct, uint16_t adc_val, int *tp)
> -{
> -	int temp;
> -
> -	/* Direct conversion for die temperature */
> -	if (direct) {
> -		if (is_valid_adc(adc_val, MSIC_DIE_ADC_MIN, MSIC_DIE_ADC_MAX)) {
> -			*tp = to_msic_die_temp(adc_val) * 1000;
> -			return 0;
> -		}
> -		return -ERANGE;
> -	}
> -
> -	if (!is_valid_adc(adc_val, ADC_MIN, ADC_MAX))
> -		return -ERANGE;
> -
> -	/* Linear approximation for skin temperature */
> -	if (adc_val > ADC_VAL0C)
> -		temp = 177 - (adc_val/5);
> -	else if ((adc_val <= ADC_VAL0C) && (adc_val > ADC_VAL20C))
> -		temp = 111 - (adc_val/8);
> -	else if ((adc_val <= ADC_VAL20C) && (adc_val > ADC_VAL40C))
> -		temp = 92 - (adc_val/10);
> -	else if ((adc_val <= ADC_VAL40C) && (adc_val > ADC_VAL60C))
> -		temp = 91 - (adc_val/10);
> -	else
> -		temp = 112 - (adc_val/6);
> -
> -	/* Convert temperature in celsius to milli degree celsius */
> -	*tp = temp * 1000;
> -	return 0;
> -}
> -
> -/**
> - * mid_read_temp - read sensors for temperature
> - * @temp: holds the current temperature for the sensor after reading
> - *
> - * reads the adc_code from the channel and converts it to real
> - * temperature. The converted value is stored in temp.
> - *
> - * Can sleep
> - */
> -static int mid_read_temp(struct thermal_zone_device *tzd, int *temp)
> -{
> -	struct thermal_device_info *td_info = tzd->devdata;
> -	uint16_t adc_val, addr;
> -	uint8_t data = 0;
> -	int ret;
> -	int curr_temp;
> -
> -	addr = td_info->chnl_addr;
> -
> -	/* Enable the msic for conversion before reading */
> -	ret = intel_msic_reg_write(INTEL_MSIC_ADC1CNTL3, MSIC_ADCRRDATA_ENBL);
> -	if (ret)
> -		return ret;
> -
> -	/* Re-toggle the RRDATARD bit (temporary workaround) */
> -	ret = intel_msic_reg_write(INTEL_MSIC_ADC1CNTL3, MSIC_ADCTHERM_ENBL);
> -	if (ret)
> -		return ret;
> -
> -	/* Read the higher bits of data */
> -	ret = intel_msic_reg_read(addr, &data);
> -	if (ret)
> -		return ret;
> -
> -	/* Shift bits to accommodate the lower two data bits */
> -	adc_val = (data << 2);
> -	addr++;
> -
> -	ret = intel_msic_reg_read(addr, &data);/* Read lower bits */
> -	if (ret)
> -		return ret;
> -
> -	/* Adding lower two bits to the higher bits */
> -	data &= 03;
> -	adc_val += data;
> -
> -	/* Convert ADC value to temperature */
> -	ret = adc_to_temp(td_info->direct, adc_val, &curr_temp);
> -	if (ret == 0)
> -		*temp = td_info->curr_temp = curr_temp;
> -	return ret;
> -}
> -
> -/**
> - * configure_adc - enables/disables the ADC for conversion
> - * @val: zero: disables the ADC non-zero:enables the ADC
> - *
> - * Enable/Disable the ADC depending on the argument
> - *
> - * Can sleep
> - */
> -static int configure_adc(int val)
> -{
> -	int ret;
> -	uint8_t data;
> -
> -	ret = intel_msic_reg_read(INTEL_MSIC_ADC1CNTL1, &data);
> -	if (ret)
> -		return ret;
> -
> -	if (val) {
> -		/* Enable and start the ADC */
> -		data |= (MSIC_ADC_ENBL | MSIC_ADC_START);
> -	} else {
> -		/* Just stop the ADC */
> -		data &= (~MSIC_ADC_START);
> -	}
> -	return intel_msic_reg_write(INTEL_MSIC_ADC1CNTL1, data);
> -}
> -
> -/**
> - * set_up_therm_channel - enable thermal channel for conversion
> - * @base_addr: index of free msic ADC channel
> - *
> - * Enable all the three channels for conversion
> - *
> - * Can sleep
> - */
> -static int set_up_therm_channel(u16 base_addr)
> -{
> -	int ret;
> -
> -	/* Enable all the sensor channels */
> -	ret = intel_msic_reg_write(base_addr, SKIN_SENSOR0_CODE);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_msic_reg_write(base_addr + 1, SKIN_SENSOR1_CODE);
> -	if (ret)
> -		return ret;
> -
> -	ret = intel_msic_reg_write(base_addr + 2, SYS_SENSOR_CODE);
> -	if (ret)
> -		return ret;
> -
> -	/* Since this is the last channel, set the stop bit
> -	 * to 1 by ORing the DIE_SENSOR_CODE with 0x10 */
> -	ret = intel_msic_reg_write(base_addr + 3,
> -			(MSIC_DIE_SENSOR_CODE | 0x10));
> -	if (ret)
> -		return ret;
> -
> -	/* Enable ADC and start it */
> -	return configure_adc(1);
> -}
> -
> -/**
> - * reset_stopbit - sets the stop bit to 0 on the given channel
> - * @addr: address of the channel
> - *
> - * Can sleep
> - */
> -static int reset_stopbit(uint16_t addr)
> -{
> -	int ret;
> -	uint8_t data;
> -	ret = intel_msic_reg_read(addr, &data);
> -	if (ret)
> -		return ret;
> -	/* Set the stop bit to zero */
> -	return intel_msic_reg_write(addr, (data & 0xEF));
> -}
> -
> -/**
> - * find_free_channel - finds an empty channel for conversion
> - *
> - * If the ADC is not enabled then start using 0th channel
> - * itself. Otherwise find an empty channel by looking for a
> - * channel in which the stopbit is set to 1. returns the index
> - * of the first free channel if succeeds or an error code.
> - *
> - * Context: can sleep
> - *
> - * FIXME: Ultimately the channel allocator will move into the intel_scu_ipc
> - * code.
> - */
> -static int find_free_channel(void)
> -{
> -	int ret;
> -	int i;
> -	uint8_t data;
> -
> -	/* check whether ADC is enabled */
> -	ret = intel_msic_reg_read(INTEL_MSIC_ADC1CNTL1, &data);
> -	if (ret)
> -		return ret;
> -
> -	if ((data & MSIC_ADC_ENBL) == 0)
> -		return 0;
> -
> -	/* ADC is already enabled; Looking for an empty channel */
> -	for (i = 0; i < ADC_CHANLS_MAX; i++) {
> -		ret = intel_msic_reg_read(ADC_CHNL_START_ADDR + i, &data);
> -		if (ret)
> -			return ret;
> -
> -		if (data & MSIC_STOPBIT_MASK) {
> -			ret = i;
> -			break;
> -		}
> -	}
> -	return (ret > ADC_LOOP_MAX) ? (-EINVAL) : ret;
> -}
> -
> -/**
> - * mid_initialize_adc - initializing the ADC
> - * @dev: our device structure
> - *
> - * Initialize the ADC for reading thermistor values. Can sleep.
> - */
> -static int mid_initialize_adc(struct device *dev)
> -{
> -	u8  data;
> -	u16 base_addr;
> -	int ret;
> -
> -	/*
> -	 * Ensure that adctherm is disabled before we
> -	 * initialize the ADC
> -	 */
> -	ret = intel_msic_reg_read(INTEL_MSIC_ADC1CNTL3, &data);
> -	if (ret)
> -		return ret;
> -
> -	data &= ~MSIC_ADCTHERM_MASK;
> -	ret = intel_msic_reg_write(INTEL_MSIC_ADC1CNTL3, data);
> -	if (ret)
> -		return ret;
> -
> -	/* Index of the first channel in which the stop bit is set */
> -	channel_index = find_free_channel();
> -	if (channel_index < 0) {
> -		dev_err(dev, "No free ADC channels");
> -		return channel_index;
> -	}
> -
> -	base_addr = ADC_CHNL_START_ADDR + channel_index;
> -
> -	if (!(channel_index == 0 || channel_index == ADC_LOOP_MAX)) {
> -		/* Reset stop bit for channels other than 0 and 12 */
> -		ret = reset_stopbit(base_addr);
> -		if (ret)
> -			return ret;
> -
> -		/* Index of the first free channel */
> -		base_addr++;
> -		channel_index++;
> -	}
> -
> -	ret = set_up_therm_channel(base_addr);
> -	if (ret) {
> -		dev_err(dev, "unable to enable ADC");
> -		return ret;
> -	}
> -	dev_dbg(dev, "ADC initialization successful");
> -	return ret;
> -}
> -
> -/**
> - * initialize_sensor - sets default temp and timer ranges
> - * @index: index of the sensor
> - *
> - * Context: can sleep
> - */
> -static struct thermal_device_info *initialize_sensor(int index)
> -{
> -	struct thermal_device_info *td_info =
> -		kzalloc(sizeof(struct thermal_device_info), GFP_KERNEL);
> -
> -	if (!td_info)
> -		return NULL;
> -
> -	/* Set the base addr of the channel for this sensor */
> -	td_info->chnl_addr = ADC_DATA_START_ADDR + 2 * (channel_index + index);
> -	/* Sensor 3 is direct conversion */
> -	if (index == 3)
> -		td_info->direct = 1;
> -	return td_info;
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -/**
> - * mid_thermal_resume - resume routine
> - * @dev: device structure
> - *
> - * mid thermal resume: re-initializes the adc. Can sleep.
> - */
> -static int mid_thermal_resume(struct device *dev)
> -{
> -	return mid_initialize_adc(dev);
> -}
> -
> -/**
> - * mid_thermal_suspend - suspend routine
> - * @dev: device structure
> - *
> - * mid thermal suspend implements the suspend functionality
> - * by stopping the ADC. Can sleep.
> - */
> -static int mid_thermal_suspend(struct device *dev)
> -{
> -	/*
> -	 * This just stops the ADC and does not disable it.
> -	 * temporary workaround until we have a generic ADC driver.
> -	 * If 0 is passed, it disables the ADC.
> -	 */
> -	return configure_adc(0);
> -}
> -#endif
> -
> -static SIMPLE_DEV_PM_OPS(mid_thermal_pm,
> -			 mid_thermal_suspend, mid_thermal_resume);
> -
> -/**
> - * read_curr_temp - reads the current temperature and stores in temp
> - * @temp: holds the current temperature value after reading
> - *
> - * Can sleep
> - */
> -static int read_curr_temp(struct thermal_zone_device *tzd, int *temp)
> -{
> -	WARN_ON(tzd == NULL);
> -	return mid_read_temp(tzd, temp);
> -}
> -
> -/* Can't be const */
> -static struct thermal_zone_device_ops tzd_ops = {
> -	.get_temp = read_curr_temp,
> -};
> -
> -/**
> - * mid_thermal_probe - mfld thermal initialize
> - * @pdev: platform device structure
> - *
> - * mid thermal probe initializes the hardware and registers
> - * all the sensors with the generic thermal framework. Can sleep.
> - */
> -static int mid_thermal_probe(struct platform_device *pdev)
> -{
> -	static char *name[MSIC_THERMAL_SENSORS] = {
> -		"skin0", "skin1", "sys", "msicdie"
> -	};
> -
> -	int ret;
> -	int i;
> -	struct platform_info *pinfo;
> -
> -	pinfo = devm_kzalloc(&pdev->dev, sizeof(struct platform_info),
> -			     GFP_KERNEL);
> -	if (!pinfo)
> -		return -ENOMEM;
> -
> -	/* Initializing the hardware */
> -	ret = mid_initialize_adc(&pdev->dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "ADC init failed");
> -		return ret;
> -	}
> -
> -	/* Register each sensor with the generic thermal framework*/
> -	for (i = 0; i < MSIC_THERMAL_SENSORS; i++) {
> -		struct thermal_device_info *td_info = initialize_sensor(i);
> -
> -		if (!td_info) {
> -			ret = -ENOMEM;
> -			goto err;
> -		}
> -		pinfo->tzd[i] = thermal_zone_device_register(name[i],
> -				0, 0, td_info, &tzd_ops, NULL, 0, 0);
> -		if (IS_ERR(pinfo->tzd[i])) {
> -			kfree(td_info);
> -			ret = PTR_ERR(pinfo->tzd[i]);
> -			goto err;
> -		}
> -		ret = thermal_zone_device_enable(pinfo->tzd[i]);
> -		if (ret) {
> -			kfree(td_info);
> -			thermal_zone_device_unregister(pinfo->tzd[i]);
> -			goto err;
> -		}
> -	}
> -
> -	pinfo->pdev = pdev;
> -	platform_set_drvdata(pdev, pinfo);
> -	return 0;
> -
> -err:
> -	while (--i >= 0) {
> -		kfree(pinfo->tzd[i]->devdata);
> -		thermal_zone_device_unregister(pinfo->tzd[i]);
> -	}
> -	configure_adc(0);
> -	return ret;
> -}
> -
> -/**
> - * mid_thermal_remove - mfld thermal finalize
> - * @dev: platform device structure
> - *
> - * MLFD thermal remove unregisters all the sensors from the generic
> - * thermal framework. Can sleep.
> - */
> -static int mid_thermal_remove(struct platform_device *pdev)
> -{
> -	int i;
> -	struct platform_info *pinfo = platform_get_drvdata(pdev);
> -
> -	for (i = 0; i < MSIC_THERMAL_SENSORS; i++) {
> -		kfree(pinfo->tzd[i]->devdata);
> -		thermal_zone_device_unregister(pinfo->tzd[i]);
> -	}
> -
> -	/* Stop the ADC */
> -	return configure_adc(0);
> -}
> -
> -#define DRIVER_NAME "msic_thermal"
> -
> -static const struct platform_device_id therm_id_table[] = {
> -	{ DRIVER_NAME, 1 },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(platform, therm_id_table);
> -
> -static struct platform_driver mid_thermal_driver = {
> -	.driver = {
> -		.name = DRIVER_NAME,
> -		.pm = &mid_thermal_pm,
> -	},
> -	.probe = mid_thermal_probe,
> -	.remove = mid_thermal_remove,
> -	.id_table = therm_id_table,
> -};
> -
> -module_platform_driver(mid_thermal_driver);
> -
> -MODULE_AUTHOR("Durgadoss R <durgadoss.r@intel.com>");
> -MODULE_DESCRIPTION("Intel Medfield Platform Thermal Driver");
> -MODULE_LICENSE("GPL v2");
> 

