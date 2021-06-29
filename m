Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E6EC11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6A5F61DC8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhF2KLq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:11:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42411 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbhF2KLk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 06:11:40 -0400
Received: from [192.168.1.155] ([95.114.16.105]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N6LMN-1l9bF72R2X-016cVm; Tue, 29 Jun 2021 12:09:00 +0200
Subject: Re: [PATCH V2 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shravan S <s.shravan@intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210510074016.31627-1-s.shravan@intel.com>
 <20210510074016.31627-2-s.shravan@intel.com>
 <CAHp75Ve_=mv5MbLvqxGwu8GAuxAjBLpRHE9KNua-yvmzUNKuKw@mail.gmail.com>
 <79bd7236-dec1-ffde-8c23-3a500e04eedd@redhat.com>
 <f9e0a2b8-6e30-0b85-34d0-16a101da4686@metux.net>
 <5bcc0591-8b9c-b7c4-cbcd-7b209c4c1b69@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <6b82c38b-0b75-a1dc-d767-4c40c29a9628@metux.net>
Date:   Tue, 29 Jun 2021 12:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5bcc0591-8b9c-b7c4-cbcd-7b209c4c1b69@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RGmAx3I/rB8aWyV8NzK76F2Dy20vnyBiItjfc0r3vVJY5bIhOcU
 yTTIothGcu0NojFRcG65VRQ5w44FevDEZmTMdvbrTqJJXoy5obybfGTHvUk1rySvnghoYoi
 X7QhF17/gf2hI82Odley1gArIa4R+y5w/z5sCsa2972sYL9MlzBlTyW4LRSYNTU0xyiWnI1
 0RHZKi+d70ieGBEE6N1rQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2W/o8J5i6Qo=:bPxf+lBp34Wr5tpxUvAVRU
 MXwzEMR1B8eugclqwKQyd3kFjkUj0oL8GkDVs+2Ao53TukDmI4cFk24Lr9SRCVpVkWWs0Y68T
 zY3Viy4sEXo/NtCW0Mpq+1wX1jxXgHrQ36y1pvrvoEgXIW2WPs6vcD7YTmds+ZDHhXGWg98j0
 ux+hHzZDQOqImuBSPF3EeRBpZ0ya+GfQ5Fman7TL/gV6KcaJ7ZhfvJN/4XI/z80Xn9rWnGCl5
 WVu5vmlcQT6RmYmxqyAhDWBrdsUNBuXD6PTzNNEZx64w72ACtk8Np83hLt2GiIKDE8uJqgTex
 ab7IuF2xdu4Z1cHeK1KMIqBFPQEWWeBhLl7u7rkID1h5sWFLkm4c7mR1htZbWhkYZV2ODjKwO
 ZfdmKGJzhyRaCG0KehUhcqaj47PWNyL5FFuBgeV7sayHu0JCScOixBlR5ctSk1RDKvzEOxyG2
 Vza/ItaAvZw7jhV0Gsp8OL3kZ1fq0hse8EJX4xwph30e4UZJZoAhLHlxN1TE4jeTEGcA7n9cN
 5KlTjSlhU2qlGCGlfNHxDs=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 28.06.21 20:20, Hans de Goede wrote:

>> Why not ? Lets collect the actual requirements and talk about some
>> viable solutions (I've already got a few ideas ...)
> 
> Because we don't know the actual requirements yet. This is a very
> young technology and still evolving fast. 

Well, with some background in HF engineering, it's not so hard guessing
in which direction it goes. Of course, there're lots of tiny details,
but I don't think they have huge impact on how such subsys could look
like.

Let's recap, what this is actually for: we wanna limit the RF power for
other reasons than just the regulatory ones - in this case biological
compatibility. There can be other reasons like EM interference or
explosion detection. Indeed we already have these in embedded world,
we just didn't invent a generic control mechanism for that.

In the case of bioprotection of these tablets, the decision is *usually*
made by whether a human being is currently holding it. In this
particular case this seems to be done by certain sensors. But there can
be other scenarios, where it always needs to be active, eg. in an ER.

Question A: where exactly do we have to cap the power ? (which RF)
This depends on the actual board (antenna configuration, wires, etc) and
possibly environmental parameters. (think of external antennas, possibly
with extra amps). In general we need a clean association to the actual
devices to be tuned. For out-of-the-box devices there should be a sane
preset from the vendor, but at some point some operator might tune it.

Question B: what are the exact RF power limits to apply ?
This depends on a lot of factors and needs actual lab measurements.
Certainly, it's the duty of the vendor to do these measurements and
provide scientific data. He should also provide sane defaults, but
operator needs to be able to tune this. External antenna with higher
gain is the most obvious case.

Question C: when to apply which "operation mode" (IOW: which set of
limits to apply right now ? This depends on various factors, depending
on the actual use case. One parameter could be whether some user's
holding the device, but there could be others like are we in a specific
building or room.

While distilling this out, we see that:

a) it hasn't much to do with some specific RF module or even some
    specific vendor. therefore designing something that's just for
    the currently discussed Intel Modems, it's conceptionally wrong
    (even though I appreciate that Intel is sponsoring that kind of
    work)

b) the human-user detection is an entirely different field, just like
    ambient or g-sensors. we should split off that topic and look for
    a proper place to do that (does that even need kernel support ?)

Requirements:

1. the solution needs to provide means for capping RF power on certain
    RF devices depending on configurable tables, that can be tuned by
    by operator / system integrator
2. the solution needs to support several "operation modes" that can be
    selected by configurable factors, e.g. whether human is nearby,
    device location, time of day, etc.
3. the vendor shall supply sane defaults (based on actual lab
    measurements) for specific hardware for common scenarios

As things are right now, I don't see that the need to touch the kernel
at all. The most interesting question here is how to get the vendor's
presets. But even if he puts them into acpi tables, we can read them
out from userland by now.

IMHO, the best approach for that would be just collecting the data in
some central place, one package that other tools can just use. We have
similar approach for things like firmware or microcode. Actually, we
already have something similar with tzdata, and we don't let the kernel
try to fetch tz data from all the various authorities.

In summary, I don't see that we have to do anything on kernel side
right now. It's entirely up to userland.

> Also whether we like it
> or not, we don't get to dictate what the involved firmware and
> hardware interfaces get to look like. So any API which we come
> up with must be capable of working with the existing fw and
> hw interfaces as shipped in actual devices.

No, we don't. But we don't need to support all the most weird stuff.
We don't do special hacks for Nvidia's or NI's proprietary crap,
do we ?

What we certainly can do is ignore and blame.

As said, the only new thing that comes in here is extracting the vendors
presets from acpi (if we don't have any better data source). We don't
need any extra kernel support for that.

What Intel can do in this case:
* drop the whole idea of special kernel drivers
* drop the idea of proprietary acpi stuff
* work closely with the board vendors on a public database for the
   sane presets in certain use cases (that I called "operation modes")

> <sigh> we are in no place to make demands here "standard" (non
> chrome-os / android) Linux laptop-os usage is a tiny fraction of the
> market. 

Where did you get this data from ? It might be correct that only few
vendors offer their notebooks specifically for Linux, but that tells
nothing about the actual user numbers. In recent years, the percentage
of Windows users (especialyl on laptops) of my non-tech frieds is
rapidly decreasing - not representative, but shows a strong direction.

But at the beginning of the discussion, especially Chromebooks have been
mentioned as some primary platform (at least for now) - these indeed are
specifically made for Linux. The most likely next category in line are
android smartphones - again Linux. (BTW is there any that runs acpi ?).
And it seems the most push right now coming from Intel, Shravan et al.
He's one of us, Linux kernel folks. So I'm very confident in claming
that we actually do have a great deal of influence on that front now.

> So new features like this are primarily developed on other OS-es
> and typically we either take the firmware interfaces as is, or we don't
> support the feature.

I wouldn't underline that. This particular topic (more precisely some
superset of it) indeed has been implemented on Linux-based embedded
devices long ago. Yet device specific, not standardized. And entirely
in userspace. Nothing that the Kernel community ever needed to care
about.

> You seem to believe in an utopia where we fully control all the layers
> and can design and implement everything to be just perfect, but the
> reality is quite different from this.

In embedded world, we actually are to a very large extent. (at least on
software and custom hardware).

> You also seem to forget that perfect is the enemy of good. This case is
> an excellent example of a case where we cannot design anything close to
> the "perfect" API in one go because we don't have the necessary
> problem-domain information / experience yet.

As mentioned above, we don't need to do that at all. At least for the
kernel. The only thing we *should* do (but that's not a kernel topic) is
finding a common mechanism to retrieve and collect the preset data from
the board vendors. Everything's userland only.

--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
