Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9869EC00144
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Jul 2022 17:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238433AbiG2R75 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Jul 2022 13:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238470AbiG2R74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Jul 2022 13:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51E0789E90
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Jul 2022 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659117594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tb5+Kvo0Fvzw+Y2OdD6shu8eBFPmCKJDMuBi+3ZHS28=;
        b=XtCpHkhwSzNz1y06d4KweK77XSBcb7vmy8r8NOCxfQfUPJbu6PRWg1bNdR+PiEgcJ252Hl
        uloHwZWwf08I2QTg5iQJUJ0Bd8kvCcjW97onFkvgrq86xM+2wAgcaa/HJwz4VG9Qj+obWS
        aT5JiqIXTTt8Vkue1bZdcubIghKBIDY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-WIjF2LgiMvONbK0B8ZaiiA-1; Fri, 29 Jul 2022 13:59:53 -0400
X-MC-Unique: WIjF2LgiMvONbK0B8ZaiiA-1
Received: by mail-ed1-f69.google.com with SMTP id m20-20020a056402431400b0043be03aa310so3353413edc.23
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Jul 2022 10:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Tb5+Kvo0Fvzw+Y2OdD6shu8eBFPmCKJDMuBi+3ZHS28=;
        b=5JFEf/Af+U7KqrtgctD6kz3+rltuF1mUeFaL8NemXLScqU7rcO9xJygl85Ua1omulT
         zsYX7Ync0PRKTRMtpFmbHVE7LWe4lP+Dfv7sHfOsQK7QEdVILph7CNBT2+uGlXjTfN7j
         xh4iRDxNThpIw3kbWgc1fSr+2F9SpDMWXGNMKkC2nbOARRt5GpP1qbsP/8A+CdcHVKCc
         WhEk6gWTkDaOIh326ENCt0ybyvD9pPmgmFiTlasq9aVV60ZNZ9mrpxq9bON6w7wvTMOL
         ijk24IiKziBPaKPdqfCjTkBDbkVmdvGp1yKk+rJKHY3yOKTC281nhrq7HWbRV8vKkSKN
         jD0w==
X-Gm-Message-State: AJIora/ZgkDMUsNeOaInojtlLStM5FDrFCl2BcD/zzNSBAI+jAnQ4q0n
        zwN6sJSuXMM35Y8q0YFHSMEzyAIhdPiLEs734nXxh9gFaFvdDfrofh+bLZy4KWkyIVYGImg5e4l
        PgsfudZyZdOo0yUiRmeN0TTTnm/1MHiqP6Q==
X-Received: by 2002:a05:6402:280b:b0:43b:5d75:fcfa with SMTP id h11-20020a056402280b00b0043b5d75fcfamr4611625ede.114.1659117591862;
        Fri, 29 Jul 2022 10:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvvmJ9xDOZlgRS8wBGhfPPiA37NlhSBDea9i8zxEiHvfKvsBZJb/F1eTsZXctoY/JSXtoPog==
X-Received: by 2002:a05:6402:280b:b0:43b:5d75:fcfa with SMTP id h11-20020a056402280b00b0043b5d75fcfamr4611608ede.114.1659117591608;
        Fri, 29 Jul 2022 10:59:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id kx6-20020a170907774600b00724261b592esm1962341ejc.186.2022.07.29.10.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 10:59:50 -0700 (PDT)
