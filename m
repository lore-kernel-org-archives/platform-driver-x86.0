Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC46C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 20:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiG0Uv2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 16:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiG0Uv2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 16:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6EF525073D
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658955085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n+OkOOUraNYfk0bsI0nZcR5MgMbn08m8BftKZgsWStY=;
        b=Wa8IrCQRgP4bTO4rap/FvrTuLaafF0tPgYFCSTzbfYjsIIDznksu6ERz/XdlXcnfOhHwmX
        tndReh8hMooFj8v10WmQd/n4bdsxEe1qYzsJW3G4NcezPqSB5jmVKcv0ofi+PXOBR1opty
        TfNQ95MeIWMMqy+sXI0mJNmnKILXiGM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-2lsi3escMP25hATbLXxAvA-1; Wed, 27 Jul 2022 16:51:24 -0400
X-MC-Unique: 2lsi3escMP25hATbLXxAvA-1
Received: by mail-ed1-f69.google.com with SMTP id o2-20020a056402438200b0043ccb3ed7dfso1026264edc.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n+OkOOUraNYfk0bsI0nZcR5MgMbn08m8BftKZgsWStY=;
        b=Zc7VYqyF1ovFNWsEVPtZYqxiz43mT9mLeK00LzCdiPF6YoeKGdMl/PNu2o83SfJikH
         5G+IoTlTtMCM9+tld2dlx9ojYevRTokX6aqRYVXUNfHcgcC2iovMlkoIIXveI7Uh1rvw
         8Avd7MYZ6q+09efNwYGav5IPwJ/rcMcqvktqUckliuE0V31TzphggQA9av+Qj8kVRjKY
         +4EJU89tPOHjpz+1dPTYoE16nqtBQqfunA8Kkv/0emfgbxCzmihQYcy752INdG1ONFCc
         jBNgoIrg/9l7SJlLfKLzvT2JlKY0pYAtixeO8LldpiNdoc7bV9l1oLgtpl+2rvtEu6EF
         FSwQ==
X-Gm-Message-State: AJIora8laumgvgw8bnI6FpffCUIvtJY/2rMrGhhx48UPlrNUbqdGOabC
        mLTOiCj8ZVSzxdGgXpBQX556QcvWmm/A1qnPKQA3cEfW3F2H4AovSpagZAuK+51X/6LZ0TejOZD
        eBxO5D+DECmeXUODVMfIluif1/vsBJe/uOQ==
X-Received: by 2002:a05:6402:3514:b0:43b:d87c:7a99 with SMTP id b20-20020a056402351400b0043bd87c7a99mr23917228edd.43.1658955082566;
        Wed, 27 Jul 2022 13:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vkFB7p5vE0+s2cz6E+gjJaCq7bN4PrdC6W6AAsrGPEZ9ZNt1aZstOtAWoEzhejy6Ou/vokuA==
X-Received: by 2002:a05:6402:3514:b0:43b:d87c:7a99 with SMTP id b20-20020a056402351400b0043bd87c7a99mr23917207edd.43.1658955082165;
        Wed, 27 Jul 2022 13:51:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g21-20020aa7c855000000b0043bd753174esm8499691edt.27.2022.07.27.13.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:51:21 -0700 (PDT)
