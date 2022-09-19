Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332DCC54EE9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 10:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiISK0L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbiISKXx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 06:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D1627DCA
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663582742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pKlu8iRPYqQrmjiilB0fXgVQlLkirRKSKLErQ6tCx0Y=;
        b=fhgzEKmMGyyvP1Yfbn13ZlzOALN8RfoHeReMOQp2uirmThs3q0SzH+S6nfrK4ZZsxajTid
        Q0Dl1pnGs+BBOk2OeLR3irWEk/+/cz662YDc7sADySkQmScqs/w9nrRv7C+PZtSM2qDc0d
        huvO8m2x9sCsjbxOqTJXVu4je4ltYqg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-7VYQslBBNl2jrMNer3t1Jg-1; Mon, 19 Sep 2022 06:19:01 -0400
X-MC-Unique: 7VYQslBBNl2jrMNer3t1Jg-1
Received: by mail-ed1-f70.google.com with SMTP id b16-20020a056402279000b0044f1102e6e2so20434454ede.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pKlu8iRPYqQrmjiilB0fXgVQlLkirRKSKLErQ6tCx0Y=;
        b=nF8QAp220hSGduFq0se341Cyam+DhRiYOeHk36woOu4wIIxh6UNGTUUItTKaNysU+m
         v5093ZoUnGLKS9pj623g3ZiR+IQTUEz+bDtOrEVw/Sx2bxEAC66D/7g3SigGc59pw9Gu
         QRN2r/B2kUzkgOgKzfOV7Hqu6/myZujl/XJACwqIxzUcbc25sI4xO3jX9dPH/mVDQUkb
         2p7TIjUTIoMeAQjSB7K6ocdclQVYmWF7OmOlk6NnciuZGJfYan/cBGTRISjG0TFDyIDw
         T82HBntwEEmnDtehoyHkr+rVRlPlacrLrB8HsIUL5SOsZ0dQB/zMOBK5RHb/4L9vwCT/
         UAig==
X-Gm-Message-State: ACrzQf2K3lUWGVOVIHnZh5hjeNeOIHlt+qyqY4jjacOECMExQZoJINWe
        aatG5uocUsTzkMOVBKJkX9z5DpWvyT9uZ4ZmAZOg/ZItoVOxALRYWaca18XMtOqdrCv3xqAMbqh
        lkzwZR1gtwRecT6vcpCdITJyUTlFk8FdeRw==
X-Received: by 2002:a17:906:b106:b0:780:83a8:773 with SMTP id u6-20020a170906b10600b0078083a80773mr12184101ejy.758.1663582740153;
        Mon, 19 Sep 2022 03:19:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4igIJeurxovRYj4DDIdODghNsQ4F1o9jcbaQ0gHwBeoWz3Y/5tomNosKRzLBa/tG6CvhjJbA==
X-Received: by 2002:a17:906:b106:b0:780:83a8:773 with SMTP id u6-20020a170906b10600b0078083a80773mr12184084ejy.758.1663582739871;
        Mon, 19 Sep 2022 03:18:59 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y17-20020a50ce11000000b0044f2afbb1easm20262560edi.27.2022.09.19.03.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:18:59 -0700 (PDT)
