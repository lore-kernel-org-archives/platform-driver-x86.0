Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9A8C4346E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F801221EB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRvZ/2cT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbgIXIVo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52686 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727244AbgIXIVo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600935702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1Kc3VZnObiRgsrZVl++SdbYNoEifqebu7XMCmFX298w=;
        b=hRvZ/2cTc1TJ0AoTNJia1mN+2tpWzqEc4OmBs59tvfFF/BsC7HNbCdllsniTRwgzpnuURi
        JlNsQccNPLsGHZaCgvWNE0VfGQ608t1//vuowMJVj5Jax6Z/H3B0Y20vPw9WriTKXLgpj1
        7ebPkOdgVKnqsepYxPv5Gr7EUP/3CBU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-wX29vLj2OFCBoEpZ6bjgIA-1; Thu, 24 Sep 2020 04:21:37 -0400
X-MC-Unique: wX29vLj2OFCBoEpZ6bjgIA-1
Received: by mail-ed1-f71.google.com with SMTP id n16so881478edw.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 01:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1Kc3VZnObiRgsrZVl++SdbYNoEifqebu7XMCmFX298w=;
        b=a3K2EiW+M3Ze6Qxqk0O0wokkVLFluoeeavJNiR07mL2V5HkKXFQ9dR4bIKz4L8IZFw
         /LszjsGsC0pRuRC3o6eI/U5LtXNpjzYUN1xZI+dsR8+A6x9p6A0YR0Lf4VmM9lPQKBUU
         43aBfwqgvFsBD0f/Cp5P4hnrLOc/9Yx//5ilmlFVeFP8EI4Kh9CfJTB43NuSf3G31IRL
         0SnNgSzC89ixELw2OR96uSWqcNWlHYSkjd8w9rAqCIsXW+YGcaUzCphzamQ6KQ6poid9
         ygx6N3L42jLCKEMRl5RJ+fFgQirBejBnzZYOV+3ZeCPyC6G1WezdWMLcph8MAR1pcpAF
         SEaQ==
X-Gm-Message-State: AOAM532cUySnVwRqnK/l2hUvhFYl5pKg15JMX6cfyK0w1CsrIiiq4/uj
        cIG+gNUKFKjYh905e6ugUuEug2wM7FZA21F4spagGSgU7ZSMQ/BvHwk/rkgtBswi2IVjlpXOLHI
        elgQeyvUnSNsnp/LuAshU8+j3pRLolbfbyQ==
X-Received: by 2002:aa7:d815:: with SMTP id v21mr3480072edq.56.1600935695395;
        Thu, 24 Sep 2020 01:21:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJG/Q+AcZ7iVjC0jJ829BnRo30WSMRJbLDkBUPidhZJ2pLZeJjtZzi0Ap5/kTCZfu2eu8FfA==
X-Received: by 2002:aa7:d815:: with SMTP id v21mr3480037edq.56.1600935694984;
        Thu, 24 Sep 2020 01:21:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id m2sm1812694ejo.4.2020.09.24.01.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:21:34 -0700 (PDT)
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Mark Pearson <markpearson@lenovo.com>,
        Elia Devito <eliadevito@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
 <261328975238951d0412727220a1b7d915cebb99.camel@redhat.com>
 <9766663.nUPlyArG6x@pce> <79735e10-6dfc-ffff-5b42-b78e19e24d9b@redhat.com>
 <c3446ec8-9dba-8e20-3a15-a03ed39e4f8e@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <660cc83d-a5b8-5fab-a35a-178bb59bc9e3@redhat.com>
Date:   Thu, 24 Sep 2020 10:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c3446ec8-9dba-8e20-3a15-a03ed39e4f8e@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

Thank you very much for your feedback, much appreciated.

