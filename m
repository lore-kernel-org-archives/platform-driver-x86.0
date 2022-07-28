Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68BFC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 13:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbiG1NP5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 09:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237818AbiG1NP4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 09:15:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E3232A97D
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659014149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tixp/5jJ1NVGfx1ynjfkz8Lmkl6EKjfdJAwbnKBaqXI=;
        b=UFv6jo5stUzhoXYR6Se/SpJRclVbtz1RFPyBTFBJ/6LgLCEcbEcFvudiRC4vJEY847Ee+3
        qjaFve+XA3bx/DS8jwooj71gWWKSBb/+kDYrVOz4IxrIQp4WW0Cu2FUjbJO07ucz4B42rI
        Amic6WKYVYhwykce0qYWKHUDjgP+PJ4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-ytUV8kuuMm6BwGE3754RrQ-1; Thu, 28 Jul 2022 09:15:47 -0400
X-MC-Unique: ytUV8kuuMm6BwGE3754RrQ-1
Received: by mail-ed1-f72.google.com with SMTP id i5-20020a05640242c500b0043c17424381so1076627edc.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 06:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tixp/5jJ1NVGfx1ynjfkz8Lmkl6EKjfdJAwbnKBaqXI=;
        b=2KBmlUy/AISGNidPAReEwFcjAGucJ5T+TUiStwFF2j7pl5ilNaKPgUwtNtt/RLoQ2N
         7f4T/D8LOZ3aE1tWrLYrecdcc4Ynwgp0vpNUXx7xzNvPOkrCSGU09fcFP8KpezAJjfnN
         v5a3fasHYpXggeYTG/WZ6i9WOMGw6kqTZ2aHI2MaT6lzqNEa+aRWegRSfxHelduMF7s/
         GuNGvNQfD/CpG+Ju/L+MZ8Qi1ZMXApaMF/kny69W9n8DUXbGLAfqa6l/IFafEYQQ1521
         vb5XxruaEKAtSkGVwHXQTCoxiGfIRw/XomUoj+KyzQHBgVr7EhR8KzYz14vH05Q8unkm
         8UHA==
X-Gm-Message-State: AJIora+I2Umy42n8J1NWklxJbuiwbny8ZspAdX64Udb9pUHTV8Eg3mhN
        z+WGj4d9YHzRsQ3QXgTCjNNX4HxcY1uSugwfQI0XyC2vBbmvHWaCUxVTh0xjlKqx6du9lYTOedu
        a2h3SHANRoRlhbbZYf4SnbtN005M/lLf6EQ==
X-Received: by 2002:a05:6402:4386:b0:43b:e989:25a1 with SMTP id o6-20020a056402438600b0043be98925a1mr21774593edc.283.1659014146485;
        Thu, 28 Jul 2022 06:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sGLxTzh/J6j6dxxL0OFgdbFavPm30Tgzq4GBB9r0e1jH9pxS2LwTkcxyIRCG57E4j+JjYd+w==
X-Received: by 2002:a05:6402:4386:b0:43b:e989:25a1 with SMTP id o6-20020a056402438600b0043be98925a1mr21774547edc.283.1659014145885;
        Thu, 28 Jul 2022 06:15:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w26-20020a170906481a00b0072b4da1ed9asm394307ejq.225.2022.07.28.06.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 06:15:45 -0700 (PDT)
Message-ID: <8a85f72d-740e-faf1-63d7-6023e28812fd@redhat.com>
Date:   Thu, 28 Jul 2022 15:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 12/15] platform/x86/amd/pmf: Add support for Auto mode
 feature
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        Bastien Nocera <hadess@hadess.net>
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-13-Shyam-sundar.S-k@amd.com>
 <420cfb2d-e24e-f207-9444-37daac9aae55@redhat.com>
 <05716bc5-3671-e7bc-e936-41010fb72711@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <05716bc5-3671-e7bc-e936-41010fb72711@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 7/28/22 14:57, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 7/28/2022 2:52 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 7/12/22 16:58, Shyam Sundar S K wrote:
>>> The objective of this feature is to track the moving average of system
>>> power over the time period specified and switch to the subsequent mode.
>>>
>>> This feature has 3 modes: quiet, balanced, performance.
>>>
>>> In order to do this, PMF driver will get the moving average of APU power
>>> from PMFW and power threshold, time constants, system config parameters
>>> from OEM inputs.
>>>
>>> System power as read by PMF driver from PMFW is the filtered value over
>>> the sampling window. Every sampling window, moving average of system power
>>> is computed. At the end of the monitoring window, the moving average is
>>> compared against the threshold for mode switch for decision making.
>>>
>>> With AMD managing the system config limits, any mode switch within
>>> auto-mode will result in limits of fPPT/sPPT/STAPM or STT being scaled
>>> down.
>>>
>>> When "auto mode" is enabled, the static slider control remains out of
>>> the PMF driver, so the platform_profile registration would not
>>> happen in PMF driver.
>>
>> This is not what happens in the code, the platform_profile registration
>> is still happening AFAICT.
> 
> platform_profile_register gets called in amd_pmf_init_sps() and it gets
> triggered only when APMF_FUNC_STATIC_SLIDER_GRANULAR (fn9) is enabled in
> the BIOS.
> 
> OEMs have been already told in the BIOS implementation guide that, if
> the "Auto Mode" is enabled, the "Static platform_profile" registration
> shall happen at the OEM driver side. In this case, it will be
> thinkpad_acpi which shall do the "platform_profile_register".

I see. IMHO it would still be good to check that we never end up
with both the static-slider + AMT support enabled at the same time.

It is better to catch this; ignore the static-slider support
(clear the feature flag I guess) and log an error then to get surprised
by firmware bugs and having to figure out what is going on when
a user reports some weird bug.

> 
>>
>> Like with CnQF for this other auto mode we also need to figure out the
>> relation with the regular static platform_profile settings.
>>
>> I see this in the code:
>>
>> @@ -122,6 +122,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>  	/* Calculate the avg SoC power consumption */
>>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>>  
>> +	if (current_profile == PLATFORM_PROFILE_BALANCED) {
>> +		/* Apply the Auto Mode transition */
>> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>> +	}
>> +
>>
>> So it seems that unlike CnQF this other auto-mode only does mode transitions
>> when the static-slider is set to balanced ?
> 
> CnQF and Auto-mode are complimentary to eachother. The key difference
> between them are:
> 
> 1. CnQF will have 4 internal modes (low-power, balanced, performance,
> turbo) and Auto-mode will not have the turbo mode.
> 
> 2. CnQF will be enabled only when the APCI call to the BIOS function
> returns a spl flag which gets set from the BIOS side and driver sees it.
> That is when the driver activates the CnQF. Irrespective of the
> platform_profile choice selection, if the CnQF is enabled the values
> passed in the BIOS tables for static slider are ignored.

Right, this is rather "rude" though, to ignore a clear user preference.

We really need to think of the userspace API results here. Arguably
when CnQF gets enabled the platform_profile handler should just be
unregistered to indicate that there is no platform_profile support.

IMHO that would be better then still advertising platform_profile
support and not have it working.

Also platform_profile support is also used to implement a low-battery
mode where userspace automatically switches the profile to low-power
when the battery is below say 20%. How is such a power-saver mode
supposed to be implemented with CnQF ?

> 3. Auto-mode will get activated only when an AMT ON event (which will be
> sent by thinkpad_acpi driver in this case) is received and the
> platform_profile is set to balanced. In other modes it keeps turned off.

Right, note that as discussed elsewhere in the thread the decision to
only enable AMT when platform_profile == balanced is a policy coded
inside the thinkpad_acpi code and IMHO this policy decision should not
be duplicated in the amd-pmf code. Instead it should just enable/disable
AMT soleley on the BIOS AMT enable/disable setting/events.

