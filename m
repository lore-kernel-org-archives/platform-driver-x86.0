Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E5EC00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 12:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbiHAMzH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 08:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbiHAMyu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 08:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 096602AD4
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659358236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eZsvfuihd7UvjaucOqeQvkx4SM3QcY2Gi3T2vzknAQs=;
        b=XSK/w3JKHPoKWMWCoVz4PDdW5B6nZVbRZ70wDbr3YFv0kVBrRWCNC1mlddPVdPM0SdLCTe
        nu8KaydXAruVs6Lpq1RhqbA6ypW2KutX1ACyQ2xNFW2Jo9qp1tpjKowBe6VnFZr+WG2OCC
        35itYy0wnUrZ0xMFHOzNCCxGqet0ugg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-K0USUWhlN2WOvmsoE2excA-1; Mon, 01 Aug 2022 08:50:35 -0400
X-MC-Unique: K0USUWhlN2WOvmsoE2excA-1
Received: by mail-ej1-f72.google.com with SMTP id hr24-20020a1709073f9800b0072b57c28438so2927266ejc.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 05:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eZsvfuihd7UvjaucOqeQvkx4SM3QcY2Gi3T2vzknAQs=;
        b=i9aPSn+2PXSWabpF4voAcuIfxxTXzOmIoohYGUUdIHMT8PvSSMiF8+gJ+FuFnd6RtP
         Gq/6pycQC0Z8w9Ps32tiIBwzsQsJo1MsXyn7Aj/MFxBBpiM+dMShGr9jvaNAGEz537jE
         t/VWmVVxMPGr9Eoc44yt4MZeQDAt35nofFyfPCIEP10nsTDsFKefohMfRSpp8c/FueXx
         JhKrrKBY4WsxZQkqHFNusfT4BcQnHayLGSQA9zwOp/fVYNb9M2fKFvqRZTFaGvUNyEa4
         +epYyZGvtHEJ/RItHmF/DDjyt4wXhZJKadoMg51qKNiGR1aRflE+Ff3sO2CFC/cgNeYY
         FChw==
X-Gm-Message-State: AJIora+WyqpDpGuCbGkhjzDy5vEvq6nRt7hCn9BG6lbZdn7GrsvlfUu+
        Hrl95gbwqQy17HEUi4PqrxPbV6OYCQDLlh38MT5B0L5hxKSa+0+3Q6aw6nT7IXjUCsZ3GDH4fp9
        uRIyiCacEV5rtJvL7rbtji0UieTI344HEVg==
X-Received: by 2002:a05:6402:4507:b0:43b:b8df:571d with SMTP id ez7-20020a056402450700b0043bb8df571dmr15704177edb.230.1659358233529;
        Mon, 01 Aug 2022 05:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vyC8Yyf7MkX2g3juP9B7adCPkb9d7lJB3fD2/p+Ih4GIy9rHCKT9cTVi15kO+WHrZKAJnP0w==
X-Received: by 2002:a05:6402:4507:b0:43b:b8df:571d with SMTP id ez7-20020a056402450700b0043bb8df571dmr15704156edb.230.1659358233291;
        Mon, 01 Aug 2022 05:50:33 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d2-20020a1709067f0200b0072ee0976aa2sm5096269ejr.222.2022.08.01.05.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 05:50:32 -0700 (PDT)
Message-ID: <332c33e7-aa72-7e28-fd7a-dea211a67fb3@redhat.com>
Date:   Mon, 1 Aug 2022 14:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 03/11] platform/x86/amd/pmf: Add support SPS PMF
 feature
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-4-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

