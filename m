Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FFFC636D4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 14:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjBMOFz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 09:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjBMOFz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 09:05:55 -0500
Received: from mail1.nippynetworks.com (mail1.nippynetworks.com [91.220.24.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4520E18B2F
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 06:05:49 -0800 (PST)
Received: from [192.168.8.188] (unknown [94.228.36.46])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256))
        (No client certificate requested)
        (Authenticated sender: ed@wildgooses.com)
        by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4PFmLj3V4NzTgVL;
        Mon, 13 Feb 2023 14:05:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1676297102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tjBaCl2L06b6XdLTbk+0a/BnhBVZ0EmKzAePjaIgvxY=;
        b=TaKzwEaSogs6E3WBpGVe+kWfJwqBzyOzcDUw7gnHkv1dqHQ/ZN2V36NCDlixjnoSW0S7SC
        qG6oDBDiaNGGC5saQeh5TzrHtNMh8MRmf5LVVK4T2tUGIqFkSXg28sJzqBprkxb+bNOX7T
        3uVkaoUpW9JWHceuTTbiLJBotcRMRDs=
Message-ID: <59ded4b9-04e9-d5d3-98eb-af0d4340a2fa@wildgooses.com>
Date:   Mon, 13 Feb 2023 14:05:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: en-GB
To:     Hans de Goede <hdegoede@redhat.com>,
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
From:   Ed W <lists@wildgooses.com>
In-Reply-To: <3a36b460-9108-5c83-b4f6-42b4718afcf0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All


> On 2/9/23 07:04, Philip Prindeville wrote:
>> Hi Ed and Hans,
>>
>> First off, sorry for taking a while to get back.  My wife has been bus=
y with final exams at uni and I've been having to take care of the kids f=
or both of us.
> No problem.


Ditto here. I ran out of time to build a current kernel and double check =
the ACPI status! However, I
can get the details in the next week to confirm. Apologies!



>>>> Hi, I'm not sure what the "correct" thing to do is, but just to add =
some background to the situation:
>>>>
>>>> There are an increasing number of APU boards, which are *very* simil=
ar, and also through time the
>>>> pin allocations have muddled around, plus most recently, the BIOS ca=
n configure many things and has
>>>> started to use naming conventions different to the historic kernel n=
aming
>>>>
>>>> So I don't have a board in front of me to be definitive, but somethi=
ng like the following happened:
>>>>
>>>> - APU2 used something like mpcie sockets 1&2 for USB stuff and hence=
 LTE cards, socket 3 was msata
>>>>
>>>> - Then another version APU3, I think moved these to sockets 2&3
>>>>
>>>> - Then another version APU4, moved the USB to sockets 2&3 and wired =
up a second SIM slot in most
>>>> versions, including a SIM line swapper chip. Now you start to wonder=
 if you should have labelled
>>>> things PCIE1, PCIE2, PCIE3, etc, when really they mean modem 1 and m=
odem 2, etc?
>>>>
>>>> - Then came APU5, which has 3x USB sockets, plus 3x mpcie sockets. T=
hese are wired to different pcie
>>>> numbers, and so the naming modem1, modem2, modem3 starts to make a l=
ot more sense.
>>>>
>>>> - APU6, which is mentioned in the original patch, is really just the=
 same as one of the other
>>>> boards, but with different ethernet sockets (SFP vs copper)
>>
>> Yes, eth0 on the APU6 is an i210 w/ SFP cage, and i211 on all of the o=
ther ports.  The APU4 and others all used i211's on all the ports (for 10=
00baseTX).
>>
>> I've asked PC Engines for a definitive list of what GPIO lines are use=
d for what on all of the current revs of the boards.  I'll share that as =
soon as I get it.


Minor nitpick.=C2=A0 The APU2 has i210 on the original boards. However, r=
ecently the shortage of intel
chipsets has led to various compromise options and some boards are coming=
 with i211 on. I'm not sure
if Pascal will standardise on these for the future though?

There is also an APU7 mentioned in the latest firmware notes. I don't own=
 one of these, nor the
schematics, but the release notes say that it's an APU3 with different et=
hernet ports. I suggest we
assume this to be true and add APU7 to our detection?



>>> Hmm, can you elaborate a bit on this?  Does ACPI somehow expose the L=
EDs / GPIO to userspace
>>> already and will adding APU5 / APU6 support make those ACPI exposed d=
evices go away ?
>>>
>>> If yes then what is the advantage of using the APU driver over the AC=
PI exported functionality?
>>
>> Other than ACPI being less than reliable in a lot of cases?
> ACPI can sometimes be unreliable, but that is just down to it being bad=
ly implemented by
> board vendors.
>
> If used correctly it is no more or less reliable as any other code, so =
its reliability is not
> really a good argument not to use it unless the ACPI code on PCEngines =
devices is known to
> be unreliable ?


So at least with the few firmware's I have tried, the ACPI works ok on AP=
U.

The history (without full details) is something like:

- A long way back in time, we had either a different driver in the kernel=
, or the ACPI used a
different name for the LEDs and button. I forget the details without look=
ing back at some notes

