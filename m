Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61678C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 14:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjBMO00 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 09:26:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjBMO0Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 09:26:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD54B16AEC
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 06:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676298351;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RFdS9emE4HcPbLEGQ9hmQkfbGnycbiSpWJAWa6xlmLI=;
        b=OiE5ujGXXqQNH9ca4zuHjSu+6qCrshOVEfq7va/HCgfuipWOqcaSFq2xIAjCtKMNuXyM0n
        4y5Ul6vPjveAQn9LoS4se0KRidRPYF4MTky8bfTgFfj3Bz3gpV7lH+kbkcn0ewKdIas7xq
        taiZUSOwjCaGp9nL7RfeNGSB6oYlX8I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-4-PoEoeFPRWij4l9bkEr2A-1; Mon, 13 Feb 2023 09:25:50 -0500
X-MC-Unique: 4-PoEoeFPRWij4l9bkEr2A-1
Received: by mail-ed1-f72.google.com with SMTP id g19-20020a056402115300b004a26cc7f6cbso7687905edw.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 06:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFdS9emE4HcPbLEGQ9hmQkfbGnycbiSpWJAWa6xlmLI=;
        b=mohrILjo9CnZvSCtVXK3G78xzwyukNvRBrTQoKKdOFw2Y7/e1rSklWLm8qc/ZCEubp
         BZK/GH2/EEDjRFDHSzKiSP51kG8d5clDwaATIC0NKgwilLHv94RXvH3u6Rbisq9X5bdb
         zszSUUv8DCMWHVJLJXPZ4V82OScahFHRaRAloT/FmyrlPk+bioOLgxQMQkrAHuVXlQwF
         Jo1nbR12J57kv9PKzGYQ1Cw0IHkwaO1kAT15dT0lUBe2eZD1T6ILgUsy4DioHcou3obX
         +X4qBWOxKweNu6Qc0lnrM6sSNvO4hreghf54hFFN3/7qWpmPOT1Z7+I/2VeT7+5bGtxs
         ft/A==
X-Gm-Message-State: AO0yUKX0Zivv6Tqoy679FviP0rBxsSsQdrEv9JzQnmjuwAMd53Y2Uxng
        dQ0G71CIfCE/diHV30B3nW06Z6xDNNjsAH5VmC7pdUtPXwZOIiiBR8Ll4T+zAtgZmr+YONsiFEa
        2Z+QbqXwJXcMIc75agsmpdT1lNO7/5yXfzuaVXqM=
X-Received: by 2002:a50:a442:0:b0:4aa:9fc2:216 with SMTP id v2-20020a50a442000000b004aa9fc20216mr29700480edb.9.1676298349214;
        Mon, 13 Feb 2023 06:25:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8OuvzuaZVjtT30DuQv5kuXekDRtP1G2qNR/krvYW860GEabuEHS+F7jmBEMgpNeF/KtP1Lhg==
X-Received: by 2002:a50:a442:0:b0:4aa:9fc2:216 with SMTP id v2-20020a50a442000000b004aa9fc20216mr29700462edb.9.1676298348867;
        Mon, 13 Feb 2023 06:25:48 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s6-20020a50d486000000b004aab36ad060sm6695270edi.92.2023.02.13.06.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 06:25:48 -0800 (PST)
Message-ID: <b402d146-5110-970a-3f5b-8c4c4859ede1@redhat.com>
Date:   Mon, 13 Feb 2023 15:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
To:     Ed W <lists@wildgooses.com>,
        Philip Prindeville <philipp@redfish-solutions.com>
Cc:     platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <cb93fd68-5195-0d5e-cd40-5eba61df4c38@wildgooses.com>
 <3fffc76d-4e1b-4eef-3d9f-6d61cecacb46@redhat.com>
 <5F93DF5F-BEC4-4B2A-A057-A895282A66B2@redfish-solutions.com>
 <3a36b460-9108-5c83-b4f6-42b4718afcf0@redhat.com>
 <59ded4b9-04e9-d5d3-98eb-af0d4340a2fa@wildgooses.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <59ded4b9-04e9-d5d3-98eb-af0d4340a2fa@wildgooses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/13/23 15:05, Ed W wrote:
> Hi All
> 
> 
>> On 2/9/23 07:04, Philip Prindeville wrote:
>>> Hi Ed and Hans,
>>>
>>> First off, sorry for taking a while to get back.  My wife has been busy with final exams at uni and I've been having to take care of the kids for both of us.
>> No problem.
> 
> 
> Ditto here. I ran out of time to build a current kernel and double check the ACPI status! However, I
> can get the details in the next week to confirm. Apologies!
> 
> 
> 
>>>>> Hi, I'm not sure what the "correct" thing to do is, but just to add some background to the situation:
>>>>>
>>>>> There are an increasing number of APU boards, which are *very* similar, and also through time the
>>>>> pin allocations have muddled around, plus most recently, the BIOS can configure many things and has
>>>>> started to use naming conventions different to the historic kernel naming
>>>>>
>>>>> So I don't have a board in front of me to be definitive, but something like the following happened:
>>>>>
>>>>> - APU2 used something like mpcie sockets 1&2 for USB stuff and hence LTE cards, socket 3 was msata
>>>>>
>>>>> - Then another version APU3, I think moved these to sockets 2&3
>>>>>
>>>>> - Then another version APU4, moved the USB to sockets 2&3 and wired up a second SIM slot in most
>>>>> versions, including a SIM line swapper chip. Now you start to wonder if you should have labelled
>>>>> things PCIE1, PCIE2, PCIE3, etc, when really they mean modem 1 and modem 2, etc?
>>>>>
>>>>> - Then came APU5, which has 3x USB sockets, plus 3x mpcie sockets. These are wired to different pcie
>>>>> numbers, and so the naming modem1, modem2, modem3 starts to make a lot more sense.
>>>>>
>>>>> - APU6, which is mentioned in the original patch, is really just the same as one of the other
>>>>> boards, but with different ethernet sockets (SFP vs copper)
>>>
>>> Yes, eth0 on the APU6 is an i210 w/ SFP cage, and i211 on all of the other ports.  The APU4 and others all used i211's on all the ports (for 1000baseTX).
>>>
>>> I've asked PC Engines for a definitive list of what GPIO lines are used for what on all of the current revs of the boards.  I'll share that as soon as I get it.
> 
> 
> Minor nitpick.  The APU2 has i210 on the original boards. However, recently the shortage of intel
> chipsets has led to various compromise options and some boards are coming with i211 on. I'm not sure
> if Pascal will standardise on these for the future though?
> 
> There is also an APU7 mentioned in the latest firmware notes. I don't own one of these, nor the
> schematics, but the release notes say that it's an APU3 with different ethernet ports. I suggest we
> assume this to be true and add APU7 to our detection?
> 
> 
> 
>>>> Hmm, can you elaborate a bit on this?  Does ACPI somehow expose the LEDs / GPIO to userspace
>>>> already and will adding APU5 / APU6 support make those ACPI exposed devices go away ?
>>>>
>>>> If yes then what is the advantage of using the APU driver over the ACPI exported functionality?
>>>
>>> Other than ACPI being less than reliable in a lot of cases?
>> ACPI can sometimes be unreliable, but that is just down to it being badly implemented by
>> board vendors.
>>
>> If used correctly it is no more or less reliable as any other code, so its reliability is not
>> really a good argument not to use it unless the ACPI code on PCEngines devices is known to
>> be unreliable ?
> 
> 
> So at least with the few firmware's I have tried, the ACPI works ok on APU.
> 
> The history (without full details) is something like:
> 
> - A long way back in time, we had either a different driver in the kernel, or the ACPI used a
> different name for the LEDs and button. I forget the details without looking back at some notes
> 
> - As of $lots_of_years_ago, there was a big APU firmware change and since then I believe ACPI has
> (reliably) offered auto configuration for the LEDs and I believe also for the switch button (sorry,
> hazy now without checking a real board, but I can do that no problem)
> 
> - However, I believe Enrico built the original APU kernel driver and that happened to use the old
> names, and then once the ACPI change happened, he feels/felt strongly that we should maintain the
> current driver, disable the ACPI and ignore the updated naming convention from the ACPI.
> 
> - In any case, using only ACPI doesn't setup the GPIOs for things like the SIM swap chip and reset
> lines, etc. So I think a platform driver of some sort is the correct way forward
> 
> - I think my patch from a year or so back attempted to swap the kernel names to match ACPI (need to
> double check that?). This was not unreasonably resisted because it would break userspace relying on
> the names used by the LED driver.
> 
> 
> - The other change I tried to insert was to rename the GPIOs, more explanation (some repetition from
> prev email):
> 
> - All boards, except APU5 have the same basic shape and 3x mpcie connectors.
> 
> - However, although the connectors are the same, they don;t all have the same things wired to them
> 
> - You actually have 2x USB (with up to 2x SIM), 2x pcie, 1x msata
> 
> - So based on studying APU1 and APU2, which had a separate msata and the other 2 ports wired up
> consistently for wifi/LTE, people named the GPIOs to match the mPCIe port numbers, ie LTE Modem 1
> was on mPCIe port 1, so name the gpio something like mpcie1_reset
> 
> - Then came APU3-7... These boards flipped around where modem2 was. So you now have a situation
> where userspace needs to know that they should toggle pmcie2_reset on APU3 and mpcie3_reset on APU4,
> or whatever it really is.
> 
> - So my previous attempt to sneak in a change was to rename the GPIOs to be something more like
> "modem1_reset" and "modem2_reset" etc. This way the GPIO names stay identical across ALL boards,
> even though the slots might jump around board to board. This is clearly a better solution if we were
> starting fresh, but it has consequences for a (very?) small number of users (I doubt many others are
> even aware of the other GPIOs except for the LEDs/switch? Does even OpenWRT break out the sim_swap
> lines and modem reset lines?)
> 
> 
> 
>>> If people wanted to use ACPI instead of the APU driver, why not just build their kernels without the APU driver linked in?
>> Most people do no want to / don't have the skills to build their own kernel, so they are
>> going to be relying on a distro (including openwrt as a sort of distro) provided kernel.
> 
> 
> Well, also you don't fix the problem long term. There is this jump in naming if you pick one over
> the other. Plus ACPI doesn't setup the sim swap line (and it may not setup the switch as people want
> it? Can't recall if this is a problem?)
> 
> So whilst I agree, I think it would be desirable to narrow down the number of permutations here