On 7/28/22 20:20, Shyam Sundar S K wrote:
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
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>  drivers/platform/x86/amd/pmf/acpi.c   |   8 ++
>  drivers/platform/x86/amd/pmf/core.c   |  26 +++++
>  drivers/platform/x86/amd/pmf/pmf.h    |  64 +++++++++++
>  drivers/platform/x86/amd/pmf/sps.c    | 152 ++++++++++++++++++++++++++
>  5 files changed, 251 insertions(+), 1 deletion(-)
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
> index bd796d7e1d96..41abd8680d8d 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -98,6 +98,7 @@ static int apmf_if_call_store_buffer(struct apmf_if *apmf_if, int func, void *de
>  static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>  {
>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
> +	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;

I just noticed that this is not correct, this should be:

	func->system_params = mask & BIT(APMF_FUNC_... - 1);

Which does something completely different!

Also this information is duplicated by:

is_apmf_func_supported(APMF_FUNC_...) so please drop the apmf_if_functions
struct completely and use is_apmf_func_supported() everywhere.

Regards,

Hans

>  }
>  
>  int is_apmf_func_supported(unsigned long index)
> @@ -106,6 +107,13 @@ int is_apmf_func_supported(unsigned long index)
>  	return ((supported_func & (1 << (index - 1))) != 0);
>  }
>  
> +int apmf_get_static_slider_granular(struct apmf_if *apmf_if,
> +				    struct apmf_static_slider_granular_output *data)
> +{
> +	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_STATIC_SLIDER_GRANULAR,
> +									data, sizeof(*data));
> +}
> +
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>  {
>  	struct apmf_verify_interface output;
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index c5002b7bb904..b6006e8ee1a1 100644
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
> +	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +		amd_pmf_init_sps(dev);
> +		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
> +	}
> +}
> +
> +static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
> +{
> +	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
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
> index 08c6bc0e2b42..30740a5cd30d 100644
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
> @@ -36,9 +38,12 @@
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
>  
> +#define ARG_NONE 0
> +
>  /* AMD PMF BIOS interfaces */
>  struct apmf_if_functions {
>  	bool system_params;
> +	bool static_slider_granular;
>  };
>  
>  struct apmf_if {
> @@ -60,6 +65,30 @@ struct apmf_system_params {
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
> @@ -68,11 +97,46 @@ struct amd_pmf_dev {
>  	u32 cpu_id;
>  	struct device *dev;
>  	struct apmf_if *apmf_if;
> +	enum platform_profile_option current_profile;
> +	struct platform_profile_handler pprof;
>  	struct mutex lock; /* protects the PMF interface */
>  };
>  
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
> +};
> +
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
> +int is_apmf_func_supported(unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
> +int amd_pmf_get_power_source(void);
> +
> +/* SPS Layer */
> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> +void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
> +			   struct amd_pmf_static_slider_granular *table);
> +int amd_pmf_init_sps(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
> +int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
> +				    struct apmf_static_slider_granular_output *output);
> +void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>  
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> new file mode 100644
> index 000000000000..2601adbfe14a
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -0,0 +1,152 @@
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
> +{
> +	struct apmf_static_slider_granular_output output;
> +	int i, j, idx = 0;
> +
> +	memset(&config_store, 0, sizeof(config_store));
> +
> +	if (dev->apmf_if->func.static_slider_granular) {
> +		apmf_get_static_slider_granular(dev->apmf_if, &output);
> +
> +		for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +			for (j = 0; j < POWER_MODE_MAX; j++) {
> +				config_store.prop[i][j].spl = output.prop[idx].spl;
> +				config_store.prop[i][j].sppt = output.prop[idx].sppt;
> +				config_store.prop[i][j].sppt_apu_only =
> +							output.prop[idx].sppt_apu_only;
> +				config_store.prop[i][j].fppt = output.prop[idx].fppt;
> +				config_store.prop[i][j].stt_min = output.prop[idx].stt_min;
> +				config_store.prop[i][j].stt_skin_temp[STT_TEMP_APU] =
> +						output.prop[idx].stt_skin_temp[STT_TEMP_APU];
> +				config_store.prop[i][j].stt_skin_temp[STT_TEMP_HS2] =
> +						output.prop[idx].stt_skin_temp[STT_TEMP_HS2];
> +				config_store.prop[i][j].fan_id = output.prop[idx].fan_id;
> +				idx++;
> +			}
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
> +
> +	return err;
> +}
> +
> +void amd_pmf_deinit_sps(struct amd_pmf_dev *dev)
> +{
> +	platform_profile_remove();
> +}

