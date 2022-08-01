Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E0FC00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 11:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbiHALJA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 07:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiHALI6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 07:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EDFB27B32
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659352136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zy4weoVs4ELko38tumYR1X6+YWtGUFp6JfyyPplBYMQ=;
        b=VblcAdx6fhCXv6lded8ROIDTCnqSrVtzGr8793cMxXr6FjSVu3nTBbU1xQAhDt+LbS7pTC
        AL0aSL5Bg2Gt8nvUzq8OldGnQmgHM2g9uDj1Z2CwxnxYcYhEZUk3iIy02VIMU00YMZ0VO3
        nn99MTC5wUmAKi2OqJT8WElKA0rwfic=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-MoivyUlkMuGElvzvjwlshg-1; Mon, 01 Aug 2022 07:08:55 -0400
X-MC-Unique: MoivyUlkMuGElvzvjwlshg-1
Received: by mail-ed1-f69.google.com with SMTP id h6-20020a05640250c600b0043d9964d2ceso1749627edb.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 04:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zy4weoVs4ELko38tumYR1X6+YWtGUFp6JfyyPplBYMQ=;
        b=c223d6TOGdIqBYOpIbKBb1tJLUnuByNuPZ+ErZ9fcqkNYQUR5ba88lv++OTHjQV9Gd
         8eLTBf+qTaChOcx8iMp8ozBFWnAxQpfXYbNAYPfuuU7p+DVEzBvIzbMsGbNTAcJqdyCd
         3Pn7hZuP6HlNViZYLrV/L6xlsc0ULX/5ipXj8nWl/vUdTkkUqRtGk6zFpX+r1SxlGXW3
         iE6/u4KK86S88r2nEEPQqjQXfaj/E2N8qsa7PnJwRShiL53IrcIUBF/+Ajms5+dkxobn
         tD6piGAcvPZ0r3Ob6MoDsjOklP5uUA1Ir5aie/tSyMjPnSHajlT1kJcrNCavfc9pVbFh
         sspQ==
X-Gm-Message-State: AJIora9sXLtg81pSYoVF3Q4Asvjy+TK+iUPl+frM5/wmfh2yV2s7NDml
        YfooGOsSkCGrV6fQkbyvg7sCjtFomeUfBVBoqI2rZkl4dRB4YuLuxBSqYgWW5TMa3d6QxNb8iSF
        dxaFJppFxeto/UQTKAyGK6aN6Pzwa/u2DAQ==
X-Received: by 2002:aa7:cad5:0:b0:43a:bd45:f6e5 with SMTP id l21-20020aa7cad5000000b0043abd45f6e5mr15567319edt.63.1659352133916;
        Mon, 01 Aug 2022 04:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vSTNUh5+G3nOxQ0f4HAn/OmtSZ3uPxdQHZR8XLqBbQA4ATf7jVZEi0zzr88iAfl21oVA3vhQ==
X-Received: by 2002:aa7:cad5:0:b0:43a:bd45:f6e5 with SMTP id l21-20020aa7cad5000000b0043abd45f6e5mr15567291edt.63.1659352133684;
        Mon, 01 Aug 2022 04:08:53 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ky1-20020a170907778100b00722e52d043dsm5090625ejc.114.2022.08.01.04.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 04:08:52 -0700 (PDT)
Message-ID: <446ddd1d-321f-1b56-1485-787c7094f39a@redhat.com>
Date:   Mon, 1 Aug 2022 13:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
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
 <b75f24fc-3ac4-35b0-3df6-870f4151dc43@redhat.com>
 <bab60716-a19c-ffaf-81f5-d26bc8f2f6f3@amd.com>
 <194be06e-5831-eb0e-5018-61f1cfcf9912@amd.com>
 <79264f93-dd2c-e54e-7d77-b91193307841@redhat.com>
 <29f5a1de-d8dd-36b5-8ba9-bda5686a3304@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <29f5a1de-d8dd-36b5-8ba9-bda5686a3304@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/1/22 12:29, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 7/29/2022 11:29 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 7/29/22 19:40, Shyam Sundar S K wrote:
>>> Hi Mario,
>>>
>>> On 7/29/2022 9:13 PM, Limonciello, Mario wrote:
>>>> On 7/29/2022 06:03, Hans de Goede wrote:
>>>>>>>
>>>>>>> So as for the AMT mode, since that is Lenovo only, I guess that means
>>>>>>> that there is no need to do call amd_pmf_update_slider() when AMT
>>>>>>> is being disabled since at this point the firmware will have
>>>>>>> already set the values.
>>>>>>
>>>>>> Yeah, Shyam made this modification for v2 to make sure that code path
>>>>>> isn't called unless static slider was set in the BIOS.
>>>>>
>>>>> But this code path is only hit when AMT / auto mode is available and
>>>>> when that is true then the static slider should never be set in the BIOS
>>>>> so the whole amd_pmf_update_slider() call on AMT disable can simply
>>>>> be dropped AFAICT.
>>>>
>>>> The reason to leave it in place but guarded like this is for validation
>>>> of the feature behaves properly from AMD internal systems AMD test BIOS.
>>>>  It can be used to prove out something works properly without needing to
>>>> include extra drivers and software.
>>>
>>> Yes. We will need this path to check on the internal CRB system to
>>> validate the 'auto mode'. Whenever the amd-pmf driver gets the AMT
>>> disable event we shall disable the power-settings w.r.t to 'auto mode'.
>>>
>>> I moved the handling to amd_pmf_reset_amt() based on Hans review
>>> remarks, and its guarded with a if() check, so that we accidentally
>>> don't land up in updating the static slider.
>>>
>>> Also left a note on the same function, so that it provides some
>>> information on why the logic is being done in that way.
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Actually this seems to mean that we must ensure that the AMD-PMF
>>>>>>> code stops touching these settings as soon as the event is received.
>>>>>>>
>>>>>>> Which would imply killing the periodic work when an AMT off event
>>>>>>> is received from within the event handling and then restating it
>>>>>>> when AMT is on (and making sure the work being queued or not state
>>>>>>> matches the AMT on/off state at driver probe time) ?
>>>>>>>
>>>>>>
>>>>>> At first glance this seems plausible, but actually I think it should
>>>>>> stay as is because CQL thermals can be set at any time (that's like a
>>>>>> lap mode sensor event from thinkpad_acpi).  Even when AMT is turned
>>>>>> off, you may want the CQL thermal profile set accordingly.
>>>>>
>>>>> So the CQL code is to handle lapmode when AMT is active. But I would
>>>>> expect the firmware to update the power-limits, etc. for lapmode itself
>>>>> when in performance mode. >
>>>>> The amd_pmf_update_2_cql() function only does things when
>>>>> config_store.current_mode == AUTO_PERFORMANCE (or
>>>>> AUTO_PERFORMANCE_ON_LAP)
>>>>>
>>>>> And that reflects the last mode selected by the auto/AMT mode code, not
>>>>> the mode actual set by thinkpad_acpi so if the last auto selected mode
>>>>> was balanced and then AMT gets disabled because thinkpad_acpi switches
>>>>> to performance mode, then on CQL events after the switch
>>>>> amd_pmf_update_2_cql()
>>>>> will not do anything.
>>>>>
>>>>> To me it seems that when AMT is off the AMD-PMF code should not touch
>>>>> the power-limits, etc. at all and thus it should also always ignore
>>>>> CQL events when AMT is off.
>>>>>
>>>>> This assumes that the firmware takes care of udating the limits for
>>>>> on lap / off lap when thinkpad_acpi's profile is set to performance.
>>>>
>>>> Where does this assumption come from?  I guess that's how it's done on
>>>> Lenovo's Intel systems?
>>>>
>>>> AMT and CQL is a new feature on Lenovo AMD systems, this is the way that
>>>> it's supposed to be done here.
>>>
>>> Yes, this was newly designed for Lenovo AMD systems. The behavior is
>>> same on windows too (atleast on the RMB laptops today) .
>>>
>>> When the system is running in 'auto-mode performance' and the user keeps
>>> the system on his lap, amd-pmf driver receives a 'CQL' event from Lenovo
>>> BIOS. In this case, the amd-pmf driver shall apply thermal limits w.r.t
>>> to 'auto-mode performance-on-lap' and not 'auto-mode performance'.
>>
>> The question here is not about the 'auto-mode performance' mode
>> but what to do when AMT / 'auto-mode performance' is disabled.
>>
>> What should the behavior of the AMD-PMf code be when it receives
>> a CQL event when AMT is disabled ?
> 
> When:
> 1. AMT is disabled and we get a CQL event, it becomes a no-op to the
> amd-pmf driver.

But that is not what happens in the current (v2) code:

1. The apmf_event_handler() is always registered as long as the driver is bound
   (which it must be to catch AMT being re-enabled)

2. apmf_event_handler() does:

+		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
+			pr_debug("PMF: CQL is supported and notifications %s\n",
+				 req.cql_event ? "Enabled" : "Disabled");
+			pmf_dev->is_cql_event = !!req.cql_event;
+
+			/* update the target mode information */
+			amd_pmf_update_2_cql(pmf_dev);
+		}

3. amd_pmf_update_2_cql() does:

+void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
+{
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
+			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
+	if ((config_store.current_mode == AUTO_PERFORMANCE ||
+	     config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
+	    config_store.current_mode !=
+	    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
+		config_store.current_mode =
+				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
+		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
+	}
+	dev_dbg(dev->dev, "updated CQL thermals\n");
+}

Note this does not check dev->is_amt_event at all so CQL events
may lead to amd_pmf_handle_automode() getting called, which sets
the limits even when AMT is disabled.

 
> 2. AMT is enabled:
>   - Avg. SoC power is higher than a selected measure, the amd-pmf driver
> tries to move to 'auto-mode performance' and apply the thermals set in
> the BIOS for 'auto-mode peformance' but in this scenario, when we are in
> 'auto-mode performance' and user moves the laptop from desk to lap, we
> receive a 'on-lap' event. In this case we apply thermals w.r.t to
> 'auto-mode performance-on-lap' and not 'auto-mode performance'.
> 
> That is what is being done in amd_pmf_update_2_cql() with a check:
> 	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
> 			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;

Right this much I understand.

> Update of CQL happens only when AMT is active.

So you mean the SBIOS is expected to only send CQL events when it has
set AMT to be enabled ?  AFAIK the CQL events are basically on-lap /
not-on-lap events, these can easily also happen when not in AMT mode,
so the SBIOS would need to explicitly not send these events when
lap-mode changes when AMT is disabled.

Since firmware bugs do happen and can sometimes be hard to fix /
have long times to get published IMHO it would be best if 
amd_pmf_update_2_cql() would check dev->is_amt_event and return
early from the function if that is not set.

Regards,

Hans