I agree on trying to keep the number of permutations as low as possible.

>>>>> Note, there is a very big risk that I missed the point... Please be gentle. Quite possibly there is
>>>>> a solution to just reorder some definitions and we land where we want to be? Is it that simple?
>>>> Yes my original compatibility remark was just about reordering some definitions +
>>>> keeping the old labels for the already supported APU models.
>>>>
>>>> So talking in code my proposal is to change this (in the new code):
>>>>
>>>> #define APU2_GPIO_LINE_LED1 0
>>>> #define APU2_GPIO_LINE_LED2 1
>>>> #define APU2_GPIO_LINE_LED3 2
>>>> #define APU2_GPIO_LINE_MODESW 3
>>>> #define APU2_GPIO_LINE_RESETM1 4
>>>> #define APU2_GPIO_LINE_RESETM2 5
>>>> #define APU2_GPIO_LINE_SIMSWAP 6
>>>>
>>>> to:
>>>>
>>>> #define APU2_GPIO_LINE_LED1 0
>>>> #define APU2_GPIO_LINE_LED2 1
>>>> #define APU2_GPIO_LINE_LED3 2
>>>> #define APU2_GPIO_LINE_MODESW 3
>>>> #define APU2_GPIO_LINE_SIMSWAP 4
>>>> #define APU2_GPIO_LINE_RESETM1 5
>>>> #define APU2_GPIO_LINE_RESETM2 6
>>>>
>>>> Keeping the simswap signal as GPIO/pin number 4 instead of moving it
>>>> to the end.
>>>>
>>>> And also instead of making changes to apu2_gpio_names[] (1)
>>>> introduce a new apu5_gpio_names[] / apu6_gpio_names[] so that
>>>> the labels don't change on the existing supported models.
>>>>
>>>> I'm less worried about the label change then about the index
>>>> change, because typical GPIO use from userspace will use
>>>> indexes not labels. So if having different labels on
>>>> different APU versions is a big problem you might be able to
>>>> convince me to change the labels on the old models too.
> 
> 
> OK, so I think we see a potential solution here
> 
> 
> Note, board summary is:
> 
> APU2-4 - vaguely the same, but modem2 jumps around slots (or disappears)
> 
> APU5 - oddball, gains an extra modem, so we now have modem1-3 GPIOs. All other GPIOs are maintained
> (I think?).
> 
> APU6-7 - variants of APU2-4, I believe all the GPIOs stay identical?
> 
> Details:
> 
>     http://pcengines.github.io/apu2-documentation/APU_mPCIe_capabilities/
> 
>     http://pcengines.github.io/apu2-documentation/gpios/
> 
>     However, note that the APU5 has 3x SIM swaps, one for each modem (each modem has 2x SIMs). APU4
> on the other hand only has a single one, it just inverts how the 2x SIMs connect to the 2x modems
> 
> 
> Important Note: Realise that at this point this discussion is heavily theoretical because many
> boards don't have the reset wires setup correctly, or their functionality might vary board release
> to board release. eg I paid PCEngines to have mine re-enabled, because they ship them disabled by
> default. Also in my testing they don't operate as expected. So it's highly unlikely there is a
> single user in the world actually using functionality other than "Leds", "mode switch", and "sim
> swap" (and even sim swap GPIO is likely to be restricted number of users). Certainly if anyone is
> using any of that other functionality they they are super hacker and will cope with what comes next
> 
> 
> Conclusion: Hans, would you mind commenting on if you think this is then all done and satisfactory
> if we reorder the GPIOs as you propose? ie you are content with the rename?

As mentioned before I can live with the rename (very small chance of this causing
userspace problems) as long as the pin order stays the same. Most userspace GPIO
APIs work with pin-numbers and changing the order is guaranteed to break that.

