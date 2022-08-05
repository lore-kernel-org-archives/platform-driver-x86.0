Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D0C00140
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Aug 2022 10:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbiHEKjY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Aug 2022 06:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232506AbiHEKjX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Aug 2022 06:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1ABB4BD2C
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Aug 2022 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659695960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JdL6bru+pjvqwYyo9nSJFiQmk6r0xFoB2LvT9l9qMOY=;
        b=XqCSzib/rcwHanKgKSMBu+x91JVpyboWEglHWuz0h1xo10xxTV+PU+o3gS2uZrYqEZ315q
        +HXxZdFVZZkTptDhB53NNSy5LCDP6gsoWaxbtQPUnTNB4VyRmTYgMME0rEVau7zD+u3A8j
        qHum8Q7crDiw7a56mYOcDjD3+JJ5aUQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-xAhRbwBsPpO8CMvUUd7SGw-1; Fri, 05 Aug 2022 06:39:17 -0400
X-MC-Unique: xAhRbwBsPpO8CMvUUd7SGw-1
Received: by mail-ed1-f72.google.com with SMTP id t13-20020a056402524d00b0043db1fbefdeso1383703edd.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Aug 2022 03:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JdL6bru+pjvqwYyo9nSJFiQmk6r0xFoB2LvT9l9qMOY=;
        b=HndEJGBabqnn6AHgUXjsMWvE0OBWTGf0NjGzF5rn1wbNckqmTOqHKL18uLso4wmGqn
         0yYyb7Irdlsn0+5LqcB4U2liOAngUWtGTA7/OAuf2BKpH3TaqmvyII4swuDvIXAFX6c0
         NJVqr45Uyictz72hH8HhHzxyrHKQ/SG6wMFjCsOACu76mhSjtte7ZPCbQ4is+uXi9j3x
         iu3uRjtRRxFOUCVanJ3eQF1WoyKLJRAuu8YWZXLA9JMSTtC3b75/b0GoDboxCqDPeIDk
         ZgDcz1FudZYHI9HEY6AfaZUTn2SvS6YvqqrNC1yvF0ebr4EeRi+tlRVGlhzU2myrDrBK
         25Kw==
X-Gm-Message-State: ACgBeo2xugH/1QrK6i5PJdYkwGrj9aNkzEoSXXMAOBU3kN+zmqxNWErI
        HKPRcRUiuLN8/mz+uexhtfisYWuCDK/G58J6lUlhv15fJCRFyBBgv/oNrOHzWxitVm0In04wbkw
        boCsrU20scKI9jQlwwzZ59FUc5W8QsqNvwA==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id y12-20020a056402440c00b0043a1124e56amr6166441eda.134.1659695955944;
        Fri, 05 Aug 2022 03:39:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4n8aUJ5cSSnvsCFPfLUm4EObE+KLW1mTxswrvs5PSVB1tGVwQeVRq/s9sobHvrFjmyDzImww==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id y12-20020a056402440c00b0043a1124e56amr6166420eda.134.1659695955652;
        Fri, 05 Aug 2022 03:39:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00730b5a35288sm1390701eje.214.2022.08.05.03.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 03:39:15 -0700 (PDT)
Message-ID: <ccfecf97-45c1-cebd-5b19-63c0349a17b7@redhat.com>
Date:   Fri, 5 Aug 2022 12:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 03/11] platform/x86/amd/pmf: Add support SPS PMF
 feature
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
 <20220802151149.2123699-4-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802151149.2123699-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 17:11, Shyam Sundar S K wrote:
> SPS (a.k.a. Static Power Slider) gives a feel of Windows performance
> power slider for the Linux users, where the user selects a certain
> mode (like "balanced", "low-power" or "performance") and the thermals
> associated with each selected mode gets applied from the silicon
> side via the mailboxes defined through PMFW.
> 
> PMF driver hooks to platform_profile by reading the PMF ACPI fn9 to
> see if the support is being advertised by ACPI interface.
> 
> If supported, the PMF driver reacts to platform_profile selection choices
> made by the user and adjust the system thermal behavior.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>  drivers/platform/x86/amd/pmf/acpi.c   |  10 ++
>  drivers/platform/x86/amd/pmf/core.c   |  26 +++++
>  drivers/platform/x86/amd/pmf/pmf.h    |  64 +++++++++++
>  drivers/platform/x86/amd/pmf/sps.c    | 149 ++++++++++++++++++++++++++
>  5 files changed, 250 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/sps.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index 2617eba773ce..557521a80427 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -5,4 +5,4 @@
>  #
>  
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
> -amd-pmf-objs := core.o acpi.o
> +amd-pmf-objs := core.o acpi.o sps.o
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index b378f9e31194..5997ab724f3a 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -93,6 +93,16 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
>  	return !!(pdev->supported_func & BIT(index - 1));
>  }
>  
> +int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
> +				    struct apmf_static_slider_granular_output *data)
> +{
> +	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		return -EINVAL;
> +
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
> +									 data, sizeof(*data));
> +}
> +
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>  {
>  	struct apmf_verify_interface output;
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index c5002b7bb904..a70ab6c9608a 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/power_supply.h>
>  #include "pmf.h"
>  
>  /* PMF-SMU communication registers */
> @@ -45,6 +46,14 @@
>  #define DELAY_MIN_US	2000
>  #define DELAY_MAX_US	3000
>  
> +int amd_pmf_get_power_source(void)
> +{
> +	if (power_supply_is_system_supplied() > 0)
> +		return POWER_SOURCE_AC;
> +	else
> +		return POWER_SOURCE_DC;
> +}
> +
>  static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
>  {
>  	return ioread32(dev->regbase + reg_offset);
> @@ -138,6 +147,21 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> +static void amd_pmf_init_features(struct amd_pmf_dev *dev)
> +{
> +	/* Enable Static Slider */
> +	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +		amd_pmf_init_sps(dev);
> +		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
> +	}
> +}
> +
> +static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
> +{
> +	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		amd_pmf_deinit_sps(dev);
> +}
> +
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>  	{"AMDI0102", 0},
>  	{ }
> @@ -206,6 +230,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
> +	amd_pmf_init_features(dev);
>  
>  	mutex_init(&dev->lock);
>  	dev_info(dev->dev, "registered PMF device successfully\n");
> @@ -218,6 +243,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>  
>  	mutex_destroy(&dev->lock);
> +	amd_pmf_deinit_features(dev);
>  	kfree(dev->buf);
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index bdadbff168ee..5c867dac7d44 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,10 +12,12 @@
>  #define PMF_H
>  
>  #include <linux/acpi.h>
> +#include <linux/platform_profile.h>
>  
>  /* APMF Functions */
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
> +#define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>  
>  /* Message Definitions */
>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
> @@ -36,6 +38,8 @@
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
>  
> +#define ARG_NONE 0
> +
>  /* AMD PMF BIOS interfaces */
>  struct apmf_verify_interface {
>  	u16 size;
> @@ -51,6 +55,30 @@ struct apmf_system_params {
>  	u8 command_code;
>  } __packed;
>  
> +enum amd_stt_skin_temp {
> +	STT_TEMP_APU,
> +	STT_TEMP_HS2,
> +	STT_TEMP_COUNT,
> +};
> +
> +enum amd_slider_op {
> +	SLIDER_OP_GET,
> +	SLIDER_OP_SET,
> +};
> +
> +enum power_source {
> +	POWER_SOURCE_AC,
> +	POWER_SOURCE_DC,
> +	POWER_SOURCE_MAX,
> +};
> +
> +enum power_modes {
> +	POWER_MODE_PERFORMANCE,
> +	POWER_MODE_BALANCED_POWER,
> +	POWER_MODE_POWER_SAVER,
> +	POWER_MODE_MAX,
> +};
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -60,10 +88,46 @@ struct amd_pmf_dev {
>  	struct device *dev;
>  	struct mutex lock; /* protects the PMF interface */
>  	u32 supported_func;
> +	enum platform_profile_option current_profile;
> +	struct platform_profile_handler pprof;
> +};
> +
> +struct apmf_sps_prop_granular {
> +	u32 fppt;
> +	u32 sppt;
> +	u32 sppt_apu_only;
> +	u32 spl;
> +	u32 stt_min;
> +	u8 stt_skin_temp[STT_TEMP_COUNT];
> +	u32 fan_id;
> +} __packed;
> +
> +/* Static Slider */
> +struct apmf_static_slider_granular_output {
> +	u16 size;
> +	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX * POWER_MODE_MAX];
> +} __packed;
> +
> +struct amd_pmf_static_slider_granular {
> +	u16 size;
> +	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
>  };
>  
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
> +int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
> +int amd_pmf_get_power_source(void);
> +
> +/* SPS Layer */
> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> +void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
> +			   struct amd_pmf_static_slider_granular *table);
> +int amd_pmf_init_sps(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
> +int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
> +				    struct apmf_static_slider_granular_output *output);
> +void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
> +
>  
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> new file mode 100644
> index 000000000000..ef4df3fd774b
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework (PMF) Driver
> + *
> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include "pmf.h"
> +
> +static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
> +			       enum platform_profile_option *profile);
> +static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
> +			       enum platform_profile_option profile);
> +static struct amd_pmf_static_slider_granular config_store;
> +
> +void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)

