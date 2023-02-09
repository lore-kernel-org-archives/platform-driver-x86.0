Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F00C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Feb 2023 06:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjBIGFJ convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Feb 2023 01:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjBIGFJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2023 01:05:09 -0500
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [24.116.100.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19413E0AB
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Feb 2023 22:05:03 -0800 (PST)
Received: from smtpclient.apple (macbook3-2.redfish-solutions.com [192.168.8.12])
        (authenticated bits=0)
        by mail.redfish-solutions.com (8.17.1/8.16.1) with ESMTPSA id 31964Ehp994332
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 8 Feb 2023 23:04:14 -0700
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
From:   Philip Prindeville <philipp@redfish-solutions.com>
In-Reply-To: <3fffc76d-4e1b-4eef-3d9f-6d61cecacb46@redhat.com>
Date:   Wed, 8 Feb 2023 23:04:01 -0700
Cc:     Ed W <lists@wildgooses.com>, platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
Content-Transfer-Encoding: 8BIT
Message-Id: <5F93DF5F-BEC4-4B2A-A057-A895282A66B2@redfish-solutions.com>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <cb93fd68-5195-0d5e-cd40-5eba61df4c38@wildgooses.com>
 <3fffc76d-4e1b-4eef-3d9f-6d61cecacb46@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Scanned-By: MIMEDefang 3.2 on 192.168.8.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ed and Hans,

First off, sorry for taking a while to get back.  My wife has been busy with final exams at uni and I've been having to take care of the kids for both of us.



> On Feb 2, 2023, at 4:14 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> Hi Ed,
> 
> On 1/20/23 20:18, Ed W wrote:
>> On 19/01/2023 10:22, Hans de Goede wrote:
>> 
>>>> /* Order in which the GPIO lines are defined in the register list */
>>>> #define APU2_GPIO_LINE_LED1 0
>>>> #define APU2_GPIO_LINE_LED2 1
>>>> #define APU2_GPIO_LINE_LED3 2
>>>> #define APU2_GPIO_LINE_MODESW 3
>>>> -#define APU2_GPIO_LINE_SIMSWAP 4
>>>> -#define APU2_GPIO_LINE_MPCIE2 5
>>>> -#define APU2_GPIO_LINE_MPCIE3 6
>>>> +#define APU2_GPIO_LINE_RESETM1 4
>>>> +#define APU2_GPIO_LINE_RESETM2 5
>>>> +#define APU2_GPIO_LINE_SIMSWAP 6
>>> I don't think this changing of GPIO ordering, or
>>> for that part the changing of the gpio_names from 
>>> "mpcie2_reset" to "modem1-reset" is a good idea.
>>> 
>>> I'm not entirely sure how these GPIOs are supposed to be
>>> consumed / used by userspace. But since they are not used
>>> directly in this driver I assume userspace is supposed to
>>> use either the (deprecated) sysfs GPIO API or the new ioctl
>>> based GPIO API to toggle say "simswap" if it needs to.
>>> 
>>> The old sysfs API exclusively uses pin-indexes inside a GPIO
>>> chip to select the pin, so by changing the pin order you
>>> have just broken the userspace API.
>>> 
>>> And the new ioctl API can use either pin-indexes or GPIO-line-names,
>>> so by changing the names you have also just potentially broken
>>> that.
>>> 
>>> Please keep the order as is and only use the new names for
>>> the newly added models (so for APU6 I believe).
>> 
>> 
>> Hi, I'm not sure what the "correct" thing to do is, but just to add some background to the situation:
>> 
>> There are an increasing number of APU boards, which are *very* similar, and also through time the
>> pin allocations have muddled around, plus most recently, the BIOS can configure many things and has
>> started to use naming conventions different to the historic kernel naming
>> 
>> So I don't have a board in front of me to be definitive, but something like the following happened:
>> 
>> - APU2 used something like mpcie sockets 1&2 for USB stuff and hence LTE cards, socket 3 was msata
>> 
>> - Then another version APU3, I think moved these to sockets 2&3
>> 
>> - Then another version APU4, moved the USB to sockets 2&3 and wired up a second SIM slot in most
>> versions, including a SIM line swapper chip. Now you start to wonder if you should have labelled
>> things PCIE1, PCIE2, PCIE3, etc, when really they mean modem 1 and modem 2, etc?
>> 
>> - Then came APU5, which has 3x USB sockets, plus 3x mpcie sockets. These are wired to different pcie
>> numbers, and so the naming modem1, modem2, modem3 starts to make a lot more sense.
>> 
>> - APU6, which is mentioned in the original patch, is really just the same as one of the other
>> boards, but with different ethernet sockets (SFP vs copper)


Yes, eth0 on the APU6 is an i210 w/ SFP cage, and i211 on all of the other ports.  The APU4 and others all used i211's on all the ports (for 1000baseTX).

I've asked PC Engines for a definitive list of what GPIO lines are used for what on all of the current revs of the boards.  I'll share that as soon as I get it.



>> 
>> - There is also a rare feature, which is likely not known to most users, or even wired up correctly
>> on many boards. You have a reset/enable line to some of the mpcie slots. This again makes more sense
>> to label logically vs than per slot. It's really not clear that this feature is properly supported
>> or functioning on all boards (you can order special order boards wired in various ways). So changes
>> here are unlikely to be noticed by all but a handful of specialist users.
>> 
>> 
>> Overall, if one could start again, the unifying feature would be label slots logically, ie modem1,
>> modem2, wifi1, wifi2, rather than numbering them based on how they are wired on a specific board rev.
> 
> 
> "this" below starts here:
> 
>> Additionally, users who didn't load the APU driver, likely had ACPI named devices and these all have
>> different (and to my eye, more logical names). So whatever we decide to do here will cause some
>> breakage and inconsistency...
> 
> Hmm, can you elaborate a bit on this?  Does ACPI somehow expose the LEDs / GPIO to userspace
> already and will adding APU5 / APU6 support make those ACPI exposed devices go away ?
> 
> If yes then what is the advantage of using the APU driver over the ACPI exported functionality?


Other than ACPI being less than reliable in a lot of cases?


> 
> Sorry for being a bit pedantic about this patch, but as a maintainer it is my responsibility
> to ensure that we don't break existing userspace, e.g. existing use-cases using the exposed
> ACPI devices.
> 
> Note "fixing" this might be as simple as putting the new APU5 / APU6 support behind an extra Kconfig
> option (behind a modparam actually with a Kconfig option to select the default of the modparam).
> 
> This way we can get distro's to opt-in to (or opt-out depending on the default) the new behavior,
> needing a modparam + Kconfig option for this is not ideal, but if there is a significant behavior
> change it is an escape hatch we can use.
> 
>> Note that I submitted this previous patch "years ago", and I've somewhat given up on ever getting
>> the APU driver up to date.. I think in 2020, Enrico shot me down because he was working on some
>> grand unification for modem GPIO handling? (Enrico, please correct me on the details?) Hans, I think
>> if you search back to 2020 on "APU", you will see that you arbitrated in that thread?
> 
> Yes I vaguely remember back then I was hoping / expecting you and Enrico to sort things
> out, but that seems to have not happened. And given Enrico's silence in this thread
> I'm not sure if Enrico is still working on this. So I guess now I get to figure out how
> to move forward here.
> 
>> For whatever
>> reason, we seem to be stuck that there are competing voices blocking progress here. Every route
>> leads to some level of incompatibility. Personally I am a fairly large consumer of these devices,
>> but I really don't care what we decide, because we ship a custom software, where userspace will
>> match kernel, so we will update both in lockstep, whatever happens. Changes aren't a problem for me
>> personally.
>> 
>> My vote would be for a one-of breakage, to at least get everyone using the same
>> terms/names/whatever. I would suspect OpenWRT is probably the biggest voice here, so suggest we go
>> with whatever they suggest, and then at least we are all in sync for the future? If its a one off,
>> then suggest taking into account the ACPI naming as well?
> 
> I agree that we need to find a way forward here. I would like to get this resolved
> and to get something merged into the mainline kernel for this.
> 
> I also agree that if there is breakage it would be best to just break things only once.
> 
> If there is going to breakage though I think we need some toggle to toggle between
> the old and new *mainline* kernel behavior. This could be as easy as making the modparam
> for this just abort probe() (return -ENODEV) on the new APU models when it is set to its
> "backward compat" value.


If people wanted to use ACPI instead of the APU driver, why not just build their kernels without the APU driver linked in?


> 
>> Note, there is a very big risk that I missed the point... Please be gentle. Quite possibly there is
>> a solution to just reorder some definitions and we land where we want to be? Is it that simple?
> 
> Yes my original compatibility remark was just about reordering some definitions +
> keeping the old labels for the already supported APU models.
> 
> So talking in code my proposal is to change this (in the new code):
> 
> #define APU2_GPIO_LINE_LED1 0
> #define APU2_GPIO_LINE_LED2 1
> #define APU2_GPIO_LINE_LED3 2
> #define APU2_GPIO_LINE_MODESW 3
> #define APU2_GPIO_LINE_RESETM1 4
> #define APU2_GPIO_LINE_RESETM2 5
> #define APU2_GPIO_LINE_SIMSWAP 6
> 
> to:
> 
> #define APU2_GPIO_LINE_LED1 0
> #define APU2_GPIO_LINE_LED2 1
> #define APU2_GPIO_LINE_LED3 2
> #define APU2_GPIO_LINE_MODESW 3
> #define APU2_GPIO_LINE_SIMSWAP 4
> #define APU2_GPIO_LINE_RESETM1 5
> #define APU2_GPIO_LINE_RESETM2 6
> 
> Keeping the simswap signal as GPIO/pin number 4 instead of moving it
> to the end.
> 
> And also instead of making changes to apu2_gpio_names[] (1)
> introduce a new apu5_gpio_names[] / apu6_gpio_names[] so that
> the labels don't change on the existing supported models.
> 
> I'm less worried about the label change then about the index
> change, because typical GPIO use from userspace will use
> indexes not labels. So if having different labels on
> different APU versions is a big problem you might be able to
> convince me to change the labels on the old models too.


I've been thinking about this the last few days, and the APU's are all low-power, headless (no video), SBC's.  They're designed for embedded usage.  That is, they don't have generic distros like Ubuntu (et al) installed on them, so the kernel and the bundled applications are all released together, typically in an monolithic image (at least that's the case for OpenWRT).

Changing the kernel and what's visible in user-space typically isn't a problem as long as both happen at the same time.  That's what we've done with OpenWRT, adding the 2 new board models, and the mapping of led triggers to GPIO lines.


> 
> Summarizing:
> 
> Please change:
> 
> 1. The GPIO indexing to keep simswap at its old place
> 2. Use the labels only on new models (open for discussion).
> 
> Open questions:
> 1. Can you elaborate a bit about the ACPI way of accessing these
> things. If that is actually a thing, we cannot just break it
> (but we could use a module-parameter for still breaking it).


What would this look like?  Would it be a boolean that throws the switch from "classic/legacy" to "updated" mapping?  I think that could work...  Since in OpenWRT we control both the drivers, the Kconfig settings, and the default GRUB parameters, that would work in our case.  I can't speak for pfSense, etc.


> 
> 2. You mention this is important to the openwrt community are
> there already openwrt people in the Cc here so that we can get
> their input? If not can you reach out to them ?


Paul and myself are both from the OpenWRT community.

-PHilip



> 
> Regards,
> 
> Hans
> 
> 
> 
> 1) other then adjusting the initializers for the MPCIE? -> RESETM? rename
> 