- As of $lots_of_years_ago, there was a big APU firmware change and since=
 then I believe ACPI has
(reliably) offered auto configuration for the LEDs and I believe also for=
 the switch button (sorry,
hazy now without checking a real board, but I can do that no problem)

- However, I believe Enrico built the original APU kernel driver and that=
 happened to use the old
names, and then once the ACPI change happened, he feels/felt strongly tha=
t we should maintain the
current driver, disable the ACPI and ignore the updated naming convention=
 from the ACPI.

- In any case, using only ACPI doesn't setup the GPIOs for things like th=
e SIM swap chip and reset
lines, etc. So I think a platform driver of some sort is the correct way =
forward

- I think my patch from a year or so back attempted to swap the kernel na=
mes to match ACPI (need to
double check that?). This was not unreasonably resisted because it would =
break userspace relying on
the names used by the LED driver.


- The other change I tried to insert was to rename the GPIOs, more explan=
ation (some repetition from
prev email):

- All boards, except APU5 have the same basic shape and 3x mpcie connecto=
rs.

- However, although the connectors are the same, they don;t all have the =
same things wired to them

- You actually have 2x USB (with up to 2x SIM), 2x pcie, 1x msata

- So based on studying APU1 and APU2, which had a separate msata and the =
other 2 ports wired up
consistently for wifi/LTE, people named the GPIOs to match the mPCIe port=
 numbers, ie LTE Modem 1
was on mPCIe port 1, so name the gpio something like mpcie1_reset

- Then came APU3-7... These boards flipped around where modem2 was. So yo=
u now have a situation
where userspace needs to know that they should toggle pmcie2_reset on APU=
3 and mpcie3_reset on APU4,
or whatever it really is.

- So my previous attempt to sneak in a change was to rename the GPIOs to =
be something more like
"modem1_reset" and "modem2_reset" etc. This way the GPIO names stay ident=
ical across ALL boards,
even though the slots might jump around board to board. This is clearly a=
 better solution if we were
starting fresh, but it has consequences for a (very?) small number of use=
rs (I doubt many others are
even aware of the other GPIOs except for the LEDs/switch? Does even OpenW=
RT break out the sim_swap
lines and modem reset lines?)



>> If people wanted to use ACPI instead of the APU driver, why not just b=
uild their kernels without the APU driver linked in?
> Most people do no want to / don't have the skills to build their own ke=
rnel, so they are
> going to be relying on a distro (including openwrt as a sort of distro)=
 provided kernel.


Well, also you don't fix the problem long term. There is this jump in nam=
ing if you pick one over
the other. Plus ACPI doesn't setup the sim swap line (and it may not setu=
p the switch as people want
it? Can't recall if this is a problem?)

So whilst I agree, I think it would be desirable to narrow down the numbe=
r of permutations here



>>>> Note, there is a very big risk that I missed the point... Please be =
gentle. Quite possibly there is
>>>> a solution to just reorder some definitions and we land where we wan=
t to be? Is it that simple?
>>> Yes my original compatibility remark was just about reordering some d=
efinitions +
>>> keeping the old labels for the already supported APU models.
>>>
>>> So talking in code my proposal is to change this (in the new code):
>>>
>>> #define APU2_GPIO_LINE_LED1 0
>>> #define APU2_GPIO_LINE_LED2 1
>>> #define APU2_GPIO_LINE_LED3 2
>>> #define APU2_GPIO_LINE_MODESW 3
>>> #define APU2_GPIO_LINE_RESETM1 4
>>> #define APU2_GPIO_LINE_RESETM2 5
>>> #define APU2_GPIO_LINE_SIMSWAP 6
>>>
>>> to:
>>>
>>> #define APU2_GPIO_LINE_LED1 0
>>> #define APU2_GPIO_LINE_LED2 1
>>> #define APU2_GPIO_LINE_LED3 2
>>> #define APU2_GPIO_LINE_MODESW 3
>>> #define APU2_GPIO_LINE_SIMSWAP 4
>>> #define APU2_GPIO_LINE_RESETM1 5
>>> #define APU2_GPIO_LINE_RESETM2 6
>>>
>>> Keeping the simswap signal as GPIO/pin number 4 instead of moving it
>>> to the end.
>>>
>>> And also instead of making changes to apu2_gpio_names[] (1)
>>> introduce a new apu5_gpio_names[] / apu6_gpio_names[] so that
>>> the labels don't change on the existing supported models.
>>>
>>> I'm less worried about the label change then about the index
>>> change, because typical GPIO use from userspace will use
>>> indexes not labels. So if having different labels on
>>> different APU versions is a big problem you might be able to
>>> convince me to change the labels on the old models too.


OK, so I think we see a potential solution here


Note, board summary is:

APU2-4 - vaguely the same, but modem2 jumps around slots (or disappears)

APU5 - oddball, gains an extra modem, so we now have modem1-3 GPIOs. All =
other GPIOs are maintained
(I think?).

APU6-7 - variants of APU2-4, I believe all the GPIOs stay identical?