> 4. The sampling window, the threshold calculation mechanism and the
> power floor measurements are different w.r.t to CnQF and auto-mode.
> 
> 5. OEMs are free to choose what kind of optimizations they are looking
> for by enabling one or more of such features within PMF.
> 
> Hope it clarifies :-)

It helps a bit, but there are still questions. Off-list Mario suggested
to maybe just drop CnQF from the patch-set (for now) and first focus on
getting the amd-pmf code to work in the thinkpad case. And then once
that is solved re-introduce the CnQF patches/code. I think that might
be a good idea to move this forward a bit faster. Especially since
the CnQF story involves some userspace API issues (as mentioned) and
I would like to make sure we get the userspace API issues cleared up
before merging the CnQF bits.

>>> The transition to auto-mode only happens when the APMF fn5 is enabled
>>> in BIOS, platform_profile set to "balanced" and a AMT
>>> (Auto Mode transition) is received.
>>
>> Right, this part of the commit msg matches the code, but it conflicts with
>> the "When "auto mode" is enabled, the static slider control remains out of
>> the PMF driver:" part of the commit msg above.

Note this bit of the commit message needs to be claried that the mentioned
platform_profile setting is coming from another driver and not form
amd-pmf. Or better yet as mentioned just only check the BIOS AMT flag
and then this bit of the commit msg can simply be dropped.

Regards,

Hans