Message-ID: <b49dd572-a62f-19c0-6ae2-e3c1a28fe180@redhat.com>
Date:   Wed, 27 Jul 2022 22:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 09/15] platform/x86/amd/pmf: Add support for CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-10-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-10-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> CnQF (a.k.a Cool and Quiet Framework) extends the static slider concept.
> PMF dynamically manages system power limits and fan policy based on system
> power trends which is representative of workload trend.
> 
> Static slider and CnQF controls are mutually exclusive for system power
> budget adjustments. CnQF supports configurable number of modes which can
> be unique for AC and DC. Every mode is representative of a system state
> characterized by unique steady state and boost behavior.
> 
> OEMs can configure the different modes/system states and how the
> transition to a mode happens. Whether to have CnQF manage system power
> budget dynamically in AC or DC or both is also configurable. Mode changes
> due to CnQF dont result in slider position change.
> 
> The default OEM values are obtained after evaluating the PMF ACPI function
> idx 11 & 12 for AC and DC respectively. Whether to turn ON/OFF by default
> is guided by a "flag" passed by the OEM BIOS.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   3 +-
>  drivers/platform/x86/amd/pmf/acpi.c   |  56 +++++
>  drivers/platform/x86/amd/pmf/cnqf.c   | 327 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |  14 ++
>  drivers/platform/x86/amd/pmf/pmf.h    | 115 +++++++++
>  5 files changed, 514 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index 557521a80427..d02a0bdc6429 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -5,4 +5,5 @@
>  #
>  
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
> -amd-pmf-objs := core.o acpi.o sps.o
> +amd-pmf-objs := core.o acpi.o sps.o \
> +		cnqf.o
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index e4822c6f4259..a3ff91c605b5 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -56,6 +56,8 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
> +	func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
> +	func->dyn_slider_dc = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_DC;
>  }
>  
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ampf_if)
> @@ -208,6 +210,60 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
>  	return err;
>  }
>  
> +int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data)
> +{
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(ampf_if, APMF_FUNC_DYN_SLIDER_GRANULAR_AC, NULL);
> +	if (!info)
> +		return -EIO;
> +
> +	size = *(u16 *)info->buffer.pointer;
> +
> +	if (size < sizeof(*data)) {
> +		pr_debug("buffer too small %zu\n", size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = min(sizeof(*data), size);
> +	memset(data, 0, sizeof(*data));
> +	memcpy(data, info->buffer.pointer, size);
> +
> +out:
> +	kfree(info);
> +	return err;
> +}

Please use the suggested:

int apmf_if_call_store_buffer(struct apmf_if *ampf_if, int func, void *dest, size_t dest_size);

here, see my review of patch 4/15.


> +
> +int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data)
> +{
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(ampf_if, APMF_FUNC_DYN_SLIDER_GRANULAR_DC, NULL);
> +	if (!info)
> +		return -EIO;
> +
> +	size = *(u16 *)info->buffer.pointer;
> +
> +	if (size < sizeof(*data)) {
> +		pr_debug("buffer too small %zu\n", size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = min(sizeof(*data), size);
> +	memset(data, 0, sizeof(*data));
> +	memcpy(data, info->buffer.pointer, size);
> +
> +out:
> +	kfree(info);
> +	return err;
> +}
> +

And for this you can use apmf_if_call_store_buffer() too.


>  static acpi_handle apmf_if_probe_handle(void)
>  {
>  	acpi_handle handle = NULL;
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> new file mode 100644
> index 000000000000..8c6756faab25
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework Driver
> + *
> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/workqueue.h>
> +#include "pmf.h"
> +
> +static struct cnqf_config config_store;
> +
> +static int amd_pmf_handle_cnqf(struct amd_pmf_dev *dev, bool op, int src, int idx,
> +			       struct cnqf_config *table)
> +{
> +	struct power_table_control *pc;
> +
> +	if (op == SLIDER_OP_SET) {
> +		pc = &config_store.mode_set[src][idx].power_control;
> +
> +		amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
> +		amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, pc->stt_skin_temp[STT_TEMP_APU],
> +				 NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, pc->stt_skin_temp[STT_TEMP_HS2],
> +				 NULL);
> +	} else if (op == SLIDER_OP_GET) {
> +		pc = &table->mode_set[src][idx].power_control;
> +
> +		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &pc->spl);
> +		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &pc->fppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &pc->sppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE, &pc->sppt_apu_only);
> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE, &pc->stt_min);
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
> +				 &pc->stt_skin_temp[STT_TEMP_APU]);
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
> +				 &pc->stt_skin_temp[STT_TEMP_HS2]);
> +	}
> +
> +	if (dev->apmf_if->func.fan_table_idx)
> +		apmf_update_fan_idx(dev->apmf_if,
> +				    config_store.mode_set[src][idx].fan_control.manual,
> +				    config_store.mode_set[src][idx].fan_control.fan_id);

This code sets the fan values, should this not be inside the
"if (op == SLIDER_OP_SET)" block ?

