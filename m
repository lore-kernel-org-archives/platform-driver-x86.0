Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07D0C19F2C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 12:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236919AbiHBMUX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 08:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbiHBMUV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 08:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 97D5638AE
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659442818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3uRF4lIDo5RP4FR0b3xAt/juXjCkiu48xF393wWx8xc=;
        b=dMc1pcnvIP+OKUaBx0ZdMOciimmfLBjJJda/606ZNys9KCX9to2ovPiAiTDzyTEFNyRKmB
        8u3ggX4lEztoGVymmQuwBCBZKH2JQc8Y+L/syZrybl0/xo1Ec7qM1ayGgtrk3dj5Bh9U/s
        02S4aJo0Ylu3zbxTBiIaPlVvSZf4am4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-nOAY94-ZONaZ3Q5Oltbc3g-1; Tue, 02 Aug 2022 08:20:17 -0400
X-MC-Unique: nOAY94-ZONaZ3Q5Oltbc3g-1
Received: by mail-ed1-f69.google.com with SMTP id h6-20020a05640250c600b0043d9964d2ceso3794275edb.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 05:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3uRF4lIDo5RP4FR0b3xAt/juXjCkiu48xF393wWx8xc=;
        b=aQ3lk1FfbhmwWcHQfNJHDo2tUaeSyLY8OG28SU0wG9iwueO5ZB2Vf3R9vJUqVCnW52
         JQSLbTpmBpZQsGS81gs1gJRp2ZRvMJSDoOhjmQVesfXsJOWKcCN7D6/vsJp3N7XlWJC9
         FUAAX1jBeF+Ej+9g5RYZngyCV3+DWNH9W0auUziXJBp64v6Sk3DdMWEF+s+5GPgA1ZzJ
         E+8i8B06jNeAaXppHgShj7STXmk7noTQo30OBd1QTmJtkIwJdx31X8ZFMjXn+G/SUUQu
         Zf4AsdmjahhCKfB4EzB8rIyOGNNnNwJ5rpLdkemFl9oOs8sAU6OcOuW7ahFXqyUsQ1Zc
         5nEw==
X-Gm-Message-State: AJIora/mPa/kM+uyVCoerezUb0v+0Yb9CR+RIqreakMRdpp4U16Aa6iz
        kwfaas6RHG69jEV79bTUjpqPqfh7m8TrkGsOaHDIppv0Hy20JC5ZbvzvpxZl8QWcmRVfj8FHaCR
        nxQzmPZ0wi6qLedQ9t265O+ATb5LuVfKl5Q==
X-Received: by 2002:a17:907:7fa9:b0:72f:36fd:ef89 with SMTP id qk41-20020a1709077fa900b0072f36fdef89mr16368652ejc.433.1659442816108;
        Tue, 02 Aug 2022 05:20:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uG0aXBI2SUOWIckgGu/DGDyRdNObaEOaAHH0pRcMdgEpWigL9SBoZ0UFr0fHN0bRPKDR8+Gw==
X-Received: by 2002:a17:907:7fa9:b0:72f:36fd:ef89 with SMTP id qk41-20020a1709077fa900b0072f36fdef89mr16368627ejc.433.1659442815675;
        Tue, 02 Aug 2022 05:20:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906309400b0072b4e4cd346sm6217651ejv.188.2022.08.02.05.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 05:20:14 -0700 (PDT)
Message-ID: <615bfe54-71fa-6772-b1c3-e5a6441a7223@redhat.com>
Date:   Tue, 2 Aug 2022 14:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 RESEND 09/11] platform/x86/amd/pmf: Handle AMT and CQL
 events for Auto mode
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-10-Shyam-sundar.S-k@amd.com>
 <a4b27d9d-f217-f9da-ac48-487e851f23e3@redhat.com>
 <3868af4d-8b88-fb80-af80-35bd2549490a@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3868af4d-8b88-fb80-af80-35bd2549490a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 13:22, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 8/1/2022 7:25 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 7/28/22 20:20, Shyam Sundar S K wrote:
>>> The transition to auto-mode happens when the PMF driver receives
>>> AMT (Auto Mode transition) event. transition logic will reside in the
>>> PMF driver but the events would come from other supported drivers[1].
>>>
>>> The thermal parameters would vary between when a performance "on-lap" mode
>>> is detected and versus when not. The CQL event would get triggered from
>>> other drivers, so that PMF driver would adjust the system thermal config
>>> based on the ACPI inputs.
>>>
>>> OEMs can control whether or not to enable AMT or CQL via other supported
>>> drivers[1] but the actual transition logic resides in the AMD PMF driver.
>>> When an AMT event is received the automatic mode transition RAPL algorithm
>>> will run. When a CQL event is received an performance "on-lap" mode will
>>> be enabled and thermal parameters will be adjusted accordingly.
>>>
>>> [1]
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Fcommit%2F%3Fh%3Dreview-hans%26id%3D755b249250df1b612d982f3b702c831b26ecdf73&amp;data=05%7C01%7Cshyam-sundar.s-k%40amd.com%7C1297e4cd71784092e05008da73c59095%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637949589653252953%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=5QDwDnnn45ZCwq2MfPQjv6ll27%2BPrj0QzffQIWX0ATo%3D&amp;reserved=0
>>>
>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Cc: Mark Pearson <markpearson@lenovo.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/platform/x86/amd/pmf/acpi.c      | 59 ++++++++++++++++++++++++
>>>  drivers/platform/x86/amd/pmf/auto-mode.c | 22 +++++++++
>>>  drivers/platform/x86/amd/pmf/core.c      | 32 +++++++++++++
>>>  drivers/platform/x86/amd/pmf/pmf.h       | 22 +++++++++
>>>  4 files changed, 135 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>> index 724150ec58fb..dedaebf18d88 100644
>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>> @@ -12,6 +12,8 @@
>>>  #include "pmf.h"
>>>  
>>>  #define APMF_METHOD "\\_SB_.PMF_.APMF"
>>> +#define APMF_CQL_NOTIFICATION	2
>>> +#define APMF_AMT_NOTIFICATION	3
>>>  
>>>  static unsigned long supported_func;
>>>  
>>> @@ -99,6 +101,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>>  {
>>>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>>>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>>> +	func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
>>
>> I just noticed that this is not correct, this should be:
>>
>> 	func->system_params = mask & BIT(APMF_FUNC_... - 1);
>>
>> Which does something completely different!
>>
>> Also this information is duplicated by:
>>
>> is_apmf_func_supported(APMF_FUNC_...) so please drop the apmf_if_functions
>> struct completely and use is_apmf_func_supported() everywhere.
>>
>>>  	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>>>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>>>  }
>>> @@ -167,6 +170,44 @@ int apmf_get_auto_mode_def(struct apmf_if *apmf_if, struct apmf_auto_mode *data)
>>>  					 data, sizeof(*data));
>>>  }
>>>  
>>> +int apmf_get_sbios_requests(struct apmf_if *apmf_if, struct apmf_sbios_req *req)
>>> +{
>>> +	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_SBIOS_REQUESTS,
>>> +									 req, sizeof(*req));
>>> +}
>>> +
>>> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>> +{
>>> +	struct amd_pmf_dev *pmf_dev = data;
>>> +	struct apmf_if *apmf_if = pmf_dev->apmf_if;
>>> +	int ret;
>>> +
>>> +	if (apmf_if->func.sbios_requests) {
>>
>> IMHO it would be better to change the test for [un]registering the handler to:
>>
>> 	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
>> 	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))
>>
>> and then the sbios_requests test here (in apmf_event_handler()) can be dropped.
>>
>>> +		struct apmf_sbios_req req;
>>> +
>>> +		ret = apmf_get_sbios_requests(apmf_if, &req);
>>> +		if (ret) {
>>> +			dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>>> +			return;
>>> +		}
>>> +
>>> +		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>>> +			pr_debug("PMF: AMT is supported and notifications %s\n",
>>> +				 req.amt_event ? "Enabled" : "Disabled");
>>> +			pmf_dev->is_amt_event = !!req.amt_event;
>>
>> The is_amt_event variable is not storing if the last event was an amt_event but
>> rather wether AMT is enabled or not, so please rename it to amt_enabled.
>>
>> Also by just setting the flag here you are introducing a race, at least on
>> AMT disabling.
>>
>> 1: amd_pmf_get_metrics() is running, has just passed the
>>    "if (dev->is_amt_event)" check and is about to call amd_pmf_trans_automode().
>>
>> 2. apmf_event_handler() gets called to disable AMT
>>
>> 3. apmf_event_handler() finishes and the firmware now starts programming the
>>    limits because thinkpad_acpi's platform_profile has been set to !balanced.
>>
>> 4.  amd_pmf_get_metrics() continues and calls amd_pmf_trans_automode()
>> 5.  amd_pmf_trans_automode() reprograms the limits, overriding the ones
>>     set by the firmware eventhough AMT is disabled at this point.
>>
>> To avoid this race apmf_event_handler() and amd_pmf_get_metrics() should both
>> lock a newly added shared update_mutex mutex while running so that they cannot
>> both run at the same time.
>>
>> ###
>>
>> Likewise restoring the static slider settings on AMT disable is also racy
>> and to fix that the amd_pmf_reset_amt(dev);should be moved here; and then for
>> consistency and cleanness the setting of the initial AMT values should also
>> be moved here.
>>
>> This will result in adding the following code here:
>>
>> 		dev_dbg(dev->dev, "amt enabled: %d\n", dev->amt_enabled);
>>
>> 		if (pmf_dev->amt_enabled)
>> 			amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>> 		else		
>> 			amd_pmf_reset_amt(dev);
>>
>> Also be handling the flanks (enabled<->disabled transitions) here like this there
>> no longer is a need for a separate amt_running variable to detect the flanks in other
>> places.
>>
>>> +		}
>>> +
>>> +		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>>> +			pr_debug("PMF: CQL is supported and notifications %s\n",
>>> +				 req.cql_event ? "Enabled" : "Disabled");
>>> +			pmf_dev->is_cql_event = !!req.cql_event;
>>
>> is_cql_event is only used to pass req.cql_event to amd_pmf_update_2_cql()
>> please drop it from struct amd_pmf_dev and make it an argument to
>> amd_pmf_update_2_cql()
>>
>>> +
>>> +			/* update the target mode information */
>>> +			amd_pmf_update_2_cql(pmf_dev);
>>> +		}
>>> +	}
>>> +}
>>> +
>>>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>>>  {
>>>  	struct apmf_verify_interface output;
>>> @@ -211,12 +252,19 @@ static int apmf_get_system_params(struct apmf_if *apmf_if)
>>>  
>>>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>>  {
>>> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>> +
>>
>> Hmm, is this the handle for: "\\_SB_.PMF" ? as in the parent of:
>>
>> #define APMF_METHOD "\\_SB_.PMF_.APMF"
>>
>> ?
>>
>> In that case then apmf_if_call() can use:
>>
>> 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>
>> 	...
>>
>> 	status = acpi_evaluate_object(ahandle, "APMF", &apmf_if_arg_list, &buffer);
>>
>> and the whole:
>>
>> +	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &apmf_if_handle);
>> +	if (ACPI_FAILURE(status))
>> +		return -ENODEV;
>> +
>>
>> bit + storing the handle + also:
>>
>> +#define APMF_METHOD "\\_SB_.PMF_.APMF"
>>
>> can then all be dropped. That would be a nice cleanup and then calling
>> dev_err(...) for the ACPI errors also makes even more sense	
>>
>>
>>>  	if (pmf_dev->apmf_if->func.sbios_heartbeat)
>>>  		cancel_delayed_work_sync(&pmf_dev->heart_beat);
>>> +
>>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
>>
>> As mentioned above IMHO it would make sense to make this check:
>>
>> 	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
>> 	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))
>>
>>> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>>> +					   apmf_event_handler);
>>>  }
>>>  
>>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>>  {
>>> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>  	struct apmf_notification_cfg *n;
>>>  	acpi_handle apmf_if_handle;
>>>  	struct apmf_if *apmf_if;
>>> @@ -256,6 +304,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>>  		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>>>  	}
>>>  
>>> +	/* Install the APMF Notify handler */
>>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
>>
>> As mentioned above IMHO it would make sense to make this check:
>>
>> 	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
>> 	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))
>>
>> What is missing here is detecting the initial AMT and CQL values and configuring
>> things accordingly. Maybe this can be done by calling apmf_event_handler
>> manually once before registering it ?
> 
> Thank you for all the review remarks.
> 
> I think manually calling the apmf_event_handler() is not required as the
> the structure has the info on the pending AMT/CQL requests.