Details:

=C2=A0=C2=A0=C2=A0 http://pcengines.github.io/apu2-documentation/APU_mPCI=
e_capabilities/

=C2=A0=C2=A0=C2=A0 http://pcengines.github.io/apu2-documentation/gpios/

=C2=A0=C2=A0=C2=A0 However, note that the APU5 has 3x SIM swaps, one for =
each modem (each modem has 2x SIMs). APU4
on the other hand only has a single one, it just inverts how the 2x SIMs =
connect to the 2x modems


Important Note: Realise that at this point this discussion is heavily the=
oretical because many
boards don't have the reset wires setup correctly, or their functionality=
 might vary board release
to board release. eg I paid PCEngines to have mine re-enabled, because th=
ey ship them disabled by
default. Also in my testing they don't operate as expected. So it's highl=
y unlikely there is a
single user in the world actually using functionality other than "Leds", =
"mode switch", and "sim
swap" (and even sim swap GPIO is likely to be restricted number of users)=
=2E Certainly if anyone is
using any of that other functionality they they are super hacker and will=
 cope with what comes next


Conclusion: Hans, would you mind commenting on if you think this is then =
all done and satisfactory
if we reorder the GPIOs as you propose? ie you are content with the renam=
e?


>> I've been thinking about this the last few days, and the APU's are all=
 low-power, headless (no video), SBC's.  They're designed for embedded us=
age.  That is, they don't have generic distros like Ubuntu (et al) instal=
led on them, so the kernel and the bundled applications are all released =
together, typically in an monolithic image (at least that's the case for =
OpenWRT).
>>
>> Changing the kernel and what's visible in user-space typically isn't a=
 problem as long as both happen at the same time.  That's what we've done=
 with OpenWRT, adding the 2 new board models, and the mapping of led trig=
gers to GPIO lines.
> For the upstream / mainline kernel we have a very clear defined policy =
of
> never breaking userspace (APIs). Even though these are designed for emb=
edded
> usage, some people might be running normal distro-s on these.


So we don't lose sight of the big picture, I think the remaining detail w=
e are debating is something
like:

- kernel driver names the LEDs something like:

/sys/class/leds/apu4:green:led1
/sys/class/leds/apu4:green:led2
/sys/class/leds/apu4:green:led3

- However, ACPI gives different names (I forget the details)

- Additionally, we already broke this in the (distant) past because there=
 was a previous APU driver
which used different names still...


So I think my rejected change tried to simplify the LED names and drop th=
e apuN bit. However, I'm
really not passionate about any changes here. I have a simple wrapper scr=
ipt for the old Alix and
newer APUs which just lets me set any LEDs by number. OpenWRT is welcome =
to use this?

=C2=A0=C2=A0=C2=A0 https://github.com/nippynetworks/gpio-utils



>>> Summarizing:
>>>
>>> Please change:
>>>
>>> 1. The GPIO indexing to keep simswap at its old place
>>> 2. Use the labels only on new models (open for discussion).
>>>
>>> Open questions:
>>> 1. Can you elaborate a bit about the ACPI way of accessing these
>>> things. If that is actually a thing, we cannot just break it
>>> (but we could use a module-parameter for still breaking it).
>>
>> What would this look like?  Would it be a boolean that throws the swit=
ch from "classic/legacy" to "updated" mapping?  I think that could work..=
=2E  Since in OpenWRT we control both the drivers, the Kconfig settings, =
and the default GRUB parameters, that would work in our case.  I can't sp=
eak for pfSense, etc.
> Yes a boolean module parameter with the default value of the boolean
> configurable through Kconfig, so that e.g. openwrt can just pick
> default values matching what it wants and won't need to specify
> anything on the kernel commandline.
>
> Note this is not just about the mapping though. From what I understand
> about this, using the pcengines-apu driver conflicts with the ACPI way
> of accessing the LEDs and gpios.
>
> So for the new APU models, there should be a module-option to decide
> whether for probe() to continue at all on those models or whether
> it should just return -ENODEV (so the driver won't bind), leaving
> things just as they were before this changes.  The purpose of this
> is to keep the ACPI way of accessing the LEDs, ..., working.


So keeping this on topic.

1) Have we all agreed and signed off on the GPIO changes to naming, cavea=
t we maintain the current
numbering? If so then lets tick that off

2) There is a debate about whether to change the LED userspace naming. I =
don't really want to push
this up the hill though? Proposal is to either sync with ACPI and offer a=
 back compatible flag, or
we could just keep the naming as is and allow it to continue to deviate f=
rom the ACPI naming? I'm
cool with either? (although I don't like the current naming...)

Quick show of hands from openwrt on point 2? If no one cares enough to up=
date the patch to add a
backward compatible flag then I suggest we stop that piece? (However, I'm=
 happy to do this if I can
get a little support on coding it?)


Sounds like we have made progress?

Philip, are you cool to resubmit your patch with the adjusted GPIO orderi=
ng? (and APU7 detection as
an APU3) We just then need to decide whether to drop LED renaming?

Thanks all!

Ed W

