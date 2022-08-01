Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3A7C19F29
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 13:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiHANUN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 09:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiHANUM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 09:20:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6EE34FB
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659360008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z/FEOqh32BBQT3ZBD5QNIFcpSFNZNZZH2CrCobVjSa4=;
        b=QVdcCkHmoP7kNLn4db90fMyEakTuYk082BafQQiYIeiQS1CfLZupOCD2BiFRVDaHenDrYJ
        NREsXwPHlmO2ZEwmNRHVkQ/s6a2GwoLu7GPR2Bc+VzIyHwyvT8CGWiRTGlwXWxpDR59SUz
        IQzK1LIE/H7R5Rbzux2P4icqF8npRQk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-fPuq5ggwPKem0BHJIZUI3g-1; Mon, 01 Aug 2022 09:20:07 -0400
X-MC-Unique: fPuq5ggwPKem0BHJIZUI3g-1
Received: by mail-ed1-f69.google.com with SMTP id m22-20020a056402431600b0043d6a88130aso2881258edc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 06:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Z/FEOqh32BBQT3ZBD5QNIFcpSFNZNZZH2CrCobVjSa4=;
        b=cDabKTko6Sa9GT+yhSwOZkNNfxyxznRjBbpzU3otdejJrUy4PnSSbSL8qVYDcwaYfc
         zzbBpYziYV24ZvinZ9s7MDV4iKzqfN6zAybDTz+/TWJJZXX36Lzvy/Ct6A+R71QuOZvi
         f6VdQEFAx0RZkjCR1lMC4ciZAFrYglsMGyZo8Jxspwybb3IKoqMvFRQK7QJbEioKpjgb
         NnTEDHqJi8fQqxahGW+2fs8R9F8MS7Z9W5Vcc1ibt5l2uF5DZsJtcezfNFDLqymAZUhL
         MxJ08+O/Vu2ZotEWjBwxgBqPxenbM+oNTNjqmg015uzdhMWHnYrBm6hARgctcdRnzSY0
         rXlw==
X-Gm-Message-State: AJIora/yq8hfzfMIuZ4T3ai7DejFEaXdCLW6UweDD1oJ33Dcem2u8V3a
        ziR+agwlOfFSOfk04G1WMBfC5l0I8tQmkFXrtpyDcKKOq1BYpgDdORbJiZu7+80Igbs53hUUfb5
        42SG+CTn62jQoDk1Xw7cDSpnLVPdxRkq/lg==
X-Received: by 2002:a05:6402:5249:b0:43c:cb3e:d7f8 with SMTP id t9-20020a056402524900b0043ccb3ed7f8mr16167217edd.56.1659360005961;
        Mon, 01 Aug 2022 06:20:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNBTzvfx6nmNmbSB4Zmu+AQ/+mKTlYFrOoXRP41XtDpAqtmMiNkKI/mjmlXgobbU8vvN3+cA==
X-Received: by 2002:a05:6402:5249:b0:43c:cb3e:d7f8 with SMTP id t9-20020a056402524900b0043ccb3ed7f8mr16167187edd.56.1659360005604;
        Mon, 01 Aug 2022 06:20:05 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906328700b00722e8c47cc9sm5163323ejw.181.2022.08.01.06.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 06:20:05 -0700 (PDT)
Message-ID: <cb52d95e-11df-95a8-4b1d-26d703bfab46@redhat.com>
Date:   Mon, 1 Aug 2022 15:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 08/11] platform/x86/amd/pmf: Add support for
 Auto mode feature
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-9-Shyam-sundar.S-k@amd.com>
 <805fd0f5-6b18-5518-14b5-cf62fd75737d@redhat.com>
