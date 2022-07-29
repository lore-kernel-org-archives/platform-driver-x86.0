Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0177AC00144
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Jul 2022 11:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiG2LDe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Jul 2022 07:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiG2LDd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Jul 2022 07:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 753B66F7DA
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Jul 2022 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659092611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OOd/vEi50t0iz0qZ6lSpjuCuiNHOPPPg9YG0DvXll+U=;
        b=Gilj1w0AsrmCT1hwlblgvF4Dv+LVonmgF7GjyqwJfvpEMzy0TDEqLDqthXaLUPM5Uy2INP
        DZGvFPt6ESXH1Py9O7zyXzejBdfmcSj/LjQCkCppAri6OEM4Ppu83pU8qG2kE5tJth/JvU
        AL06GulvMCUG7oDewHOXhHmkefIxCSQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-u3POXfySOL-05FAX55DMgA-1; Fri, 29 Jul 2022 07:03:30 -0400
X-MC-Unique: u3POXfySOL-05FAX55DMgA-1
Received: by mail-ed1-f69.google.com with SMTP id t21-20020a056402525500b0043d267cedc7so651310edd.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Jul 2022 04:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OOd/vEi50t0iz0qZ6lSpjuCuiNHOPPPg9YG0DvXll+U=;
        b=vQqz1U4dsG3VcSxXxCom/qpwIqnja7XC482+kHstQJD0AFyGRvq3pcej8h1886bQYO
         KmwKXkN9JZG+r6sVp176eLyjrSSneLXY7brNvJIqpK46sce5UU86cVc7ciaVVjAlaE06
         VVZGG0tiLugxKJOllSfuffDM6bCLQm4YeikEEg+ZdJVugfUFs71mYf7EBDl6MKrJsQob
         wFpl9XCgYvhFp56dBxhH3mXuoPFgUhYeJiwiwueSrAqp5XA684vMgaNu4Pt/+2op1AR0
         NFZbiPyz4q78jeKos343jNAtuAAdYYnDqFOXCGDHalkym9imcZuO5kTRqNwluugrBS01
         VWLg==
X-Gm-Message-State: AJIora+yXw5X0ED1J3iry1YY5oaxlKeul4fscask80QriUR9tErczHi+
        rFefm06knew8Xze0Q8xmw7xu+zUrZmBKyepehGfcxjaPm2+3lYw+PSeKYVXF9v+61WIe6hYtqd5
        QsLppbaS/lLPgLtw8FO9TpPdQT9ce4FTuHQ==
X-Received: by 2002:a05:6402:50d0:b0:43c:99e:3a71 with SMTP id h16-20020a05640250d000b0043c099e3a71mr2942718edb.89.1659092608975;
        Fri, 29 Jul 2022 04:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu8H5eJRw32tBKrNC4qsH0E2F4Osk8R4f11MjTRoy9kvLNbZ6ub6cZ9xryNge1if5eyW/v0g==
X-Received: by 2002:a05:6402:50d0:b0:43c:99e:3a71 with SMTP id h16-20020a05640250d000b0043c099e3a71mr2942685edb.89.1659092608580;
        Fri, 29 Jul 2022 04:03:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906175100b00718e4e64b7bsm1559280eje.79.2022.07.29.04.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 04:03:28 -0700 (PDT)
Message-ID: <b75f24fc-3ac4-35b0-3df6-870f4151dc43@redhat.com>
Date:   Fri, 29 Jul 2022 13:03:26 +0200
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
 <0bc30454-315d-2466-4915-ad673b1029a9@redhat.com>
 <fbc06d40-f466-d971-d60e-0a9e0b8f7580@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fbc06d40-f466-d971-d60e-0a9e0b8f7580@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 23:01, Limonciello, Mario wrote:
> On 7/28/2022 13:17, Hans de Goede wrote:
>> Hi,
>>
>> On 7/28/22 20:06, Limonciello, Mario wrote:
>>> On 7/28/2022 12:46, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 7/28/22 16:38, Limonciello, Mario wrote:
>>>>>
>>>>>>>> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>>>>>>>>        will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>>>>>>>>        stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>>>>>>>>        the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>>>>>>>>        by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>>>>>>>>        register its platform_profile support. We cannot rely on module ordering ensuring
>>>>>>>>        that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>>>>>>>>        since there are no module load ordering guarantees.
>>>>>>>
>>>>>>> This was my thought initially too while this was being developed, but actually there is some nuance here that is non-obvious.  The platform profile registering code in amd-pmf will examine bits set in the BIOS to decide whether or not to export platform profile support.  In Lenovo platforms that support thinkpad_acpi these bits are not set.  So platform profile support ONLY comes from thinkpad-acpi in those platforms.
>>>>>>
>>>>>> Right, Shyam mentioned this in another part of the thread. As I
>>>>>> mentioned there IHMO it would still be good to check this in the driver
>>>>>> though. To catch cases where a BIOS for some reasons advertises an
>>>>>> unexpected combination of features.
>>>>>>
>>>>>>>> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>>>>>>>>        enable AMT and then the periodically run workqueue function from amd-pmf
>>>>>>>>        will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>>>>>>>>        set to low-power or performance. Should the amd-pmf code then apply the static
>>>>>>>>        slider settings for low-power/performance which it has read from the ACPI
>>>>>>>>        tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
>>>>>>>>
>>>>>>>
>>>>>>> When thinkpad_acpi changes platform profile then a BIOS event goes through and amd-pmf receives that and will run based on the event.
>>>>>>
>>>>>> Hmm, I don't remember seeing anything for this in the patches. Actually this
>>>>>> reminds me that the code should probably reschedule (using mod_delayed_work)
>>>>>> the work to run immediately after a BIOS event, rather then waiting for
>>>>>> the next normally scheduled run.
>>>>>>
>>>>>> But even then I don't remember seeing any code related to catching
>>>>>> platform-profile changes done outside amd-pmf... ?
>>>>>
>>>>> It's not a platform profile change - it's an ACPI event.
>>>>>
>>>>> When a user changes a platform profile then thinkpad_acpi will see whether it's balanced or not.  When changing to/from balanced thinkpad_acpi sends an AMT event.  amd-pmf reacts to said AMT event.
>>>>>
>>>>> This is the code you're looking for (in this specific patch):
>>>>>
>>>>> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>>>> +{
>>>>> +    struct amd_pmf_dev *pmf_dev = data;
>>>>> +    struct apmf_if *apmf_if = pmf_dev->apmf_if;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (apmf_if->func.sbios_requests) {
>>>>> +        struct apmf_sbios_req req;
>>>>> +
>>>>> +        ret = apmf_get_sbios_requests(apmf_if, &req);
>>>>> +        if (ret) {
>>>>> +            dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>>>>> +            return;
>>>>> +        }
>>>>> +        if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>>>>> +            pr_debug("PMF: AMT is supported and notifications %s\n",
>>>>> +                 req.amt_event ? "Enabled" : "Disabled");
>>>>> +            if (req.amt_event)
>>>>> +                pmf_dev->is_amt_event = true;
>>>>> +            else
>>>>> +                pmf_dev->is_amt_event = !!req.amt_event;
>>>>> +        }
>>>>> +
>>>>> +        if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>>>>> +            pr_debug("PMF: CQL is supported and notifications %s\n",
>>>>> +                 req.cql_event ? "Enabled" : "Disabled");
>>>>> +            if (req.cql_event)
>>>>> +                pmf_dev->is_cql_event = true;
>>>>> +            else
>>>>> +                pmf_dev->is_cql_event = !!req.cql_event;
>>>>> +
>>>>> +            /* update the target mode information */
>>>>> +            amd_pmf_update_2_cql(pmf_dev);
>>>>> +        }
>>>>> +    }
>>>>> +}
>>>>> +
>>>>
>>>> Right this is the AMT on/off path that bit I understand.
>>>> This happens when switching to / away from balanced mode.
>>>>
>>>> My question is what does the equivalent of these lines:
>>>>
>>>> +        amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
>>>> +        amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
>>>> +        amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
>>>> +        amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
>>>> +                 config_store.prop[src][idx].sppt_apu_only, NULL);
>>>> +        amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>>>> +                 config_store.prop[src][idx].stt_min, NULL);
>>>> +        amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>>>> +                 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
>>>> +        amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>>>> +                 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
>>>>
>>>> When the profile is switched (by userspace, or through the hotkeys on
>>>> the laptop) to low-power or to performance mode ?
>>>
>>> Lenovo's firmware will handle the equivalent of changing relevant values for their platform through a BIOS interface in this case when they change ACPI platform profiles.  You will see in their driver something call "PSC" mode, and this is exactly that type of stuff.
>>
>> Ok I see, thank you for clarifying this.
>>
>> So as for the AMT mode, since that is Lenovo only, I guess that means
>> that there is no need to do call amd_pmf_update_slider() when AMT
>> is being disabled since at this point the firmware will have
>> already set the values.
> 
> Yeah, Shyam made this modification for v2 to make sure that code path isn't called unless static slider was set in the BIOS.

But this code path is only hit when AMT / auto mode is available and
when that is true then the static slider should never be set in the BIOS
so the whole amd_pmf_update_slider() call on AMT disable can simply
be dropped AFAICT.

> 
>>
>> Actually this seems to mean that we must ensure that the AMD-PMF
>> code stops touching these settings as soon as the event is received.
>>
>> Which would imply killing the periodic work when an AMT off event
>> is received from within the event handling and then restating it
>> when AMT is on (and making sure the work being queued or not state
>> matches the AMT on/off state at driver probe time) ?
>>
> 
> At first glance this seems plausible, but actually I think it should stay as is because CQL thermals can be set at any time (that's like a lap mode sensor event from thinkpad_acpi).  Even when AMT is turned off, you may want the CQL thermal profile set accordingly.

So the CQL code is to handle lapmode when AMT is active. But I would
expect the firmware to update the power-limits, etc. for lapmode itself
when in performance mode.

The amd_pmf_update_2_cql() function only does things when
config_store.current_mode == AUTO_PERFORMANCE (or AUTO_PERFORMANCE_ON_LAP)

And that reflects the last mode selected by the auto/AMT mode code, not
the mode actual set by thinkpad_acpi so if the last auto selected mode
was balanced and then AMT gets disabled because thinkpad_acpi switches
to performance mode, then on CQL events after the switch amd_pmf_update_2_cql()
will not do anything.

To me it seems that when AMT is off the AMD-PMF code should not touch
the power-limits, etc. at all and thus it should also always ignore
CQL events when AMT is off.

This assumes that the firmware takes care of udating the limits for
on lap / off lap when thinkpad_acpi's profile is set to performance.

If thinkpad_acpi does not do this then the AMD-PMF code should
check what mode has been selected by the thinkpad_acpi code in
amd_pmf_update_2_cql() when AMT is off.

Regards,

Hans



