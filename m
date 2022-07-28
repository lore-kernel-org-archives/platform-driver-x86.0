Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F37C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:17:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbiG1SR6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbiG1SR5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A26976BD5C
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659032275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IUd1eFn7+oJk7XURPnyeSi9pPdHJHEBb7p4QsS8h9BM=;
        b=RA1uaOW2MGL3WfTy8RqEOhjG05htUb+ntUxjmMoLCQ0uvH8HYl6Q7W4bSFDF4XQwOs+sWm
        1PAL6jYeaEsBjcZpbmGfhg0QLirIR+XuMgcWNc92SrETpso3jcNgy5JKUCmcCYm/4P+NoH
        2lBcx2aObsm8lAYYkGBqBbDlj+Nq4d4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-lm3vEn0-Pia9RniGag6w9A-1; Thu, 28 Jul 2022 14:17:54 -0400
X-MC-Unique: lm3vEn0-Pia9RniGag6w9A-1
Received: by mail-ed1-f69.google.com with SMTP id y10-20020a056402270a00b0043c0fed89b9so1574162edd.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IUd1eFn7+oJk7XURPnyeSi9pPdHJHEBb7p4QsS8h9BM=;
        b=KikoRQjpHesMqy31dCrPSGy9dHJ+JuQ1mLBCzclDoEiUjlM/K6mJJEDtumvV5BO4dX
         uV0LykeHQNmatGWGEvzzjLHx1SC4+JrXdU16wD/xhFkK8ISX6Wzt1reEGDgZQJ0wIC1X
         rw+2EkZt4QEOtp623ogPTU+4g36WGl8LojoAdyjt3npHxRPgC6pu40xNusUawU4tv3gB
         xNw8en3e9k9OfRrC/2M1cJT8otDFYG10oXc3ZuyJpem83ENie0VpWd+b6l9hgh9qqye4
         i3zlWPi/iCWWXLLJWwIeeiVJNlT5jDLnz6bQeS2fONMZWIV0EsxVOpkmyP+83XuBIIy7
         pGUQ==
X-Gm-Message-State: AJIora/jSsYM04DRzpbmJ263LQFzz4GiAy3jtLAtp2SKtQuT35O/Vi6u
        8WaW+hgQPZVYCsn1fdHETByngQfLYP2Cq19czoqfdYTxtEG282KcJ6GmIGGS+74QJfikIGDVKvl
        XuaveAh7qH9HAxbz4g3cIXwx/DUT2xgUOEA==
X-Received: by 2002:a17:906:cc48:b0:72a:ff94:d5df with SMTP id mm8-20020a170906cc4800b0072aff94d5dfmr107302ejb.693.1659032273383;
        Thu, 28 Jul 2022 11:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDDChVq06J7H6iFTt8zljOSljzkKmsvWlq8VnJLL+GSSvf3ObmPpN8LSPNoZ/HCWuJTLYbnw==
X-Received: by 2002:a17:906:cc48:b0:72a:ff94:d5df with SMTP id mm8-20020a170906cc4800b0072aff94d5dfmr107271ejb.693.1659032272884;
        Thu, 28 Jul 2022 11:17:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063caa00b0072b1cb2818csm659820ejh.158.2022.07.28.11.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 11:17:52 -0700 (PDT)
Message-ID: <0bc30454-315d-2466-4915-ad673b1029a9@redhat.com>
Date:   Thu, 28 Jul 2022 20:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mark Pearson <markpearson@lenovo.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
 <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
 <d01e52cb-31c5-7d20-4f18-1e4bb70c1355@amd.com>
 <828a7b8e-2375-a9d0-7b00-d59e84cfaa2b@redhat.com>
 <5500e911-22eb-08b3-c3fe-2a63cf22d7b8@amd.com>
 <ce75f2cc-0129-84f5-bbab-dae5ed9a7ea9@redhat.com>
 <f351a921-3b7f-d8c9-10e5-816f83f22775@amd.com>
 <81fae6a4-4859-bc15-4edc-2c4df953cc12@redhat.com>
 <b1059e6d-31f9-16de-c728-d9003597b31b@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b1059e6d-31f9-16de-c728-d9003597b31b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:06, Limonciello, Mario wrote:
> On 7/28/2022 12:46, Hans de Goede wrote:
>> Hi,
>>
>> On 7/28/22 16:38, Limonciello, Mario wrote:
>>>
>>>>>> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>>>>>>       will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>>>>>>       stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>>>>>>       the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>>>>>>       by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>>>>>>       register its platform_profile support. We cannot rely on module ordering ensuring
>>>>>>       that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>>>>>>       since there are no module load ordering guarantees.
>>>>>
>>>>> This was my thought initially too while this was being developed, but actually there is some nuance here that is non-obvious.  The platform profile registering code in amd-pmf will examine bits set in the BIOS to decide whether or not to export platform profile support.  In Lenovo platforms that support thinkpad_acpi these bits are not set.  So platform profile support ONLY comes from thinkpad-acpi in those platforms.
>>>>
>>>> Right, Shyam mentioned this in another part of the thread. As I
>>>> mentioned there IHMO it would still be good to check this in the driver
>>>> though. To catch cases where a BIOS for some reasons advertises an
>>>> unexpected combination of features.
>>>>
>>>>>> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>>>>>>       enable AMT and then the periodically run workqueue function from amd-pmf
>>>>>>       will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>>>>>>       set to low-power or performance. Should the amd-pmf code then apply the static
>>>>>>       slider settings for low-power/performance which it has read from the ACPI
>>>>>>       tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
>>>>>>
>>>>>
>>>>> When thinkpad_acpi changes platform profile then a BIOS event goes through and amd-pmf receives that and will run based on the event.
>>>>
>>>> Hmm, I don't remember seeing anything for this in the patches. Actually this
>>>> reminds me that the code should probably reschedule (using mod_delayed_work)
>>>> the work to run immediately after a BIOS event, rather then waiting for
>>>> the next normally scheduled run.
>>>>
>>>> But even then I don't remember seeing any code related to catching
>>>> platform-profile changes done outside amd-pmf... ?
>>>
>>> It's not a platform profile change - it's an ACPI event.
>>>
>>> When a user changes a platform profile then thinkpad_acpi will see whether it's balanced or not.  When changing to/from balanced thinkpad_acpi sends an AMT event.  amd-pmf reacts to said AMT event.
>>>
>>> This is the code you're looking for (in this specific patch):
>>>
>>> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>> +{
>>> +    struct amd_pmf_dev *pmf_dev = data;
>>> +    struct apmf_if *apmf_if = pmf_dev->apmf_if;
>>> +    int ret;
>>> +
>>> +    if (apmf_if->func.sbios_requests) {
>>> +        struct apmf_sbios_req req;
>>> +
>>> +        ret = apmf_get_sbios_requests(apmf_if, &req);
>>> +        if (ret) {
>>> +            dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>>> +            return;
>>> +        }
>>> +        if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>>> +            pr_debug("PMF: AMT is supported and notifications %s\n",
>>> +                 req.amt_event ? "Enabled" : "Disabled");
>>> +            if (req.amt_event)
>>> +                pmf_dev->is_amt_event = true;
>>> +            else
>>> +                pmf_dev->is_amt_event = !!req.amt_event;
>>> +        }
>>> +
>>> +        if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>>> +            pr_debug("PMF: CQL is supported and notifications %s\n",
>>> +                 req.cql_event ? "Enabled" : "Disabled");
>>> +            if (req.cql_event)
>>> +                pmf_dev->is_cql_event = true;
>>> +            else
>>> +                pmf_dev->is_cql_event = !!req.cql_event;
>>> +
>>> +            /* update the target mode information */
>>> +            amd_pmf_update_2_cql(pmf_dev);
>>> +        }
>>> +    }
>>> +}
>>> +
>>
>> Right this is the AMT on/off path that bit I understand.
>> This happens when switching to / away from balanced mode.
>>
>> My question is what does the equivalent of these lines:
>>
>> +        amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
>> +        amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
>> +        amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
>> +        amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
>> +                 config_store.prop[src][idx].sppt_apu_only, NULL);
>> +        amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>> +                 config_store.prop[src][idx].stt_min, NULL);
>> +        amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +                 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
>> +        amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +                 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
>>
>> When the profile is switched (by userspace, or through the hotkeys on
>> the laptop) to low-power or to performance mode ?
> 
> Lenovo's firmware will handle the equivalent of changing relevant values for their platform through a BIOS interface in this case when they change ACPI platform profiles.  You will see in their driver something call "PSC" mode, and this is exactly that type of stuff.

Ok I see, thank you for clarifying this.

So as for the AMT mode, since that is Lenovo only, I guess that means
that there is no need to do call amd_pmf_update_slider() when AMT
is being disabled since at this point the firmware will have
already set the values.

Actually this seems to mean that we must ensure that the AMD-PMF
code stops touching these settings as soon as the event is received.

Which would imply killing the periodic work when an AMT off event
is received from within the event handling and then restating it
when AMT is on (and making sure the work being queued or not state
matches the AMT on/off state at driver probe time) ?

Regards,

Hans