> +
> +	return 0;
> +}
> +
> +static void amd_pmf_update_power_threshold(void)
> +{
> +	struct cnqf_mode_settings *ts;
> +	struct cnqf_tran_params *tp;
> +	int i;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_QUIET];
> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_TURBO];
> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_QUIET];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_TURBO];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +	}
> +}
> +
> +static const char *state_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case CNQF_MODE_QUIET:
> +		return "QUIET";
> +	case CNQF_MODE_BALANCE:
> +		return "BALANCED";
> +	case CNQF_MODE_TURBO:
> +		return "TURBO";
> +	case CNQF_MODE_PERFORMANCE:
> +		return "PERFORMANCE";
> +	default:
> +		return "Unknown CnQF mode";
> +	}
> +}
> +
> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
> +{
> +	struct cnqf_tran_params *tp;
> +	int src, i, j, index = 0;
> +	u32 avg_power = 0;
> +
> +	src = amd_pmf_get_power_source();
> +
> +	if (!dev->cnqf_running) {
> +		pr_debug("setting CNQF thermals\n");
> +		amd_pmf_handle_cnqf(dev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
> +		dev->cnqf_running = true;
> +		return;
> +	}
> +
> +	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
> +		config_store.trans_param[src][i].timer += time_lapsed_ms;
> +		config_store.trans_param[src][i].total_power += socket_power;
> +		config_store.trans_param[src][i].count++;
> +
> +		tp = &config_store.trans_param[src][i];
> +		if (tp->timer >= tp->time_constant && tp->count) {
> +			avg_power = tp->total_power / tp->count;
> +
> +			/* Reset the indices */
> +			tp->timer = 0;
> +			tp->total_power = 0;
> +			tp->count = 0;
> +
> +			if ((tp->shifting_up && avg_power >= tp->power_threshold) ||
> +			    (!tp->shifting_up && avg_power <= tp->power_threshold)) {
> +				tp->priority = true;
> +			} else {
> +				tp->priority = false;
> +			}
> +		}
> +	}
> +
> +	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
> +		avg_power, socket_power, state_as_str(config_store.current_mode));
> +
> +	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
> +		/* apply the highest priority */
> +		index = config_store.trans_prio[j];
> +		if (config_store.trans_param[src][index].priority) {
> +			if (config_store.current_mode !=
> +			    config_store.trans_param[src][index].target_mode) {
> +				config_store.current_mode =
> +						config_store.trans_param[src][index].target_mode;
> +				dev_dbg(dev->dev, "Moving to Mode :%s\n",
> +					state_as_str(config_store.current_mode));
> +				amd_pmf_handle_cnqf(dev, SLIDER_OP_SET, src,
> +						    config_store.current_mode, NULL);
> +			}
> +			break;
> +		}
> +	}
> +}
> +
> +static void amd_pmf_update_trans_data(int idx, struct apmf_dyn_slider_output out)
> +{
> +	struct cnqf_tran_params *tp;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_QUIET];
> +	tp->time_constant = out.t_balanced_to_quiet;
> +	tp->target_mode = CNQF_MODE_QUIET;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
> +	tp->time_constant = out.t_balanced_to_perf;
> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
> +	tp->shifting_up = true;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
> +	tp->time_constant = out.t_quiet_to_balanced;
> +	tp->target_mode = CNQF_MODE_BALANCE;
> +	tp->shifting_up = true;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
> +	tp->time_constant = out.t_perf_to_balanced;
> +	tp->target_mode = CNQF_MODE_BALANCE;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
> +	tp->time_constant = out.t_turbo_to_perf;
> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_TURBO];
> +	tp->time_constant = out.t_perf_to_turbo;
> +	tp->target_mode = CNQF_MODE_TURBO;
> +	tp->shifting_up = true;
> +}
> +
> +static void amd_pmf_update_mode_set(int idx, struct apmf_dyn_slider_output out)
> +{
> +	struct cnqf_mode_settings *ms;
> +
> +	/* Quiet Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_QUIET];
> +	ms->power_floor = out.ps[APMF_CNQF_QUIET].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_QUIET].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_QUIET].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_QUIET].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_QUIET].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_QUIET].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_QUIET].fan_id;
> +
> +	/* Balance Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_BALANCE];
> +	ms->power_floor = out.ps[APMF_CNQF_BALANCE].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_BALANCE].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_BALANCE].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_BALANCE].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_BALANCE].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_BALANCE].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_BALANCE].fan_id;
> +
> +	/* Performance Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_PERFORMANCE];
> +	ms->power_floor = out.ps[APMF_CNQF_PERFORMANCE].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_PERFORMANCE].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_PERFORMANCE].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_PERFORMANCE].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_PERFORMANCE].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_PERFORMANCE].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_PERFORMANCE].fan_id;
> +
> +	/* Turbo Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_TURBO];
> +	ms->power_floor = out.ps[APMF_CNQF_TURBO].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_TURBO].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_TURBO].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_TURBO].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_TURBO].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_TURBO].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_TURBO].fan_id;
> +}
> +
> +static int amd_pmf_check_flags(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_dyn_slider_output out;

The apmf_get_dyn_slider_def_* calls can fail and then the
return value is uninitialized stack, please 0 this out:

	struct apmf_dyn_slider_output out = {};

> +
> +	if (dev->apmf_if->func.dyn_slider_ac)
> +		apmf_get_dyn_slider_def_ac(dev->apmf_if, &out);
> +	else if (dev->apmf_if->func.dyn_slider_dc)
> +		apmf_get_dyn_slider_def_dc(dev->apmf_if, &out);
> +
> +	return out.flags;
> +}
> +
> +void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_dyn_slider_output out;

The apmf_get_dyn_slider_def_* calls can fail and then the
uninitialized stack will get used for "out", please 0 this out:

	struct apmf_dyn_slider_output out = {};

> +	int i, j, ret;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		if (i == POWER_SOURCE_AC && dev->apmf_if->func.dyn_slider_ac) {
> +			ret = apmf_get_dyn_slider_def_ac(dev->apmf_if, &out);
> +			if (ret)
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_ac failed :%d\n", ret);
> +		} else if (i == POWER_SOURCE_DC && dev->apmf_if->func.dyn_slider_dc) {
> +			ret = apmf_get_dyn_slider_def_dc(dev->apmf_if, &out);
> +			if (ret)
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
> +		}

What if either the call fails ; or dyn_slider_dc or dyn_slider_ac is not set, then
output will contain all zeros, do we want to continue with that ?

Maybe CqNF support should be disabled if this happens?

> +
> +		amd_pmf_update_mode_set(i, out);
> +		amd_pmf_update_trans_data(i, out);
> +
> +		for (j = 0; j < CNQF_MODE_MAX; j++) {
> +			if (config_store.mode_set[i][j].fan_control.fan_id == FAN_INDEX_AUTO)
> +				config_store.mode_set[i][j].fan_control.manual = false;
> +			else
> +				config_store.mode_set[i][j].fan_control.manual = true;
> +		}
> +	}
> +	amd_pmf_update_power_threshold();
> +
> +	for (i = 0; i < CNQF_TRANSITION_MAX; i++)
> +		config_store.trans_prio[i] = i;
> +}
> +
> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
> +{
> +	cancel_delayed_work_sync(&dev->work_buffer);
> +}
> +
> +void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
> +{
> +	int ret, src;
> +
> +	ret = amd_pmf_check_flags(dev);
> +	if (!ret) {
> +		dev_dbg(dev->dev, "CnQF bios default_enable flag not set\n");
> +		return;
> +	}
> +
> +	dev->cnqf_feat = true;
> +	amd_pmf_load_defaults_cnqf(dev);
> +	amd_pmf_init_metrics_table(dev);
> +
> +	/* update the thermal for CnQF */
> +	src = amd_pmf_get_power_source();
> +	amd_pmf_handle_cnqf(dev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
> +}
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index c6fd52c46818..bc267d333b76 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -122,6 +122,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	/* Calculate the avg SoC power consumption */
>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>  
> +	if (dev->cnqf_feat) {
> +		/* Apply the CnQF transition */
> +		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> +	}
> +
>  	dev->start_time = ktime_to_ms(ktime_get());
>  	dev_dbg(dev->dev, "Metrics table sample size time:%d\n", metrics_table_loop_ms);
>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
> @@ -255,12 +260,21 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  		amd_pmf_init_sps(dev);
>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>  	}
> +	/* Enable Cool n Quiet Framework (CnQF) */
> +	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
> +	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC)) {
> +		amd_pmf_init_cnqf(dev);
> +		dev_dbg(dev->dev, "CnQF Init done\n");
> +	}
>  }
>  
>  static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  {
>  	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
>  		amd_pmf_deinit_sps(dev);
> +	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
> +	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC))
> +		amd_pmf_deinit_cnqf(dev);
>  }
>  
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 8f318ff59c2e..452266809dfa 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -20,6 +20,8 @@
>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
>  #define APMF_FUNC_SET_FAN_IDX				7
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
> +#define APMF_FUNC_DYN_SLIDER_GRANULAR_AC	11
> +#define APMF_FUNC_DYN_SLIDER_GRANULAR_DC	12
>  
>  /* Message Definitions */
>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
> @@ -51,6 +53,8 @@ struct apmf_if_functions {
>  	bool sbios_heartbeat;
>  	bool fan_table_idx;
>  	bool static_slider_granular;
> +	bool dyn_slider_ac;
> +	bool dyn_slider_dc;
>  };
>  
>  struct apmf_notification_cfg {
> @@ -163,6 +167,8 @@ struct amd_pmf_dev {
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
>  #endif /* CONFIG_DEBUG_FS */
> +	bool cnqf_feat;
> +	bool cnqf_running;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -191,6 +197,106 @@ struct fan_table_control {
>  	unsigned long fan_id;
>  };
>  
> +struct power_table_control {
> +	u32 spl;
> +	u32 sppt;
> +	u32 fppt;
> +	u32 sppt_apu_only;
> +	u32 stt_min;
> +	u32 stt_skin_temp[STT_TEMP_COUNT];
> +	u32 reserved[16];
> +};
> +
> +/* CnQF Layer */
> +enum cnqf_trans_priority {
> +	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
> +	CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE, /* quiet/balance to Performance Mode */
> +	CNQF_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
> +	CNQF_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
> +	CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance/Turbo to Balance Mode */
> +	CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE, /* Turbo mode to Performance Mode */
> +	CNQF_TRANSITION_MAX,
> +};
> +
> +enum cnqf_mode {
> +	CNQF_MODE_QUIET,
> +	CNQF_MODE_BALANCE,
> +	CNQF_MODE_PERFORMANCE,
> +	CNQF_MODE_TURBO,
> +	CNQF_MODE_MAX,
> +};
> +
> +enum apmf_cnqf_pos {
> +	APMF_CNQF_TURBO,
> +	APMF_CNQF_PERFORMANCE,
> +	APMF_CNQF_BALANCE,
> +	APMF_CNQF_QUIET,
> +	APMF_CNQF_MAX,
> +};
> +
> +struct cnqf_mode_settings {
> +	struct power_table_control power_control;
> +	struct fan_table_control fan_control;
> +	u32 power_floor;
> +	bool enable;
> +};
> +
> +struct cnqf_tran_params {
> +	u32 time_constant; /* minimum time required to switch to next mode */
> +	u32 power_delta; /* minimum power required to switch to next mode */
> +	u32 power_threshold;
> +	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
> +	u32 total_power;
> +	u32 count;
> +	bool enable;
> +	bool priority;
> +	bool shifting_up;
> +	enum cnqf_mode target_mode;
> +};
> +
> +struct cnqf_power_delta {
> +	u32 to_turbo;
> +	u32 balance_to_perf;
> +	u32 quiet_to_balance;
> +	u32 to_quiet;
> +	u32 perf_to_balance;
> +	u32 turbo_to_perf;
> +};
> +
> +struct cnqf_config {
> +	struct cnqf_tran_params trans_param[POWER_SOURCE_MAX][CNQF_TRANSITION_MAX];
> +	struct cnqf_mode_settings mode_set[POWER_SOURCE_MAX][CNQF_MODE_MAX];
> +	struct power_table_control defaults;
> +	enum cnqf_mode current_mode;
> +	struct cnqf_power_delta power_delta[POWER_SOURCE_MAX];
> +	u32 power_src;
> +	u32 avg_power;
> +	enum cnqf_trans_priority trans_prio[CNQF_TRANSITION_MAX];
> +};
> +
> +struct apmf_cnqf_power_set {
> +	u32 pfloor;
> +	u32 fppt;
> +	u32 sppt;
> +	u32 sppt_apu_only;
> +	u32 spl;
> +	u32 stt_min_limit;
> +	u8 stt_skintemp[STT_TEMP_COUNT];
> +	u32 fan_id;
> +} __packed;
> +
> +struct apmf_dyn_slider_output {
> +	u16 size;
> +	u16 flags;
> +	u32 t_perf_to_turbo;
> +	u32 t_balanced_to_perf;
> +	u32 t_quiet_to_balanced;
> +	u32 t_balanced_to_quiet;
> +	u32 t_perf_to_balanced;
> +	u32 t_turbo_to_perf;
> +	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
> +};

You are missing an __packed here.

> +
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> @@ -210,4 +316,13 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
>  void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>  
>  int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
> +
> +/* CnQF Layer */
> +int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
> +int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
> +void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +
>  #endif /* PMF_H */

Regards,

Hans

