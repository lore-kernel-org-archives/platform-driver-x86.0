Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A09ECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Sep 2022 10:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbiIHKJ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Sep 2022 06:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbiIHKJ6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Sep 2022 06:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8706237183
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Sep 2022 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662631795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ft2+tPb/PrNIJhwnkdJ5AXFK+zw1OBMfcJmjRNrR+kw=;
        b=hP0PTYk6iBsqYrDVdF/keO+LVYBsBA/E4IdHtMvYcwUAA7y9foPPm/tvApxL/ZtVCBhxxW
        nLydaAIznJ3dXyBpTII3isFnrarxV5C0N0ZMs1/AjqBMHCNf9LBfGUzV6Rln8o2DREavRz
        Y5Mf9iOhvv+JKDRoxa5Q0463X7Z0/7c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-Q5y8T9W9OLGIC95difVQSQ-1; Thu, 08 Sep 2022 06:09:54 -0400
X-MC-Unique: Q5y8T9W9OLGIC95difVQSQ-1
Received: by mail-ej1-f69.google.com with SMTP id xc12-20020a170907074c00b007416699ea14so6122776ejb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Sep 2022 03:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ft2+tPb/PrNIJhwnkdJ5AXFK+zw1OBMfcJmjRNrR+kw=;
        b=I4Pnn0rJYAXv+1jgVZJDex6706L8mJ/FfRysITG8sPvYIID4c38jjkgYB7SB7iUeRW
         IDqg7UD3LsTBucAzIg4cCtjLCENaQxoglysTDzEYeQjZSgmfhZERdac+jmltz3AxCRCu
         +3Y/X81eVuqW+jm8AjT3gvQsO3ctBZtZUaWtXhBgY56gxOPnKEIjOy44Wg8tfatrd5Uo
         wxUnMKzWf1SshMLhOu4kCLetRHdOiI6bPxfy6XY6XqaMxl2HkTsG+49O+20eFbDuZxkZ
         OyduIzi21w/t8EcPykx/pScD0LaJee/XV20HfbUeIWFZRlr82jc1rP7fRtCperMRqcH+
         Rpqw==
X-Gm-Message-State: ACgBeo0FY7ziOffdgnhZUhfqBaNRcMuVc32U/NzLJWsSHLXA0zjenhAl
        pN9tIzqtVCNe/nzwep2SEqRiAkEpWtGh4SCju8gwm4wEg6mt3ExIZ6Hv0jGYTpg2rrl3hna+ZUe
        dLA5HhDx8WLgLTMKcQ36xNWL7GDn8ZlyY3g==
X-Received: by 2002:a17:907:7ba0:b0:73d:bc94:3c20 with SMTP id ne32-20020a1709077ba000b0073dbc943c20mr5564302ejc.126.1662631793317;
        Thu, 08 Sep 2022 03:09:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR562d9DUM93Yu6EQ8S86zLzUekZl7O1KI5DJJBbxp5mZKdU33Bi/do7rSxIsu3V8AZgSofvDw==
X-Received: by 2002:a17:907:7ba0:b0:73d:bc94:3c20 with SMTP id ne32-20020a1709077ba000b0073dbc943c20mr5564288ejc.126.1662631792969;
        Thu, 08 Sep 2022 03:09:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906134700b007309a570bacsm1047026ejb.176.2022.09.08.03.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 03:09:52 -0700 (PDT)
Message-ID: <1ad7f330-1180-6cb3-0f41-0eb9047dd134@redhat.com>
Date:   Thu, 8 Sep 2022 12:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bastien Nocera <bnocera@redhat.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
 <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
 <d72d77c0-83bb-99b4-03ed-bb9a5b03f35e@amd.com>
 <9fe37e9a-c861-538d-a9b3-9bfc7ea381ea@redhat.com>
 <d1bfcaa3-347f-c555-1d6a-b24ccf0e5c10@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d1bfcaa3-347f-c555-1d6a-b24ccf0e5c10@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/8/22 12:08, Shyam Sundar S K wrote:
> 
> 
> On 9/7/2022 8:18 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 9/6/22 11:53, Shyam Sundar S K wrote:
>>> Hi Hans,
>>>
>>> Apologies for the delay in responding to this thread. Some responses below.
>>
>> No worries.
>>
>>> On 9/1/2022 6:14 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/1/22 14:24, Bastien Nocera wrote:
>>>>> On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 8/23/22 12:29, Shyam Sundar S K wrote:
>>>>>>> In this series, support for following features has been added.
>>>>>>> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
>>>>>>>   where the system power can be boosted or throttled independent
>>>>>>>   of the selected slider position.
>>>>>>> - On the fly, the CnQF can be turned on/off via a sysfs knob.
>>>>>>
>>>>>> Thank you. I think that before doing a more in detail review
>>>>>> we first need to agree on the userspace interactions here.
>>>>>>
>>>>>> I've added Bastien, the power-profiles-daemon maintainer
>>>>>> to the Cc for this.
>>>>>>
>>>>>> From a quick peek at the patches I see that currently they do
>>>>>> the following:
>>>>>>
>>>>>> Probe time:
>>>>>> -----------
>>>>>>
>>>>>> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
>>>>>> is available register as a platform_profile provider
>>>>>>
>>>>>> 2. Query if the BIOS tells us that CnQF should be enable by
>>>>>> default if yes then unregister the platform_profile provider
>>>>>> and enable CnQF
>>>>>>
>>>>>>
>>>>>> Run time:
>>>>>> ---------
>>>>>>
>>>>>> Allow turning CnQF on/off by writing a sysfs attribute for this.
>>>>>>
>>>>>> 1. When CnQF gets enabled unregister the platform_profile provider
>>>>>>
>>>>>> 2. When CnQF gets disabled restore the last set profile and
>>>>>> register the platform_profile provider
>>>>>>
>>>>>>
>>>>>> Questions/remarks:
>>>>>>
>>>>>> 1. If you look at 1. and 2. under "Probe time", you will see that
>>>>>> when the BIOS requests to have CnQF enabled by default that
>>>>>> userspace will then still shortly see a platform_profile
>>>>>> provider. This must be fixed IMHO by checking whether to do
>>>>>> CnQF by default or not before the initial register call.
>>>>>>
>>>>>> 2. What about low-power scenarios ? Currently power-profiles-daemon
>>>>>> will always advertise a low-power mode even when there is no
>>>>>> platform-profile support, since this is also a hint for other
>>>>>> parts of the system to try and conserve power. But when this
>>>>>> mode is enabled we really want the system to also behave as
>>>>>> if the old static slider mode is active and set to low-power.
>>>>>>
>>>>>> Some ideas:
>>>>>> a) maybe still have the amd-pmf code register a (different)
>>>>>> platform_profile provider whn in CnQF mode and have it only
>>>>>> advertise low-power
>>>>>>
>>>>>> b) teach power-profiles-daemon about CnQF and have it
>>>>>> disable CnQF when entering low-power mode?
>>>>>>
>>>>>> c) make the CnQF code in PMF take the charge level into
>>>>>> account and have it not go "full throttle" when the chare
>>>>>> is below say 25% ?
>>>>>>
>>>>>> 3. Bastien, can power-profiles-daemon deal with
>>>>>> /sys/firmware/acpi/platform_profile disappearing or
>>>>>> appearing while it is running?
>>>>>
>>>>> No, it doesn't.
>>>>>
>>>>> It expects the platform_profile file to be available on startup, at
>>>>> worse with the choices not yet filled in. It doesn't handle the
>>>>> platform_profile file going away, it doesn't handle the
>>>>> platform_profile_choices file changing after it's been initially
>>>>> filled in, and it doesn't support less than one power profile being
>>>>> made available, and only supports hiding the performance profile if
>>>>> the platform doesn't support it.
>>>>
>>>> Ok, so this means that if we go with these changes as currently
>>>> proposed that if a user uses the sysfs file to turn CnQF on/off
>>>> they will need to restart power-profile-daemon.
>>>>
>>>> I think that that is acceptable given that the user needs to manually
>>>> poke things anyway. We should probably document this in the documentation
>>>> for the sysfs attribute (as well as in newer versions of the p-p-d
>>>> docs/README).
>>>>
>>>>> Some of those things we could change/fix, some other things will not.
>>>>> If the platform_profile_choices file only contained a single item,
>>>>> then power-profiles-daemon would just export the "low-power" and
>>>>> "balanced" profiles to user-space, as it does on unsupported hardware.
>>>>
>>>> Right.
>>>>
>>>>> The profiles in power-profiles-daemon are supposed to show the user
>>>>> intent, which having a single setting would effectively nullify.
>>>>
>>>> Yes that was my understanding too.
>>>>
>>>>> It's unclear to me how CnQF takes user intent into account (it's also
>>>>> unclear to me how that's a low-power setting rather than a combination
>>>>> of the existing cool and quiet settings).
>>>>
>>>> AMD folks, please correct me if any of the below is wrong:
>>>>
>>>> AFAIK even though it is called CnQF it is more like auto-profile
>>>> selection and as such does not take user intent into account
>>>> at all.
>>>
>>> Yes, You are right. Below is a brief note on how CnQF was designed.
>>>
>>> 1)CnQF – Cool And Quiet Framework - It’s an extension of the static
>>> slider concept wherein PMF dynamically manages system power limits and
>>> fan policy based on system power trends.
>>>
>>> 2)OEM can opt into the feature by defining the CnQF BIOS ACPI method.
>>>
>>> 3)Static slider control and CnQF are mutually exclusive.
>>>
>>> 4)CnQF supports up to 4 modes of operation – Turbo, Performance,
>>> Balanced and Quiet.
>>>
>>> - It can be configured for AC and DC distinctly.
>>> - PMF driver calculates the moving average of system power and switches
>>> the mode of operation.
>>>     *If system power is limited to the threshold of the current mode,
>>> move to the next higher mode
>>>     *If system power is not limited to the threshold of the current
>>> mode, reduce the power budget by moving to the next lower mode.
>>>
>>> 5)CnQF feature control is through Radeon SW (a GUI based tool on Windows)
>>>
>>> To match the behavior on Windows, we kept a sysfs node to turn on/off
>>> the CnQF on the fly like the way it can be done the windows side with
>>> the Radeon SW tool. If you think that having as a module param makes
>>> more sense, I am open to make the change and send a v2.
>>>
>>> Like I mentioned above, on Windows the static slider is absoultely dummy
>>> when the user goes on turns on the CnQF from Radeon SW tool. Based on
>>> the review remarks on the earlier series, we tried to
>>> register/de-register to platform_profile, as per sysfs input (like
>>> setting up and tearing down to platform_profile).
>>>
>>> The Difference between Auto-mode (for thinkpads) and CnQF(for others) is
>>> that:
>>>
>>> - Automode gets turned on only when the slider position is set to
>>> "balanced" in the platform_profile and
>>> - a corresponding AMT ON event is triggered.
>>> - it has 3 internal modes quiet, balanced, performance
>>>
>>> But for CnQF,
>>>
>>> - it is independent of the slider position and there are no ACPI events
>>> for it to get kicked in.
>>> - There are two seperate ACPI methods for AC and DC to get the
>>> corresponding thermal values.
>>> - it has 4 internal modes quiet, balanced, performance, turbo
>>>
>>>
>>> There is already a WIP feature called "policy builder" where the OEMs
>>> can build custom policies, which includes looking at the battery
>>> percentages and making thermal optimizations accordingly. But this was
>>> not taken into consideration while designing the CnQF on windows too. If
>>> we bring in this change for Linux, there maybe differences in the way
>>> the same feature behaves "differently" across OSes.
>>>
>>> Like you mentioned the usecase, where just a compilation can end up in
>>> battery drain if not connected to AC power.
>>
>> Thanks for the explanation above.
>>
>>> Can we not have a
>>> documentation update saying it is advised to turn "off" CnQF when
>>> battery % goes below a certain level?
>>
>> So we would need to document that the user needs to poke
>> the sysfs file when the battery is low ?  That seems very user
>> unfriendly.
>>
>> And also don't want power-performance-daemon to need to know about
>> this AMD specific sysfs knob. That is why we have the standardized
>> platform_profile userspace API.
>>
>>> That way, the end user experiences
>>> across Linux and Windows remains the same.
>>
>> I can understand that you want to keep things the same. If I've
>> read the above correctly then currently the user experience under
>> Windows is that the slider in Windows has been turned into a
>> dummy slider which does not do anything.
>>
>> That IMHO is quite a poor user-experience esp. when users want
>> their battery to last longer because they are going to be e.g.
>> on the road the entire day.
>>
>>>> It looks at the workload over a somewhat longer time period (say
>>>> 5 minutes or so I guess?) and then if that consistently has been
>>>> quite high, it will select something similar to performance.
>>>
>>> Right. The switch time would be dependent on the "time constant" values
>>> set in the BIOS  which is configurable to the OEMs.
>>>
>>>>
>>>> Where as for a more mixed workload it will select balanced and for
>>>> a mostly idle machine it will select low-power.
>>>>
>>>> I guess this auto feature is best treated the same as unsupported hw.
>>>>
>>>>> (it's also
>>>>> unclear to me how that's a low-power setting rather than a combination
>>>>> of the existing cool and quiet settings).
>>>>
>>>> Even though it is called cool and quiet AFAIK it won't be all that
>>>> cool and quiet when running a heavy workload. Which is why I wonder
>>>> how to re-conciliate this with showing low-power in e.g. the
>>>> GNOME shell system men. Because in essence even if the battery
>>>> is low the system will still go full-throttle when confronted
>>>> with a heavy workload.
>>>>
>>>> So selecting low-power would result in the screen-dimming which
>>>> I think is part of that, but the CPU's max power-consumption won't
>>>> get limited as it would when platform-profiles are supported.
>>>>
>>>> So I guess this is indeed very much like how p-p-d behaves
>>>> on unsupported hw...
>>>>
>>>> ###
>>>>
>>>> As mentioned I guess one option would be for CnQF to
>>>> still register a platform_profile provider and then in
>>>> balanced mode do its CnQF thing and in low-power mode
>>>> disable CnQF and apply the static-slider low-power settings
>>>> I think that that would work best from things actual
>>>> working in a way I would expect the avarage end-user to
>>>> expect things to work.
>>>>
>>>> So p-p-d would then still see platform-profile support
>>>> in CnQF mode but with only low-power + balanced advertised.
>>>>
>>>> Bastien would that work for you?
>>>>
>>>> AMD folks would that also work for you ?
>>>
>>> If we go with the above proposal it would become very identical to what
>>> is being done with automode (expect the extra "turbo" mode and not
>>> having a AMT event).
>>
>> Yes I think that the AMT mode, where the more dynamic behavior os
>> only done in balanced mode and low-power is still very much a low
>> power-mode (and performance is always tuned for permance) makes
>> a lot more sense from an enduser pov. Then the slider still actually
>> works as expected and in the default balanced mode users will get
>> the benefits of the new CnQF behavior / feature.
>>
>>> This would need some amount of discussion with our
>>> windows folks also to know what they think about it.
>>
>> Ok.
>>
> 
> OK. I get it. Your preference is to have CnQF getting ON only when
> 
> 1. BIOS advertises CnQF is "supported" and/or
> 2. Sysfs knob is set to ON. and
> 3. the static-slider (platform_profile) is set to "balanced"
> 
> In rest of the cases, (low-power or performance) the control would still
> remain with the static-slider so that, user can make his own choices.

Yes that is correct.

> If that's the case, let me have a word with the windows team also on how
> we can have user experiences same across OSes and come back.

Great, thank you.

Regards,

Hans