On 9/24/20 4:10 AM, Mark Pearson wrote:
> 
> 
> On 2020-09-22 6:43 a.m., Hans de Goede wrote:
>> Hi,
>>
>> On 9/21/20 11:03 AM, Elia Devito wrote:
>>> Hi all, sorry for response delay I'm very busy at work this period
>>
>> No problem.
>>
>>> A common interface is surely the best solution, especially because it allows
>>> to standardize the user-space tools and maybe to integrate its with desktop,
>>> like Bastien is doing with gnome-power-profiles-daemon or like the similar tool
>>> plasma-pstate.
>>>
>>> I think we should keep separate performance and thermal profiles thus leaving
>>> the possibility of setting a thermal profile independently of the performance
>>> profile and vice versa.
>>>
>>> Hp implements up to 4 thermal profiles (apparently the same ones that implement
>>> dell), my patch implements the first 3 profiles which are the ones supported by
>>> my hardware.
>>>
>>> 1. HP Recommended -> fan stay off and start at low~medium speed when necessary
>>> 2. Performance    -> fan stay off and start at medium~hight speed when
>>> necessary
>>> 3. Cool           -> fan stay off and start at medium~hight speed when
>>> necessary
>>> 4. Quiet          -> fan should stay off and start at very low speed if
>>> necessary
>>>
>>> for each profile the firmware set also a OEM variable to select DPTF profile
>>> with the adeguate power limit.
>>>
>>> combining these profiles with the performance profiles it is possible to obtain
>>> the desired performance according to the needs of the moment
>>>
>>> e.g.
>>>
>>> For gaming purpose when the CPU and GPU share the thermal budget, in this case
>>> the best solution is to set thermal profile to performance to maximize the heat
>>> dissipation and the p-state profile to powersave, in this way during loadings
>>> the cpu gain a performance boost that allow to reduce loading time, instead,
>>> during gameplay the cpu performance will be limited in favor of the GPU
>>> allowing the maximum framerate to be reached.
>>> (feral had to handle it for its gamemode tool:
>>> https://github.com/FeralInteractive/gamemode/pull/179)
>>>
>>> Another opposed particular case could be thermal profile set to quiet and
>>> p-state set to performance, usefull for example to maximizze cpu performance
>>> in silent ambient room like a library, obviously for CPU-only intesive tasks
>>> the best solution is to set either thermal and performance profile to
>>> performance.
>>>
>>> Basically there are infinite combinations that can be made to obtain the best
>>> configuration for each situation, to allow this a common interface should offer
>>> a possibility to:
>>>
>>> - Define the list of thermal profiles separately from the performance ones
>>> - Eventually define a list of on/off attributes (useful for lenovo lap_mode?)
>>> - Provide a description of them
>>> - Switching between thermal profiles regardless of the performance profile
>>>
>>> A possible solution could be a "slider like" interface for performance level
>>> and a list of thermal profile.
>>
>> So I have been thinking about this and performance level and thermal profile
>> are really inherently couple to each other. Telling the CPU it can use
>> 25W TPD instead of the default 15W, without also ramping up the cooling is
>> just going to lead to a whole bunch of thermal throttling.
>>
>> In a desktop machine with a discrete GPU it is sorta easy, in essence you have
>> a GPU performance profile, controlling GPU TPD/turbo behavior and the GPU
>> fans too match, and a CPU performance profile which likewise controls
>> the CPU fan profile too match the CPU performance profile.
>>
>> With laptops with a discrete GPU things become harder because there is a
>> single shared cooling mechanism. But there you could simply say that
>> performance-profile = max(gpu-profile, cpu-profile).
>>
>> I mean telling the GPU and CPU that they can burn a gazillion watts and
>> then telling the cooling setup to be as quiet as possible, is clearly
>> not going to end well.
>>
>> This all assumes that we have some nice way to tell the hardware about
>> the 3 separate (gpu / cpu / cooling) profiles we want.
>>
>> But that is not always the case; and often when using a CPU with
>> integrated GPU they are all tied together.
>>
>> So my proposal is to have a :
>>
>> /sys/class/performance-profile
>>
>> Underneath we can have one or more entries (performance-profile providers)
>> each one with a performance_level file on the previously suggested 0-100 scale
>> and a performance_mappings file listing the supported discrete values on that
>> scale and some descriptions of those discrete values purely for informational
>> purposes.
>>
>> Besides the performance_level and performance_mappings files I would also like
>> to add a "type" sysfs attribute, which can have 1 of 3 values:
>> "system", "cpu" and "gpu".
>>
>> So something like the thinkpad_acpi performance levels will be "system", and
>> the intel_pstate driver could maybe also register itself here as a "cpu"
>> type performance-profile provider.
>>
>> This will allow userspace (if / when it wants to) to do things like put the
>> CPU in medium/balanced mode while telling the GPU to go full-throttle for when
>> playing a game which is clearly GPU limited.
>>
>> This game scenario of course assumes that we then actually will have a
>> performance-profile driver for both the CPU and the GPU.
>>
>> Note I'm still just brainstorming here, but I think that having the
>> 0-100 scale + the type thing should cover all the use-cases we want
>> to cover.
>>
>> As always feedback or alternative API proposals are very much welcome.
>>
> I was mulling this over and I think the 1 to 100 slider seems awkward - too many levels and the fine graduation mapping onto somewhat coarse (3, 4 or 5) options doesn't seem to fit well for me. I'm struggling to see how it fits the tweaking CPU vs GPU vs system - do we end up introducing multiple sliders - which gets complicated with all the choices? I'm just not convinced yet.

So one thing to keep in mind here is that this is the kernel <-> userspace
API. It certainly is not the intention for a UI to show this 0-100 scale
to end-users. The most raw version of a UI should display the number
of actually supported levels given by the mappings file, preferably with
the labels from the mappings file visible.

So the idea behind the 0-100 scale, is that lets sat that
we have 2 laptops, which each 4 profiles:

1. Game laptop:    Low power, Balanced, Performance, Ultra Performance
2. Ultra-portable: Ultra Low Power, Low Power, Balanced, Performance

And we have a UI which offers a balanced option, then to configure
the balanced option on laptop 1. we would need to select profile 1 (of 0-3)
and on laptop 2. we would need to select profile 2 (of 0-3)

The idea behind the 0-100 scale is that in that case both would map
there balanced profile to 50 and userspace can just write 50.

Note I'm not 100% sold on this idea myself yet.

> I'm also not sure about being able to tweak everything too - Linux users are smart but is it just getting irritating at that point? Power (hah!) users have plenty of tweaking tools at their disposal if they want to get into change p-states and tweak every little power option; but this exercise is aimed at those who want to make simple general changes - increase the power because they have a build to complete, drop into quiet mode when watching a movie, or a low power setting when they know they're not going to be able to charge for a long time. I suspect some smart person will end up 
> automating all this but that's by the by.

Well for power-users to be able to tweak, the kernel API
needs to expose all the support profiles. Before the 0-100
idea, the idea for the user space API was to use strings
and just support "low-power", "balanced" and "performance" +
optional extra profiles where the extra profiles where
sort of a free-for-all wrt names, etc.

> So as a counter proposal: Have the slider choose between some key modes that we think cover the use cases that people would *want*.
> 
> I'd keep the mode list small to avoid it being confusing - more could be added later if really needed but I'm guessing (and happy to be corrected) that the majority of activities would fit into just a few boxes reasonably well.
> 
> For instance (I think I get the following from the above):
>   - low power/Cool
>   - Quiet
>   - balance/default
>   - CPU performance
>   - GPU performance
 >
 > The vendors would just choose their optimal firmware setting for that use case depending on what they have available.

 From a UI perspective this might very well work, but chances are
that for GPU performance we would need to:

a) Tell the EC to go for maximum cooling / aggressive ramp up the fans
b) Tell the CPU (e.g. pstate, TPD) to go for a balanced profile
c) Tell the GPU, (e.g. the nouveau or radeon drivers) to aggressively
turbo and maybe if it has a configurable TPD give it some more TPD

