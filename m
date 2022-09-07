Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D893C38145
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Sep 2022 14:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiIGOfR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Sep 2022 10:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiIGOfP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Sep 2022 10:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D93402FB
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662561313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D1lculTNp7txzwE3fL4HpNFHzIe1uaHjyltTsL/UvWw=;
        b=FjQU/J8aVHKSu4GpZ8z5mU8ugdqft9aJk9KRHwIo/QOiacQC+S+t4CByNsVibeX1WMU1Vi
        rr4EKOIGQVbUEGAvu24BF1livYEfYa+fA3eU+aE53yfQYjt/LdiBY3jC1FkCSwqUBkAqGI
        k5ryTHf9BVvWBkV6TAVRHoEsFVcjen0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-Gb1FO6a5PwyzgOPFs1KFcw-1; Wed, 07 Sep 2022 10:35:11 -0400
X-MC-Unique: Gb1FO6a5PwyzgOPFs1KFcw-1
Received: by mail-ed1-f71.google.com with SMTP id y12-20020a056402358c00b00448898f1c33so9704892edc.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Sep 2022 07:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=D1lculTNp7txzwE3fL4HpNFHzIe1uaHjyltTsL/UvWw=;
        b=duRORk0MOnMC+xihGXkTOYK/lJcfjFc6McvGDeKeSlaX7VRrkdXAykr6uasCnlAdiQ
         XYAS0SAgfg2QWtW7EOcs9JyPfkZN166t/doP3XTsLTsByxEtUMceiRnZgdAZXItgHH37
         /L8gvYX6KPu7SDe8jovQlDT7AtDp1oJB6wNLbtgkLZ9qj/IY3cX1N3YfdXMfrCD5FIYu
         DGzQGOQee43mR1uoYk9vE8WG6xs1EiR7+EQwtbDLGbeZmrRMVQSJMu3XFe15zkOIkw13
         dVokhQbcBhfIi4FyYazDJc9oh7GslhNUA1JV/px5JYMjj352Px6M3MlRqvCLpGJX3m9k
         dahQ==
X-Gm-Message-State: ACgBeo1XkieqdEY/nZl4/bfxTtOb15hVysQSqYcyICHGcaVgk0iJ0ZiT
        YLnwcDvYa2Xp4RxsLsy7AbOOi5qB7G9jDZHz3/gD7RLGZVKSUyYx9+YdmNG7SivcB8RtRBJKCbI
        cJEIyJBcN4PLrzpzf/T7ekcXNkmj4KZmI/A==
X-Received: by 2002:a17:907:7d9e:b0:771:db66:7b7c with SMTP id oz30-20020a1709077d9e00b00771db667b7cmr348786ejc.393.1662561310349;
        Wed, 07 Sep 2022 07:35:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7wP/gCf+Kc0i81wSQ9wXWSchKlixBvf3iyOsWNcrtAZG6175naBM+zEWWBNxMvW+Im+7LTVw==
X-Received: by 2002:a17:907:7d9e:b0:771:db66:7b7c with SMTP id oz30-20020a1709077d9e00b00771db667b7cmr348772ejc.393.1662561310074;
        Wed, 07 Sep 2022 07:35:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p25-20020aa7d319000000b0044ee2869ef7sm3176989edq.4.2022.09.07.07.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 07:35:09 -0700 (PDT)
Message-ID: <b29956c0-6b72-a8a4-ccca-0bad7b07c041@redhat.com>
Date:   Wed, 7 Sep 2022 16:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
Content-Language: en-US
To:     Bastien Nocera <bnocera@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
 <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
 <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
 <a5ac5eb7-6a8e-aafd-10ca-b3049a7a74f4@amd.com>
 <CAKEBQohHJcxgRr4rMcdDMyi1cgBebcbeVcQu7qfAPuNK5E4t=Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKEBQohHJcxgRr4rMcdDMyi1cgBebcbeVcQu7qfAPuNK5E4t=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Bastien,