Message-ID: <902d0ec0-1639-8763-b82c-7b35f1516dbc@redhat.com>
Date:   Mon, 19 Sep 2022 11:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/4] platform/x86/amd/pmf: Add support for CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220912090641.111658-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/22 10:06, Shyam Sundar S K wrote:
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
> due to CnQF don't result in slider position change.
> 
> The default OEM values are obtained after evaluating the PMF ACPI function
> idx 11 & 12 for AC and DC respectively. Whether to turn ON/OFF by default
> is guided by a "flag" passed by the OEM BIOS.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>  drivers/platform/x86/amd/pmf/acpi.c   |  10 +
>  drivers/platform/x86/amd/pmf/cnqf.c   | 319 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |  16 +-
>  drivers/platform/x86/amd/pmf/pmf.h    | 100 ++++++++
>  5 files changed, 445 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index ef2b08c9174d..fdededf54392 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -6,4 +6,4 @@
>  
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>  amd-pmf-objs := core.o acpi.o sps.o \
> -		auto-mode.o
> +		auto-mode.o cnqf.o
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index cb46a7252414..05a2b8a056fc 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -233,6 +233,16 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_AC, data, sizeof(*data));
> +}
> +
> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
> +}
> +
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> new file mode 100644
> index 000000000000..aebcef778a0b
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -0,0 +1,319 @@
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
> +static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
> +			    struct cnqf_config *table)
> +{
> +	struct power_table_control *pc;
> +
> +	pc = &config_store.mode_set[src][idx].power_control;
> +
> +	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
> +	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, pc->stt_skin_temp[STT_TEMP_APU],
> +			 NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, pc->stt_skin_temp[STT_TEMP_HS2],
> +			 NULL);
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
> +		apmf_update_fan_idx(dev,
> +				    config_store.mode_set[src][idx].fan_control.manual,
> +				    config_store.mode_set[src][idx].fan_control.fan_id);
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
> +int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
> +{
> +	struct cnqf_tran_params *tp;
> +	int src, i, j, index = 0;
> +	u32 avg_power = 0;
> +
> +	src = amd_pmf_get_power_source();
> +
> +	if (dev->current_profile == PLATFORM_PROFILE_BALANCED) {
> +		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
> +	} else {
> +		/*
> +		 * Return from here if the platform_profile is not balanced
> +		 * so that preference is given to user mode selection, rather
> +		 * than enforcing CnQF to run all the time (if enabled)
> +		 */
> +		return -EINVAL;
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
> +				amd_pmf_set_cnqf(dev, src,
> +						 config_store.current_mode, NULL);
> +			}
> +			break;
> +		}
> +	}
> +	return 0;
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
> +	struct apmf_dyn_slider_output out = {};
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC))
> +		apmf_get_dyn_slider_def_ac(dev, &out);
> +	else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC))
> +		apmf_get_dyn_slider_def_dc(dev, &out);
> +
> +	return out.flags;
> +}
> +
> +void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_dyn_slider_output out;
> +	int i, j, ret;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		if (i == POWER_SOURCE_AC && is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC)) {
> +			ret = apmf_get_dyn_slider_def_ac(dev, &out);
> +			if (ret)
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_ac failed :%d\n", ret);
> +		} else if (i == POWER_SOURCE_DC &&
> +				is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +			ret = apmf_get_dyn_slider_def_dc(dev, &out);
> +			if (ret)
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
> +		}
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

So trans_prio, now just contains { 0, 1, 2, 3, ... } and this is not changed
anywhere. Please just drop trans_prio and in the places where trans_prio[i] is read,
just use "i" directly.

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
> +	dev->cnqf_enabled = true;
> +	amd_pmf_load_defaults_cnqf(dev);
> +	amd_pmf_init_metrics_table(dev);
> +
> +	/* update the thermal for CnQF */
> +	src = amd_pmf_get_power_source();
> +	amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);

current_mode is not initialized anywhere, so at this point it is 0, which is CNQF_MODE_QUIET,
which seems like a weird default?

Also should this not only be done "if (dev->current_profile == PLATFORM_PROFILE_BALANCED),
similar to how amd_pmf_trans_cnqf() only calls amd_pmf_set_cnqf() under this condition?

Regards,

Hans


> +}
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index a675ca969331..2cb7793d07cf 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -123,6 +123,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>  	}
>  
> +	if (dev->cnqf_enabled) {
> +		/* Apply the CnQF transition */
> +		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> +	}
> +
>  	dev->start_time = ktime_to_ms(ktime_get());
>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
>  	mutex_unlock(&dev->update_mutex);
> @@ -262,6 +267,11 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_init_auto_mode(dev);
>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +		/* Enable Cool n Quiet Framework (CnQF) */
> +		amd_pmf_init_cnqf(dev);
> +		dev_dbg(dev->dev, "CnQF Init done\n");
>  	}
>  }
>  
> @@ -270,8 +280,12 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>  		amd_pmf_deinit_sps(dev);
>  
> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE))
> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_deinit_auto_mode(dev);
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +		amd_pmf_deinit_cnqf(dev);
> +	}
>  }
>  
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 0a72a395c2ef..07ff8a7ec7b0 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -22,6 +22,8 @@
>  #define APMF_FUNC_AUTO_MODE					5
>  #define APMF_FUNC_SET_FAN_IDX				7
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
> +#define APMF_FUNC_DYN_SLIDER_AC				11
> +#define APMF_FUNC_DYN_SLIDER_DC				12
>  
>  /* Message Definitions */
>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
> @@ -165,6 +167,7 @@ struct amd_pmf_dev {
>  	int socket_power_history_idx;
>  	bool amt_enabled;
>  	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
> +	bool cnqf_enabled;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -294,6 +297,94 @@ struct apmf_auto_mode {
>  	u32 fan_id_quiet;
>  } __packed;
>  
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
> +};
> +
> +struct cnqf_tran_params {
> +	u32 time_constant; /* minimum time required to switch to next mode */
> +	u32 power_delta; /* minimum power required to switch to next mode */
> +	u32 power_threshold;
> +	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
> +	u32 total_power;
> +	u32 count;
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
> +} __packed;
> +
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> @@ -324,4 +415,13 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>  void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
>  void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
> +
> +/* CnQF Layer */
> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
> +void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
> +int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +
>  #endif /* PMF_H */