This function is only used in this file, so it can be static,
I will fix this up while merging this.

> +{
> +	struct apmf_static_slider_granular_output output;
> +	int i, j, idx = 0;
> +
> +	memset(&config_store, 0, sizeof(config_store));
> +	apmf_get_static_slider_granular(dev, &output);
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		for (j = 0; j < POWER_MODE_MAX; j++) {
> +			config_store.prop[i][j].spl = output.prop[idx].spl;
> +			config_store.prop[i][j].sppt = output.prop[idx].sppt;
> +			config_store.prop[i][j].sppt_apu_only =
> +						output.prop[idx].sppt_apu_only;
> +			config_store.prop[i][j].fppt = output.prop[idx].fppt;
> +			config_store.prop[i][j].stt_min = output.prop[idx].stt_min;
> +			config_store.prop[i][j].stt_skin_temp[STT_TEMP_APU] =
> +					output.prop[idx].stt_skin_temp[STT_TEMP_APU];
> +			config_store.prop[i][j].stt_skin_temp[STT_TEMP_HS2] =
> +					output.prop[idx].stt_skin_temp[STT_TEMP_HS2];
> +			config_store.prop[i][j].fan_id = output.prop[idx].fan_id;
> +			idx++;
> +		}
> +	}
> +}
> +
> +void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
> +			   struct amd_pmf_static_slider_granular *table)
> +{
> +	int src = amd_pmf_get_power_source();
> +
> +	if (op == SLIDER_OP_SET) {
> +		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
> +		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
> +				 config_store.prop[src][idx].sppt_apu_only, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
> +				 config_store.prop[src][idx].stt_min, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
> +	} else if (op == SLIDER_OP_GET) {
> +		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &table->prop[src][idx].spl);
> +		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &table->prop[src][idx].fppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &table->prop[src][idx].sppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
> +				 &table->prop[src][idx].sppt_apu_only);
> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
> +				 &table->prop[src][idx].stt_min);
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
> +				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_APU]);
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
> +				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_HS2]);
> +	}
> +}
> +
> +static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
> +			       enum platform_profile_option *profile)
> +{
> +	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
> +
> +	*profile = pmf->current_profile;
> +	return 0;
> +}
> +
> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
> +{
> +	u8 mode;
> +
> +	switch (pmf->current_profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		mode = POWER_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		mode = POWER_MODE_BALANCED_POWER;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		mode = POWER_MODE_POWER_SAVER;
> +		break;
> +	default:
> +		dev_err(pmf->dev, "Unknown Platform Profile.\n");
> +		break;
> +	}
> +
> +	return mode;
> +}
> +
> +int amd_pmf_profile_set(struct platform_profile_handler *pprof,
> +			enum platform_profile_option profile)

This function is only used in this file, so it can be static
(it actually is declared static at the top of the file)
I will fix this up while merging this.

> +{
> +	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
> +	u8 mode;
> +
> +	pmf->current_profile = profile;
> +	mode = amd_pmf_get_pprof_modes(pmf);
> +	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
> +	return 0;
> +}
> +
> +int amd_pmf_init_sps(struct amd_pmf_dev *dev)
> +{
> +	int err = 0;
> +
> +	dev->pprof.profile_get = amd_pmf_profile_get;
> +	dev->pprof.profile_set = amd_pmf_profile_set;
> +
> +	/* Setup supported modes */
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, dev->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, dev->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, dev->pprof.choices);
> +
> +	/* Create platform_profile structure and register */
> +	err = platform_profile_register(&dev->pprof);
> +	if (err) {
> +		dev_err(dev->dev, "Failed to register SPS support, this is most likely an SBIOS bug: %d\n",
> +			err);
> +		return -EEXIST;
> +	}
> +
> +	dev->current_profile = PLATFORM_PROFILE_BALANCED;
> +	amd_pmf_load_defaults_sps(dev);

I just realized that there is a theoretical race here where
userspace can call amd_pmf_profile_set before
amd_pmf_load_defaults_sps() is finshed, so the
platform_profile_register() must be moved to the end of the
function. I will fix this up while merging this.

Regards,

Hans


> +
> +	return err;
> +}
> +
> +void amd_pmf_deinit_sps(struct amd_pmf_dev *dev)
> +{
> +	platform_profile_remove();
> +}

