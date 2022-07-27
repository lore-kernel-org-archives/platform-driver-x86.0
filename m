Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9BBC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbiG0VW6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 17:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbiG0VW4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 17:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 47A785B05E
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658956973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5F7AHGaa8SZkG2UN94FXqZkGPl6AxYUDlTXQ4Hao3JA=;
        b=MDaSxA+hTuAr+onUVZXtS9wYROtGicE2O0gz9bMcytGGrGMcc9+VYP5R6iJO2eorBVJzjz
        UlAoFup7rbytgK6QIb208OVz3btUa5zRjUkLoff/Oiz2BXF6j/CjKxuVQlEHUEZUfzAa1o
        LneabFXje9E7OU5jKFc44V+8qFpq7+M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-opiSO2DNPA6gRII5lNbbTg-1; Wed, 27 Jul 2022 17:22:51 -0400
X-MC-Unique: opiSO2DNPA6gRII5lNbbTg-1
Received: by mail-ed1-f72.google.com with SMTP id y5-20020a056402358500b0043c0593d4f6so24390edc.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5F7AHGaa8SZkG2UN94FXqZkGPl6AxYUDlTXQ4Hao3JA=;
        b=7/jP6EcBQf/J4hQpnFrZJ3fK+5O/EJe1hVDnkncji6d5EromN8wQeh5AvaSFGCBofv
         jM7frpsdbm7IkjeZi62zOPEYvVLeqlSzcPpjdQc2rP1Uawn70Q1JiojNKSkB2oOOA040
         0JP8Yw4IcB2UYFm8zsFj53fZPe/5bcVL86zW/YSfIDWtpyPZdCjUk9CkJULMQU9vBhL5
         mYhxmOrCje5YlLlGckHHU+fwwVsHYIdXA12E3T6JzwXTtpQgju7yAIyO6GPNt3SpkDqS
         732ade1XaAPY4kOsPhB6WQEQPHnkBfhL/jJglkPavqUwwZa1p4CcN/vGOVxoEZ4eB2Qq
         GkoQ==
X-Gm-Message-State: AJIora97GW1RzwWfagKeYkO1UcAsg1H92vtGRGT/U7g7mQ4eRpEDh8s9
        svgOY4wFKnQNbDVOw9WAfuVAKpOd9+tBo+LO16sF7Kok1MdZ8c3fYApd5s7YeZBSg+ogNhhWhLk
        X8doee5XpZ51MXGxTYLyNS4WMfxHL8QB8cg==
X-Received: by 2002:aa7:d8d1:0:b0:43c:ce93:ff67 with SMTP id k17-20020aa7d8d1000000b0043cce93ff67mr2418905eds.295.1658956970480;
        Wed, 27 Jul 2022 14:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sz9zVZ8lO7vCsshHIdGEE6Uzh7vv4KErMMNRcJswEHhXHxkM5y0P0uT6b+4QGpZ4TIZsFcoQ==
X-Received: by 2002:aa7:d8d1:0:b0:43c:ce93:ff67 with SMTP id k17-20020aa7d8d1000000b0043cce93ff67mr2418880eds.295.1658956970020;
        Wed, 27 Jul 2022 14:22:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r17-20020a17090609d100b0072a881b21d8sm8031223eje.119.2022.07.27.14.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:22:49 -0700 (PDT)
Message-ID: <420cfb2d-e24e-f207-9444-37daac9aae55@redhat.com>
Date:   Wed, 27 Jul 2022 23:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 12/15] platform/x86/amd/pmf: Add support for Auto mode
 feature
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-13-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-13-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> The objective of this feature is to track the moving average of system
> power over the time period specified and switch to the subsequent mode.
> 
> This feature has 3 modes: quiet, balanced, performance.
> 
> In order to do this, PMF driver will get the moving average of APU power
> from PMFW and power threshold, time constants, system config parameters
> from OEM inputs.
> 
> System power as read by PMF driver from PMFW is the filtered value over
> the sampling window. Every sampling window, moving average of system power
> is computed. At the end of the monitoring window, the moving average is
> compared against the threshold for mode switch for decision making.
> 
> With AMD managing the system config limits, any mode switch within
> auto-mode will result in limits of fPPT/sPPT/STAPM or STT being scaled
> down.
> 
> When "auto mode" is enabled, the static slider control remains out of
> the PMF driver, so the platform_profile registration would not
> happen in PMF driver.

This is not what happens in the code, the platform_profile registration
is still happening AFAICT.

Like with CnQF for this other auto mode we also need to figure out the
relation with the regular static platform_profile settings.

I see this in the code:

@@ -122,6 +122,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	/* Calculate the avg SoC power consumption */
 	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
 