On 9/7/22 16:24, Bastien Nocera wrote:
> Hey Shyam,
> 
> I misunderstood that CnQF was a single setting, but it looks like it
> has 4 different levels, right?
> Unless there's a major malfunction, I don't think that offering to
> switch between 2 different policies where the difference is how
> "static" the performance boosts are is very useful, or comprehensible,
> to end-users.
> 
> If CnQF only has a single "on" setting, then this could replace the
> balanced mode for what you call "static slider", so the end-user can
> still make a choice and have agency on whether the system tries to
> save power, or increase performance.
> 
> If CnQF has multiple levels (Turbo, Performance, Balanced and Quiet,
> right?), then I don't think it's useful to have a sysfs setting to
> switch it at runtime, which only confuses user-space and the users.
> BIOS setting and/or kernel command-line option are the way to go.
> 
> Did I understand this correctly?

Let me try clarify things:

CnQF has 4 levels internally, between which it switches automatically
based on the workload of the last 5 minutes.

So from a userspace pov CnQF is a single setting which can be toggled
on / off.

Basically it is a more dynamic balanced mode, so I think it makes
sense for the amd-pmf code to always export a platform_profile
interface and when CnQF is on then use CnQF for balanced
and the static slider settings for low-power / performance.

And when CnQF is off, then just use what AMD calls the static slider
balanced setting.

This way for performance-profile-daemon nothing really changes.

This can then be combined with allowing the user to turn CnQF
on/off through sysfs as an extra option which p-p-d can ignore
(this sysfs file then choses between CnQF and static balanced
mode when balance is set through the platform interface).

Regards,

Hans


p.s.

Shyam I will reply to your emails in a couple of minutes.





> 
> On Tue, 6 Sept 2022 at 12:00, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wrote:
>>
>> Hi Bastien, Hans
>>
>> On 9/1/2022 7:04 PM, Bastien Nocera wrote:
>>> On Thu, 1 Sept 2022 at 14:44, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
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
>>>>
>>>> It looks at the workload over a somewhat longer time period (say
>>>> 5 minutes or so I guess?) and then if that consistently has been
>>>> quite high, it will select something similar to performance.
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
>>>
>>> That's something I can make work, yes.
>>>
>>>> AMD folks would that also work for you ?
>>>>
>>>> ###
>>>>
>>>> I'm also wondering if we are going to still export
>>>> balanced + low-power modes to userspace in CnQF mode
>>>> and disable CnQF in low-power mode then if we
>>>> even need a sysfs knob to turn it on/off at all.
>>>>
>>>> I guess the sysfs knob would then still be useful
>>>> to turn it on on systems where it defaults to off
>>>> in the BIOS.  Might be better to do this as
>>>> a kernel-cmdline (module-param) then though, then we
>>>> also avoid the problem of platform_profile support
>>>> all of a sudden changing underneath's p-p-d's feet.
>>>
>>> I would say that, you could probably have CnQF transparently replacing
>>> the more static "balanced" profile if it is available, and have a
>>> separate setting to force enable/disable it as a kernel command-line
>>> for debugging or if the BIOS menu doesn't offer it as an option.
>>>
>>> That way the balanced mode would work like a more refined automatic
>>> profile switcher, and make the default experience better, without the
>>> disappearing profiles, or the user-space API headaches.
>>>
>>
>> module param would be fine to force load CnQF if the BIOS does not
>> advertise it.
>>
>> But I still think, having a sysfs node would still help to give an
>> option to the user to "opt-out" of the scenarios where he thinks that
>> battery can drain out if CnQF is turned on? Or in any case to turn
>> on/off CnQF on the fly, so that he can still switch back to the
>> traditional "static slider" based power optimizations.
>>
>> Please let me know your thoughts on this?
>>
>> Thanks,
>> Shyam
>>
> 