>>
>>>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/platform/x86/amd/pmf/Makefile    |   2 +-
>>>  drivers/platform/x86/amd/pmf/acpi.c      |  28 ++
>>>  drivers/platform/x86/amd/pmf/auto-mode.c | 317 +++++++++++++++++++++++
>>>  drivers/platform/x86/amd/pmf/core.c      |  25 +-
>>>  drivers/platform/x86/amd/pmf/pmf.h       | 104 ++++++++
>>>  5 files changed, 473 insertions(+), 3 deletions(-)
>>>  create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>>> index d02a0bdc6429..2a9568bf9064 100644
>>> --- a/drivers/platform/x86/amd/pmf/Makefile
>>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>>> @@ -6,4 +6,4 @@
>>>  
>>>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>>>  amd-pmf-objs := core.o acpi.o sps.o \
>>> -		cnqf.o
>>> +		cnqf.o auto-mode.o
>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>> index a3ff91c605b5..e9f33e61659f 100644
>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>> @@ -55,6 +55,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>>  {
>>>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>>>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>>> +	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>>>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>>>  	func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
>>>  	func->dyn_slider_dc = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_DC;
>>> @@ -210,6 +211,33 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
>>>  	return err;
>>>  }
>>>  
>>> +int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data)
>>> +{
>>> +	union acpi_object *info;
>>> +	size_t size;
>>> +	int err = 0;
>>> +
>>> +	info = apmf_if_call(ampf_if, APMF_FUNC_AUTO_MODE, NULL);
>>> +	if (!info)
>>> +		return -EIO;
>>> +
>>> +	size = *(u16 *)info->buffer.pointer;
>>> +
>>> +	if (size < sizeof(*data)) {
>>> +		pr_debug("buffer too small %zu\n", size);
>>> +		err = -EINVAL;
>>> +		goto out;
>>> +	}
>>> +
>>> +	size = min(sizeof(*data), size);
>>> +	memset(data, 0, sizeof(*data));
>>> +	memcpy(data, info->buffer.pointer, size);
>>> +
>>> +out:
>>> +	kfree(info);
>>> +	return err;
>>> +}
>>> +
>>
>> Please use apmf_if_call_store_buffer() for this (see review of 4/15)
>>
>> Regards,
>>
>> Hans
>>
>>
>>>  int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data)
>>>  {
>>>  	union acpi_object *info;
>>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>>> new file mode 100644
>>> index 000000000000..954fde25e71e
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>>> @@ -0,0 +1,317 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * AMD Platform Management Framework Driver
>>> + *
>>> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
>>> + * All Rights Reserved.
>>> + *
>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/list.h>
>>> +#include <linux/workqueue.h>
>>> +#include "pmf.h"
>>> +
>>> +#define AVG_SAMPLE_SIZE 3
>>> +
>>> +struct power_history {
>>> +	int socket_power;
>>> +	struct list_head list;
>>> +	int avg;
>>> +	int total;
>>> +};
>>> +
>>> +struct list_pdata {
>>> +	int total;
>>> +	int avg;
>>> +};
>>> +
>>> +static struct power_history power_list;
>>> +static struct list_pdata pdata;
>>> +
>>> +static struct auto_mode_mode_config config_store;
>>> +static const char *state_as_str(unsigned int state);
>>> +
>>> +static void amd_pmf_handle_automode(struct amd_pmf_dev *dev, bool op, int idx,
>>> +				    struct auto_mode_mode_config *table)
>>> +{
>>> +	if (op == SLIDER_OP_SET) {
>>> +		struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
>>> +
>>> +		amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
>>> +		amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
>>> +		amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
>>> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
>>> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
>>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>>> +				 pwr_ctrl->stt_skin_temp[STT_TEMP_APU], NULL);
>>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>>> +				 pwr_ctrl->stt_skin_temp[STT_TEMP_HS2], NULL);
>>> +	} else if (op == SLIDER_OP_GET) {
>>> +		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE,
>>> +				 &table->mode_set[idx].power_control.spl);
>>> +		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE,
>>> +				 &table->mode_set[idx].power_control.fppt);
>>> +		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE,
>>> +				 &table->mode_set[idx].power_control.sppt);
>>> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
>>> +				 &table->mode_set[idx].power_control.sppt_apu_only);
>>> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
>>> +				 &table->mode_set[idx].power_control.stt_min);
>>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
>>> +				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_APU]);
>>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
>>> +				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_HS2]);
>>> +	}
>>> +
>>> +	if (dev->apmf_if->func.fan_table_idx)
>>> +		apmf_update_fan_idx(dev->apmf_if, config_store.mode_set[idx].fan_control.manual,
>>> +				    config_store.mode_set[idx].fan_control.fan_id);
>>> +}
>>> +
>>> +static int amd_pmf_get_moving_avg(int socket_power)
>>> +{
>>> +	struct power_history *tmp;
>>> +	struct list_head *pos, *q;
>>> +	static int count;
>>> +
>>> +	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>>> +	tmp->socket_power = socket_power;
>>> +	list_add_tail(&tmp->list, &power_list.list);
>>> +
>>> +	list_for_each_safe(pos, q, &power_list.list) {
>>> +		if (count >= AVG_SAMPLE_SIZE) {
>>> +			tmp = list_first_entry(pos, struct power_history, list);
>>> +			list_del_init(pos);
>>> +			goto next;
>>> +		}
>>> +	}
>>> +
>>> +next:
>>> +	pdata.total = 0;
>>> +	pdata.avg = 0;
>>> +
>>> +	list_for_each(pos, &power_list.list) {
>>> +		tmp = list_entry(pos, struct power_history, list);
>>> +		pdata.total += tmp->socket_power;
>>> +		pdata.avg = pdata.total / AVG_SAMPLE_SIZE;
>>> +	}
>>> +
>>> +	count++;
>>> +	if (count >= AVG_SAMPLE_SIZE)
>>> +		return pdata.avg;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
>>> +{
>>> +	int avg_power = 0;
>>> +	bool update = false;
>>> +	int i, j;
>>> +
>>> +	/* Get the average moving average computed by auto mode algorithm */
>>> +	avg_power = amd_pmf_get_moving_avg(socket_power);
>>> +
>>> +	for (i = 0; i < AUTO_TRANSITION_MAX; i++) {
>>> +		if ((config_store.transition[i].shifting_up && avg_power >=
>>> +		     config_store.transition[i].power_threshold) ||
>>> +		    (!config_store.transition[i].shifting_up && avg_power <=
>>> +		     config_store.transition[i].power_threshold)) {
>>> +			if (config_store.transition[i].timer <
>>> +			    config_store.transition[i].time_constant)
>>> +				config_store.transition[i].timer += time_elapsed_ms;
>>> +		} else {
>>> +			config_store.transition[i].timer = 0;
>>> +		}
>>> +
>>> +		if (config_store.transition[i].timer >=
>>> +		    config_store.transition[i].time_constant &&
>>> +		    !config_store.transition[i].applied) {
>>> +			config_store.transition[i].applied = true;
>>> +			update = true;
>>> +		} else if (config_store.transition[i].timer <=
>>> +			   config_store.transition[i].time_constant &&
>>> +			   config_store.transition[i].applied) {
>>> +			config_store.transition[i].applied = false;
>>> +			update = true;
>>> +		}
>>> +	}
>>> +
>>> +	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
>>> +		state_as_str(config_store.current_mode));
>>> +
>>> +	if (update) {
>>> +		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>>> +			/* Apply the mode with highest priority indentified */
>>> +			if (config_store.transition[j].applied) {
>>> +				if (config_store.current_mode !=
>>> +				    config_store.transition[j].target_mode) {
>>> +					config_store.current_mode =
>>> +							config_store.transition[j].target_mode;
>>> +					dev_dbg(dev->dev, "[AUTO_MODE] moving to mode:%s\n",
>>> +						state_as_str(config_store.current_mode));
>>> +					amd_pmf_handle_automode(dev, SLIDER_OP_SET,
>>> +								config_store.current_mode, NULL);
>>> +				}
>>> +				break;
>>> +			}
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +static void amd_pmf_get_power_threshold(void)
>>> +{
>>> +	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
>>> +				config_store.mode_set[AUTO_BALANCE].power_floor -
>>> +				config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta;
>>> +
>>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold =
>>> +				config_store.mode_set[AUTO_BALANCE].power_floor -
>>> +				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta;
>>> +
>>> +	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_threshold =
>>> +			config_store.mode_set[AUTO_QUIET].power_floor -
>>> +			config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta;
>>> +
>>> +	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
>>> +		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
>>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
>>> +}
>>> +
>>> +static const char *state_as_str(unsigned int state)
>>> +{
>>> +	switch (state) {
>>> +	case AUTO_QUIET:
>>> +		return "QUIET";
>>> +	case AUTO_BALANCE:
>>> +		return "BALANCED";
>>> +	case AUTO_PERFORMANCE_ON_LAP:
>>> +		return "ON_LAP";
>>> +	case AUTO_PERFORMANCE:
>>> +		return "PERFORMANCE";
>>> +	default:
>>> +		return "Unknown Auto Mode State";
>>> +	}
>>> +}
>>> +
>>> +void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>>> +{
>>> +	struct apmf_auto_mode output;
>>> +	struct power_table_control *pwr_ctrl;
>>> +	int i;
>>> +
>>> +	if (dev->apmf_if->func.auto_mode_def) {
>>> +		apmf_get_auto_mode_def(dev->apmf_if, &output);
>>> +		/* time constant */
>>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant =
>>> +									output.balanced_to_quiet;
>>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant =
>>> +									output.balanced_to_perf;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant =
>>> +									output.quiet_to_balanced;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant =
>>> +									output.perf_to_balanced;
>>> +
>>> +		/* power floor */
>>> +		config_store.mode_set[AUTO_QUIET].power_floor = output.pfloor_quiet;
>>> +		config_store.mode_set[AUTO_BALANCE].power_floor = output.pfloor_balanced;
>>> +		config_store.mode_set[AUTO_PERFORMANCE].power_floor = output.pfloor_perf;
>>> +		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_floor = output.pfloor_perf;
>>> +
>>> +		/* Power delta for mode change */
>>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta =
>>> +									output.pd_balanced_to_quiet;
>>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta =
>>> +									output.pd_balanced_to_perf;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta =
>>> +									output.pd_quiet_to_balanced;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta =
>>> +									output.pd_perf_to_balanced;
>>> +
>>> +		/* Power threshold */
>>> +		amd_pmf_get_power_threshold();
>>> +
>>> +		/* skin temperature limits */
>>> +		pwr_ctrl = &config_store.mode_set[AUTO_QUIET].power_control;
>>> +		pwr_ctrl->spl = output.spl_quiet;
>>> +		pwr_ctrl->sppt = output.sppt_quiet;
>>> +		pwr_ctrl->fppt = output.fppt_quiet;
>>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_quiet;
>>> +		pwr_ctrl->stt_min = output.stt_min_limit_quiet;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_quiet;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_quiet;
>>> +
>>> +		pwr_ctrl = &config_store.mode_set[AUTO_BALANCE].power_control;
>>> +		pwr_ctrl->spl = output.spl_balanced;
>>> +		pwr_ctrl->sppt = output.sppt_balanced;
>>> +		pwr_ctrl->fppt = output.fppt_balanced;
>>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_balanced;
>>> +		pwr_ctrl->stt_min = output.stt_min_limit_balanced;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_balanced;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_balanced;
>>> +
>>> +		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE].power_control;
>>> +		pwr_ctrl->spl = output.spl_perf;
>>> +		pwr_ctrl->sppt = output.sppt_perf;
>>> +		pwr_ctrl->fppt = output.fppt_perf;
>>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf;
>>> +		pwr_ctrl->stt_min = output.stt_min_limit_perf;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf;
>>> +
>>> +		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_control;
>>> +		pwr_ctrl->spl = output.spl_perf_on_lap;
>>> +		pwr_ctrl->sppt = output.sppt_perf_on_lap;
>>> +		pwr_ctrl->fppt = output.fppt_perf_on_lap;
>>> +		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf_on_lap;
>>> +		pwr_ctrl->stt_min = output.stt_min_limit_perf_on_lap;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf_on_lap;
>>> +		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf_on_lap;
>>> +
>>> +		/* Fan ID */
>>> +		config_store.mode_set[AUTO_QUIET].fan_control.fan_id = output.fan_id_quiet;
>>> +		config_store.mode_set[AUTO_BALANCE].fan_control.fan_id = output.fan_id_balanced;
>>> +		config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id = output.fan_id_perf;
>>> +		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].fan_control.fan_id =
>>> +										output.fan_id_perf;
>>> +
>>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].target_mode = AUTO_QUIET;
>>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>>> +									AUTO_PERFORMANCE;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].target_mode =
>>> +										AUTO_BALANCE;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].target_mode =
>>> +										AUTO_BALANCE;
>>> +
>>> +		config_store.transition[AUTO_TRANSITION_TO_QUIET].shifting_up = false;
>>> +		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].shifting_up = true;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].shifting_up = true;
>>> +		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].shifting_up =
>>> +											false;
>>> +
>>> +		for (i = 0 ; i < AUTO_MODE_MAX ; i++) {
>>> +			if (config_store.mode_set[i].fan_control.fan_id == FAN_INDEX_AUTO)
>>> +				config_store.mode_set[i].fan_control.manual = false;
>>> +			else
>>> +				config_store.mode_set[i].fan_control.manual = true;
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
>>> +{
>>> +	cancel_delayed_work_sync(&dev->work_buffer);
>>> +}
>>> +
>>> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
>>> +{
>>> +	INIT_LIST_HEAD(&power_list.list);
>>> +
>>> +	amd_pmf_init_metrics_table(dev);
>>> +	amd_pmf_load_defaults_auto_mode(dev);
>>> +
>>> +	/* update the thermal for Automode */
>>> +	amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>>> +}
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>> index bc267d333b76..674ddf599135 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -122,6 +122,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>>  	/* Calculate the avg SoC power consumption */
>>>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>>>  
>>> +	if (current_profile == PLATFORM_PROFILE_BALANCED) {
>>> +		/* Apply the Auto Mode transition */
>>> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>>> +	}
>>> +
>>>  	if (dev->cnqf_feat) {
>>>  		/* Apply the CnQF transition */
>>>  		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
>>> @@ -260,9 +265,18 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>>  		amd_pmf_init_sps(dev);
>>>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>>>  	}
>>> -	/* Enable Cool n Quiet Framework (CnQF) */
>>> -	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
>>> +
>>> +	/* Enable Auto Mode */
>>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
>>> +		amd_pmf_init_auto_mode(dev);
>>> +		dev_dbg(dev->dev, "Auto Mode Init done\n");
>>> +		/*
>>> +		 * Auto mode and CnQF cannot co-exist. If auto mode is supported it takes
>>> +		 * higher priority over CnQF.
>>> +		 */
>>> +	} else if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
>>>  	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC)) {
>>> +		/* Enable Cool n Quiet Framework (CnQF) */
>>>  		amd_pmf_init_cnqf(dev);
>>>  		dev_dbg(dev->dev, "CnQF Init done\n");
>>>  	}
>>> @@ -272,6 +286,13 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>>  {
>>>  	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
>>>  		amd_pmf_deinit_sps(dev);
>>> +
>>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
>>> +		amd_pmf_deinit_auto_mode(dev);
>>> +		/* If auto mode is supported, there is no need to proceed */
>>> +		return;
>>> +	}
>>> +
>>>  	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
>>>  	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC))
>>>  		amd_pmf_deinit_cnqf(dev);
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 452266809dfa..0532f49e9613 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -18,6 +18,7 @@
>>>  #define APMF_FUNC_VERIFY_INTERFACE			0
>>>  #define APMF_FUNC_GET_SYS_PARAMS			1
>>>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
>>> +#define APMF_FUNC_AUTO_MODE					5
>>>  #define APMF_FUNC_SET_FAN_IDX				7
>>>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
>>>  #define APMF_FUNC_DYN_SLIDER_GRANULAR_AC	11
>>> @@ -51,6 +52,7 @@
>>>  struct apmf_if_functions {
>>>  	bool system_params;
>>>  	bool sbios_heartbeat;
>>> +	bool auto_mode_def;
>>>  	bool fan_table_idx;
>>>  	bool static_slider_granular;
>>>  	bool dyn_slider_ac;
>>> @@ -197,6 +199,33 @@ struct fan_table_control {
>>>  	unsigned long fan_id;
>>>  };
>>>  
>>> +/* Auto Mode Layer */
>>> +enum auto_mode_transition_priority {
>>> +	AUTO_TRANSITION_TO_PERFORMANCE, /* Any other mode to Performance Mode */
>>> +	AUTO_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
>>> +	AUTO_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
>>> +	AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance Mode to Balance Mode */
>>> +	AUTO_TRANSITION_MAX,
>>> +};
>>> +
>>> +enum auto_mode_mode {
>>> +	AUTO_QUIET,
>>> +	AUTO_BALANCE,
>>> +	AUTO_PERFORMANCE_ON_LAP,
>>> +	AUTO_PERFORMANCE,
>>> +	AUTO_MODE_MAX,
>>> +};
>>> +
>>> +struct auto_mode_trans_params {
>>> +	u32	time_constant; /* minimum time required to switch to next mode */
>>> +	u32 power_delta; /* delta power to shift mode */
>>> +	u32 power_threshold;
>>> +	u32	timer; /* elapsed time. if timer > TimeThreshold, it will move to next mode */
>>> +	u32 applied;
>>> +	enum auto_mode_mode target_mode;
>>> +	u32 shifting_up;
>>> +};
>>> +
>>>  struct power_table_control {
>>>  	u32 spl;
>>>  	u32 sppt;
>>> @@ -207,6 +236,74 @@ struct power_table_control {
>>>  	u32 reserved[16];
>>>  };
>>>  
>>> +struct auto_mode_mode_settings {
>>> +	struct power_table_control power_control;
>>> +	struct fan_table_control fan_control;
>>> +	u32 power_floor;
>>> +};
>>> +
>>> +struct auto_mode_mode_config {
>>> +	struct auto_mode_trans_params transition[AUTO_TRANSITION_MAX];
>>> +	struct auto_mode_mode_settings mode_set[AUTO_MODE_MAX];
>>> +	enum auto_mode_mode current_mode;
>>> +	bool on_lap;
>>> +	bool better_perf;
>>> +	u32 amt_enabled; /* Auto Mode Transition */
>>> +	u32 avg_power;
>>> +};
>>> +
>>> +struct apmf_auto_mode {
>>> +	u16 size;
>>> +	/* time constant */
>>> +	u32 balanced_to_perf;
>>> +	u32 perf_to_balanced;
>>> +	u32 quiet_to_balanced;
>>> +	u32 balanced_to_quiet;
>>> +	/* power floor */
>>> +	u32 pfloor_perf;
>>> +	u32 pfloor_balanced;
>>> +	u32 pfloor_quiet;
>>> +	/* Power delta for mode change */
>>> +	u32 pd_balanced_to_perf;
>>> +	u32 pd_perf_to_balanced;
>>> +	u32 pd_quiet_to_balanced;
>>> +	u32 pd_balanced_to_quiet;
>>> +	/* skin temperature limits */
>>> +	u8 stt_apu_perf_on_lap; /* CQL ON */
>>> +	u8 stt_hs2_perf_on_lap; /* CQL ON */
>>> +	u8 stt_apu_perf;
>>> +	u8 stt_hs2_perf;
>>> +	u8 stt_apu_balanced;
>>> +	u8 stt_hs2_balanced;
>>> +	u8 stt_apu_quiet;
>>> +	u8 stt_hs2_quiet;
>>> +	u32 stt_min_limit_perf_on_lap; /* CQL ON */
>>> +	u32 stt_min_limit_perf;
>>> +	u32 stt_min_limit_balanced;
>>> +	u32 stt_min_limit_quiet;
>>> +	/* SPL based */
>>> +	u32 fppt_perf_on_lap; /* CQL ON */
>>> +	u32 sppt_perf_on_lap; /* CQL ON */
>>> +	u32 spl_perf_on_lap; /* CQL ON */
>>> +	u32 sppt_apu_only_perf_on_lap; /* CQL ON */
>>> +	u32 fppt_perf;
>>> +	u32 sppt_perf;
>>> +	u32 spl_perf;
>>> +	u32 sppt_apu_only_perf;
>>> +	u32 fppt_balanced;
>>> +	u32 sppt_balanced;
>>> +	u32 spl_balanced;
>>> +	u32 sppt_apu_only_balanced;
>>> +	u32 fppt_quiet;
>>> +	u32 sppt_quiet;
>>> +	u32 spl_quiet;
>>> +	u32 sppt_apu_only_quiet;
>>> +	/* Fan ID */
>>> +	u32 fan_id_perf;
>>> +	u32 fan_id_balanced;
>>> +	u32 fan_id_quiet;
>>> +} __packed;
>>> +
>>>  /* CnQF Layer */
>>>  enum cnqf_trans_priority {
>>>  	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
>>> @@ -317,6 +414,13 @@ void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>>>  
>>>  int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>>>  
>>> +/* Auto Mode Layer */
>>> +void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
>>> +int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
>>> +void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>>> +void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>>> +
>>>  /* CnQF Layer */
>>>  int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
>>>  int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
>>
> 