And we very likely need to talk to multiple drivers for this,
at least some firmware driver and the GPU driver.

Which is where my type attribute idea comes from. I know that for this
discussion started with controlling firmware (DPTF oem vars / EC)
performance-profile settings, but at some point we probably also need
to e.g. bring in controlling GPU turbo performance profiles.

> Apart from the GPU performance option that maps pretty well for Lenovo and I think it maps very nicely for HP. I wanted to squish low power ad quiet together but that seemed unfair - they are very similar though :)
> I'm struggling to think of other use cases that would really matter...thoughts? Is this *too* simple?

Well this looks a lot like what we started with and I think it is also
closer to what Bastien would prefer as an userspace API for this.

So I guess that would bring us full circle to the initial proposal
where we have a bunch of strings describing profiles, but too avoid
a free-for-all we pre-define a bunch of standard profile names and
we say in the specification that where-ever possible drivers should
map there avaivable profiles to the pre-defined profile names ?

Bastien, have I understood you right that having a list of
pre-defined profile-names and then using strings for the sysfs
API would be your preferred API for this ?

I do still think we should probably add a "type" attribute, which
for thinkpad_acpi and for hp-wmi would probably just be hardcoded
to "system".

I think that having the notion of a separate performance profile for at
least the GPU makes sense, not because of that is the UI which we want
to show to end users, but because the GPU's turbo behavior will likely
be controlled by a completely different driver. AFAIK currently different
GPU drivers have different knobs for this, preparing the
performance-profile API to allow the drivers to offer a unified
(and probably dumbed down a bit) API for this is something which we
should at least keep in mind.

I guess that for GPU drivers we could also have a "custom"
performance-profile, so when users use advanced vendor/driver specific
tools to tweak the GPU performance, then reading back the currently
selected profile would report custom; and writing one of the default
profiles would override the users/tools tweaks and go back to the
settings belonging to that profile.

Anyways adding a "type" sysfs attribute will allow us to also use
the performance-profile API for e.g. GPUs later, we can also even
define only 1 valid value for it for now ("system"). This way we
can document that tools interacting with the API should at least
check the type and skip performance-profiles with a type they do
not know.

Bastien, any comments on the concept of having a type sysfs attribute?

Regards,

Hans