In-Reply-To: <805fd0f5-6b18-5518-14b5-cf62fd75737d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/1/22 14:55, Hans de Goede wrote:
> Hi,
> 
> On 7/28/22 20:20, Shyam Sundar S K wrote:
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
>>  drivers/platform/x86/amd/pmf/acpi.c      |   7 +
>>  drivers/platform/x86/amd/pmf/auto-mode.c | 317 +++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c      |   9 +
>>  drivers/platform/x86/amd/pmf/pmf.h       | 115 ++++++++
>>  5 files changed, 450 insertions(+), 1 deletion(-)
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
>> index 1814d48f8e44..724150ec58fb 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -99,6 +99,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>  {
>>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>> +	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
> 
> I just noticed that this is not correct, this should be:
> 
> 	func->system_params = mask & BIT(APMF_FUNC_... - 1);
> 
> Which does something completely different!
> 
> Also this information is duplicated by:
> 
> is_apmf_func_supported(APMF_FUNC_...) so please drop the apmf_if_functions
> struct completely and use is_apmf_func_supported() everywhere.
> 
>>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>>  }
>>  
>> @@ -160,6 +161,12 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
>>  	return err;
>>  }
>>  
>> +int apmf_get_auto_mode_def(struct apmf_if *apmf_if, struct apmf_auto_mode *data)
>> +{
>> +	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_AUTO_MODE,
>> +					 data, sizeof(*data));
>> +}
>> +
>>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>>  {
>>  	struct apmf_verify_interface output;
>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>> new file mode 100644
>> index 000000000000..954fde25e71e
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>> @@ -0,0 +1,317 @@
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
>> +#include <linux/list.h>
> 
> Please drop the list.h include, see below.
> 
>> +#include <linux/workqueue.h>
>> +#include "pmf.h"
>> +
>> +#define AVG_SAMPLE_SIZE 3
>> +
> 
> please replace the code from here.
> 
>> +struct power_history {
>> +	int socket_power;
>> +	struct list_head list;
>> +	int avg;
>> +	int total;
>> +};
>> +
>> +struct list_pdata {
>> +	int total;
>> +	int avg;
>> +};
>> +
>> +static struct power_history power_list;
>> +static struct list_pdata pdata;
> 
> to here with:
> 
> static int socket_power_history[AVG_SAMPLE_SIZE];
> static int socket_power_history_idx = -1;
> 
>> +
>> +static struct auto_mode_mode_config config_store;
>> +static const char *state_as_str(unsigned int state);
>> +
>> +static void amd_pmf_handle_automode(struct amd_pmf_dev *dev, bool op, int idx,
>> +				    struct auto_mode_mode_config *table)
>> +{
> 
> all callers use SLIDER_OP_GET for the "op" argument. Please rename this to
> amd_pmf_set_automode(), drop the "op" argument and drop the SLIDER_OP_GET
> handling code.
> 
>> +	if (op == SLIDER_OP_SET) {
>> +		struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
>> +
>> +		amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
>> +		amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
>> +		amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
>> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
>> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +				 pwr_ctrl->stt_skin_temp[STT_TEMP_APU], NULL);
>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +				 pwr_ctrl->stt_skin_temp[STT_TEMP_HS2], NULL);
>> +	} else if (op == SLIDER_OP_GET) {
>> +		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE,
>> +				 &table->mode_set[idx].power_control.spl);
>> +		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE,
>> +				 &table->mode_set[idx].power_control.fppt);
>> +		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE,
>> +				 &table->mode_set[idx].power_control.sppt);
>> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
>> +				 &table->mode_set[idx].power_control.sppt_apu_only);
>> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
>> +				 &table->mode_set[idx].power_control.stt_min);
>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
>> +				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_APU]);
>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
>> +				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_HS2]);
>> +	}
>> +
>> +	if (dev->apmf_if->func.fan_table_idx)
>> +		apmf_update_fan_idx(dev->apmf_if, config_store.mode_set[idx].fan_control.manual,
>> +				    config_store.mode_set[idx].fan_control.fan_id);
>> +}
>> +
>> +static int amd_pmf_get_moving_avg(int socket_power)
>> +{
>> +	struct power_history *tmp;
>> +	struct list_head *pos, *q;
>> +	static int count;
> 
> Why is this here, but is power_list a global ?
> 
> Note that you can initialize a (static) list while declaring it. E.g. :
> 
> 	static LIST_HEAD(power_list);
> 
> But as I mention below this whole code can be mode much much simpler.
> 
>> +
>> +	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>> +	tmp->socket_power = socket_power;
>> +	list_add_tail(&tmp->list, &power_list.list);
>> +
>> +	list_for_each_safe(pos, q, &power_list.list) {
>> +		if (count >= AVG_SAMPLE_SIZE) {
>> +			tmp = list_first_entry(pos, struct power_history, list);
>> +			list_del_init(pos);
>> +			goto next;
>> +		}
>> +	}
>> +
>> +next:
>> +	pdata.total = 0;
>> +	pdata.avg = 0;
>> +
>> +	list_for_each(pos, &power_list.list) {
>> +		tmp = list_entry(pos, struct power_history, list);
>> +		pdata.total += tmp->socket_power;
>> +		pdata.avg = pdata.total / AVG_SAMPLE_SIZE;
>> +	}
>> +
>> +	count++;
>> +	if (count >= AVG_SAMPLE_SIZE)
>> +		return pdata.avg;
>> +
>> +	return 0;
>> +}
> 
> Please replace all this list + alloc + free magic which is very hard to review
> and needlessly complicated with this much simpler implementation:
> 
> static int amd_pmf_get_moving_avg(int socket_power)
> {
> 	int i, total = 0;
> 
> 	if (socket_power_history_idx == -1) {
> 		for (i = 0; i < AVG_SAMPLE_SIZE; i++)
> 			socket_power_history[i] = socket_power;
> 	}
> 
> 	socket_power_history_idx = (socket_power_history_idx + 1) % AVG_SAMPLE_SIZE;
> 	socket_power_history[socket_power_history_idx] = socket_power;
> 
> 	for (i = 0; i < AVG_SAMPLE_SIZE; i++)
> 		total += socket_power_history[i];
> 
> 	return total / AVG_SAMPLE_SIZE;
> }