Message-ID: <79264f93-dd2c-e54e-7d77-b91193307841@redhat.com>
Date:   Fri, 29 Jul 2022 19:59:49 +0200
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <194be06e-5831-eb0e-5018-61f1cfcf9912@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/29/22 19:40, Shyam Sundar S K wrote:
> Hi Mario,
> 
> On 7/29/2022 9:13 PM, Limonciello, Mario wrote:
>> On 7/29/2022 06:03, Hans de Goede wrote:
>>>>>
>>>>> So as for the AMT mode, since that is Lenovo only, I guess that means
>>>>> that there is no need to do call amd_pmf_update_slider() when AMT
>>>>> is being disabled since at this point the firmware will have
>>>>> already set the values.
>>>>
>>>> Yeah, Shyam made this modification for v2 to make sure that code path
>>>> isn't called unless static slider was set in the BIOS.
>>>
>>> But this code path is only hit when AMT / auto mode is available and
>>> when that is true then the static slider should never be set in the BIOS
>>> so the whole amd_pmf_update_slider() call on AMT disable can simply
>>> be dropped AFAICT.
>>
>> The reason to leave it in place but guarded like this is for validation
>> of the feature behaves properly from AMD internal systems AMD test BIOS.
>>  It can be used to prove out something works properly without needing to
>> include extra drivers and software.
> 
> Yes. We will need this path to check on the internal CRB system to
> validate the 'auto mode'. Whenever the amd-pmf driver gets the AMT
> disable event we shall disable the power-settings w.r.t to 'auto mode'.
> 
> I moved the handling to amd_pmf_reset_amt() based on Hans review
> remarks, and its guarded with a if() check, so that we accidentally
> don't land up in updating the static slider.
> 
> Also left a note on the same function, so that it provides some
> information on why the logic is being done in that way.
> 
>>
>>>
>>>>
>>>>>
>>>>> Actually this seems to mean that we must ensure that the AMD-PMF
>>>>> code stops touching these settings as soon as the event is received.
>>>>>
>>>>> Which would imply killing the periodic work when an AMT off event
>>>>> is received from within the event handling and then restating it
>>>>> when AMT is on (and making sure the work being queued or not state
>>>>> matches the AMT on/off state at driver probe time) ?
>>>>>
>>>>
>>>> At first glance this seems plausible, but actually I think it should
>>>> stay as is because CQL thermals can be set at any time (that's like a
>>>> lap mode sensor event from thinkpad_acpi).  Even when AMT is turned
>>>> off, you may want the CQL thermal profile set accordingly.
>>>
>>> So the CQL code is to handle lapmode when AMT is active. But I would
>>> expect the firmware to update the power-limits, etc. for lapmode itself
>>> when in performance mode. >
>>> The amd_pmf_update_2_cql() function only does things when
>>> config_store.current_mode == AUTO_PERFORMANCE (or
>>> AUTO_PERFORMANCE_ON_LAP)
>>>
>>> And that reflects the last mode selected by the auto/AMT mode code, not
>>> the mode actual set by thinkpad_acpi so if the last auto selected mode
>>> was balanced and then AMT gets disabled because thinkpad_acpi switches
>>> to performance mode, then on CQL events after the switch
>>> amd_pmf_update_2_cql()
>>> will not do anything.
>>>
>>> To me it seems that when AMT is off the AMD-PMF code should not touch
>>> the power-limits, etc. at all and thus it should also always ignore
>>> CQL events when AMT is off.
>>>
>>> This assumes that the firmware takes care of udating the limits for
>>> on lap / off lap when thinkpad_acpi's profile is set to performance.
>>
>> Where does this assumption come from?  I guess that's how it's done on
>> Lenovo's Intel systems?
>>
>> AMT and CQL is a new feature on Lenovo AMD systems, this is the way that
>> it's supposed to be done here.
> 
> Yes, this was newly designed for Lenovo AMD systems. The behavior is
> same on windows too (atleast on the RMB laptops today) .
> 
> When the system is running in 'auto-mode performance' and the user keeps
> the system on his lap, amd-pmf driver receives a 'CQL' event from Lenovo
> BIOS. In this case, the amd-pmf driver shall apply thermal limits w.r.t
> to 'auto-mode performance-on-lap' and not 'auto-mode performance'.

The question here is not about the 'auto-mode performance' mode
but what to do when AMT / 'auto-mode performance' is disabled.

What should the behavior of the AMD-PMf code be when it receives
a CQL event when AMT is disabled ?

>>> If thinkpad_acpi does not do this then the AMD-PMF code should
>>> check what mode has been selected by the thinkpad_acpi code in
>>> amd_pmf_update_2_cql() when AMT is off.

Regards,

Hans