+	if (current_profile == PLATFORM_PROFILE_BALANCED) {
+		/* Apply the Auto Mode transition */
+		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+	}
+

So it seems that unlike CnQF this other auto-mode only does mode transitions
when the static-slider is set to balanced ?


> 
> The transition to auto-mode only happens when the APMF fn5 is enabled
> in BIOS, platform_profile set to "balanced" and a AMT
> (Auto Mode transition) is received.

Right, this part of the commit msg matches the code, but it conflicts with
the "When "auto mode" is enabled, the static slider control remains out of
the PMF driver:" part of the commit msg above.

> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile    |   2 +-
>  drivers/platform/x86/amd/pmf/acpi.c      |  28 ++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 317 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c      |  25 +-
>  drivers/platform/x86/amd/pmf/pmf.h       | 104 ++++++++
>  5 files changed, 473 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index d02a0bdc6429..2a9568bf9064 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -6,4 +6,4 @@
>  
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>  amd-pmf-objs := core.o acpi.o sps.o \
> -		cnqf.o
> +		cnqf.o auto-mode.o
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index a3ff91c605b5..e9f33e61659f 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -55,6 +55,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>  {
>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
> +	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>  	func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
>  	func->dyn_slider_dc = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_DC;
> @@ -210,6 +211,33 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
>  	return err;
>  }
>  
> +int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data)
> +{
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(ampf_if, APMF_FUNC_AUTO_MODE, NULL);
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

Please use apmf_if_call_store_buffer() for this (see review of 4/15)

Regards,

Hans


>  int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data)
>  {
>  	union acpi_object *info;
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> new file mode 100644
> index 000000000000..954fde25e71e
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -0,0 +1,317 @@
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
> +#include <linux/acpi.h>
> +#include <linux/list.h>
> +#include <linux/workqueue.h>
> +#include "pmf.h"
> +
> +#define AVG_SAMPLE_SIZE 3
> +
> +struct power_history {
> +	int socket_power;
> +	struct list_head list;
> +	int avg;
> +	int total;
> +};
> +
> +struct list_pdata {
> +	int total;
> +	int avg;
> +};
> +
> +static struct power_history power_list;
> +static struct list_pdata pdata;
> +
> +static struct auto_mode_mode_config config_store;
> +static const char *state_as_str(unsigned int state);
> +
> +static void amd_pmf_handle_automode(struct amd_pmf_dev *dev, bool op, int idx,
> +				    struct auto_mode_mode_config *table)
> +{
> +	if (op == SLIDER_OP_SET) {
> +		struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
> +
> +		amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
> +		amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +				 pwr_ctrl->stt_skin_temp[STT_TEMP_APU], NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +				 pwr_ctrl->stt_skin_temp[STT_TEMP_HS2], NULL);
> +	} else if (op == SLIDER_OP_GET) {
> +		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE,
> +				 &table->mode_set[idx].power_control.spl);
> +		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE,
> +				 &table->mode_set[idx].power_control.fppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE,
> +				 &table->mode_set[idx].power_control.sppt);
> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
> +				 &table->mode_set[idx].power_control.sppt_apu_only);
> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
> +				 &table->mode_set[idx].power_control.stt_min);
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
> +				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_APU]);
> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
> +				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	}
> +
> +	if (dev->apmf_if->func.fan_table_idx)
> +		apmf_update_fan_idx(dev->apmf_if, config_store.mode_set[idx].fan_control.manual,
> +				    config_store.mode_set[idx].fan_control.fan_id);
> +}
> +
> +static int amd_pmf_get_moving_avg(int socket_power)
> +{
> +	struct power_history *tmp;
> +	struct list_head *pos, *q;
> +	static int count;
> +
> +	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
> +	tmp->socket_power = socket_power;
> +	list_add_tail(&tmp->list, &power_list.list);
> +
> +	list_for_each_safe(pos, q, &power_list.list) {
> +		if (count >= AVG_SAMPLE_SIZE) {
> +			tmp = list_first_entry(pos, struct power_history, list);
> +			list_del_init(pos);
> +			goto next;
> +		}
> +	}
> +
> +next:
> +	pdata.total = 0;
> +	pdata.avg = 0;
> +
> +	list_for_each(pos, &power_list.list) {
> +		tmp = list_entry(pos, struct power_history, list);
> +		pdata.total += tmp->socket_power;
> +		pdata.avg = pdata.total / AVG_SAMPLE_SIZE;
> +	}
> +
> +	count++;
> +	if (count >= AVG_SAMPLE_SIZE)
> +		return pdata.avg;
> +
> +	return 0;
> +}
> +
> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
> +{
> +	int avg_power = 0;
> +	bool update = false;
> +	int i, j;
> +
> +	/* Get the average moving average computed by auto mode algorithm */
> +	avg_power = amd_pmf_get_moving_avg(socket_power);
> +
> +	for (i = 0; i < AUTO_TRANSITION_MAX; i++) {
> +		if ((config_store.transition[i].shifting_up && avg_power >=
> +		     config_store.transition[i].power_threshold) ||
> +		    (!config_store.transition[i].shifting_up && avg_power <=
> +		     config_store.transition[i].power_threshold)) {
> +			if (config_store.transition[i].timer <
> +			    config_store.transition[i].time_constant)
> +				config_store.transition[i].timer += time_elapsed_ms;
> +		} else {
> +			config_store.transition[i].timer = 0;
> +		}
> +
> +		if (config_store.transition[i].timer >=
> +		    config_store.transition[i].time_constant &&
> +		    !config_store.transition[i].applied) {
> +			config_store.transition[i].applied = true;
> +			update = true;
> +		} else if (config_store.transition[i].timer <=
> +			   config_store.transition[i].time_constant &&
> +			   config_store.transition[i].applied) {
> +			config_store.transition[i].applied = false;
> +			update = true;
> +		}
> +	}
> +
> +	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
> +		state_as_str(config_store.current_mode));
> +
> +	if (update) {
> +		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
> +			/* Apply the mode with highest priority indentified */
> +			if (config_store.transition[j].applied) {
> +				if (config_store.current_mode !=
> +				    config_store.transition[j].target_mode) {
> +					config_store.current_mode =
> +							config_store.transition[j].target_mode;
> +					dev_dbg(dev->dev, "[AUTO_MODE] moving to mode:%s\n",
> +						state_as_str(config_store.current_mode));
> +					amd_pmf_handle_automode(dev, SLIDER_OP_SET,
> +								config_store.current_mode, NULL);
> +				}
> +				break;
> +			}
> +		}
> +	}
> +}
> +
> +static void amd_pmf_get_power_threshold(void)
> +{
> +	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
> +				config_store.mode_set[AUTO_BALANCE].power_floor -
> +				config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta;
> +
> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold =
> +				config_store.mode_set[AUTO_BALANCE].power_floor -
> +				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta;
> +
> +	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_threshold =
> +			config_store.mode_set[AUTO_QUIET].power_floor -
> +			config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta;
> +
> +	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
> +		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
> +}
> +
> +static const char *state_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case AUTO_QUIET:
> +		return "QUIET";
> +	case AUTO_BALANCE:
> +		return "BALANCED";
> +	case AUTO_PERFORMANCE_ON_LAP:
> +		return "ON_LAP";
> +	case AUTO_PERFORMANCE:
> +		return "PERFORMANCE";
> +	default:
> +		return "Unknown Auto Mode State";
> +	}
> +}
> +
> +void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_auto_mode output;
> +	struct power_table_control *pwr_ctrl;
> +	int i;
> +
> +	if (dev->apmf_if->func.auto_mode_def) {
> +		apmf_get_auto_mode_def(dev->apmf_if, &output);
> +		/* time constant */
> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant =
> +									output.balanced_to_quiet;
> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant =
> +									output.balanced_to_perf;
> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant =
> +									output.quiet_to_balanced;
> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant =
> +									output.perf_to_balanced;
> +
> +		/* power floor */
> +		config_store.mode_set[AUTO_QUIET].power_floor = output.pfloor_quiet;
> +		config_store.mode_set[AUTO_BALANCE].power_floor = output.pfloor_balanced;
> +		config_store.mode_set[AUTO_PERFORMANCE].power_floor = output.pfloor_perf;
> +		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_floor = output.pfloor_perf;
> +
> +		/* Power delta for mode change */
> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta =
> +									output.pd_balanced_to_quiet;
> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta =
> +									output.pd_balanced_to_perf;
> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta =
> +									output.pd_quiet_to_balanced;
> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta =
> +									output.pd_perf_to_balanced;
> +
> +		/* Power threshold */
> +		amd_pmf_get_power_threshold();
> +
> +		/* skin temperature limits */
> +		pwr_ctrl = &config_store.mode_set[AUTO_QUIET].power_control;
> +		pwr_ctrl->spl = output.spl_quiet;
> +		pwr_ctrl->sppt = output.sppt_quiet;
> +		pwr_ctrl->fppt = output.fppt_quiet;
> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_quiet;
> +		pwr_ctrl->stt_min = output.stt_min_limit_quiet;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_quiet;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_quiet;
> +
> +		pwr_ctrl = &config_store.mode_set[AUTO_BALANCE].power_control;
> +		pwr_ctrl->spl = output.spl_balanced;
> +		pwr_ctrl->sppt = output.sppt_balanced;
> +		pwr_ctrl->fppt = output.fppt_balanced;
> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_balanced;
> +		pwr_ctrl->stt_min = output.stt_min_limit_balanced;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_balanced;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_balanced;
> +
> +		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE].power_control;
> +		pwr_ctrl->spl = output.spl_perf;
> +		pwr_ctrl->sppt = output.sppt_perf;
> +		pwr_ctrl->fppt = output.fppt_perf;
> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf;
> +		pwr_ctrl->stt_min = output.stt_min_limit_perf;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf;
> +
> +		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_control;
> +		pwr_ctrl->spl = output.spl_perf_on_lap;
> +		pwr_ctrl->sppt = output.sppt_perf_on_lap;
> +		pwr_ctrl->fppt = output.fppt_perf_on_lap;
> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf_on_lap;
> +		pwr_ctrl->stt_min = output.stt_min_limit_perf_on_lap;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf_on_lap;
> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf_on_lap;
> +
> +		/* Fan ID */
> +		config_store.mode_set[AUTO_QUIET].fan_control.fan_id = output.fan_id_quiet;
> +		config_store.mode_set[AUTO_BALANCE].fan_control.fan_id = output.fan_id_balanced;
> +		config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id = output.fan_id_perf;
> +		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].fan_control.fan_id =
> +										output.fan_id_perf;
> +
> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].target_mode = AUTO_QUIET;
> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
> +									AUTO_PERFORMANCE;
> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].target_mode =
> +										AUTO_BALANCE;
> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].target_mode =
> +										AUTO_BALANCE;
> +
> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].shifting_up = false;
> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].shifting_up = true;
> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].shifting_up = true;
> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].shifting_up =
> +											false;
> +
> +		for (i = 0 ; i < AUTO_MODE_MAX ; i++) {
> +			if (config_store.mode_set[i].fan_control.fan_id == FAN_INDEX_AUTO)
> +				config_store.mode_set[i].fan_control.manual = false;
> +			else
> +				config_store.mode_set[i].fan_control.manual = true;
> +		}
> +	}
> +}
> +
> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
> +{
> +	cancel_delayed_work_sync(&dev->work_buffer);
> +}
> +
> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
> +{
> +	INIT_LIST_HEAD(&power_list.list);
> +
> +	amd_pmf_init_metrics_table(dev);
> +	amd_pmf_load_defaults_auto_mode(dev);
> +
> +	/* update the thermal for Automode */
> +	amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
> +}
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc267d333b76..674ddf599135 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -122,6 +122,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  	/* Calculate the avg SoC power consumption */
>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>  
> +	if (current_profile == PLATFORM_PROFILE_BALANCED) {
> +		/* Apply the Auto Mode transition */
> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +	}
> +
>  	if (dev->cnqf_feat) {
>  		/* Apply the CnQF transition */
>  		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> @@ -260,9 +265,18 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  		amd_pmf_init_sps(dev);
>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>  	}
> -	/* Enable Cool n Quiet Framework (CnQF) */
> -	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
> +
> +	/* Enable Auto Mode */
> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
> +		amd_pmf_init_auto_mode(dev);
> +		dev_dbg(dev->dev, "Auto Mode Init done\n");
> +		/*
> +		 * Auto mode and CnQF cannot co-exist. If auto mode is supported it takes
> +		 * higher priority over CnQF.
> +		 */
> +	} else if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
>  	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC)) {
> +		/* Enable Cool n Quiet Framework (CnQF) */
>  		amd_pmf_init_cnqf(dev);
>  		dev_dbg(dev->dev, "CnQF Init done\n");
>  	}
> @@ -272,6 +286,13 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  {
>  	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
>  		amd_pmf_deinit_sps(dev);
> +
> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
> +		amd_pmf_deinit_auto_mode(dev);
> +		/* If auto mode is supported, there is no need to proceed */
> +		return;
> +	}
> +
>  	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
>  	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC))
>  		amd_pmf_deinit_cnqf(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 452266809dfa..0532f49e9613 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -18,6 +18,7 @@
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
> +#define APMF_FUNC_AUTO_MODE					5
>  #define APMF_FUNC_SET_FAN_IDX				7
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
>  #define APMF_FUNC_DYN_SLIDER_GRANULAR_AC	11
> @@ -51,6 +52,7 @@
>  struct apmf_if_functions {
>  	bool system_params;
>  	bool sbios_heartbeat;
> +	bool auto_mode_def;
>  	bool fan_table_idx;
>  	bool static_slider_granular;
>  	bool dyn_slider_ac;
> @@ -197,6 +199,33 @@ struct fan_table_control {
>  	unsigned long fan_id;
>  };
>  
> +/* Auto Mode Layer */
> +enum auto_mode_transition_priority {
> +	AUTO_TRANSITION_TO_PERFORMANCE, /* Any other mode to Performance Mode */
> +	AUTO_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
> +	AUTO_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
> +	AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance Mode to Balance Mode */
> +	AUTO_TRANSITION_MAX,
> +};
> +
> +enum auto_mode_mode {
> +	AUTO_QUIET,
> +	AUTO_BALANCE,
> +	AUTO_PERFORMANCE_ON_LAP,
> +	AUTO_PERFORMANCE,
> +	AUTO_MODE_MAX,
> +};
> +
> +struct auto_mode_trans_params {
> +	u32	time_constant; /* minimum time required to switch to next mode */
> +	u32 power_delta; /* delta power to shift mode */
> +	u32 power_threshold;
> +	u32	timer; /* elapsed time. if timer > TimeThreshold, it will move to next mode */
> +	u32 applied;
> +	enum auto_mode_mode target_mode;
> +	u32 shifting_up;
> +};
> +
>  struct power_table_control {
>  	u32 spl;
>  	u32 sppt;
> @@ -207,6 +236,74 @@ struct power_table_control {
>  	u32 reserved[16];
>  };
>  
> +struct auto_mode_mode_settings {
> +	struct power_table_control power_control;
> +	struct fan_table_control fan_control;
> +	u32 power_floor;
> +};
> +
> +struct auto_mode_mode_config {
> +	struct auto_mode_trans_params transition[AUTO_TRANSITION_MAX];
> +	struct auto_mode_mode_settings mode_set[AUTO_MODE_MAX];
> +	enum auto_mode_mode current_mode;
> +	bool on_lap;
> +	bool better_perf;
> +	u32 amt_enabled; /* Auto Mode Transition */
> +	u32 avg_power;
> +};
> +
> +struct apmf_auto_mode {
> +	u16 size;
> +	/* time constant */
> +	u32 balanced_to_perf;
> +	u32 perf_to_balanced;
> +	u32 quiet_to_balanced;
> +	u32 balanced_to_quiet;
> +	/* power floor */
> +	u32 pfloor_perf;
> +	u32 pfloor_balanced;
> +	u32 pfloor_quiet;
> +	/* Power delta for mode change */
> +	u32 pd_balanced_to_perf;
> +	u32 pd_perf_to_balanced;
> +	u32 pd_quiet_to_balanced;
> +	u32 pd_balanced_to_quiet;
> +	/* skin temperature limits */
> +	u8 stt_apu_perf_on_lap; /* CQL ON */
> +	u8 stt_hs2_perf_on_lap; /* CQL ON */
> +	u8 stt_apu_perf;
> +	u8 stt_hs2_perf;
> +	u8 stt_apu_balanced;
> +	u8 stt_hs2_balanced;
> +	u8 stt_apu_quiet;
> +	u8 stt_hs2_quiet;
> +	u32 stt_min_limit_perf_on_lap; /* CQL ON */
> +	u32 stt_min_limit_perf;
> +	u32 stt_min_limit_balanced;
> +	u32 stt_min_limit_quiet;
> +	/* SPL based */
> +	u32 fppt_perf_on_lap; /* CQL ON */
> +	u32 sppt_perf_on_lap; /* CQL ON */
> +	u32 spl_perf_on_lap; /* CQL ON */
> +	u32 sppt_apu_only_perf_on_lap; /* CQL ON */
> +	u32 fppt_perf;
> +	u32 sppt_perf;
> +	u32 spl_perf;
> +	u32 sppt_apu_only_perf;
> +	u32 fppt_balanced;
> +	u32 sppt_balanced;
> +	u32 spl_balanced;
> +	u32 sppt_apu_only_balanced;
> +	u32 fppt_quiet;
> +	u32 sppt_quiet;
> +	u32 spl_quiet;
> +	u32 sppt_apu_only_quiet;
> +	/* Fan ID */
> +	u32 fan_id_perf;
> +	u32 fan_id_balanced;
> +	u32 fan_id_quiet;
> +} __packed;
> +
>  /* CnQF Layer */
>  enum cnqf_trans_priority {
>  	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
> @@ -317,6 +414,13 @@ void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>  
>  int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>  
> +/* Auto Mode Layer */
> +void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
> +int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +
>  /* CnQF Layer */
>  int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
>  int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);

