Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79D5C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 13:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbiHBNUr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 09:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbiHBNUq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 09:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F10A31580F
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659446444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EK8M3/92QfxzPdgJJu4fAu6E9HhCXoKA/p+MHA/aQp0=;
        b=T8nzU1V6HytCRfsLJpxa2i2Y9953FHpVXjV5eoDMWRAOLTaE3OH8eejN6B69O5Gy0vSuSF
        5KGXGE2Z6KRa5Rj6YEKr3UMoUIxmES6Rq3r1cS9srq5eSjYx5W95LTLuUJzmLhtzSxH786
        VRqFoFcpivicxbqPHqew8Cnletry1mA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-WNprgs9dPLib7loSgjqFPg-1; Tue, 02 Aug 2022 09:20:42 -0400
X-MC-Unique: WNprgs9dPLib7loSgjqFPg-1
Received: by mail-ej1-f70.google.com with SMTP id ne36-20020a1709077ba400b0072b64ce28aaso4151536ejc.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 06:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=EK8M3/92QfxzPdgJJu4fAu6E9HhCXoKA/p+MHA/aQp0=;
        b=sWkePBI+fYr9R4bPt4PSVnPRUg9iAtRBJ7Pj/hsBN8FfzlxmO+UyTpn/h5h2LSc9Kp
         tE5Jh+YWwrXsdWnoyWMTkzv1US25zrKUNijR2OFpT27djSd3Ne7AUcMokxS5XTVjE7XU
         2qm+2zXoz/i+hp4gVpuKtYWHuz8Qx44Qc8wfz2Ty/PLUeC0Gw8Yhu33+NA4xEk+cPrmy
         cTBpetNIORTfRaEWpX6cB8wNjnRlhqWpgUXusHtPfEBYWSlL4ssPRNEU3vBdpENJLMwo
         RWtIgRZicYZXoYuW0MuiPjlqzQ5KT3UPmRZNy7Y/oqj/6IDQbFKWS35gNQD/RMSB0Nzk
         DUNA==
X-Gm-Message-State: ACgBeo3LxICqPsrp30nAjSwPCjpDIWFLYGkO6rMuNHaBsMufR+rZvIRb
        ZIRlcctXhu/KO/SdWRNotuITgya5E/0OnxSmPOycCzxK33Q5w4Y7/DqU1+Cv7QDd13QaofzrIvh
        OFRaaUtchWMNZVGBFdplEhfIId3NN2Ka/+w==
X-Received: by 2002:a17:907:72cb:b0:730:8ef6:7975 with SMTP id du11-20020a17090772cb00b007308ef67975mr6788584ejc.18.1659446441407;
        Tue, 02 Aug 2022 06:20:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4oEhjfFJFyRlaE89iGbYqsMX9lr2jrdC2rtuss1kIuV0DLnLQvvpK9dYbAUJrLiPMJtC3S+w==
X-Received: by 2002:a17:907:72cb:b0:730:8ef6:7975 with SMTP id du11-20020a17090772cb00b007308ef67975mr6788557ejc.18.1659446441040;
        Tue, 02 Aug 2022 06:20:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id s10-20020aa7c54a000000b0043d1eff72b3sm6855546edr.74.2022.08.02.06.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 06:20:40 -0700 (PDT)
Message-ID: <8a1a9b19-eb86-4470-d9c0-3e83539592d1@redhat.com>
Date:   Tue, 2 Aug 2022 15:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/11] platform/x86/amd/pmf: Add support for Auto mode
 feature
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
 <20220802112545.2118632-9-Shyam-sundar.S-k@amd.com>
 <9debec2c-fbd7-9fb4-f0a6-e3d7968d4156@redhat.com>