>>> I've been thinking about this the last few days, and the APU's are all low-power, headless (no video), SBC's.  They're designed for embedded usage.  That is, they don't have generic distros like Ubuntu (et al) installed on them, so the kernel and the bundled applications are all released together, typically in an monolithic image (at least that's the case for OpenWRT).
>>>
>>> Changing the kernel and what's visible in user-space typically isn't a problem as long as both happen at the same time.  That's what we've done with OpenWRT, adding the 2 new board models, and the mapping of led triggers to GPIO lines.
>> For the upstream / mainline kernel we have a very clear defined policy of
>> never breaking userspace (APIs). Even though these are designed for embedded
>> usage, some people might be running normal distro-s on these.
> 
> 
> So we don't lose sight of the big picture, I think the remaining detail we are debating is something
> like:
> 
> - kernel driver names the LEDs something like:
> 
> /sys/class/leds/apu4:green:led1
> /sys/class/leds/apu4:green:led2
> /sys/class/leds/apu4:green:led3
> 
> - However, ACPI gives different names (I forget the details)

It would be good to know the ACPI names. Also what happens with the ACPI
registered LED devices when the pcengines-apu driver loads, does it
somehow unregister those ?

If yes: Can we then make the pcengines-apu driver use the exact same names for the LEDs on new models ?
If no:  Then I guess that the ACPI registered LEDs keep working in parallel to the new LED devices ?

If the ACPI LEDs are not unregistered and keep working, then I guess there is no userspace
API breakage when using pcengines-apu on newer APU models, "just" duplicate LED devices ?
 
> - Additionally, we already broke this in the (distant) past because there was a previous APU driver
> which used different names still...

Just because we have gotten away with it once, does not mean we should do it again :)

> So I think my rejected change tried to simplify the LED names and drop the apuN bit. However, I'm
> really not passionate about any changes here. I have a simple wrapper script for the old Alix and
> newer APUs which just lets me set any LEDs by number. OpenWRT is welcome to use this?
> 
>     https://github.com/nippynetworks/gpio-utils
> 
> 
> 
>>>> Summarizing:
>>>>
>>>> Please change:
>>>>
>>>> 1. The GPIO indexing to keep simswap at its old place
>>>> 2. Use the labels only on new models (open for discussion).
>>>>
>>>> Open questions:
>>>> 1. Can you elaborate a bit about the ACPI way of accessing these
>>>> things. If that is actually a thing, we cannot just break it
>>>> (but we could use a module-parameter for still breaking it).
>>>
>>> What would this look like?  Would it be a boolean that throws the switch from "classic/legacy" to "updated" mapping?  I think that could work...  Since in OpenWRT we control both the drivers, the Kconfig settings, and the default GRUB parameters, that would work in our case.  I can't speak for pfSense, etc.
>> Yes a boolean module parameter with the default value of the boolean
>> configurable through Kconfig, so that e.g. openwrt can just pick
>> default values matching what it wants and won't need to specify
>> anything on the kernel commandline.
>>
>> Note this is not just about the mapping though. From what I understand
>> about this, using the pcengines-apu driver conflicts with the ACPI way
>> of accessing the LEDs and gpios.
>>
>> So for the new APU models, there should be a module-option to decide
>> whether for probe() to continue at all on those models or whether
>> it should just return -ENODEV (so the driver won't bind), leaving
>> things just as they were before this changes.  The purpose of this
>> is to keep the ACPI way of accessing the LEDs, ..., working.
> 
> 
> So keeping this on topic.
> 
> 1) Have we all agreed and signed off on the GPIO changes to naming, caveat we maintain the current
> numbering? If so then lets tick that off

Yes that is ok, ack.

> 2) There is a debate about whether to change the LED userspace naming. I don't really want to push
> this up the hill though? Proposal is to either sync with ACPI and offer a back compatible flag, or
> we could just keep the naming as is and allow it to continue to deviate from the ACPI naming? I'm
> cool with either? (although I don't like the current naming...)

For the new models I'm fine with whatever LED naming is preferred.

For the old already supported models changing the LED naming would require a default-off
module-parameter, which IMHO is probably not worth it.

For the new models my main worry is what happens to users of the ACPI exposed LED devices
(under /sys/class/leds/)  once the pcengines-apu driver starts binding/loading on the new models ?

> Quick show of hands from openwrt on point 2? If no one cares enough to update the patch to add a
> backward compatible flag then I suggest we stop that piece? (However, I'm happy to do this if I can
> get a little support on coding it?)
> 
> 
> Sounds like we have made progress?
> 
> Philip, are you cool to resubmit your patch with the adjusted GPIO ordering? (and APU7 detection as
> an APU3) We just then need to decide whether to drop LED renaming?

Regards,

Hans