A quick follow up, please make the new version of this function take
a "struct amd_pmf_dev *pdev" argument and make the socket_power_history_idx
and socket_power_history[] variables members of amd_pmf_dev instead of making
them global variables.

Regards,

Hans

> 
>> +
>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
>> +{
>> +	int avg_power = 0;
>> +	bool update = false;
>> +	int i, j;
>> +
>> +	/* Get the average moving average computed by auto mode algorithm */
>> +	avg_power = amd_pmf_get_moving_avg(socket_power);
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
>> +					amd_pmf_handle_automode(dev, SLIDER_OP_SET,
>> +								config_store.current_mode, NULL);
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
>> +	if (dev->apmf_if->func.auto_mode_def) {
> 
> This is already checked by the "if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))"
> check inside amd_pmf_init_features(), please drop this check.
> 
>> +		apmf_get_auto_mode_def(dev->apmf_if, &output);
>> +		/* time constant */
>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant =
>> +									output.balanced_to_quiet;
>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant =
>> +									output.balanced_to_perf;
>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant =
>> +									output.quiet_to_balanced;
>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant =
>> +									output.perf_to_balanced;
>> +
>> +		/* power floor */
>> +		config_store.mode_set[AUTO_QUIET].power_floor = output.pfloor_quiet;
>> +		config_store.mode_set[AUTO_BALANCE].power_floor = output.pfloor_balanced;
>> +		config_store.mode_set[AUTO_PERFORMANCE].power_floor = output.pfloor_perf;
>> +		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_floor = output.pfloor_perf;
>> +
>> +		/* Power delta for mode change */
>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta =
>> +									output.pd_balanced_to_quiet;
>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta =
>> +									output.pd_balanced_to_perf;
>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta =
>> +									output.pd_quiet_to_balanced;
>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta =
>> +									output.pd_perf_to_balanced;
>> +
>> +		/* Power threshold */
>> +		amd_pmf_get_power_threshold();
>> +
>> +		/* skin temperature limits */
>> +		pwr_ctrl = &config_store.mode_set[AUTO_QUIET].power_control;
>> +		pwr_ctrl->spl = output.spl_quiet;
>> +		pwr_ctrl->sppt = output.sppt_quiet;
>> +		pwr_ctrl->fppt = output.fppt_quiet;
>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_quiet;
>> +		pwr_ctrl->stt_min = output.stt_min_limit_quiet;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_quiet;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_quiet;
>> +
>> +		pwr_ctrl = &config_store.mode_set[AUTO_BALANCE].power_control;
>> +		pwr_ctrl->spl = output.spl_balanced;
>> +		pwr_ctrl->sppt = output.sppt_balanced;
>> +		pwr_ctrl->fppt = output.fppt_balanced;
>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_balanced;
>> +		pwr_ctrl->stt_min = output.stt_min_limit_balanced;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_balanced;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_balanced;
>> +
>> +		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE].power_control;
>> +		pwr_ctrl->spl = output.spl_perf;
>> +		pwr_ctrl->sppt = output.sppt_perf;
>> +		pwr_ctrl->fppt = output.fppt_perf;
>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf;
>> +		pwr_ctrl->stt_min = output.stt_min_limit_perf;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf;
>> +
>> +		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_control;
>> +		pwr_ctrl->spl = output.spl_perf_on_lap;
>> +		pwr_ctrl->sppt = output.sppt_perf_on_lap;
>> +		pwr_ctrl->fppt = output.fppt_perf_on_lap;
>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf_on_lap;
>> +		pwr_ctrl->stt_min = output.stt_min_limit_perf_on_lap;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf_on_lap;
>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf_on_lap;
>> +
>> +		/* Fan ID */
>> +		config_store.mode_set[AUTO_QUIET].fan_control.fan_id = output.fan_id_quiet;
>> +		config_store.mode_set[AUTO_BALANCE].fan_control.fan_id = output.fan_id_balanced;
>> +		config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id = output.fan_id_perf;
>> +		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].fan_control.fan_id =
>> +										output.fan_id_perf;
>> +
>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].target_mode = AUTO_QUIET;
>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>> +									AUTO_PERFORMANCE;
>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].target_mode =
>> +										AUTO_BALANCE;
>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].target_mode =
>> +										AUTO_BALANCE;
>> +
>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].shifting_up = false;
>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].shifting_up = true;
>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].shifting_up = true;
>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].shifting_up =
>> +											false;
>> +
>> +		for (i = 0 ; i < AUTO_MODE_MAX ; i++) {
>> +			if (config_store.mode_set[i].fan_control.fan_id == FAN_INDEX_AUTO)
>> +				config_store.mode_set[i].fan_control.manual = false;
>> +			else
>> +				config_store.mode_set[i].fan_control.manual = true;
>> +		}
>> +	}
> 
> This function should also set config_store.current_mode to some sane default (probably balanced).
> 
>> +}
>> +
>> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
>> +{
>> +	cancel_delayed_work_sync(&dev->work_buffer);
>> +}
>> +
>> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
>> +{
>> +	INIT_LIST_HEAD(&power_list.list);
>> +
>> +	amd_pmf_init_metrics_table(dev);
> 
> amd_pmf_init_metrics_table(dev) starts the work, so this needs to be done as the last
> step in this function.
> 
>> +	amd_pmf_load_defaults_auto_mode(dev);
>> +
>> +	/* update the thermal for Automode */
>> +	amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>> +}
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index ede4eefc33a4..ef71f8326248 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -244,12 +244,21 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>  		amd_pmf_init_sps(dev);
>>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>>  	}
>> +
>> +	/* Enable Auto Mode */
>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
>> +		amd_pmf_init_auto_mode(dev);
>> +		dev_dbg(dev->dev, "Auto Mode Init done\n");
>> +	}
>>  }
>>  
>>  static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>  {
>>  	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
>>  		amd_pmf_deinit_sps(dev);
>> +
>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
>> +		amd_pmf_deinit_auto_mode(dev);
>>  }
>>  
>>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 49d3232ee2e0..4618ddc5a662 100644
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
>> @@ -49,6 +50,7 @@
>>  struct apmf_if_functions {
>>  	bool system_params;
>>  	bool sbios_heartbeat;
>> +	bool auto_mode_def;
>>  	bool fan_table_idx;
>>  	bool static_slider_granular;
>>  };
>> @@ -187,6 +189,111 @@ struct fan_table_control {
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
>> @@ -206,4 +313,12 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
>>  void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>>  
>>  int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>> +
>> +/* Auto Mode Layer */
>> +void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
>> +int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
>> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>> +
>>  #endif /* PMF_H */
> 
> Regards,
> 
> Hans