In-Reply-To: <9debec2c-fbd7-9fb4-f0a6-e3d7968d4156@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 15:18, Hans de Goede wrote:
> Hi,
> 
> On 8/2/22 13:25, Shyam Sundar S K wrote:
>> This feature has 3 modes quiet, balanced, performance
>>
>> The objective of this feature is to track the moving average of system
>> power over the time period specified and switch to the subsequent mode.
>>
>> In order to do this, PMF driver will get the moving average of APU power
>> from PMFW and power threshold, time constants, system config parameters
>> from OEM inputs.
>>
>> System power as read by PMF driver from PMFW is the filtered value over
>> the sampling window. Every sampling window, moving average of system power
>> is computed. At the end of the monitoring window, the moving average is
>> compared against the threshold for mode switch for decision making.
>>
>> With AMD managing the system config limits, any mode switch within
>> auto-mode will result in limits of fPPT/sPPT/STAPM or STT being scaled
>> down.
>>
>> When "auto mode" is enabled, the static slider control remains out of
>> the PMF driver, so the platform_profile registration would not
>> happen in PMF driver.
>>
>> The transition to auto-mode only happens when the APMF fn5 is enabled
>> in BIOS, platform_profile set to "balanced" and a AMT
>> (Auto Mode transition) is received.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Makefile    |   3 +-
>>  drivers/platform/x86/amd/pmf/acpi.c      |   5 +
>>  drivers/platform/x86/amd/pmf/auto-mode.c | 263 +++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c      |   9 +
>>  drivers/platform/x86/amd/pmf/pmf.h       | 117 ++++++++++
>>  5 files changed, 396 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>> index 557521a80427..ef2b08c9174d 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -5,4 +5,5 @@
>>  #
>>  
>>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>> -amd-pmf-objs := core.o acpi.o sps.o
>> +amd-pmf-objs := core.o acpi.o sps.o \
>> +		auto-mode.o
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index a2246c08694e..200e31033d94 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -149,6 +149,11 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
>>  	return err;
>>  }
>>  
>> +int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data)
>> +{
>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>> +}
>> +
>>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>>  {
>>  	struct apmf_verify_interface output;
>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>> new file mode 100644
>> index 000000000000..99f5a2396b0b
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>> @@ -0,0 +1,263 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD Platform Management Framework Driver
>> + *
>> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/workqueue.h>
>> +#include "pmf.h"
>> +
>> +static struct auto_mode_mode_config config_store;
>> +static const char *state_as_str(unsigned int state);
>> +
>> +static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
>> +				 struct auto_mode_mode_config *table)
>> +{
>> +	struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
>> +
>> +	amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
>> +	amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +			 pwr_ctrl->stt_skin_temp[STT_TEMP_APU], NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +			 pwr_ctrl->stt_skin_temp[STT_TEMP_HS2], NULL);
>> +
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
>> +		apmf_update_fan_idx(dev, config_store.mode_set[idx].fan_control.manual,
>> +				    config_store.mode_set[idx].fan_control.fan_id);
>> +}
>> +
>> +static int amd_pmf_get_moving_avg(struct amd_pmf_dev *pdev, int socket_power)
>> +{
>> +	int i, total = 0;
>> +
>> +	if (pdev->socket_power_history_idx == -1) {
>> +		for (i = 0; i < AVG_SAMPLE_SIZE; i++)
>> +			pdev->socket_power_history[i] = socket_power;
>> +	}
>> +
>> +	pdev->socket_power_history_idx = (pdev->socket_power_history_idx + 1) % AVG_SAMPLE_SIZE;
>> +	pdev->socket_power_history[pdev->socket_power_history_idx] = socket_power;
>> +
>> +	for (i = 0; i < AVG_SAMPLE_SIZE; i++)
>> +		total += pdev->socket_power_history[i];
>> +
>> +	return total / AVG_SAMPLE_SIZE;
>> +}
>> +
>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
>> +{
>> +	int avg_power = 0;
>> +	bool update = false;
>> +	int i, j;
>> +
>> +	/* Get the average moving average computed by auto mode algorithm */
>> +	avg_power = amd_pmf_get_moving_avg(dev, socket_power);
>> +
>> +	for (i = 0; i < AUTO_TRANSITION_MAX; i++) {
>> +		if ((config_store.transition[i].shifting_up && avg_power >=
>> +		     config_store.transition[i].power_threshold) ||
>> +		    (!config_store.transition[i].shifting_up && avg_power <=
>> +		     config_store.transition[i].power_threshold)) {
>> +			if (config_store.transition[i].timer <
>> +			    config_store.transition[i].time_constant)
>> +				config_store.transition[i].timer += time_elapsed_ms;
>> +		} else {
>> +			config_store.transition[i].timer = 0;
>> +		}
>> +
>> +		if (config_store.transition[i].timer >=
>> +		    config_store.transition[i].time_constant &&
>> +		    !config_store.transition[i].applied) {
>> +			config_store.transition[i].applied = true;
>> +			update = true;
>> +		} else if (config_store.transition[i].timer <=
>> +			   config_store.transition[i].time_constant &&
>> +			   config_store.transition[i].applied) {
>> +			config_store.transition[i].applied = false;
>> +			update = true;
>> +		}
>> +	}
>> +
>> +	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
>> +		state_as_str(config_store.current_mode));
>> +
>> +	if (update) {
>> +		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>> +			/* Apply the mode with highest priority indentified */
>> +			if (config_store.transition[j].applied) {
>> +				if (config_store.current_mode !=
>> +				    config_store.transition[j].target_mode) {
>> +					config_store.current_mode =
>> +							config_store.transition[j].target_mode;
>> +					dev_dbg(dev->dev, "[AUTO_MODE] moving to mode:%s\n",
>> +						state_as_str(config_store.current_mode));
>> +					amd_pmf_set_automode(dev, config_store.current_mode, NULL);
>> +				}
>> +				break;
>> +			}
>> +		}
>> +	}
>> +}
>> +
>> +static void amd_pmf_get_power_threshold(void)
>> +{
>> +	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
>> +				config_store.mode_set[AUTO_BALANCE].power_floor -
>> +				config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta;
>> +
>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold =
>> +				config_store.mode_set[AUTO_BALANCE].power_floor -
>> +				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta;
>> +
>> +	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_threshold =
>> +			config_store.mode_set[AUTO_QUIET].power_floor -
>> +			config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta;
>> +
>> +	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
>> +		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
>> +}
>> +
>> +static const char *state_as_str(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case AUTO_QUIET:
>> +		return "QUIET";
>> +	case AUTO_BALANCE:
>> +		return "BALANCED";
>> +	case AUTO_PERFORMANCE_ON_LAP:
>> +		return "ON_LAP";
>> +	case AUTO_PERFORMANCE:
>> +		return "PERFORMANCE";
>> +	default:
>> +		return "Unknown Auto Mode State";
>> +	}
>> +}
>> +
>> +void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>> +{
>> +	struct apmf_auto_mode output;
>> +	struct power_table_control *pwr_ctrl;
>> +	int i;
>> +
>> +	apmf_get_auto_mode_def(dev, &output);
>> +	/* time constant */
>> +	config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant =
>> +								output.balanced_to_quiet;
>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant =
>> +								output.balanced_to_perf;
>> +	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant =
>> +								output.quiet_to_balanced;
>> +	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant =
>> +								output.perf_to_balanced;
>> +
>> +	/* power floor */
>> +	config_store.mode_set[AUTO_QUIET].power_floor = output.pfloor_quiet;
>> +	config_store.mode_set[AUTO_BALANCE].power_floor = output.pfloor_balanced;
>> +	config_store.mode_set[AUTO_PERFORMANCE].power_floor = output.pfloor_perf;
>> +	config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_floor = output.pfloor_perf;
>> +
>> +	/* Power delta for mode change */
>> +	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta =
>> +								output.pd_balanced_to_quiet;
>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta =
>> +								output.pd_balanced_to_perf;
>> +	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta =
>> +								output.pd_quiet_to_balanced;
>> +	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta =
>> +								output.pd_perf_to_balanced;
>> +
>> +	/* Power threshold */
>> +	amd_pmf_get_power_threshold();
>> +
>> +	/* skin temperature limits */
>> +	pwr_ctrl = &config_store.mode_set[AUTO_QUIET].power_control;
>> +	pwr_ctrl->spl = output.spl_quiet;
>> +	pwr_ctrl->sppt = output.sppt_quiet;
>> +	pwr_ctrl->fppt = output.fppt_quiet;
>> +	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_quiet;
>> +	pwr_ctrl->stt_min = output.stt_min_limit_quiet;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_quiet;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_quiet;
>> +
>> +	pwr_ctrl = &config_store.mode_set[AUTO_BALANCE].power_control;
>> +	pwr_ctrl->spl = output.spl_balanced;
>> +	pwr_ctrl->sppt = output.sppt_balanced;
>> +	pwr_ctrl->fppt = output.fppt_balanced;
>> +	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_balanced;
>> +	pwr_ctrl->stt_min = output.stt_min_limit_balanced;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_balanced;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_balanced;
>> +
>> +	pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE].power_control;
>> +	pwr_ctrl->spl = output.spl_perf;
>> +	pwr_ctrl->sppt = output.sppt_perf;
>> +	pwr_ctrl->fppt = output.fppt_perf;
>> +	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf;
>> +	pwr_ctrl->stt_min = output.stt_min_limit_perf;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf;
>> +
>> +	pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_control;
>> +	pwr_ctrl->spl = output.spl_perf_on_lap;
>> +	pwr_ctrl->sppt = output.sppt_perf_on_lap;
>> +	pwr_ctrl->fppt = output.fppt_perf_on_lap;
>> +	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf_on_lap;
>> +	pwr_ctrl->stt_min = output.stt_min_limit_perf_on_lap;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf_on_lap;
>> +	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf_on_lap;
>> +
>> +	/* Fan ID */
>> +	config_store.mode_set[AUTO_QUIET].fan_control.fan_id = output.fan_id_quiet;
>> +	config_store.mode_set[AUTO_BALANCE].fan_control.fan_id = output.fan_id_balanced;
>> +	config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id = output.fan_id_perf;
>> +	config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].fan_control.fan_id =
>> +									output.fan_id_perf;
>> +
>> +	config_store.transition[AUTO_TRANSITION_TO_QUIET].target_mode = AUTO_QUIET;
>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>> +								AUTO_PERFORMANCE;
>> +	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].target_mode =
>> +									AUTO_BALANCE;
>> +	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].target_mode =
>> +									AUTO_BALANCE;
>> +
>> +	config_store.transition[AUTO_TRANSITION_TO_QUIET].shifting_up = false;
>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].shifting_up = true;
>> +	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].shifting_up = true;
>> +	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].shifting_up =
>> +										false;
>> +
>> +	for (i = 0 ; i < AUTO_MODE_MAX ; i++) {
>> +		if (config_store.mode_set[i].fan_control.fan_id == FAN_INDEX_AUTO)
>> +			config_store.mode_set[i].fan_control.manual = false;
>> +		else
>> +			config_store.mode_set[i].fan_control.manual = true;
>> +	}
>> +
>> +	/* set to initial default values */
>> +	config_store.current_mode = AUTO_BALANCE;
>> +	dev->socket_power_history_idx = -1;
>> +}
>> +
>> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
>> +{
>> +	cancel_delayed_work_sync(&dev->work_buffer);
>> +}
>> +
>> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
>> +{
>> +	amd_pmf_load_defaults_auto_mode(dev);
>> +	/* update the thermal limits for Automode */
>> +	amd_pmf_set_automode(dev, config_store.current_mode, NULL);
>> +	amd_pmf_init_metrics_table(dev);
>> +}
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 762f769bf7ee..42d803b49d97 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -240,12 +240,21 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>  		amd_pmf_init_sps(dev);
>>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>>  	}
>> +
>> +	/* Enable Auto Mode */
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>> +		amd_pmf_init_auto_mode(dev);
>> +		dev_dbg(dev->dev, "Auto Mode Init done\n");
>> +	}
>>  }
>>  
>>  static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>  {
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>>  		amd_pmf_deinit_sps(dev);
>> +
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE))
>> +		amd_pmf_deinit_auto_mode(dev);
>>  }
>>  
>>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 42e4a5f512c0..8c92cd6871df 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -18,6 +18,7 @@
>>  #define APMF_FUNC_VERIFY_INTERFACE			0
>>  #define APMF_FUNC_GET_SYS_PARAMS			1
>>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
>> +#define APMF_FUNC_AUTO_MODE					5
>>  #define APMF_FUNC_SET_FAN_IDX				7
>>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>>  
>> @@ -44,6 +45,7 @@
>>  #define FAN_INDEX_AUTO		0xFFFFFFFF
>>  
>>  #define ARG_NONE 0
>> +#define AVG_SAMPLE_SIZE 3
>>  
>>  /* AMD PMF BIOS interfaces */
>>  struct apmf_verify_interface {
>> @@ -143,6 +145,8 @@ struct amd_pmf_dev {
>>  	struct smu_pmf_metrics m_table;
>>  	struct delayed_work work_buffer;
>>  	ktime_t start_time;
>> +	int socket_power_history[AVG_SAMPLE_SIZE];
>> +	int socket_power_history_idx;
>>  };
>>  
>>  struct apmf_sps_prop_granular {
>> @@ -171,6 +175,111 @@ struct fan_table_control {
>>  	unsigned long fan_id;
>>  };
>>  
>> +struct power_table_control {
>> +	u32 spl;
>> +	u32 sppt;
>> +	u32 fppt;
>> +	u32 sppt_apu_only;
>> +	u32 stt_min;
>> +	u32 stt_skin_temp[STT_TEMP_COUNT];
>> +	u32 reserved[16];
>> +};
>> +
>> +/* Auto Mode Layer */
>> +enum auto_mode_transition_priority {
>> +	AUTO_TRANSITION_TO_PERFORMANCE, /* Any other mode to Performance Mode */
>> +	AUTO_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
>> +	AUTO_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
>> +	AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance Mode to Balance Mode */
>> +	AUTO_TRANSITION_MAX,
>> +};
>> +
>> +enum auto_mode_mode {
>> +	AUTO_QUIET,
>> +	AUTO_BALANCE,
>> +	AUTO_PERFORMANCE_ON_LAP,
>> +	AUTO_PERFORMANCE,
>> +	AUTO_MODE_MAX,
>> +};
>> +
>> +struct auto_mode_trans_params {
>> +	u32 time_constant; /* minimum time required to switch to next mode */
>> +	u32 power_delta; /* delta power to shift mode */
>> +	u32 power_threshold;
>> +	u32 timer; /* elapsed time. if timer > TimeThreshold, it will move to next mode */
>> +	u32 applied;
>> +	enum auto_mode_mode target_mode;
>> +	u32 shifting_up;
>> +};
>> +
>> +struct auto_mode_mode_settings {
>> +	struct power_table_control power_control;
>> +	struct fan_table_control fan_control;
>> +	u32 power_floor;
>> +};
>> +
>> +struct auto_mode_mode_config {
>> +	struct auto_mode_trans_params transition[AUTO_TRANSITION_MAX];
>> +	struct auto_mode_mode_settings mode_set[AUTO_MODE_MAX];
>> +	enum auto_mode_mode current_mode;
>> +	bool on_lap;
>> +	bool better_perf;
>> +	u32 amt_enabled; /* Auto Mode Transition */
>> +	u32 avg_power;
> 
> The on_lap, better_pref and avg_power fields here are not used anywhere.
> Please drop these 3 fields.
> 
> Otherwise this looks good to me, so with this fixed you
> may add my:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I just notized that patch 9/11 adds an amt_enabled field
to the amd_pmf_dev struct and that is the one which is
actually used. So the amt_enabled here is also unused
and thus should also be removed (for a total of
removing 4 struct members).

Regards,

Hans



>> +};
>> +
>> +struct apmf_auto_mode {
>> +	u16 size;
>> +	/* time constant */
>> +	u32 balanced_to_perf;
>> +	u32 perf_to_balanced;
>> +	u32 quiet_to_balanced;
>> +	u32 balanced_to_quiet;
>> +	/* power floor */
>> +	u32 pfloor_perf;
>> +	u32 pfloor_balanced;
>> +	u32 pfloor_quiet;
>> +	/* Power delta for mode change */
>> +	u32 pd_balanced_to_perf;
>> +	u32 pd_perf_to_balanced;
>> +	u32 pd_quiet_to_balanced;
>> +	u32 pd_balanced_to_quiet;
>> +	/* skin temperature limits */
>> +	u8 stt_apu_perf_on_lap; /* CQL ON */
>> +	u8 stt_hs2_perf_on_lap; /* CQL ON */
>> +	u8 stt_apu_perf;
>> +	u8 stt_hs2_perf;
>> +	u8 stt_apu_balanced;
>> +	u8 stt_hs2_balanced;
>> +	u8 stt_apu_quiet;
>> +	u8 stt_hs2_quiet;
>> +	u32 stt_min_limit_perf_on_lap; /* CQL ON */
>> +	u32 stt_min_limit_perf;
>> +	u32 stt_min_limit_balanced;
>> +	u32 stt_min_limit_quiet;
>> +	/* SPL based */
>> +	u32 fppt_perf_on_lap; /* CQL ON */
>> +	u32 sppt_perf_on_lap; /* CQL ON */
>> +	u32 spl_perf_on_lap; /* CQL ON */
>> +	u32 sppt_apu_only_perf_on_lap; /* CQL ON */
>> +	u32 fppt_perf;
>> +	u32 sppt_perf;
>> +	u32 spl_perf;
>> +	u32 sppt_apu_only_perf;
>> +	u32 fppt_balanced;
>> +	u32 sppt_balanced;
>> +	u32 spl_balanced;
>> +	u32 sppt_apu_only_balanced;
>> +	u32 fppt_quiet;
>> +	u32 sppt_quiet;
>> +	u32 spl_quiet;
>> +	u32 sppt_apu_only_quiet;
>> +	/* Fan ID */
>> +	u32 fan_id_perf;
>> +	u32 fan_id_balanced;
>> +	u32 fan_id_quiet;
>> +} __packed;
>> +
>>  /* Core Layer */
>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>> @@ -191,4 +300,12 @@ void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>>  
>>  
>>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>> +
>> +/* Auto Mode Layer */
>> +void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
>> +int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
>> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>> +
>>  #endif /* PMF_H */