Right the structure has the pending requests flags. But to see those
you first need to read the structure, which is done by
the apmf_event_handler(). There is no notification to the ACPI
AML of a notifier handler getting registered, so the ACPI AML cannot
re-do any missed notifies once a notifier shows up.

> I did attempt to make this change but it did not make any difference.
> Leaving this apart, I tried to address all of the comments in v2. Kindly
> have a look again.

The scenario which I believe will break is:

1. A thinkpad is configured to balanced profile at boot
2. thinkpad_acpi loads first, sees this and enables AMT, the
   DYTC_FUNCTION_AMT, DYTC_MODE_AMT_ENABLE command done by thinkpad_acpi
   will cause an ACPI Notify() on the "\\_SB_.PMF" device, bot nothing
   is listening
3. the AMD-PMF driver loads (after thinkpad_acpi) at this point the
   amd_pmf_dev.amt_enabled flag is 0, even though thinkpad_acpi
   has enabled it
4. Now for as long as no further platform_profile changes happen
   the AMD-PMF driver will have the amd_pmf_dev.amt_enabled flag
   set to 0 and won't run the auto-mode code, even though it should
   run the automode code.

I would expect calling the apmf_event_handler() once manually
after the acpi_install_notify_handler() call to fix this.

Regards,

Hans




> 
> Thanks,
> Shyam
> 
>>
>> Note the initial state detection must be done before registering the handler
>> to avoid races.
>>
>>> +		status = acpi_install_notify_handler(ahandle,
>>> +						     ACPI_ALL_NOTIFY,
>>> +						     apmf_event_handler, pmf_dev);
>>> +		if (ACPI_FAILURE(status)) {
>>> +			dev_err(pmf_dev->dev, "failed to install notify handler\n");
>>> +			return -ENODEV;
>>> +		}
>>> +	}
>>> +
>>>  out:
>>>  	return ret;
>>>  }
>>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>>> index 954fde25e71e..a85ef4b95cdb 100644
>>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>>> @@ -111,6 +111,13 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>>  	bool update = false;
>>>  	int i, j;
>>>  
>>> +	if (!dev->amt_running && dev->is_amt_event) {
>>> +		dev_dbg(dev->dev, "setting AMT thermals\n");
>>> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>>> +		dev->amt_running = true;
>>> +		return;
>>> +	}
>>> +
>>
>> As suggested above this is best done on receiving the amt_event.
>>
>>>  	/* Get the average moving average computed by auto mode algorithm */
>>>  	avg_power = amd_pmf_get_moving_avg(socket_power);
>>>  
>>> @@ -161,6 +168,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>>  	}
>>>  }
>>>  
>>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
>>> +{
>>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>>> +			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
>>> +	if ((config_store.current_mode == AUTO_PERFORMANCE ||
>>> +	     config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
>>> +	    config_store.current_mode !=
>>> +	    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
>>> +		config_store.current_mode =
>>> +				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
>>> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>>> +	}
>>> +	dev_dbg(dev->dev, "updated CQL thermals\n");
>>> +}
>>> +
>>>  static void amd_pmf_get_power_threshold(void)
>>>  {
>>>  	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>> index ef71f8326248..bfae779ccc23 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -93,6 +93,27 @@ int amd_pmf_get_power_source(void)
>>>  		return POWER_SOURCE_DC;
>>>  }
>>>  
>>> +static void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
>>> +{
>>> +	pr_debug("resetting AMT thermals\n");
>>> +	dev->amt_running = false;
>>> +
>>> +	/*
>>> +	 * OEM BIOS implementation guide says that if the auto mode is enabled
>>> +	 * the platform_profile registration shall be done by the OEM driver.
>>> +	 * There could be cases where both static slider and auto mode BIOS
>>> +	 * functions are enabled and we could end up in a race. To avoid that
>>> +	 * add a protection and touch the static slider only if that's enabled
>>> +	 * from the BIOS side.
>>> +	 */
>>
>> This comment seems odd. The is_apmf_func_supported() does not help to
>> avoid the race. This check is necessary to avoid amd_pmf_update_slider()
>> on systems where amd_pmf_load_defaults_sps() does not run. Otherwise
>> amd_pmf_update_slider() ends up writing uninitialized (all 0) limits.
>>
>> To fix the race the amd_pmf_update_slider() call must be done before
>> apmf_event_handler() exits as suggested above. The feature check has
>> nothing to do with the race ...
>>
>>
>>
>>> +
>>> +	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>>> +		u8 mode = amd_pmf_get_pprof_modes(dev);
>>> +
>>> +		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
>>> +	}
>>> +}
>>> +
>>>  static void amd_pmf_get_metrics(struct work_struct *work)
>>>  {
>>>  	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
>>> @@ -103,6 +124,9 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>>  	/* Get the current profile information */
>>>  	current_profile = READ_ONCE(dev->current_profile);
>>>  
>>> +	if (!dev->is_amt_event)
>>> +		dev_dbg(dev->dev, "amt event: %s\n", dev->is_amt_event ? "Enabled" : "Disabled");
>>> +
>>
>> This is weird, you check for !is_amt_event so this will only ever log:
>> "amt event: Disabled" so the check in the dev_dbg is not necessary. Also this is
>> best done when receiving the amt-event, as suggested above so this can just be dropped.
>>
>>>  	/* Transfer table contents */
>>>  	memset(&dev->m_table, 0, sizeof(dev->m_table));
>>>  	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>>> @@ -112,6 +136,14 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>>  	/* Calculate the avg SoC power consumption */
>>>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>>>  
>>> +	if (dev->is_amt_event) {
>>> +		/* Apply the Auto Mode transition */
>>> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>>> +	} else if (!dev->is_amt_event && dev->amt_running) {
>>> +		/* reset to other mode if we receive a AMT disable event */
>>> +		amd_pmf_reset_amt(dev);
>>> +	}
>>> +
>>
>> As discussed above the amd_pmf_reset_amt() call must be done from inside
>> apmf_event_handler(). So the whole "else if (...) {}" block can be dropped here.
>>
>>>  	dev->start_time = ktime_to_ms(ktime_get());
>>>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
>>>  }
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 4618ddc5a662..0f8b25524845 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -17,6 +17,7 @@
>>>  /* APMF Functions */
>>>  #define APMF_FUNC_VERIFY_INTERFACE			0
>>>  #define APMF_FUNC_GET_SYS_PARAMS			1
>>> +#define APMF_FUNC_SBIOS_REQUESTS			2
>>>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
>>>  #define APMF_FUNC_AUTO_MODE					5
>>>  #define APMF_FUNC_SET_FAN_IDX				7
>>> @@ -49,6 +50,7 @@
>>>  /* AMD PMF BIOS interfaces */
>>>  struct apmf_if_functions {
>>>  	bool system_params;
>>> +	bool sbios_requests;
>>>  	bool sbios_heartbeat;
>>>  	bool auto_mode_def;
>>>  	bool fan_table_idx;
>>> @@ -80,6 +82,21 @@ struct apmf_system_params {
>>>  	u32 heartbeat_int;
>>>  } __packed;
>>>  
>>> +struct apmf_sbios_req {
>>> +	u16 size;
>>> +	u32 pending_req;
>>> +	u8 rsd;
>>> +	u8 cql_event;
>>> +	u8 amt_event;
>>> +	u32 fppt;
>>> +	u32 sppt;
>>> +	u32 fppt_apu_only;
>>> +	u32 spl;
>>> +	u32 stt_min_limit;
>>> +	u8 skin_temp_apu;
>>> +	u8 skin_temp_hs2;
>>> +} __packed;
>>> +
>>>  struct apmf_fan_idx {
>>>  	u16 size;
>>>  	u8 fan_ctl_mode;
>>> @@ -161,6 +178,9 @@ struct amd_pmf_dev {
>>>  	struct smu_pmf_metrics m_table;
>>>  	struct delayed_work work_buffer;
>>>  	ktime_t start_time;
>>> +	bool is_amt_event;
>>
>> The is_amt_event variable is not storing if the last event was an amt_event but
>> rather wether AMT is enabled or not, so please rename it to amt_enabled.
>>
>>> +	bool is_cql_event;
>>> +	bool amt_running;
>>
>> As discussed both these struct members can be dropped.
>>
>>>  };
>>>  
>>>  struct apmf_sps_prop_granular {
>>> @@ -320,5 +340,7 @@ int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data)
>>>  void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>>>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>>>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>>> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
>>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
>>>  
>>>  #endif /* PMF_H */
>>
>> Regards,
>>
>> Hans
>>
> 

